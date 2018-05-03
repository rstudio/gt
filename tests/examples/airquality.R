library(gt)
library(tidyverse)

# Create a presentation table based on `airquality`
# New York Air Quality Measurements

# 1 - we take the `datasets::airquality` data.frame
# 2 - the 'minimal' theme is applied
# 3 - apply the Helvetica font to all columns
# 4 - all column values are right aligned
# 5 - we are formatting numbers in the `Wind` column to have 1 decimal place
airquality_tbl <-
  tab_create(tbl = airquality) %>%  # 1
  theme_minimal() %>%  # 2
  fmt_font(font = "Helvetica") %>%  # 3
  cols_align_right() %>%  # 4
  fmt_number(
    columns = "Wind",
    decimals = 1)  %>% # 5
  replace_missing(replacement = "&lt; 0.1")

# Display the table in the Viewer
airquality_tbl
