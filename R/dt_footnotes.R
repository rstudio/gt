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
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


.dt_footnotes_key <- "_footnotes"

dt_footnotes_get <- function(data) {
  dt__get(data, .dt_footnotes_key)
}

dt_footnotes_set <- function(data, footnotes) {
  dt__set(data, .dt_footnotes_key, footnotes)
}

dt_footnotes_init <- function(data) {

  footnotes_df <-
    dplyr::tibble(
      locname = character(0),
      grpname = character(0),
      colname = character(0),
      locnum = numeric(0),
      rownum = integer(0),
      colnum = integer(0),
      footnotes = list(character(0)),
      placement = character(0)
    )

  dt_footnotes_set(data = data, footnotes = footnotes_df)
}

dt_footnotes_add <- function(
    data,
    locname,
    grpname,
    colname,
    locnum,
    rownum,
    footnotes,
    placement
) {

  grid <-
    expand.grid(
      colname = unique(colname),
      grpname = unique(grpname),
      rownum = unique(rownum),
      stringsAsFactors = FALSE
    )

  result <-
    dplyr::tibble(
      locname = locname,
      grpname = grid$grpname,
      colname = grid$colname,
      locnum = locnum,
      rownum = grid$rownum,
      colnum = NA_integer_,
      footnotes = list(footnotes),
      placement = placement
    )

  dt_footnotes_set(
    data = data,
    footnotes = dplyr::bind_rows(dt_footnotes_get(data = data), result)
  )
}
