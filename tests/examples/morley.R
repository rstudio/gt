library(gt)
library(tidyverse)

# Create a presentation table based on `morley`
# Michelson Speed of Light Data

# 1 - we take the `datasets::morley` data.frame and make `Speed` numeric
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in the `Speed` column to have commas (but no decimal places)
# 4 - all `integer` columns values are left aligned
morley_tbl <-
  tab_create(tbl = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  theme_striped() %>%  # 2
  fmt_number(
    columns = "Speed",
    decimals = 0,
    use_big_mark = TRUE
    ) %>%  # 3
  cols_align_left(types = "integer")  # 4

# Display the table in the Viewer
morley_tbl
