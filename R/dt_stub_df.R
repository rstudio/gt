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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


.dt_stub_df_key <- "_stub_df"

dt_stub_df_get <- function(data) {
  dt__get(data, .dt_stub_df_key)
}

dt_stub_df_set <- function(data, stub_df) {
  dt__set(data, .dt_stub_df_key, stub_df)
}

dt_stub_df_init <- function(
    data,
    rowname_col,
    groupname_col,
    row_group.sep,
    process_md
) {

  data_tbl <- dt_data_get(data = data)

  # Create the `stub_df` table
  stub_df <-
    dplyr::tibble(
      rownum_i = seq_len(nrow(data_tbl)),
      row_id = rep(NA_character_, nrow(data_tbl)),
      group_id = rep(NA_character_, nrow(data_tbl)),
      group_label = rep(list(NULL), nrow(data_tbl)),
      indent = rep(NA_character_, nrow(data_tbl)),
      built_group_label = rep(NA_character_, nrow(data_tbl))
    )

  # Handle case where table has no columns
  if (ncol(data_tbl) < 1) {

    data <- dt_stub_df_set(data = data, stub_df = stub_df)
    return(data)
  }

  #
  # Handle column of data specified as the `rowname_col`
  #
  if (!is.null(rowname_col) && rowname_col %in% colnames(data_tbl)) {

    data <- dt_boxhead_set_stub(data = data, var = rowname_col)

    rownames <- data_tbl[[rowname_col]]

    row_id <- create_unique_id_vals(rownames, simplify = process_md)

    # Place the `row_id` values into `stub_df$row_id`
    stub_df[["row_id"]] <- row_id
  }

  #
  # Handle column of data specified as the `groupname_col`
  #
  if (
    !is.null(groupname_col) &&
    length(groupname_col) > 0 &&
    all(groupname_col %in% colnames(data_tbl))
  ) {

    row_group_labels <-
      apply(
        data_tbl[, groupname_col],
        MARGIN = 1,
        FUN = paste,
        collapse = row_group.sep
      )

    if (process_md) {

      #
      # Ensure that the `row_group_ids` values are simplified to reduce
      # special characters; this requires use of the recoding so that the
      # generated IDs map correctly to the the supplied labels
      #

      unique_row_group_labels <- unique(row_group_labels)

      unique_row_group_ids <-
        create_unique_id_vals(unique_row_group_labels, simplify = process_md)
      names(unique_row_group_ids) <- unique_row_group_labels

      row_group_ids <- dplyr::recode(row_group_labels, !!!unique_row_group_ids)

    } else {
      row_group_ids <- row_group_labels
    }

    # Place the `row_group_ids` values into `stub_df$group_id`
    stub_df[["group_id"]] <- row_group_ids

    if (process_md) {

      stub_df$group_label <-
        lapply(
          seq_along(row_group_labels),
          FUN = function(x) md(row_group_labels[x])
        )

    } else {
      stub_df[["group_label"]] <- as.list(row_group_labels)
    }

    data <- dt_boxhead_set_row_group(data = data, vars = groupname_col)
  }

  # Stop if input `data` has no columns (after modifying `data` for groups)
  if (ncol(data_tbl) == 0) {
    cli::cli_abort(
      "The `data` must have at least one column that isn't a 'group' column."
    )
  }

  dt_stub_df_set(data = data, stub_df = stub_df)
}

dt_stub_df_exists <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  !all(is.na((stub_df)[["row_id"]]))
}

dt_stub_df_build <- function(data, context) {

  stub_df <- dt_stub_df_get(data = data)

  stub_df$built_group_label <-
    vapply(
      stub_df$group_label,
      FUN.VALUE = character(1),
      FUN = function(label) {
        if (!is.null(label)) {
          process_text(text = label, context = context)
        } else {
          ""
        }
      }
    )

  dt_stub_df_set(data = data, stub_df = stub_df)
}

# Function to obtain a reordered version of `stub_df`
reorder_stub_df <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  row_groups <- dt_row_groups_get(data = data)

  rows_df <-
    get_row_reorder_df(
      groups = row_groups,
      stub_df = stub_df
    )

  stub_df <- stub_df[rows_df$rownum_final, ]

  dt_stub_df_set(data = data, stub_df = stub_df)
}

dt_stub_groupname_has_na <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  any(is.na(stub_df$group_id))
}

dt_stub_components <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  stub_components <- c()

  if (any(!is.na(stub_df[["group_id"]]))) {
    stub_components <- c(stub_components, "group_id")
  }

  if (any(!is.na(stub_df[["row_id"]])) && !all(stub_df[["row_id"]] == "")) {
    stub_components <- c(stub_components, "row_id")
  }

  stub_components
}

dt_stub_components_has_rowname <- function(stub_components) {
  isTRUE("row_id" %in% stub_components)
}

dt_stub_indentation_at_position <- function(data, i) {

  indent_i <- dt_stub_df_get(data = data)$indent[[i]]

  if (is.na(indent_i)) {
    return(NULL)
  }

  as.integer(indent_i)
}
