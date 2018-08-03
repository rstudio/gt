#' Interpret input text as Markdown-formatted text
#' @param text the text that is understood to contain Markdown formatting.
#' @return a character object that is tagged for a Markdown-to-HTML
#' transformation.
#' @return a character object of class \code{from_markdown}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # that is to interpreted as Markdown
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stubhead_caption(
#'     caption = md("car *make* and *model*"))
#' @family helper functions
#' @export
md <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "from_markdown"
  text
}

#' Interpret input text as HTML-formatted text
#' @param text the text that is understood to be HTML text, which is to be
#' preserved.
#' @return a character object that is tagged as an HTML fragment that is not to
#' be sanitized.
#' @return a character object of class \code{preserve_html}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # that is to interpreted as HTML
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stubhead_caption(
#'     caption = html(
#'       "car <em>make</em> and <em>model</em>"))
#' @family helper functions
#' @export
html <- function(text) {

  # Apply the `from_markdown` class
  attr(text, "class") <- "preserve_html"
  text
}

#' Helper for targeting multiple rows with a pattern
#' @param pattern a pattern that can help capture one or more row names and
#' hence the rows themselves.
#' @return a list object of class \code{rownames_with}.
#' @examples
#' # With the `mtcars` dataset (preserving the
#' # rownames in the stub), we can target number
#' # formatting to those rows that fit a
#' # specified pattern
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_number(
#'     columns = vars(qsec, wt),
#'     rows = rownames_with("Merc"),
#'     decimals = 3)
#' @family helper functions
#' @export
rownames_with <- function(pattern) {

  # Create the list object
  x <- list(pattern = pattern)

  # Apply the `rownames_with` class
  attr(x, "class") <- "rownames_with"
  x
}

#' Helper for targeting rows based on conditional data
#' @param conditions conditional expressions involving column names that can
#' help capture one or more rows.
#' @return a quosure.
#' # With the `mtcars` dataset, apply
#' # number formatting to to `qsec` (3
#' # decimal places) to those rows where
#' # `cyl >= 6` and `vs == 1`
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_number(
#'     columns = vars(qsec),
#'     rows = rows_where(cyl >= 6 & vs == 1),
#'     decimals = 3)
#' @family helper functions
#' @importFrom rlang enquo
#' @export
rows_where <- function(conditions) {

  # Capture provided conditions
  rlang::enquo(conditions)
}

#' Helper for targeting multiple columns with a pattern
#' @param pattern a pattern that can help capture one or more column names.
#' @return a list object of class \code{columns_with}.
#' @examples
#' # With the `mtcars` dataset we can target
#' # number formatting to those column labels
#' # that fit a specified pattern
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_number(
#'     columns = columns_with("^c"),
#'     decimals = 3)
#' @family helper functions
#' @export
columns_with <- function(pattern) {

  # Create a list object
  x <- list(pattern = pattern)

  # Apply the `columns_with` class
  attr(x, "class") <- "columns_with"
  x
}

#' Helper for targeting a single table cell
#' @param row a single row to target.
#' @param column a single column to target.
#' @return a list object of class \code{single_cell_target}.
#' @family helper functions
#' @export
target_cell <- function(row = NULL,
                        column = NULL) {

  # If using the `vars()` helper, get the row as a character vector
  if (inherits(row, "quosures")) {
    row <- row %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get the column as a character vector
  if (inherits(column, "quosures")) {
    column <- column %>% lapply(`[[`, 2) %>% as.character()
  }

  row <- row[1]

  if (suppressWarnings(!(row %>% as.integer() %>% is.na()))) {
    row <- as.integer(row)
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
#'
#' See \code{dplyr::\link[dplyr]{vars}} for details.
#' @name vars
#' @rdname vars
#' @keywords internal
#' @importFrom dplyr vars
#' @usage vars(...)
#' @param ... one or more column names or row labels, depending on the enclosing
#' function. This can be provided as bare column names or row labels.
#' @family helper functions
#' @export
NULL

#' Helper for processing column labels
#'
#' This helper is to be used specifically within the \code{cols_label()}
#' function as an alternative to using named vectors within that function. The
#' advantage in using this helper is that the assigned column labels can be
#' marked as Markdown (with the \code{md()} function) or as HTML (with the
#' \code{html()} function).
#' @param ... a series of named arguments representing the column names and
#' values representing the column labels.
#' @return a named vector of column labels.
#' @examples
#' # Create a gt table based on the mtcars
#' # dataset; label some of the columns (i.e.,
#' # provide replacement names for use in the
#' # output) with `cols_label()` and the
#' # `col_labels()` helper function
#' tab <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'   cols_label(
#'     labels = col_labels(
#'       hp = md("*HP*"), qsec = "QMT, seconds"))
#' @family helper functions
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
#' @family helper functions
#' @export
not_in_group <- function() {

  # Create a character object
  x <- ":not_in_group:"

  class(x) <- "not_in_group"
  x
}
