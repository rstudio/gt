#' Print the table
#' @description This facilitates printing of the
#' HTML table to the R console.
#' @param x an object of class \code{html_table}.
#' @keywords internal
#' @export
print.html_table <- function(x, ..., view = interactive()) {

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

  # Use `print()` to print to the console
  print(html_output, browse = view, ...)
}
