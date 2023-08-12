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

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {
  selection <- paste0("[", key, "]")
  rvest::html_attr(rvest::html_nodes(html, selection), key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {
  rvest::html_text(rvest::html_nodes(html, selection))
}

test_that("A gt table can store the correct style statements", {

  # Check that specific suggested packages are available
  check_suggests()

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

  # Expect that the internal `styles_df` data frame will have
  # its `locname` column entirely populated with `cells_column_labels`
  # and `stub`
  dt_styles_get(data = tbl_html) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("columns_columns", "stub"))

  # Expect that the internal `styles_df` data frame will have
  # its `cell_fill:color` property entirely populated with `lightgray`
  dt_styles_get(data = tbl_html) %>%
    .$styles %>%
    vapply(function(x) x[1]$cell_fill$color, character(1)) %>%
    unique() %>%
    expect_equal("#D3D3D3")

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

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for inside the single `styles` list
  dt_styles_get(data = tbl_html) %>%
    .$styles %>%
    .[[1]] %>%
    .$cell_fill %>%
    .$color %>%
    expect_equal("#4682B4")

  dt_styles_get(data = tbl_html) %>%
    .$styles %>%
    .[[1]] %>%
    .$cell_text %>%
    .$color %>%
    expect_equal("#FFFFFF")

  # Apply left-alignment to the table title
  tbl_html <-
    data %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Expect a specific value inside the single `styles` list
  dt_styles_get(data = tbl_html) %>%
    .$styles %>%
    .[[1]] %>%
    .$cell_text %>%
    .$align %>%
    expect_equal("left")

  # Apply left-alignment to the table subtitle
  tbl_html <-
    data %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    )

  # Expect certain values for inside the single `styles` list
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Expect a specific value inside the single `styles` list
  dt_styles_get(data = tbl_html) %>%
    .$styles %>%
    .[[1]] %>%
    .$cell_text %>%
    .$align %>%
    expect_equal("left")

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

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Expect an error if columns couldn't be resolved
  expect_error(
    data %>%
      tab_style(
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
  )

  # Expect an error if rows couldn't be resolved
  expect_error(
    data %>%
      tab_style(
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
  )

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
  expect_error(
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
  expect_error(
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
    nrow() %>%
    expect_equal(1)

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
    nrow() %>%
    expect_equal(1)

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
    nrow() %>%
    expect_equal(1)

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
    nrow() %>%
    expect_equal(1)

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
    unique() %>%
    expect_equal("data")

  # Expect that the `colname` in `styles_df` is 'hp' for all five rows
  dt_styles_get(data = tbl_html) %>%
    dplyr::pull(colname) %>%
    unique() %>%
    expect_equal("hp")

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
    nrow() %>%
    expect_equal(1)

  # Expect an error in `tab_style` when a value for `rows` isn't
  # in the table
  expect_error(
    data %>%
      tab_style(
        style = cell_fill(color = "yellow"),
        locations = cells_body(columns = "disp", rows = "Mazda RX7")
      )
  )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Apply a `yellow` background a single data cell; this time, use `c()`
  # to specify the `columns`
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = c(disp, hp), rows = "Mazda RX4")
    )

  # Expect that the internal `styles_df` data frame will have two rows
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the two rows
  # of the `styles_df` data frame
  dt_styles_get(data = tbl_html) %>%
    .[1, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", NA_character_, "disp", "5", "1", NA_character_, "#FFFF00")
    )

  dt_styles_get(data = tbl_html) %>%
    .[2, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", NA_character_, "hp", "5", "1", NA_character_, "#FFFF00")
    )

  # Check that `tab_row_group(others_label = ...)` still works but
  # issues a warning
  expect_warning(data %>% tab_row_group(others_label = "Others1"))
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
  expect_equal(
    gtcars_tbl %>%
      tab_style(
        style =
          cell_text(
            weight = "bold",
            font = c("Helvetica", "Times New Roman"),
            color = "red"
          ),
        locations = cells_body(columns = hp, rows = 1:2)
      ) %>%
      as_raw_html() %>%
      gsub("id=\"[a-z]*?\"", "", .),
    gtcars_tbl %>%
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
      ) %>%
      as_raw_html() %>%
      gsub("id=\"[a-z]*?\"", "", .)
  )

  # Don't expect any errors when styling with different fonts
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
        style = list(cell_text(font = c("Helvetica", "serif")), "font-size: 14px;"),
        locations = cells_body(columns = hp)
      )
  )
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
        style = list("font-size: 14px;", cell_text(font = c("Helvetica", "serif"))),
        locations = cells_body(columns = hp)
      )
  )
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
        style = list(cell_text(font = c("Helvetica", "serif")), cell_borders()),
        locations = cells_body(columns = hp)
      )
  )
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
        style = list(cell_borders(), cell_text(font = c("Helvetica", "serif"))),
        locations = cells_body(columns = hp)
      )
  )
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
        style = list(
          cell_borders(sides = "b", color = "blue", weight = px(3)),
          cell_text(size = px(18), font = c("Helvetica", "serif"), weight = "bold"),
          cell_fill(color = "red", alpha = 0.5)
          ),
        locations = cells_body(columns = hp)
      )
  )
  expect_error(
    regexp = NA,
    gtcars_tbl %>%
      tab_style(
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

  expect_error(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = everything())) %>%
      cols_hide(columns = date)
  )
  expect_warning(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = everything())) %>%
      cols_hide(columns = date)
  )

  expect_error(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = date)) %>%
      cols_hide(columns = datetime)
  )
  expect_warning(
    regexp = NA,
    exibble %>%
      gt() %>%
      tab_style(style = cell_fill(), locations = cells_body(columns = date)) %>%
      cols_hide(columns = datetime)
  )
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
