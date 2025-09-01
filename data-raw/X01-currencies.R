library(tidyverse)

currencies <-
  readr::read_csv(
    file = "data-raw/x_currencies.csv",
    col_types = "ccccc"
  )

# Drop spec() attribute
currencies <- currencies[]
