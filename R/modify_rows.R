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
#  Copyright (c) 2018-2025 gt authors
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
