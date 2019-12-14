#' Add a table footnote
#'
#' The `tab_footnote()` function can make it a painless process to add a
#' footnote to a **gt** table. There are two components to a footnote: (1) a
#' footnote mark that is attached to the targeted cell text, and (2) the
#' footnote text (that starts with the corresponding footnote mark) that is
#' placed in the table's footer area. Each call of `tab_footnote()` will add a
#' different note, and one or more cells can be targeted via the location helper
#' functions (e.g., [cells_body()], [cells_column_labels()], etc.).
#'
#' The formatting of the footnotes can be controlled through the use of various
#' parameters in the [tab_options()] function:
#'
#' \itemize{
#'   \item `footnotes.sep`: allows for a choice of the separator between
#' consecutive footnotes in the table footer. By default, this is set to a
#' linebreak.
#'   \item `footnotes.marks`: the set of sequential characters or numbers used
#' to identify the footnotes.
#'   \item `footnotes.font.size`: the size of the font used in the footnote
#' section.
#'   \item `footnotes.padding`: the amount of padding to apply between the
#' footnote and source note sections in the table footer.
#' }
#'
#' @inheritParams fmt_number
#' @param footnote The text to be used in the footnote. We can optionally use
#'   the [md()] and [html()] functions to style the text as Markdown or to
#'   retain HTML elements in the footnote text.
#' @param locations The cell or set of cells to be associated with the footnote.
#'   Supplying any of the `cells_*()` helper functions is a useful way to target
#'   the location cells that are associated with the footnote text. These helper
#'   functions are: [cells_title()], [cells_column_labels()], [cells_group()],
#'   [cells_stub()], [cells_stubhead()], [cells_body()], [cells_summary()], and
#'   [cells_grand_summary()]. Please see the help article \link{location_cells}
#'   for more information on how these helper functions can be used.
#'   Additionally, we can enclose several `cells_*()` calls within a `list()` if
#'   we wish to link the footnote text to different types of locations (e.g.,
#'   cell data values, stub group headings, the table title, etc.).
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `sza` to create a gt table; color
#' # the `sza` column using the `data_color()`
#' # function, then, add a footnote to the
#' # `sza` column label explaining what the
#' # color scale signifies
#' tab_1 <-
#'   sza %>%
#'   dplyr::filter(
#'     latitude == 20 &
#'       month == "jan" &
#'       !is.na(sza)
#'   ) %>%
#'   dplyr::select(-latitude, -month) %>%
#'   gt() %>%
#'   data_color(
#'     columns = vars(sza),
#'     colors = scales::col_numeric(
#'       palette = c("white", "yellow", "navyblue"),
#'       domain = c(0, 90))
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Color indicates height of sun.",
#'     locations = cells_column_labels(
#'       columns = vars(sza))
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_tab_footnote_1.svg}{options: width=100\%}}
#'
#' @family Create or Modify Parts
#'
#' @export
tab_footnote <- function(data,
                         footnote,
                         locations) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- set_footnote(loc = loc, data = data, footnote = process_text(footnote))
  }

  data
}

set_footnote <- function(loc, data, footnote) {
  UseMethod("set_footnote")
}

set_footnote.cells_title <- function(loc, data, footnote) {

  if ((loc$groups %>% rlang::eval_tidy()) == "title") {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "title",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 1,
        rownum = NA_integer_,
        footnotes = footnote
      )

  } else if ((loc$groups %>% rlang::eval_tidy()) == "subtitle") {

    data <-
      dt_footnotes_add(
        data = data,
        locname = "subtitle",
        grpname = NA_character_,
        colname = NA_character_,
        locnum = 2,
        rownum = NA_integer_,
        footnotes = footnote
      )
  }

  data
}

set_footnote.cells_stubhead <- function(loc, data, footnote) {

  data <-
    dt_footnotes_add(
      data = data,
      locname = loc$groups,
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 2.5,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_column_labels <- function(loc, data, footnote) {

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- dt_boxhead_get_vars_default(data = data)[cols]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_columns",
      grpname = NA_character_,
      colname = colnames,
      locnum = 4,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_column_spanners <- function(loc, data, footnote) {

  resolved <- resolve_cells_column_spanners(data = data, object = loc)

  groups <- resolved$spanners

  data <-
    dt_footnotes_add(
      data = data,
      locname = "columns_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 3,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_group <- function(loc, data, footnote) {

  row_groups <- dt_stub_groups_get(data = data)

  # Resolve row groups
  resolved_row_groups_idx <-
    resolve_data_vals_idx(
      var_expr = !!loc$groups,
      data_tbl = NULL,
      vals = row_groups
    )

  groups <- row_groups[resolved_row_groups_idx]

  data <-
    dt_footnotes_add(
      data = data,
      locname = "stub_groups",
      grpname = groups,
      colname = NA_character_,
      locnum = 5,
      rownum = NA_integer_,
      footnotes = footnote
    )

  data
}

set_footnote.cells_body <- function(loc, data, footnote) {

  resolved <- resolve_cells_body(data = data, object = loc)

  cols <- resolved$columns
  rows <- resolved$rows

  colnames <- resolved$colnames

  data <-
    dt_footnotes_add(
      data = data,
      locname = "data",
      grpname = NA_character_,
      colname = colnames,
      locnum = 5,
      rownum = rows,
      footnotes = footnote
    )

  data
}

set_footnote.cells_stub <- function(loc, data, footnote) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  data <-
    dt_footnotes_add(
      data = data,
      locname = "stub",
      grpname = NA_character_,
      colname = NA_character_,
      locnum = 5,
      rownum = rows,
      footnotes = footnote
    )

  data
}

set_footnote.cells_summary <- function(loc, data, footnote) {

  add_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    df_type = "footnotes_df"
  )
}

set_footnote.cells_grand_summary <- function(loc, data, footnote) {

  add_grand_summary_location_row(
    loc = loc,
    data = data,
    style = footnote,
    df_type = "footnotes_df"
  )
}
