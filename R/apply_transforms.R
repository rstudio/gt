
#' Add a stub to a table
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param column an option to use an existing
#' column as the stub.
#' @return an object of class \code{html_table}.
#' @importFrom tibble add_row
#' @export
add_stub <- function(html_tbl,
                     column = NULL) {

  index <- get_next_index(tbl = html_tbl[["transforms"]])

  if (is.null(column)) {
    column <- NA_character_
  }

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "to_stub",
      transform_v1 = column)


  ## [1] Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  ## [2] Creation of the content table
  html_tbl[["content_tbl"]] <-
    create_content_tbl(tbl = html_tbl[["modified_tbl"]])

  ## [2.5] Modification of the content table
  html_tbl <-
    all_tbl_format_steps(
      html_tbl = html_tbl)

  ## [3] Processing of the content table
  html_tbl[["content_tbl"]] <-
    process_content_tbl(
      tbl = html_tbl[["content_tbl"]])

  ## [4] Creation of the HTML table
  html_tbl[["html_table"]] <-
    create_html_table_tbl(
      tbl = html_tbl[["modified_tbl"]])

  ## [5] Join in formatted content
  html_tbl[["html_table"]] <-
    use_html_content(
      html_tbl = html_tbl[["html_table"]],
      content_tbl = html_tbl[["content_tbl"]])

  ## [6] Apply HTML aesthetics
  html_tbl <-
    use_html_aesthetics(
      html_tbl = html_tbl,
      aesthetics_tbl = html_tbl[["aesthetics"]])

  html_tbl
}
