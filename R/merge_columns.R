#' Merge two columns to a single column with a formatter
#' @param data a table object that is created using the \code{gt()} function.
#' @param col_1 a column that contains values for the start of the range.
#' @param col_2 a column that contains values for the end of the range.
#' @return an object of class \code{gt_tbl}.
#' @export
cols_merge <- function(data,
                       col_1,
                       col_2,
                       format = "{1} {2}") {

  # If using the `vars()` helper, get `col_1` as a character vector
  if (inherits(col_1, "quosures")) {
    col_1 <- col_1 %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_2` as a character vector
  if (inherits(col_2, "quosures")) {
    col_2 <- col_2 %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_1 %in% colnames(data)) |
      !(col_2 %in% colnames(data))) {
    return(data)
  }

  col_1 <- stats::setNames(col_1, nm = col_2)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_1 %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_2 %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["format"]] <-
      c(attr(data, "col_merge")[["format"]], format)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_1)

  } else {

    attr(data, "col_merge") <-
      list(
        format = format,
        col_1 = col_1)
  }

  data
}

#' Merge two columns to a value + uncertainty column
#' @param data a table object that is created using the \code{gt()} function.
#' @param col_val a single column name that contains the base values.
#' @param col_uncert a single column name that contains the uncertainty values.
#' @return an object of class \code{gt_tbl}.
#' @export
cols_merge_uncert <- function(data,
                              col_val,
                              col_uncert) {

  format <- "{1} \u00B1 {2}"

  # If using the `vars()` helper, get `col_val` as a character vector
  if (inherits(col_val, "quosures")) {
    col_val <- col_val %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_uncert` as a character vector
  if (inherits(col_uncert, "quosures")) {
    col_uncert <- col_uncert %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_val %in% colnames(data)) |
      !(col_uncert %in% colnames(data))) {
    return(data)
  }

  col_val <- stats::setNames(col_val, nm = col_uncert)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_val %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_uncert %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["format"]] <-
      c(attr(data, "col_merge")[["format"]], format)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_val)

  } else {

    attr(data, "col_merge") <-
      list(
        format = format,
        col_1 = col_val)
  }

  data
}

#' Merge two columns to a value range column
#' @param data a table object that is created using the \code{gt()} function.
#' @param col_begin a column that contains values for the start of the range.
#' @param col_end a column that contains values for the end of the range.
#' @return an object of class \code{gt_tbl}.
#' @export
cols_merge_range <- function(data,
                             col_begin,
                             col_end) {

  format <- "{1} \u2014 {2}"

  # If using the `vars()` helper, get `col_begin` as a character vector
  if (inherits(col_begin, "quosures")) {
    col_begin <- col_begin %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get `col_end` as a character vector
  if (inherits(col_end, "quosures")) {
    col_end <- col_end %>% lapply(`[[`, 2) %>% as.character()
  }

  if (!(col_begin %in% colnames(data)) |
      !(col_end %in% colnames(data))) {
    return(data)
  }

  col_begin <- stats::setNames(col_begin, nm = col_end)

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_begin %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_end %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["format"]] <-
      c(attr(data, "col_merge")[["format"]], format)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_begin)

  } else {

    attr(data, "col_merge") <-
      list(
        format = format,
        col_1 = col_begin)
  }

  data
}
