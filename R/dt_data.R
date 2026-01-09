#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


.dt_data_key <- "_data"

dt_data_get <- function(data) {
  dt__get(data, .dt_data_key)
}

dt_data_set <- function(data, data_tbl) {
  dt__set(data, .dt_data_key, dplyr::as_tibble(data_tbl))
}

# rownames_to_column is a string; if not NA, it means the row.names(data_tbl)
# should be turned into a column with the name !!rownames_to_column
dt_data_init <- function(
    data,
    data_tbl,
    rownames_to_column = NA
) {

  # If the data table has rows but no columns, remove all of the rows
  if (ncol(data_tbl) == 0 && nrow(data_tbl) > 0) {
    data_tbl <- data_tbl[0, ]
  }

  if (!is.na(rownames_to_column)) {

    data_rownames <- rownames(data_tbl)

    if (rownames_to_column %in% colnames(data_tbl)) {

      cli::cli_abort(c(
        "Reserved column name `{rownames_to_column}` was detected in the data.",
        "*" = "Please rename this column."
      ))
    }

    data_tbl <- dplyr::mutate(data_tbl, !!sym(rownames_to_column) := data_rownames, .before = 0)
  }

  dt_data_set(data = data, data_tbl = data_tbl)
}

dt_data_add_rows <- function(
    data,
    row_data_list,
    before,
    after
) {

  data_tbl <- dt_data_get(data = data)

  # Get the `_stub_df` table
  stub_df <- dt_stub_df_get(data = data)

  # Get the next available `i` value for `rownum_i`
  if (nrow(stub_df) > 0) {
    next_i <- max(stub_df[["rownum_i"]]) + 1L
  } else {
    next_i <- 1L
  }

  # Generate a tibble from the `row_data_list`
  row_data_tbl <- dplyr::as_tibble(row_data_list)

  nrow_row_data_tbl <- nrow(row_data_tbl)
  colnames_row_data_tbl <- colnames(row_data_tbl)

  #
  # Prepend, insert, or append the new data rows (`row_data_tbl`)
  # to those existing in `data_tbl`
  #

  if (is.null(before) && is.null(after)) {

    updated_data_tbl <-
      vctrs::vec_rbind(
        data_tbl,
        row_data_tbl
      )

  } else if (!is.null(before) && is.null(after)) {

    updated_data_tbl <-
      vctrs::vec_rbind(
        data_tbl[(1:before) - 1, ],
        row_data_tbl,
        data_tbl[before:nrow(data_tbl), ]
      )

  } else if (is.null(before) && !is.null(after)) {

    if (after == nrow(data_tbl)) {

      updated_data_tbl <-
        vctrs::vec_rbind(
          data_tbl,
          row_data_tbl
        )

    } else {

      updated_data_tbl <-
        vctrs::vec_rbind(
          data_tbl[1:after, ],
          row_data_tbl,
          data_tbl[(after + 1):nrow(data_tbl), ]
        )
    }
  }

  var_stub <- dt_boxhead_get_var_stub(data = data)
  var_group <- dt_boxhead_get_vars_groups(data = data)

  row_data_tbl_has_var_stub <- var_stub %in% colnames_row_data_tbl
  row_data_tbl_has_var_group <- var_group %in% colnames_row_data_tbl

  # Create the `stub_df_add` table
  stub_df_add <-
    dplyr::tibble(
      rownum_i = seq(next_i, next_i + nrow_row_data_tbl - 1L),
      row_id = if (row_data_tbl_has_var_stub) {
        as.character(row_data_tbl[[var_stub]])
      } else {
        NA_character_
      },
      group_id = if (row_data_tbl_has_var_group) {
        as.character(row_data_tbl[[var_group]])
      } else {
        NA_character_
      },
      group_label = rep_len(list(NULL), nrow_row_data_tbl),
      indent = rep_len(NA_character_, nrow_row_data_tbl),
      built_group_label = rep_len(NA_character_, nrow_row_data_tbl)
    )

  #
  # In the above, `group_label` was set to NULL but should it get the value for
  # any groups it is a part of; so, we need to make use of a lookup table with
  # `group_id` and `group_label` and insert the correct `group_label` value
  #

  stub_df_group_lookup <-
    dplyr::distinct(stub_df, dplyr::pick("group_id", "group_label"))

  for (i in seq_len(nrow(stub_df_add))) {

    if (is.null(stub_df_add[i, ][["group_label"]][[1]])) {

      if (
        length(stub_df_group_lookup[["group_id"]]) > 0 &&
        stub_df_add[i, ][["group_id"]] %in% stub_df_group_lookup[["group_id"]]
      ) {

        # This case is where a `group_id` in the added rows already exists
        # in the gt object; in this case, we'd want the existing label to
        # be copied into the `group_label` cell of the `_stub_df` object
        stub_df_add[i, ][["group_label"]] <-
          stub_df_group_lookup[["group_label"]][
            stub_df_group_lookup[["group_id"]] == stub_df_add[i, ][["group_id"]]
          ]

      } else {

        if (!is.na(stub_df_add[i, ][["group_id"]])) {

          # Migrate the text from a new group ID to a group label
          stub_df_add[i, ][["group_label"]] <-
            as.list(stub_df_add[i, ][["group_id"]])
        }
      }
    }
  }

  #
  # Bind the `stub_df_add` table to the existing `stub_df`
  #

  # If `.before` or `.after` is provided then the binding
  # must be done in a certain order

  if (is.null(before) && is.null(after)) {

    stub_df_updated <-
      vctrs::vec_rbind(
        stub_df,
        stub_df_add
      )

  } else if (!is.null(before) && is.null(after)) {

    stub_df_updated <-
      vctrs::vec_rbind(
        stub_df[(1:before) - 1, ],
        stub_df_add,
        stub_df[before:nrow(data_tbl), ]
      )

  } else if (is.null(before) && !is.null(after)) {

    if (after == nrow(data_tbl)) {

      stub_df_updated <-
        vctrs::vec_rbind(
          stub_df,
          stub_df_add
        )

    } else {

    stub_df_updated <-
      vctrs::vec_rbind(
        stub_df[1:after, ],
        stub_df_add,
        stub_df[(after + 1):nrow(data_tbl), ]
      )
    }
  }

  # Re-index `rownum_i`
  stub_df_updated[["rownum_i"]] <- seq_len(nrow(stub_df_updated))

  data <-
    dt_stub_df_set(
      data = data,
      stub_df = stub_df_updated
    )

  data <-
    dt_data_set(
      data = data,
      data_tbl = updated_data_tbl
    )

  #
  # Update the existing row groups vector in the data object
  #

  if (!is.na(var_group)) {

    row_groups_vec <- dt_row_groups_get(data = data)

    row_groups_new <-
      base::setdiff(
        unique(updated_data_tbl[[var_group]]),
        row_groups_vec
      )

    if (length(row_groups_new) > 0) {

      updated_row_groups_vec <- unique(c(row_groups_vec, row_groups_new))

      data <-
        dt_row_groups_set(
          data = data,
          row_groups = updated_row_groups_vec
        )
    }
  }

  data
}
