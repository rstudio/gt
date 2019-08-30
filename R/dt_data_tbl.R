.dt_data_tbl_key <- "_data_tbl"

dt_data_tbl_get <- function(data) {

  attr(data, .dt_data_tbl_key, exact = TRUE)
}

dt_data_tbl_set <- function(data, data_tbl) {

  attr(data, .dt_data_tbl_key) <- data_tbl
  data
}

dt_data_tbl_init <- function(data) {

  data %>%
    dplyr::as_tibble() %>%
    dt_data_tbl_set(data_tbl = ., data = data)
}
