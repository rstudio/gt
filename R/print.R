#' Print the table
#' @description This facilitates printing of the
#' HTML table to the R console.
#' @param x an object of class \code{html_table}.
#' @keywords internal
#' @export
print.html_table <- function(x, ..., view = interactive()) {

  # [0.5] Creation of stub block groups
  x <-
    create_stub_block_groups(html_tbl = x)

  # [1] Creation of the content table
  x <-
    create_content_tbl(html_tbl = x)

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
    use_html_content(
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

  # Use `print()` to print to the console
  print(html_output, browse = view, ...)
}
