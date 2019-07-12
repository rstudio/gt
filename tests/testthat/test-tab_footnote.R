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
    rows = contains("Merc"),
  ) %>%
  tab_row_group(
    group = "Mazdas",
    rows = contains("Mazda"),
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


# Create a table from `gtcars` that has footnotes
# in group summary and grand summary cells
data_3 <-
  gtcars %>%
  dplyr::filter(ctry_origin == "Germany") %>%
  dplyr::group_by(mfr) %>%
  dplyr::top_n(3, msrp) %>%
  dplyr::ungroup() %>%
  dplyr::select(mfr, model, drivetrain, msrp) %>%
  gt(rowname_col = "model", groupname_col = "mfr") %>%
  summary_rows(
    groups = c("BMW", "Audi"),
    columns = vars(msrp),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~min(., na.rm = TRUE))
  ) %>%
  summary_rows(
    columns = vars(msrp),
    fns = list(
      ~min(., na.rm = TRUE),
      ~max(., na.rm = TRUE))
  ) %>%
  tab_footnote(
    footnote = "Average price for BMW and Audi.",
    locations = cells_summary(
      groups = c("BMW", "Audi"),
      columns = vars(msrp),
      rows = starts_with("me"))
  ) %>%
  tab_footnote(
    footnote = "Maximum price across all cars.",
    locations = cells_grand_summary(
      columns = vars(msrp),
      rows = starts_with("ma"))
  ) %>%
  tab_footnote(
    footnote = "Minimum price across all cars.",
    locations = cells_grand_summary(
      columns = vars(msrp),
      rows = starts_with("mi"))
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

  # Apply a footnote to the column labels and stub cells
  tab <-
    data %>%
    tab_footnote(
      footnote = "Column labels and stub footnote.",
      locations = list(
        cells_column_labels(columns = TRUE),
        cells_stub(rows = TRUE)
      )
    )

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
      locations = cells_stub(rows = "Merc 240D")
    )

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
      "Stub cell footnote.")
  )

  # Apply a footnote to the table title
  tab <-
    data %>%
    tab_footnote(
      footnote = "Title footnote.",
      locations = cells_title(groups = "title")
    )

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
      "Title footnote.")
  )

  # Apply a footnote to the table subtitle
  tab <-
    data %>%
    tab_footnote(
      footnote = "Subtitle footnote.",
      locations = cells_title(groups = "subtitle")
    )

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
      "Subtitle footnote.")
  )

  # Apply a footnote to the stubhead label
  tab <-
    data %>%
    tab_footnote(
      footnote = "Stubhead label footnote.",
      locations = cells_stubhead()
    )

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "footnotes_df",
    c("stubhead", "2.5", NA_character_, NA_character_, NA_character_,
      "Stubhead label footnote.")
  )

  # Apply a footnote to a single cell in a group summary section
  tab <-
    data %>%
    tab_footnote(
      footnote = "Summary cell footnote.",
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    )

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  # expect_attr_equal(
  #   tab, "footnotes_df",
  #   c("summary_cells", "5", "Mercs", "hp", "2",
  #     "Summary cell footnote.")
  # )

  # Expect an error if columns couldn't be resolved
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Summary cell footnote.",
        locations = cells_summary(
          groups = "Mercs", columns = starts_with("x"), rows = 2)
      )
  )

  # Expect an error if rows couldn't be resolved
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Summary cell footnote.",
        locations = cells_summary(
          groups = "Mercs", columns = starts_with("m"), rows = starts_with("x"))
      )
  )

  # Apply a footnote to a single cell in a grand
  # summary section
  tab <-
    data %>%
    tab_footnote(
      footnote = "Grand summary cell footnote.",
      locations = cells_grand_summary(
        columns = vars(wt), rows = starts_with("s")
      )
    )

  # Expect that the internal `footnotes_df` data frame
  # will have a single row
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  # expect_attr_equal(
  #   tab, "footnotes_df",
  #   c("grand_summary_cells", "6", NA, "wt", "2",
  #     "Grand summary cell footnote.")
  # )

  # Expect an error if columns couldn't be resolved
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Grand summary cell footnote.",
        locations = cells_grand_summary(
          columns = starts_with("x"), rows = 2)
      )
  )

  # Expect an error if rows couldn't be resolved
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Grand summary cell footnote.",
        locations = cells_grand_summary(
          columns = starts_with("m"), rows = starts_with("x"))
      )
  )

  # Apply a footnote to a single cell in a group
  # summary section, and, to a single cell in a grand
  # summary section
  tab <-
    data %>%
    tab_footnote(
      footnote = "Summary cell footnote.",
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    ) %>%
    tab_footnote(
      footnote = "Grand summary cell footnote.",
      locations = cells_grand_summary(
        columns = vars(wt), rows = starts_with("s")
      )
    )

  # Expect that the internal `footnotes_df` data frame
  # will have two rows
  attr(tab, "footnotes_df", exact = TRUE) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the
  # double-row `footnotes_df` data frame
  # expect_attr_equal(
  #   tab, "footnotes_df",
  #   c("summary_cells", "grand_summary_cells",
  #     "5", "6", "Mercs", NA, "hp", "wt", "2", "2",
  #     "Summary cell footnote.",
  #     "Grand summary cell footnote.")
  # )

  # Apply a footnote to the `Mazdas` stub group cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Group cell footnote.",
      locations = cells_group(groups = "Mazdas"))

  # Expect that the internal `footnotes_df` data frame
  # will have a single row
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
    tidy_gsub("\n          ", "") %>%
    expect_equal(
      c(
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
    tidy_gsub("\n          ", "") %>%
    expect_equal(rep(as.character(1:4), 2))
})

