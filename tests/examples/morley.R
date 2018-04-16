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
  gt(tbl = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  apply_theme_striped() %>%  # 2
  apply_font(font = "Helvetica") %>%  # 3
  format_as_number(
    columns = "Speed",
    decimals = 0,
    thousands_sep = TRUE) %>%  # 4
  apply_alignment_left(types = "integer") %>%  # 5
  apply_alignment_center(types = "numeric")  # 6

# Display the table in the Viewer
morley_tbl
