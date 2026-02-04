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


.dt_rows_hidden_key <- "_rows_hidden"

dt_rows_hidden_get <- function(data) {
  dt__get(data, .dt_rows_hidden_key)
}

dt_rows_hidden_set <- function(data, rows_hidden) {
  dt__set(data, .dt_rows_hidden_key, rows_hidden)
}

dt_rows_hidden_init <- function(data) {
  dt_rows_hidden_set(data = data, rows_hidden = integer(0L))
}

#' Add rows to the hidden rows list
#'
#' @param data The gt table data object.
#' @param rows Integer vector of row indices to hide.
#'
#' @noRd
dt_rows_hidden_add <- function(data, rows) {

  existing_hidden <- dt_rows_hidden_get(data = data)

  # Combine and keep unique values

  rows_hidden <- sort(unique(c(existing_hidden, rows)))

  dt_rows_hidden_set(data = data, rows_hidden = rows_hidden)
}

#' Remove rows from the hidden rows list (unhide them)
#'
#' @param data The gt table data object.
#' @param rows Integer vector of row indices to unhide.
#'
#' @noRd
dt_rows_hidden_remove <- function(data, rows) {

  existing_hidden <- dt_rows_hidden_get(data = data)

  # Remove specified rows from hidden list
  rows_hidden <- setdiff(existing_hidden, rows)

  dt_rows_hidden_set(data = data, rows_hidden = rows_hidden)
}

#' Check if any rows are hidden
#'
#' @param data The gt table data object.
#'
#' @noRd
dt_rows_hidden_exist <- function(data) {
  length(dt_rows_hidden_get(data = data)) > 0
}
