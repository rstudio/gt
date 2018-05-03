library(gt)
library(tidyverse)

# Create a presentation table based on `pressure`
# Student's Sleep Data

# 1 - we take the `datasets::sleep` data.frame
# 2 - move the `group` and `ID` columns to the start (LHS)
# 3 - the 'striped' theme is applied
# 4 - all column values are left aligned
# 5 - we are formatting numbers in the `extra` column to have 1 decimal place;
#     all negative values are shown in parentheses
sleep_tbl <-
  tab_create(tbl = sleep) %>%  # 1
  move_columns_to_start(columns = c("group", "ID")) %>%  # 2
  theme_striped() %>%  # 3
  cols_align_left() %>%  # 4
  fmt_number(
    columns = "extra",
    decimals = 1,
    negative_style = "parens")  # 5

# Display the table in the Viewer
sleep_tbl
