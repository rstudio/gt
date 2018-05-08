#' Define one or more table cells
#' @param row an integer representing the
#' table row to target (as part of the
#' \code{row}-\code{column} dyad).
#' @param column an integer representing the
#' table column to target (as part of the
#' \code{row}-\code{column} dyad).
#' @return a list object of class \code{helper_cells}
#' @export
cells <- function(row, column) {

  # Create the list object
  cells <- list(row = row, column = column)

  # Apply the `helper_cells` class
  attr(cells, "class") <- "helper_cells"

  cells
}
