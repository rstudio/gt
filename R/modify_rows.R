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


# row_group_order() ------------------------------------------------------------
#' Modify the ordering of any row groups
#'
#' @description
#'
#' We can modify the display order of any row groups in a **gt** object with
#' `row_group_order()`. The `groups` argument takes a vector of row group ID
#' values. After this function is invoked, the row groups will adhere to this
#' revised ordering. It isn't necessary to provide all row ID values in
#' `groups`, rather, what is provided will assume the specified ordering at the
#' top of the table and the remaining row groups will follow in their original
#' ordering.
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param groups *Specification of row group IDs*
#'
#'   `vector<character>` // **required**
#'
#'   A character vector of row group ID values corresponding to the revised
#'   ordering. While this vector must contain valid group ID values, it is not
#'   required to have all of the row group IDs within it; any omitted values
#'   will be added to the end while preserving the original ordering.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use [`exibble`] to create a **gt** table with a stub and with row
#' groups. We can modify the order of the row groups with `row_group_order()`,
#' specifying the new ordering in `groups`.
#'
#' ```r
#' exibble |>
#'   dplyr::select(char, currency, row, group) |>
#'   gt(
#'     rowname_col = "row",
#'     groupname_col = "group"
#'   ) |>
#'   row_group_order(groups = c("grp_b", "grp_a"))
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_group_order_1.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-3
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
row_group_order <- function(
    data,
    groups
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Stop function if `groups` is not a `character` vector
  if (!inherits(groups, "character")) {
    cli::cli_abort(
      "The values provided for `groups` must be a character vector."
    )
  }

  # Get the current arrangement of the row groups
  arrange_groups <- dt_row_groups_get(data = data)

  # Stop function if any value in `groups` doesn't match a group name
  if (!all(groups %in% arrange_groups)) {

    cli::cli_abort(c(
      "All values given as `groups` must correspond to `group_id` values.",
      "*" = "The following `group_id` values can be
      used {.str {arrange_groups}}."
    ))
  }

  # Arrange groups in the new order
  groups <- c(unique(groups), base::setdiff(arrange_groups, unique(groups)))

  # Create and store a list of row groups in the intended ordering
  dt_row_groups_set(
    data = data,
    row_groups = groups
  )
}


# row_order() ------------------------------------------------------------------
#' Modify the order of rows within groups
#'
#' @description
#'
#' We can modify the display order of rows within any row groups in a **gt**
#' object with `row_order()`. One or more column names can be provided to define
#' the sorting criteria. By default, rows are sorted in ascending order; use
#' `reverse = TRUE` to sort in descending order. The ordering is applied lazily
#' during the table build phase, ensuring it works alongside other row-reordering
#' operations.
#'
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param ... *Column expressions for ordering*
#'
#'   `<column expressions>` // **required**
#'
#'   Column names or expressions describing how to order the rows. Multiple
#'   columns can be specified for hierarchical sorting, where the first column
#'   is the primary sort key.
#'
#' @param groups *Specification of row group IDs*
#'
#'   `vector<character>|NULL` // *default:* `NULL`
#'
#'   An optional character vector of row group ID values to target. If `NULL`
#'   (the default), the ordering is applied to rows in all groups. If specified,
#'   only rows within the indicated groups will be reordered.
#'
#' @param reverse *Reverse the sort order*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the sort order be reversed (i.e., descending)? By default this is
#'   `FALSE`, which sorts in ascending order.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Examples:
#'
#' Let's use the [`gtcars`] dataset to demonstrate row ordering within groups.
#' We'll create a **gt** table grouped by country and then order rows within
#' each group by horsepower in descending order.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, ctry_origin, hp, mpg_c) |>
#'   dplyr::slice_head(n = 12) |>
#'   gt(groupname_col = "ctry_origin") |>
#'   row_order(hp, reverse = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_order_1.png")`
#' }}
#'
#' We can also order rows only within specific groups. Here we order by `mpg_c`
#' in ascending order, but only for the "Germany" group:
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, ctry_origin, hp, mpg_c) |>
#'   dplyr::slice_head(n = 12) |>
#'   gt(groupname_col = "ctry_origin") |>
#'   row_order(mpg_c, groups = "Germany")
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_order_2.png")`
#' }}
#'
#' Multiple sorting columns can be specified for hierarchical ordering:
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, ctry_origin, year, hp) |>
#'   dplyr::slice_head(n = 12) |>
#'   gt(groupname_col = "ctry_origin") |>
#'   row_order(year, hp, reverse = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_row_order_3.png")`
#' }}
#'
#' @family row addition/modification functions
#' @section Function ID:
#' 6-4
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @seealso [row_group_order()], which orders the groups themselves.
#'
#' @export
row_order <- function(
    data,
    ...,
    groups = NULL,
    reverse = FALSE
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Capture the ordering expressions as quosures
  by <- rlang::enquos(...)

  # Stop function if no ordering expressions are provided
  if (length(by) == 0) {
    cli::cli_abort(
      "At least one column must be provided for ordering."
    )
  }

  # Validate `groups` argument if provided
  if (!is.null(groups)) {

    # Stop function if `groups` is not a `character` vector
    if (!inherits(groups, "character")) {
      cli::cli_abort(
        "The values provided for `groups` must be a character vector."
      )
    }

    # Get the current arrangement of the row groups
    arrange_groups <- dt_row_groups_get(data = data)

    # Stop function if any value in `groups` doesn't match a group name
    if (!all(groups %in% arrange_groups)) {

      cli::cli_abort(c(
        "All values given as `groups` must correspond to `group_id` values.",
        "*" = "The following `group_id` values can be
        used {.str {arrange_groups}}."
      ))
    }
  }

  # Validate `reverse` argument
  if (!is.logical(reverse) || length(reverse) != 1) {
    cli::cli_abort(
      "The `reverse` argument must be a single logical value."
    )
  }

  # Store the ordering directive (to be applied during build phase)
  dt_row_order_add(
    data = data,
    by = by,
    groups = groups,
    reverse = reverse
  )
}
