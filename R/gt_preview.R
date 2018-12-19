#' Preview a \pkg{gt} table object
#'
#' Sometimes you may want to see just a small portion of your input data. We can
#' use \code{gt_preview()} in place of \code{gt()} to get the first x rows of
#' data and the last y rows of data (which can be set by the \code{top_n} and
#' \code{bottom_n} arguments). It's not advised to use additional \pkg{gt} API
#' functions to further modify the output of \code{gt_preview()}. Furthermore,
#' you cannot pass a \pkg{gt} object to \code{gt_preview()}.
#'
#' Any grouped data or magic columns such as \code{rowname} and \code{groupname}
#' will be ignored by \code{gt_preview()} and, as such, one cannot add a stub or
#' group rows in the output table. By default, the output table will include row
#' numbers in a stub (including a range of row numbers for the omitted rows).
#' This row numbering option can be deactivated by setting \code{incl_rownums}
#' to \code{FALSE}.
#'
#' @param data a \code{data.frame} object or a tibble.
#' @param top_n this value will be used as the number of rows from the top of
#'   the table to display. The default, \code{5}, will show the first five rows
#'   of the table.
#' @param bottom_n the value will be used as the number of rows from the bottom
#'   of the table to display. The default, \code{1}, will show the final row of
#'   the table.
#' @param incl_rownums an option to include the row numbers for \code{data} in
#'   the table stub. By default, this is \code{TRUE}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `gtcars` to create a gt table
#' # preview (with only a few of its
#' # columns); you'll see the first five
#' # rows and the last row
#' tab_1 <-
#'   gtcars %>%
#'   dplyr::select(mfr, model, year) %>%
#'   gt_preview()
#'
#' @section Figures:
#' \if{html}{\figure{man_gt_preview_1.svg}{options: width=100\%}}
#'
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

  # Determine whether an ellipsis row is to be included
  has_ellipsis_row <- ifelse(nrow(data) > (top_n + bottom_n), TRUE, FALSE)

  # If a preview table (head and tail) is requested,
  # then modify `data_tbl` to only include the head
  # and tail plus an ellipsis row
  if (has_ellipsis_row) {

    ellipsis_row <- top_n + 1

    # Prepare a rowname label that represents the hidden row numbers
    between_rownums <- c(ellipsis_row, nrow(data) - bottom_n)

    # Modify the `data` so that only the `top_n` and `bottom_n` rows
    # are retained (with an empty row between these row groups)
    data <-
      rbind(
        data[seq(top_n), ],
        rep("", ncol(data)),
        data[(nrow(data) + 1 - rev(seq(bottom_n))), ])

    # Relabel the rowname for the ellipsis row
    rownames(data)[ellipsis_row] <- paste(between_rownums, collapse = "..")
  }

  # If we elect to include row numbers, then place the row
  # numbers in the `rowname` column so that `gt()` will pick
  # this up as row labels for inclusion into the table stub
  if (incl_rownums) {
    data <-
      cbind(
        data.frame(rowname = rownames(data), stringsAsFactors = FALSE), data)
  }

  # Render as a gt table
  gt_tbl <- gt(data, rownames_to_stub = FALSE)

  # Use a fixed-width font for the rownums, if they are included
  if (incl_rownums) {

    gt_tbl <-
      gt_tbl %>%
      tab_style(
        style = "font-family:Courier;",
        locations = cells_stub())
  }

  # Add styling of ellipsis row, if it is present
  if (has_ellipsis_row) {

    gt_tbl <-
      gt_tbl %>%
      tab_style(
        style = cells_styles(bkgd_color = "#E4E4E4"),
        locations = cells_data(rows = ellipsis_row)) %>%
      tab_style(
        style = "padding-top:1px;padding-bottom:1px;border-top:2px solid #D1D1D1;border-bottom:2px solid #D1D1D1;",
        locations = cells_data(rows = ellipsis_row))

    if (incl_rownums) {

      gt_tbl <-
        gt_tbl %>%
        tab_style(
          style = cells_styles(bkgd_color = "#E4E4E4", text_size = "12px"),
          locations = cells_stub(rows = ellipsis_row)) %>%
        tab_style(
          style = "padding-top:1px;padding-bottom:1px;border-top:2px solid #D1D1D1;border-bottom:2px solid #D1D1D1;",
          locations = cells_stub(rows = ellipsis_row))

    } else {

      gt_tbl <-
        gt_tbl %>%
        tab_style(
          style = "padding-top:8px;padding-bottom:8px;",
          locations = cells_data(rows = ellipsis_row))
    }
  }

  gt_tbl
}
