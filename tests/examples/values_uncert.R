library(gt)
library(tidyverse)

# Create a table with values and uncertainties
tbl <-
  dplyr::tribble(
    ~value,   ~uncertainty,  ~type,
    0.352,    0.10,          "a",
    0.983,    0.13,          "a",
    0.639,    0.12,          "b",
    0.283,    0.17,          "b")

# Create a table
uncert_tbl <-
  gt(data = tbl) %>%
  cols_align_center() %>%
  #fmt_uncertainty(value_column = "value", uncert_column = "uncertainty") %>%
  fmt_number(columns = c("value", "uncertainty"), decimals = 2) #%>%
  #fmt_font(font = "Helvetica")

# Display the table in the Viewer
uncert_tbl
