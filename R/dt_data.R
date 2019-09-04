.dt_data_key <- "_data"

dt_data_get <- function(data) {

  attr(data, .dt_data_key, exact = TRUE)
}

dt_data_set <- function(data, data_tbl) {

  attr(data, .dt_data_key) <- data_tbl
  data
}

dt_data_init <- function(data) {

  dt_data_set(data,  NULL)
}
