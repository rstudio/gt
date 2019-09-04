#' Add a spanner column label
#'
#' Set a spanner column label by mapping it to columns already in the table.
#' This label is placed above one or more column labels, spanning the width of
#' those columns and column labels.
#' @inheritParams fmt_number
#' @param label The text to use for the spanner column label.
#' @param columns The columns to be components of the spanner heading.
#' @param gather An option to move the specified `columns` such that they are
#'   unified under the spanner column label. Ordering of the moved-into-place
#'   columns will be preserved in all cases.
#' @return An object of class `gt_tbl`.
#' @examples
#' # Use `gtcars` to create a gt table;
#' # Group several columns related to car
#' # performance under a spanner column
#' # with the label `performance`
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(
#'     -mfr, -trim, bdy_style, drivetrain,
#'     -drivetrain, -trsmn, -ctry_origin
#'   ) %>%
#'   dplyr::slice(1:8) %>%
#'   gt(rowname_col = "model") %>%
#'   tab_spanner(
#'     label = "performance",
#'     columns = vars(
#'       hp, hp_rpm, trq, trq_rpm,
#'       mpg_c, mpg_h)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_spanner_1.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
tab_spanner <- function(data,
                        label,
                        columns,
                        gather = TRUE) {

  checkmate::assert_character(
    label, len = 1, any.missing = FALSE, null.ok = FALSE)

  columns <- enquo(columns)

  # Get the columns supplied in `columns` as a character vector
  column_names <- resolve_vars(var_expr = !!columns, data = data)

  data <-
    dt_spanners_add(
      data = data,
      vars = column_names,
      spanner_label = label,
      gather = gather
    )

  if (isTRUE(gather) && length(column_names) >= 1) {

    # Move columns into place
    data <-
      data %>%
      cols_move(
        columns = column_names,
        after = column_names[1]
      )
  }

  data
}

#' Create group names and column labels via delimited names
#'
#' This function will split selected delimited column names such that the first
#' components (LHS) are promoted to being spanner column labels, and the
#' secondary components (RHS) will become the column labels. Please note that
#' reference to individual columns must continue to be the column names from the
#' input table data (which are unique by necessity).
#'
#' If we look to the column names in the `iris` dataset as an example of how
#' `cols_split_delim()` might be useful, we find the names `Sepal.Length`,
#' `Sepal.Width`, `Petal.Length`, `Petal.Width`. From this naming system, it's
#' easy to see that the `Sepal` and `Petal` can group together the repeated
#' common `Length` and `Width` values. In your own datasets, we can avoid a
#' lengthy relabeling with [cols_label()] if column names can be fashioned
#' beforehand to contain both the spanner column label and the column label. An
#' additional advantage is that the column names in the input table data remain
#' unique even though there may eventually be repeated column labels in the
#' rendered output table).
#'
#' @inheritParams cols_align
#' @inheritParams tab_spanner
#' @param delim The delimiter to use to split an input column name. The
#'   delimiter supplied will be autoescaped for the internal splitting
#'   procedure. The first component of the split will become the group name and
#'   the second component will be the column label.
#' @param columns An optional vector of column names that this operation should
#'   be limited to. The default is to consider all columns in the table.
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `iris` to create a gt table; split
#' # any columns that are dot-separated
#' # between column spanner labels (first
#' # part) and column labels (second part)
#' tab_1 <-
#'   iris %>%
#'   dplyr::group_by(Species) %>%
#'   dplyr::slice(1:4) %>%
#'   gt() %>%
#'   tab_spanner_delim(delim = ".")
#'
#' @section Figures:
#' \if{html}{\figure{man_cols_split_delim_1.svg}{options: width=100\%}}
#'
#' @family column modification functions
#' @export
tab_spanner_delim <- function(data,
                              delim,
                              columns = NULL,
                              gather = TRUE) {

  columns <- enquo(columns)

  # Get all of the columns in the dataset
  all_cols <- data %>% dt_boxhead_get_vars()

  # Get the columns supplied in `columns` as a character vector
  columns <- resolve_vars(var_expr = !!columns, data = data)

  if (!is.null(columns)) {
    colnames <- base::intersect(all_cols, columns)
  } else {
    colnames <- all_cols
  }

  if (length(colnames) == 0) {
    return(data)
  }

  colnames_has_delim <- grepl(pattern = delim, x = colnames, fixed = TRUE)

  if (any(colnames_has_delim)) {

    colnames_with_delim <- colnames[colnames_has_delim]

    split_colnames <- strsplit(colnames_with_delim, delim, fixed = TRUE)

    spanners <- vapply(split_colnames, `[[`, character(1), 1)

    new_labels <-
      lapply(split_colnames, `[[`, -1) %>%
      vapply(paste0, FUN.VALUE = character(1), collapse = delim)

    for (i in seq_along(split_colnames)) {

      spanners_i <- spanners[i]
      new_labels_i <- new_labels[i]
      var_i <- colnames_with_delim[i]

      data <-
        data %>%
        dt_boxhead_edit(var = var_i, column_label = new_labels_i)
    }

    spanner_var_list <- split(colnames_with_delim, spanners)

    for (spanner_label in names(spanner_var_list)) {

      data <-
        data %>%
        dt_spanners_add(
          vars = spanner_var_list[[spanner_label]],
          spanner_label = spanner_label,
          gather = gather
        )
    }
  }

  data
}
