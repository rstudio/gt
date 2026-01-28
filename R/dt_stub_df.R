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
    omit_na_group,
    row_group.sep,
    process_md
) {

  data_tbl <- dt_data_get(data = data)

  # Create the `stub_df` table
  stub_df <-
    vctrs::data_frame(
      rownum_i = seq_len(nrow(data_tbl)),
      row_id = rep_len(NA_character_, nrow(data_tbl)),
      group_id = rep_len(NA_character_, nrow(data_tbl)),
      group_label = rep(list(NULL), nrow(data_tbl)),
      indent = rep_len(NA_character_, nrow(data_tbl)),
      built_group_label = rep_len(NA_character_, nrow(data_tbl))
    )

  # Handle case where table has no columns
  if (ncol(data_tbl) < 1L) {

    data <- dt_stub_df_set(data = data, stub_df = stub_df)
    return(data)
  }

  #
  # Handle column(s) of data specified as the `rowname_col`
  #
  if (!is.null(rowname_col) && all(rowname_col %in% colnames(data_tbl))) {

    # For multiple columns, we need to handle them as a hierarchy
    if (length(rowname_col) > 1) {

      # Set all columns as stub columns in the boxhead
      for (col in rowname_col) {
        data <- dt_boxhead_set_stub(data = data, var = col)
      }

      # Reorder the boxhead to match the order specified in rowname_col
      # This ensures stub columns appear in the order the user specified
      dt_boxhead <- dt_boxhead_get(data = data)

      # Split boxhead into stub and non-stub rows
      stub_rows <- dt_boxhead[dt_boxhead$var %in% rowname_col, ]
      non_stub_rows <- dt_boxhead[!dt_boxhead$var %in% rowname_col, ]

      # Reorder stub rows to match rowname_col order
      stub_rows <- stub_rows[match(rowname_col, stub_rows$var), ]

      # Combine: stub rows first (in specified order), then non-stub rows
      dt_boxhead <- rbind(stub_rows, non_stub_rows)
      rownames(dt_boxhead) <- NULL

      # Update the boxhead
      data <- dt_boxhead_set(data = data, boxh = dt_boxhead)

      # Use the rightmost column as the primary row ID
      rightmost_col <- rowname_col[length(rowname_col)]
      rownames <- data_tbl[[rightmost_col]]
      row_id <- create_unique_id_vals(rownames, simplify = process_md)

      # Place the `row_id` values into `stub_df$row_id`
      stub_df[["row_id"]] <- row_id

    } else {
      # Original single column logic
      data <- dt_boxhead_set_stub(data = data, var = rowname_col)

      rownames <- data_tbl[[rowname_col]]

      row_id <- create_unique_id_vals(rownames, simplify = process_md)

      # Place the `row_id` values into `stub_df$row_id`
      stub_df[["row_id"]] <- row_id
    }
  }

  #
  # Handle column of data specified as the `groupname_col`
  #
  if (
    length(groupname_col) > 0L &&
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
      # generated IDs map correctly to the supplied labels
      #

      unique_row_group_labels <- unique(row_group_labels)

      unique_row_group_ids <-
        create_unique_id_vals(unique_row_group_labels, simplify = process_md)
      names(unique_row_group_ids) <- unique_row_group_labels

      # dplyr::recode is superseded, and is slower now.
      # TODO consider using vctrs::vec_case_match when available r-lib/vctrs#1622
      # Handle empty dataframe case where unique_row_group_ids is empty
      if (length(unique_row_group_ids) == 0) {
        row_group_ids <- row_group_labels
      } else {
        row_group_ids <- dplyr::recode(row_group_labels, !!!unique_row_group_ids)
      }

    } else {
      row_group_ids <- row_group_labels
    }

    # If omit_na_group is TRUE, set group_id to NA_character_ for rows
    # where groupname_col is NA
    if (omit_na_group) {
      # Check if the original groupname_col values are NA
      na_rows <- is.na(data_tbl[[groupname_col[1]]])
      if (length(groupname_col) > 1) {
        # For multiple columns, check if all are NA
        for (i in seq_along(groupname_col)) {
          na_rows <- na_rows & is.na(data_tbl[[groupname_col[i]]])
        }
      }
      row_group_ids[na_rows] <- NA_character_
      row_group_labels[na_rows] <- NA_character_
    }

    # Place the `row_group_ids` values into `stub_df$group_id`
    stub_df[["group_id"]] <- row_group_ids

    if (process_md) {

      stub_df$group_label <-
        lapply(
          seq_along(row_group_labels),
          FUN = function(x) {
            if (is.na(row_group_labels[x])) {
              NULL
            } else {
              md(row_group_labels[x])
            }
          }
        )

    } else {
      stub_df[["group_label"]] <- lapply(
        row_group_labels,
        FUN = function(x) if (is.na(x)) NULL else x
      )
    }

    data <- dt_boxhead_set_row_group(data = data, vars = groupname_col)
  }

  # Stop if input `data` has no columns (after modifying `data` for groups)
  if (ncol(data_tbl) == 0L) {
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
      FUN.VALUE = character(1L),
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

  # First, reorder by row groups
  rows_df <-
    get_row_reorder_df(
      groups = row_groups,
      stub_df = stub_df
    )

  stub_df <- stub_df[rows_df$rownum_final, ]

  # Then, apply any row ordering directives
  stub_df <- apply_row_order_directives(data = data, stub_df = stub_df)

  dt_stub_df_set(data = data, stub_df = stub_df)
}

