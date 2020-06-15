#' Interpret input text as Markdown-formatted text
#'
#' Markdown! It's a wonderful thing. We can use it in certain places (e.g.,
#' footnotes, source notes, the table title, etc.) and expect it to render to
#' HTML as Markdown does. There is the [html()] helper that allows you to ferry
#' in HTML but this function `md()`... it's almost like a two-for-one deal (you
#' get to use Markdown plus any HTML fragments *at the same time*).
#'
#' @param text The text that is understood to contain Markdown formatting.
#'
#' @return A character object of class `from_markdown`. It's tagged as being
#'   Markdown text and it will undergo conversion to HTML.
#'
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
#' \if{html}{\figure{man_md_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-1
#'
#' @export
md <- function(text) {

  # if (text %>% tidy_grepl("\\.\\.[a-zA-Z0-9]*?\\.\\.")) {
  #   text %>% tidy_gsub(pattern = "\\.\\.[a-zA-Z0-9]*?\\.\\.", "")
  # }

  # Apply the `from_markdown` class
  class(text) <- "from_markdown"
  text
}

#' Interpret input text as HTML-formatted text
#'
#' For certain pieces of text (like in column labels or table headings) we may
#' want to express them as raw HTML. In fact, with HTML, anything goes so it can
#' be much more than just text. The `html()` function will guard the input HTML
#' against escaping, so, your HTML tags will come through as HTML when
#' rendered... to HTML.
#'
#' @param text,... The text that is understood to be HTML text, which is to be
#'   preserved.
#'
#' @return A character object of class `html`. It's tagged as an HTML fragment
#'   that is not to be sanitized.
#'
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
#' \if{html}{\figure{man_html_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-2
#'
#' @export
html <- function(text, ...) {

  htmltools::HTML(text, ...)
}

#' Does an object have the `html` class?
#'
#' @noRd
is_html <- function(x) {
  inherits(x, "html") && isTRUE(attr(x, "html"))
}

