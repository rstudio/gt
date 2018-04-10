library(gt)
library(tidyverse)

# Create a presentation table based on `pressure`
# Student's Sleep Data

# 1 - we take the `datasets::sleep` data.frame
# 2 - the 'striped' theme is applied
# 3 - all column values are left aligned
# 4 - we are formatting numbers in the `extra` column to have 1 decimal place;
#     all negative values are shown in parentheses
sleep_tbl <-
  gt(tbl = sleep) %>%  # 1
  apply_theme_striped() %>%  # 2
  apply_alignment_left() %>%  # 3
  format_as_number(
    columns = "extra",
    decimals = 1,
    negative_style = "parens")  # 4

# Render the table in the Viewer
sleep_tbl %>% render_table()

# Render with the different table parts highlighted
# sleep_tbl %>% highlight_tbl_parts()
