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


.dt_formats_key <- "_formats"

dt_formats_get <- function(data) {
  dt__get(data, .dt_formats_key)
}

dt_formats_set <- function(data, formats) {
  dt__set(data, .dt_formats_key, formats)
}

dt_formats_init <- function(data) {
  dt_formats_set(data = data, formats = list())
}

dt_formats_add <- function(data, formats) {

  formats_list <- dt_formats_get(data = data)

  formats <- append(formats_list, values = list(formats))

  dt_formats_set(data = data, formats = formats)
}

# This function is used in `dt_summary_build()` to get a
# formatter function for the computed summary cells
# The `data` provided is not the body data but generated
# summary data (from aggregation functions); this is
# guaranteed to have just one formatter (hence the `[[1]]`
# index used here)
dt_formats_summary_formatter <- function(data, context) {

  formats_list <- dt_formats_get(data = data)

  formatter <- formats_list[[1]]$func

  formatter[[context]] %||% formatter$default
}
