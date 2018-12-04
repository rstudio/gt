#' Add a table footnote
#'
#' Add a footnote with a glyph attached to the targeted cells, rows, or columns.
#' @inheritParams fmt_number
#' @param footnote the text to be used in the footnote. We can optionally use
#'   the \code{\link{md}()} and \code{\link{html}()} functions to style the text
#'   as Markdown or to retain HTML elements in the footnote text.
#' @param locations the cell or set of cells to be associated with the footnote.
#'   Supplying any of the \code{cells_*()} helper functions is a useful way to
#'   target the location cells that are associated with the footnote text. These
#'   helper functions are: \code{\link{cells_title}()},
#'   \code{\link{cells_column_labels}()}, \code{\link{cells_group}()},
#'   \code{\link{cells_stub}()}, \code{\link{cells_data}()}, and
#'   \code{\link{cells_summary}()}. Please see the help article
#'   \link{location_cells} for more information on how these helper functions
#'   can be used. Additionally, we can enclose several \code{cells_*()} calls
#'   within a \code{list()} if we wish to link the footnote text to different
#'   types of locations (e.g., cell data values, stub group headings, the table
#'   title, etc.).
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a footnote that is in
#' # reference to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_footnote(
#'       footnote = "Massive hp.",
#'       locations = cells_data(
#'         columns = "hp",
#'         rows = "Maserati Bora"))
#' @family table-part creation/modification functions
#' @export
tab_footnote <- function(data,
                         footnote,
                         locations) {

  # Resolve into a list of locations
  locations <- as_locations(locations)

  # Resolve the locations of the targeted data cells and append
  # the footnotes
  for (loc in locations) {
    data <- set_footnote(loc, data, process_text(footnote))
  }

  data
}

set_footnote <- function(loc, data, footnote) {
  UseMethod("set_footnote")
}

set_footnote.cells_data <- function(loc, data, footnote) {

  resolved <- resolve_cells_data(data = data, object = loc)

  cols <- resolved$columns
  rows <- resolved$rows

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "footnotes_df") <-
    add_location_row(
      data, df_type = "footnotes_df",
      locname = "data", locnum = 5,
      grpname = NA_character_, colname = colnames,
      rownum = rows, text = footnote)

  data
}

set_footnote.cells_stub <- function(loc, data, footnote) {

  resolved <- resolve_cells_stub(data = data, object = loc)

  rows <- resolved$rows

  attr(data, "footnotes_df") <-
    add_location_row(
      data, df_type = "footnotes_df",
      locname = "stub", locnum = 5,
      grpname = NA_character_, colname = NA_character_,
      rownum = rows, text = footnote)

  data
}

set_footnote.cells_column_labels <- function(loc, data, footnote) {

  if (!is.null(loc$columns)) {

    resolved <- resolve_cells_column_labels(data = data, object = loc)

    cols <- resolved$columns

    colnames <- colnames(as.data.frame(data))[cols]

    attr(data, "footnotes_df") <-
      add_location_row(
        data, df_type = "footnotes_df",
        locname = "columns_columns", locnum = 4,
        grpname = NA_character_, colname = colnames,
        rownum = NA_character_, text = footnote)

  } else if (!is.null(loc$groups)) {

    groups <- (loc$groups %>% as.character())[-1]

    attr(data, "footnotes_df") <-
      add_location_row(
        data, df_type = "footnotes_df",
        locname = "columns_groups", locnum = 3,
        grpname = groups, colname = NA_character_,
        rownum = NA_character_, text = footnote)
  }

  data
}

set_footnote.cells_group <- function(loc, data, footnote) {

  groups <- (loc$groups %>% as.character())[-1]

  attr(data, "footnotes_df") <-
    add_location_row(
      data, df_type = "footnotes_df",
      locname = "stub_groups", locnum = 5,
      grpname = groups, colname = NA_character_,
      rownum = NA_character_, text = footnote)

  data
}

set_footnote.cells_title <- function(loc, data, footnote) {

  if ((loc$groups %>% as.character())[-1] == "title") {

    attr(data, "footnotes_df") <-
      add_location_row(
        data, df_type = "footnotes_df",
        locname = "title", locnum = 1,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, text = footnote)

  } else if ((loc$groups %>% as.character())[-1] == "subtitle") {

    attr(data, "footnotes_df") <-
      add_location_row(
        data, df_type = "footnotes_df",
        locname = "subtitle", locnum = 2,
        grpname = NA_character_, colname = NA_character_,
        rownum = NA_character_, text = footnote)
  }

  data
}

set_footnote.cells_summary <- function(loc, data, footnote) {

  groups <- (loc$groups %>% as.character())[-1]
  rows <- (loc$rows %>% as.character())[-1] %>% as.integer()

  resolved <- resolve_cells_column_labels(data = data, object = loc)

  cols <- resolved$columns

  colnames <- colnames(as.data.frame(data))[cols]

  attr(data, "footnotes_df") <-
    add_location_row(
      data, df_type = "footnotes_df",
      locname = "summary_cells", locnum = 5,
      grpname = groups, colname = colnames,
      rownum = rows, text = footnote)

  data
}

#' @importFrom dplyr bind_rows tibble distinct
#' @noRd
add_location_row <- function(data,
                             df_type,
                             locname,
                             locnum,
                             grpname,
                             colname,
                             rownum,
                             text) {

  dplyr::bind_rows(
    attr(data, df_type, exact = TRUE),
    dplyr::tibble(
      locname = locname, locnum = locnum,
      grpname = grpname, colname = colname,
      rownum = rownum, text = text)) %>%
    dplyr::distinct()
}
