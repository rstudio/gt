library(gt)
library(tidyverse)

# Create a presentation table based on `morley`
# Michelson Speed of Light Data

# 1 - we take the `datasets::morley` data.frame and make `Speed` numeric
# 2 - we are formatting numbers in the `Speed` column to have commas (but no decimal places)
# 3 - the `Speed` and `Run` columns values are left aligned
morley_tbl <-
  gt(data = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  fmt_number(
    columns = vars(Speed),
    decimals = 0,
    sep_mark = ","
    ) %>% # 2
  cols_align_left(columns = vars(Speed, Run)) # 3

# Display the table in the Viewer
morley_tbl
