library(tidyverse)

peeps <-
  readr::read_csv(
    file = "data-raw/peeps.csv",
    col_types =
      cols(
        name_given = col_character(),
        name_family = col_character(),
        address = col_character(),
        city = col_character(),
        state_prov = col_character(),
        postcode = col_character(),
        country = col_character(),
        email_addr = col_character(),
        phone_number = col_character(),
        country_code = col_double(),
        gender = col_character(),
        dob = col_date(format = ""),
        height_cm = col_integer(),
        weight_kg = col_double()
      )
  )
