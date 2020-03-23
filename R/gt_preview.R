#' Preview a **gt** table object
#'
#' Sometimes you may want to see just a small portion of your input data. We can
#' use `gt_preview()` in place of [gt()] to get the first x rows of data and the
#' last y rows of data (which can be set by the `top_n` and `bottom_n`
#' arguments). It's not advised to use additional **gt** functions to further
#' modify the output of `gt_preview()`. Furthermore, you cannot pass a **gt**
#' object to `gt_preview()`.
#'
#' Any grouped data or magic columns such as `rowname` and `groupname` will be
#' ignored by `gt_preview()` and, as such, one cannot add a stub or group rows
#' in the output table. By default, the output table will include row numbers in
#' a stub (including a range of row numbers for the omitted rows). This row
#' numbering option can be deactivated by setting `incl_rownums` to `FALSE`.
#'
#' @param data A `data.frame` object or a tibble.
#' @param top_n This value will be used as the number of rows from the top of
#'   the table to display. The default, `5`, will show the first five rows of
#'   the table.
#' @param bottom_n The value will be used as the number of rows from the bottom
#'   of the table to display. The default, `1`, will show the final row of the
#'   table.
#' @param incl_rownums An option to include the row numbers for `data` in the
#'   table stub. By default, this is `TRUE`.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_gt_preview_1.png}{options: width=100\%}}
#'
#' @family Create Table
#' @section Function ID:
#' 1-2
#'
#' @export
gt_preview <- function(data,
                       top_n = 5,
                       bottom_n = 1,
                       incl_rownums = TRUE) {

  if (is_gt(data)) {
    data <- dt_data_get(data = data)
  }

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
  if (isTRUE(has_ellipsis_row)) {

    ellipsis_row <- top_n + 1

    # Prepare a rowname label that represents the hidden row numbers
    between_rownums <- c(ellipsis_row, nrow(data) - bottom_n)

    # Obtain the top and bottom slices of data
    top_slice <- data[seq(top_n), , drop = FALSE]
    bottom_slice <- data[(nrow(data) + 1 - rev(seq(bottom_n))), , drop = FALSE]

    # Modify the `data` so that only the `top_n` (`top_slice`) and
    # `bottom_n` (`bottom_slice`) rows are retained (with a row of
    # NAs to clearly separate these slices)
    data <-
      rbind(
        top_slice,
        rep(NA, ncol(data)),
        bottom_slice
      )

    # Relabel the rowname for the ellipsis row
    rownames(data)[ellipsis_row] <- paste(between_rownums, collapse = "..")
  }

  # If we elect to include row numbers, then place the row
  # numbers in the `rowname` column so that `gt()` will pick
  # this up as row labels for inclusion into the table stub
  if (isTRUE(incl_rownums)) {
    data <-
      cbind(
        data.frame(rowname = rownames(data), stringsAsFactors = FALSE), data)
  }

  # Render as a gt table
  gt_tbl <- gt(data, rownames_to_stub = FALSE)

  # Use a fixed-width font for the rownums, if they are included
  if (isTRUE(incl_rownums)) {

    gt_tbl <-
      gt_tbl %>%
      tab_style(
        style = cell_text(font = "Courier"),
        locations = cells_stub()
      )
  }

  visible_vars <- dt_boxhead_get_vars_default(data = gt_tbl)

  # Replace the NA values and add styling to the ellipsis
  # row (if it is present)
  if (isTRUE(has_ellipsis_row)) {

    gt_tbl <-
      gt_tbl %>%
      tab_style(
        style = cell_fill(color = "#E4E4E4"),
        locations = cells_body(columns = visible_vars, rows = ellipsis_row)
      ) %>%
      text_transform(
        locations = cells_body(columns = TRUE, rows = ellipsis_row),
        fn = function(x) ""
      )

    if (isTRUE(incl_rownums)) {

      gt_tbl <-
        gt_tbl %>%
        tab_style(
          style = list(
            cell_fill(color = "#E4E4E4"),
            cell_text(size = "x-small")
          ),
          locations = cells_stub(rows = ellipsis_row)
        )
    }
  }

  gt_tbl
}
