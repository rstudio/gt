library(gt)
library(tidyverse)

# Create a presentation table based on `sp500`
# S&P 500

# 0 - read in the data using `readr::read_csv()`
# 1 - ingest the data frame using `tab_create()`
# 2 - the 'striped' theme is applied
# 3 - apply the Courier font to all columns
# 4 - all `numeric`-type columns have right aligned values
# 5 - the `Date` column values are left aligned
# 6 - the `Open` and `Close` column are moved to the start
#     of the column series
# 7 - the `Date` and `Time` column are moved to the end
#     of the column series
# 8 - the `Volume` column is removed from the table
# 9 - format the `Date` column as a date (style #3)
# 11 - format the `Open`, `High`, `Low`, and `Close` columns
#      as USD currency (dollars, showing commas)
sp500_tbl <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd") %>% # 0
  tab_create() %>%  # 1
  theme_striped() %>%  # 2
  fmt_font(font = "Courier") %>%  # 3
  cols_align_right(types = "numeric") %>%  # 4
  cols_align_left(columns = "Date") %>%  # 5
  cols_move_to_start(columns = c("Open", "Close")) %>%  # 6
  cols_move_to_end(columns = "Date") %>%  # 7
  cols_remove(columns = "Volume") %>%  # 8
  fmt_date(
    columns = "Date",
    date_style = 3) %>%  # 9
  fmt_currency(
    columns = c("Open", "High", "Low", "Close"),
    currency = "USD",
    use_big_mark = TRUE)  # 10

# Display the table in the Viewer
sp500_tbl
