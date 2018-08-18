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

#' Helper for targeting multiple table cells
#' @param row a single row or a range of rows to target.
#' @param column a single column or a range of columns to target.
#' @return a list object of class \code{multi_cell_target}.
#' @family helper functions
#' @export
data_cells <- function(rows = NULL,
                       columns = NULL) {

  # If using the `vars()` helper, get the row as a character vector
  if (inherits(rows, "quosures")) {
    rows <- rows %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get the column as a character vector
  if (inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # Get all possible combinations with `expand.grid()`
  expansion <- expand.grid(rows, columns, stringsAsFactors = FALSE)

  # Create a list object
  cells_targeted <- list(row = expansion[[1]], column = expansion[[2]])

  # Apply the `helper_cells` class
  attr(cells_targeted, "class") <- "data_cells"
  cells_targeted
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

#' Helper for creating a list of functions
#'
#' See \code{dplyr::\link[dplyr]{funs}} for details.
#' @name funs
#' @rdname funs
#' @keywords internal
#' @importFrom dplyr funs
#' @usage funs(...)
#' @param ... one or more functions that can be either a function name (e.g.,
#' \code{"mean"}), the function itself (e.g., \code{mean}), or calls to
#' functions with \code{.} as a dummy argument (e.g.,
#' \code{mean(., na.rm = TRUE)}).
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

#' Helper for defining custom styles for table cells
#' @return a character vector containing formatted styles.
#' @param bkgd_color the background color of the cell.
#' @param text_color the text color.
#' @param text_font the font or collection of fonts (subsequent font names are)
#' used as fallbacks.
#' @param text_style the text style. Can be one of either \code{"center"},
#' \code{"normal"}, \code{"italic"}, or \code{"oblique"}.
#' @param text_size the size of the font.
#' @param text_align the text alignment. Can be one of either \code{"center"},
#' \code{"left"}, \code{"right"}, or \code{"justify"}.
#' @param text_indent the indentation of the text.
#' @param text_decorate allows for text decoration effect to be applied. Here,
#' we can use \code{"overline"}, \code{"line-through"}, or \code{"underline"}.
#' @param text_transform allows for the transformation of text. Options are
#' \code{"uppercase"}, \code{"lowercase"}, or \code{"capitalize"}.
#' @family helper functions
#' @export
apply_styles <- function(bkgd_color = NULL,
                         text_color = NULL,
                         text_font = NULL,
                         text_style = NULL,
                         text_size = NULL,
                         text_align = NULL,
                         text_indent = NULL,
                         text_decorate = NULL,
                         text_transform = NULL) {

  styles <- c()

  if (!is.null(bkgd_color)) {
    styles <- c(styles, paste0("background-color:", bkgd_color, ";"))
  }

  if (!is.null(text_color)) {
    styles <- c(styles, paste0("color:", text_color, ";"))
  }

  if (!is.null(text_font)) {
    styles <- c(styles, paste0("font-family:", text_font, ";"))
  }

  if (!is.null(text_style)) {

    if (text_style %in% c("normal", "italic", "oblique")) {
      styles <- c(styles, paste0("font-style:", text_style, ";"))
    }
  }

  if (!is.null(text_size)) {
    styles <- c(styles, paste0("font-size:", text_size, ";"))
  }

  if (!is.null(text_align)) {

    if (text_align %in% c("center", "left", "right", "justify")) {
    styles <- c(styles, paste0("text-align:", text_align, ";"))
    }
  }

  if (!is.null(text_indent)) {
    styles <- c(styles, paste0("text-indent:", text_indent, ";"))
  }

  if (!is.null(text_decorate)) {

    if (text_decorate %in% c("overline", "line-through",
                             "underline", "underline overline")) {
      styles <- c(styles, paste0("text-decoration:", text_decorate, ";"))
    }
  }

  if (!is.null(text_transform)) {

    if (text_decorate %in% c("uppercase", "lowercase", "capitalize")) {
      styles <- c(styles, paste0("text-transform:", text_transform, ";"))
    }
  }

  styles
}
