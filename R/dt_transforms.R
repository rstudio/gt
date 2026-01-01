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


.dt_transforms_key <- "_transforms"

dt_transforms_get <- function(data) {
  dt__get(data, .dt_transforms_key)
}

dt_transforms_set <- function(data, transforms) {
  dt__set(data, .dt_transforms_key, transforms)
}

dt_transforms_init <- function(data) {
  dt_transforms_set(data = data, transforms = list())
}

dt_transforms_add <- function(data, loc, fn) {

  existing_transforms <- dt_transforms_get(data = data)
  resolved <- resolve_location(loc = loc, data = data)

  added_transform <- list(resolved = resolved, fn = fn)

  transforms <-
    c(
      existing_transforms,
      list(added_transform)
    )

  dt_transforms_set(data = data, transforms = transforms)
}
