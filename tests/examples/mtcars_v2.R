library(gt)
library(htmltools)

html_table <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  tab_boxhead_panel(
    spanner = "group_a",
    columns = c("mpg", "cyl", "disp")) %>%
  tab_boxhead_panel(
    spanner = "group_a",
    columns = "hp") %>%
  tab_boxhead_panel(
    spanner = "group_b",
    #columns = target_cols(drat, wt, qsec, vs, am, gear, carb),
    columns = c("drat", "wt", "qsec", "vs", "am", "gear", "carb")) %>%
  # tab_stub_block(group = "Mazdas", rows = rownames_with("Mazda")) %>%
  tab_stub_block(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L"),
    others = "Slower Cars") %>%
  tab_stub_block(
    group = "Mazdas",
    rows = c("Mazda RX4", "Mazda RX4 Wag")) %>%
  tab_stub_block(
    group = "Others",
    rows = not_in_group()) %>%
  blocks_arrange(
    groups = c("Mazdas", "Supercars", "Others")) %>%
  cols_align_right(
    columns = c("disp", "wt")) %>%
  cols_align_left(
    #columns = target_cols(stub),
    columns = "stub") %>%
  fmt_percent(
    columns = "drat",
    decimals = 4,
    drop0trailing = FALSE) %>%
  fmt_percent(
    columns = "drat",
    decimals = 1,
    drop0trailing = FALSE) %>%
  fmt_number(
    columns = "cyl",
    decimals = 3,
    drop0trailing = FALSE) %>%
  tab_heading(
    title = md("The **mtcars** dataset"),
    headnote = md("[A rather famous *Motor Trend* table]")) %>%
  tab_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981).")) %>%
  tab_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974).")) %>%
  tab_stubhead_caption(
    caption = "car") %>%
  tab_footnote(
    footnote = "Massive hp.",
    location = target_cell(
      row = "Maserati Bora", column = "hp")) %>%
  tab_footnote(
    footnote = md("*Really* fast quarter mile."),
    location = target_cell(
      row = "Ford Pantera L", column = "qsec")) %>%
  tab_footnote(
    footnote = "Excellent gas mileage.",
    location = target_cell(
      row = "Toyota Corolla", column = 1)) %>%
  tab_footnote(
    footnote = md("Worst speed *ever*."),
    location = target_cell(
      row = "Merc 230", column = "qsec"))

# Use the HTML processing step
html_table <- process_html(html_table)

# Create an HTML dependency for the stylesheet
dep <- htmltools::htmlDependency(
  name = 'gt',
  version = '0.1',
  src = gt:::system_file(file = 'css'),
  stylesheet = 'gt.css')

# Attach the dependency to the HTML table
html_tbl <- htmltools::attachDependencies(HTML(html_table), dep)

# Print the object in the Viewer
html_print(html_tbl)
