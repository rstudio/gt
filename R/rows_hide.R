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


# rows_hide() ------------------------------------------------------------------
#' Hide one or more rows
#'
#' @description
#'
#' `rows_hide()` allows us to hide one or more rows from appearing in the final
#' output table. While it's possible and often desirable to omit rows from the
#' input table data before introduction to [gt()], there can be cases where the
#' data in certain rows is useful (as a row reference during formatting of other
#' rows or for column-based aggregations) but the final display of those rows is
#' not necessary.
#'
#' @inheritParams fmt_number
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // **required**
#'
#'   The rows to hide in the output display table. Can either be a series of row
#'   IDs provided in `c()`, a vector of row indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[column_1] > 100 & [column_2] < 50`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The hiding of rows is internally a rendering directive, so, all rows that are
#' 'hidden' are still accessible and useful in any expression provided to a
#' `rows` argument. Furthermore, `rows_hide()` (as with many **gt** functions)
#' can be placed anywhere in a pipeline of **gt** function calls (acting as a
#' promise to hide rows when the timing is right). However, there's perhaps
#' greater readability when placing this call closer to the end of such a
#' pipeline.
#'
#' Note that when using [summary_rows()] or [grand_summary_rows()], the
#' aggregation calculations will only include the visible rows. Hidden rows are
#' excluded from summary computations. This allows summary values to dynamically
#' reflect the currently visible data.
#'
#' `rows_hide()` quietly changes the visible state of a row (much like
#' [rows_unhide()]) and doesn't yield warnings or messages when changing the
#' state of already-hidden rows.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We can hide rows where the population is below a certain threshold
#' using `rows_hide()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(
#'     country_name == "Egypt",
#'     year %in% 2017:2021
#'   ) |>
#'   gt(rowname_col = "year") |>
#'   fmt_integer(columns = population) |>
#'   rows_hide(rows = population < 100E6)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_hide_1.png")`
#' }}
#'
#' Using another [`countrypops`]-based **gt** table, we can hide specific rows
#' by targeting them with their row labels (from the stub). Note that the
#' footnote placement still works correctly, skipping the hidden rows in its
#' mark indexing.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(
#'     country_name == "Brazil",
#'     year %in% 2017:2021
#'   ) |>
#'   gt(rowname_col = "year") |>
#'   fmt_integer(columns = population) |>
#'   rows_hide(rows = c("2018", "2020")) |>
#'   tab_footnote(
#'     footnote = "Population above 210,000,000.",
#'     locations = cells_body(
#'       columns = population,
#'       rows = population > 210E6
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_hide_2.png")`
#' }}
#'
#' @family row addition/modification functions
#'
#' @section Function ID:
#' 6-7
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @export
rows_hide <- function(
    data,
    rows
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if (inherits(data, "gt_group")) {
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # If no `rows` are provided, return data unaltered
  if (rlang::quo_is_missing(rlang::enquo(rows))) {
    return(data)
  }

  # Resolve the rows supplied in `rows` to row indices
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data,
      null_means = "nothing"
    )

  # If no rows are resolved, return data unaltered
  if (is.null(resolved_rows_idx) || length(resolved_rows_idx) == 0) {
    return(data)
  }

  # Add the resolved rows to the hidden rows list
  dt_rows_hidden_add(
    data = data,
    rows = resolved_rows_idx
  )
}

# rows_unhide() ----------------------------------------------------------------
#' Unhide one or more rows
#'
#' @description
#'
#' `rows_unhide()` allows us to take one or more hidden rows (usually done
#' via [rows_hide()]) and make them visible in the final output table. This may
#' be important in cases where the user obtains a `gt_tbl` object with hidden
#' rows and there is motivation to reveal one or more of those.
#'
#' @inheritParams fmt_number
#'
#' @param rows *Rows to target*
#'
#'   `<row-targeting expression>` // *default:* `everything()`
#'
#'   The rows to unhide in the output display table. Can either be a series of
#'   row IDs provided in `c()`, a vector of row indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[column_1] > 100 & [column_2] < 50`).
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The hiding and unhiding of rows is internally a rendering directive, so, all
#' rows that are 'hidden' are still accessible and useful in any expression
#' provided to a `rows` argument. The `rows_unhide()` function quietly changes
#' the visible state of a row (much like the [rows_hide()] function) and doesn
#' doesn't yield warnings or messages when changing the state of already-visible
#' rows.
#'
#' Note that unhiding rows will cause them to be included in any [summary_rows()]
#' or [grand_summary_rows()] calculations, as these aggregations only operate on
#' visible rows.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We'll hide all rows but then unhide specific ones.
#'
#' ```r
#' tab_1 <-
#'   countrypops |>
#'   dplyr::filter(
#'     country_name == "Japan",
#'     year %in% 2017:2021
#'   ) |>
#'   gt(rowname_col = "year") |>
#'   fmt_integer(columns = population) |>
#'   rows_hide(rows = everything())
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_unhide_1.png")`
#' }}
#'
#' If we obtain the `tab_1` object without access to the code or source data,
#' and we want to reveal otherwise hidden rows, then `rows_unhide()` becomes
#' useful.
#'
#' ```r
#' tab_1 |> rows_unhide(rows = c("2019", "2021"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_rows_unhide_2.png")`
#' }}
#'
#' @family row addition/modification functions
#'
#' @section Function ID:
#' 6-8
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @export
rows_unhide <- function(
    data,
    rows
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if (inherits(data, "gt_group")) {
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # Resolve the rows supplied in `rows` to row indices
  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data,
      null_means = "everything"
    )

  # If no rows are resolved, return data unaltered
  if (is.null(resolved_rows_idx) || length(resolved_rows_idx) == 0) {
    return(data)
  }

  # Remove the resolved rows from the hidden rows list
  dt_rows_hidden_remove(
    data = data,
    rows = resolved_rows_idx
  )
}
