#' Helpers for targeting multiple cells in different locations
#'
#' These helper functions are used to target individual cells in different
#' locations.
#'
#' The following helper functions can be used to target cells (roughly in order
#' from the top to the bottom of a table):
#'
#' \itemize{
#'
#' \item \code{cells_title()}: targets the table title or the table subtitle
#' depending on the value given to the \code{groups} argument (\code{"title"} or
#' \code{"subtitle"}).
#'
#' \item \code{cells_column_labels()}: targets labels in the column labels (the
#' \code{columns} argument) or the spanner column labels (the \code{groups}
#' argument) in the table's column labels part.
#'
#' \item \code{cells_group()}: targets the row group labels in any available
#' row groups using the \code{groups} argument.
#'
#' \item \code{cells_stub()}: targets row labels in the table stub using the
#' \code{rows} argument.
#'
#' \item \code{cells_data()}: targets data cells in the table field using
#' intersections of \code{columns} and \code{rows}.
#'
#' \item \code{cells_summary()}: targets summary cells in the table field using
#' the \code{groups} argument and intersections of \code{columns} and
#' \code{rows}.
#'
#' }
#'
#' The select helper functions are: \code{\link{starts_with}()},
#'   \code{\link{ends_with}()}, \code{\link{contains}()},
#'   \code{\link{matches}()}, \code{\link{one_of}()}, and
#'   \code{\link{everything}()}.
#'
#' @param columns,rows,groups either a vector of names, a vector of
#'   indices, values provided by \code{\link{vars}()}, values provided by
#'   \code{c()}, or a select helper function (see Details for information on
#'   these functions).
#' @name location_cells
#' @return a list object of class \code{location_cells}.
NULL

#' @rdname location_cells
#' @import rlang
#' @export
cells_title <- function(groups = c("title", "subtitle")) {

  # Capture expression for the `groups` argument
  group_expr <- rlang::enquo(groups)

  # Create the `cells_title` object
  cells <- list(groups = group_expr)

  # Apply the `cells_title` and
  # `location_cells` classes
  class(cells) <- c("cells_title", "location_cells")

  cells
}

#' @rdname location_cells
#' @import rlang
#' @export
cells_column_labels <- function(columns, groups) {

  if (
    (!missing(columns) && !missing(groups)) ||
    (missing(columns) && missing(groups))
  ) {
    stop("Value(s) must provided to either `columns` or `groups` but not both.")
  }

  # With input as `columns`
  if (!missing(columns)) {

    # Capture expression for the `columns` argument
    col_expr <- rlang::enquo(columns)
    group_expr <- NULL
  }

  # With input as `groups`
  if (!missing(groups)) {

    # Capture expression for the `groups` argument
    col_expr <- NULL
    group_expr <- rlang::enquo(groups)
  }

  # Create the `cells_column_labels` object
  structure(
    list(columns = col_expr, groups = group_expr),
    class = c("cells_column_labels", "location_cells"))
}

#' @rdname location_cells
#' @import rlang
#' @export
cells_group <- function(groups) {

  # Capture expression for the `groups` argument
  group_expr <- rlang::enquo(groups)

  # Create the `cells_group` object
  cells <- list(groups = group_expr)

  # Apply the `cells_group` and `location_cells` classes
  class(cells) <- c("cells_group", "location_cells")

  cells
}

#' @rdname location_cells
#' @import rlang
#' @export
cells_stub <- function(rows = NULL) {

  if (is.null(rows)) {
    rows <- TRUE
  }

  # Capture expression for the `rows` argument
  row_expr <- rlang::enquo(rows)

  # Create the `cells_stub` object
  cells <- list(rows = row_expr)

  # Apply the `cells_stub` and `location_cells` classes
  class(cells) <- c("cells_stub", "location_cells")

  cells
}

#' @rdname location_cells
#' @import rlang
#' @export
cells_data <- function(columns = NULL, # set default to TRUE
                       rows = NULL# set default to TRUE
                       #TODO: groups = NULL
                       ) {

  # Capture expressions for the `columns` and `rows` arguments
  col_expr <- rlang::enquo(columns)
  row_expr <- rlang::enquo(rows)

  # Create the `cells_data` object
  cells <-
    list(
      columns = col_expr,
      rows = row_expr)

  # Apply the `cells_data` and `location_cells` classes
  class(cells) <- c("cells_data", "location_cells")

  cells
}

