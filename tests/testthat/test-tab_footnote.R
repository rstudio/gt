context("Ensuring that the `tab_footnote()` function works as expected")

# Create a table from `mtcars` that has all the different components
data <-
  mtcars %>%
  gt(rownames_to_stub = TRUE) %>%
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

# Create a table from `gtcars` that has footnotes
# in the column spanner labels and in the column labels
data_2 <-
  gtcars %>%
  dplyr::filter(ctry_origin == "Germany") %>%
  dplyr::group_by(mfr) %>%
  dplyr::top_n(2, msrp) %>%
  dplyr::ungroup() %>%
  dplyr::select(mfr, model, drivetrain, msrp) %>%
  gt() %>%
  tab_footnote(
    footnote = "Prices in USD.",
    locations = cells_column_labels(columns = vars(msrp))
  ) %>%
  tab_footnote(
    footnote = "AWD = All Wheel Drive, RWD = Rear Wheel Drive.",
    locations = cells_column_labels(columns = vars(drivetrain))
  ) %>%
  tab_footnote(
    footnote = "The most important details.",
    locations = cells_column_labels(groups = "specs and pricing")
  ) %>%
  tab_footnote(
    footnote = "German cars only.",
    locations = cells_column_labels(groups = "make and model")
  ) %>%
  tab_spanner(label = "make and model", columns = vars(mfr, model)) %>%
  tab_spanner(label = "specs and pricing", columns = vars(drivetrain, msrp))

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

  # Apply a footnote to the column labels and stub cells
  tab <-
    data %>%
    tab_footnote(
      footnote = "Column labels and stub footnote.",
      locations = list(
        cells_column_labels(columns = TRUE),
        cells_stub(rows = TRUE)))

  # Expect that the internal `footnotes_df` data frame will have
  # its `locname` column entirely populated with `columns_columns`
  # and `stub`
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("columns_columns", "stub"))

  # Expect that the internal `footnotes_df` data frame will have
  # its `text` column entirely populated with the footnote text
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("Column labels and stub footnote.")

  # Apply a footnote to a single stub cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Stub cell footnote.",
      locations = cells_stub(rows = "Merc 240D"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("stub", "5", NA_character_, NA_character_, "8",
      "Stub cell footnote."))

  # Apply a footnote to the table title
  tab <-
    data %>%
    tab_footnote(
      footnote = "Title footnote.",
      locations = cells_title(groups = "title"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("title", "1", NA_character_, NA_character_, NA_character_,
      "Title footnote."))

  # Apply a footnote to the table subtitle
  tab <-
    data %>%
    tab_footnote(
      footnote = "Subtitle footnote.",
      locations = cells_title(groups = "subtitle"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("subtitle", "2", NA_character_, NA_character_, NA_character_,
      "Subtitle footnote."))

  # Apply a footnote to a single cell in a group summary section
  tab <-
    data %>%
    tab_footnote(
      footnote = "Summary cell footnote.",
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("summary_cells", "5", "Mercs", "hp", "2",
      "Summary cell footnote."))

  # Apply a footnote to the `Mazdas` stub group cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Group cell footnote.",
      locations = cells_group(groups = "Mazdas"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("stub_groups", "5", "Mazdas", NA_character_, NA_character_,
      "Group cell footnote."))

  # Apply a footnote to the `gear_carb_cyl` column spanner cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Column group footnote.",
      locations = cells_column_labels(groups = "gear_carb_cyl"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("columns_groups", "3", "gear_carb_cyl", NA_character_, NA_character_,
      "Column group footnote."))

  # Apply a footnote to a single column label
  tab <-
    data %>%
    tab_footnote(
      footnote = "Single column label footnote.",
      locations = cells_column_labels(columns = "gear"))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("columns_columns", "4", NA_character_, "gear", NA_character_,
      "Single column label footnote."))

  # Apply a footnote to five rows of a single column
  tab <-
    data %>%
    tab_footnote(
      footnote = "Five rows footnote.",
      locations = cells_data(columns = "hp", rows = 1:5))

  # Expect that the internal `footnotes_df` data frame will have five rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(5)

  # Expect that the `rownum` values in `footnotes_df` will be 1:5
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(rownum) %>%
    expect_equal(1:5)

  # Expect that the `text` in `footnotes_df` will be the same for
  # all five rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(text) %>%
    unique() %>%
    expect_equal("Five rows footnote.")

  # Expect that the `location` in `footnotes_df` is 'data' for all five rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal("data")

  # Expect that the `colname` in `footnotes_df` is 'hp' for all five rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
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
  tab <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_data(columns = "disp", rows = vars(`Mazda RX4`)))

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("data", "5", NA_character_, "disp", "1", "A footnote."))

  # Apply a footnote to a single data cell; this time, use `vars()`
  # to specify the `columns`
  tab <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_data(columns = vars(disp, hp), rows = "Mazda RX4"))

  # Expect that the internal `footnotes_df` data frame will have two rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the two rows
  # of the `footnotes_df` data frame
  attr(tab, "footnotes_df", exact = TRUE)[1, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "disp", "1", "A footnote."))

  attr(tab, "footnotes_df", exact = TRUE)[2, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(c(
      "data", "5", NA_character_, "hp", "1", "A footnote."))

  # Use the `data_2` gt table as `tab`
  tab <- data_2

  # Expect that the internal `footnotes_df` data frame
  # will have four rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(4)

  # Expect that the internal `footnotes_df` data frame will have
  # its `locname` column entirely populated with `columns_columns`
  # and `columns_groups`
  attr(tab, "footnotes_df", exact = TRUE) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("columns_columns", "columns_groups"))

  # Create a `tbl_html` object from the `tab` object
  tbl_html <-
    tab %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the footnote text elements are in the correct order
  tbl_html %>%
    selection_text(selection = "[class='gt_footnote']") %>%
    expect_equal(
      paste0(
        "1 German cars only.",
        "2 The most important details.",
        "3 AWD = All Wheel Drive, RWD = Rear Wheel Drive.",
        "4 Prices in USD.")
    )

  # Expect that the two sets of footnote glyphs (1st set are
  # throughout the table, 2nd set are in the footer) are in
  # the correct order
  tbl_html %>%
    selection_text(selection = "[class='gt_footnote_glyph']") %>%
    expect_equal(rep(as.character(1:4), 2))

})
