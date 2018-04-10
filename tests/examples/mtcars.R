library(gt)
library(tidyverse)

# Create a presentation table based on `mtcars`
# Motor Trend Car Road Tests

# 1 - we take a portion of `datasets::mtcars`
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in the `mpg` column to have 1 decimal place
# 4 - we are formatting numbers in the `cyl` column to have 2 decimal places
# 5 - all `numeric` values are right aligned
# 6 - the dataset has rownames, they are moved to the stub; we supply a stubhead caption
# 7 - a heading is added
# 8,9 - two source notes are added
mtcars_tbl <-
  gt(tbl = mtcars[1:6, 1:3]) %>%  # 1
  apply_theme_striped() %>%  # 2
  format_as_number(
    columns = "mpg",
    decimals = 1) %>%  # 3
  format_as_number(
    columns = "cyl",
    decimals = 2) %>%  # 4
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

# Render the table in the Viewer
mtcars_tbl %>% render_table()

# Render with the different table parts highlighted
# mtcars_tbl %>% highlight_tbl_parts()
