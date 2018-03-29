#' Render an HTML table object
#'
#' View an HTML table in the viewer pane.
#' @param x a \code{data.frame} object, a tibble,
#' or an object of class \code{html_table}.
#' @importFrom glue glue
#' @importFrom htmltools HTML html_print
#' @export

render_table <- function(x) {

 if (inherits(x, "data.frame")) {

  html_table <- x %>% quick_table()

 } else if (inherits(x, "html_table")) {

  html_table <- emit_html(html_tbl = x)

 } else if (inherits(x, "knit_asis")) {

  html_table <- x %>% as.character()
 }

 html_view <-
  glue(
   "
  <!doctype html>
  <html>
  <head>
  <title></title>
  </head>
  <body>
   {html_table}
  </body>
  </html>"
  ) %>% as.character()

 html_view %>%
  htmltools::HTML() %>%
  htmltools::html_print()
}


#' Highlight Table Parts and Preview
#'
#' Highlights the parts of a table in a table object
#' with color fills.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
      values = "collapse") %>%
    emit_html() %>%
    render_table()
}
