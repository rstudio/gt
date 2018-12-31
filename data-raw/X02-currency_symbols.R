library(tidyverse)

currency_symbols <-
  readr::read_csv(
    file = "data-raw/x_currency_symbols.csv",
    col_types = "cc")
