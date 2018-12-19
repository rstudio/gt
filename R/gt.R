#' Create a \pkg{gt} table object
#'
#' The \code{gt()} function creates a \pkg{gt} table object when provided with
#' table data. Using this function is the first step in a typical \pkg{gt}
#' workflow. Once we have the \pkg{gt} table object, we can perform styling
#' transformations before rendering to a display table of various formats (e.g.,
#' HTML, LaTeX, RTF).
#'
#' There are a few data ingest options we can consider at this stage. We can
#' choose to create a table stub with rowname captions using the
#' \code{rowname_col} argument. Further to this, stub row groups can be created
#' with the \code{groupname_col}. Both arguments take the name of a column in
#' the input table data. Typically, the data in the \code{groupname_col} will
#' consist of categories of data in a table and the data in the
#' \code{rowname_col} are unique labels (perhaps unique across the entire table
#' or unique within groups).
#'
#' Row groups can also be created by passing a \code{grouped_df} to \code{gt()}
#' by using the \code{dplyr::group_by()} function on the table data. In this
#' way, two or more columns of categorical data can be used to make row groups.
#' The \code{stub_group.sep} argument allows for control in how the row group
#' label will appear in the display table.
#'
#' @param data a \code{data.frame} object or a tibble.
#' @param rowname_col the column name in the input \code{data} table to use as
#'   row captions to be placed in the display table stub.
#' @param groupname_col the column name in the input \code{data} table to use as
#'   group labels for generation of stub row groups.
#' @param rownames_to_stub an option to take rownames from the input \code{data}
#'   table as row captions in the display table stub.
#' @param stub_group.sep the separator to use between consecutive group names (a
#'   possibility when providing \code{data} as a \code{grouped_df} with multiple
#'   groups) in the displayed stub row group label.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `exibble` dataset; use the `row`
#' # and `group` columns to add a stub
#' # and row groups
#' tab_1 <-
#'   exibble %>%
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   )
#'
#' # The resulting object can be used
#' # in transformations (with `tab_*()`,
#' # `fmt_*()`, `cols_*()` functions)
#' tab_2 <-
#'   tab_1 %>%
#'   tab_header(
#'     title = "Table Title",
#'     subtitle = "Subtitle"
#'   ) %>%
#'   fmt_number(
#'     columns = vars(num),
#'     decimals = 2
#'   ) %>%
#'   cols_label(num = "number")
#'
#' @section Figures:
#' \if{html}{\figure{man_gt_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_gt_2.svg}{options: width=100\%}}
#'
#' @family table-part creation/modification functions
#' @export
gt <- function(data,
               rowname_col = "rowname",
               groupname_col = "groupname",
               rownames_to_stub = FALSE,
               stub_group.sep = getOption("gt.stub_group.sep", " - ")) {

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
  if (rowname_col %in% colnames(data)) {

    # Place the `rowname` values into `stub_df$rowname`
    stub_df[["rowname"]] <- as.character(data[[rowname_col]])

    # Remove the `rowname` column from `data`
    data[[rowname_col]] <- NULL
  }

  # If `data` is a `grouped_df` then create groups from the
  # group columns; note that this will overwrite any values
  # already in `stub_df$groupname`
  if (inherits(data, "grouped_df")) {

    group_cols <- attr(data, "vars", exact = TRUE)
    group_cols <- base::intersect(group_cols, colnames(data))

    group_labels <-
      apply(data[, group_cols], 1, paste, collapse = stub_group.sep)

    # Place the `group_labels` values into `stub_df$groupname`
    stub_df[["groupname"]] <- group_labels

    # Remove all columns in `group_cols` from `data`
    data[, which(colnames(data) %in% group_cols)] <- NULL

  } else if (groupname_col %in% colnames(data)) {

    # If `groupname` is a column available in `data`,
    # place that column's data into `stub_df` and
    # remove it from `data`

    # Place the `groupname` values into `stub_df$groupname`
    stub_df[["groupname"]] <- as.character(data[[groupname_col]])

    # Remove the `groupname` column from `data`
    data[[groupname_col]] <- NULL

  }

  # Take the input data and convert to a
  # data frame
  data_tbl <- data %>%
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
  # columns (`boxh_df`); each row has a special
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

  data_tbl_colnames <- colnames(data_tbl)

  # Create a prepopulated `col_labels` list object, which
  # contains names of all the columns which can be all be
  # modified later
  col_labels <- data_tbl_colnames
  names(col_labels) <- data_tbl_colnames
  col_labels <- as.list(col_labels)

  attr(data_tbl, "col_labels") <- col_labels

  # Create a prepopulated `grp_labels` list object, which
  # contains names of all the column groups which can be all be
  # modified later
  grp_labels <- rep(NA_character_, length(colnames(data_tbl)))
  names(grp_labels) <- data_tbl_colnames
  grp_labels <- as.list(grp_labels)

  attr(data_tbl, "grp_labels") <- grp_labels

  # Create an `arrange_groups` list object, which contains
  # a vector of `groupname` values in the order of first
  # appearance in `data`; if all `groupname` values are NA,
  # then use an empty character vector
  if (any(!is.na(stub_df[["groupname"]]))) {
    attr(data_tbl, "arrange_groups") <-
      list(groups = unique(stub_df[["groupname"]]))
  } else {
    attr(data_tbl, "arrange_groups") <-
      list(groups = character(0))
  }

  # Apply the input data table as an attribute
  attr(data_tbl, "data_df") <- data

  # Apply the default theme options data frame as an attribute
  attr(data_tbl, "opts_df") <- gt_options_default()

  # Apply an empty `formats` list as an attribute
  attr(data_tbl, "formats") <- list()

  # Apply an empty `transforms` list as an attribute
  attr(data_tbl, "transforms") <- list()

  # Apply the `gt_tbl` class to the object while
  # also keeping the `data.frame` class
  class(data_tbl) <- c("gt_tbl", class(data_tbl))

  # Automatically align columns with `cols_align()`
  data_tbl %>% cols_align()
}
