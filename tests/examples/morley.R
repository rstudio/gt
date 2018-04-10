library(gt)
library(tidyverse)

# Create a presentation table based on `morley`
# Michelson Speed of Light Data

# 1 - we take the `datasets::morley` data.frame and make `Speed` numeric
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in the `Speed` column to have commas (but no decimal places)
# 4 - all `integer` columns values are left aligned
# 5 - all `numeric` columns values are center aligned
morley_tbl <-
  gt(tbl = morley %>% dplyr::mutate(Speed = Speed %>% as.numeric())) %>%  # 1
  apply_theme_striped() %>%  # 2
  format_as_number(
    columns = "Speed",
    decimals = 0,
    thousands_sep = TRUE) %>%  # 3
  apply_alignment_left(types = "integer") %>%  # 4
  apply_alignment_center(types = "numeric")  # 5

# Render the table in the Viewer
morley_tbl %>% render_table()

# Render with the different table parts highlighted
# morley_tbl %>% highlight_tbl_parts()
