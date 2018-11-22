#' Add custom styles to one or more cells
#' @inheritParams fmt_number
#' @param style a vector of styles to use. The \code{\link{cells_styles}()}
#'   helper function can be used here to more easily generate valid styles.
#' @param locations the cell or set of cells to be associated with the style
#'   Supplying an object with the \code{\link{cells_data}()} helper function is
#'   a useful way to specify the cell that is associated with the style.
#'   Additionally, we can supply a list with multiple calls to
#'   \code{\link{cells_data}()} if we wish to combine multiple cell selections.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a style that is to be applied
#' # to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_style(
#'       style = cells_styles(bkgd_color = "steelblue"),
#'       locations = cells_data(
#'         columns = vars(hp),
#'         rows = c("Datsun 710", "Valiant")))
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

set_style.cells_boxhead <- function(loc, data, style) {

  if (!is.null(loc$columns)) {

    resolved <- resolve_cells_boxhead(data = data, object = loc)

    cols <- resolved$columns

    colnames <- colnames(as.data.frame(data))[cols]

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "boxhead_columns", locnum = 4,
        grpname = NA_character_, colname = colnames,
        rownum = NA_character_, text = style)

  } else if (!is.null(loc$groups)) {

    groups <- (loc$groups %>% as.character())[-1]

    attr(data, "styles_df") <-
      add_location_row(
        data, df_type = "styles_df",
        locname = "boxhead_groups", locnum = 3,
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

  resolved <- resolve_cells_boxhead(data = data, object = loc)

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
