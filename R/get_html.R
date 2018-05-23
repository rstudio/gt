#' Return the table as an HTML fragment
#'
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @export
get_html <- function(html_tbl) {

  x <- html_tbl %>% unclass()

  # Creation of stub block groups
  x <-
    gt:::create_stub_block_groups(html_tbl = x)

  # Creation of the content table
  x <-
    gt:::create_content_tbl(html_tbl = x)

  # Modification of the content table
  x <-
    gt:::all_tbl_format_steps(
      html_tbl = x)

  # Processing of the content table
  x <-
    gt:::process_content_tbl(
      html_tbl = x)

  # Creation of the HTML table
  x <-
    gt:::create_html_table_tbl(
      html_tbl = x)

  # Join in formatted content
  x <-
    gt:::use_html_content(
      html_tbl = x)

  # Merge columns
  x <-
    gt:::merge_columns(
      html_tbl = x)

  # Apply HTML aesthetics
  x <-
    gt:::use_html_aesthetics(
      html_tbl = x,
      aesthetics_tbl = x[["aesthetics"]])

  # Generation of table HTML
  x <- gt:::create_html(html_tbl = x)

  x
}