#' Helper for providing a numeric value as pixels value
#'
#' For certain parameters, a length value is required. Examples include the
#' setting of font sizes (e.g., in [cell_text()]) and thicknesses of lines
#' (e.g., in [cell_borders()]). Setting a length in pixels with `px()` allows
#' for an absolute definition of size as opposed to the analogous helper
#' function [pct()].
#'
#' @param x the numeric value to format as a string (e.g., `"12px"`) for
#'   some [tab_options()] arguments that can take values as units of
#'   pixels (e.g., `table.font.size`).
#'
#' @return A character vector with a single value in pixel units.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # use the `px()` helper to define the
#' # font size for the column labels
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   tab_style(
#'     style = cell_text(size = px(20)),
#'     locations = cells_column_labels(columns = TRUE)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_px_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-3
#'
#' @export
px <- function(x) {

  if (mode(x) != "numeric") {
    stop("The supplied value must be numeric", call. = FALSE)
  }

  paste0(x, "px")
}

#' Helper for providing a numeric value as percentage
#'
#' A percentage value acts as a length value that is relative to an initial
#' state. For instance an 80 percent value for something will size the target
#' to 80 percent the size of its 'previous' value. This type of sizing is
#' useful for sizing up or down a length value with an intuitive measure. This
#' helper function can be used for the setting of font sizes (e.g., in
#' [cell_text()]) and altering the thicknesses of lines (e.g., in
#' [cell_borders()]). Should a more exact definition of size be required, the
#' analogous helper function [pct()] will be more useful.
#'
#' @param x the numeric value to format as a string percentage for some
#'   [tab_options()] arguments that can take percentage values
#'   (e.g., `table.width`).
#'
#' @return A character vector with a single value in percentage units.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # use the `pct()` helper to define the
#' # font size for the column labels
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   tab_style(
#'     style = cell_text(size = pct(75)),
#'     locations = cells_column_labels(columns = TRUE)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_pct_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-4
#'
#' @export
pct <- function(x) {

  if (mode(x) != "numeric") {
    stop("The supplied value must be numeric", call. = FALSE)
  }

  paste0(x, "%")
}

#' Location helper for targeting the table title and subtitle
#'
#' The `cells_title()` function is used to target the table title or subtitle
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param groups We can either specify `"title"` or `"subtitle"` to target the
#'   title element or the subtitle element.
#'
#' @return A list object of classes `cells_title` and `location_cells`.
#'
#' @examples
#' # Use `sp500` to create a gt table; add
#' # a header with a title, and then add a
#' # footnote to the title with `tab_footnote()`
#' # and `cells_title()` (in `locations`)
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
#'   tab_header(title = "S&P 500"
#'   ) %>%
#'   tab_footnote(
#'     footnote = "All values in USD.",
#'     locations = cells_title(groups = "title")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_title_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-5
#'
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

#' Location helper for targeting the table stubhead cell
#'
#' The `cells_stubhead()` function is used to target the table stubhead location
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @return A list object with the classes `cells_stubhead` and `location_cells`.
#'
#' @examples
#' # Use `pizzaplace` to create a gt table;
#' # add a stubhead label and then style it
#' # with `tab_style()` and `cells_stubhead()`
#' tab_1 <-
#'   pizzaplace %>%
#'   dplyr::mutate(month = as.numeric(substr(date, 6, 7))) %>%
#'   dplyr::group_by(month, type) %>%
#'   dplyr::summarize(sold = dplyr::n()) %>%
#'   dplyr::ungroup() %>%
#'   dplyr::filter(month %in% 1:2) %>%
#'   gt(rowname_col = "type") %>%
#'   tab_stubhead(label = "type") %>%
#'   tab_style(
#'     style = cell_fill(color = "lightblue"),
#'     locations = cells_stubhead()
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_stubhead_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-6
#'
#' @export
cells_stubhead <- function() {

  # Create the `cells_stubhead` object
  cells <- list(groups = "stubhead")

  # Apply the `cells_stubhead` and
  # `location_cells` classes
  class(cells) <- c("cells_stubhead", "location_cells")

  cells
}

#' Location helper for targeting the column spanners
#'
#' The `cells_column_spanners()` function is used to target the cells that
#' contain the table column spanners. This is useful when applying a footnote
#' with [tab_footnote()] or adding custom style with [tab_style()]. The function
#' is expressly used in each of those functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param spanners The names of the spanners that are to be targeted.
#'
#' @return A list object with the classes `cells_column_spanners` and
#' `location_cells`.
#'
#' @examples
#' # Use `exibble` to create a gt table; add a
#' # spanner column label over three column
#' # labels and then use `tab_style()` to make
#' # the spanner label text bold
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(-fctr, -currency, -group) %>%
#'   gt(rowname_col = "row") %>%
#'   tab_spanner(
#'     label = "dates and times",
#'     columns = vars(date, time, datetime)
#'   ) %>%
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_column_spanners(spanners = "dates and times")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_column_spanners_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-7
#'
#' @import rlang
#' @export
cells_column_spanners <- function(spanners) {

  # Capture expression for the `spanners` argument
  col_expr <- NULL
  spanners_expr <- rlang::enquo(spanners)

  # Create the `cells_column_spanners` object
  structure(
    list(spanners = spanners_expr),
    class = c("cells_column_spanners", "location_cells")
  )
}

#' Location helper for targeting the column labels
#'
#' The `cells_column_labels()` function is used to target the table's column
#' labels when applying a footnote with [tab_footnote()] or adding custom style
#' with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param columns The names of the column labels that are to be targeted.
#'
#' @return A list object with the classes `cells_column_labels` and
#' `location_cells`.
#'
#' @examples
#' # Use `sza` to create a gt table; add a
#' # header and then add footnotes to the
#' # column labels with `tab_footnote()` and
#' # `cells_column_labels()` in `locations`
#' tab_1 <-
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
#'       columns = vars(tst)
#'     )
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_labels(
#'       columns = vars(sza)
#'     )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_column_labels_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-8
#'
#' @import rlang
#' @export
cells_column_labels <- function(columns) {

  # Capture expression for the `columns` argument
  columns_expr <- rlang::enquo(columns)

  # Create the `cells_column_labels` object
  structure(
    list(columns = columns_expr),
    class = c("cells_column_labels", "location_cells")
  )
}

#' Location helper for targeting row groups
#'
#' The `cells_row_groups()` function is used to target the table's row groups
#' when applying a footnote with [tab_footnote()] or adding custom style with
#' [tab_style()]. The function is expressly used in each of those functions'
#' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param groups The names of the row groups that are to be targeted.
#'
#' @return A list object with the classes `cells_row_groups` and
#' `location_cells`.
#'
#' @examples
#' # Use `pizzaplace` to create a gt table
#' # with grouped data; add a summary with the
#' # `summary_rows()` function and then add a
#' # footnote to the "peppr_salami" row group
#' # label with `tab_footnote()` and with
#' # `cells_row_groups()` in `locations`
#' tab_1 <-
#'   pizzaplace %>%
#'   dplyr::filter(
#'     name %in% c("soppressata", "peppr_salami")
#'   ) %>%
#'   dplyr::group_by(name, size) %>%
#'   dplyr::summarize(
#'     `Pizzas Sold` = dplyr::n()
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
#'     cells_row_groups(groups = "peppr_salami")
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_row_groups_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-9
#'
#' @import rlang
#' @export
cells_row_groups <- function(groups = TRUE) {

  # Capture expression for the `groups` argument
  group_expr <- rlang::enquo(groups)

  # Create the `cells_row_groups` object
  cells <- list(groups = group_expr)

  # Apply the `cells_row_groups` and `location_cells` classes
  class(cells) <- c("cells_row_groups", "location_cells")

  cells
}

#' Location helper for targeting row groups (deprecated)
#'
#' @inheritParams cells_row_groups
#'
#' @export
cells_group <- function(groups = TRUE) {

  warning("The `cells_group()` function is deprecated and will soon be removed\n",
          " * Use the `cells_row_groups()` function instead",
          call. = FALSE)

  cells_row_groups(groups = {{groups}})
}

#' Location helper for targeting cells in the table stub
#'
#' The `cells_stub()` function is used to target the table's stub cells and it
#' is useful when applying a footnote with [tab_footnote()] or adding a custom
#' style with [tab_style()]. The function is expressly used in each of those
#' functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param rows The names of the rows that are to be targeted.
#'
#' @return A list object with the classes `cells_stub` and `location_cells`.
#'
#' @examples
#' library(tidyr)
#'
#' # Use `sza` to create a gt table; color
#' # all of the `month` values in the table
#' # stub with `tab_style()`, using `cells_stub()`
#' # in `locations` (`rows = TRUE` targets
#' # all stub rows)
#' tab_1 <-
#'   sza %>%
#'   dplyr::filter(latitude == 20 & tst <= "1000") %>%
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
#' @section Figures:
#' \if{html}{\figure{man_cells_stub_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-10
#'
#' @import rlang
#' @export
cells_stub <- function(rows = TRUE) {

  # Capture expression for the `rows` argument
  row_expr <- rlang::enquo(rows)

  # Create the `cells_stub` object
  cells <- list(rows = row_expr)

  # Apply the `cells_stub` and `location_cells` classes
  class(cells) <- c("cells_stub", "location_cells")

  cells
}

#' Location helper for targeting data cells in the table body
#'
#' The `cells_body()` function is used to target the data cells in the table
#' body. The function can be used to apply a footnote with [tab_footnote()], to
#' add custom styling with [tab_style()], or the transform the targeted cells
#' with [text_transform()]. The function is expressly used in each of those
#' functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param columns The names of the columns that are to be targeted.
#' @param rows The names of the rows that are to be targeted.
#'
#' @return A list object with the classes `cells_body` and `location_cells`.
#'
#' @examples
#' # Use `gtcars` to create a gt table; add
#' # a footnote that targets a single data cell
#' # with `tab_footnote()`, using `cells_body()`
#' # in `locations` (`rows = hp == max(hp)` will
#' # target a single row in the `hp` column)
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::filter(ctry_origin == "United Kingdom") %>%
#'   dplyr::select(mfr, model, year, hp) %>%
#'   gt() %>%
#'   tab_footnote(
#'     footnote = "Highest horsepower.",
#'     locations = cells_body(
#'       columns = vars(hp),
#'       rows = hp == max(hp))
#'   ) %>%
#'   opt_footnote_marks(marks = c("*", "+"))
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_body_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-11
#'
#' @import rlang
#' @export
cells_body <- function(columns = TRUE,
                       rows = TRUE) {

  # Capture expressions for the `columns` and `rows` arguments
  col_expr <- rlang::enquo(columns)
  row_expr <- rlang::enquo(rows)

  # Create the `cells_body` object
  cells <-
    list(
      columns = col_expr,
      rows = row_expr
    )

  # Apply the `cells_body` and `location_cells` classes
  class(cells) <- c("cells_body", "location_cells")

  cells
}

#' Location helper for targeting data cells in the table body (deprecated)
#'
#' @inheritParams cells_body
#'
#' @export
cells_data <- function(columns = TRUE,
                       rows = TRUE) {

  warning("The `cells_data()` function is deprecated and will soon be removed\n",
          " * Use the `cells_body()` function instead",
          call. = FALSE)

  cells_body(columns = {{columns}}, rows = {{rows}})
}

#' Location helper for targeting group summary cells
#'
#' The `cells_summary()` function is used to target the cells in a group summary
#' and it is useful when applying a footnote with [tab_footnote()] or adding a
#' custom style with [tab_style()]. The function is expressly used in each of
#' those functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param groups The names of the groups that the summary rows reside in.
#' @param columns The names of the columns that are to be targeted.
#' @param rows The names of the rows that are to be targeted.
#'
#' @return A list object with the classes `cells_summary` and `location_cells`.
#'
#' @examples
#' # Use `countrypops` to create a gt table; add
#' # some styling to the summary data cells with
#' # with `tab_style()`, using `cells_summary()`
#' # in `locations`
#' tab_1 <-
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
#' \if{html}{\figure{man_cells_summary_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-12
#'
#' @import rlang
#' @export
cells_summary <- function(groups = TRUE,
                          columns = TRUE,
                          rows = TRUE) {

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
      rows = row_expr
    )

  # Apply the `cells_summary` and `location_cells` classes
  class(cells) <- c("cells_summary", "location_cells")

  cells
}

#' Location helper for targeting cells in a grand summary
#'
#' The `cells_grand_summary()` function is used to target the cells in a grand
#' summary and it is useful when applying a footnote with [tab_footnote()] or
#' adding custom styles with [tab_style()]. The function is expressly used in
#' each of those functions' `locations` argument.
#'
#' When using any of the location helper functions with an appropriate function
#' that has a `locations` argument, multiple locations can be targeted by
#' enclosing several `cells_*()` helper functions in a `list()`. The following
#' helper functions can be used to target cells (roughly in order from the top
#' to the bottom of a table):
#' \itemize{
#' \item [cells_title()]: targets the table title or the table subtitle
#' depending on the value given to the `groups` argument (`"title"` or
#' `"subtitle"`).
#' \item [cells_stubhead()]: targets the stubhead location, a cell of which is
#' only available when there is a stub; a label in that location can be created
#' by using the [tab_stubhead()] function.
#' \item [cells_column_spanners()]: targets the spanner column labels, which
#' appear above the column labels.
#' \item [cells_column_labels()]: targets the column labels.
#' \item [cells_row_groups()]: targets the row group labels in any available row
#' groups using the `groups` argument.
#' \item [cells_stub()]: targets row labels in the table stub using the `rows`
#' argument.
#' \item [cells_body()]: targets data cells in the table body using
#' intersections of `columns` and `rows`.
#' \item [cells_summary()]: targets summary cells in the table body using the
#' `groups` argument and intersections of `columns` and `rows`.
#' \item [cells_grand_summary()]: targets cells of the table's grand summary
#' using intersections of `columns` and `rows`
#' }
#'
#' @param columns The names of the columns that are to be targeted.
#' @param rows The names of the rows that are to be targeted.
#'
#' @return A list object with the classes `cells_summary` and `location_cells`.
#'
#' @examples
#' # Use `countrypops` to create a gt table; add
#' # some styling to a grand summary cell with
#' # with `tab_style()` and `cells_grand_summary()`
#' tab_1 <-
#'   countrypops %>%
#'   dplyr::filter(
#'     country_name == "Spain",
#'     year < 1970
#'   ) %>%
#'   dplyr::select(-contains("country")) %>%
#'   gt(rowname_col = "year") %>%
#'   fmt_number(
#'     columns = vars(population),
#'     decimals = 0
#'   ) %>%
#'   grand_summary_rows(
#'     columns = vars(population),
#'     fns = list(
#'       change = ~max(.) - min(.)
#'     ),
#'     formatter = fmt_number,
#'     decimals = 0
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_text(style = "italic"),
#'       cell_fill(color = "lightblue")
#'     ),
#'     locations = cells_grand_summary(
#'       columns = vars(population),
#'       rows = 1)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cells_grand_summary_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-13
#'
#' @import rlang
#' @export
cells_grand_summary <- function(columns = TRUE,
                                rows = TRUE) {

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

#' Supply a custom currency symbol to `fmt_currency()`
#'
#' The `currency()` helper function makes it easy to specify a context-aware
#' currency symbol to `currency` argument of [fmt_currency()]. Since **gt** can
#' render tables to several output formats, `currency()` allows for different
#' variations of the custom symbol based on the output context (which are
#' `html`, `latex`, `rtf`, and `default`). The number of decimal places for
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
#' we were to specify currency strings for multiple output contexts, names are
#' required each and every context.
#'
#' @param ... One or more named arguments using output contexts as the names and
#'   currency symbol text as the values.
#' @param .list Allows for the use of a list as an input alternative to `...`.
#'
#' @return A list object of class `gt_currency`.
#'
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
#'
#' @section Figures:
#' \if{html}{\figure{man_currency_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-14
#'
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

#' Helper for defining custom text styles for table cells
#'
#' This helper function is to be used with the [tab_style()] function, which
#' itself allows for the setting of custom styles to one or more cells. We can
#' also define several styles within a single call of `cell_text()` and
#' [tab_style()] will reliably apply those styles to the targeted element.
#'
#' @param color The text color.
#' @param font The font or collection of fonts (subsequent font names are) used
#'   as fallbacks.
#' @param size The size of the font. Can be provided as a number that is assumed
#'   to represent `px` values (or could be wrapped in the [px()]) helper
#'   function. We can also use one of the following absolute size keywords:
#'   `"xx-small"`, `"x-small"`, `"small"`, `"medium"`, `"large"`, `"x-large"`,
#'   or `"xx-large"`.
#' @param style The text style. Can be one of either `"normal"`, `"italic"`, or
#'   `"oblique"`.
#' @param weight The weight of the font. Can be a text-based keyword such as
#'   `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value between
#'   `1` and `1000`, inclusive. Note that only variable fonts may support the
#'   numeric mapping of weight.
#' @param align The text alignment. Can be one of either `"center"`, `"left"`,
#'   `"right"`, or `"justify"`.
#' @param v_align The vertical alignment of the text in the cell. Options are
#'   `"middle"`, `"top"`, or `"bottom"`.
#' @param stretch Allows for text to either be condensed or expanded. We can use
#'   one of the following text-based keywords to describe the degree of
#'   condensation/expansion: `"ultra-condensed"`, `"extra-condensed"`,
#'   `"condensed"`, `"semi-condensed"`, `"normal"`, `"semi-expanded"`,
#'   `"expanded"`, `"extra-expanded"`, or `"ultra-expanded"`. Alternatively, we
#'   can supply percentage values from `0\%` to `200\%`, inclusive. Negative
#'   percentage values are not allowed.
#' @param indent The indentation of the text. Can be provided as a number that
#'   is assumed to represent `px` values (or could be wrapped in the [px()])
#'   helper function. Alternatively, this can be given as a percentage (easily
#'   constructed with [pct()]).
#' @param decorate allows for text decoration effect to be applied. Here, we can
#'   use `"overline"`, `"line-through"`, or `"underline"`.
#' @param transform Allows for the transformation of text. Options are
#'   `"uppercase"`, `"lowercase"`, or `"capitalize"`.
#'
#' @return A list object of class `cell_styles`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # add styles with `tab_style()` and
#' # the `cell_text()` helper function
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num, currency),
#'     decimals = 1
#'   ) %>%
#'   tab_style(
#'     style = cell_text(weight = "bold"),
#'     locations = cells_body(
#'       columns = vars(num),
#'       rows = num >= 5000)
#'   ) %>%
#'   tab_style(
#'     style = cell_text(style = "italic"),
#'     locations = cells_body(
#'       columns = vars(currency),
#'       rows = currency < 100
#'     )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cell_text_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-15
#'
#' @export
cell_text <- function(color = NULL,
                      font = NULL,
                      size = NULL,
                      align = NULL,
                      v_align = NULL,
                      style = NULL,
                      weight = NULL,
                      stretch = NULL,
                      indent = NULL,
                      decorate = NULL,
                      transform = NULL) {

  # Get all assigned values for the functions' arguments
  style_names <- formals(cell_text) %>% names()
  style_names <- mget(style_names)

  # Filter list by only the non-NULL (e.g., assigned with
  # value) elements
  style_vals <- style_names %>% .[!vapply(., is.null, logical(1))]

  # Get a vector of argument names (`style_names`) for
  # validation purposes
  style_names <- style_vals %>% names()

  #
  # Validate textual styles values with `validate_style_in()`
  #

  validate_style_in(
    style_vals, style_names,
    arg_name = "align",
    in_vector = c("center", "left", "right", "justify")
  )

  validate_style_in(
    style_vals, style_names,
    arg_name = "v_align",
    in_vector = c("middle", "top", "bottom")
  )

  validate_style_in(
    style_vals, style_names,
    arg_name = "style",
    in_vector = c("normal", "italic", "oblique")
  )

  validate_style_in(
    style_vals, style_names,
    arg_name = "weight",
    in_vector = c("normal", "bold", "lighter", "bolder"),
    with_pattern = "[1-9][0-9][0-9]"
  )

  validate_style_in(
    style_vals, style_names, arg_name = "stretch",
    in_vector = c(
      "ultra-condensed", "extra-condensed", "condensed",
      "semi-condensed", "normal", "semi-expanded", "expanded",
      "extra-expanded", "ultra-expanded"
    )
  )

  validate_style_in(
    style_vals, style_names,
    arg_name = "decorate",
    in_vector = c("overline", "line-through", "underline", "underline overline")
  )

  validate_style_in(
    style_vals, style_names,
    arg_name = "transform",
    in_vector = c("uppercase", "lowercase", "capitalize")
  )

  cell_style_structure(name = "cell_text", obj = style_vals)
}

cell_style_to_html.cell_text <- function(style) {

  css <- style %>% unclass()

  css_names <-
    c(
      font = "font-family",
      size = "font-size",
      align = "text-align",
      v_align = "vertical-align",
      style = "font-style",
      weight = "font-weight",
      stretch = "font-stretch",
      indent = "text-indent",
      decorate = "text-decoration",
      transform = "text-transform"
    )

  html_names <- css_names[names(css)]
  names(css) <- ifelse(!is.na(html_names), html_names, names(css))

  css
}

#' Helper for defining custom fills for table cells
#'
#' The `cell_fill()` helper function is to be used with the [tab_style()]
#' function, which itself allows for the setting of custom styles to one or more
#' cells. Specifically, the call to `cell_fill()` should be bound to the
#' `styles` argument of [tab_style()].
#'
#' @param color The fill color. If nothing is provided, then `"#D3D3D3"` (light
#'   gray) will be used as a default.
#' @param alpha An optional alpha transparency value for the `color` as single
#'   value in the range of `0` (fully transparent) to `1` (fully opaque). If not
#'   provided the fill color will either be fully opaque or use alpha
#'   information from the color value if it is supplied in the #RRGGBBAA format.
#'
#' @return A list object of class `cell_styles`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # add styles with `tab_style()` and
#' # the `cell_fill()` helper function
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num, currency),
#'     decimals = 1
#'   ) %>%
#'   tab_style(
#'     style = cell_fill(color = "lightblue"),
#'     locations = cells_body(
#'       columns = vars(num),
#'       rows = num >= 5000)
#'   ) %>%
#'   tab_style(
#'     style = cell_fill(color = "gray85"),
#'     locations = cells_body(
#'       columns = vars(currency),
#'       rows = currency < 100
#'     )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_cell_fill_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-16
#'
#' @export
cell_fill <- function(color = "#D3D3D3",
                      alpha = NULL) {

  if (length(color) != 1) {
    stop("The length of the `color` vector must be `1`", call. = FALSE)
  }

  if (!is.null(alpha) && length(alpha) != 1) {
    stop("If provided, `alpha` must be a single value", call. = FALSE)
  }

  if (!is_rgba_col(color)) {
    color <- html_color(colors = color, alpha = alpha)
  }

  style_vals <- list(color = color)

  cell_style_structure("cell_fill", style_vals)
}

cell_style_to_html.cell_fill <- function(style) {

  css <- list()
  css$`background-color` <- style$color

  css
}

#' Helper for defining custom borders for table cells
#'
#' The `cell_borders()` helper function is to be used with the [tab_style()]
#' function, which itself allows for the setting of custom styles to one or more
#' cells. Specifically, the call to `cell_borders()` should be bound to the
#' `styles` argument of [tab_style()]. The `selection` argument is where we
#' define which borders should be modified (e.g., `"left"`, `"right"`, etc.).
#' With that selection, the `color`, `style`, and `weight` of the selected
#' borders can then be modified.
#'
#' @param sides The border sides to be modified. Options include `"left"`,
#'   `"right"`, `"top"`, and `"bottom"`. For all borders surrounding the
#'   selected cells, we can use the `"all"` option.
#' @param color,style,weight The border color, style, and weight. The `color`
#'   can be defined with a color name or with a hexadecimal color code. The
#'   default `color` value is `"#000000"` (black). The `style` can be one of
#'   either `"solid"` (the default), `"dashed"`, or `"dotted"`. The `weight` of
#'   the border lines is to be given in pixel values (the [px()] helper function
#'   is useful for this. The default value for `weight` is `"1px"`. Borders for
#'   any defined `sides` can be removed by supplying `NULL` to any of `color`,
#'   `style`, or `weight`.
#'
#' @return A list object of class `cell_styles`.
#'
#' @examples
#' # Add horizontal border lines for
#' # all table body rows in `exibble`
#' tab_1 <-
#'   exibble %>%
#'     gt() %>%
#'     tab_options(row.striping.include_table_body = FALSE) %>%
#'     tab_style(
#'       style = cell_borders(
#'         sides = c("top", "bottom"),
#'         color = "#BBBBBB",
#'         weight = px(1.5),
#'         style = "solid"
#'       ),
#'       locations = cells_body(
#'         columns = everything(),
#'         rows = everything()
#'       )
#'     )
#'
#' # Incorporate different horizontal and
#' # vertical borders at several locations;
#' # this uses multiple `cell_borders()` and
#' # `cells_body()` calls within `list()`s
#' tab_2 <-
#'   exibble %>%
#'     gt() %>%
#'     tab_style(
#'       style = list(
#'         cell_borders(
#'           sides = c("top", "bottom"),
#'           color = "#FF0000",
#'           weight = px(2)
#'         ),
#'         cell_borders(
#'           sides = c("left", "right"),
#'           color = "#0000FF",
#'           weight = px(2)
#'         )
#'       ),
#'       locations = list(
#'         cells_body(
#'           columns = vars(num),
#'           rows = is.na(num)
#'         ),
#'         cells_body(
#'           columns = vars(currency),
#'           rows = is.na(currency)
#'         )
#'       )
#'     )
#'
#' @section Figures:
#' \if{html}{\figure{man_cell_borders_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_cell_borders_2.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-17
#'
#' @export
cell_borders <- function(sides = "all",
                         color = "#000000",
                         style = "solid",
                         weight = px(1)) {

  if (is.null(weight)) {
    weight <- "0"
  }

  if (is.null(style)) {
    style <- "hidden"
  }

  if (is.null(color)) {
    color <- "transparent"
  }

  validate_length_one(weight, "weight")
  validate_length_one(style, "style")
  validate_length_one(color, "color")

  if (!any(sides %in% c(
    "left", "l",
    "right", "r",
    "top", "t",
    "bottom", "b",
    "all", "everything", "a"
  ))) {
    stop("The `sides` vector for `cell_borders()` has to include one ",
         "or more of the following keywords (or short forms):\n",
         " * \"left\" (or: \"l\")\n",
         " * \"right\" (or: \"r\")\n",
         " * \"top\" (or: \"t\")\n",
         " * \"bottom\" (or: \"b\")\n",
         " * \"all\" (or: \"a\", \"everything\"",
         call. = FALSE)
  }

  # Resolve the selection of borders into a vector of
  # standardized sides
  sides <-
    vapply(
      sides, resolve_border_side,
      FUN.VALUE = character(1), USE.NAMES = FALSE) %>%
    unique()

  # Should the `all` selection appear in the
  # `sides` vector, use all possible sides
  if ("all" %in% sides) {
    sides <- c("left", "right", "top", "bottom")
  }

  lapply(sides, function(side) {

    style_vals <-
      list(
        side = side,
        width = weight,
        style = style,
        color = color
      )

    validate_style_in(
      style_vals, names(style_vals), "style",
      c("solid", "dashed", "dotted")
    )

    cell_style_structure(paste0("cell_border_", side), style_vals, "cell_border")
  }) %>%
    as_style()
}

cell_style_to_html.cell_border <- function(style) {

  css <- style %>% unclass()

  side <- css$side

  css$side <- NULL

  names(css) <- paste0("border-", side, "-", names(css))

  css
}

cell_style_structure <- function(name, obj, subclass = name) {

  style_obj <- list()

  class(obj) <- c(subclass, "cell_style")

  style_obj[[name]] <- obj

  class(style_obj) <- "cell_styles"

  style_obj
}

#' Helper function for specifying a font from the Google Fonts service
#'
#' The `google_font()` helper function can be used wherever a font name should
#' be specified. There are two instances where this helper can be used: the
#' `name` argument in [opt_table_font()] (for setting a table font) and in that
#' of [cell_text()] (used with [tab_style()]). To get a helpful listing of fonts
#' that work well in tables, use the [info_google_fonts()] function.
#'
#' @param name The complete name of a font available in Google Fonts.
#'
#' @return An object of class `font_css`.
#'
#' @examples
#' if (interactive()) {
#'
#' # Use `exibble` to create a gt table of
#' # eight rows, replace missing values with
#' # em dashes; for text in the `time` column,
#' # we use the Google font 'IBM Plex Mono'
#' # and set up the `default_fonts()` as
#' # fallbacks (just in case the webfont is
#' # not accessible)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(char, time) %>%
#'   gt() %>%
#'   fmt_missing(columns = everything()) %>%
#'   tab_style(
#'     style = cell_text(
#'       font = c(
#'         google_font(name = "IBM Plex Mono"),
#'         default_fonts()
#'       )
#'     ),
#'     locations = cells_body(columns = vars(time))
#'   )
#'
#' # Use `sp500` to create a small gt table,
#' # using `fmt_currency()` to provide a
#' # dollar sign for the first row of monetary
#' # values; then, set a larger font size for
#' # the table and use the 'Merriweather' font
#' # using the `google_font()` function (with
#' # two font fallbacks: 'Cochin' and the
#' # catchall 'Serif' group)
#' tab_2 <-
#'   sp500 %>%
#'   dplyr::slice(1:10) %>%
#'   dplyr::select(-volume, -adj_close) %>%
#'   gt() %>%
#'   fmt_currency(
#'     columns = 2:5,
#'     rows = 1,
#'     currency = "USD",
#'     use_seps = FALSE
#'   ) %>%
#'   tab_options(table.font.size = px(20)) %>%
#'   opt_table_font(
#'     font = list(
#'       google_font(name = "Merriweather"),
#'       "Cochin", "Serif"
#'     )
#'   )
#' }
#'
#' @section Figures:
#' \if{html}{\figure{man_google_font_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_google_font_2.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-18
#'
#' @export
google_font <- function(name) {

  import_stmt <-
    name %>% tidy_gsub(" ", "+") %>%
    paste_between(
      c(
        "@import url('https://fonts.googleapis.com/css2?family=",
        ":ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap');"
      )
    )

  font_list <-
    list(
      name = name,
      import_stmt = import_stmt
    )

  class(font_list) <- "font_css"
  font_list
}

#' A vector of default fonts for use with **gt** tables
#'
#' The vector of fonts given by `default_fonts()` should be used with a **gt**
#' table that is rendered to HTML. We can specify additional fonts to use but
#' this default set should be placed after that to act as fallbacks. This is
#' useful when specifying `font` values in the [cell_text()] function (itself
#' used in the [tab_style()] function). If using [opt_table_font()] (which also
#' has a `font` argument) we probably don't need to specify this vector of fonts
#' since it is handled by its `add` option (which is `TRUE` by default).
#'
#' @return A character vector of font names.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # attempting to modify the fonts used
#' # for the `time` column is much safer
#' # if `default_fonts()` is appended to
#' # the end of the `font` listing in the
#' # `cell_text()` call (the "Comic Sansa"
#' # and "Menloa" fonts don't exist, but,
#' # we'll get the first available font
#' # from the `default_fonts()` set)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(char, time) %>%
#'   gt() %>%
#'   tab_style(
#'     style = cell_text(
#'       font = c(
#'         "Comic Sansa", "Menloa",
#'         default_fonts()
#'       )
#'     ),
#'     locations = cells_body(columns = vars(time))
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_default_fonts_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#'
#' @section Function ID:
#' 7-19
#'
#' @export
default_fonts <- function() {
  c(
    "-apple-system", "BlinkMacSystemFont", "Segoe UI", "Roboto",
    "Oxygen", "Ubuntu", "Cantarell", "Helvetica Neue", "Fira Sans",
    "Droid Sans", "Arial", "sans-serif"
  )
}

#' Adjust the luminance for a palette of colors
#'
#' This function can brighten or darken a palette of colors by an arbitrary
#' number of steps, which is defined by a real number between -2.0 and 2.0. The
#' transformation of a palette by a fixed step in this function will tend to
#' apply greater darkening or lightening for those colors in the midrange
#' compared to any very dark or very light colors in the input palette.
#'
#' This function can be useful when combined with the [data_color()] function's
#' `palette` argument, which can use a vector of colors or any of the `col_*`
#' functions from the **scales** package (all of which have a `palette`
#' argument).
#'
#' @param colors A vector of colors that will undergo an adjustment in
#'   luminance. Each color value provided must either be a color name (in the
#'   set of colors provided by `grDevices::colors()`) or a hexadecimal string in
#'   the form of "#RRGGBB" or "#RRGGBBAA".
#' @param steps A positive or negative factor by which the luminance will be
#'   adjusted. Must be a number between `-2.0` and `2.0`.
#'
#' @return A vector of color values.
#'
#' @examples
#' # Get a palette of 8 pastel colors from
#' # the RColorBrewer package
#' pal <- RColorBrewer::brewer.pal(8, "Pastel2")
#'
#' # Create lighter and darker variants
#' # of the base palette (one step lower, one
#' # step higher)
#' pal_darker  <- pal %>% adjust_luminance(-1.0)
#' pal_lighter <- pal %>% adjust_luminance(+1.0)
#'
#' # Create a tibble and make a gt table
#' # from it; color each column in order of
#' # increasingly darker palettes (with
#' # `data_color()`)
#' tab_1 <-
#'   dplyr::tibble(a = 1:8, b = 1:8, c = 1:8) %>%
#'   gt() %>%
#'   data_color(
#'     columns = vars(a),
#'     colors = scales::col_numeric(
#'       palette = pal_lighter,
#'       domain = c(1, 8)
#'     )
#'   ) %>%
#'   data_color(
#'     columns = vars(b),
#'     colors = scales::col_numeric(
#'       palette = pal,
#'       domain = c(1, 8)
#'     )
#'   ) %>%
#'   data_color(
#'     columns = vars(c),
#'     colors = scales::col_numeric(
#'       palette = pal_darker,
#'       domain = c(1, 8)
#'     )
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_adjust_luminance_1.png}{options: width=100\%}}
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-20
#'
#' @export
adjust_luminance <- function(colors,
                             steps) {

  # Stop if steps is beyond an acceptable range
  if (steps > 2.0 | steps < -2.0) {
    stop("The value provided for `steps` (", steps, ") must be between `-2.0` and `+2.0`.",
         call. = FALSE)
  }

  # Get a matrix of values in the RGB color space
  rgb_matrix <- t(grDevices::col2rgb(colors, alpha = TRUE)) / 255

  # Obtain the alpha values
  alpha <- rgb_matrix[, "alpha"]

  # Get a matrix of values in the Luv color space
  luv_matrix <- grDevices::convertColor(rgb_matrix[, 1:3], "sRGB", "Luv")

  # Apply calculations to obtain values in the HCL color space
  h <- atan2(luv_matrix[, "v"], luv_matrix[, "u"]) * 180 / pi
  c <- sqrt(luv_matrix[, "u"]^2 + luv_matrix[, "v"]^2)
  l <- luv_matrix[, "L"]

  # Scale luminance to occupy [0, 1]
  y <- l / 100.

  # Obtain `x` positions of luminance values along a sigmoid function
  x <- log(-(y / (y - 1)))

  # Calculate new luminance values based on a fixed step-change in `x`
  y_2 <- 1 / (1 + exp(-(x + steps)))

  # Rescale the new luminance values to [0, 100]
  l <- y_2 * 100.

  # Obtain hexadecimal colors from the modified HCL color values
  grDevices::hcl(h, c, l, alpha = alpha)
}

