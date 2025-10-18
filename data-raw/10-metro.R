library(tidyverse)

metro <-
  readr::read_csv(
    file = "data-raw/metro.csv",
    col_types =
      cols(
        name = col_character(),
        caption = col_character(),
        lines = col_character(),
        connect_rer = col_character(),
        connect_tramway = col_character(),
        connect_transilien = col_character(),
        connect_other = col_character(),
        passengers = col_integer(),
        latitude = col_double(),
        longitude = col_double(),
        location = col_character(),
        min_line = col_double()
      )
  ) |>
  dplyr::select(-min_line)
