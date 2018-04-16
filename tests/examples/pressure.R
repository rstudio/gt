library(gt)
library(tidyverse)

# Create a presentation table based on `pressure`
# Vapor Pressure of Mercury as a Function of Temperature

# 1 - we take the `datasets::pressure` data.frame
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in the `pressure` column to scientific notation
# 4 - all column values are center aligned
pressure_tbl <-
  gt(tbl = pressure) %>%  # 1
  apply_theme_striped() %>%  # 2
  format_as_scientific(
    columns = "pressure",
    decimals = 2) %>%  # 3
  apply_alignment_center()  # 4

# Display the table in the Viewer
pressure_tbl
