test_that("as_raw_html() produces the same table every time", {

  gt_html_1 <-
    gt(exibble, id = "test") |>
    as_raw_html(inline_css = TRUE)

  gt_html_1_sha1 <- rlang::hash(gt_html_1)
  expect_equal(gt_html_1_sha1, "8239e0f3ca66f190ddc8836fb42b416a")

  gt_html_2 <-
    gt(
      mtcars,
      rownames_to_stub = TRUE,
      id = "test"
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
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
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
    ) |>
    as_raw_html(inline_css = TRUE)

  gt_html_2_sha1 <- rlang::hash(gt_html_2)
  expect_equal(gt_html_2_sha1, "139ac41fc8765826201656f786a58fb8")

  # Expect that font family values with multiple words (i.e., have a space
  # character) added with `tab_style()` preserve single-quote characters
  expect_match_raw_html(
    exibble[1, ] |>
      gt() |>
      tab_header(title = "Title") |>
      tab_style(style = cell_text(font = "Two Words"), locations = cells_title()),
    "font-family: 'Two Words';"
  )

  expect_match_raw_html(
    exibble[1, ] |>
      gt() |>
      tab_header(title = "Title") |>
      tab_style(
        style = cell_text(font = c("Fira Sans", "Droid Sans", "Arial", "sans-serif")),
        locations = cells_title()
      ),
    "font-family: 'Fira Sans', 'Droid Sans', Arial, sans-serif;"
  )
})
