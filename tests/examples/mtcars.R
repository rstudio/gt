library(gt)

# Create a display table based on `mtcars`
# Motor Trend Car Road Tests

# 1 - we take the `datasets::mtcars` data.frame
# 2 - the `disp` and `vs` column values are right aligned
# 3 - creation of two boxhead panels
# 4 - columns are being moved around in several ways
# 5 - three stub blocks are created (`Mercs`, `Supercars`, and `Others`)
# 6 - the stub blocks are arranged
# 7 - we are formatting numbers in different columns to specific decimal places
# 8 - a heading is added
# 9 - two source notes are added
# 10 - a stubhead caption is added
# 11 - we add footnotes that target several cell values
# 12 - column heading labels are provided (i.e., display names)
mtcars_tbl <-
  gt(mtcars, rownames_to_stub = TRUE) %>% # 1
  cols_align(
    align = "right",
    columns = vars(disp, vs)) %>% # 2
  tab_boxhead_panel(
    group = md("*group_a*"),
    columns = vars(mpg, cyl, disp, hp)) %>% # 3
  tab_boxhead_panel(
    group = md("*group_b*"),
    columns = vars(drat, wt, qsec, vs, am, gear, carb)) %>% # 3
  cols_move_to_start(columns = vars(hp)) %>% # 4
  cols_move_to_end(columns = vars(am, gear)) %>% # 4
  cols_hide(columns = vars(carb)) %>% # 4
  cols_move(columns = vars(wt, carb, qsec), after = vars(gear)) %>% # 4
  tab_stub_block(
    group = "Mercs",
    rows = c(
      "Merc 240D", "Merc 230", "Merc 280C", "Merc 280",
      "Merc 450SE", "Merc 450SL", "Merc 450SLC")) %>% # 5
  tab_stub_block(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L")) %>% # 5
  blocks_arrange(
    groups = c("Supercars", "Mercs")) %>% # 6
  fmt_number(
    columns = vars(disp, drat, wt), decimals = 2) %>% # 7
  fmt_number(
    columns = vars(qsec, wt), decimals = 3, rows = starts_with("Merc")) %>% # 7
  fmt_number(
    columns = vars(mpg), decimals = 1) %>% # 7
  tab_heading(
    title = md("The **mtcars** dataset"),
    headnote = md("[A rather famous *Motor Trend* table]")) %>% # 8
  tab_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981).")) %>% # 9
  tab_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974).")) %>% # 9
  tab_stubhead_caption(
    caption = md("*car*")) %>% # 10
  tab_footnote(
    footnote = md("*Really* fast quarter mile."),
    locations = cells_data(
      columns = vars(qsec),
      rows = "Ford Pantera L")) %>% # 11
  tab_footnote(
    footnote = "Massive hp.",
    locations = cells_data(
      columns = vars(hp),
      rows = "Maserati Bora")) %>% # 11
  tab_footnote(
    footnote = "Excellent gas mileage.",
    locations = cells_data(
      columns = 1,
      rows = "Toyota Corolla")) %>% # 11
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    locations = cells_data(
      columns = vars(qsec),
      rows = "Merc 230")) %>% # 11
  cols_label(
      hp = md("*HP*"),
      qsec = "QMT, seconds") # 12

# Display the table in the Viewer
mtcars_tbl
