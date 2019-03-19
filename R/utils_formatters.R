#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param ... The arguments passed to `dplyr::filter()`
#' @import rlang
#' @importFrom dplyr filter
#' @noRd
filter_table_to_row <- function(table, ...) {

  filter_args_enquos <- rlang::enquos(...)
  filtered_tbl <- dplyr::filter(table, !!!filter_args_enquos)

  if (nrow(filtered_tbl) != 1) {
    stop("Internal error in `gt:::filter_table_to_row()`:\n",
         " * The filtered table doesn't result in a table of exactly one row.",
         call. = FALSE)
  }

  filtered_tbl
}

#' Pull a single value from a table with a single row
#'
#' @param table The single-row table.
#' @param column The column from which the single value should be obtained.
#' @import rlang
#' @import rlang
#' @importFrom dplyr pull
#' @noRd
pull_table_value_from_column <- function(table, column) {

  if (nrow(table) != 1) {
    stop("Internal error in `gt:::pull_table_value_from_column()`:\n",
         " * The `table` must contain exactly one row.",
         call. = FALSE)
  }

  column_enquo <- rlang::enquo(column)

  table %>%
    dplyr::pull(!!column_enquo)
}

