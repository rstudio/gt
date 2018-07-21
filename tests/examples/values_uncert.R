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
  fmt_uncertainty(
    col_val = value,
    col_uncert = uncertainty) %>%
  fmt_uncertainty(
    col_val = value_2,
    col_uncert = uncertainty_2) %>%
  fmt_number(columns = vars(uncertainty, value), decimals = 3) %>%
  fmt_missing()

# Display the table in the Viewer
tab

