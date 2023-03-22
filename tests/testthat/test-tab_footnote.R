# Create a table from `mtcars` that has all the different components
data <-
  mtcars %>%
  gt(rownames_to_stub = TRUE) %>%
  cols_move_to_start(columns = c("gear", "carb")) %>%
  tab_stubhead(label = "cars") %>%
  cols_hide(columns = "mpg") %>%
  cols_hide(columns = "vs") %>%
  tab_row_group(
    label = "Mercs",
    rows = contains("Merc"),
  ) %>%
  tab_row_group(
    label = "Mazdas",
    rows = contains("Mazda"),
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
      ~sum(., na.rm = TRUE)
    )
  ) %>%
  grand_summary_rows(
    columns = c(hp, wt),
    fns = list(
      ~mean(., na.rm = TRUE),
      ~sum(., na.rm = TRUE)
    )
  )

# Create a table from `gtcars` that has footnotes
# in the column spanner labels and in the column labels
data_2 <-
  gtcars %>%
  dplyr::filter(ctry_origin == "Germany") %>%
  dplyr::group_by(mfr) %>%
  dplyr::top_n(n = 2, msrp) %>%
  dplyr::ungroup() %>%
  dplyr::select(mfr, model, drivetrain, msrp) %>%
  gt() %>%
  tab_spanner(
    label = "make and model",
    id = "mm",
    columns = c(mfr, model)
  ) %>%
  tab_spanner(
    label = "specs and pricing",
    id = "sp",
    columns = c(drivetrain, msrp)
  ) %>%
  tab_footnote(
    footnote = "Prices in USD.",
    locations = cells_column_labels(columns = msrp)
  ) %>%
  tab_footnote(
    footnote = "AWD = All Wheel Drive, RWD = Rear Wheel Drive.",
    locations = cells_column_labels(columns = drivetrain)
  ) %>%
  tab_footnote(
    footnote = "The most important details.",
    locations = cells_column_spanners(spanners = "sp")
  ) %>%
  tab_footnote(
    footnote = "German cars only.",
    locations = cells_column_spanners(spanners = "mm")
  )

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
    columns = "msrp",
    fns = list(
      ~mean(., na.rm = TRUE),
      ~min(., na.rm = TRUE)
    )
  ) %>%
  grand_summary_rows(
    columns = "msrp",
    fns = list(
      ~min(., na.rm = TRUE),
      ~max(., na.rm = TRUE)
    )
  ) %>%
  tab_footnote(
    footnote = "Average price for BMW and Audi.",
    locations = cells_summary(
      groups = c("BMW", "Audi"),
      columns = "msrp",
      rows = starts_with("me")
    )
  ) %>%
  tab_footnote(
    footnote = "Maximum price across all cars.",
    locations = cells_grand_summary(
      columns = "msrp",
      rows = starts_with("ma")
    )
  ) %>%
  tab_footnote(
    footnote = "Minimum price across all cars.",
    locations = cells_grand_summary(
      columns = "msrp",
      rows = starts_with("mi")
    )
  )

