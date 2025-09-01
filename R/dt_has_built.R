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


.dt_has_built_key <- "_has_built"

dt_has_built_get <- function(data) {
  dt__get(data, .dt_has_built_key)
}

dt_has_built_set <- function(data, value) {
  dt__set(data, .dt_has_built_key, value)
}

dt_has_built_init <- function(data) {
  dt_has_built_set(data = data, value = FALSE)
}

dt_has_built <- function(data) {
  isTRUE(dt_has_built_get(data = data))
}

#nocov start

dt_has_built_assert <- function(data, call = rlang::caller_env()) {

  if (!dt_has_built(data)) {
    cli::cli_abort(c(
      "The build hasn't yet occurred.",
      "*" = "Call `build_data()` before retrieving."
    ),
    call = caller_env())
  }
}

#nocov end
