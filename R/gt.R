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
#' @param split_cols_dots an option to split
#' dot-separated column names such that the
#' first component is promoted to a spanner and
#' subsequent components represent the column label.
#' Please note that reference to individual columns
#' must still be via the original column names.
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
#'   cols_align_right() %>%
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
               rownames_to_stub = FALSE,
               split_cols_dots = FALSE) {

  if (rownames_to_stub) {
    stub_df <-
      data.frame(
        groupname = NA_character_,
        rowname = tibble::rownames_to_column(dplyr::as_tibble(data))$rowname,
        stringsAsFactors = FALSE)
  } else {
    stub_df <-
      data.frame(
        groupname = rep(NA_character_, nrow(data)),
        rowname = rep(NA_character_, nrow(data)))
  }

  data_tbl <- data %>% as.data.frame(stringsAsFactors = FALSE)
  rownames(data_tbl) <- NULL

  output_df <- data_tbl
  output_df[] <- NA_character_

  boxhead_df <-
    output_df[0, ] %>%
    tibble::add_row() %>%  # spanner_name
    tibble::add_row() %>%  # column_name (relabeled)
    tibble::add_row()      # alignment

  if (split_cols_dots) {

    colnames <- colnames(data_tbl)

    for (i in seq(colnames)) {
      if (grepl(".+\\..+", colnames[i])) {
        split_colname <- strsplit(colnames[i], "\\.") %>% unlist()
        boxhead_df[1, i] <- split_colname[1]
        boxhead_df[2, i] <-
          paste0(split_colname[2:length(split_colname)], collapse = ".")
      }
    }
  }

  object <-
    structure(
      list(
        input_df = data_tbl,
        boxhead_df = boxhead_df,
        stub_df = stub_df,
        forms_df = output_df,
        foot_df = output_df,
        output_df = output_df,
        formats = list(),
        decorators = list()))

  attr(object, "class") <- "gt_tbl"

  object
}
