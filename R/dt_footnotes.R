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
#  Copyright (c) 2018-2024 gt authors
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
      locname = character(0L),
      grpname = character(0L),
      colname = character(0L),
      locnum = numeric(0L),
      rownum = integer(0L),
      colnum = integer(0L),
      footnotes = list(character(0L)),
      placement = character(0L)
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
