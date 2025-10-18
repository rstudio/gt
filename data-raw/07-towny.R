library(tidyverse)

towny <-
  readr::read_csv(
    file = "data-raw/towny.csv",
    col_types =
      cols(
        name = col_character(),
        coordinates = col_character(),
        website = col_character(),
        status = col_character(),
        csd_type = col_character(),
        census_div = col_character(),
        land_area_km = col_double(),
        population_1996 = col_integer(),
        population_2001 = col_integer(),
        population_2006 = col_integer(),
        population_2011 = col_integer(),
        population_2016 = col_integer(),
        population_2021 = col_integer(),
        density_1996 = col_double(),
        density_2001 = col_double(),
        density_2006 = col_double(),
        density_2011 = col_double(),
        density_2016 = col_double(),
        density_2021 = col_double(),
        pop_change_1996_2001_pct = col_double(),
        pop_change_2001_2006_pct = col_double(),
        pop_change_2006_2011_pct = col_double(),
        pop_change_2011_2016_pct = col_double(),
        pop_change_2016_2021_pct = col_double()
      )
  ) |>
  tidyr::separate(
    col = coordinates,
    into = c("latitude", "longitude"), sep = ", "
  ) |>
  dplyr::mutate(
    latitude = as.numeric(latitude),
    longitude = as.numeric(longitude)
  ) |>
  dplyr::rename(land_area_km2 = land_area_km) |>
  dplyr::relocate(
    name, website, status, csd_type, census_div,
    latitude, longitude
  )
