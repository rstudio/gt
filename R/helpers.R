#' Helper for targeting multiple data cells
#'
#' This function is to be used to target individual data cells through the
#'   intersections of columns and rows. Thus, we provide targeting directives
#'   separately for columns and for rows.
#' @param columns,rows either a vector of column/row names, a vector of
#'   column/rows indices, column names provided in \code{\link{vars}()}, row
#'   captions provided \code{c()}, or a helper function focused on selections.
#'   The select helper functions are: \code{\link{starts_with}()},
#'   \code{\link{ends_with}()}, \code{\link{contains}()},
#'   \code{\link{matches}()}, \code{\link{one_of}()}, and
#'   \code{\link{everything}()}.
#' @return a list object of class \code{data_cells}.
#' @import rlang
#' @export
data_cells <- function(columns = NULL,
                       rows = NULL) {

  # Capture expressions for the `columns` and `rows` arguments
  col_expr <- rlang::enquo(columns)
  row_expr <- rlang::enquo(rows)

  # Create the `data_cells` object
  data_cells <-
    list(
      columns = col_expr,
      rows = row_expr)

  # Apply the `data_cells` class
  class(data_cells) <- "data_cells"

  data_cells
}

#' Interpret input text as Markdown-formatted text
#' @param text the text that is understood to contain Markdown formatting.
#' @return a character object that is tagged for a Markdown-to-HTML
#'   transformation.
#' @return a character object of class \code{from_markdown}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # that is to interpreted as Markdown
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stubhead_caption(
#'       caption = md("car *make* and *model*"))
#' @family helper functions
#' @export
md <- function(text) {

  # Apply the `from_markdown` class
  class(text) <- "from_markdown"
  text
}

#' Interpret input text as HTML-formatted text
#' @param text the text that is understood to be HTML text, which is to be
#'   preserved.
#' @return a character object that is tagged as an HTML fragment that is not to
#'   be sanitized.
#' @return a character object of class \code{preserve_html}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # that is to interpreted as HTML
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stubhead_caption(
#'       caption = html(
#'         "car <em>make</em> and <em>model</em>"))
#' @family helper functions
#' @export
html <- function(text) {

  # Apply the `from_markdown` class
  class(text) <- "preserve_html"
  text
}

#' Helper for processing column labels
#'
#' This helper is to be used specifically within the \code{cols_label()}
#'   function as an alternative to using named vectors within that function. The
#'   advantage in using this helper is that the assigned column labels can be
#'   marked as Markdown (with the \code{md()} function) or as HTML (with the
#'   \code{html()} function).
#' @param ... a series of named arguments representing the column names and
#'   values representing the column labels.
#' @return a named vector of column labels.
#' @examples
#' # Create a gt table based on the mtcars
#' # dataset; label some of the columns (i.e.,
#' # provide replacement names for use in the
#' # output) with `cols_label()` and the
#' # `col_labels()` helper function
#' gt_tbl <-
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

#' Helper for defining custom styles for table cells
#' @return a character vector containing formatted styles.
#' @param bkgd_color the background color of the cell.
#' @param text_color the text color.
#' @param text_font the font or collection of fonts (subsequent font names are)
#'   used as fallbacks.
#' @param text_style the text style. Can be one of either \code{"center"},
#'   \code{"normal"}, \code{"italic"}, or \code{"oblique"}.
#' @param text_size the size of the font.
#' @param text_align the text alignment. Can be one of either \code{"center"},
#'   \code{"left"}, \code{"right"}, or \code{"justify"}.
#' @param text_indent the indentation of the text.
#' @param text_decorate allows for text decoration effect to be applied. Here,
#'   we can use \code{"overline"}, \code{"line-through"}, or \code{"underline"}.
#' @param text_transform allows for the transformation of text. Options are
#'   \code{"uppercase"}, \code{"lowercase"}, or \code{"capitalize"}.
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

#' Helper for providing a numeric value as percentage
#' @param x the numeric value to format as a string percentage for some
#'   \code{\link{tab_options}()} arguments that can take percentage values
#'   (e.g., \code{table.width}).
#' @family helper functions
#' @export
pct <- function(x) {

  if (!inherits(x, "numeric")) {
    stop("The supplied value must be numeric", call. = FALSE)
  }

  paste0(x, "%")
}

#' Helper for providing a numeric value as pixels value
#' @param x the numeric value to format as a string (e.g., \code{"12px"}) for
#'   some \code{\link{tab_options}()} arguments that can take values as units of
#'   pixels (e.g., \code{table.font.size}).
#' @family helper functions
#' @export
px <- function(x) {

  if (!inherits(x, "numeric")) {
    stop("The supplied value must be numeric", call. = FALSE)
  }

  paste0(x, "px")
}
