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

