.dt_styles_key <- "_styles"

dt_styles_get <- function(data) {

  dt__get(data, .dt_styles_key)
}

dt_styles_set <- function(data, styles) {

  dt__set(data, .dt_styles_key, styles)
}

dt_styles_init <- function(data) {

  dplyr::tibble(
    locname = NA_character_,
    grpname = NA_character_,
    colname = NA_character_,
    locnum = NA_real_,
    rownum = NA_integer_,
    colnum = NA_integer_,
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
