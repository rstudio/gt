library(gt)
library(tidyverse)

# Create a presentation table based on `mtcars`
# Motor Trend Car Road Tests

# 1 - we take the `datasets::mtcars` data.frame
# 2 - the 'striped' theme is applied
# 3 - we are formatting numbers in 4 columns to have 1 decimal place
# 4 - we are formatting numbers in the `wt` column to have 3 decimal places
# 5 - all `numeric` values are right aligned
# 6 - all `character` values are left aligned
# 7 - the dataset has rownames so they've been moved to the stub;
#     here, we supply a stubhead caption
# 8 - a heading is added
# 9,10 - two source notes are added
mtcars_tbl <-
  tab_create(tbl = mtcars) %>%  # 1
  theme_striped() %>%  # 2
  fmt_number(
    columns = c("mpg", "disp", "drat", "qsec"),
    decimals = 1
    ) %>%  # 3
  fmt_number(
    columns = "wt",
    decimals = 3
    ) %>%  # 4
  cols_align_right(types = "numeric") %>%  # 5
  cols_align_left(types = "character") %>%  # 6
  tab_stubhead_caption(caption = "car model") %>%  # 7
  tab_heading(
    title = "Excerpt from the **mtcars** dataset",
    headnote = "[A rather famous *Motor Trend* table]"
    ) %>%  # 8
  tab_source_note(
    source_note = "Henderson and Velleman (1981).",
    lead_in = "Main Source of Data: "
    ) %>%  # 9
  tab_source_note(
    source_note = "Motor Trend Magazine (1974).",
    lead_in = "Original Data: "
    )  # 10

# Display the table in the Viewer
mtcars_tbl
