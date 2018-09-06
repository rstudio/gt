library(gt)


# Create a table based on `mtcars`
# Add all of the different types of table parts
# Add footnotes in every type of part
data <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead_caption("cars") %>%
  cols_remove(columns = "mpg") %>%
  tab_stub_block(group = "Mercs", rows = contains("Merc")) %>%
  tab_stub_block(group = "Mazdas", rows = contains("Mazda")) %>%
  tab_boxhead_panel(group = "gear_carb_cyl", columns = vars(gear, carb, cyl)) %>%
  blocks_arrange(groups = c("Mazdas", "Mercs")) %>%
  cols_merge_range(col_begin = "disp", col_end = "drat") %>%
  tab_heading(title = "Title", headnote = "Headnote") %>%
  tab_source_note(source_note = "this is a source note") %>%
  summary_rows(
    groups = c("Mazdas"),
    columns = vars(hp, wt, qsec),
    funs = funs(
      mean(., na.rm = TRUE),
      sum(., na.rm = TRUE))
    ) %>%
  tab_footnote(
    footnote = "summary_note",
    locations = summary_cells(
      groups = "Mazdas", columns = "hp", rows = 1)
    ) %>%
  tab_footnote(
    footnote = "A spanner note",
    locations = boxhead_cells(groups = "gear_carb_cyl")
    ) %>%
  tab_footnote(
    footnote = "A datsun note",
    locations = data_cells(columns = 1, rows = "Datsun 710")) %>% # warning on missing references
  tab_footnote(
    footnote = "A real boxhead note",
    locations = boxhead_cells(columns = "cyl")) %>%
  tab_footnote(
    footnote = "A boxhead note",
    locations = boxhead_cells(columns = 1)) %>%
  tab_footnote(
    footnote = "A disp-datsun footnote 2 of 2 (the second).",
    locations = boxhead_cells(columns = "cyl")) %>%
  tab_footnote(
    footnote = "An unreal spanner note",
    locations = boxhead_cells(groups = "no_group")) %>%
  tab_footnote(
    footnote = "An unreal group note",
    locations = group_cells(groups = "Mezdas")) %>%
  tab_footnote(
    footnote = "A real group note (Mazdas).",
    locations = group_cells(groups = "Mazdas")) %>%
  tab_footnote(
    footnote = "A disp_datsun footnote 1 of 2.",
    locations = data_cells(columns = "disp", rows = "Datsun 710")) %>%
  tab_footnote(
    footnote = "A disp-datsun footnote 2 of 2 (the second).",
    locations = data_cells(columns = "disp", rows = "Datsun 710")) %>%
  tab_footnote(
    footnote = "A title footnote.",
    locations = title_cells(groups = "title")) %>%
  tab_footnote(
    footnote = "A second title footnote.",
    locations = title_cells(groups = "title")) %>%
  tab_footnote(
    footnote = "A headnote footnote.",
    locations = title_cells(groups = "headnote")) %>%
  tab_footnote(
    footnote = "A second footnote for the headnote.",
    locations = title_cells(groups = "headnote")) %>%
  tab_footnote(
    footnote = md("The *Wag* is short for *Wagon*."),
    locations = stub_cells(rows = "Mazda RX4 Wag"))

data
