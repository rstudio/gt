#' Option to modify the set of footnote marks
#'
#' Alter the footnote marks for any footnotes that may be present in the table.
#' Either a vector of marks can be provided (including Unicode characters), or,
#' a specific keyword could be used to signify a preset sequence. This function
#' serves as a shortcut for using `tab_options(footnotes.marks = {marks})`
#'
#' We can supply a vector of that will represent the series of marks.
#' The series of footnote marks is recycled when its usage goes beyond the
#' length of the set. At each cycle, the marks are simply doubled, tripled, and
#' so on (e.g., `*` -> `**` -> `***`). The option exists for providing keywords
#' for certain types of footnote marks. The keywords are:
#'
#' \itemize{
#' \item `"numbers"`: numeric marks, they begin from 1 and these marks are not
#' subject to recycling behavior
#' \item `"letters"`: miniscule alphabetic marks, internally uses the `letters`
#' vector
#' which contains 26 lowercase letters of the Roman alphabet
#' \item `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
#' which has 26 uppercase letters of the Roman alphabet
#' \item `"standard"`: symbolic marks, four symbols in total
#' \item `"extended"`: symbolic marks, extends the standard set by adding two
#' more symbols, making six
#' }
#'
#' @inheritParams fmt_number
#' @param marks Either a vector (that will represent the series of marks) or a
#'   keyword that represents a preset sequence of marks. The valid keywords are:
#'   `"numbers"` (for numeric marks), `"letters"` and `"LETTERS"` (for lowercase
#'   and uppercase alphabetic marks), `"standard"` (for a traditional set of
#'   four symbol marks), and `"extended"` (which adds two more symbols to the
#'   standard set).
#'
#' @examples
#' # Use `sza` to create a gt table,
#' # adding three footnotes; call
#' # `opt_footnote_marks()` to specify
#' # which footnote marks to use
#' tab_1 <-
#'   sza %>%
#'   dplyr::group_by(latitude, tst) %>%
#'   dplyr::summarize(
#'     SZA.Max = max(sza),
#'     SZA.Min = min(sza, na.rm = TRUE)
#'   ) %>%
#'   dplyr::ungroup() %>%
#'   dplyr::filter(latitude == 30, !is.infinite(SZA.Min)) %>%
#'   dplyr::select(-latitude) %>%
#'   gt(rowname_col = "tst") %>%
#'   tab_spanner_delim(delim = ".") %>%
#'   fmt_missing(
#'     columns = everything(),
#'     missing_text = "90+"
#'   ) %>%
#'   tab_stubhead("TST") %>%
#'   tab_footnote(
#'     footnote = "True solar time.",
#'     locations = cells_stubhead()
#'   ) %>%
#'   tab_footnote(
#'     footnote = "Solar zenith angle.",
#'     locations = cells_column_spanners(spanners = "SZA")
#'   ) %>%
#'   tab_footnote(
#'     footnote = "The Lowest SZA.",
#'     locations = cells_stub(rows = "1200")
#'   ) %>%
#'   opt_footnote_marks(marks = "standard")
#'
#' @section Figures:
#' \if{html}{\figure{man_opt_footnote_marks_1.svg}{options: width=100\%}}
#'
#' @family table option functions
#'
#' @export
opt_footnote_marks <- function(data,
                               marks = NULL) {

  if (!is.null(marks)) {
    data <- data %>% tab_options(footnotes.marks = marks)
  }

  data
}


#' Option to remove the top and bottom borders
#'
#' @inheritParams fmt_number
#'
#' @family table option functions
#'
#' @export
opt_remove_top_bottom_borders <- function(data) {

  data %>%
    tab_options(table.border.top.style = "hidden") %>%
    tab_options(table.border.bottom.style = "hidden")
}


#' Option to wrap an outline around the entire table
#'
#' @inheritParams fmt_number
#' @param style,width,color The style, width, and color properties for the table
#'   border.
#'
#' @family table option functions
#'
#' @export
opt_table_outline <- function(data,
                              style = "solid",
                              width = px(3),
                              color = "#D3D3D3") {

  data %>%
    tab_options(
      table.border.top.style = style,
      table.border.top.width = width,
      table.border.top.color = color,
      table.border.bottom.style = style,
      table.border.bottom.width = width,
      table.border.bottom.color = color,
      table.border.left.style = style,
      table.border.left.width = width,
      table.border.left.color = color,
      table.border.right.style = style,
      table.border.right.width = width,
      table.border.right.color = color,
      heading.border.lr.style = style,
      heading.border.lr.width = width,
      heading.border.lr.color = color,
      column_labels.border.lr.style = style,
      column_labels.border.lr.width = width,
      column_labels.border.lr.color = color,
      row_group.border.left.style = style,
      row_group.border.left.width = width,
      row_group.border.left.color = color,
      row_group.border.right.style = style,
      row_group.border.right.width = width,
      row_group.border.right.color = color,
      table_body.border.top.style = style,
      table_body.border.top.width = width,
      table_body.border.bottom.style = style,
      table_body.border.bottom.width = width,
      footnotes.border.lr.style = style,
      footnotes.border.lr.width = width,
      footnotes.border.lr.color = color,
      source_notes.border.lr.style = style,
      source_notes.border.lr.width = width,
      source_notes.border.lr.color = color
    )
}
