#' Quickly create an HTML table from tabular data
#'
#' Create a simple HTML table by providing a
#' \code{data.frame} or tibble object. The
#' function will sensibly style the table and
#' output an HTML fragment.
#'
#' If more control over the table styling is
#' required, then an alternative is to use the
#' \code{build_html_table()} ->
#' \code{add_column_style()} -> \code{emit_html()}
#' pattern for building and inserting a table.
#' @param tbl a \code{data.frame} object or a
#' tibble.
#' @return a character object with an HTML fragment.
#' @examples
#' # Quickly create an html table using the
#' # `quick_table()` with the iris dataset
#' html <- quick_table(iris)
#'
#' # The resulting object is an
#' # HTML fragment; and it can be viewed
#' # with `render_table()`
#' html %>% render_table()
#' @importFrom dplyr filter pull mutate
#' @importFrom stringr str_replace_all str_to_title
#' @export
quick_table <- function(tbl) {

  # With the input table, create an
  # `html_table` object
  html_tbl <- build_html_table(tbl = tbl)

  # Perform NA replacement with em dashes
  html_tbl[["html_table"]] <-
    html_tbl[["html_table"]] %>%
    dplyr::mutate(content = ifelse(is.na(content) & row > 0, "&#8212", content))

  # Perform column name transformation
  html_tbl[["html_table"]] <-
    html_tbl[["html_table"]] %>%
    dplyr::mutate(
      content = ifelse(
        row == 0,
        content %>% stringr::str_replace_all("_", " ") %>%
          stringr::str_to_title(), content))

  # Get column indices for numeric columns
  numeric_columns <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(row > 0) %>%
    dplyr::filter(type %in% c("integer", "numeric")) %>%
    dplyr::pull(column) %>%
    unique()

  # Get column indices for character-based columns
  character_columns <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(row > 0) %>%
    dplyr::filter(type == "character") %>%
    dplyr::pull(column) %>%
    unique()

  # Align text for any numeric columns to the right
  if (length(numeric_columns) > 0) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        columns = numeric_columns,
        property = "text-align",
        values = "right")
  }

  # Align text for any character-based columns to the left
  if (length(character_columns) > 0) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        columns = character_columns,
        property = "text-align",
        values = "left")
  }

  html_tbl <-
    html_tbl %>%
    add_column_style(
      property = "padding",
      values = "5px") %>%
    add_header_style(
      property = "border-top",
      values = "2px solid #ddd") %>%
    add_header_style(
      property = "border-bottom",
      values = "2px solid #ddd") %>%
    add_column_style(
      property = "border-bottom",
      values = "1px solid #ddd") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_table_style(
      property = "border-collapse",
      value = "collapse"
    )

  emit_html(html_tbl = html_tbl)
}
