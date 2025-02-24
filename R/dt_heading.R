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


.dt_heading_key <- "_heading"

dt_heading_get <- function(data) {
  dt__get(data, .dt_heading_key)
}

dt_heading_set <- function(data, heading) {
  dt__set(data, .dt_heading_key, heading)
}

dt_heading_init <- function(data) {

  heading <-
    list(
      title = NULL,
      subtitle = NULL,
      preheader = NULL
    )

  dt_heading_set(data = data, heading = heading)
}

dt_set_heading_components <- function(data, title, subtitle, preheader) {

  heading <- dt_heading_get(data = data)

  heading[c("title", "subtitle", "preheader")] <-
    list(title = title, subtitle = subtitle, preheader = preheader)

  dt_heading_set(data = data, heading = heading)
}

dt_heading_build <- function(data, context) {

  heading <- dt_heading_get(data = data)

  heading <- lapply(heading, function(val) process_text(val, context = context))

  dt_heading_set(data = data, heading = heading)
}

dt_heading_has_title <- function(data) {

  heading <- dt_heading_get(data = data)

   length(heading) > 0 && length(heading$title) > 0
}

dt_heading_has_subtitle <- function(data) {

  heading <- dt_heading_get(data = data)

  length(heading) > 0 && is_nonempty_chr(heading$subtitle)
}

dt_heading_has_preheader <- function(data) {

  heading <- dt_heading_get(data = data)

  length(heading$preheader) > 0
}
