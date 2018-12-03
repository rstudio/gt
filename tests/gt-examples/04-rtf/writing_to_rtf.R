library(gt)

data <-
  gt(mtcars[, 1:7], rownames_to_stub = TRUE) %>%
  tab_spanner(
    label = md("grp_a"),
    columns = vars(mpg, cyl, disp)
  ) %>%
  tab_spanner(
    label = md("grp_b"),
    columns = vars(drat)
  ) %>%
  tab_row_group(
    group = "Mercs",
    rows = c(
      "Merc 240D", "Merc 230", "Merc 280C", "Merc 280",
      "Merc 450SE", "Merc 450SL", "Merc 450SLC")
  ) %>%
  tab_row_group(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L")
  ) %>%
  row_group_order(groups = vars(Supercars, Mercs)) %>%
  tab_header(
    title = md("The **mtcars** dataset")
  ) %>%
  tab_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981).")
  ) %>%
  tab_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974).")
  ) %>%
  tab_stubhead_label(label = md("*car*")) %>%
  tab_footnote(
    footnote = md("*Really* fast quarter mile."),
    locations = data_cells(row = "Ford Pantera L", column = vars(qsec))
  ) %>%
  tab_footnote(
    footnote = "Massive hp.",
    locations = data_cells(row = "Ford Pantera L", column = vars(hp))
  ) %>%
  tab_footnote(
    footnote = "Excellent gas mileage.",
    locations = data_cells("Toyota Corolla", column = 2)
  ) %>%
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    locations = data_cells("Merc 230", vars(qsec))
  )

# Writing to an RTF file
data %>% write_rtf(file = "mtcars.rtf")

