
#' Decode the transform related to column names
#' and column types
#' @importFrom stringr str_replace str_split
#' @return a named character vector.
#' @noRd
decode_col_type_transform <- function(transform_text) {

  if (stringr::str_detect(
    string = transform_text,
    pattern = "^columns:.*")) {

    columns <-
      transform_text %>%
      stringr::str_replace("^columns:(.*)", "\\1") %>%
      stringr::str_split(pattern = ";") %>%
      unlist()

    names(columns) <- rep("column", length(columns))

    return(columns)
  }

  if (stringr::str_detect(
    string = transform_text,
    pattern = "^types:.*")) {

    types <-
      transform_text %>%
      stringr::str_replace("^types:(.*)", "\\1") %>%
      stringr::str_split(pattern = ";") %>%
      unlist()

    names(types) <- rep("type", length(types))

    return(types)
  }
}


#' HTT: apply_alignment_left()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_alignment_left <- function(html_tbl,
                               transform) {

  if (is.na(transform)) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        property = "text-align",
        values = "left")

    return(html_tbl)
  }
}

#' HTT: apply_alignment_center()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_alignment_center <- function(html_tbl,
                                 transform) {

  if (is.na(transform)) {

    html_tbl <-
      html_tbl %>%
      add_column_style(
        property = "text-align",
        values = "center")

    return(html_tbl)
  }
}


#' HTT: apply_theme_striped()
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @return an object of class \code{html_table}.
#' @noRd
htt_theme_striped <- function(html_tbl) {

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


