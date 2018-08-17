#' Create a gt table object
#'
#' Create a gt table object so that we can perform styling transformations
#' before transforming the entire object to a display table. Using this function
#' is the first step in that process, and, there are a few data ingest options
#' we can consider at this stage.
#' @param data a \code{data.frame} object or a tibble.
#' @param rownames_to_stub an option to take rownames from the input \code{data}
#' table as row captions in the stub.
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
#'     columns = vars(drat, wt, qsec),
#'     decimals = 1)
#'
#' # The object of this type can be
#' # displayed in the Viewer
#' tab_2
#' @family table-part creation/modification functions
#' @importFrom tibble add_row
#' @export
gt <- function(data,
               rownames_to_stub = FALSE) {

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
