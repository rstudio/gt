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


.dt_row_groups_key <- "_row_groups"

dt_row_groups_get <- function(data) {
  dt__get(data, .dt_row_groups_key)
}

dt_row_groups_set <- function(data, row_groups) {
  dt__set(data, .dt_row_groups_key, row_groups)
}

dt_row_groups_init <- function(data) {

  stub_df <- dt_stub_df_get(data = data)

  if (all(is.na(stub_df[["group_id"]]))) {
    row_groups <- character(0L)
  } else {
    row_groups <- unique(stub_df[["group_id"]])
  }

  dt_row_groups_set(data = data, row_groups = row_groups)
}
