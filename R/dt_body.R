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


.dt_body_key <- "_body"

dt_body_get <- function(data) {

  ret <- dt__get(data, .dt_body_key)

  if (is.null(ret)) {
    cli::cli_abort("Must call {.fn dt_body_build_init} first.")
  }

  ret
}

dt_body_set <- function(data, body) {
  dt__set(data, .dt_body_key, body)
}

dt_body_build_init <- function(data) {

  body <- dt_data_get(data = data)[dt_boxhead_get_vars(data = data)]

  if (NROW(body) > 0) {
    body[] <- NA_character_
  }

  dt_body_set(body = body, data = data)
}

# Function to reassemble the rows and columns of the `body`
# in a revised order
dt_body_reassemble <- function(data) {

  body <- dt_body_get(data = data)
  stub_df <- dt_stub_df_get(data = data)

  # Use the rownum_i values from stub_df which reflect the current row order
  # (including both group ordering and any row_order() directives)
  rows <- stub_df$rownum_i

  cols <- dt_boxhead_get_vars(data = data)

  dt_body_set(data = data, body = body[rows, cols, drop = FALSE])
}

dt_body_build <- function(data) {
  dt_body_build_init(data = data)
}
