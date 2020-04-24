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

dt_styles_add <- function(data,
                          locname,
                          grpname,
                          colname,
                          locnum,
                          rownum,
                          styles) {

  data %>%
    dt_styles_get() %>%
    dplyr::bind_rows(
      dplyr::tibble(
        locname = locname,
        grpname = grpname,
        colname = colname,
        locnum = locnum,
        rownum = rownum,
        colnum = NA_integer_,
        styles = list(styles)
      )
    ) %>%
    dt_styles_set(styles = ., data = data)
}
