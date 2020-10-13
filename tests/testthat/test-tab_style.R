context("Ensuring that the `tab_style()` function works as expected")

# Create a table from `mtcars` that has all the different components
data <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead(label = "cars") %>%
  cols_hide(columns = "mpg") %>%
  cols_hide(columns = "vs") %>%
  tab_row_group(
    group = "Mercs",
    rows = contains("Merc")
  ) %>%
  tab_row_group(
    group = "Mazdas",
    rows = contains("Mazda")
  ) %>%
  tab_row_group(
    others = "Others"
  ) %>%
  tab_spanner(
    label = "gear_carb_cyl",
    columns = vars(gear, carb, cyl)
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
    columns = vars(hp, wt, qsec),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE))
  ) %>%
  summary_rows(
    columns = vars(hp, wt),
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

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_attr(key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

test_that("a gt table can store the correct style statements", {

  # Check that specific suggested packages are available
  check_suggests()

  # Apply a `lightgray` background color to the columns
  # and stub cells
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = list(
        cells_column_labels(columns = TRUE),
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
    expect_equal("white")

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
          groups = "Mercs", columns = starts_with("x"), rows = 2)
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
          groups = "Mercs", columns = starts_with("m"), rows = starts_with("x"))
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
        columns = "hp", rows = vars(sum))
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
      locations = cells_column_spanners(spanners = "gear_carb_cyl")
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

  # Apply a `yellow` background a single data cell; this time, use `vars()`
  # to specify the `rows`
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = "disp", rows = vars(`Mazda RX4`))
    )

  # Expect that the internal `styles_df` data frame will have
  # a single row
  dt_styles_get(data = tbl_html) %>%
    nrow() %>%
    expect_equal(1)

  # Apply a `yellow` background a single data cell; this time, use `vars()`
  # to specify the `columns`
  tbl_html <-
    data %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = vars(disp, hp), rows = "Mazda RX4")
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
})

test_that("using fonts in `cell_text()` works", {

  # Prepare a small gt table for all tests
  tbl <- exibble %>% dplyr::select(char, time) %>% gt()

  # Expect that system fonts can be combined with default fonts
  # and set at a specific location
  tbl %>%
    tab_style(
      style = cell_text(font = c("Comic Sans MS", "Menlo", default_fonts())),
      locations = cells_body(columns = vars(time), rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td style=\"padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: left; font-family: &#39;Comic Sans MS&#39;, Menlo, -apple-system, BlinkMacSystemFont, &#39;Segoe UI&#39;, Roboto, Oxygen, Ubuntu, Cantarell, &#39;Helvetica Neue&#39;, &#39;Fira Sans&#39;, &#39;Droid Sans&#39;, Arial, sans-serif;\">13:35</td>"
    )

  # Expect that a Google Fonts and system fonts can be combined
  # (using a list or `c()`) with default fonts and set at a specific location
  tbl %>%
    tab_style(
      style = cell_text(font = c(google_font(name = "Dancing Script"), default_fonts())),
      locations = cells_body(columns = vars(time), rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td style=\"padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: left; font-family: &#39;Dancing Script&#39;, -apple-system, BlinkMacSystemFont, &#39;Segoe UI&#39;, Roboto, Oxygen, Ubuntu, Cantarell, &#39;Helvetica Neue&#39;, &#39;Fira Sans&#39;, &#39;Droid Sans&#39;, Arial, sans-serif;\">13:35</td>"
    )

  tbl %>%
    tab_style(
      style = cell_text(font = list(google_font(name = "Dancing Script"), default_fonts())),
      locations = cells_body(columns = vars(time), rows = 1)
    ) %>%
    as_raw_html() %>%
    expect_match(
      "<td style=\"padding-top: 8px; padding-bottom: 8px; padding-left: 5px; padding-right: 5px; margin: 10px; border-top-style: solid; border-top-width: 1px; border-top-color: #D3D3D3; border-left-style: none; border-left-width: 1px; border-left-color: #D3D3D3; border-right-style: none; border-right-width: 1px; border-right-color: #D3D3D3; vertical-align: middle; overflow-x: hidden; text-align: left; font-family: &#39;Dancing Script&#39;, -apple-system, BlinkMacSystemFont, &#39;Segoe UI&#39;, Roboto, Oxygen, Ubuntu, Cantarell, &#39;Helvetica Neue&#39;, &#39;Fira Sans&#39;, &#39;Droid Sans&#39;, Arial, sans-serif;\">13:35</td>"
    )
})
