# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

# Create a table from `mtcars` that has all the different components
data <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead(label = "cars") %>%
  cols_hide(columns = "mpg") %>%
  cols_hide(columns = "vs") %>%
  tab_row_group(
    label = "Mercs",
    rows = contains("Merc")
  ) %>%
  tab_row_group(
    label = "Mazdas",
    rows = contains("Mazda")
  ) %>%
  tab_options(row_group.default_label = "Others") %>%
  tab_spanner(
    label = "gear_carb_cyl",
    id = "gcc",
    columns = c(gear, carb, cyl)
  ) %>%
  row_group_order(groups = c("Mazdas", "Mercs")) %>%
  cols_merge_range(
    col_begin = "disp",
    col_end = "drat"
  ) %>%
  tab_header(
    title = "Title",
    subtitle = "Subtitle"
  ) %>%
  tab_source_note(source_note = "this is a source note") %>%
  summary_rows(
    groups = c("Mazdas", "Mercs"),
    columns = c(hp, wt, qsec),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE))
  ) %>%
  grand_summary_rows(
    columns = c(hp, wt),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE))
  )

test_that("A gt table can store the correct style statements", {

  # Apply a `lightgray` background color to the columns
  # and stub cells
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = list(
        cells_column_labels(),
        cells_stub(rows = TRUE))
    )

  styles_tbl <- dt_styles_get(data = tbl_html)
  # Expect that the internal `styles_df` data frame will have
  # its `locname` column entirely populated with `cells_column_labels`
  # and `stub`
  expect_setequal(styles_tbl$locname, c("columns_columns", "stub"))

  # Expect that the internal `styles_df` data frame will have
  # its `cell_fill:color` property entirely populated with `lightgray`
  expect_setequal(
    vapply(styles_tbl$styles, function(x) x[1]$cell_fill$color, character(1L)),
    "#D3D3D3"
  )
})

test_that("tab_style() works for styling a single cell.", {

  # Apply a `steelblue` background color with white text to a
  # single stub cell
  tbl_html <-
    data %>%
    tab_style(
      style = list(
        cell_fill(color = "steelblue"),
        cell_text(color = "white")
      ),
      locations = cells_stub(rows = "Merc 240D")
    )
  styles_tbl <- dt_styles_get(data = tbl_html)

  # Expect that the internal `styles_df` data frame will have
  # a single row
  expect_1_row(styles_tbl)

  # Expect certain values for inside the single `styles` list
  expect_equal(
    styles_tbl$styles[[1]]$cell_fill$color,
    "#4682B4"
  )
  expect_equal(
    styles_tbl$styles[[1]]$cell_text$color,
    "#FFFFFF"
  )
})

test_that("A table title can be left-aligned", {

  # Apply left-alignment to the table title
  tbl_html <-
    data %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    )

  styles_tbl <- dt_styles_get(data = tbl_html)
  # Expect that the internal `styles_df` data frame will have
  # a single row
  expect_1_row(styles_tbl)

  # Expect a specific value inside the single `styles` list
  result <- styles_tbl$styles[[1]]
  expect_equal(result$cell_text$align, "left")
})

test_that("A table subtitle can be left-aligned", {

  tbl_html <-
    data %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    )

  styles_tbl <- dt_styles_get(data = tbl_html)
  # Expect certain values for inside the single `styles` list
  expect_1_row(styles_tbl)

  # Expect a specific value inside the single `styles` list
  result <- styles_tbl$styles[[1]]
  expect_equal(result$cell_text$align, "left")
})

test_that("A gt table can have a background in the summary.", {

  # Apply a green background with white text to a single cell in
  # a group summary section
  tbl_html <-
    data %>%
    tab_style(
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs",
        columns = "hp", rows = 2)
    )

  styles_tbl <- dt_styles_get(data = tbl_html)
  # Expect that the internal `styles_df` data frame will have
  # a single row
  expect_1_row(styles_tbl)
  expect_equal(styles_tbl$locname, "summary_cells")
})
test_that("tab_style() errors if locations can't be resolved", {
  expect_snapshot(error = TRUE, {
    # Expect an error if columns couldn't be resolved
    tab_style(
      data,
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs",
        columns = starts_with("x"),
        rows = 2
      )
    )
    # Expect an error if rows couldn't be resolved
    tab_style(
      data,
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs",
        columns = starts_with("m"),
        rows = starts_with("x")
      )
    )

    # Expect an error if column spanner couldn't be resolved
    tab_style(
      data,
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_column_labels(`non existent`)
    )

    # Expect an error if column spanner couldn't be resolved
    tab_style(
      data,
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_column_spanners(2)
    )
  })
})

