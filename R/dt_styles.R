.dt_styles_key <- "_styles"

dt_styles_get <- function(data) {

  dt__get(data, .dt_styles_key)
}

dt_styles_set <- function(data, styles) {

  dt__set(data, .dt_styles_key, styles)
}

dt_styles_init <- function(data) {

  dplyr::tibble(
    locname = character(0),
    grpname = character(0),
    colname = character(0),
    locnum = numeric(0),
    rownum = integer(0),
    colnum = integer(0),
    styles = list()
  ) %>%
    dt_styles_set(styles = ., data = data)
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
  # cscheid: I don't understand why the commented-out code below
  # doesn't work..
  #
  #result <- dt_styles_get(data)
  #grid <- dplyr::bind_rows(result, expand.grid(
  #  colname = unique(result$colname),
  #  grpname = unique(result$grpname),
  #  rownum = unique(result$rownum),
  #  stringsAsFactors = FALSE
  #))
  #df <- dplyr::tibble(
  #  locname = grid$locname,
  #  grpname = grid$grpname,
  #  colname = grid$colname,
  #  locnum = grid$locnum,
  #  colnum = NA_integer_,
  #  rownum = grid$rownum,
  #  styles = list(grid$styles)
  #)
  #dt_styles_set(styles = df, data = data)

  dt_styles_get(data) %>%
    dplyr::bind_rows(
      expand.grid(
        grpname = unique(grpname),
        colname = unique(colname),
        rownum = unique(rownum),
        stringsAsFactors = FALSE
      ) %>%
        dplyr::as_tibble() %>%
        dplyr::mutate(
          locname = locname,
          locnum = locnum,
          colnum = NA_integer_,
          styles = list(styles)
        )) %>%
    dt_styles_set(styles = ., data = data)
}

dt_styles_pluck <- function(styles_tbl,
  locname = missing_arg(),
  grpname = missing_arg(),
  colname = missing_arg(),
  locnum = missing_arg(),
  rownum = missing_arg(),
  grprow = missing_arg()) {

  if (is.null(styles_tbl$html_style)) {
    cli::cli_abort(
      "The `dt_styles_pluck()` function must be passed a built 'styles' table."
    )
  }

  idx <- rep_len(TRUE, nrow(styles_tbl))

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

  styles_tbl[idx, ]
}