#' Helper for creating a random `id` for a **gt** table
#'
#' This helper function can be used to create a random, character-based ID
#' value argument of variable length (the default is 10 letters).
#'
#' @param n The number of lowercase letters to use for the random ID.
#'
#' @return A character vector containing a single, random ID.
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-21
#'
#' @export
random_id <- function(n = 10) {

  paste(sample(letters, n, replace = TRUE), collapse = "")
}

#' Perform LaTeX escaping
#'
#' Text may contain several characters with special meanings in LaTeX. This
#' function will transform a character vector so that it is safe to use within
#' LaTeX tables.
#'
#' @param text a character vector containing the text that is to be
#'   LaTeX-escaped.
#'
#' @return A character vector.
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-22
#'
#' @export
escape_latex <- function(text) {

  text %>%
    tidy_gsub("\\\\", "\\\\textbackslash ") %>%
    tidy_gsub("([&%$#_{}])", "\\\\\\1") %>%
    tidy_gsub("~", "\\\\textasciitilde ") %>%
    tidy_gsub("\\^", "\\\\textasciicircum ")
}

#' Get the LaTeX dependencies required for a **gt** table
#'
#' When working with Rnw (Sweave) files or otherwise writing LaTeX code,
#' including a **gt** table can be problematic if we don't have knowledge
#' of the LaTeX dependencies. For the most part, these dependencies are the
#' LaTeX packages that are required for rendering a **gt** table. The
#' `gt_latex_dependencies()` function provides an object that can be
#' used to provide the LaTeX in an Rnw file, allowing **gt** tables to work
#' and not yield errors due to missing packages.
#'
#' Here is an example Rnw document that shows how the
#' `gt_latex_dependencies()` can be used in conjunction with a **gt**
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
#'
#' @return An object of class `knit_asis`.
#'
#' @family Helper Functions
#' @section Function ID:
#' 7-23
#'
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
