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


.dt_source_notes_key <- "_source_notes"

dt_source_notes_get <- function(data) {
  dt__get(data, .dt_source_notes_key)
}

dt_source_notes_set <- function(data, source_notes) {
  dt__set(data, .dt_source_notes_key, source_notes)
}

dt_source_notes_init <- function(data) {
  dt_source_notes_set(data = data, source_notes = list())
}

dt_source_notes_add <- function(data, source_note) {

  source_notes_list <- dt_source_notes_get(data = data)

  source_notes <-  append(source_notes_list, list(source_note))

  dt_source_notes_set(data = data, source_notes = source_notes)
}

dt_source_notes_build <- function(data, context) {

  source_notes <- dt_source_notes_get(data)

  source_notes <-
    unlist(
      lapply(
        source_notes,
        FUN = function(label) process_text(label, context = context)
      )
    )

  dt_source_notes_set(data = data, source_notes = source_notes)
}
