#' Add custom styles to one or more cells
#'
#' With the \code{tab_style()} function we can target specific cells and apply
#' styles to them. This is best done in conjunction with the
#' \code{\link{cells_styles}()} helper function. At present this function is
#' focused on the application of styles for HTML output only (as such, other
#' output formats will ignore all \code{tab_style()} calls). With the help of
#' \code{\link{cells_styles}()}, we can set the following styles:
#' \itemize{
#' \item the background color of the cell (\code{bkgd_color})
#' \item the cell's text color (\code{text_color}), font (\code{text_font}), or
#' size (\code{text_size})
#' \item the text style (\code{text_style}), enabling the use of italics or
#' oblique text.
#' \item text decoration (\code{text_decorate}): use overlines, line-throughs,
#' or underlines
#' \item text transformations (\code{text_transform}) that result in lowercased,
#' uppercased, or capitalized text
#' \item the text weight (\code{text_weight}), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' \item the alignment of text (\code{text_align})
#' \item a stretching property for text that condenses or expands text
#' (\code{text_stretch})
#' \item the text indentation (\code{text_indent})
#' }
#'
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The \code{\link{cells_styles}()}
#'   helper function can be used here to more easily generate valid styles.
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
#'     style = cells_styles(
#'       bkgd_color = "lightcyan",
#'       text_weight = "bold"),
#'     locations = cells_data(
#'       columns = vars(num),
#'       rows = num >= 5000)
#'   ) %>%
#'   tab_style(
#'     style = cells_styles(
#'       bkgd_color = "#F9E3D6",
#'       text_style = "italic"),
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
#'   dplyr::mutate(date = as.character(date)) %>%
#'   gt() %>%
#'   tab_style(
#'     style = cells_styles(
#'       bkgd_color = "lightgreen"),
#'     locations = cells_data(
#'       rows = close > open)
#'   ) %>%
#'   tab_style(
#'     style = cells_styles(
#'       bkgd_color = "crimson",
#'       text_color = "white"),
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
#' @seealso \code{\link{cells_styles}()} as a helper for defining custom styles
#'   and \code{\link{cells_data}()} as a useful helper function for targeting
#'   one or more data cells to be styled.
#' @importFrom stats setNames
#' @export
tab_style <- function(data,
                      style,
                      locations) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

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