# Create a table from `sp500` that has footnotes
# in the title and the subtitle cells
data_4 <-
  sp500 %>%
  dplyr::filter(
    date >= "2015-01-05" &
      date <= "2015-01-10"
  ) %>%
  dplyr::select(-c(adj_close, volume, high, low)) %>%
  gt() %>%
  tab_header(
    title = "S&P 500",
    subtitle = "Open and Close Values"
  ) %>%
  tab_footnote(
    footnote = "All values in USD.",
    locations = list(cells_title(groups = "subtitle"))
  ) %>%
  tab_footnote(
    footnote = "Standard and Poor 500.",
    locations = list(cells_title(groups = "title"))
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

test_that("The `tab_footnote()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Apply a footnote to the column labels and stub cells
  tab <-
    data %>%
    tab_footnote(
      footnote = "Column labels and stub footnote.",
      locations = list(
        cells_column_labels(),
        cells_stub(rows = TRUE)
      )
    )

  # Expect that the internal `footnotes_df` data frame will have
  # its `locname` column entirely populated with `columns_columns`
  # and `stub`
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal(c("columns_columns", "stub"))

  # Expect that the internal `footnotes_df` data frame will have
  # its `text` column entirely populated with the footnote text
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(footnotes) %>%
    unlist() %>%
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
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "stub", NA_character_, NA_character_, "5", "8",
        NA_character_, "Stub cell footnote.", "auto"
      )
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
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "title", NA_character_, NA_character_, "1", NA_character_,
        NA_character_, "Title footnote.", "auto"
      )
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
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "subtitle", NA_character_, NA_character_, "2", NA_character_,
        NA_character_, "Subtitle footnote.", "auto"
      )
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
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "stubhead", NA_character_, NA_character_, "2.5", NA_character_,
        NA_character_, "Stubhead label footnote.", "auto"
      )
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
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "summary_cells", "Mercs", "hp", "5", "2", NA_character_,
        "Summary cell footnote.", "auto"
      )
    )

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
          groups = "Mercs", columns = starts_with("m"), rows = starts_with("x")
        )
      )
  )

  # Apply a footnote to a single cell in a grand
  # summary section
  tab <-
    data %>%
    tab_footnote(
      footnote = "Grand summary cell footnote.",
      locations = cells_grand_summary(
        columns = wt, rows = starts_with("s")
      )
    )

  # Expect that the internal `footnotes_df` data frame
  # will have a single row
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "grand_summary_cells", "::GRAND_SUMMARY", "wt", "6", "2",
        NA_character_, "Grand summary cell footnote.", "auto"
      )
    )

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
        groups = "Mercs", columns = "hp", rows = 2
      )
    ) %>%
    tab_footnote(
      footnote = "Grand summary cell footnote.",
      locations = cells_grand_summary(
        columns = wt, rows = starts_with("s")
      )
    )

  # Expect that the internal `footnotes_df` data frame
  # will have two rows
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the
  # double-row `footnotes_df` data frame
  expect_attr_equal(
    tab, "_footnotes",
    c(
      "summary_cells", "grand_summary_cells",
      "Mercs", "::GRAND_SUMMARY", "hp", "wt",
      "5", "6", "2", "2", NA_character_, NA_character_,
      "Summary cell footnote.",
      "Grand summary cell footnote.",
      "auto", "auto"
    )
  )

  # Apply a footnote to the `Mazdas` row group cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Group cell footnote.",
      locations = cells_row_groups(groups = "Mazdas")
    )

  # Expect that the internal `footnotes_df` data frame
  # will have a single row
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "row_groups", "Mazdas", NA_character_, "5", NA_character_,
        NA_character_, "Group cell footnote.", "auto"
        )
    )

  # Apply a footnote to the `gear_carb_cyl` column spanner cell
  tab <-
    data %>%
    tab_footnote(
      footnote = "Column group footnote.",
      locations = cells_column_spanners(spanners = "gcc")
    )

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "columns_groups", "gcc", NA_character_, "3", NA_character_,
        NA_character_, "Column group footnote.", "auto"
      )
    )

  # Apply a footnote to a single column label
  tab <-
    data %>%
    tab_footnote(
      footnote = "Single column label footnote.",
      locations = cells_column_labels(columns = "gear")
    )

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "columns_columns", NA_character_, "gear", "4", NA_character_,
        NA_character_, "Single column label footnote.", "auto"
      )
    )

  # Apply a footnote to five rows of a single column
  tab <-
    data %>%
    tab_footnote(
      footnote = "Five rows footnote.",
      locations = cells_body(columns = "hp", rows = 1:5)
    )

  # Expect that the internal `footnotes_df` data frame will have five rows
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(5)

  # Expect that the `rownum` values in `footnotes_df` will be 1:5
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(rownum) %>%
    expect_equal(1:5)

  # Expect that the `text` in `footnotes_df` will be the same for
  # all five rows
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(footnotes) %>%
    unlist() %>%
    unique() %>%
    expect_equal("Five rows footnote.")

  # Expect that the `location` in `footnotes_df` is 'data' for all five rows
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(locname) %>%
    unique() %>%
    expect_equal("data")

  # Expect that the `colname` in `footnotes_df` is 'hp' for all five rows
  dt_footnotes_get(data = tab) %>%
    dplyr::pull(colname) %>%
    unique() %>%
    expect_equal("hp")

  # Expect an error in `tab_footnote` when a value for `rows` isn't
  # in the table
  expect_error(
    data %>%
      tab_footnote(
        footnote = "Footnote error.",
        locations = cells_body(columns = "disp", rows = "Mazda RX7")
      )
  )

  # Apply a footnote to a single data cell; this time, use `c()`
  # to specify the `rows`
  tab <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_body(columns = "disp", rows = c("Mazda RX4"))
    )

  # Expect that the internal `footnotes_df` data frame will have
  # a single row
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(1)

  # Expect certain values for each of the columns in the
  # single-row `footnotes_df` data frame
  dt_footnotes_get(data = tab) %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "data", NA_character_, "disp", "5", "1",
        NA_character_, "A footnote.", "auto"
      )
    )

  # Apply a footnote to a single data cell; this time, use `c()`
  # to specify the `columns`
  tab <-
    data %>%
    tab_footnote(
      footnote = "A footnote.",
      locations = cells_body(columns = c(disp, hp), rows = "Mazda RX4")
    )

  # Expect that the internal `footnotes_df` data frame will have two rows
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(2)

  # Expect certain values for each of the columns in the two rows
  # of the `footnotes_df` data frame
  dt_footnotes_get(data = tab)[1, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "data", NA_character_, "disp", "5", "1",
        NA_character_, "A footnote.", "auto"
      )
    )

  dt_footnotes_get(data = tab)[2, ] %>%
    unlist() %>%
    unname() %>%
    expect_equal(
      c(
        "data", NA_character_, "hp", "5", "1",
        NA_character_, "A footnote.", "auto"
      )
    )

  # Use the `data_2` gt table as `tab`
  tab <- data_2

  # Expect that the internal `footnotes_df` data frame
  # will have four rows
  dt_footnotes_get(data = tab) %>%
    nrow() %>%
    expect_equal(4)

  # Expect that the internal `footnotes_df` data frame will have
  # its `locname` column entirely populated with `columns_columns`
  # and `columns_groups`
  dt_footnotes_get(data = tab) %>%
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
      c(
        "1 German cars only.",
        "2 The most important details.",
        "3 AWD = All Wheel Drive, RWD = Rear Wheel Drive.",
        "4 Prices in USD."
      )
    )

  # Expect that the two sets of footnote marks (1st set are
  # throughout the table, 2nd set are in the footer) are in
  # the correct order
  tbl_html %>%
    selection_text(selection = "[class='gt_footnote_marks']") %>%
    tidy_gsub("\\s+", "") %>%
    expect_equal(rep(as.character(1:4), 2))
})

