library(gt)
library(tidyverse)

html_table <-
  readr::read_csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    col_types = "cddddd") %>%
  dplyr::mutate(datetime = paste(Date, "12:23")) %>%
  dplyr::mutate(time = "12:34") %>%
  gt() %>%
  fmt_datetime(
    columns = "datetime",
    date_style = 3,
    time_style = 3) %>%
  fmt_date(
    columns = "Date",
    date_style = 5) %>%
  fmt_number(
    columns = "High",
    decimals = 2,
    drop0trailing = FALSE) %>%
  fmt_time(
    columns = "time",
    time_style = 5) %>%
  fmt_currency(
    columns = c("Open", "High", "Low", "Close"),
    currency = "USD") %>%
  fmt_number( # doesn't work (need to remove `::curr_*` directive)
    columns = c("Open", "High", "Low", "Close"),
    decimals = 2)

# Use the HTML processing step
html_table <- process_html(html_table)

# Create an HTML dependency for the stylesheet
dep <- htmltools::htmlDependency(
  name = 'gt',
  version = '0.1',
  src = gt:::system_file(file = 'css'),
  stylesheet = 'gt.css')

# Attach the dependency to the HTML table
html_tbl <- htmltools::attachDependencies(HTML(html_table), dep)

# Print the object in the Viewer
html_print(html_tbl)
