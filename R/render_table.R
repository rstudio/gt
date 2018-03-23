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
