.dt_output_key <- "_output_tbl"

dt_output_get <- function(data) {

  attr(data, .dt_output_key, exact = TRUE)
}

dt_output_set <- function(data, output_tbl) {

  attr(data, .dt_output_key) <- output_tbl
  data
}

dt_output_init <- function(data) {

  output_tbl <- dt_data_get(data = data)

  if (nrow(output_tbl) > 0) {
    output_tbl[] <- NA_character_
  }

  output_tbl %>%
    dplyr::as_tibble() %>%
    dt_output_set(output_tbl = ., data = data)
}