#' @rdname location_cells
#' @import rlang
#' @export
cells_summary <- function(groups = NULL,
                          columns = NULL,
                          rows = NULL) {

  # Capture expressions for the `groups`,
  # `columns`, and `rows` arguments
  group_expr <- rlang::enquo(groups)
  col_expr <- rlang::enquo(columns)
  row_expr <- rlang::enquo(rows)

  # Create the `cells_summary` object
  cells <-
    list(
      groups = group_expr,
      columns = col_expr,
      rows = row_expr)

  # Apply the `cells_summary` and `location_cells` classes
  class(cells) <- c("cells_summary", "location_cells")

  cells
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
#'     tab_stubhead_label(
#'       label = md("car *make* and *model*"))
#' @family helper functions
#' @export
md <- function(text) {

  # Apply the `from_markdown` class
  class(text) <- "from_markdown"
  text
}

#' Interpret input text as HTML-formatted text
#' @param text,... the text that is understood to be HTML text, which is to be
#'   preserved.
#' @return a character object that is tagged as an HTML fragment that is not to
#'   be sanitized.
#' @return a character object of class \code{html}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and add a caption
#' # that is to interpreted as HTML
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_stubhead_label(
#'       label = html(
#'         "car <em>make</em> and <em>model</em>"))
#' @family helper functions
#' @importFrom htmltools HTML
#' @export
html <- function(text, ...) {

  htmltools::HTML(text, ...)
}

is.html <- function(x) {

  if (inherits(x, "html")) {
    isTRUE(attr(x, "html"))
  } else {
    FALSE
  }
}

#' Helper for defining custom styles for table cells
#'
#' This helper function is to be used with the \code{\link{tab_style}()}
#' function, which itself allows for the setting of custom styles to one or more
#' cells. We can also define several styles with a single call of
#' \code{cells_styles} and \code{\link{tab_style}()} will reliably process that.
#' @param bkgd_color the background color of the cell.
#' @param text_color the text color.
#' @param text_font the font or collection of fonts (subsequent font names are)
#'   used as fallbacks.
#' @param text_size the size of the font. Can either
#' @param text_style the text style. Can be one of either \code{"center"},
#'   \code{"normal"}, \code{"italic"}, or \code{"oblique"}.
#' @param text_weight the weight of the font. Can be a text-based keyword such
#'   as \code{"normal"}, \code{"bold"}, \code{"lighter"}, \code{"bolder"}, or, a
#'   numeric value between \code{1} and \code{1000}, inclusive. Note that only
#'   variable fonts may support the numeric mapping of weight.
#' @param text_align the text alignment. Can be one of either \code{"center"},
#'   \code{"left"}, \code{"right"}, or \code{"justify"}.
#' @param text_stretch allows for text to either be condensed or expanded. We
#'   can use the following text-based keywords to describe the degree of
#'   condensation/expansion: \code{ultra-condensed}, \code{extra-condensed},
#'   \code{condensed}, \code{semi-condensed}, \code{normal},
#'   \code{semi-expanded}, \code{expanded}, \code{extra-expanded}, and
#'   \code{ultra-expanded}. Alternatively, we can supply percentage values from
#'   \code{0\%} to \code{200\%}, inclusive. Negative percentage values are not
#'   allowed.
#' @param text_indent the indentation of the text.
#' @param text_decorate allows for text decoration effect to be applied. Here,
#'   we can use \code{"overline"}, \code{"line-through"}, or \code{"underline"}.
#' @param text_transform allows for the transformation of text. Options are
#'   \code{"uppercase"}, \code{"lowercase"}, or \code{"capitalize"}.
#' @return a character vector containing formatted styles.
#' @family helper functions
#' @export
cells_styles <- function(bkgd_color = NULL,
                         text_color = NULL,
                         text_font = NULL,
                         text_size = NULL,
                         text_align = NULL,
                         text_style = NULL,
                         text_weight = NULL,
                         text_stretch = NULL,
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

  if (!is.null(text_size)) {
    styles <- c(styles, paste0("font-size:", text_size, ";"))
  }

  if (!is.null(text_align)) {

    if (text_align %in% c("center", "left", "right", "justify")) {
      styles <- c(styles, paste0("text-align:", text_align, ";"))
    }
  }

  if (!is.null(text_style)) {

    if (text_style %in% c("normal", "italic", "oblique")) {
      styles <- c(styles, paste0("font-style:", text_style, ";"))
    }
  }

  if (!is.null(text_weight)) {
    if (text_weight %in% c("normal", "bold", "lighter", "bolder") ||
        text_weight >= 1 & text_weight <= 1000)
    styles <- c(styles, paste0("font-weight:", text_weight, ";"))
  }

  if (!is.null(text_stretch)) {
    if (text_stretch %in% c(
      "ultra-condensed", "extra-condensed", "condensed", "semi-condensed", "normal",
      "semi-expanded", "expanded", "extra-expanded", "ultra-expanded") ||
        text_stretch >= 0 & text_stretch <= 200)
      styles <- c(styles, paste0("font-stretch:", text_stretch, ";"))
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

    if (text_transform %in% c("uppercase", "lowercase", "capitalize")) {
      styles <- c(styles, paste0("text-transform:", text_transform, ";"))
    }
  }

  paste(styles, collapse = "")
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

#' Perform LaTeX escaping
#'
#' Text may contain several characters with special meanings in LaTeX. This
#' function will transform a character vector so that it is safe to use within
#' LaTeX tables.
#' @param text a character vector containing the text that is to be
#'   LaTeX-escaped.
#' @family helper functions
#' @export
escape_latex <- function(text) {

  text %>%
    tidy_gsub("\\\\", "\\\\textbackslash ") %>%
    tidy_gsub("([&%$#_{}])", "\\\\\\1") %>%
    tidy_gsub("~", "\\\\textasciitilde ") %>%
    tidy_gsub("\\^", "\\\\textasciicircum ")
}
