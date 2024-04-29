library(tidyverse)

country_names <-
  readr::read_csv(
    file = "data-raw/country_names.csv",
    col_types = cols(.default = col_character())
  )