test_that("The footnotes table is structured correctly", {

  # Extract `footnotes_resolved` and `list_of_summaries`
  footnotes_tbl <- dt_footnotes_get(data = data_3)

  # Expect that the `footnotes_resolved` object inherits
  # from `tbl_df`
  expect_s3_class(footnotes_tbl, "tbl_df")

  # Expect that there are specific column names in
  # this tibble
  expect_equal(
    colnames(footnotes_tbl),
    c("locname", "grpname", "colname", "locnum", "rownum",
      "colnum", "footnotes", "placement")
  )

  # Expect that there are 4 rows in this tibble
  expect_equal(nrow(footnotes_tbl), 4)

  # Expect specific values to be in `footnotes_resolved`
  expect_equal(
    footnotes_tbl$locname,
    c("summary_cells", "summary_cells",
      "grand_summary_cells", "grand_summary_cells")
  )
  expect_equal(footnotes_tbl$locnum, c(5, 5, 6, 6))
  expect_equal(footnotes_tbl$grpname, c("BMW", "Audi", "::GRAND_SUMMARY", "::GRAND_SUMMARY"))
  expect_equal(footnotes_tbl$colname, rep("msrp", 4))
  expect_equal(footnotes_tbl$colnum, rep(NA_integer_, 4))
  expect_equal(
    unlist(footnotes_tbl$footnotes),
    c("Average price for BMW and Audi.", "Average price for BMW and Audi.",
      "Maximum price across all cars.", "Minimum price across all cars.")
  )
  expect_equal(footnotes_tbl$placement, rep("auto", 4))

  # Extract `footnotes_resolved`
  footnotes_tbl <- dt_footnotes_get(data = data_4)

  # Expect that the `footnotes_resolved` object inherits
  # from `tbl_df`
  expect_s3_class(footnotes_tbl, "tbl_df")

  # Expect that there are specific column names in
  # this tibble
  expect_equal(
    colnames(footnotes_tbl),
    c(
      "locname", "grpname", "colname", "locnum",
      "rownum", "colnum", "footnotes", "placement"
    )
  )

  # Expect that there are 2 rows in this tibble
  expect_equal(nrow(footnotes_tbl), 2)

  # Expect specific values to be in `footnotes_resolved`
  expect_equal(footnotes_tbl$locname, c("subtitle", "title"))
  expect_equal(footnotes_tbl$grpname, c(NA_character_, NA_character_))
  expect_equal(footnotes_tbl$colname, c(NA_character_, NA_character_))
  expect_equal(footnotes_tbl$locnum, c(2, 1))
  expect_equal(footnotes_tbl$rownum, c(NA_integer_, NA_integer_))
  expect_equal(footnotes_tbl$colnum, c(NA_integer_, NA_integer_))
  expect_equal(
    unlist(footnotes_tbl$footnotes),
    c("All values in USD.", "Standard and Poor 500.")
  )
  expect_equal(footnotes_tbl$placement, c("auto", "auto"))

  # Create a `tbl_html` object from the `data_4` object
  tbl_html <-
    data_4 %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the title and subtitle have the correct
  # footnote glyphs applied
  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal']") %>%
    expect_equal("S&P 5001")

  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border']") %>%
    expect_equal("Open and Close Values2")
})

