context("Ensuring that the `tab_style()` function works as expected")

# Create a table from `mtcars` that has all the different components
data <-
  gt(mtcars, rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead_label(label = "cars") %>%
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
      style = cells_styles(bkgd_color = "lightgray"),
      locations = list(
        cells_column_labels(columns = TRUE),
        cells_stub(rows = TRUE)))

  # Expect that the internal `styles_df` data frame will have
  # its `locname` column entirely populated with `cells_column_labels`
  # and `stub`
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("columns_columns", "stub"))

  # Expect that the internal `styles_df` data frame will have
  # its `text` column entirely populated with the style statement
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("background-color:lightgray;")

  # Apply a `steelblue` background color with white text to a
  # single stub cell
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(
        bkgd_color = "steelblue",
        text_color = "white"),
      locations = cells_stub(rows = "Merc 240D"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("stub", "5", NA_character_, NA_character_, "8",
      "background-color:steelblue;color:white;"))

  # Apply left-alignment to the table title
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(text_align = "left"),
      locations = cells_title(groups = "title"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("title", "1", NA_character_, NA_character_, NA_character_,
      "text-align:left;"))

  # Apply left-alignment to the table subtitle
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(text_align = "left"),
      locations = cells_title(groups = "subtitle"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("subtitle", "2", NA_character_, NA_character_, NA_character_,
      "text-align:left;"))

  # Apply a green background with white text to a single cell in
  # a group summary section
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "green", text_color = "white"),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("summary_cells", "5", "Mercs", "hp", "2",
      "background-color:green;color:white;"))

  # Apply a `yellow` background to the `Mazdas` stub group cell
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "yellow"),
      locations = cells_group(groups = "Mazdas"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("stub_groups", "5", "Mazdas", NA_character_, NA_character_,
      "background-color:yellow;"))

  # Apply a `lightgreen` background to the `gear_carb_cyl`
  # column spanner cell
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "lightgreen"),
      locations = cells_column_labels(groups = "gear_carb_cyl"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("columns_groups", "3", "gear_carb_cyl", NA_character_, NA_character_,
      "background-color:lightgreen;"))

  # Apply a `turquoise` background to a single column label
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "turquoise"),
      locations = cells_column_labels(columns = "gear"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("columns_columns", "4", NA_character_, "gear", NA_character_,
      "background-color:turquoise;"))

  # Apply a `turquoise` background to a single column label
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "pink"),
      locations = cells_column_labels(columns = "hp"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("columns_columns", "4", NA_character_, "hp", NA_character_,
      "background-color:pink;"))

  # Apply a `lightgray` background to five rows of a single column
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "lightgray", text_style = "italic"),
      locations = cells_data(columns = "hp", rows = 1:5))

  # Expect that the internal `styles_df` data frame will have five rows
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(5)

  # Expect that the `rownum` values in `styles_df` will be 1:5
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(rownum) %>%
    expect_equal(1:5)

  # Expect that the style `text` in `styles_df` will be the same for
  # all five rows
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("background-color:lightgray;font-style:italic;")

  # Expect that the `location` in `styles_df` is 'data' for all five rows
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal("data")

  # Expect that the `colname` in `styles_df` is 'hp' for all five rows
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    dplyr::pull(colname) %>%
    unique() %>%
    expect_equal("hp")

  # Apply a `yellow` background a single data cell
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "yellow"),
      locations = cells_data(columns = "disp", rows = "Mazda RX4"))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("data", "5", NA_character_, "disp", "1",
      "background-color:yellow;"))

  # Expect an error in `tab_style` when a value for `rows` isn't
  # in the table
  expect_error(
    data %>%
      tab_style(
        style = cells_styles(bkgd_color = "yellow"),
        locations = cells_data(columns = "disp", rows = "Mazda RX7")))

  # Apply a `yellow` background a single data cell; this time, use `vars()`
  # to specify the `rows`
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "yellow"),
      locations = cells_data(columns = "disp", rows = vars(`Mazda RX4`)))

  # Expect that the internal `styles_df` data frame will have
  # a single row
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `styles_df` data frame
  expect_attr_equal(
    tbl_html, "styles_df",
    c("data", "5", NA_character_, "disp", "1",
      "background-color:yellow;"))

  # Apply a `yellow` background a single data cell; this time, use `vars()`
  # to specify the `columns`
  tbl_html <-
    data %>%
    tab_style(
      style = cells_styles(bkgd_color = "yellow"),
      locations = cells_data(columns = vars(disp, hp), rows = "Mazda RX4"))

  # Expect that the internal `styles_df` data frame will have two rows
  attr(tbl_html, "styles_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the two rows
  # of the `styles_df` data frame
  attr(tbl_html, "styles_df", exact = TRUE)[1, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "disp", "1",
      "background-color:yellow;"))

  attr(tbl_html, "styles_df", exact = TRUE)[2, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "hp", "1",
      "background-color:yellow;"))
})