test_that("tab style works with grand_summary", {
  # Apply a red background with white text to a single cell in
  # the grand summary section
  tbl_html <-
    data %>%
    tab_style(
      style = list(
        cell_fill(color = "red"),
        cell_text(color = "white")
      ),
      locations = cells_grand_summary(
        columns = "hp", rows = "sum"
      )
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Expect an error if columns couldn't be resolved
  expect_snapshot(
    error = TRUE,
    data %>%
      tab_style(
        style = list(
          cell_fill(color = "red"),
          cell_text(color = "white")
        ),
        locations = cells_grand_summary(
          columns = starts_with("x"), rows = 2)
      )
  )

  # Expect an error if rows couldn't be resolved
  expect_snapshot(
    error = TRUE,
    data %>%
      tab_style(
        style = list(
          cell_fill(color = "red"),
          cell_text(color = "white")
        ),
        locations = cells_grand_summary(
          columns = starts_with("m"), rows = starts_with("x"))
      )
  )

  # Apply a `yellow` background to the `Mazdas` row group cell
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_row_groups(groups = "Mazdas")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()
})

test_that("tab_style() works with column spanners", {
  # Apply a `lightgreen` background to the `gear_carb_cyl`
  # column spanner cell
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_column_spanners(spanners = "gcc")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()
})

test_that("tab_style() works with a single column label", {
  # Apply a `turquoise` background to a single column label
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "turquoise"),
      locations = cells_column_labels(columns = "gear")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()

  # Apply a `turquoise` background to a single column label
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_column_labels(columns = "hp")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()

  # Apply a `lightgray` background to five rows of a single column
  tbl_html <-
    data %>%
    tab_style(
      style = list(
        cell_fill(color = "lightgray"),
        cell_text(style = "italic")
      ),
      locations = cells_body(columns = "hp", rows = 1:5)
    )

  # Expect that the internal `styles_df` data frame will have five rows
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(5)

  # Expect that the `rownum` values in `styles_df` will be 1:5
  dt_styles_get(data = tbl_html) %>%
    dplyr::pull(rownum) %>%
    expect_equal(1:5)

  # Expect that the `location` in `styles_df` is 'data' for all five rows
  dt_styles_get(data = tbl_html) %>%
    dplyr::pull(locname) %>%
    expect_setequal("data")

  # Expect that the `colname` in `styles_df` is 'hp' for all five rows
  dt_styles_get(data = tbl_html) %>%
    dplyr::pull(colname) %>%
    expect_setequal("hp")
})

test_that("tab_style() works with a single cell", {
  # Apply a `yellow` background a single data cell
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = "disp", rows = "Mazda RX4")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()

  # Expect an error in `tab_style` when a value for `rows` isn't
  # in the table
  expect_snapshot(
    error = TRUE,
    data %>%
      tab_style(
        style = cell_fill(color = "yellow"),
        locations = cells_body(columns = "disp", rows = "Mazda RX7")
      )
  )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    expect_1_row()

  # Apply a `yellow` background a single data cell; this time, use `c()`
  # to specify the `columns`
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = c(disp, hp), rows = "Mazda RX4")
    )

  styles_tbl <- dt_styles_get(data = tbl_html)

  # Expect that the internal `styles_df` data frame will have two rows
  expect_equal(
    nrow(styles_tbl),
    2
  )

  # Expect certain values for each of the columns in the two rows
  # of the `styles_df` data frame
  expect_equal(
    unlist(styles_tbl[1, ]),
    c("data", NA_character_, "disp", "5", "1", NA_character_, "#FFFF00"),
    ignore_attr = "names"
  )
  expect_equal(
    unlist(styles_tbl[2, ]),
    c("data", NA_character_, "hp", "5", "1", NA_character_, "#FFFF00"),
    ignore_attr = "names"
  )

})

