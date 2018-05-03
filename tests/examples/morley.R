library(gt)
library(tidyverse)

# Create a presentation table based on `morley`
# Michelson Speed of Light Data

# 1 - we take the `datasets::morley` data.frame and make `Speed` numeric
# 2 - the 'striped' theme is applied
# 3 - apply the Helvetica font to all columns
# 4 - we are formatting numbers in the `Speed` column to have commas (but no decimal places)
# 5 - all `integer` columns values are left aligned
# 6 - all `numeric` columns values are center aligned
morley_tbl <-
  tab_create(tbl = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  theme_striped() %>%  # 2
  fmt_font(font = "Helvetica") %>%  # 3
  fmt_number(
    columns = "Speed",
    decimals = 0,
    use_big_mark = TRUE) %>%  # 4
  cols_align_left(types = "integer") %>%  # 5
  cols_align_center(types = "numeric")  # 6

# Display the table in the Viewer
morley_tbl
