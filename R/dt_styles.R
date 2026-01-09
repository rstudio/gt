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


.dt_styles_key <- "_styles"

dt_styles_get <- function(data) {
  dt__get(data, .dt_styles_key)
}

dt_styles_set <- function(data, styles) {
  dt__set(data, .dt_styles_key, styles)
}

dt_styles_init <- function(data) {

  styles_tbl <-
    vctrs::data_frame(
      locname = character(0L),
      grpname = character(0L),
      colname = character(0L),
      locnum = numeric(0L),
      rownum = integer(0L),
      colnum = integer(0L),
      styles = list()
    )

  dt_styles_set(data = data, styles = styles_tbl)
}

dt_styles_add <- function(
    data,
    locname,
    grpname,
    colname,
    locnum,
    rownum,
    styles
) {

  grid <-
    expand.grid(
      colname = unique(colname),
      grpname = unique(grpname),
      rownum = unique(rownum),
      stringsAsFactors = FALSE
    )

  result <-
    vctrs::data_frame(
      locname = locname,
      grpname = grid$grpname,
      colname = grid$colname,
      locnum = locnum,
      rownum = grid$rownum,
      colnum = NA_integer_,
      styles = list(styles)
    )

  dt_styles_set(
    data = data,
    styles = vctrs::vec_rbind(dt_styles_get(data = data), result)
  )
}

dt_styles_pluck <- function(
    styles_tbl,
    locname = missing_arg(),
    grpname = missing_arg(),
    colname = missing_arg(),
    locnum = missing_arg(),
    rownum = missing_arg(),
    grprow = missing_arg()
) {

  if (is.null(styles_tbl$html_style)) {
    cli::cli_abort(
      "The `dt_styles_pluck()` function must be passed a built 'styles' table."
    )
  }

  n <- nrow(styles_tbl)
  if (n == 0) {
    return(styles_tbl)
  }
  idx <- rep_len(TRUE, n)

  if (!is_missing(locname)) {
    idx <- idx & styles_tbl$locname %in% locname
  }
  if (!is_missing(grpname)) {
    idx <- idx & styles_tbl$grpname %in% grpname
  }
  if (!is_missing(colname)) {
    idx <- idx & styles_tbl$colname %in% colname
  }
  if (!is_missing(locnum)) {
    idx <- idx & styles_tbl$locnum %in% locnum
  }
  if (!is_missing(rownum)) {
    idx <- idx & styles_tbl$rownum %in% rownum
  }
  if (!is_missing(grprow)) {
    idx <- idx & round((styles_tbl$rownum %% 1) * 100) %in% grprow
  }

  # `vec_slice()` is much faster than `[`
  vctrs::vec_slice(styles_tbl, idx)
}