test_that("Using fonts in `cell_text()` works", {

  # Prepare a small gt table for all tests
  tbl <- exibble %>% dplyr::select(char, time) %>% gt()

  # Expect that system fonts can be combined with default fonts
  # and set at a specific location
  tbl %>%
    tab_style(
      style = cell_text(font = c("Comic Sans MS", "Menlo", default_fonts())),
      locations = cells_body(columns = time, rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td headers=\"time\" class=\"gt_row gt_right\" style=\"border-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: right; font-variant-numeric: tabular-nums; font-family: 'Comic Sans MS', Menlo, system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\" valign=\"middle\" align=\"right\">13:35</td>"
    )

  # Expect that a Google Fonts and system fonts can be combined
  # (using a list or `c()`) with default fonts and set at a specific location
  tbl %>%
    tab_style(
      style = cell_text(font = c(google_font(name = "Dancing Script"), default_fonts())),
      locations = cells_body(columns = time, rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td headers=\"time\" class=\"gt_row gt_right\" style=\"border-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: right; font-variant-numeric: tabular-nums; font-family: 'Dancing Script', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\" valign=\"middle\" align=\"right\">13:35</td>"
    )

  tbl %>%
    tab_style(
      style = cell_text(font = list(google_font(name = "Dancing Script"), default_fonts())),
      locations = cells_body(columns = time, rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td headers=\"time\" class=\"gt_row gt_right\" style=\"border-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: right; font-variant-numeric: tabular-nums; font-family: 'Dancing Script', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';\" valign=\"middle\" align=\"right\">13:35</td>"
    )

  gtcars_tbl <-
    gtcars %>%
    dplyr::filter(ctry_origin == "United Kingdom") %>%
    dplyr::select(mfr, model, year, hp) %>%
    gt()

  # Expect no difference in output when using styles within a list or without
  tab1 <- gtcars_tbl %>%
    tab_style(
      style =
        cell_text(
          weight = "bold",
          font = c("Helvetica", "Times New Roman"),
          color = "red"
        ),
      locations = cells_body(columns = hp, rows = 1:2)
    )
  tab2 <- gtcars_tbl %>%
    tab_style(
      style =
        list(
          cell_text(
            weight = "bold",
            font = c("Helvetica", "Times New Roman"),
            color = "red"
          )
        ),
      locations = cells_body(columns = hp, rows = 1:2)
    )
  expect_equal(
    gsub("id=\"[a-z]*?\"", "", as_raw_html(tab1)),
    gsub("id=\"[a-z]*?\"", "", as_raw_html(tab2))
  )

  # Don't expect any errors when styling with different fonts
  expect_no_error(
      tab_style(
        gtcars_tbl,
        style = list(cell_text(font = c("Helvetica", "serif")), "font-size: 14px;"),
        locations = cells_body(columns = hp)
      )
  )
  expect_no_error(
      tab_style(
        gtcars_tbl,
        style = list("font-size: 14px;", cell_text(font = c("Helvetica", "serif"))),
        locations = cells_body(columns = hp)
      )
  )
  expect_no_error(
      tab_style(
        gtcars_tbl,
        style = list(cell_text(font = c("Helvetica", "serif")), cell_borders()),
        locations = cells_body(columns = hp)
      )
  )
  expect_no_error(
    tab_style(
      gtcars_tbl,
      style = list(cell_borders(), cell_text(font = c("Helvetica", "serif"))),
      locations = cells_body(columns = hp)
    ))
  expect_no_error(
    tab_style(
      gtcars_tbl,
      style = list(
        cell_borders(sides = "b", color = "blue", weight = px(3)),
        cell_text(size = px(18), font = c("Helvetica", "serif"), weight = "bold"),
        cell_fill(color = "red", alpha = 0.5)
        ),
      locations = cells_body(columns = hp)
    )
  )
  expect_no_error(
    tab_style(
      gtcars_tbl,
      style = cell_text(font = c("Times New Roman", "serif")),
      locations = cells_body(columns = hp)
    )
  )
})

test_that("Setting white-space options in `cell_text()` works", {

  tbl_ws <-
    dplyr::tibble(
      ws = c("   space   ", "   space", "space   ", " a  b  c  d  e  f")
    ) %>%
    gt()

  # Expect that the white space `"pre"` style option will be present
  # when using `tab_style(style = cell_text(whitespace = "pre"), ... )`
  tbl_ws %>%
    tab_style(
      style = cell_text(whitespace = "pre"),
      locations = cells_body()
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td headers=\"ws\" class=\"gt_row gt_left\" style=\"border-style: none; padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: left; white-space: pre;\" valign=\"middle\" align=\"left\">   space   </td>"
    )
})

test_that("Hiding columns that have styles does not result in errors/warnings", {

  expect_no_error(
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = everything())) %>%
      cols_hide(columns = date)
  )
  expect_no_warning(
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = everything())) %>%
      cols_hide(columns = date)
  )

  expect_no_error(
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = date)) %>%
      cols_hide(columns = datetime)
  )
  expect_no_warning(
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = date)) %>%
      cols_hide(columns = datetime)
  )
})


