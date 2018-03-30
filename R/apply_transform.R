#' Apply left alignment to column data
#'
#' Apply the left alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the left alignment should be applied.
#' @param types an optional vector of column types
#' for which the left alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_left <- function(html_tbl,
                                 columns = NULL,
                                 types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_left",
      transform = transform,
      enabled = TRUE)

  html_tbl
}


#' Apply center alignment to column data
#'
#' Apply the center alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the center alignment should be applied.
#' @param types an optional vector of column types
#' for which the center alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_center <- function(html_tbl,
                                   columns = NULL,
                                   types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_center",
      transform = transform,
      enabled = TRUE)

  html_tbl
}

#' Apply right alignment to column data
#'
#' Apply the right alignment rule to data cells within
#' table columns. Options exist to selectively
#' apply the alignment to specified column names or
#' to columns of certain types.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param columns an optional vector of column names
#' for which the right alignment should be applied.
#' @param types an optional vector of column types
#' for which the right alignment should be applied.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull mutate case_when
#' @export
apply_alignment_right <- function(html_tbl,
                                   columns = NULL,
                                   types = NULL) {

  if (!is.null(columns)) {

    transform <-
      columns %>%
      paste(collapse = ";") %>%
      paste0("columns:", .)
  }

  if (!is.null(types)) {

    transform <-
      types %>%
      paste(collapse = ";") %>%
      paste0("types:", .)
  }

  if (is.null(columns) & is.null(types)) {
    transform <- NA_character_
  }

  html_tbl[["transform_opts"]] <-
    html_tbl[["transform_opts"]] %>%
    tibble::add_row(
      type = "alignment_right",
      transform = transform,
      enabled = TRUE)

  html_tbl
}

#' Apply the striped theme to the table
#'
#' Apply the striped theme to the table. This
#' adds striped rows, reasonably thick horizontal
#' rules enclosing the boxhead and stubhead and
#' a similar horizontal rule below the field and
#' stub.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
        values = "center")
  }

  # Align text for any character-based columns to the left
  if (length(character_columns) > 0) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        columns = character_columns,
        property = "text-align",
        values = "center")
  }

  html_tbl %>%
    add_table_style(
      property = "border-collapse",
      values = "collapse") %>%
    add_table_style(
      property = "width",
      values = "100%") %>%
    add_style_to_row_0(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "border-top",
      values = "2px solid #A8A8A8") %>%
    add_style_to_row_0(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_0(
      property = "margin",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_rows(
      property = "padding",
      values = "10px") %>%
    add_style_to_row_n(
      property = "border-bottom",
      values = "2px solid #A8A8A8") %>%
    add_style_every_n_rows(
      every_n = 2,
      property = "background",
      values = "#E5E6EB")
}


#' Apply spanner headings
#'
#' If column names in the \code{tbl} supplied
#' use the naming convention of
#' \code{[spanner_heading].[column_heading]},
#' we can invoke \code{apply_spanner_headings()}
#' to allow for parsing and expansion of column
#' headings into one or more boxhead panels
#' with spanner headings and column headings.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr tibble
#' @importFrom stringr str_detect str_replace
#' @export
apply_spanner_headings <- function(html_tbl) {

  # Get column names and determine groupings
  # via format of `[group].[column_name]`
  group_cols <-
    html_tbl[["source_tbl"]] %>%
    colnames() %>%
    stringr::str_detect(pattern = ".*?\\..*?") %>%
    which()

  # Create `boxhead_panel_tbl` object
  boxhead_panel_tbl <-
    dplyr::tibble(
      column_name = (html_tbl[["source_tbl"]] %>%
                       colnames())[group_cols],
      spanner_heading = (html_tbl[["source_tbl"]] %>%
                           colnames())[group_cols] %>%
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\1"),
      column_heading = (html_tbl[["source_tbl"]] %>%
                          colnames())[group_cols] %>%
        str_replace(
          pattern = "(.*?)\\.(.*)",
          replacement = "\\2"))

  # Replace `boxhead_panel` component with
  # `boxhead_panel_tbl` table
  html_tbl[["boxhead_panel"]] <- boxhead_panel_tbl

  html_tbl
}
