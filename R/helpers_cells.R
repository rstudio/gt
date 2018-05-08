#' Define a single table cell
#' @param row an integer representing the
#' table row to target (as part of the
#' \code{row}-\code{column} dyad).
#' @param column an integer representing the
#' table column to target (as part of the
#' \code{row}-\code{column} dyad).
#' @export
cell <- function(row, column) {

  list(row = row, column = column)
}
