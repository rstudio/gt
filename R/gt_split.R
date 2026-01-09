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


# gt_split() -------------------------------------------------------------------
#' Split a table into a group of tables (a `gt_group`)
#'
#' @description
#'
#' With a **gt** table, you can split it into multiple tables and get that
#' collection in a `gt_group` object. This function is useful for those cases
#' where you want to section up a table in a specific way and print those
#' smaller tables across multiple pages (in RTF and Word outputs, primarily via
#' [gtsave()]), or, with breaks between them when the output context is HTML.
#'
#' @inheritParams fmt_number
#'
#' @param row_every_n *Split at every n rows*
#'
#'   `scalar<numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   A directive to split at every *n* number of rows. This argument expects a
#'   single numerical value.
#'
#' @param row_slice_i *Row-slicing indices*
#'
#'   `vector<numeric|integer>` // *default:* `NULL` (`optional`)
#'
#'   An argument for splitting at specific row indices. Here, we expect either a
#'   vector of index values or a function that evaluates to a numeric vector.
#'
#' @param col_slice_at *Column-slicing locations*
#'
#'   `<column-targeting expression>` // *default:* `NULL` (`optional`)
#'
#'   Any columns where vertical splitting across should occur. The splits occur
#'   to the right of the resolved column names. Can either be a series of column
#'   names provided in `c()`, a vector of column indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]).
#'
#' @return An object of class `gt_group`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Format the
#' `msrp` column to display numbers as currency values, set column widths with
#' [cols_width()], and split the table at every five rows with `gt_split()`.
#' This creates a `gt_group` object containing two tables. Printing this object
#' yields two tables separated by a line break.
#'
#' ```r
#' gtcars |>
#'   dplyr::slice_head(n = 10) |>
#'   dplyr::select(mfr, model, year, msrp) |>
#'   gt() |>
#'   fmt_currency(columns = msrp) |>
#'   cols_width(
#'     year ~ px(80),
#'     everything() ~ px(150)
#'   ) |>
#'   gt_split(row_every_n = 5)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_split_1.png")`
#' }}
#'
#' Use a smaller subset of the [`gtcars`] dataset to create a **gt** table.
#' Format the `msrp` column to display numbers as currency values, set the table
#' width with [tab_options()] and split the table at the `model` column This
#' creates a `gt_group` object again containing two tables but this time we get
#' a vertical split. Printing this object yields two tables of the same width.
#'
#' ```r
#' gtcars |>
#'   dplyr::slice_head(n = 5) |>
#'   dplyr::select(mfr, model, year, msrp) |>
#'   gt() |>
#'   fmt_currency(columns = msrp) |>
#'   tab_options(table.width = px(400)) |>
#'   gt_split(col_slice_at = "model")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_split_2.png")`
#' }}
#'
#' @family table group functions
#' @section Function ID:
#' 14-2
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @export
gt_split <- function(
    data,
    row_every_n = NULL,
    row_slice_i = NULL,
    col_slice_at = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Resolution of columns as character vectors
  col_slice_at <-
    resolve_cols_c(
      expr = {{ col_slice_at }},
      data = data,
      null_means = "nothing"
    )

  gt_tbl_built <- build_data(data = data, context = "html")

  # Get row count for table (data rows)
  n_rows_data <- nrow(gt_tbl_built[["_stub_df"]])

  row_slice_vec <- rep.int(1L, n_rows_data)

  row_every_n_idx <- NULL
  if (!is.null(row_every_n)) {
    row_every_n_idx <- seq_len(n_rows_data)[seq(0, n_rows_data, row_every_n)]
  }

  row_slice_i_idx <- NULL
  if (!is.null(row_slice_i)) {
    row_slice_i_idx <- row_slice_i
  }

  row_idx <- sort(unique(c(row_every_n_idx, row_slice_i_idx)))

  group_i <- 0L

  for (i in seq_along(row_slice_vec)) {

    if (i %in% (row_idx + 1)) {
      group_i <- group_i + 1L
    }

    row_slice_vec[i] <- row_slice_vec[i] + group_i
  }

  row_range_list <-
    split(
      seq_len(n_rows_data),
      row_slice_vec
    )

  gt_tbl_main <- data

  gt_group <- gt_group(.use_grp_opts = FALSE)

  for (i in seq_along(row_range_list)) {

    gt_tbl_i <- gt_tbl_main

    gt_tbl_i[["_data"]] <- gt_tbl_i[["_data"]][row_range_list[[i]], ]
    gt_tbl_i[["_stub_df"]] <- gt_tbl_i[["_stub_df"]][row_range_list[[i]], ]

    if (!is.null(col_slice_at)) {

      # Get all visible vars in their finalized order
      visible_col_vars <- dt_boxhead_get_vars_default(data = data)

      # Stop function if any of the columns to split at aren't visible columns
      if (!all(col_slice_at %in% visible_col_vars)) {
        cli::cli_abort(
          "All values provided in `col_slice_at` must correspond to visible columns."
        )
      }

      # Obtain all of the column indices for vertical splitting
      col_idx <- which(visible_col_vars %in% col_slice_at)

      col_slice_vec <- rep.int(1L, length(visible_col_vars))

      group_j <- 0L

      for (i in seq_along(col_slice_vec)) {

        if (i %in% (col_idx + 1)) {
          group_j <- group_j + 1L
        }

        col_slice_vec[i] <- col_slice_vec[i] + group_j
      }

      col_range_list <-
        split(
          seq_along(visible_col_vars),
          col_slice_vec
        )

      for (j in seq_along(col_range_list)) {

        gt_tbl_j <- gt_tbl_i

        gt_tbl_j[["_data"]] <-
          gt_tbl_j[["_data"]][, visible_col_vars[col_range_list[[j]]]]

        gt_tbl_j[["_boxhead"]] <-
          gt_tbl_j[["_boxhead"]][
            gt_tbl_j[["_boxhead"]]$var %in% visible_col_vars[col_range_list[[j]]],
          ]

        gt_group <- grp_add(gt_group, gt_tbl_j)
      }


    } else {
      gt_group <- grp_add(gt_group, gt_tbl_i)
    }
  }

  gt_group
}
