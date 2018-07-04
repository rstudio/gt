#' Interpret input text as Markdown-formatted text
#' @param text the text that is understood to contain
#' Markdown formatting.
#' @return a character object that is tagged for
#' a Markdown to HTML transformation.
#' @return a character object of class \code{from_markdown}.
#' @export
md <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "from_markdown"
  text
}

#' Interpret input text as HTML-formatted text
#' @param text the text that is understood to be
#' HTML text, which is to be preserved.
#' @return a character object that is tagged as an
#' HTML fragment that is not to be santized.
#' @return a character object of class \code{preserve_html}.
#' @export
html <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "preserve_html"
  text
}

#' Helper to target a single table cell
#' @param row a single row to target.
#' @param column a single column to target.
#' @return a list object of class \code{single_cell_target}.
#' @export
target_cell <- function(row = NULL,
                        column = NULL) {

  # Create the list object
  cell_targeted <- list(row = row, column = column)

  # Apply the `helper_cells` class
  attr(cell_targeted, "class") <- "single_cell_target"
  cell_targeted
}

#' Helper for collecting ungrouped rows or columns
#' @return a character object of class \code{not_in_group}.
#' @export
not_in_group <- function() {

  x <- ":not_in_group"

  class(x) <- "not_in_group"
  x
}

#' #' Define one or more table cells
#' #' @param row an integer representing the
#' #' table row to target (as part of the
#' #' \code{row}-\code{column} dyad).
#' #' @param column an integer representing the
#' #' table column to target (as part of the
#' #' \code{row}-\code{column} dyad).
#' #' @return a list object of class \code{helper_cells}
#' #' @export
#' cells <- function(row, column) {
#'
#'   # Create the list object
#'   cells <- list(row = row, column = column)
#'
#'   # Apply the `helper_cells` class
#'   attr(cells, "class") <- "helper_cells"
#'   cells
#' }

#' #' Provide a directive to get rows that fit a
#' #' naming pattern
#' #' @param pattern a matching pattern for
#' #' targeting rownames.
#' #' @export
#' rownames_with <- function(pattern) {
#'
#'   paste0("::rownames_with::", pattern)
#' }
