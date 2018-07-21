library(gt)
library(tidyverse)

data <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd") %>%
  gt() %>%
  fmt_date(
    columns = Date,
    date_style = 6) %>%
  fmt_currency(
    columns = vars(High, Open, Low, Close),
    currency = "USD")

data