# Function to apply the lazy row ordering directives captured by `row_order()`
apply_row_order_directives <- function(data, stub_df) {

  # Get the row order directives
  row_order_directives <- dt_row_order_get(data = data)

  # If there are no directives, return stub_df unchanged
  if (length(row_order_directives) == 0) {
    return(stub_df)
  }

  # Get the original data table for evaluating ordering expressions
  data_tbl <- dt_data_get(data = data)

  # Apply each directive in order
  for (directive in row_order_directives) {

    by <- directive$by
    groups <- directive$groups
    reverse <- directive$reverse

    # Determine which rows to order
    if (is.null(groups)) {
      # Order all rows together (within their current group context)
      unique_groups <- unique(stub_df$group_id)
    } else {
      # Only order rows in specified groups
      unique_groups <- groups
    }

    # Process each group separately to maintain group boundaries
    for (grp in unique_groups) {

      # Find rows belonging to this group
      if (is.na(grp)) {
        grp_mask <- is.na(stub_df$group_id)
      } else {
        grp_mask <- stub_df$group_id == grp & !is.na(stub_df$group_id)
      }

      grp_indices <- which(grp_mask)

      if (length(grp_indices) <= 1) {
        next # No need to sort a single row or empty group
      }

      # Get the original row numbers for this group
      original_rownum <- stub_df$rownum_i[grp_indices]

      # Create a temporary data frame for ordering
      # using the original data values at those row positions
      temp_df <- data_tbl[original_rownum, , drop = FALSE]

      # Build the ordering using the quosures
      # Evaluate each quosure in the context of the temp data
      order_args <- lapply(by, function(quo) {
        rlang::eval_tidy(quo, data = temp_df)
      })

      # Add decreasing argument if reverse is TRUE
      order_args$decreasing <- reverse

      # Get the new order for this group
      new_order <- do.call(order, order_args)

      # Reorder the group indices in stub_df
      stub_df[grp_indices, ] <- stub_df[grp_indices[new_order], ]
    }
  }

  # Reset row names

  rownames(stub_df) <- NULL

  stub_df
}

dt_stub_groupname_has_na <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  anyNA(stub_df$group_id)
}

dt_stub_components <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  stub_components <- NULL # same as c()

  if (!all(is.na(stub_df[["group_id"]]))) {
    stub_components <- c(stub_components, "group_id")
  }

  # check if some row_id are present and have non-empty chr
  if (!all(is.na(stub_df[["row_id"]])) && any(nzchar(stub_df[["row_id"]]))) {
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
