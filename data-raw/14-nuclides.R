library(tidyverse)

nuclides <-
  readr::read_csv(
    file = "data-raw/nuclides.csv",
    col_types =
      cols(
        z = col_integer(),
        n = col_integer(),
        name = col_character(),
        halflife = col_double(),
        mode = col_character()
      )
  )

