library(gt)

# Create a table based on `mtcars`, add all of the different types of
# table parts, and add styles in every type of part
many_styles_tbl <-
  gt(
    mtcars,
    rownames_to_stub = TRUE
  ) |>
  cols_move_to_start(columns = c(gear, carb)) |>
  tab_stubhead(label = "cars") |>
  cols_hide(columns = "mpg") |>
  cols_hide(columns = "vs") |>
  tab_row_group(
    label = "Mercs",
    rows = contains("Merc")
  ) |>
  tab_row_group(
    label = "Mazdas",
    rows = contains("Mazda")
  ) |>
  tab_spanner(
    label = "gear_carb_cyl",
    columns = c(gear, carb, cyl)
  ) |>
  row_group_order(groups = c("Mazdas", "Mercs")) |>
  cols_merge_range(
    col_begin = disp,
    col_end = drat
  ) |>
  tab_header(
    title = "Title",
    subtitle = "Subtitle"
  ) |>
  tab_source_note(source_note = "this is a source note") |>
  cols_label(cyl = md("*cyls*")) |>
  summary_rows(
    groups = c("Mazdas", "Mercs"),
    columns = c(hp, wt, qsec),
    fns = list(
      ~ mean(., na.rm = TRUE),
      ~ sum(., na.rm = TRUE))
  ) |>
  tab_style(
    style = cell_fill(color = "lightgray"),
    locations = list(
      cells_column_labels(),
      cells_stub()
    )
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "steelblue"),
      cell_text(color = "white")
    ),
    locations = cells_stub(rows = "Merc 240D")
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_title(groups = "title")
  ) |>
  tab_style(
    style = cell_text(align = "left"),
    locations = cells_title(groups = "subtitle")
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "green"),
      cell_text(color = "white")
    ),
    locations = cells_summary(
      groups = "Mercs",
      columns = hp,
      rows = 2
    )
  ) |>
  tab_style(
    style = cell_fill(color = "lightgreen"),
    locations = cells_column_spanners(spanners = "gear_carb_cyl")
  ) |>
  tab_style(
    style = cell_fill(color = "turquoise"),
    locations = cells_column_labels(columns = gear)
  ) |>
  tab_style(
    style = cell_fill(color = "pink"),
    locations = cells_column_labels(columns = hp)
  ) |>
  tab_style(
    style = list(
      cell_fill(color = "lightgray"),
      cell_text(style = "italic")
    ),
    locations = cells_body(
      columns = hp,
      rows = "Datsun 710"
    )
  ) |>
  tab_style(
    style = cell_fill(color = "yellow"),
    locations = cells_body(
      columns = disp,
      rows = "Mazda RX4"
    )
  )

many_styles_tbl
