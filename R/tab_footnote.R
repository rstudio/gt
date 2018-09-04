#' Add a table footnote
#'
#' Add a footnote with a glyph attached to the targeted cells, rows, or columns.
#' @inheritParams fmt_number
#' @param footnote text to be used in the footnote.
#' @param locations the cell or set of cells to be associated with the footnote.
#'   Supplying an object with the \code{\link{data_cells}()} helper function is
#'   a useful way to specify the cell that is associated with the footnote.
#'   Additionally, we can supply a list with multiple calls to
#'   \code{\link{data_cells}()} if we wish to combine multiple cell selections.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Add a footnote that is in
#' # reference to a single table cell
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE) %>%
#'     tab_footnote(
#'       footnote = "Massive hp.",
#'       locations = data_cells(
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

set_footnote.data_cells <- function(loc, data, footnote) {

  resolved <- resolve_data_cells(data = data, object = loc)

  cols <- resolved$columns
  rows <- resolved$rows

  colnames <- colnames(as.data.frame(data))[cols]

  footnotes_df <-
    dplyr::bind_rows(
      attr(data, "footnotes_df", exact = TRUE),
      dplyr::tibble(
        locname = "data",
        locnum = 5,
        grpname = NA_character_,
        colname = colnames,
        rownum = rows,
        text = footnote)) %>%
    dplyr::distinct()

  attr(data, "footnotes_df") <- footnotes_df

  data
}

set_footnote.stub_cells <- function(loc, data, footnote) {

  resolved <- resolve_stub_cells(data = data, object = loc)

  rows <- resolved$rows

  footnotes_df <-
    dplyr::bind_rows(
      attr(data, "footnotes_df", exact = TRUE),
      dplyr::tibble(
        locname = "stub",
        locnum = 5,
        grpname = NA_character_,
        colname = NA_character_,
        rownum = rows,
        text = footnote)) %>%
    dplyr::distinct()

  attr(data, "footnotes_df") <- footnotes_df

  data
}

set_footnote.boxhead_cells <- function(loc, data, footnote) {

  if (!is.null(loc$columns)) {

    resolved <- resolve_boxhead_cells(data = data, object = loc)

    cols <- resolved$columns

    colnames <- colnames(as.data.frame(data))[cols]

    footnotes_df <-
      dplyr::bind_rows(
        attr(data, "footnotes_df", exact = TRUE),
        dplyr::tibble(
          locname = "boxhead_columns",
          locnum = 4,
          grpname = NA_character_,
          colname = colnames,
          rownum = NA_character_,
          text = footnote)) %>%
      dplyr::distinct()

    attr(data, "footnotes_df") <- footnotes_df

  } else if (!is.null(loc$groups)) {

    groups <- (loc$groups %>% as.character())[-1]

    footnotes_df <-
      dplyr::bind_rows(
        attr(data, "footnotes_df", exact = TRUE),
        dplyr::tibble(
          locname = "boxhead_groups",
          locnum = 3,
          grpname = groups,
          colname = NA_character_,
          rownum = NA_character_,
          text = footnote)) %>%
      dplyr::distinct()

    attr(data, "footnotes_df") <- footnotes_df
  }

  data
}

set_footnote.group_cells <- function(loc, data, footnote) {

  groups <- (loc$groups %>% as.character())[-1]

  footnotes_df <-
    dplyr::bind_rows(
      attr(data, "footnotes_df", exact = TRUE),
      dplyr::tibble(
        locname = "stub_groups",
        locnum = 5,
        grpname = groups,
        colname = NA_character_,
        rownum = NA_character_,
        text = footnote)) %>%
    dplyr::distinct()

  attr(data, "footnotes_df") <- footnotes_df


  data
}

set_footnote.title_cells <- function(loc, data, footnote) {

  if ((loc$groups %>% as.character())[-1] == "title") {

    footnotes_df <-
      dplyr::bind_rows(
        attr(data, "footnotes_df", exact = TRUE),
        dplyr::tibble(
          locname = "title",
          locnum = 1,
          grpname = NA_character_,
          colname = NA_character_,
          rownum = NA_character_,
          text = footnote)) %>%
      dplyr::distinct()

    attr(data, "footnotes_df") <- footnotes_df

  } else if ((loc$groups %>% as.character())[-1] == "headnote") {

    footnotes_df <-
      dplyr::bind_rows(
        attr(data, "footnotes_df", exact = TRUE),
        dplyr::tibble(
          locname = "headnote",
          locnum = 2,
          grpname = NA_character_,
          colname = NA_character_,
          rownum = NA_character_,
          text = footnote)) %>%
      dplyr::distinct()

    attr(data, "footnotes_df") <- footnotes_df
  }

  data
}

#' @export
get_footnotes_tbl <- function(data) {

  attr(data, "footnotes_df")
}

#' @export
get_rows_tbl <- function(data) {

  attr(data, "rows_df")
}
