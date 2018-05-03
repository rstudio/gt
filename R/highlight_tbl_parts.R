
#' Highlight Table Parts and Preview
#'
#' Highlights the parts of a table in a table object
#' with color fills.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @export
highlight_tbl_parts <- function(html_tbl) {

  html_tbl %>%
    add_style_to_part(
      part = "field",
      property = "background",
      values = "#a1d3f8") %>%
    add_style_to_part(
      part = "stub",
      property = "background",
      values = "#8eaccc") %>%
    add_style_to_part(
      part = "boxhead",
      property = "background",
      values = "#f8c6a1") %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse")
}
