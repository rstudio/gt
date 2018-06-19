#' Add inline CSS styles to a table part
#'
#' Modify the style of a specific table part.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param part a table part which could be any
#' of \code{stub}, \code{boxhead}, or \code{field}.
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
#' @import rlang
#' @noRd
add_style_to_part <- function(html_tbl,
                              part,
                              property,
                              values) {

 # Validate the `part` provided
 if (!(part %in% c("stub", "boxhead", "field"))) {
  stop("The value for `part` must be either `stub`, `boxhead`, or `field`", call. = FALSE)
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
     dplyr::filter(t_part == part) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(t_part != part | is.na(t_part)) %>%
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
     dplyr::filter(t_part == part) %>%
     dplyr::mutate(rlang::UQ(property) := values),
    html_tbl[["html_table"]] %>%
     dplyr::filter(t_part != part | is.na(t_part))) %>%
   dplyr::arrange(row, column)
 }

 html_tbl
}
