#' Knit print the table
#' @description This facilitates printing of the
#' HTML table within a knitr code chunk.
#' @param x an object of class \code{html_table}.
#' @keywords internal
#' @importFrom knitr knit_print
#' @export
knit_print.html_table <- function(x, ...) {

  # [1] Creation of the content table
  x[["content_tbl"]] <-
    create_content_tbl(tbl = x[["modified_tbl"]])

  # [2] Modification of the content table
  x <-
    all_tbl_format_steps(
      html_tbl = x)

  # [3] Processing of the content table
  x[["content_tbl"]] <-
    process_content_tbl(
      tbl = x[["content_tbl"]])

  # [4] Creation of the HTML table
  x[["html_table"]] <-
    create_html_table_tbl(
      tbl = x[["modified_tbl"]])

  # [5] Join in formatted content
  x[["html_table"]] <-
    use_html_content(
      html_tbl = x[["html_table"]],
      content_tbl = x[["content_tbl"]])

  # [6] Apply HTML aesthetics
  x <-
    use_html_aesthetics(
      html_tbl = x,
      aesthetics_tbl = x[["aesthetics"]])

  # [7] Generatation of table HTML
  html_output <- gt:::create_html(html_tbl = x)

  # Use `knit_print()` to print in a code chunk
  knit_print(html_output, ...)

  #knit_print(x[["html_tbl_text"]], ...)
}
