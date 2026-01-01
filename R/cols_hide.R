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


# cols_hide() ------------------------------------------------------------------
#' Hide one or more columns
#'
#' @description
#'
#' `cols_hide()` allows us to hide one or more columns from
#' appearing in the final output table. While it's possible and often desirable
#' to omit columns from the input table data before introduction to [gt()],
#' there can be cases where the data in certain columns is useful (as a column
#' reference during formatting of other columns) but the final display of those
#' columns is not necessary.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns to hide in the output display table. Can either be a series of
#'   column names provided in `c()`, a vector of column indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]).
#'
#' @return An object of class `gt_tbl`. `data` will be unaltered if `columns` is
#'   not supplied.
#'
#' @details
#'
#' The hiding of columns is internally a rendering directive, so, all columns
#' that are 'hidden' are still accessible and useful in any expression provided
#' to a `rows` argument. Furthermore, `cols_hide()` (as with many **gt**
#' functions) can be placed anywhere in a pipeline of **gt** function calls
#' (acting as a promise to hide columns when the timing is right). However,
#' there's perhaps greater readability when placing this call closer to the end
#' of such a pipeline. `cols_hide()` quietly changes the visible state of a
#' column (much like [cols_unhide()]) and doesn't yield warnings or messages
#' when changing the state of already-invisible columns.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We can hide the `country_code_2` and `country_code_3` columns with the
#' `cols_hide()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(
#'     country_name == "Egypt",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_2, country_code_3))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_hide_1.png")`
#' }}
#'
#' Using another [`countrypops`]-based **gt** table, we can use the `population`
#' column to provide the conditional placement of footnotes. Then, we'll hide
#' that column along with the `country_code_3` column. Note that the order of
#' `cols_hide()` and [tab_footnote()] has no effect on the final display of the
#' table.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(
#'     country_name == "Pakistan",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_3, population)) |>
#'   tab_footnote(
#'     footnote = "Population above 220,000,000.",
#'     locations = cells_body(
#'       columns = year,
#'       rows = population > 220E6
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_hide_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-12
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso [cols_unhide()] to perform the inverse operation.
#'
#' @export
cols_hide <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # if no `columns` are provided, return data unaltered
  if (rlang::quo_is_missing(rlang::enquo(columns))) {
    return(data)
  }

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data,
      excl_stub = FALSE
    )

  vars <- dt_boxhead_get_vars(data = data)

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort("All `columns` must exist in the input `data` table.")
  }

  # Set the `"hidden"` type for the `columns` in `_dt_boxhead`
  dt_boxhead_set_hidden(
    data = data,
    vars = columns
  )
}

# cols_unhide() ----------------------------------------------------------------
#' Unhide one or more columns
#'
#' @description
#'
#' `cols_unhide()` allows us to take one or more hidden columns (usually done
#' via [cols_hide()]) and make them visible in the final output table. This may
#' be important in cases where the user obtains a `gt_tbl` object with hidden
#' columns and there is motivation to reveal one or more of those.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // *default:* `everything()`
#'
#'   The columns to unhide in the output display table. Can either be a series
#'   of column names provided in `c()`, a vector of column indices, or a select
#'   helper function (e.g. [starts_with()], [ends_with()], [contains()],
#'   [matches()], [num_range()], and [everything()]).
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The hiding and unhiding of columns is internally a rendering directive, so,
#' all columns that are 'hidden' are still accessible and useful in any
#' expression provided to a `rows` argument. The `cols_unhide()` function
#' quietly changes the visible state of a column (much like the [cols_hide()]
#' function) and doesn't yield warnings or messages when changing the state of
#' already-visible columns.
#'
#' @section Examples:
#'
#' Let's use a small portion of the [`countrypops`] dataset to create a **gt**
#' table. We'll hide the `country_code_2` and `country_code_3` columns with
#' [cols_hide()].
#'
#' ```r
#' tab_1 <-
#'   countrypops |>
#'   dplyr::filter(
#'     country_name == "Singapore",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_hide(columns = c(country_code_2, country_code_3))
#'
#' tab_1
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_unhide_1.png")`
#' }}
#'
#' If the `tab_1` object is provided without the code or source data to
#' regenerate it, and, the user wants to reveal otherwise hidden columns then
#' `cols_unhide()` becomes useful.
#'
#' ```r
#' tab_1 |> cols_unhide(columns = country_code_2)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_unhide_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-13
#'
#' @section Function Introduced:
#' `v0.3.0` (May 12, 2021)
#'
#' @seealso [cols_hide()] to perform the inverse operation.
#'
#' @export
cols_unhide <- function(
    data,
    columns
) {

  # Perform input object validation
  stop_if_not_gt_tbl_or_group(data = data)

  # Handle gt_group
  if(inherits(data, "gt_group")){
    arg_list <- as.list(match.call())
    return(apply_to_grp(data, arg_list))
  }

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  vars <- dt_boxhead_get_vars(data = data)

  # if no `columns` are provided, return data unaltered
  if (length(columns) == 0) {
    return(data)
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort("All `columns` must exist in the input `data` table.")
  }

  # Set the `"visible"` type for the `columns` in `_dt_boxhead`
  dt_boxhead_set_not_hidden(
    data = data,
    vars = columns
  )
}
