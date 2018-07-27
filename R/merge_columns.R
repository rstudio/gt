#' Combine columns to a single value + uncertainty column
#' @param data a table object that is created using the \code{gt()} function.
#' @param col_val a single column name that contains the base values.
#' @param col_uncert a single column name that contains the uncertainty values.
#' @return an object of class \code{gt_tbl}.
#' @importFrom rlang enquo get_expr
#' @export
fmt_uncertainty <- function(data,
                            col_val,
                            col_uncert) {

  # Get the requested `col_val`
  col_val <-
    (rlang::enquo(col_val) %>% rlang::get_expr() %>% as.character())[1]

  # Get the requested `col_uncert`
  col_uncert <-
    (rlang::enquo(col_uncert) %>% rlang::get_expr() %>% as.character())[1]

  if (!(col_val %in% colnames(data)) |
      !(col_uncert %in% colnames(data))) {
    return(data)
  }

  col_1 <- stats::setNames(col_val, nm = col_uncert)
  type <- "uncertainty"

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_val %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_uncert %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["type"]] <-
      c(attr(data, "col_merge")[["type"]], type)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_1)

  } else {

    attr(data, "col_merge") <-
      list(
        type = type,
        col_1 = col_1)
  }

  data
}

#' Combine two columns to a single, value range column
#' @param data a table object that is created using the \code{gt()} function.
#' @param col_begin a column that contains values for the start of the range.
#' @param col_end a column that contains values for the end of the range.
#' @return an object of class \code{gt_tbl}.
#' @importFrom rlang enquo get_expr
#' @export
fmt_range <- function(data,
                      col_begin,
                      col_end) {

  # Get the requested `col_begin`
  col_begin <-
    (rlang::enquo(col_begin) %>% rlang::get_expr() %>% as.character())[1]

  # Get the requested `col_end`
  col_end <-
    (rlang::enquo(col_end) %>% rlang::get_expr() %>% as.character())[1]

  if (!(col_begin %in% colnames(data)) |
      !(col_end %in% colnames(data))) {
    return(data)
  }

  col_1 <- stats::setNames(col_begin, nm = col_end)
  type <- "range"

  # Create and store a list of column pairs
  if ("col_merge" %in% names(attributes(data))) {

    if (col_begin %in% unname(attr(data, "col_merge")[["col_1"]]) |
        col_end %in% names(attr(data, "col_merge")[["col_1"]])) {
      return(data)
    }

    attr(data, "col_merge")[["type"]] <-
      c(attr(data, "col_merge")[["type"]], type)

    attr(data, "col_merge")[["col_1"]] <-
      c(attr(data, "col_merge")[["col_1"]], col_1)

  } else {

    attr(data, "col_merge") <-
      list(
        type = type,
        col_1 = col_1)
  }

  data
}
