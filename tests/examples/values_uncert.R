library(gt)
library(tidyverse)

# Create a table with values and uncertainties
tbl <-
  dplyr::tribble(
    ~value,   ~uncertainty,  ~type,
    0.352,    0.10,          "a",
    0.983,    0.13,          "a",
    0.639,    NA_real_,      "b",
    NA_real_,    0.17,       "b")

# Create a table
tab <-
  gt(data = tbl) %>%
  fmt_uncertainty(
    col_val = value,
    col_uncert = uncertainty) %>%
  fmt_number(columns = tgt(uncertainty, value), decimals = 3)

# Display the table in the Viewer
tab

