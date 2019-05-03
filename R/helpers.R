#' Helpers for targeting multiple cells in different locations
#'
#' These helper functions are used to target individual cells in different
#' locations (e.g., the stub, the column labels, the title, etc.). They can be
#' used in any of these functions (which all have a `locations` argument):
#' [tab_footnote()], [tab_style()], and [text_transform()] Furthermore, multiple
#' locations can be targeted by enclosing several `cells_*()` helper functions
#' in a list.
#'
#' The following helper functions can be used to target cells (roughly in order
#' from the top to the bottom of a table):
#'
#' \itemize{
#'
#' \item `cells_title()`: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#'
#' \item `cells_column_labels()`: targets labels in the column labels (the
#' `columns` argument) or the spanner column labels (the `groups`
#' argument) in the table's column labels part.
#'
#' \item `cells_group()`: targets the row group labels in any available
#' row groups using the `groups` argument.
#'
#' \item `cells_stub()`: targets row labels in the table stub using the
#' `rows` argument.
#'
#' \item `cells_data()`: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#'
#' \item `cells_summary()`: targets summary cells in the table body using
#' the `groups` argument and intersections of `columns` and
#' `rows`.
#' }
#'
#' @param columns,rows,groups Either a vector of names, a vector of indices,
#'   values provided by [vars()], values provided by `c()`, or a select helper
#'   function (see Details for information on these functions).
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
#'     style = cells_styles(
#'       bkgd_color = "darkblue",
#'       text_color = "white"),
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
#'     style = cells_styles(
#'       text_style = "italic",
#'       bkgd_color = "lightblue"),
#'     locations = cells_summary(
#'       groups = "1960s",
#'       columns = vars(population),
#'       rows = 1)
#'   ) %>%
#'   tab_style(
#'     style = cells_styles(
#'       text_style = "italic",
#'       bkgd_color = "lightgreen"),
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
#' @return a list object of class `location_cells`.
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

#' @rdname location_cells
#' @import rlang
#' @export
cells_grand_summary <- function(columns = NULL,
                                rows = NULL) {

  # Capture expressions for the `columns`
  # and `rows` arguments
  col_expr <- rlang::enquo(columns)
  row_expr <- rlang::enquo(rows)

  # Create the `cells_grand_summary` object
  cells <-
    list(
      columns = col_expr,
      rows = row_expr)

  # Apply the `cells_grand_summary` and
  # `location_cells` classes
  class(cells) <- c("cells_grand_summary", "location_cells")

  cells
}

#' Interpret input text as Markdown-formatted text
#'
#' @param text The text that is understood to contain Markdown formatting.
#' @return A character object that is tagged for a Markdown-to-HTML
#'   transformation.
#' @return a character object of class `from_markdown`.
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
#' @param text,... The text that is understood to be HTML text, which is to be
#'   preserved.
#' @return A character object that is tagged as an HTML fragment that is not to
#'   be sanitized.
#' @return a character object of class `html`.
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


