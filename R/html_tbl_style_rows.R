#' Add inline CSS styles to specified table rows
#'
#' Modify the style of specfied table rows in
#' both the stub and field table parts.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param rows the rows that are to have the
#' style values added.
#' @param parts the table parts where rows are to
#' have styles applied. Options are either or both
#' of \code{stub} and \code{field}.
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
#' @export
add_style_to_rows <- function(html_tbl,
                              rows = NULL,
                              parts = c("stub", "field"),
                              property,
                              values) {

 # Validate the `parts` provided
 if (!any(parts %in% c("stub", "field"))) {
  stop("The value for `parts` must be either or both of `stub` or `field`.", call. = FALSE)
 }

 # If specific rows not provided assume that
 # style should be added to all rows
 if (is.null(rows)) {
  rows <-
   html_tbl[["html_table"]] %>%
   dplyr::filter(t_part == "field") %>%
   dplyr::pull(row) %>%
   unique()
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
     dplyr::filter(t_part %in% parts & row %in% rows) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(!(t_part %in% parts & row %in% rows)) %>%
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
     dplyr::filter(t_part %in% parts & row %in% rows) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(!(t_part %in% parts & row %in% rows))) %>%
   dplyr::arrange(row, column)
 }

 html_tbl
}



#' Add inline CSS styles to every n table rows
#'
#' Add an inline CSS style to every n table rows
#' in both the stub and field table parts.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @param every_n the row interval with which to
#' add an inline style.
#' @param parts the table parts where rows are to
#' have styles applied. Options are either or both
#' of \code{stub} and \code{field}.
#' @param property the CSS style property that is
#' to the added.
#' @param values values for the CSS style property.
#' This could be provided as a single-length
#' character string representing to exact string
#' to be inserted, or, as a vector of values where
#' the individual values for the property will
#' be transformed to a space-separated string.
#' @return an object of class \code{html_table}.
#' @importFrom dplyr filter pull
#' @export
add_style_every_n_rows <- function(html_tbl,
                                   every_n,
                                   parts = c("stub", "field"),
                                   property,
                                   values) {

 # Validate the `parts` provided
 if (!any(parts %in% c("stub", "field"))) {
  stop("The value for `parts` must be either or both of `stub` or `field`.", call. = FALSE)
 }

 # Get vector of all rows in the `field` part
 row_numbers <-
  html_tbl[["html_table"]] %>%
  dplyr::filter(t_part == "field") %>%
  dplyr::pull(row) %>%
  unique()

 # Get vector of rows where style is to be added
 application_rows <-
  seq(
   from = 0,
   to = max(row_numbers),
   by = every_n)[
    seq(
     from = 0,
     to = max(row_numbers),
     by = every_n) > 0]

 # Add style to specific rows
 html_tbl %>%
  add_style_to_rows(
   rows = application_rows,
   property = property,
   values = values)
}


#' Add inline CSS styles to `row 0` (boxhead and stubhead)
#'
#' Add inline CSS style to the boxhead and stubhead
#' table parts that are part of `row 0`.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
#' @export
add_style_to_row_0 <- function(html_tbl,
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
     dplyr::filter(row == 0) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(row != 0) %>%
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
     dplyr::filter(row == 0) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(row != 0)) %>%
   dplyr::arrange(row, column)
 }

 html_tbl
}


#' Add inline CSS styles to `row n` (boxhead and stubhead)
#'
#' Add inline CSS style to the boxhead and stubhead
#' table parts that are part of `row n`.
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
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
#' @export
add_style_to_row_n <- function(html_tbl,
                               property,
                               values) {

  # For any `values`, ensure that they are
  # transformed to character objects and that
  # vector components are collapsed to a single
  # string
  values <-
    paste(values, collapse = " ") %>%
    as.character()

  # Get the row number of 'row n' (the last row)
  row_n <-
    html_tbl[["html_table"]] %>%
    dplyr::pull(row) %>%
    max()

  # If the property is not yet in the `html_tbl`
  # object, then, (1) create the column, (2) add in
  # the values selectively to the <tbody> element,
  # (3) use `NA_character_` for non-targeted elements
  if (!(property %in% colnames(html_tbl[["html_table"]]))) {

    html_tbl[["html_table"]] <-
      dplyr::bind_rows(
        html_tbl[["html_table"]] %>%
          dplyr::filter(row == row_n) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(row != row_n) %>%
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
          dplyr::filter(row == row_n) %>%
          dplyr::mutate(rlang::UQ(property) := values),
        html_tbl[["html_table"]] %>%
          dplyr::filter(row != row_n)) %>%
      dplyr::arrange(row, column)
  }

  html_tbl
}
