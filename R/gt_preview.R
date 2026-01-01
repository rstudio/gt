#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2026 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# gt_preview() -----------------------------------------------------------------
#' Generate a special **gt** table for previewing a dataset
#'
#' @description
#'
#' Sometimes you may want to see just a small portion of your input data. We can
#' use `gt_preview()` in place of [gt()] to get the first x rows of data and the
#' last y rows of data (which can be set by the `top_n` and `bottom_n`
#' arguments). It's not advised to use additional **gt** functions to further
#' modify the output of `gt_preview()`. Furthermore, you cannot pass a **gt**
#' object to `gt_preview()`.
#'
#' @inheritParams gt
#'
#' @param top_n *Top n rows to display*
#'
#'   `scalar<numeric|integer>` // *default:* `5`
#'
#'   The `top_n` value will be used as the number of rows from the top of the
#'   table to display. The default, `5`, will show the first five rows of the
#'   table.
#'
#' @param bottom_n *Bottom n rows to display*
#'
#'   `scalar<numeric|integer>` // *default:* `1`
#'
#'   The `bottom_n` value will be used as the number of rows from the bottom
#'   of the table to display. The default, `1`, will show the final row of the
#'   table.
#'
#' @param incl_rownums *Display row numbers*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to include the row numbers for `data` in the table stub.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' By default, the output table will include row numbers in a stub (including a
#' range of row numbers for the omitted rows). This row numbering option can be
#' deactivated by setting `incl_rownums` to `FALSE`.
#'
#' @section Examples:
#'
#' With three columns from the [`gtcars`] dataset, let's create a **gt** table
#' preview with the `gt_preview()` function. You'll get only the first five rows
#' and the last row.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, year) |>
#'   gt_preview()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_preview_1.png")`
#' }}
#'
#' @family table creation functions
#' @section Function ID:
#' 1-2
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
gt_preview <- function(
    data,
    top_n = 5,
    bottom_n = 1,
    incl_rownums = TRUE
) {

  if (is_gt_tbl(data = data)) {
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
  has_ellipsis_row <- nrow(data) > (top_n + bottom_n) # TRUE or FALSE

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
        data.frame(
          rowname = rownames(data),
          stringsAsFactors = FALSE
        ),
        data
      )
  }

  # Render as a gt table
  gt_tbl <- gt(data, rownames_to_stub = FALSE)

  # Use a fixed-width font for the rownums, if they are included
  if (isTRUE(incl_rownums)) {

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_text(font = "Courier"),
        locations = cells_stub()
      )
  }

  visible_vars <- dt_boxhead_get_vars_default(data = gt_tbl)

  # Replace the NA values and add styling to the ellipsis
  # row (if it is present)
  if (isTRUE(has_ellipsis_row)) {

    gt_tbl <-
      tab_style(
        gt_tbl,
        style = cell_fill(color = "#E4E4E4"),
        locations = cells_body(columns = all_of(visible_vars), rows = ellipsis_row)
      )

    gt_tbl <-
      text_transform(
        gt_tbl,
        locations = cells_body(columns = everything(), rows = ellipsis_row),
        fn = function(x) ""
      )

    if (isTRUE(incl_rownums)) {

      gt_tbl <-
        tab_style(
          gt_tbl,
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
