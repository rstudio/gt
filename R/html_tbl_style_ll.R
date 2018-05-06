#' Add inline CSS styles to columns in an HTML table object
#'
#' Modify column styles for a table within an HTML
#' table object.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param columns an optional vector of column index
#' numbers or column names (available in the
#' \code{html_tbl}'s \code{column} and
#' \code{column_name} variables, respectively) that
#' are to be targeted for transformation. If nothing
#' is provided here then the style will be applied
#' to all columns.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an object of class \code{html_table}.
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- tab_create(tbl = iris)
#'
#' # With `add_column_style()` function,
#' # we can manually apply a CSS style to
#' # one or more columns
#' html_table_transformed <-
#'   html_table %>%
#'   add_column_style(
#'     columns = 1,
#'     property = "color",
#'     values = "blue")
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @noRd
add_column_style <- function(html_tbl,
                             columns = NULL,
                             property,
                             values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # If nothing is provided to `columns` then apply
  # the style property to all columns in the table
  if (is.null(columns)) {
    columns <-
      html_tbl[["html_table"]] %>%
      dplyr::pull(column) %>%
      unique()
  }

  # If the values provided in columns are stings,
  # we assume that column names are provided; in
  # this case, transform the column names to column
  # numbers for later transformation
  if (all(is.character(columns))) {
    columns <-
      html_tbl[["html_table"]] %>%
      dplyr::filter(column_name %in% columns) %>%
      dplyr::pull(column) %>%
      unique()
  }

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the targeted columns,
  # (3) use `NA_character_` for non-targeted columns
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
  # the targeted columns, and (2) ensure that the
  # non-targeted columns are untouched
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

#' Add inline CSS styles to the HTML table object
#'
#' Modify the overall table style for a table
#' within an HTML table object.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create} function.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- tab_create(tbl = iris)
#'
#' # With `add_table_style()` function,
#' # we can manually apply a CSS style
#' # to the <table> element
#' html_table_transformed <-
#'   html_table %>%
#'   add_table_style(
#'     property = "color",
#'     values = "blue")
#' @noRd
add_table_style <- function(html_tbl,
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
  # the values selectively to the <table> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl[["html_head"]]))) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_table_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_table_") %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <table> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl[["html_head"]])) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_table_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_table_")) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}

#' Add inline CSS styles to the header of an HTML table object
#'
#' Modify the style of the header for a table
#' within an HTML table object.
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
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- tab_create(tbl = iris)
#'
#' # With `add_header_style()` function,
#' # we can manually apply a CSS style
#' # to the <thead> element
#' html_table_transformed <-
#'   html_table %>%
#'   add_header_style(
#'     property = "color",
#'     values = "blue")
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @noRd
add_header_style <- function(html_tbl,
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
  # the values selectively to the <thead> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl[["html_head"]]))) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_thead_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_thead_") %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <thead> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl[["html_head"]])) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_thead_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_thead_")) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}

#' Add inline CSS styles to the body of an HTML table object
#'
#' Modify the style of the body for a table
#' within an HTML table object.
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
#' @examples
#' # Create an html table object using the
#' # iris dataset
#' html_table <- tab_create(tbl = iris)
#'
#' # With `add_body_style()` function,
#' # we can manually apply a CSS style
#' # to the <tbody> element
#' html_table_transformed <-
#'   html_table %>%
#'   add_body_style(
#'     property = "color",
#'     values = "blue")
#' @importFrom dplyr pull bind_rows filter mutate arrange
#' @importFrom rlang UQ
#' @noRd
add_body_style <- function(html_tbl,
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
  if (!(property %in% colnames(html_tbl[["html_head"]]))) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_tbody_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_tbody_") %>%
          dplyr::mutate(rlang::UQ(property) := NA_character_)) %>%
      dplyr::arrange(row, column)
  }

  # If the property is already in the `html_tbl`
  # object, then, (1) add in the values selectively to
  # the <tbody> element, and (2) ensure that the
  # non-targeted elements are untouched
  if (property %in% colnames(html_tbl[["html_head"]])) {

    html_tbl[["html_head"]] <-
      dplyr::bind_rows(
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name == "_tbody_") %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_head"]] %>%
          dplyr::filter(column_name != "_tbody_")) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}