test_that("A gt table contains custom styles at the correct locations", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`
  tbl_html <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    cols_move_to_start(columns = c("gear", "carb")) %>%
    tab_stubhead(label = "cars") %>%
    cols_hide(columns = "mpg") %>%
    cols_hide(columns = "vs") %>%
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      label = "Mazdas",
      rows = contains("Mazda")
    ) %>%
    tab_spanner(
      label = "gear_carb_cyl",
      id = "gcc",
      columns = c(gear, carb, cyl)
    ) %>%
    row_group_order(groups = c("Mazdas", "Mercs")) %>%
    cols_merge_range(
      col_begin = "disp",
      col_end = "drat"
    ) %>%
    tab_header(
      title = "Title",
      subtitle = "Subtitle"
    ) %>%
    tab_source_note(source_note = "this is a source note") %>%
    cols_label(cyl = md("*cyls*")) %>%
    summary_rows(
      groups = c("Mazdas", "Mercs"),
      columns = c(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) %>%
    grand_summary_rows(
      columns = c(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) %>%
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = list(
        cells_column_labels(),
        cells_stub(rows = TRUE))
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "steelblue"),
        cell_text(color = "white")
      ),
      locations = cells_stub(rows = "Merc 240D")
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "purple"),
        cell_text(color = "white")
      ),
      locations = cells_grand_summary(columns = "hp", rows = 2)
    ) %>%
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_column_spanners(spanners = "gcc")
    ) %>%
    tab_style(
      style = cell_fill(color = "turquoise"),
      locations = cells_column_labels(columns = gear)
    ) %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_column_labels(columns = hp)
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "lightgray"),
        cell_text(style = "italic")
      ),
      locations = cells_body(columns = "hp", rows = "Datsun 710")
    ) %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = "disp", rows = "Mazda RX4")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "red"),
        cell_text(color = "white")
      ),
      locations = cells_row_groups(groups = "Mazdas")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "blue"),
        cell_text(color = "white")
      ),
      locations = cells_stubhead()
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # FIXME: commented failing tests where rvest 1.0.4 no longer allows
  # these tests to work w/o error

  # Expect that the stubhead label is styled
  # nodes <-
  #   tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #0000FF; color: #FFFFFF;']") %>%
  #   rvest::html_text("[class='gt_col_heading gt_columns_bottom_border gt_left]") %>%
  #   expect_equal("cars")

  # Expect that the data cell (`Mazda RX4`/`disp`) -> (1, 4) is styled
  # tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #FFFF00;']") %>%
  #   rvest::html_text("[class='gt_row gt_right']") %>%
  #   expect_equal("160.0–3.90")

  # Expect that the data cell (`Datsun 710`/`hp`) -> (1, 4) is styled
  # tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #D3D3D3; font-style: italic;']") %>%
  #   rvest::html_text("[class='gt_row gt_right']") %>%
  #   expect_equal("93")

  # Expect that the summary cell (`Mercs`::`sum`/`hp`) is styled
  # tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #00FF00; color: #FFFFFF;']") %>%
  #   rvest::html_text("[class='gt_row gt_right gt_summary_row']") %>%
  #   expect_equal("943.00")

  # Expect that the grand summary cell (`sum`/`hp`) is styled
  # tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #A020F0; color: #FFFFFF;']") %>%
  #   rvest::html_text("[class='gt_row gt_grand_summary_row']") %>%
  #   expect_equal("4,694.00")

  # Expect that some column labels (e.g., `disp`, `wt`, etc.) are
  # styled with a light gray background
  (tbl_html %>%
      rvest::html_nodes("[style='background-color: #D3D3D3;']") %>%
      rvest::html_text())[1:5] %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb"))

  # Expect that most stub cells are styled with a light gray background
  (tbl_html %>%
      rvest::html_nodes("[style='background-color: #D3D3D3;']") %>%
      rvest::html_text())[1:6] %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb", "cyls"))

  # Expect that most stub cells are styled with a light gray background
  tbl_html %>%
    rvest::html_nodes("[class='gt_row gt_left gt_stub'][style='background-color: #D3D3D3;']") %>%
    rvest::html_text() %>%
    expect_length(31)

  # Expect that the `hp` column label's cell has a pink background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #FFC0CB;']") %>%
    rvest::html_text() %>%
    expect_equal("hp")

  # Expect that the `gear` column label's cell has a turquoise background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #40E0D0;']") %>%
    rvest::html_text() %>%
    expect_equal("gear")

  # Expect that the row caption `Merc 240D` has a cell background that
  # is ultimately steelblue, and, the font the white
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #4682B4; color: #FFFFFF;']") %>%
    rvest::html_text() %>%
    expect_equal("Merc 240D")

  # Expect that the `gear_carb_cyl` column spanner's
  # cell has a lightgreen background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #90EE90;']") %>%
    rvest::html_text() %>%
    expect_match("gear_carb_cyl")

  # Expect that the `Mazdas` row group label
  # cell has a red background and white text
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #FF0000; color: #FFFFFF;']") %>%
    rvest::html_text() %>%
    expect_equal("Mazdas")

  # Expect that the table title is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_title gt_font_normal'][style='text-align: left;']") %>%
    rvest::html_text() %>%
    expect_equal("Title")

  # Expect that the table subtitle is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border'][style='text-align: left;']") %>%
    rvest::html_text() %>%
    expect_equal("Subtitle")
})

test_that("Using fonts in `from_column()` works within `cell_*()` fns", {

  # Generate table with column of spelled-out numbers (`num`) and
  # styling option values
  tab <-
    dplyr::tibble(
      num = vec_fmt_spelled_num(1:4),
      bkg_color = c("blue", "red", "yellow", "rebeccapurple"),
      txt_color = c("white", "#FFF", "gray10", "#FFFFFFEE"),
      size = paste0(c(14, 20, 24, 30), "px"),
      align = c("left", "right", "center", "right"),
      v_align = c("middle", "top", "bottom", "middle"),
      style = c("normal", "italic", "oblique", "normal"),
      weight = c("normal", "bold", "lighter", "bolder"),
      stretch = c("normal", "semi-expanded", "expanded", "extra-expanded"),
      decorate = c("overline", "line-through", "underline", "underline overline"),
      transform = c("uppercase", "lowercase", "capitalize", "lowercase"),
      whitespace = c("normal", "nowrap", "pre", "pre-wrap"),
      indent = c(0, 4, 8, 10)
    )

  # Generate a gt table and use `tab_style()` along with `cell_*()`
  # helper functions that in turn use the `from_column()` helper
  gt_tbl_1 <-
    tab %>%
    gt() %>%
    tab_style(
      style = list(
        cell_fill(
          color = from_column(column = "bkg_color")
        ),
        cell_text(
          color = from_column(column = "txt_color"),
          size = from_column(column = "size"),
          align = from_column(column = "align"),
          v_align = from_column(column = "v_align"),
          style = from_column(column = "style"),
          weight = from_column(column = "weight"),
          stretch = from_column(column = "stretch"),
          decorate = from_column(column = "decorate"),
          transform = from_column(column = "transform"),
          whitespace = from_column(column = "whitespace"),
          indent = from_column(column = "indent")
        )
      ),
      locations = cells_body(columns = num)
    )

  # Perform snapshot test
  gt_tbl_1 %>% render_as_html() %>% expect_snapshot()
})


# tab_style_body() -------------------------------------------------------------

test_that("tab_style_body() works correctly", {

  # Generate a table that will be used in checks of body styling
  gt_tbl <-
    sp500 %>%
    dplyr::filter(date >= "2015-01-05" & date <= "2015-01-16") %>%
    dplyr::arrange(date) %>%
    dplyr::mutate(week = paste0("W", strftime(date, format = "%V"))) %>%
    dplyr::select(-adj_close, -volume) %>%
    gt(
      rowname_col = "date",
      groupname_col = "week"
    )

  #
  # Target literal body cell values with the `values` argument
  #

  gt_tbl_2 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(2046.13, 2028.26, 2018.40, 1988.12, 2030.25)
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_2 %>% render_as_html())
  gt_tbl_2 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_3 <-
    gt_tbl %>%
    tab_style_body(
      style = list(
        cell_text(font = google_font("Inter"), color = "white"),
        cell_fill(color = "red"),
        cell_borders(
          sides = c("left", "right"),
          color = "steelblue",
          weight = px(4)
        )
      ),
      values = c(2046.13, 2028.26, 2018.40, 1988.12, 2030.25)
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_3 %>% render_as_html())
  gt_tbl_3 %>% render_as_html() %>% expect_snapshot()

  #
  # Target rows and columns
  #

  gt_tbl_4 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "row"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_4 %>% render_as_html())
  gt_tbl_4 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_5 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_5 %>% render_as_html())
  gt_tbl_5 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_6 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    ) %>%
    tab_style_body(
      style = cell_fill(color = "lightblue"),
      values = c(1988.12, 2030.25),
      targets = "row"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_6 %>% render_as_html())
  gt_tbl_6 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_7 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "lightblue"),
      values = c(1988.12, 2030.25),
      targets = "row"
    ) %>%
    tab_style_body(
      style = cell_fill(color = "orange"),
      values = c(1988.12, 2030.25),
      targets = "column"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_7 %>% render_as_html())
  gt_tbl_7 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_8 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "cell"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_8 %>% render_as_html())
  gt_tbl_8 %>% render_as_html() %>% expect_snapshot()

  #
  # Use the `extents` argument to project styling to other locations
  #

  gt_tbl_9 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = "stub"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_9 %>% render_as_html())
  gt_tbl_9 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_10 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = c("body", "stub")
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_10 %>% render_as_html())
  gt_tbl_10 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_11 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "row",
      extents = "body"
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_11 %>% render_as_html())
  gt_tbl_11 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_12 <-
    gt_tbl %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      values = c(1988.12, 2030.25),
      targets = "column",
      extents = c("body", "stub")
    )
  expect_true(gt_tbl %>% render_as_html() != gt_tbl_12 %>% render_as_html())
  gt_tbl_12 %>% render_as_html() %>% expect_snapshot()

  # Generate an alternate table that will be used in checks of body styling
  gt_tbl_alt <-
    exibble %>%
    gt(rowname_col = "row", groupname_col = "group")

  #
  # Use the `pattern` argument to target body cells through a regex pattern
  #

  gt_tbl_13 <-
    gt_tbl_alt %>%
    tab_style_body(
      style = cell_fill(color = "yellow"),
      pattern = "ne|na"
    )
  expect_true(gt_tbl_alt %>% render_as_html() != gt_tbl_13 %>% render_as_html())
  gt_tbl_13 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_14 <-
    gt_tbl_alt %>%
    tab_style_body(
      style = cell_fill(color = "lightgreen"),
      pattern = "2015-01-15"
    )
  expect_true(gt_tbl_alt %>% render_as_html() != gt_tbl_14 %>% render_as_html())
  gt_tbl_14 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_15 <-
    gt_tbl_alt %>%
    tab_style_body(
      style = cell_fill(color = "lightgreen"),
      pattern = "a$"
    )
  expect_true(gt_tbl_alt %>% render_as_html() != gt_tbl_15 %>% render_as_html())
  gt_tbl_15 %>% render_as_html() %>% expect_snapshot()

  #
  # Use the `fn` argument to target body cells through a function
  #

  gt_tbl_16 <-
    gt_tbl_alt %>%
    tab_style_body(
      columns = where(is.numeric),
      style = cell_fill(color = "#FF8AF3"),
      fn = function(x) x >= 0 && x < 50
    )
  expect_true(gt_tbl_alt %>% render_as_html() != gt_tbl_16 %>% render_as_html())
  gt_tbl_16 %>% render_as_html() %>% expect_snapshot()
})
