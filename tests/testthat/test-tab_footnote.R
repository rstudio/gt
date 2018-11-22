context("Ensuring that the `tab_footnote()` function works as expected")

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
  blocks_arrange(groups = c("Mazdas", "Mercs")) %>%
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

test_that("the `tab_footnote()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Apply a footnote to the boxhead and stub cells
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Boxhead and stub footnote.",
      locations = list(
        cells_boxhead(columns = TRUE),
        cells_stub(rows = TRUE)))

  # Expect that the internal `footnotes_df` data frame will have
  # its `locname` column entirely populated with `boxhead_columns`
  # and `stub`
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("boxhead_columns", "stub"))

  # Expect that the internal `footnotes_df` data frame will have
  # its `text` column entirely populated with the footnote text
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("Boxhead and stub footnote.")

  # Apply a footnote to a single stub cell
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Stub cell footnote.",
      locations = cells_stub(rows = "Merc 240D"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("stub", "5", NA_character_, NA_character_, "8",
      "Stub cell footnote."))

  # Apply a footnote to the table title
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Title footnote.",
      locations = cells_title(groups = "title"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("title", "1", NA_character_, NA_character_, NA_character_,
      "Title footnote."))

  # Apply a footnote to the table subtitle
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Subtitle footnote.",
      locations = cells_title(groups = "subtitle"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("subtitle", "2", NA_character_, NA_character_, NA_character_,
      "Subtitle footnote."))

  # Apply a footnote to a single cell in a group summary section
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Summary cell footnote.",
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("summary_cells", "5", "Mercs", "hp", "2",
      "Summary cell footnote."))

  # Apply a footnote to the `Mazdas` stub group cell
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Group cell footnote.",
      locations = cells_group(groups = "Mazdas"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("stub_groups", "5", "Mazdas", NA_character_, NA_character_,
      "Group cell footnote."))

  # Apply a footnote to the `gear_carb_cyl` column spanner cell
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Column group footnote.",
      locations = cells_boxhead(groups = "gear_carb_cyl"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("boxhead_groups", "3", "gear_carb_cyl", NA_character_, NA_character_,
      "Column group footnote."))

  # Apply a footnote to a single column label
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Single column label footnote.",
      locations = cells_boxhead(columns = "gear"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("boxhead_columns", "4", NA_character_, "gear", NA_character_,
      "Single column label footnote."))

  # Apply a footnote to five rows of a single column
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "Five rows footnote.",
      locations = cells_data(columns = "hp", rows = 1:5))

  # Expect that the internal `footnotes_df` data frame will have five rows
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(5)

  # Expect that the `rownum` values in `footnotes_df` will be 1:5
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(rownum) %>%
    expect_equal(1:5)

  # Expect that the `text` in `footnotes_df` will be the same for
  # all five rows
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("Five rows footnote.")

  # Expect that the `location` in `footnotes_df` is 'data' for all five rows
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal("data")

  # Expect that the `colname` in `footnotes_df` is 'hp' for all five rows
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(colname) %>%
    unique() %>%
    expect_equal("hp")

  # Expect an error in `tab_footnote` when a value for `rows` isn't
  # in the table
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Footnote error.",
        locations = cells_data(columns = "disp", rows = "Mazda RX7")))

  # Apply a footnote to a single data cell; this time, use `vars()`
  # to specify the `rows`
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_data(columns = "disp", rows = vars(`Mazda RX4`)))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tbl_html, "footnotes_df",
    c("data", "5", NA_character_, "disp", "1", "A footnote."))

  # Apply a footnote to a single data cell; this time, use `vars()`
  # to specify the `columns`
  tbl_html <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_data(columns = vars(disp, hp), rows = "Mazda RX4"))

  # Expect that the internal `footnotes_df` data frame will have two rows
  attr(tbl_html, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the two rows
  # of the `footnotes_df` data frame
  attr(tbl_html, "footnotes_df", exact = TRUE)[1, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "disp", "1", "A footnote."))

  attr(tbl_html, "footnotes_df", exact = TRUE)[2, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "hp", "1", "A footnote."))
})
