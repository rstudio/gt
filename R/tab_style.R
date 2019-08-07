#' Add custom styles to one or more cells
#'
#' With the `tab_style()` function we can target specific cells and apply styles
#' to them. This is best done in conjunction with the helper functions
#' [cell_text()], [cell_fill()], and [cell_borders()]. At present this function
#' is focused on the application of styles for HTML output only (as such, other
#' output formats will ignore all `tab_style()` calls). Using the aforementioned
#' helper functions, here are some of the styles we can apply:
#' \itemize{
#' \item the background color of the cell ([cell_fill()]: `color`)
#' \item the cell's text color, font, and size ([cell_text()]: `color`, `font`,
#' `size`)
#' \item the text style ([cell_text()]: `style`), enabling the use of italics or
#' oblique text.
#' \item the text weight ([cell_text()]: `weight`), allowing the use of thin to
#' bold text (the degree of choice is greater with variable fonts)
#' \item the alignment and indentation of text ([cell_text()]: `align` and
#' `indent`)
#' \item the cell borders ([cell_borders()])
#' }
#'
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The [cell_text()], [cell_fill()], and
#'   [cell_borders()] helper functions can be used here to more easily generate
#'   valid styles. If using more than one helper function to define styles, all
#'   calls must be enclosed in a [list()].
#' @param locations the cell or set of cells to be associated with the style
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the style application. These
#'   helper functions are: [cells_title()], [cells_column_labels()],
#'   [cells_group()], [cells_stub()], [cells_stubhead()], [cells_data()],
#'   [cells_summary()], and [cells_grand_summary()]. Please see the help article
#'   [location_cells] for more information on how these helper functions can be
#'   used. Additionally, we can enclose several `cells_*()` calls within a
#'   `list()` if we wish to apply styles to different types of locations (e.g.,
#'   cell data values, stub group headings, the table title, etc.).
#'
#' @return an object of class `gt_tbl`.
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
#' @seealso [cell_text()], [cell_fill()], and [cell_borders()] as helpers for
#'   defining custom styles and [cells_data()] as a useful helper function for
#'   targeting one or more data cells to be styled.
#' @export
tab_style <- function(data,
                      style,
                      locations) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  style <- as_style(style)

  # Resolve the locations of the targeted data cells and append
  # the format directives
  for (loc in locations) {
    data <- set_style(loc, data, style)
  }

  data
}

as_style <- function(style) {

  # If style rules are part of a list, paste each of the list
  # components together
  if (!inherits(style, "cell_styles")) {

    if (!inherits(style, "list")) {
      stop("Styles should be provided exclusively by the stylizing ",
           "helper functions:",
           " * `cell_text()\n",
           " * `cell_fill()\n",
           " * `cell_borders()`",
           call. = FALSE)
    }

    # Initialize an empty list that will be
    # populated with normalized style declarations
    final_style <- list()

    for (i in seq(style)) {

      style_item <- style[[i]]

      if (!inherits(style_item, "cell_styles")) {

        # TODO: position can be provided
        stop("All provided styles should be generated by stylizing ",
             "helper functions. Style with index `", i, "` is invalid.",
             call. = FALSE)
      }

      final_style <- utils::modifyList(final_style, style_item)
    }

    class(final_style) <- "cell_styles"

    style <- final_style
  }

  # Check for class of `cell_style` in upgraded `style` list
  lapply(style, function(x) checkmate::assert_class(x = x, classes = "cell_style"))

  style
}

set_style <- function(loc, data, style) {
  UseMethod("set_style")
}

set_style.cells_title <- function(loc, data, style) {

  if ((loc$groups %>% rlang::eval_tidy()) == "title") {

    attr(data, "styles_df") <-
      add_location_row_styles(
        data,
        locname = "title", locnum = 1,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, styles = list(style)
      )

  } else if ((loc$groups %>% rlang::eval_tidy()) == "subtitle") {

    attr(data, "styles_df") <-
      add_location_row_styles(
        data,
        locname = "subtitle", locnum = 2,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, styles = list(style)
      )
  }

  data
}

set_style.cells_stubhead <- function(loc, data, style) {

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = loc$groups, locnum = 2.5,
      grpname = NA_character_, colname = NA_character_,
      rownum = NA_character_, styles = list(style)
    )

  data
}

set_style.cells_column_labels <- function(loc, data, style) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = "columns_columns", locnum = 4,
      grpname = NA_character_, colname = colnames,
      rownum = NA_character_, styles = list(style)
    )

  data
}

set_style.cells_column_spanners <- function(loc, data, style) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = "columns_groups", locnum = 3,
      grpname = groups, colname = NA_character_,
      rownum = NA_character_, styles = list(style)
    )

  data
}

set_style.cells_group <- function(loc, data, style) {

  row_groups <- attr(data, "arrange_groups")$groups

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_data_vals_idx(
      var_expr = !!loc$groups,
      data = NULL,
      vals = row_groups
    )

  groups <- row_groups[resolved_row_groups_idx]

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = "stub_groups", locnum = 5,
      grpname = groups, colname = NA_character_,
      rownum = NA_character_, styles = list(style)
    )

  data
}

set_style.cells_data <- function(loc, data, style) {

  resolved <- resolve_cells_data(data = data, object = loc)

  cols <- resolved$columns
  rows <- resolved$rows

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = "data", locnum = 5,
      grpname = NA_character_, colname = colnames,
      rownum = rows, styles = list(style)
    )

  data
}

set_style.cells_stub <- function(loc, data, style) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  attr(data, "styles_df") <-
    add_location_row_styles(
      data,
      locname = "stub", locnum = 5,
      grpname = NA_character_, colname = NA_character_,
      rownum = rows, styles = list(style)
    )

  data
}

set_style.cells_summary <- function(loc, data, style) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}

set_style.cells_grand_summary <- function(loc, data, style) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = style,
    df_type = "styles_df"
  )
}
