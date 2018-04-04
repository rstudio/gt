
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

  index <- get_next_index(tbl = html_tbl[["transform_directives"]])

  if (is.null(column)) {
    column <- NA_character_
  }

  # Apply Transform Directive
  html_tbl[["transform_directives"]] <-
    html_tbl[["transform_directives"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "to_stub",
      transform_v1 = column)

  # Perform all tbl transform steps
  html_tbl <- all_tbl_transform_steps(html_tbl = html_tbl)

  html_tbl[["html_table"]] <-
    create_html_table_tbl(tbl = html_tbl[["modified_tbl"]])

  html_tbl
}
