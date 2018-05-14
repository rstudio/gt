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
# 7 - we create stub blocks, grouping together rows into separate
#     blocks of rows with stub headings
# 8 - we supply a stubhead caption
# 9 - a heading is added
# 10 - two source notes are added
# 11 - we add footnotes that target several cell values
# 12 - renaming of column headers
html_tbl <-
  tab_create(tbl = mtcars) %>%  # 1
  theme_horizontal() %>%  # 2
  fmt_number(
    columns = c("mpg", "disp", "drat", "qsec"),
    decimals = 1
  ) %>%  # 3
  fmt_number(
    columns = "wt",
    decimals = 3
  ) %>%  # 4
  cols_align_left(types = "character") %>%  # 6
  tab_stub_block(
    "Mazdas" = rownames_with("Mazda"),
    "Mercs" = rownames_with("Merc"),
    "Hornets" = rownames_with("Hornet"),
    "Toyotas" = rownames_with("Toyota"),
    "Supercars" = c(
      "Ferrari Dino","Maserati Bora",
      "Porsche 914-2", "Ford Pantera L",
      "Camaro Z28")
  ) %>% # 7
  tab_stubhead_caption(caption = "car model") %>%  # 8
  tab_heading(
    title = "Excerpt from the **mtcars** dataset",
    headnote = "[A rather famous *Motor Trend* table]"
  ) %>%  # 9
  tab_source_note(
    source_note = "Main Source of Data: *Henderson and Velleman* (1981).",
  ) %>%  # 10
  tab_source_note(
    source_note = "Original Data: *Motor Trend Magazine* (1974).",
  ) %>%  # 10
  tab_footnote(
    "Examples of poor gas mileage." =
      cells(row = c(22, 23), column = 2)
  ) %>%  # 11
  tab_footnote(
    "Really fast quarter mile" =
      c(18, 8)
  ) %>%  # 11
  tab_footnote(
    "Excellent gas mileage." =
      cells(row = 12, column = 2)
  ) %>%  # 11
  tab_footnote(
    "Worst speed ever." =
      cells(row = 4, column = 8)
  ) %>%  # 11
  tab_footnote(
    "Massive **hp**." =
      cells(row = 18, column = 5)
  ) %>% # 11
  cols_rename(
    "*MPG*" = "mpg",
    "C" = "cyl",
    "D" = "disp",
    "HP" = "hp",
    "DR" = "drat",
    "Wt." = "wt",
    "QMT" = "qsec",
    "VS" = "vs",
    "AM" = "am",
    "Gears" = "gear",
    "Cs" = "carb") # 12

# Display the table in the Viewer
html_tbl

