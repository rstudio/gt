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


# cols_move() ------------------------------------------------------------------
#' Move one or more columns
#'
#' @description
#'
#' On those occasions where you need to move columns this way or that way, we
#' can make use of the `cols_move()` function. While it's true that the movement
#' of columns can be done upstream of **gt**, it is much easier and less error
#' prone to use the function provided here. The movement procedure here takes
#' one or more specified columns (in the `columns` argument) and places them to
#' the right of a different column (the `after` argument). The ordering of the
#' `columns` to be moved is preserved, as is the ordering of all other columns
#' in the table.
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]. The columns
#'   move as a group to a different position. The order of the remaining columns
#'   will be preserved.
#'
#' @param after *Column used as anchor*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The column used to anchor the insertion of the moved columns. All of the
#'   moved columns will be placed to the right of this column. While select
#'   helper functions such as [starts_with()] and [ends_with()] can be used for
#'   column targeting, it's recommended that a single column name be used. This
#'   is to ensure that exactly one column is provided here.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table and none of
#' them can be in the `after` argument. The `after` column must also exist and
#' only one column should be provided here. If you need to place one or more
#' columns at the beginning of the column series, the [cols_move_to_start()]
#' function should be used. Similarly, if those columns to move should be placed
#' at the end of the column series then use [cols_move_to_end()].
#'
#' @section Examples:
#'
#' Use the [`countrypops`] dataset to create a **gt** table. We'll choose to
#' position the `population` column after the `country_name` column by using the
#' `cols_move()` function.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Japan",
#'     year %in% 2012:2021
#'   ) |>
#'   gt() |>
#'   cols_move(
#'     columns = population,
#'     after = country_name
#'   ) |>
#'   fmt_integer(columns = population)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_1.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-9
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_move <- function(
    data,
    columns,
    after
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
      data = data
    )

  # Get the `after` columns as a character vector
  after <-
    resolve_cols_c(
      expr = {{ after }},
      data = data
    )

  vars <- dt_boxhead_get_vars(data = data)

  # Stop function if `after` contains multiple columns
  if (length(after) > 1) {
    cli::cli_abort("Only one column name should be supplied to `after`.")
  }

  # Stop function if `after` doesn't exist in `vars`
  if (!(after %in% vars)) {
    cli::cli_abort(
      "The column supplied to `after` doesn't exist in the input `data` table."
    )
  }

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  moving_columns <- setdiff(columns, after)
  other_columns <- base::setdiff(vars, moving_columns)

  # Get the column index for where the set
  # of `columns` should be inserted after
  after_index <- which(other_columns == after)

  new_vars <- append(other_columns, moving_columns, after = after_index)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}

# cols_move_to_start() ---------------------------------------------------------
#' Move one or more columns to the start
#'
#' @description
#'
#' We can easily move set of columns to the beginning of the column series and
#' we only need to specify which `columns`. It's possible to do this upstream of
#' **gt**, however, it is easier with this function and it presents less
#' possibility for error. The ordering of the `columns` that are moved to the
#' start is preserved (same with the ordering of all other columns in the
#' table).
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]). The columns
#'   move as a group to the left-most side of the table. The order of the
#'   remaining columns will be preserved.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the end of the column series, [cols_move_to_end()]
#' should be used. More control is offered with [cols_move()], where columns
#' could be placed after a specific column.
#'
#' @section Examples:
#'
#' For this example, we'll use a portion of the [`countrypops`] dataset to
#' create a simple **gt** table. Let's move the `year` column, which is the
#' middle column, to the start of the column series with `cols_move_to_start()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Fiji",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_move_to_start(columns = year)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_start_1.png")`
#' }}
#'
#' We can also move multiple columns at a time. With the same
#' [`countrypops`]-based table, let's move both the `year` and `population`
#' columns to the start of the column series.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Fiji",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_move_to_start(columns = c(year, population))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_start_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-10
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_move_to_start <- function(
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

  vars <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  other_columns <- base::setdiff(vars, columns)

  new_vars <- append(other_columns, columns, after = 0)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}

# cols_move_to_end() -----------------------------------------------------------
#' Move one or more columns to the end
#'
#' @description
#'
#' It's possible to move a set of columns to the end of the column series, we
#' only need to specify which `columns` are to be moved. While this can be done
#' upstream of **gt**, this function makes to process much easier and it's less
#' error prone. The ordering of the `columns` that are moved to the end is
#' preserved (same with the ordering of all other columns in the table).
#'
#' @inheritParams cols_align
#'
#' @param columns *Columns to target*
#'
#'   `<column-targeting expression>` // **required**
#'
#'   The columns for which the moving operations should be applied. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]. The columns
#'   move as a group to the right-most side of the table. The order of the
#'   remaining columns will be preserved.
#'
#' @return An object of class `gt_tbl`.
#'
#' @details
#'
#' The columns supplied in `columns` must all exist in the table. If you need to
#' place one or columns at the start of the column series, [cols_move_to_start()]
#' should be used. More control is offered with [cols_move()], where columns
#' could be placed after a specific column.
#'
#' @section Examples:
#'
#' For this example, we'll use a portion of the [`countrypops`] dataset to
#' create a simple **gt** table. Let's move the `year` column, which is the
#' middle column, to the end of the column series with `cols_move_to_end()`.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Benin",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_move_to_end(columns = year)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_end_1.png")`
#' }}
#'
#' We can also move multiple columns at a time. With the same
#' [`countrypops`]-based table, let's move both the `year` and `country_name`
#' columns to the end of the column series.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Benin",
#'     year %in% 2017:2021
#'   ) |>
#'   gt() |>
#'   cols_move_to_end(columns = c(year, country_name))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_cols_move_to_end_2.png")`
#' }}
#'
#' @family column modification functions
#' @section Function ID:
#' 5-11
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
cols_move_to_end <- function(
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

  vars <- dt_boxhead_get_vars(data = data)

  # Get the columns supplied in `columns` as a character vector
  columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  # Stop function if no `columns` are provided
  if (length(columns) == 0) {
    cli::cli_abort("Columns must be provided.")
  }

  # Stop function if any of the `columns` don't exist in `vars`
  if (!all(columns %in% vars)) {
    cli::cli_abort(
      "All `columns` must exist and be visible in the input `data` table."
    )
  }

  # Get the remaining column names in the table
  other_columns <- base::setdiff(vars, columns)

  new_vars <- append(other_columns, columns)

  dt_boxhead_set_var_order(
    data = data,
    vars = new_vars
  )
}
