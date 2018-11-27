library(tidyverse)

countrypops <-
  readr::read_csv(
    file = "data-raw/countrypops_wide.csv",
    col_types = paste0("ccc", paste0(rep("i", 58), collapse = "")),
    na = character()
    ) %>%
  tidyr::gather("year", "population", `1960`:`2017`) %>%
  dplyr::arrange(country_code_3, year) %>%
  dplyr::mutate(year = as.integer(year))
