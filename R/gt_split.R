#' Split a table into a group of tables (a `gt_group`)
#'
#' With a **gt** table, you can split it into multiple tables and get that
#' collection in a `gt_group` object. This function is useful for those cases
#' where you want to section up a table in a specific way and print those
#' smaller tables across multiple pages, or with breaks between them (i.e., when
#' the output context in HTML).
#'
#' @param data A **gt** table object (`gt_tbl`) that is created using the [gt()]
#'   function.
#' @param every_n_rows A directive to split at every *n* number of rows. This
#'   argument expects a single numerical value.
#'
#' @return An object of class `gt_group`.
#'
#' @section Examples:
#'
#' Use a subset of the [`gtcars`] dataset to create a **gt** table. Format the
#' `msrp` column to display numbers as currency values, set column widths with
#' [cols_width()] and split the table at every five rows with `gt_split()`. This
#' creates a `gt_group` object containing two tables. Printing this object
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
#'   gt_split(every_n_rows = 5)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_gt_split_1.png")`
#' }}
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @export
gt_split <- function(
    data,
    every_n_rows = NULL
) {

  gt_tbl_built <- build_data(data = data, context = "html")

  # Get row count for table (data rows)
  # Get various row number counts
  n_rows_data <- nrow(gt_tbl_built[["_stub_df"]])

  if (!is.null(every_n_rows)) {

    # Get list of row ranges for each table to be generated
    range_list <-
      split(
        seq_len(n_rows_data),
        ceiling(seq_len(n_rows_data) / every_n_rows)
      )

  } else {
    return(gt_group(data, .use_grp_opts = FALSE))
  }

  gt_tbl_main <- data

  gt_group <- gt_group(.use_grp_opts = FALSE)

  for (i in seq_along(range_list)) {

    gt_tbl_i <- gt_tbl_main

    gt_tbl_i[["_data"]] <- gt_tbl_i[["_data"]][range_list[[i]], ]
    gt_tbl_i[["_stub_df"]] <- gt_tbl_i[["_stub_df"]][range_list[[i]], ]

    gt_group <- grp_add(gt_group, gt_tbl_i)
  }

  gt_group
}
