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

#' @export
rownames_with <- function(pattern) {

  # Create the list object
  x <- list(pattern = pattern)

  # Apply the `rownames_with` class
  attr(x, "class") <- "rownames_with"
  x
}

#' @export
columns_with <- function(pattern) {

  # Create a list object
  x <- list(pattern = pattern)

  # Apply the `columns_with` class
  attr(x, "class") <- "columns_with"
  x
}

#' Helper to target a single table cell
#' @param row a single row to target.
#' @param column a single column to target.
#' @return a list object of class \code{single_cell_target}.
#' @export
target_cell <- function(row = NULL,
                        column = NULL) {

  # Get the requested `row`
  row <-
    rlang::enquo(row) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  if ("&" %in% row) {
    row <- row[row != "&"]
  }

  row <- row[1]

  if (suppressWarnings(!(row %>% as.integer() %>% is.na()))) {
    row <- as.integer(row)
  }

  # Get the requested `column`
  column <-
    rlang::enquo(column) %>%
    rlang::get_expr() %>%
    as.character() %>%
    strsplit(split = " & ") %>%
    rlang::flatten_chr() %>%
    stringr::str_trim()

  if ("&" %in% column) {
    column <- column[column != "&"]
  }

  column <- column[1]

  if (suppressWarnings(!(column %>% as.integer() %>% is.na()))) {
    column <- as.integer(column)
  }

  # Create a list object
  cell_targeted <- list(row = row, column = column)

  # Apply the `helper_cells` class
  attr(cell_targeted, "class") <- "single_cell_target"
  cell_targeted
}

#' Helper for targeting a series of row labels or columns
#' @importFrom rlang enquos get_expr
#' @export
tgt <- function(...) {

  # Get the requested targets
  x <- rlang::enquos(...) %>% unlist()

  cols <- c()
  for (i in seq(x)) {
    cols <- c(cols, (x[[i]] %>% rlang::get_expr() %>% as.character()))
  }

  cols
}

#' Helper for processing column labels
#' @return a named vector of column labels.
#' @export
col_labels <- function(...) {

  x <- list(...)

  for (i in seq(x)) {
    x[[i]] <- x[[i]] %>% process_text()
  }

  x %>% unlist()
}

#' Helper for collecting ungrouped rows or columns
#' @return a character object of class \code{not_in_group}.
#' @export
not_in_group <- function() {

  # Create a character object
  x <- ":not_in_group:"

  class(x) <- "not_in_group"
  x
}
