library(gt)
library(tidyverse)

data <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd") %>%
  gt() %>%
  fmt_number(
    columns = vars(Open),
    where = Open > 1900,
    decimals = 3,
    scale_by = 1/1000,
    pattern = "{x}K") %>%
  fmt_number(
    columns = vars(Close),
    where = High < 1940 & Low > 1915,
    decimals = 3) %>%
  fmt_currency(
    columns = vars(High, Low, Close),
    where = Date > "2016-02-20",
    currency = "USD")

data
