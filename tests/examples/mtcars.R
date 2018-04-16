library(gt)
library(tidyverse)

# Create a presentation table based on `mtcars`
# Motor Trend Car Road Tests

# 1 - we take the `datasets::mtcars` data.frame
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in 4 columns to have 1 decimal place
# 4 - we are formatting numbers in the `wt` column to have 3 decimal places
# 5 - all `numeric` values are right aligned
# 6 - the dataset has rownames so they've been moved to the stub;
#     here, we supply a stubhead caption
# 7 - a heading is added
# 8,9 - two source notes are added
mtcars_tbl <-
  gt(tbl = mtcars) %>%  # 1
  apply_theme_striped() %>%  # 2
  format_as_number(
    columns = c("mpg", "disp", "drat", "qsec"),
    decimals = 1) %>%  # 3
  format_as_number(
    columns = "wt",
    decimals = 3) %>%  # 4
  apply_alignment_right(types = "numeric") %>%  # 5
  add_stubhead_caption(caption = "car model") %>%  # 6
  add_heading(
    title = "Excerpt from the `mtcars` dataset",
    headnote = "[A rather famous Motor Trend table]") %>%  # 7
  add_source_note(
    source_note = "Henderson and Velleman (1981).",
    lead_in = "Main Source of Data: ") %>%  # 8
  add_source_note(
    source_note = "Motor Trend Magazine (1974).",
    lead_in = "Original Data: ")  # 9

# Display the table in the Viewer
mtcars_tbl
