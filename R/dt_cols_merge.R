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


.dt_col_merge_key <- "_col_merge"

dt_col_merge_get <- function(data) {
  dt__get(data, .dt_col_merge_key)
}

dt_col_merge_set <- function(data, col_merge) {
  dt__set(data, .dt_col_merge_key, col_merge)
}

dt_col_merge_add <- function(data, col_merge) {
  added <- append(dt_col_merge_get(data = data), list(col_merge))
  dt_col_merge_set(data = data, col_merge = added)
}

dt_col_merge_entry <- function(vars, rows, type, pattern = NULL, ...) {

  # Assert type is one of the supported values
  rlang::arg_match0(
    type,
    values = c("merge", "merge_range", "merge_uncert", "merge_n_pct")
  )

  list(
    vars = vars,
    rows = rows,
    type = type,
    pattern = pattern,
    ...
  )
}

# get column names where columns were merged.
dt_col_merge_get_vars <- function(data) {
  col_merge <- dt_col_merge_get(data)
  key_vars <- lapply(col_merge, function(x) x$vars[1])
  unlist(key_vars)
}
