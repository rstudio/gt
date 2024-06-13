library(tidyverse)

conversion_factors <-
  readr::read_csv(
    file = "data-raw/conversion_factors.csv",
    col_types = cols(
      type = col_character(),
      from = col_character(),
      to = col_character(),
      conv_factor = col_double()
    )
  )

# Drop spec() attribute
conversion_factors <- conversion_factors[]
