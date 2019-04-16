#' Add custom styles to one or more cells
#'
#' With the \code{tab_style()} function we can target specific cells and apply
#' styles to them. This is best done in conjunction with the helper functions
#' \code{\link{cell_text}()}, \code{\link{cell_fill}()}, and
#' \code{\link{cell_borders}()}. At present this function is focused on the
#' application of styles for HTML output only (as such, other output formats
#' will ignore all \code{tab_style()} calls). Using the aforementioned helper
#' functions, here are some of the styles we can apply:
#' \itemize{
#' \item the background color of the cell (\code{cell_fill()}: \code{color})
#' \item the cell's text color, font, and size (\code{cell_text()}:
#' \code{text_color}, \code{text_font}, \code{text_size})
#' \item the text style (\code{cell_text()}: \code{text_style}), enabling the
#' use of italics or oblique text.
#' \item the text weight (\code{text_weight}), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' \item the alignment and indentation of text (\code{cell_text()}:
#' \code{text_align} and \code{text_indent})
#' \item the cell borders (\code{cell_borders()})
#' }
#'
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The \code{\link{cell_text}()},
#'   \code{\link{cell_fill}()}, and \code{\link{cell_borders}()} helper
#'   functions can be used here to more easily generate valid styles. If using
#'   more than one helper function to define styles, all calls must be enclosed
#'   in a \code{list()}.
#' @param locations the cell or set of cells to be associated with the style
#'   Supplying any of the \code{cells_*()} helper functions is a useful way to
#'   target the location cells that are associated with the style application.
#'   These helper functions are: \code{\link{cells_title}()},
#'   \code{\link{cells_column_labels}()}, \code{\link{cells_group}()},
#'   \code{\link{cells_stub}()}, \code{\link{cells_data}()}, and
#'   \code{\link{cells_summary}()}. Please see the help article
#'   \link{location_cells} for more information on how these helper functions
#'   can be used. Additionally, we can enclose several \code{cells_*()} calls
#'   within a \code{list()} if we wish to apply styles to different types of
#'   locations (e.g., cell data values, stub group headings, the table title,
#'   etc.).
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # add styles that are to be applied
#' # to data cells that satisfy a
#' # condition (using `tab_style()`)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num, currency),
#'     decimals = 1
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "lightcyan"),
#'       cell_text(weight = "bold")
#'       ),
#'     locations = cells_data(
#'       columns = vars(num),
#'       rows = num >= 5000)
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "#F9E3D6"),
#'       cell_text(style = "italic")
#'       ),
#'     locations = cells_data(
#'       columns = vars(currency),
#'       rows = currency < 100)
#'   )
#'
#' # Use `sp500` to create a gt table;
#' # color entire rows of cells based
#' # on values in a particular column
#' tab_2 <-
#'   sp500 %>%
#'   dplyr::filter(
#'     date >= "2015-12-01" &
#'     date <= "2015-12-15"
#'   ) %>%
#'   dplyr::select(-c(adj_close, volume)) %>%
#'   gt() %>%
#'   tab_style(
#'     style = cell_fill(color = "lightgreen"),
#'     locations = cells_data(
#'       rows = close > open)
#'   ) %>%
#'   tab_style(
#'     style = list(
#'       cell_fill(color = "crimson"),
#'       cell_text(color = "white")
#'       ),
#'     locations = cells_data(
#'       rows = open > close)
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_style_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_tab_style_2.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @seealso \code{\link{cell_text}()}, \code{\link{cell_fill}()}, and
#'   \code{\link{cell_borders}()} as helpers for defining custom styles and
#'   \code{\link{cells_data}()} as a useful helper function for targeting one or
#'   more data cells to be styled.
#' @importFrom stats setNames
#' @export
tab_style <- function(data,
                      style,
                      locations) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # If style rules are part of a list, paste each of the list
  # components together
  if (inherits(style, "list")) {

    style <-
      style %>%
      unlist() %>%
      paste0(collapse = "")
  }

  # Resolve the locations of the targeted data cells and append
  # the format directives
  for (loc in locations) {
    data <- set_style(loc, data, style)
  }

  data
}

set_style <- function(loc, data, style) {
  UseMethod("set_style")
}

set_style.cells_data <- function(loc, data, style) {

  resolved <- resolve_cells_data(data = data, object = loc)

  cols <- resolved$columns
  rows <- resolved$rows

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "styles_df") <-
    add_location_row(
      data, df_type = "styles_df",
      locname = "data", locnum = 5,
      grpname = NA_character_, colname = colnames,
      rownum = rows, text = style)

  data
}

set_style.cells_stub <- function(loc, data, style) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  attr(data, "styles_df") <-
    add_location_row(
      data, df_type = "styles_df",
      locname = "stub", locnum = 5,
      grpname = NA_character_, colname = NA_character_,
      rownum = rows, text = style)

  data
}

set_style.cells_column_labels <- function(loc, data, style) {

  if (!is.null(loc$columns)) {

    resolved <- resolve_cells_column_labels(data = data, object = loc)

    cols <- resolved$columns

    colnames <- colnames(as.data.frame(data))[cols]

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "columns_columns", locnum = 4,
        grpname = NA_character_, colname = colnames,
        rownum = NA_character_, text = style)

  } else if (!is.null(loc$groups)) {

    groups <- (loc$groups %>% as.character())[-1]

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "columns_groups", locnum = 3,
        grpname = groups, colname = NA_character_,
        rownum = NA_character_, text = style)
  }

  data
}

set_style.cells_group <- function(loc, data, style) {

  groups <- (loc$groups %>% as.character())[-1]

  attr(data, "styles_df") <-
    add_location_row(
      data, df_type = "styles_df",
      locname = "stub_groups", locnum = 5,
      grpname = groups, colname = NA_character_,
      rownum = NA_character_, text = style)

  data
}

set_style.cells_title <- function(loc, data, style) {

  if ((loc$groups %>% as.character())[-1] == "title") {

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "title", locnum = 1,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, text = style)

  } else if ((loc$groups %>% as.character())[-1] == "subtitle") {

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "subtitle", locnum = 2,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, text = style)
  }

  data
}

set_style.cells_summary <- function(loc, data, style) {

  groups <- (loc$groups %>% as.character())[-1]
  rows <- (loc$rows %>% as.character())[-1] %>% as.integer()

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "styles_df") <-
    add_location_row(
      data, df_type = "styles_df",
      locname = "summary_cells", locnum = 5,
      grpname = groups, colname = colnames,
      rownum = rows, text = style)

  data
}
