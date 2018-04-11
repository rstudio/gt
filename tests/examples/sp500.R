library(gt)
library(tidyverse)

# Create a presentation table based on `sp500`
# S&P 500
sp500 <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd") %>%
  dplyr::filter(row_number() %in% c(1:5)) %>%
  dplyr::mutate(Time = c("13:54", "18:00", "20:59", "08:21", "15:39")) %>%
  dplyr::select(Date, Time, Open, High, Low, Close, Volume)


# 1 - we take the prepared `sp500` tibble from above
# 2 - the 'striped' theme is applied
# 3 - all `numeric` column values are right aligned
# 4 - the `Time` column values are right aligned
# 5 - format the `Date` column as a date (style #2)
# 6 - format the `Time` column as a time (style #4)
# 7 - format the `Open`, `High`, `Low`, and `Close` columns
#     as currency (dollars, showing commas)
# 8 - format the `Volume` column as scientific notation
sp500_tbl <-
  gt(tbl = sp500) %>%  # 1
  apply_theme_striped() %>%  # 2
  apply_alignment_right(types = "numeric") %>%  # 3
  apply_alignment_right(columns = "Time") %>%  # 4
  format_as_date(
    columns = "Date",
    date_style = 2) %>%  # 5
  format_as_time(
    columns = "Time",
    time_style = "4") %>%  # 6
  format_as_currency(
    columns = c("Open", "High", "Low", "Close"),
    currency = "dollar",
    thousands_sep = TRUE) %>%  # 7
  format_as_scientific(
    columns = "Volume",
    decimals = 1)  # 8

# Render the table in the Viewer
sp500_tbl %>% render_table()

# Render with the different table parts highlighted
# sp500_tbl %>% highlight_tbl_parts()
