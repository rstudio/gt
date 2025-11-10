library(gt)
library(tidyverse)

# Create a table where rows are formatted conditionally
conditional_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd"
  ) |>
  gt() |>
  fmt_number(
    columns = Open,
    rows = Open > 1900,
    decimals = 3,
    scale_by = 1/1000,
    pattern = "{x}K"
  ) |>
  fmt_number(
    columns = Close,
    rows = High < 1940 & Low > 1915,
    decimals = 3
  ) |>
  fmt_currency(
    columns = c(High, Low, Close),
    rows = Date > "2016-02-20",
    currency = "USD"
  )

conditional_tbl