test_that("The `list_of_summaries` table is structured correctly", {

  gtcars_built <-
    gtcars %>%
    dplyr::filter(ctry_origin == "Germany") %>%
    dplyr::group_by(mfr) %>%
    dplyr::top_n(3, msrp) %>%
    dplyr::ungroup() %>%
    dplyr::select(mfr, model, drivetrain, msrp) %>%
    gt(rowname_col = "model", groupname_col = "mfr") %>%
    summary_rows(
      groups = c("BMW", "Audi"),
      columns = msrp,
      fns = list(
        ~mean(., na.rm = TRUE),
        ~min(., na.rm = TRUE)
      )
    ) %>%
    grand_summary_rows(
      columns = msrp,
      fns = list(
        ~min(., na.rm = TRUE),
        ~max(., na.rm = TRUE)
      )
    ) %>%
    build_data(context = "html")

  gtcars_built_summary_df <- dt_summary_df_get(data = gtcars_built)
  gtcars_built_summary_df_data <- dt_summary_df_data_get(data = gtcars_built)
  gtcars_built_summary_df_display <- dt_summary_df_display_get(data = gtcars_built)

  # Expect that the list of summaries has length `2`
  expect_equal(length(gtcars_built_summary_df), 2)

  # Expect specific names in the `list_of_summaries` list
  expect_equal(
    names(gtcars_built_summary_df),
    c("summary_df_data_list", "summary_df_display_list")
  )

  # Expect three tibbles in the `summary_df_data_list` component
  expect_equal(length(gtcars_built_summary_df_data$summary_df_data_list), 3)

  # Expect three tibbles in the `summary_df_display_list` component
  expect_equal(length(gtcars_built_summary_df_display$summary_df_display_list), 3)

  # Expect specific names for the subcomponents of the
  # `summary_df_data_list` and `summary_df_data_list`
  # parent components
  expect_equal(
    names(gtcars_built_summary_df_data$summary_df_data_list),
    c("BMW", "Audi", "::GRAND_SUMMARY")
  )
  expect_equal(
    names(gtcars_built_summary_df_display$summary_df_display_list),
    c("::GRAND_SUMMARY", "Audi", "BMW")
  )

  # Expect formatted cell values with no HTML footnote markup
  expect_equal(
    gtcars_built_summary_df_display$summary_df_display_list$`::GRAND_SUMMARY`$msrp,
    c("56000", "140700")
  )

  expect_equal(
    gtcars_built_summary_df_display$summary_df_display_list$Audi$msrp,
    c("113233.3", "108900.0")
  )

  expect_equal(
    gtcars_built_summary_df_display$summary_df_display_list$BMW$msrp,
    c("116066.7", "94100.0")
  )
})

