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
#' @param output the output format for the table.
#' Currently, this is only the \code{html} format.
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
               split_cols_dots = FALSE,
               output = "html") {

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
        rowname = rep(NA_character_, nrow(data)),
        stringsAsFactors = FALSE)
  }

  data_tbl <- data %>% as.data.frame(stringsAsFactors = FALSE)
  rownames(data_tbl) <- NULL

  output_df <- data_tbl
  output_df[] <- NA_character_

  boxh_df <-
    output_df[0, ] %>%
    tibble::add_row() %>%  # spanner_name
    tibble::add_row() %>%  # column_name (relabeled)
    tibble::add_row()      # alignment

  if (split_cols_dots) {

    colnames <- colnames(data_tbl)

    for (i in seq(colnames)) {
      if (grepl(".+\\..+", colnames[i])) {
        split_colname <- strsplit(colnames[i], "\\.") %>% unlist()
        boxh_df[1, i] <- split_colname[1]
        boxh_df[2, i] <-
          paste0(split_colname[2:length(split_colname)], collapse = ".")
      }
    }
  }

  attr(data_tbl, "boxh_df") <- boxh_df
  attr(data_tbl, "stub_df") <- stub_df
  attr(data_tbl, "fmts_df") <- output_df
  attr(data_tbl, "foot_df") <- output_df
  attr(data_tbl, "output_df") <- output_df
  attr(data_tbl, "formats") <- list()
  attr(data_tbl, "decorators") <- list()

  if (output == "html") {
    attr(data_tbl, "class") <- c("gt_html", "gt_tbl", class(data_tbl))
  }

  data_tbl
}
