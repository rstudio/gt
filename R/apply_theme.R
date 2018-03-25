#' Apply the striped theme to the table
#'
#' Apply the striped theme to the table. This
#' adds striped rows, reasonably thick horizontal
#' rules enclosing the boxhead and stubhead and
#' a similar horizontal rule below the field and
#' stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{build_html_table()}
#' function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_theme_striped <- function(html_tbl) {

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

  html_tbl %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_table_style(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-top",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "padding",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_every_n_rows(
      every_n = 2,
      property = "background",
      values = "#E5E6EB")
}
