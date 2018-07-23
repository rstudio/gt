#' Create gt table object
#'
#' Create a gt table object so that we can perform
#' styling transformations before transforming
#' the entire object to a display table. Using this
#' function is the first step in that process.
#' @param data a \code{data.frame} object or a
#' tibble.
#' @param rownames_to_stub an option to take
#' rownames from the input \code{data} table
#' as row captions in the stub.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset
#' tab <-
#'   gt(mtcars, rownames_to_stub = TRUE)
#'
#' # The resulting object can be used
#' # in transformations
#' tab_2 <-
#'   tab %>%
#'   fmt_number(
#'     columns = c("drat", "wt", "qsec"),
#'     decimals = 1)
#'
#' # The object of this type can be
#' # displayed in the Viewer
#' tab_2
#' @importFrom tibble rownames_to_column
#' @export
gt <- function(data,
               rownames_to_stub = FALSE) {

  if (rownames_to_stub) {

    stub_df <-
      data.frame(
        groupname = NA_character_,
        rowname = rownames(data),
        stringsAsFactors = FALSE)

  } else {

    stub_df <-
      data.frame(
        groupname = rep(NA_character_, nrow(data)),
        rowname = rep(NA_character_, nrow(data)),
        stringsAsFactors = FALSE)
  }

  data_tbl <- data %>% as.data.frame(stringsAsFactors = FALSE)
  rownames(data_tbl) <- NULL

  empty_df <- data_tbl
  empty_df[] <- NA_character_

  boxh_df <-
    empty_df[0, ] %>%
    tibble::add_row() %>%  # spanner_name
    tibble::add_row() %>%  # column_name (relabeled)
    tibble::add_row()      # alignment

  attr(data_tbl, "boxh_df") <- boxh_df
  attr(data_tbl, "stub_df") <- stub_df

  attr(data_tbl, "fmts_df") <- empty_df
  attr(data_tbl, "foot_df") <- empty_df

  attr(data_tbl, "formats_html") <- list()
  attr(data_tbl, "formats_rtf") <- list()
  attr(data_tbl, "formats_text") <- list()

  attr(data_tbl, "decorators") <- list()

  class(data_tbl) <- c("gt_tbl", class(data_tbl))

  data_tbl
}
