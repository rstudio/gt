#' Create gt table object
#'
#' Create a gt table object so that we can perform
#' styling transformations before transforming
#' the entire object to a display table. Using this
#' function is the first step in that process.
#' @param data a \code{data.frame} object or a
#' tibble.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset
#' tab <-
#'   gt(data = mtcars)
#'
#' # The resulting object can be used
#' # in transformations
#' tab_2 <-
#'   tab %>%
#'   cols_align_right() %>%
#'   fmt_numeric(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 1)
#'
#' # The object of this type can be
#' # displayed in the Viewer
#' tab_2
#' @export
gt <- function(data) {

  encased_tbl <- encase_tbl(data = data)

  structure(
    list(
      data = encased_tbl,
      formats = list()),
    class = "gt_tbl"
  )
}
