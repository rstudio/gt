library(tidyverse)

fractions <-
  readr::read_csv(
    file = "data-raw/fractions.csv",
    col_types = "ccccccccc"
  )

# Drop spec() attribute
fractions <- fractions[]
