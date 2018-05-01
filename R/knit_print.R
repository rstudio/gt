#' Knit print the table
#' @description This facilitates printing of the
#' HTML table within a knitr code chunk.
#' @param x an object of class \code{html_table}.
#' @keywords internal
#' @importFrom knitr knit_print
#' @export
knit_print.html_table <- function(x, ...) {

  # [1] Creation of the content table
  x <-
    gt:::create_content_tbl(html_tbl = x)

  # [2] Modification of the content table
  x <-
    all_tbl_format_steps(
      html_tbl = x)

  # [3] Processing of the content table
  x <-
    process_content_tbl(
      html_tbl = x)

  # [4] Creation of the HTML table
  x <-
    create_html_table_tbl(
      html_tbl = x)

  # [5] Join in formatted content
  x <-
    gt:::use_html_content(
      html_tbl = x)

  # [6] Merge columns
  x <-
    merge_columns(
      html_tbl = x)

  # [7] Apply HTML aesthetics
  x <-
    use_html_aesthetics(
      html_tbl = x,
      aesthetics_tbl = x[["aesthetics"]])

  # [8] Generation of table HTML
  html_output <- create_html(html_tbl = x)

  # Use `knit_print()` to print in a code chunk
  knitr::knit_print(html_output, ...)
}
