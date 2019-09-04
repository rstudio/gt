.dt_data_key <- "_data"

dt_data_get <- function(data) {

  attr(data, .dt_data_key, exact = TRUE)
}

dt_data_set <- function(data, data_tbl) {

  attr(data, .dt_data_key) <- data_tbl %>% dplyr::as_tibble()
  data
}

dt_data_init <- function(data, data_tbl = NULL) {

  dt_data_set(data, data_tbl)
}
