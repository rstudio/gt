library(tidyverse)

country_names_additional <-
  readr::read_csv(
    file = "data-raw/country_names_additional.csv",
    col_types = cols(.default = col_character()),
    na = ""
  )

# Drop spec() attribute
country_names_additional <- country_names_additional[]
