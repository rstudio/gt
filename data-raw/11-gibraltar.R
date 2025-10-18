library(tidyverse)

gibraltar <-
  readr::read_csv(
    file = "data-raw/gibraltar.csv",
    col_types =
      cols(
        date = col_date(format = ""),
        time = col_time(format = ""),
        temp = col_character(),
        dew_point = col_character(),
        humidity = col_character(),
        wind_dir = col_character(),
        wind_speed = col_character(),
        wind_gust = col_character(),
        pressure = col_character(),
        precip = col_character(),
        condition = col_character()
      )
  ) |>
  dplyr::select(-precip) %>%
  dplyr::mutate(time = sub(":00$", "", as.character(time))) |>
  dplyr::mutate(temp = as.numeric(gsub("\\D", "", temp))) |>
  dplyr::mutate(dew_point = as.numeric(gsub("\\D", "", dew_point))) |>
  dplyr::mutate(humidity = as.numeric(gsub("\\D", "", humidity))) |>
  dplyr::mutate(wind_speed = as.numeric(gsub("\\D", "", wind_speed))) |>
  dplyr::mutate(wind_gust = as.numeric(gsub("\\D", "", wind_gust))) |>
  dplyr::mutate(pressure = as.numeric(gsub("[^0-9\\.]", "", pressure))) |>
  dplyr::mutate(temp = round((temp - 32) * 5/9, 1)) |>
  dplyr::mutate(dew_point = round((dew_point - 32) * 5/9, 1)) |>
  dplyr::mutate(humidity = humidity / 100) |>
  dplyr::mutate(wind_speed = round(wind_speed * 0.44704, 1)) |>
  dplyr::mutate(wind_gust = round(wind_gust * 0.44704, 1)) |>
  dplyr::mutate(pressure = round(pressure * 33.863889532610884, 1))
