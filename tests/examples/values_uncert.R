library(gt)
library(tidyverse)

# Create a table with values and uncertainties
tbl <-
  dplyr::tribble(
    ~value,   ~uncertainty,  ~value_2, ~uncertainty_2,
    0.352,    0.10,          0.32,     NA_real_,
    0.983,    0.13,          NA_real_, NA_real_,
    0.639,    NA_real_,      0.21,     0.10,
    NA_real_, 0.17,          0.74,     0.15)

# Create a table
tab <-
  gt(data = tbl) %>%
  cols_merge_uncert(
    col_val = vars(value),
    col_uncert = vars(uncertainty)) %>%
  cols_merge_uncert(
    col_val = vars(value_2),
    col_uncert = vars(uncertainty_2)) %>%
  fmt_number(
    columns = vars(value, value_2),
    decimals = 2) %>%
  fmt_missing(columns = vars(value, value_2))

# Display the table in the Viewer
tab
