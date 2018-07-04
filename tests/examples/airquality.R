library(gt)
library(tidyverse)

# Create a presentation table based on `airquality`
# New York Air Quality Measurements

# 1 - we take the `datasets::airquality` data.frame
# 2 - all column values are right aligned
# 3 - the `Month` and `Day` columns are moved to the
#     beginning of the column series
# 4 - we are formatting numbers in the `Wind` column
#     to have 1 decimal place
# 5 - we replace missing (NA) values in all columns
#     with a string replacement
airquality_tbl <-
  gt(data = airquality) %>%  # 1
  cols_align_right() %>%  # 2
  cols_move_to_start(columns = c("Month", "Day")) %>% # 3
  fmt_number(
    columns = "Wind",
    decimals = 1
    )  %>% # 4
  replace_missing(replacement = "&lt; 0.1") # TODO: Doesn't yet work

# Display the table in the Viewer
airquality_tbl
