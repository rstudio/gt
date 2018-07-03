library(gt)
library(htmltools)

html_table <-
  gt(data = mtcars %>% tibble::rownames_to_column()) %>%
  set_spanner(
    spanner = "group_a",
    columns = c("mpg", "cyl", "disp")) %>%
  set_spanner(
    spanner = "group_a",
    columns = "hp") %>%
  set_spanner(
    spanner = "group_b",
    #columns = target_cols(drat, wt, qsec, vs, am, gear, carb),
    columns = c("drat", "wt", "qsec", "vs", "am", "gear", "carb")) %>%
  # set_group(group = "Mazdas", rows = rownames_with("Mazda")) %>%
  set_group(
    group = "Supercars",
    rows = c("Ferrari Dino", "Maserati Bora", "Porsche 914-2", "Ford Pantera L"),
    others = "Slower Cars") %>%
  set_group(
    group = "Mazdas",
    rows = c("Mazda RX4", "Mazda RX4 Wag")) %>%
  set_group(
    group = "Others",
    rows = not_in_group()) %>%
  arrange_groups(groups = c("Mazdas", "Supercars", "Others")) %>%
  set_cols_align_right(
    columns = c("disp", "wt")) %>%
  set_cols_align_left(
    #columns = target_cols(stub),
    columns = "stub") %>%
  set_fmt_percent(
    columns = "drat",
    decimals = 4,
    drop0trailing = FALSE) %>%
  set_fmt_percent(
    columns = "drat",
    decimals = 1,
    drop0trailing = FALSE) %>%
  set_fmt_numeric(
    columns = "cyl",
    decimals = 3,
    drop0trailing = FALSE) %>%
  set_heading(
    title = md("The **mtcars** dataset"),
    headnote = md("[A rather famous *Motor Trend* table]")) %>%
  set_source_note(
    source_note = md("Main Source of Data: *Henderson and Velleman* (1981).")) %>%
  set_source_note(
    source_note = md("Original Data: *Motor Trend Magazine* (1974).")) %>%
  set_stubhead_caption(
    caption = "car") %>%
  set_footnote(
    footnote = "Massive hp.",
    location = target_cell(
      row = "Maserati Bora", column = "hp")) %>%
  set_footnote(
    footnote = md("*Really* fast quarter mile."),
    location = target_cell(
      row = "Ford Pantera L", column = "qsec")) %>%
  set_footnote(
    footnote = "Excellent gas mileage.",
    location = target_cell(
      row = "Toyota Corolla", column = 1)) %>%
  set_footnote(
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