test_that("the `apply_footnotes_to_summary()` function works correctly", {

  # Build the `data_3` object (using the `html` context)
  # and obtain the `built_data` list object
  built_data <- build_data(data_3, context = "html")

  # Extract `footnotes_resolved` and `list_of_summaries`
  footnotes_resolved <- built_data$footnotes_resolved
  list_of_summaries <- built_data$list_of_summaries

  # Expect that the `footnotes_resolved` object inherits
  # from `tbl_df`
  expect_is(footnotes_resolved, "tbl_df")

  # Expect that there are specific column names in
  # this tibble
  expect_equal(
    colnames(footnotes_resolved),
    c("locname", "locnum", "grpname", "colname", "rownum",
      "text", "colnum", "fs_id")
  )

  # Expect that there are 4 rows in this tibble
  expect_equal(nrow(footnotes_resolved), 4)

  # Expect specific values to be in `footnotes_resolved`
  expect_equal(
    footnotes_resolved$locname,
    c("summary_cells", "summary_cells",
      "grand_summary_cells", "grand_summary_cells")
  )
  expect_equal(footnotes_resolved$locnum, c(5, 5, 6, 6))
  expect_equal(footnotes_resolved$grpname, c("BMW", "Audi", "::GRAND_SUMMARY", "::GRAND_SUMMARY"))
  expect_equal(footnotes_resolved$colname, rep("msrp", 4))
  expect_equal(footnotes_resolved$rownum, c(3.01, 6.01, 1.00, 2.00))
  expect_equal(
    footnotes_resolved$text,
    c("Average price for BMW and Audi.", "Average price for BMW and Audi.",
      "Minimum price across all cars.", "Maximum price across all cars.")
  )
  expect_equal(footnotes_resolved$colnum, rep(2, 4))
  expect_equal(footnotes_resolved$fs_id, c("1", "1", "2", "3"))

  # Expect that the list of summaries has length `2`
  expect_equal(length(list_of_summaries), 2)

  # Expect specific names in the `list_of_summaries` list
  expect_equal(
    names(list_of_summaries),
    c("summary_df_data_list", "summary_df_display_list")
  )

  # Expect three tibbles in the `summary_df_data_list` component
  expect_equal(length(list_of_summaries$summary_df_data_list), 3)

  # Expect three tibbles in the `summary_df_display_list` component
  expect_equal(length(list_of_summaries$summary_df_display_list), 3)

  # Expect specific names for the subcomponents of the
  # `summary_df_data_list` and `summary_df_data_list`
  # parent components
  expect_equal(
    names(list_of_summaries$summary_df_data_list),
    c("BMW", "Audi", "::GRAND_SUMMARY")
  )
  expect_equal(
    names(list_of_summaries$summary_df_display_list),
    c("::GRAND_SUMMARY", "Audi", "BMW")
  )

  # Expect formatted cell values with no HTML footnote markup
  expect_equal(
    list_of_summaries$summary_df_display_list$`::GRAND_SUMMARY`$msrp,
    c("56,000.00", "140,700.00")
  )

  expect_equal(
    list_of_summaries$summary_df_display_list$Audi$msrp,
    c("113,233.33", "108,900.00")
  )

  expect_equal(
    list_of_summaries$summary_df_display_list$BMW$msrp,
    c("116,066.67", "94,100.00")
  )

  # Use the `apply_footnotes_to_summary()` function to modify
  # the cell values in the `list_of_summaries$summary_df_display_list`
  # subcomponent of `list_of_summaries`
  applied_footnotes <-
    apply_footnotes_to_summary(list_of_summaries, footnotes_resolved)

  # Expect no change in the `summary_df_data_list` subcomponent
  # as a result of the transformation
  expect_equivalent(
    list_of_summaries$summary_df_data_list,
    applied_footnotes$summary_df_data_list
  )

  # Expect formatted cell values with HTML footnote markup
  expect_equal(
    applied_footnotes$summary_df_display_list$`::GRAND_SUMMARY`$msrp,
    c("56,000.00<sup class=\"gt_footnote_glyph\">2</sup>",
      "140,700.00<sup class=\"gt_footnote_glyph\">3</sup>")
  )

  expect_equal(
    applied_footnotes$summary_df_display_list$Audi$msrp,
    c("113,233.33<sup class=\"gt_footnote_glyph\">1</sup>", "108,900.00")
  )

  expect_equal(
    applied_footnotes$summary_df_display_list$BMW$msrp,
    c("116,066.67<sup class=\"gt_footnote_glyph\">1</sup>", "94,100.00")
  )

})
