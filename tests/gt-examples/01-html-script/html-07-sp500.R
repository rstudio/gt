library(gt)
library(tidyverse)

sp500_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd"
  ) |>
  gt() |>
  fmt_date(
    columns = Date,
    date_style = 6
  ) |>
  fmt_currency(
    columns = c(High, Open, Low, Close),
    currency = "USD",
    scale_by = 1/1000,
    pattern = "{x}K"
  ) |>
  fmt_number(
    columns = Volume,
    decimals = 3,
    scale_by = 1E-9,
    pattern = "{x}B"
  )

sp500_tbl
