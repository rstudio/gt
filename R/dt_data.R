.dt_data_key <- "_data"

dt_data_get <- function(data) {

  dt__get(data, .dt_data_key)
}

dt_data_set <- function(data, data_tbl) {

  dt__set(data, .dt_data_key, data_tbl %>% dplyr::as_tibble())
}

dt_data_init <- function(data, data_tbl, rownames_to_stub) {

  # If the option to place rownames in the stub
  # is taken, then the `stub_df` data frame will
  # be pre-populated with rownames in the `rowname`
  # column; otherwise, this will be an empty df
  if (isTRUE(rownames_to_stub)) {

    data_rownames <- rownames(data_tbl)

    data_tbl <-
      data_tbl %>%
      dplyr::mutate(rowname = data_rownames) %>%
      dplyr::select(rowname, dplyr::everything())
  }

  dt_data_set(data = data, data_tbl = data_tbl)
}
