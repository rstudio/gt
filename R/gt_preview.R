#' Preview a gt table object
#'
#' Create a preview version of table. Here we can specify the first and last
#' \code{n} rows for the preview table.
#' @param data a \code{data.frame} object or a tibble.
#' @param top_n this value will be used as the number of rows from the top of
#'   the table to display. The default, \code{5}, will show the first five rows
#'   of the table.
#' @param bottom_n the value will be used as the number of rows from the bottom
#'   of the table to display. The default, \code{1}, will show the final row of
#'   the table.
#' @param incl_rownums an option to include the row numbers for \code{data} in
#'   the table stub.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a preview of the `mtcars`
#' # dataset; invoking the `gt_tbl`
#' # object will display it
#' gt_tbl <- gt_preview(mtcars)
#' @family table-part creation/modification functions
#' @export
gt_preview <- function(data,
                       top_n = 5,
                       bottom_n = 1,
                       incl_rownums = TRUE) {

  # Convert the table to a data frame
  data <- as.data.frame(data, stringsAsFactors = FALSE)

  # Convert factor columns to character columns
  factor_cols <- sapply(data, is.factor)
  data[factor_cols] <- lapply(data[factor_cols], as.character)

  # Reset the rownames in `data`
  rownames(data) <- NULL

  # Modify the naming of any magic columns to suppress
  # grouping and creation of a stub
  if ("rowname" %in% colnames(data)) {
    colnames(data)[which(colnames(data) == "rowname")] <- ".rowname"
  }

  if ("groupname" %in% colnames(data)) {
    colnames(data)[which(colnames(data) == "groupname")] <- ".groupname"
  }

  # If a preview table (head and tail) is requested,
  # then modify `data_tbl` to only include the head
  # and tail plus an ellipsis row
  if (nrow(data) > (top_n + bottom_n)) {

    data <-
      rbind(
        data[seq(top_n), ],
        rep("...", ncol(data)),
        data[(nrow(data) + 1 - rev(seq(bottom_n))), ])

    rownames(data)[top_n + 1] <- "..."
  }

  # If we elect to include row numbers, then place the row
  # numbers in the `rowname` column so that `gt()` will pick
  # this up as row labels for inclusion into the table stub
  if (incl_rownums) {
    data <-
      cbind(
        data.frame(rowname = rownames(data), stringsAsFactors = FALSE), data)
  }

  gt(data, rownames_to_stub = rownames_to_stub)
}
