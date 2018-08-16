library(gt)
library(tidyverse)

data <-
  gt(mtcars[, 1:7], rownames_to_stub = TRUE) %>%
  tab_boxhead_panel(
    group = md("grp_a"),
    columns = vars(mpg, cyl, disp)) %>%
  tab_boxhead_panel(
    group = md("grp_b"),
    columns = vars(drat)) %>%
  tab_stub_block(
    group = "Mercs",
    rows = c(
      "Merc 240D", "Merc 230", "Merc 280C", "Merc 280",
      "Merc 450SE", "Merc 450SL", "Merc 450SLC")) %>%
  tab_stub_block(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L"))  %>%
  blocks_arrange(
    groups = vars(Supercars, Mercs)) %>%
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
    location = data_cells(row = "Ford Pantera L", column = vars(qsec))) %>%
  tab_footnote(
    footnote = "Massive hp.",
    location = data_cells(row = "Ford Pantera L", column = vars(hp))) %>%
  tab_footnote(
    footnote = "Excellent gas mileage.",
    location = data_cells("Toyota Corolla", column = 2)) %>%
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    location = data_cells("Merc 230", vars(qsec)))

# Writing to an RTF file
data %>% write_rtf(file = "mtcars.rtf")

