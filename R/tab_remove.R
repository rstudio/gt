#' Remove the table header
#'
#' @description
#' We can remove the table header from a **gt** table quite easily with
#' `rm_header()`. The table header is an optional table part that is positioned
#' above the column labels. This function for removal is useful if you have
#' received a **gt** table (perhaps through an API that returns **gt** objects)
#' but would prefer that the table not contain a header.
#'
#' @param data A table object of class `gt_tbl`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @family part removal functions
#' @section Function ID:
#' 10-1
#'
#' @export
rm_header <- function(data) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  dt_heading_init(data = data)
}
