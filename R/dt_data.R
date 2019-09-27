.dt_data_key <- "_data"

dt_data_get <- function(data) {

  dt__get(data, .dt_data_key)
}

dt_data_set <- function(data, data_tbl) {

  dt__set(data, .dt_data_key, data_tbl %>% dplyr::as_tibble())
}

dt_data_init <- function(data, data_tbl = NULL) {

  dt_data_set(data, data_tbl)
}
