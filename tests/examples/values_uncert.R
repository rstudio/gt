library(gt)
library(tidyverse)

# Create a table with values and uncertainties
tbl <-
  tibble::tribble(
    ~value,   ~uncertainty,  ~type,
    0.352,    0.10,          "a",
    0.983,    0.13,          "a",
    0.639,    0.12,          "b",
    0.283,    0.17,          "b")

# Create a table
uncert_tbl <-
  gt(tbl = tbl) %>%
  apply_alignment_center() %>%
  add_uncertainty(value_column = "value", uncert_column = "uncertainty") %>%
  format_as_number(columns = c("value", "uncertainty"), decimals = 2) %>%
  apply_theme_striped() %>%
  apply_font(font = "Helvetica")

# Display the table in the Viewer
uncert_tbl
