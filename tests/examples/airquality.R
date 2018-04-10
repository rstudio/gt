library(gt)
library(tidyverse)

# Create a presentation table based on `airquality`
# New York Air Quality Measurements

# 1 - we take the `datasets::airquality` data.frame
# 2 - the 'minimal' theme is applied
# 3 - all column values are right aligned
# 4 - we are formatting numbers in the `Wind` column to have 1 decimal place
airquality_tbl <-
  gt(tbl = airquality) %>%  # 1
  apply_theme_minimal() %>%  # 2
  apply_alignment_right() %>%  # 3
  format_as_number(
    columns = "Wind",
    decimals = 1)  # 4

# Render the table in the Viewer
airquality_tbl %>% render_table()

# Render with the different table parts highlighted
# airquality_tbl %>% highlight_tbl_parts()