#' Supply a custom currency symbol to `fmt_currency()`
#'
#' The `currency()` helper function makes it easy to specify a context-aware
#' currency symbol to `currency` argument of [fmt_currency()]. Since \pkg{gt}
#' can render tables to several output formats, `currency()` allows for
#' different variations of the custom symbol based on the output context (which
#' are `html`, `latex`, `rtf`, and `default`). The number of decimal places for
#' the custom currency defaults to `2`, however, a value set for the `decimals`
#' argument of [fmt_currency()] will take precedence.
#'
#' We can use any combination of `html`, `latex`, `rtf`, and `default` as named
#' arguments for the currency text in each of the namesake contexts. The
#' `default` value is used as a fallback when there doesn't exist a dedicated
#' currency text value for a particular output context (e.g., when a table is
#' rendered as HTML and we use `currency(latex = "LTC", default = "ltc")`, the
#' currency symbol will be `"ltc"`. For convenience, if we provide only a single
#' string without a name, it will be taken as the `default` (i.e.,
#' `currency("ltc")` is equivalent to `currency(default = "ltc")`). However, if
#' we were to specify currency strings for muliple output contexts, names are
#' required each and every context.
#'
#' @param ... One or more named arguments using output contexts as the names and
#'   currency symbol text as the values.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#' @return a list object of class `gt_currency`.
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `currency` column to have
#' # currency values in guilder (a defunct
#' # Dutch currency)
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_currency(
#'     columns = vars(currency),
#'     currency = currency(
#'       html = "&fnof;",
#'       default = "f"),
#'     decimals = 2
#'   )
#' @export
currency <- function(...,
                     .list = list2(...)) {

  # Collect a named list of currencies
  currency_list <- .list

  # Stop function if the currency list contains no values
  if (length(currency_list) == 0) {
    stop("The `currency()` function must be provided with currency symbols.",
         call. = FALSE)
  }

  # If only a single string is provided, upgrade the `currency_list`
  # to have that string be the `default` value
  if (length(currency_list) == 1 && !rlang::is_named(currency_list)) {
    currency_list <- list(default = currency_list[[1]])
  }

  # Stop function if `currency_list` isn't entirely named
  if (!rlang::is_named(currency_list)) {
    stop("Names must be provided for all output contexts.",
         call. = FALSE)
  }

  # Stop function if all names are not part of the supported contexts
  validate_contexts(contexts = names(currency_list))

  # Stop function if there are duplicated names
  if (!rlang::is_dictionaryish(currency_list)) {
    stop("There cannot be any duplicate names for output contexts.",
         call. = FALSE)
  }

  # Set the `gt_currency` class
  class(currency_list) <- "gt_currency"

  currency_list
}

#' Helper for defining custom styles for table cells
#'
#' This helper function is to be used with the [tab_style()] function, which
#' itself allows for the setting of custom styles to one or more cells. We can
#' also define several styles within a single call of `cells_styles` and
#' [tab_style()] will reliably apply those styles to the targeted element.
#'
#' @param bkgd_color The background color of the cell.
#' @param text_color The text color.
#' @param text_font The font or collection of fonts (subsequent font names are)
#'   used as fallbacks.
#' @param text_size The size of the font. Can be provided as a number that is
#'   assumed to represent `px` values (or could be wrapped in the [px()]) helper
#'   function. We can also use one of the following absolute size keywords:
#'   `xx-small`, `x-small`, `small`, `medium`, `large`, `x-large`, or
#'   `xx-large`.
#' @param text_style The text style. Can be one of either `"center"`,
#'   `"normal"`, `"italic"`, or `"oblique"`.
#' @param text_weight The weight of the font. Can be a text-based keyword such
#'   as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value
#'   between `1` and `1000`, inclusive. Note that only variable fonts may
#'   support the numeric mapping of weight.
#' @param text_align The text alignment. Can be one of either `"center"`,
#'   `"left"`, `"right"`, or `"justify"`.
#' @param text_stretch Allows for text to either be condensed or expanded. We
#'   can use the following text-based keywords to describe the degree of
#'   condensation/expansion: `ultra-condensed`, `extra-condensed`, `condensed`,
#'   `semi-condensed`, `normal`, `semi-expanded`, `expanded`, `extra-expanded`,
#'   and `ultra-expanded`. Alternatively, we can supply percentage values from
#'   `0\%` to `200\%`, inclusive. Negative percentage values are not allowed.
#' @param text_indent The indentation of the text.
#' @param text_decorate Allows for text decoration effect to be applied. Here,
#'   we can use `"overline"`, `"line-through"`, or `"underline"`.
#' @param text_transform Allows for the transformation of text. Options are
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"`.
#' @return A character vector containing formatted styles.
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
#'   [tab_options()] arguments that can take percentage values
#'   (e.g., `table.width`).
#' @family helper functions
#' @export
pct <- function(x) {

  if (!inherits(x, "numeric")) {
    stop("The supplied value must be numeric", call. = FALSE)
  }

  paste0(x, "%")
}

#' Helper for providing a numeric value as pixels value
#' @param x the numeric value to format as a string (e.g., `"12px"`) for
#'   some [tab_options()] arguments that can take values as units of
#'   pixels (e.g., `table.font.size`).
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
#' `gt_latex_dependencies()` function provides an object that can be
#' used to provide the LaTeX in an Rnw file, allowing \pkg{gt} tables to work
#' and not yield errors due to missing packages.
#'
#' Here is an example Rnw document that shows how the
#' `gt_latex_dependencies()` can be used in conjunction with a \pkg{gt}
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