test_that("Footnotes with no location are rendered correctly", {

  gt_tbl <- gt(data = exibble[1, ])

  gt_footnotes_1 <-
    gt_tbl %>%
    tab_footnote(footnote = "A footnote.")

  # Take snapshots of `gt_footnotes_1`
  gt_footnotes_1 %>% render_as_html() %>% expect_snapshot()
  gt_footnotes_1 %>% as_latex() %>% as.character() %>% expect_snapshot()
  gt_footnotes_1 %>% as_rtf() %>% expect_snapshot()

  gt_footnotes_2 <-
    gt_tbl %>%
    tab_footnote(footnote = "A footnote.") %>%
    tab_footnote(footnote = "A second footnote.") %>%
    tab_footnote(footnote = "location note", locations = cells_body(1, 1))

  gt_footnotes_3 <-
    gt_tbl %>%
    tab_footnote(footnote = "location note", locations = cells_body(1, 1)) %>%
    tab_footnote(footnote = "A footnote.") %>%
    tab_footnote(footnote = "A second footnote.")

  # Expect that `gt_footnotes_2` and `gt_footnotes_3` should be rendered the
  # same across the supported formats
  expect_equal(
    gt_footnotes_2 %>% render_as_html(), gt_footnotes_3 %>% render_as_html()
  )
  expect_equal(
    gt_footnotes_2 %>% as_latex() %>% as.character(),
    gt_footnotes_3 %>% as_latex() %>% as.character()
  )
  expect_equal(
    gt_footnotes_2 %>% as_rtf(), gt_footnotes_3 %>% as_rtf()
  )

  gt_footnotes_4 <-
    gt_tbl %>%
    tab_footnote(footnote = "A footnote.") %>%
    tab_footnote(footnote = "A footnote.")

  # Take snapshots of `gt_footnotes_4`
  gt_footnotes_4 %>% render_as_html() %>% expect_snapshot()
  gt_footnotes_4 %>% as_latex() %>% as.character() %>% expect_snapshot()
  gt_footnotes_4 %>% as_rtf() %>% expect_snapshot()

  gt_footnotes_5 <-
    gt_tbl %>%
    tab_footnote(footnote = "A footnote.") %>%
    tab_footnote(footnote = "A footnote.", locations = cells_body(1, 1))

  # Take snapshots of `gt_footnotes_5`
  gt_footnotes_5 %>% render_as_html() %>% expect_snapshot()
  gt_footnotes_5 %>% as_latex() %>% as.character() %>% expect_snapshot()
  gt_footnotes_5 %>% as_rtf() %>% expect_snapshot()

  gt_footnotes_6 <-
    gt_tbl %>%
    tab_footnote(footnote = "A footnote.") %>%
    tab_footnote(footnote = "A second footnote.") %>%
    tab_footnote(footnote = "location note", locations = cells_body(1, 1)) %>%
    tab_options(footnotes.multiline = FALSE)

  # Take snapshots of `gt_footnotes_6`
  gt_footnotes_6 %>% render_as_html() %>% expect_snapshot()
  gt_footnotes_6 %>% as_latex() %>% as.character() %>% expect_snapshot()
  gt_footnotes_6 %>% as_rtf() %>% expect_snapshot()
})

