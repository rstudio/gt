library(tidyverse)

frac_1_d <-
  readr::read_csv(
    file = "data-raw/frac_1_d.csv",
    col_types = "iid"
  )

frac_10_d <-
  readr::read_csv(
    file = "data-raw/frac_10_d.csv",
    col_types = "iid"
  )

frac_100_d <-
  readr::read_csv(
    file = "data-raw/frac_100_d.csv",
    col_types = "iid"
  )
