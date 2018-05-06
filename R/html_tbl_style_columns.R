#' Add inline CSS styles to specified table columns
#'
#' Modify the style of table columns.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns the columns that are to have the
#' style values added.
#' @param include_col_n an option for whether to
#' include the rightmost column when not providing
#' explicit column names for \code{columns}.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr bind_rows filter pull mutate arrange
#' @importFrom rlang UQ
#' @noRd
add_style_to_columns <- function(html_tbl,
                                 columns = NULL,
                                 include_col_n = TRUE,
                                 property,
                                 values) {

  # If specific columns not provided assume that
  # style should be added to all columns
  if (is.null(columns)) {
    columns <-
      html_tbl[["html_table"]] %>%
      dplyr::pull(column) %>%
      unique()

    if (include_col_n == FALSE) {
      columns <- base::setdiff(columns, max(columns))
    }
  }

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <tbody> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl[["html_table"]]))) {

    html_tbl[["html_table"]] <-
      dplyr::bind_rows(
        html_tbl[["html_table"]] %>%
          dplyr::filter(column %in% columns) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(!(column %in% columns)) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <tbody> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl[["html_table"]])) {

    html_tbl[["html_table"]] <-
      dplyr::bind_rows(
        html_tbl[["html_table"]] %>%
          dplyr::filter(column %in% columns) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(!(column %in% columns))) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}

#' Add inline CSS styles to `column 0` (the stub and stubhead)
#'
#' Add inline CSS style to the stub and stubhead
#' table parts that are part of `column 0`.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr bind_rows filter pull mutate arrange
#' @importFrom rlang UQ
#' @noRd
add_style_to_column_0 <- function(html_tbl,
                                  property,
                                  values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <tbody> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl[["html_table"]]))) {

    html_tbl[["html_table"]] <-
      dplyr::bind_rows(
        html_tbl[["html_table"]] %>%
          dplyr::filter(column == 0) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(column != 0) %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <tbody> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl[["html_table"]])) {

    html_tbl[["html_table"]] <-
      dplyr::bind_rows(
        html_tbl[["html_table"]] %>%
          dplyr::filter(column == 0) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(column != 0)) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}
