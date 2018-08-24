#' Preview a gt table object
#'
#' Create a preview version of table. Here we can specify the first and last
#' \code{n} rows for the preview table.
#' @param data a \code{data.frame} object or a tibble.
#' @param rownames_to_stub an option to take rownames from the input \code{data}
#' table as row captions in the stub.
#' @param top_n this value will be used as the number of rows from the top of
#' the table to display.
#' @param bottom_n the value will be used as the number of rows from the bottom
#' of the table to display.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a preview of the `mtcars`
#' # dataset; invoking the `gt_tbl`
#' # object will be display it
#' gt_tbl <-
#'   gt_preview(
#'     mtcars,
#'     rownames_to_stub = TRUE)
#' @family table-part creation/modification functions
#' @importFrom tibble add_row
#' @export
gt_preview <- function(data,
                       rownames_to_stub = FALSE,
                       top_n = 5,
                       bottom_n = 1) {

  # If a preview table (head and tail) is requested,
  # then modify `data_tbl` to only include the head
  # and tail plus an ellipsis row
  if (nrow(data) > (top_n + bottom_n)) {

    data <-
      rbind(
        data[seq(top_n), ],
        rep("...", ncol(data)),
        data[(nrow(data) - rev(seq(bottom_n))), ])

    rownames(data)[top_n + 1] <- "..."
  }

  # If the option to place rownames in the stub
  # is taken, then the `stub_df` data frame will
  # be pre-populated with rownames in the `rowname`
  # column; otherwise, this will be an empty df
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

  # If `rowname` is a column available in `data`,
  # place that column's data into `stub_df` and
  # remove it from `data`
  if ("rowname" %in% colnames(data)) {
    stub_df[["rowname"]] <- as.character(data[["rowname"]])
    data[["rowname"]] <- NULL
  }

  # If `groupname` is a column available in `data`,
  # place that column's data into `stub_df` and
  # remove it from `data`
  if ("groupname" %in% colnames(data)) {
    stub_df[["groupname"]] <- as.character(data[["groupname"]])
    data[["groupname"]] <- NULL
  }

  # Take the input data and convert to a
  # data frame
  data_tbl <-
    data %>%
    as.data.frame(stringsAsFactors = FALSE)

  # Reset the rownames in the `data_tbl` df
  rownames(data_tbl) <- NULL

  # Create an empty facsimile df based on
  # `data_tbl`; this will serve as a template for
  # data frames that contain specialized formatting
  # directives that will be used during render time
  empty_df <- data_tbl
  empty_df[] <- NA_character_

  # Create a data frame that represents the table's
  # boxhead (`boxh_df`); each row has a special
  # meaning and this will be used during render time
  boxh_df <-
    empty_df[c(), , drop = FALSE] %>%
    tibble::add_row() %>%  # group label
    tibble::add_row() %>%  # column label
    tibble::add_row()      # column alignment

  # Apply initialized data frames as attributes
  # within the object
  attr(data_tbl, "boxh_df") <- boxh_df
  attr(data_tbl, "stub_df") <- stub_df
  attr(data_tbl, "fmts_df") <- empty_df
  attr(data_tbl, "foot_df") <- empty_df

  # Apply the default theme options data frame as an attribute
  attr(data_tbl, "opts_df") <- gt_options_default()

  # Apply an empty `formats` list as an attribute
  attr(data_tbl, "formats") <- list()

  # Apply the `gt_tbl` class to the object while
  # also keeping the `data.frame` class
  class(data_tbl) <- c("gt_tbl", class(data_tbl))

  data_tbl
}
