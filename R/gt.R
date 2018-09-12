#' Create a gt table object
#'
#' Create a gt table object so that we can perform styling transformations
#' before transforming the entire object to a display table. Using this function
#' is the first step in that process, and, there are a few data ingest options
#' we can consider at this stage.
#' @param data a \code{data.frame} object or a tibble.
#' @param rownames_to_stub an option to take rownames from the input \code{data}
#'   table as row captions in the stub.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset; take the rownames
#' # available in this table and use them
#' # as row captions in the table stub
#' gt_tbl <-
#'   gt(mtcars, rownames_to_stub = TRUE)
#'
#' # The resulting object can be used
#' # in transformations (with `tab_*()`,
#' # `fmt_*()`, `cols_*()` functions)
#' gt_tbl_2 <-
#'   gt_tbl %>%
#'   tab_heading(title = "mtcars") %>%
#'   fmt_number(
#'     columns = vars(drat, wt, qsec),
#'     decimals = 1) %>%
#'   cols_align_right(
#'     columns = vars(mpg, cyl, disp))
#' @family table-part creation/modification functions
#' @export
gt <- function(data,
               rownames_to_stub = FALSE) {

  # If the option to place rownames in the stub
  #   is taken, then the `stub_df` data frame will
  #   be pre-populated with rownames in the `rowname`
  #   column; otherwise, this will be an empty df
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

    # Place the `rowname` values into `stub_df$rowname`
    stub_df[["rowname"]] <- as.character(data[["rowname"]])

    # Remove the `rowname` column from `data`
    data[["rowname"]] <- NULL
  }

  # If `groupname` is a column available in `data`,
  # place that column's data into `stub_df` and
  # remove it from `data`
  if ("groupname" %in% colnames(data)) {

    # Place the `groupname` values into `stub_df$groupname`
    stub_df[["groupname"]] <- as.character(data[["groupname"]])

    # Remove the `groupname` column from `data`
    data[["groupname"]] <- NULL
  }

  # If `data` is a `grouped_df` then create groups from the
  # group columns; note that this will overwrite any values
  # already in `stub_df$groupname`
  if (inherits(data, "grouped_df")) {

    group_cols <- attr(data, "vars", exact = TRUE)
    group_cols <- base::intersect(group_cols, colnames(data))

    group_labels <- apply(data[, group_cols], 1, paste, collapse = "-")

    # Place the `group_labels` values into `stub_df$groupname`
    stub_df[["groupname"]] <- group_labels

    # Remove all columns in `group_cols` from `data`
    data[, which(colnames(data) %in% group_cols)] <- NULL
  }

  # Take the input data and convert to a
  # data frame
  data_tbl <-
    data %>%
    as.data.frame(stringsAsFactors = FALSE)

  # Reset the rownames in the `data_tbl` df
  rownames(data_tbl) <- NULL

  # Create empty `footnotes_df` and `styles_df` data frames
  footnotes_df <- styles_df <-
    dplyr::tibble(
      locname = NA_character_,
      locnum = NA_integer_,
      grpname = NA_character_,
      colname = NA_character_,
      rownum = NA_integer_,
      text = NA_character_)[-1, ]

  # Create a prepopulated `rows_df` data frame
  rows_df <-
    dplyr::tibble(
      rownums_start = seq(nrow(data_tbl)))

  # Create a prepopulated `cols_df` data frame
  cols_df <-
    dplyr::tibble(
      colnames_start = colnames(data_tbl))

  # Create an empty facsimile df based on
  # `data_tbl`; this will serve as a template for
  # data frames that contain specialized formatting
  # directives that will be used during render time
  empty_df <- data_tbl
  empty_df[] <- NA_character_

  # Create a data frame that represents the table's
  # boxhead (`boxh_df`); each row has a special
  # meaning and this will be used during render time
  boxh_df <- empty_df[c(), , drop = FALSE]
  boxh_df[1:3, ] = list(NA_character_)

  # Assign rownames to the `boxh_df` for easier
  # manipulation of rows
  rownames(boxh_df) <-
    c("group_label", "column_label", "column_align")

  # Apply initialized data frames as attributes
  # within the object
  attr(data_tbl, "boxh_df") <- boxh_df
  attr(data_tbl, "stub_df") <- stub_df

  attr(data_tbl, "footnotes_df") <- footnotes_df
  attr(data_tbl, "styles_df") <- styles_df
  attr(data_tbl, "rows_df") <- rows_df
  attr(data_tbl, "cols_df") <- cols_df

  # Create an `arrange_groups` list object, which contains
  # a vector of `groupname` values in the order of first
  # appearance in `data`; if all `groupname` values are NA,
  # then use an empty character vector
  if (all(!is.na(stub_df[["groupname"]]))) {
    attr(data_tbl, "arrange_groups") <-
      list(groups = unique(stub_df[["groupname"]]))
  } else {
    attr(data_tbl, "arrange_groups") <-
      list(groups = character(0))
  }

  # Apply the default theme options data frame as an attribute
  attr(data_tbl, "opts_df") <- gt_options_default()

  # Apply an empty `formats` list as an attribute
  attr(data_tbl, "formats") <- list()

  # Apply the `gt_tbl` class to the object while
  # also keeping the `data.frame` class
  class(data_tbl) <- c("gt_tbl", class(data_tbl))

  data_tbl
}