test_that("The final placement of footnotes is correct with the 'auto' mode", {

  footnote_marks <- c("mark_1", "mark_2")

  # Expect a footnote mark to the left of the right-aligned number
  # (the `gt()` function will, by default, align numeric values to the right)
  exibble[1, 1] %>%
    gt() %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal(paste0("mark_1", "\U000A0", "0.1111"))

  # Expect a footnote mark to the right of the center-aligned number
  # (this turns off the auto-alignment option in the `gt()` function)
  exibble[1, 1] %>%
    gt(auto_align = FALSE) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_center']") %>%
    expect_equal("0.1111mark_1")

  # Expect a footnote mark to the right of the left-aligned character value
  exibble[1, 2] %>%
    gt() %>%
    tab_footnote(footnote = "note", locations = cells_body(char, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_left']") %>%
    expect_equal("apricotmark_1")

  # Expect a footnote mark to the right of the center-aligned character value
  exibble[1, 3] %>%
    gt() %>%
    tab_footnote(footnote = "note", locations = cells_body(fctr, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_center']") %>%
    expect_equal("onemark_1")

  # Expect a footnote mark to the right of the left-aligned number value
  # (the `tab_style()` statement decided the final alignment)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = cell_text(size = "smaller", align = "left"),
      locations = cells_body(num, 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>% # The .gt_right class is overridden
    expect_equal("0.11mark_1")

  # Expect a footnote mark to the left of the right-aligned number value
  # (the second `tab_style()` statement decided the final alignment)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = cell_text(size = "smaller", align = "left"),
      locations = cells_body(num, 1)
    ) %>%
    tab_style(
      style = cell_text(align = "right"),
      locations = cells_body(num, 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal(paste0("mark_1", "\U000A0", "0.11"))

  # Expect a footnote mark to the right of the left-aligned number value
  # (the first `tab_style()` statement with literal CSS style rules is more
  # specific because these rules are appended last)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = "text-align: left",
      locations = cells_body(num, 1)
    ) %>%
    tab_style(
      style = cell_text(size = "smaller", align = "left"),
      locations = cells_body(num, 1)
    ) %>%
    tab_style(
      style = cell_text(align = "right"),
      locations = cells_body(num, 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal("0.11mark_1")

  # Expect a footnote mark to the right of the left-aligned number value
  # (the final 'text-align' rule in `tab_style()` determines the alignment)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = "text-align: right; background: green; text-align: left;",
      locations = cells_body(num, 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal("0.11mark_1")

  # Expect a footnote mark to the left of the right-aligned number value
  # (the !important 'text-align' rule in `tab_style()` determines the alignment)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = "text-align: right !important; background: green; text-align: left;",
      locations = cells_body(num, 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal(paste0("mark_1", "\U000A0", "0.11"))

  # Expect a footnote mark to the right of the left-aligned number value
  # (the final !important 'text-align' rule in `tab_style()` determines the alignment)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    tab_style(
      style = "text-align: right !important; text-align: left !important;",
      locations = cells_body(columns = num, rows = 1)
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_right']") %>%
    expect_equal("0.11mark_1")

  # Expect a footnote mark to the right of the center-aligned number value
  # (the center alignment was set by `cols_align()`)
  exibble[1, 1] %>%
    gt() %>%
    fmt_number(columns = num) %>%
    cols_align(align = "center", columns = num) %>%
    tab_footnote(footnote = "note", locations = cells_body(num, 1)) %>%
    opt_footnote_marks(marks = footnote_marks) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_center']") %>%
    expect_equal("0.11mark_1")
})

test_that("Footnotes are correctly placed with text produced by `fmt_markdown()`", {

  exibble[1, 2] %>%
    gt() %>%
    fmt_markdown(columns = char) %>%
    tab_footnote(footnote = "note", locations = cells_body(char, 1)) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_left']") %>%
    expect_equal("apricot1")

  exibble[1, 2] %>%
    gt() %>%
    fmt_markdown(columns = char) %>%
    tab_footnote(footnote = "note", locations = cells_body(char, 1)) %>%
    render_as_html() %>%
    expect_snapshot()

  exibble[1, 2] %>%
    gt() %>%
    fmt_markdown(columns = char) %>%
    tab_footnote(footnote = "note", locations = cells_body(char, 1), placement = "left") %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_row gt_left']") %>%
    expect_equal(paste0("1", "\U000A0", "apricot\n"))

  exibble[1, 2] %>%
    gt() %>%
    fmt_markdown(columns = char) %>%
    tab_footnote(footnote = "note", locations = cells_body(char, 1), placement = "left") %>%
    render_as_html() %>%
    expect_snapshot()
})

test_that("Footnotes work with group labels in 2-column stub arrangements", {

  gt_tbl <-
    pizzaplace %>%
    dplyr::filter(name %in% c("soppressata", "peppr_salami")) %>%
    dplyr::group_by(name, size) %>%
    dplyr::summarize(`Pizzas Sold` = dplyr::n(), .groups = "drop") %>%
    gt(rowname_col = "size", groupname_col = "name") %>%
    summary_rows(
      groups = everything(),
      columns = `Pizzas Sold`,
      fns = list(TOTAL = "sum"),
      fmt = list(~ fmt_number(., decimals = 0, use_seps = TRUE))
    ) %>%
    tab_options(row_group.as_column = TRUE) %>%
    tab_footnote(
      footnote = "The Pepper-Salami.",
      locations = cells_row_groups(groups = "peppr_salami")
    )

  # Take snapshots of `gt_tbl`
  gt_tbl %>% render_as_html() %>% expect_snapshot()
  gt_tbl %>% as_latex() %>% as.character() %>% expect_snapshot()
  gt_tbl %>% as_rtf() %>% expect_snapshot()
})
