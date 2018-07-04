library(gt)
library(tidyverse)

# Create a presentation table based on `morley`
# Michelson Speed of Light Data

# 1 - we take the `datasets::morley` data.frame and make `Speed` numeric
# 3 - we are formatting numbers in the `Speed` column to have commas (but no decimal places)
# 4 - all `integer` columns values are left aligned
morley_tbl <-
  gt(data = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  fmt_number(
    columns = "Speed",
    decimals = 0,
    sep_mark = ","
    ) %>%  # 3
  cols_align_left(types = "integer")  # 4

# Display the table in the Viewer
morley_tbl
