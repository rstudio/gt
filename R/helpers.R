#' Helpers for targeting multiple cells in different locations
#'
#' These helper functions are used to target individual cells in different
#' locations (e.g., the stub, the column labels, the title, etc.). They can be
#' used in any of these functions (which all have a \code{locations} argument):
#' \code{\link{tab_footnote}()}, \code{\link{tab_style}()}, and
#' \code{\link{text_transform}()} Furthermore, multiple locations can be
#' targeted by enclosing several \code{cells_*()} helper functions in a list.
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
#' \item \code{cells_data()}: targets data cells in the table body using
#' intersections of \code{columns} and \code{rows}.
#'
#' \item \code{cells_summary()}: targets summary cells in the table body using
#' the \code{groups} argument and intersections of \code{columns} and
#' \code{rows}.
#' }
#'
#' @param columns,rows,groups either a vector of names, a vector of
#'   indices, values provided by \code{\link{vars}()}, values provided by
#'   \code{c()}, or a select helper function (see Details for information on
#'   these functions).
#'
#' @examples
#' # Use `sp500` to create a gt table; add
#' # a header (with a title and a subtitle),
#' # and then add a footnote to the subtitle
#' # with `tab_footnote()` and `cells_title()`
#' # in `locations`
#' tab_1 <-
#'   sp500 %>%
#'   dplyr::filter(
#'     date >= "2015-01-05" &
#'       date <="2015-01-10"
#'   ) %>%
#'   dplyr::select(
#'     -c(adj_close, volume, high, low)
#'   ) %>%
#'   gt() %>%
#'   tab_header(
#'     title = "S&P 500",
#'     subtitle = "Open and Close Values"
#'   ) %>%
#'   tab_footnote(
#'     footnote = "All values in USD.",
#'     locations = cells_title(
#'       groups = "subtitle")
#'   )
#'
#' # Use `sza` to create a gt table; add a
#' # header and then add footnotes to the
#' # column labels with `tab_footnote()` and
#' # `cells_column_labels()` in `locations`
#' tab_2 <-
#'   sza %>%
#'   dplyr::filter(
#'     latitude == 20 & month == "jan" &
#'       !is.na(sza)
#'   ) %>%
#'   dplyr::select(-latitude, -month) %>%
#'   gt() %>%
#'   tab_footnote(
#'     footnote = "True solar time.",
#'     locations = cells_column_labels(
#'       columns = vars(tst))
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_labels(
#'       columns = vars(sza))
#'   )
#'
#' # Use `pizzaplace` to create a gt table
#' # with grouped data; add a summary with the
#' # `summary_rows()` function and then add a
#' # footnote to the "peppr_salami" row group
#' # label with `tab_footnote()` and with
#' # `cells_group()` in `locations`
#' tab_3 <-
#'   pizzaplace %>%
#'   dplyr::filter(
#'     name %in% c("soppressata", "peppr_salami")
#'   ) %>%
#'   dplyr::group_by(name, size) %>%
#'   dplyr::summarize(
#'     `Pizzas Sold` = n()
#'   ) %>%
#'   gt(rowname_col = "size") %>%
#'   summary_rows(
#'     groups = TRUE,
#'     columns = vars("Pizzas Sold"),
#'     fns = list(TOTAL = "sum"),
#'     formatter = fmt_number,
#'     decimals = 0,
#'     use_seps = TRUE
#'   ) %>%
#'   tab_footnote(
#'     footnote = "The Pepper-Salami.",
#'     cells_group(groups = "peppr_salami")
#'   )
#'
#' # Use `sza` to create a gt table; color
#' # all of the `month` values in the table
#' # stub with `tab_style()`, using `cells_stub()`
#' # in `locations` (`rows = TRUE` targets
#' # all stub rows)
#' tab_4 <-
#'   sza %>%
#'   dplyr::filter(
#'     latitude == 20 & tst <= "1000") %>%
#'   dplyr::select(-latitude) %>%
#'   dplyr::filter(!is.na(sza)) %>%
#'   tidyr::spread(key = "tst", value = sza) %>%
#'   gt(rowname_col = "month") %>%
#'   fmt_missing(
#'     columns = TRUE,
#'     missing_text = ""
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "darkblue"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_stub(rows = TRUE)
#'   )
#'
#' # Use `gtcars` to create a gt table; add
#' # a footnote that targets a single data cell
#' # with `tab_footnote()`, using `cells_data()`
#' # in `locations` (`rows = hp == max(hp)` will
#' # target a single row in the `hp` column)
#' tab_5 <-
#'   gtcars %>%
#'   dplyr::filter(ctry_origin == "United Kingdom") %>%
#'   dplyr::select(mfr, model, year, hp) %>%
#'   gt() %>%
#'   tab_options(footnote.glyph = "*") %>%
#'   tab_footnote(
#'     footnote = "Highest horsepower.",
#'     locations = cells_data(
#'       columns = vars(hp),
#'       rows = hp == max(hp))
#'   )
#'
#' # Use `countrypops` to create a gt table; add
#' # some styling to the summary data cells with
#' # with `tab_style()`, using `cells_summary()`
#' # in `locations`
#' tab_6 <-
#'   countrypops %>%
#'   dplyr::filter(
#'     country_name == "Japan",
#'     year < 1970) %>%
#'   dplyr::select(-contains("country")) %>%
#'   dplyr::mutate(
#'     decade = paste0(substr(year, 1, 3), "0s")
#'   ) %>%
#'   dplyr::group_by(decade) %>%
#'   gt(
#'     rowname_col = "year",
#'     groupname_col = "decade"
#'   ) %>%
#'   fmt_number(
#'     columns = vars(population),
#'     decimals = 0
#'   ) %>%
#'   summary_rows(
#'     groups = "1960s",
#'     columns = vars(population),
#'     fns = list("min", "max"),
#'     formatter = fmt_number,
#'     decimals = 0
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightblue")
#'       ),
#'     locations = cells_summary(
#'       groups = "1960s",
#'       columns = vars(population),
#'       rows = 1)
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightgreen")
#'       ),
#'     locations = cells_summary(
#'       groups = "1960s",
#'       columns = vars(population),
#'       rows = 2)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_location_cells_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_location_cells_2.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_location_cells_3.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_location_cells_4.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_location_cells_5.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_location_cells_6.svg}{options: width=100\%}}
#'
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
#' # Use `exibble` to create a gt table;
#' # when adding a title, use the `md()`
#' # helper to use Markdown formatting
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(currency, char) %>%
#'   gt() %>%
#'   tab_header(
#'     title = md("Using *Markdown*"))
#'
#' @section Figures:
#' \if{html}{\figure{man_md_1.svg}{options: width=100\%}}
#'
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
#' # Use `exibble` to create a gt table;
#' # when adding a title, use the `html()`
#' # helper to use html formatting
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(currency, char) %>%
#'   gt() %>%
#'   tab_header(
#'     title = html("<em>HTML</em>"))
#'
#' @section Figures:
#' \if{html}{\figure{man_html_1.svg}{options: width=100\%}}
#'
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

#' Helper for defining custom text styles for table cells
#'
#' This helper function is to be used with the \code{\link{tab_style}()}
#' function, which itself allows for the setting of custom styles to one or more
#' cells. We can also define several styles within a single call of
#' \code{cell_text()} and \code{\link{tab_style}()} will reliably apply those
#' styles to the targeted element.
#'
#' @param color The text color.
#' @param font The font or collection of fonts (subsequent font names are)
#'   used as fallbacks.
#' @param size The size of the font. Can be provided as a number that is
#'   assumed to represent \code{px} values (or could be wrapped in the
#'   \code{\link{px}()}) helper function. We can also use one of the following
#'   absolute size keywords: \code{xx-small}, \code{x-small}, \code{small},
#'   \code{medium}, \code{large}, \code{x-large}, or \code{xx-large}.
#' @param style The text style. Can be one of either \code{"center"},
#'   \code{"normal"}, \code{"italic"}, or \code{"oblique"}.
#' @param weight The weight of the font. Can be a text-based keyword such
#'   as \code{"normal"}, \code{"bold"}, \code{"lighter"}, \code{"bolder"}, or, a
#'   numeric value between \code{1} and \code{1000}, inclusive. Note that only
#'   variable fonts may support the numeric mapping of weight.
#' @param align The text alignment. Can be one of either \code{"center"},
#'   \code{"left"}, \code{"right"}, or \code{"justify"}.
#' @param stretch Allows for text to either be condensed or expanded. We
#'   can use the following text-based keywords to describe the degree of
#'   condensation/expansion: \code{ultra-condensed}, \code{extra-condensed},
#'   \code{condensed}, \code{semi-condensed}, \code{normal},
#'   \code{semi-expanded}, \code{expanded}, \code{extra-expanded}, and
#'   \code{ultra-expanded}. Alternatively, we can supply percentage values from
#'   \code{0\%} to \code{200\%}, inclusive. Negative percentage values are not
#'   allowed.
#' @param indent The indentation of the text.
#' @param decorate allows for text decoration effect to be applied. Here,
#'   we can use \code{"overline"}, \code{"line-through"}, or \code{"underline"}.
#' @param transform Allows for the transformation of text. Options are
#'   \code{"uppercase"}, \code{"lowercase"}, or \code{"capitalize"}.
#'
#' @return a character vector containing formatted styles.
#' @family helper functions
#' @export
cell_text <- function(color = NULL,
                      font = NULL,
                      size = NULL,
                      align = NULL,
                      style = NULL,
                      weight = NULL,
                      stretch = NULL,
                      indent = NULL,
                      decorate = NULL,
                      transform = NULL) {

  styles <- c()

  if (!is.null(color)) {
    styles <- c(styles, paste0("color:", color, ";"))
  }

  if (!is.null(font)) {
    styles <- c(styles, paste0("font-family:", font, ";"))
  }

  if (!is.null(size)) {
    styles <- c(styles, paste0("font-size:", size, ";"))
  }

  if (!is.null(align)) {

    if (align %in% c("center", "left", "right", "justify")) {
      styles <- c(styles, paste0("text-align:", align, ";"))
    }
  }

  if (!is.null(style)) {

    if (style %in% c("normal", "italic", "oblique")) {
      styles <- c(styles, paste0("font-style:", style, ";"))
    }
  }

  if (!is.null(weight)) {
    if (weight %in% c("normal", "bold", "lighter", "bolder") ||
        weight >= 1 & weight <= 1000)
    styles <- c(styles, paste0("font-weight:", weight, ";"))
  }

  if (!is.null(stretch)) {
    if (stretch %in% c(
      "ultra-condensed", "extra-condensed", "condensed", "semi-condensed", "normal",
      "semi-expanded", "expanded", "extra-expanded", "ultra-expanded") ||
        stretch >= 0 & stretch <= 200)
      styles <- c(styles, paste0("font-stretch:", stretch, ";"))
  }

  if (!is.null(indent)) {
    styles <- c(styles, paste0("text-indent:", indent, ";"))
  }

  if (!is.null(decorate)) {

    if (decorate %in% c("overline", "line-through",
                             "underline", "underline overline")) {
      styles <- c(styles, paste0("text-decoration:", decorate, ";"))
    }
  }

  if (!is.null(transform)) {

    if (transform %in% c("uppercase", "lowercase", "capitalize")) {
      styles <- c(styles, paste0("text-transform:", transform, ";"))
    }
  }

  paste(styles, collapse = "")
}


#' Helper for defining custom fills for table cells
#'
#' The \code{cell_fill()} helper function is to be used with the
#' \code{\link{tab_style}()} function, which itself allows for the setting of
#' custom styles to one or more cells. Specifically, the call to
#' \code{cell_fill()} should be bound to the \code{styles} argument of
#' \code{\link{tab_style}()}.
#'
#' @param color The fill color. If nothing is provided, then \code{#D3D3D3}
#'   (light gray) will be used as a default.
#'
#' @return a character vector containing formatted styles.
#' @family helper functions
#' @export
cell_fill <- function(color = NULL) {

  fill <- c()

  if (!is.null(color)) {
    fill <- c(fill, paste0("background-color:", color, ";"))
  }

  paste(fill, collapse = "")
}


#' Helper for defining custom borders for table cells
#'
#' The \code{cell_borders()} helper function is to be used with the
#' \code{\link{tab_style}()} function, which itself allows for the setting of
#' custom styles to one or more cells. Specifically, the call to
#' \code{cell_borders()} should be bound to the \code{styles} argument of
#' \code{\link{tab_style}()}. The \code{selection} argument is where we define
#' which borders should be modified (e.g., \code{left} and \code{right}
#' borders). With that selection, the \code{color}, \code{style}, and
#' \code{weight} of the selected borders can then be modified.
#'
#' @param selection The selection of borders to be modified. Options include
#'   \code{"left"}, \code{"right"}, \code{"top"}, and \code{"bottom"}. For all
#'   borders surrounding the selected cells, we can use the \code{"all"} option.
#' @param color The border color. If nothing is provided, then \code{#000000}
#'   (black) will be used as a default.
#' @param style The border style. Can be one of either \code{"solid"} (the
#'   default), \code{"dashed"}, or \code{"dotted"}. If nothing is provided, then
#'   \code{"solid"} will be used as a default.
#' @param weight The weight of the border lines. If nothing is provided, then
#'   \code{"1px"} will be used as a default.
#'
#' @return a character vector containing formatted styles.
#' @family helper functions
#' @export
cell_borders <- function(selection,
                         color = NULL,
                         style = NULL,
                         weight = NULL) {

  if (!any(selection %in% c(
    "left", "l", "[",
    "right", "r", "]",
    "top", "t", "^",
    "bottom", "b", "_",
    # "center", "c", "|",
    # "middle", "mid", "m", "-",
    # "inside", "i", "+",
    # "outside", "outline", "o",
    "all", "everything", "a"
  ))) {
    stop("Selection elements for `cell_borders()` must be any of the following:\n",
         " * left (or: `l`, `[`)\n",
         " * right (or: `r`, `]`)\n",
         " * top (or: `t`, `^`)\n",
         " * bottom (or: `b`, `_`)\n",
         " * all (or: `a`, `everything`",
         call. = FALSE)
  }

  # Resolve the selection of borders into a vector of
  # standardized directions
  dir_ <-
    vapply(
      selection, resolve_selection,
      FUN.VALUE = character(1), USE.NAMES = FALSE) %>%
    unique()

  # Should the `all` selection appear in the `dir_`
  # vector, replace with all possible selections
  if ("all" %in% dir_) {
    dir_ <- c("left", "right", "top", "bottom")
  }

  if (!is.null(color)) {
    c <- color
  } else {
    c <- "#000000"
  }

  if (!is.null(style)) {

    if (style %in% c("solid", "dashed", "dotted")) {
      s <- style
    } else {
      stop("The border `style` must be one of the following:\n",
           " * solid\n",
           " * dashed\n",
           " * dotted",
           call. = FALSE)
    }
  } else {
    s <- "solid"
  }

  if (!is.null(weight)) {
    w <- weight
  } else {
    w <- "1px"
  }


  # For each of the selections, create border rules
  border_rules <-
    glue::glue(
      "border-{dir_}-style:{s};border-{dir_}-color:{c};border-{dir_}-width:{w};"
    ) %>% as.character() %>% paste0(collapse = "")

  border_rules
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

#' Get the LaTeX dependencies required for a gt table
#'
#' When working with Rnw (Sweave) files or otherwise writing LaTeX code,
#' including a \pkg{gt} table can be problematic if we don't have knowledge
#' of the LaTeX dependencies. For the most part, these dependencies are the
#' LaTeX packages that are required for rendering a \pkg{gt} table. The
#' \code{gt_latex_dependencies()} function provides an object that can be
#' used to provide the LaTeX in an Rnw file, allowing \pkg{gt} tables to work
#' and not yield errors due to missing packages.
#'
#' Here is an example Rnw document that shows how the
#' \code{gt_latex_dependencies()} can be used in conjunction with a \pkg{gt}
#' table:
#'
#' \preformatted{
#' \%!sweave=knitr
#'
#' \documentclass{article}
#'
#' <<echo=FALSE>>=
#' library(gt)
#'  @
#'
#' <<results='asis', echo=FALSE>>=
#' gt_latex_dependencies()
#'  @
#'
#' \begin{document}
#'
#' <<results='asis', echo=FALSE>>=
#' exibble %>% gt()
#'  @
#'
#' \end{document}
#' }
#' @family helper functions
#' @export
gt_latex_dependencies <- function() {

  if (requireNamespace("knitr", quietly = TRUE)) {

    paste(
      "",
      "% gt packages",
      paste0("\\usepackage{", latex_packages(), "}", collapse = "\n"),
      "",
      sep = "\n"
    ) %>%
      knitr::asis_output()

  } else {
    stop("The `knitr` package is required for getting the LaTeX dependency headers.",
         call. = FALSE)
  }
}
