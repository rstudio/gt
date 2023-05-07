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


#' Add one or more rows to a **gt** table
#'
#' @description
#'
#' It's possible to add new rows to your table with `rows_add()` by supplying
#' the new row data through name value pairs.
#'
#' @param .data A table object that is created using the [gt()] function.
#' @param ... Expressions for the assignment of cell values to the new rows
#'   by column name in `.data`. Name-value pairs, in the form of
#'   `<column> = <value vector>` will work, so long as the `<column>` value
#'   exists in the table. Two-sided formulas with column-resolving expressions
#'   (e.g, `<expr> ~ <value vector>`) can also be used, where the left-hand side
#'   corresponds to selections of columns. The length of the longest vector in
#'   `<value vector>` determines how many new rows will be added. Single values
#'   in `<value vector>` will be repeated down in cases where there are multiple
#'   rows to be added.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @param .before,.after A single row-resolving expression or row index can be
#'   given to either `.before` or `.after`. This specifies where the new rows
#'   should be positioned among the existing rows in the input data table. If
#'   nothing is provided for either argument the new rows will be placed at the
#'   bottom.
#' @param .n_empty An option to add empty rows in lieu of rows containing data
#'   that would otherwise be supplied to `...` or `.list`. If the option is
#'   taken, provide an integer value here.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's make a simple **gt** table with the [`exibble`] dataset, using the
#' `row` column for labels in the stub. We'll add a single row to the bottom of
#' the table with `rows_add()`. With name-value pairs, it's possible to add
#' values for the body cells corresponding to columns available in the table.
#' For any columns that are missed, the corresponding body cells receive `NA`
#' values.
#'
#' ```r
#' exibble |>
#'   gt(rowname_col = "row") |>
#'   rows_add(
#'     row = "row_9",
#'     num = 9.999E7,
#'     char = "ilama",
#'     fctr = "nine",
#'     group = "grp_b"
#'   )
#' ```
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-4
#'
#' @section Function Introduced:
#' `0.9.1` (in development)
#'
#' @import rlang
#' @export
rows_add <- function(
    .data,
    ...,
    .list = list2(...),
    .before = NULL,
    .after = NULL,
    .n_empty = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = .data)

  # Collect a list of new row data
  row_data_list <- .list

  if (length(row_data_list) < 1 && is.null(.n_empty)) {
    return(.data)
  }

  # Get the column names from the internal dataset
  data_tbl <- dt_data_get(data = .data)

  if (!is.null(.n_empty)) {

    # Ensure that `.n_empty` is an integer if anything is provided
    if (!rlang::is_integerish(.n_empty)) {
      cli::cli_abort("An integer value should be supplied for `.n_empty`.")
    }

    # If the `.n_empty` should evaluate to `0` return the data unchanged
    if (as.integer(.n_empty) == 0) {
      return(.data)
    }

    # Ensure that `.n_empty` is not negative
    if (as.integer(.n_empty) < 0) {
      cli::cli_abort("The value for `.n_empty` cannot be negative.")
    }

    # Generate empty rows with `NA` values
    row_data_list <-
      lapply(
        seq_along(colnames(data_tbl)),
        FUN = function(x) rep(NA, .n_empty)
      )
    names(row_data_list) <- colnames(data_tbl)

  } else {

    # Ensure that the column names resolved belong to the internal
    # data table of `data_tbl`
    if (any(!(names(row_data_list) %in% colnames(data_tbl)))) {
      cli::cli_abort("All column names referenced must be present in the data.")
    }
  }

  resolved_rows_before_idx <-
    resolve_rows_i(
      expr = {{ .before }},
      data = .data,
      null_means = "nothing"
    )

  resolved_rows_after_idx <-
    resolve_rows_i(
      expr = {{ .after }},
      data = .data,
      null_means = "nothing"
    )

  dt_data_add_rows(
    data = .data,
    row_data_list = row_data_list,
    before = resolved_rows_before_idx,
    after = resolved_rows_after_idx
  )
}
