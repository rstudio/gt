#' Modify the ordering of any row groups
#'
#' We can modify the display order of any row groups in a **gt** object with the
#' `row_group_order()` function. The `groups` argument takes a vector of row
#' group ID values. After this function is invoked, the row groups will adhere
#' to this revised ordering. It isn't necessary to provide all row ID values in
#' `groups`, rather, what is provided will assume the specified ordering at the
#' top of the table and the remaining row groups will follow in their original
#' ordering.
#'
#' @inheritParams cols_align
#' @param groups A character vector of row group ID values corresponding to the
#'   revised ordering. While this vector must contain valid group ID values, it
#'   is not required to have all of the row group IDs within it; any omitted
#'   values will be added to the end while preserving the original ordering.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table
#' # with a stub and with row groups;
#' # modify the order of the row groups
#' # with `row_group_order()`, specifying
#' # the new ordering in `groups`
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(char, currency, row, group) %>%
#'     gt(
#'       rowname_col = "row",
#'       groupname_col = "group"
#'     ) %>%
#'     row_group_order(
#'       groups = c("grp_b", "grp_a")
#'     )
#'
#' @section Figures:
#' \if{html}{\figure{man_row_group_order_1.png}{options: width=100\%}}
#'
#' @family Modify Rows
#' @section Function ID:
#' 5-1
#'
#' @export
row_group_order <- function(data,
                            groups) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Stop function if `groups` is not a `character` vector
  if (!inherits(groups, "character")) {

    stop(
      "The values provided for `groups` must be a character vector.",
      call. = FALSE
    )
  }

  # Get the current arrangement of the row groups
  arrange_groups <- dt_row_groups_get(data = data)

  # Stop function if any value in `groups` doesn't match a group name
  if (any(!groups %in% arrange_groups)) {

    stop(
      "All values given as `groups` must correspond to `group_id` values:\n",
      "The following `group_id` values can be used:\n",
      str_catalog(arrange_groups),
      call. = FALSE
    )
  }

  # Arrange groups in the new order
  groups <- c(unique(groups), base::setdiff(arrange_groups, unique(groups)))

  # Create and store a list of row groups in the intended ordering
  dt_row_groups_set(data = data, row_groups = groups)
}
