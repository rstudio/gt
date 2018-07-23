library(gt)
library(tidyverse)

data <-
  gt(mtcars[, 1:7], rownames_to_stub = TRUE) %>%
  tab_boxhead_panel(
    group = md("grp_a"),
    columns = tgt(mpg, cyl, disp)) %>%
  tab_boxhead_panel(
    group = md("grp_b"),
    columns = drat) %>%
  tab_stub_block(
    group = "Mercs",
    rows = rownames_with("Merc")) %>%
  tab_stub_block(
    group = "Supercars",
    rows = `Ferrari Dino` & `Maserati Bora` & `Porsche 914-2` & `Ford Pantera L`) %>%
  blocks_arrange(
    groups = tgt(Mercs, Supercars, Others)) %>%
  tab_heading(
    title = md("The **mtcars** dataset")) %>%
  tab_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981).")) %>%
  tab_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974).")) %>%
  tab_stubhead_caption(
    caption = md("*car*")) %>%
  tab_footnote(
    footnote = md("*Really* fast quarter mile."),
    location = target_cell(row = `Ford Pantera L`, column = qsec)) %>%
  tab_footnote(
    footnote = "Massive hp.",
    location = target_cell(row = "Ford Pantera L", column = hp)) %>%
  tab_footnote(
    footnote = "Excellent gas mileage.",
    location = target_cell(`Toyota Corolla`, column = 2)) %>%
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    location = target_cell("Merc 230", qsec))

# Writing to an RTF file
data %>% write_rtf(file = "mtcars.rtf")

