library(gt)

# Create a display table based on `mtcars`; Motor Trend Car Road Tests

mtcars_tbl <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_align(
    align = "right",
    columns = vars(disp, vs)
  ) %>%
  tab_spanner(
    label = md("*group_a*"),
    columns = vars(mpg, cyl, disp, hp)
  ) %>%
  tab_spanner(
    label = md("*group_b*"),
    columns = vars(drat, wt, qsec, vs, am, gear, carb)
  ) %>%
  cols_move_to_start(columns = vars(hp)) %>%
  cols_move_to_end(columns = vars(am, gear)) %>%
  cols_hide(columns = vars(carb)) %>%
  cols_move(
    columns = vars(wt, carb, qsec),
    after = vars(gear)) %>%
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
  row_group_order(groups = c("Supercars", "Mercs")) %>%
  fmt_number(
    columns = vars(disp, drat, wt),
    decimals = 2
  ) %>%
  fmt_number(
    columns = vars(qsec, wt),
    decimals = 3,
    rows = starts_with("Merc")
  ) %>%
  fmt_number(
    columns = vars(mpg),
    decimals = 1
  ) %>%
  tab_header(
    title = md("The **mtcars** dataset"),
    subtitle = md("[A rather famous *Motor Trend* table]")
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
    locations = cells_data(
      columns = vars(qsec),
      rows = "Ford Pantera L")
  ) %>%
  tab_footnote(
    footnote = "Massive hp.",
    locations = cells_data(
      columns = vars(hp),
      rows = "Maserati Bora")
  ) %>%
  tab_footnote(
    footnote = "Excellent gas mileage.",
    locations = cells_data(
      columns = 1,
      rows = "Toyota Corolla")
  ) %>%
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    locations = cells_data(
      columns = vars(qsec),
      rows = "Merc 230")
  ) %>%
  cols_label(
    hp = md("*HP*"),
    qsec = "QMT, seconds"
  )

mtcars_tbl
