#' Define a table cell
#' @param row an integer representing the table
#' row to target (as part of the \code{row}-\code{column}
#' dyad).
#' @export
cell <- function(row, column) {

  list(row = row, column = column)
}
