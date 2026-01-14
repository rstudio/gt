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


.dt_row_order_key <- "_row_order"

dt_row_order_get <- function(data) {
  dt__get(data, .dt_row_order_key)
}

dt_row_order_set <- function(data, row_order) {
  dt__set(data, .dt_row_order_key, row_order)
}

dt_row_order_init <- function(data) {
  dt_row_order_set(data = data, row_order = list())
}

#' Add a row ordering directive
#'
#' @param data The gt table data object.
#' @param by A quosure or list of quosures for ordering.
#' @param groups Character vector of group IDs to target, or NULL for all.
#' @param reverse Logical indicating whether to reverse (descend) the order.
#'
#' @noRd
dt_row_order_add <- function(data, by, groups, reverse) {

  existing_order <- dt_row_order_get(data = data)

  added_directive <- list(
    by = by,
    groups = groups,
    reverse = reverse
  )

  row_order <-
    c(
      existing_order,
      list(added_directive)
    )

  dt_row_order_set(data = data, row_order = row_order)
}
