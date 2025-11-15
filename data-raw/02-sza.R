library(tidyverse)

sza <-
  readr::read_csv(file = "data-raw/sza.csv") |>
  dplyr::mutate(month = factor(
    month,
    levels = c(
      "jan", "feb", "mar", "apr", "may", "jun",
      "jul", "aug", "sep", "oct", "nov", "dec"))
  )
