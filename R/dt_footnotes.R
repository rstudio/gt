.dt_footnotes_key <- "_footnotes"

dt_footnotes_get <- function(data) {

  attr(data, .dt_footnotes_key, exact = TRUE)
}

dt_footnotes_set <- function(data, footnotes) {

  attr(data, .dt_footnotes_key) <- footnotes
  data
}

dt_footnotes_init <- function(data) {

  dplyr::tibble(
    locname = character(0),
    grpname = character(0),
    colname = character(0),
    locnum = numeric(0),
    rownum = integer(0),
    colnum = integer(0),
    footnotes = character(0)
  ) %>%
    dt_footnotes_set(footnotes = ., data = data)
}

dt_footnotes_add <- function(data,
                             locname,
                             grpname,
                             colname,
                             locnum,
                             rownum,
                             footnotes) {

  data %>%
    dt_footnotes_get() %>%
    dplyr::bind_rows(
      dplyr::tibble(
        locname = locname,
        grpname = grpname,
        colname = colname,
        locnum = locnum,
        rownum = rownum,
        colnum = NA_integer_,
        footnotes = footnotes
      )
    ) %>%
    dt_footnotes_set(footnotes = ., data = data)
}
