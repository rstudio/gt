#' Print the table
#' @description This function will provide a
#' print out of the HTML table.
#' @param x an object of class
#' \code{html_table}.
#' @keywords internal
#' @export

print.html_table <- function(x, ...) {

  args <- list(...)
  args <- NULL

  x[["html_tbl_text"]]
}
