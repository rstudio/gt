test_that("rows_hide() and rows_unhide() do not error when no rows selected", {

  # when no rows selected, gt table return unaltered
  expect_no_error(gt(exibble) |> rows_hide())

  # Selecting rows that don't exist should not change the hidden rows state
  tbl_base <- gt(exibble, rowname_col = "row")
  tbl_hidden <- tbl_base |> rows_hide(rows = starts_with("xxxxxxxxxxxx"))

  # Both should have zero hidden rows
  expect_equal(
    gt:::dt_rows_hidden_get(tbl_base),
    gt:::dt_rows_hidden_get(tbl_hidden)
  )

  tbl_unhidden <- tbl_base |> rows_unhide(rows = starts_with("xxxxxxxxxxxx"))

  expect_equal(
    gt:::dt_rows_hidden_get(tbl_base),
    gt:::dt_rows_hidden_get(tbl_unhidden)
  )
})

test_that("rows_hide() works with integer indices", {

  tbl_hidden <- gt(exibble) |> rows_hide(rows = 1:3)

  # Extract hidden rows from the internal structure
  hidden_rows <- gt:::dt_rows_hidden_get(tbl_hidden)

  expect_equal(hidden_rows, 1:3)
})

test_that("rows_hide() works with row names in stub", {

  tbl_hidden <-
    gt(exibble, rowname_col = "row") |>
    rows_hide(rows = c("row_1", "row_2"))

  hidden_rows <- gt:::dt_rows_hidden_get(tbl_hidden)

  expect_equal(hidden_rows, c(1L, 2L))
})

test_that("rows_hide() works with logical expressions", {

  tbl_hidden <-
    gt(exibble) |>
    rows_hide(rows = num > 1000)

  hidden_rows <- gt:::dt_rows_hidden_get(tbl_hidden)

  # rows where num > 1000 are hidden
  expect_true(all(exibble$num[hidden_rows] > 1000, na.rm = TRUE))
})

test_that("rows_unhide() correctly reveals hidden rows", {

  tbl_hidden <-
    gt(exibble, rowname_col = "row") |>
    rows_hide(rows = everything())

  hidden_rows <- gt:::dt_rows_hidden_get(tbl_hidden)

  expect_equal(hidden_rows, 1:8)

  tbl_revealed <-
    tbl_hidden |>
    rows_unhide(rows = c("row_1", "row_5"))

  hidden_rows_after <- gt:::dt_rows_hidden_get(tbl_revealed)

  expect_equal(hidden_rows_after, c(2L, 3L, 4L, 6L, 7L, 8L))
})

test_that("rows_hide() is applied to gt_group", {

  # Create a gt_group object
  gt_tbl <- gt(exibble[1:4, ])
  gt_group_obj <- gt_group(gt_tbl, gt_tbl)

  # apply hide to table and group
  hide_gt_tbl <-
    gt_tbl |>
    rows_hide(rows = 1:2)

  hide_gt_group <-
    gt_group_obj |>
    rows_hide(rows = 1:2)

  # Expect identical if function applied before or after group is constructed
  expect_identical(hide_gt_group, gt_group(hide_gt_tbl, hide_gt_tbl))

  unhide_gt_tbl <-
    hide_gt_tbl |>
    rows_unhide(rows = 1)

  unhide_gt_group <-
    hide_gt_group |>
    rows_unhide(rows = 1)

  expect_identical(unhide_gt_group, gt_group(unhide_gt_tbl, unhide_gt_tbl))
})

test_that("hidden rows are excluded from rendered output", {

  # Create a table with hidden rows
  tbl <- gt(head(mtcars, 5), rownames_to_stub = TRUE)

  # Hide rows 2 and 4
  tbl_hidden <- tbl |> rows_hide(rows = c("Mazda RX4 Wag", "Hornet 4 Drive"))

  # Get the HTML output
  html_output <- as_raw_html(tbl_hidden)

  # The hidden row names should not appear in the output
  expect_false(grepl("Mazda RX4 Wag", html_output))
  expect_false(grepl("Hornet 4 Drive", html_output))

  # But non-hidden rows should appear
  expect_true(grepl("Mazda RX4", html_output))
  expect_true(grepl("Datsun 710", html_output))
  expect_true(grepl("Hornet Sportabout", html_output))
})

test_that("footnotes skip hidden rows in indexing", {

  tbl <-
    exibble[1:4, ] |>
    gt(rowname_col = "row") |>
    rows_hide(rows = "row_2") |>
    tab_footnote(
      footnote = "A note",
      locations = cells_body(columns = num, rows = "row_3")
    )

  # The footnote should still be applied correctly
  # (the row_3 is now the 2nd visible row)
  html_output <- as_raw_html(tbl)

  # The footnote should appear
  expect_true(grepl("A note", html_output))
})

test_that("styles targeting hidden rows are gracefully handled", {

  expect_no_error({
    tbl <-
      gtcars |>
      dplyr::select(mfr, model, year, hp, msrp) |>
      dplyr::slice_head(n = 10) |>
      gt() |>
      fmt_currency(columns = msrp, decimals = 0) |>
      tab_style(
        style = cell_fill(color = "lightgreen"),
        locations = cells_body(columns = msrp, rows = msrp > 200000)
      ) |>
      rows_hide(rows = msrp > 500000)

    as_raw_html(tbl)
  })

  # Verify the table renders and visible styled rows still have styles
  tbl <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice_head(n = 5) |>
    gt() |>
    fmt_currency(columns = msrp, decimals = 0) |>
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_body(columns = msrp, rows = msrp > 200000)
    ) |>
    rows_hide(rows = msrp > 400000)

  html_output <- as_raw_html(tbl)

  # The styled color should still appear for visible rows
  expect_true(grepl("90EE90", html_output))
})

test_that("footnotes targeting hidden rows are gracefully handled", {

  # Footnotes on rows that get hidden should not cause errors
  expect_no_error({
    tbl <-
      exibble[1:5, ] |>
      gt(rowname_col = "row") |>
      tab_footnote(
        footnote = "This row will be hidden",
        locations = cells_body(columns = num, rows = "row_2")
      ) |>
      rows_hide(rows = "row_2")

    as_raw_html(tbl)
  })

  # The footnote for the hidden row should not appear
  tbl <-
    exibble[1:5, ] |>
    gt(rowname_col = "row") |>
    tab_footnote(
      footnote = "Hidden row footnote",
      locations = cells_body(columns = num, rows = "row_2")
    ) |>
    tab_footnote(
      footnote = "Visible row footnote",
      locations = cells_body(columns = num, rows = "row_3")
    ) |>
    rows_hide(rows = "row_2")

  html_output <- as_raw_html(tbl)

  # Only the visible row's footnote should appear
  expect_false(grepl("Hidden row footnote", html_output))
  expect_true(grepl("Visible row footnote", html_output))
})

test_that("hiding all rows in a group removes the group header", {

  # Create a grouped table with cars from different countries
  tbl <-
    gtcars |>
    dplyr::filter(ctry_origin %in% c("Germany", "Italy", "United States")) |>
    dplyr::select(mfr, model, ctry_origin, hp, msrp) |>
    dplyr::slice_head(n = 4, by = ctry_origin) |>
    gt(groupname_col = "ctry_origin") |>
    fmt_currency(columns = msrp, decimals = 0) |>
    rows_hide(rows = hp < 570)

  html_output <- as_raw_html(tbl)

  # Germany group should not appear (all rows hidden)
  expect_false(grepl("Germany", html_output))

  # Italy and United States groups should still appear
  expect_true(grepl("Italy", html_output))
  expect_true(grepl("United States", html_output))
})

test_that("complex footnotes with hidden rows render correctly", {

  # This test validates that footnote numbering is correct when:
  # - Multiple footnotes target individual rows
  # - Some footnotes span across multiple rows (including hidden ones)
  # - Some rows are hidden
  # The final render should have correct sequential numbering with no gaps
  tbl <-
    countrypops |>
    dplyr::filter(country_name == "Brazil", year %in% 2017:2021) |>
    gt(rowname_col = "year") |>
    fmt_integer(columns = population) |>
    tab_footnote(
      footnote = "2017",
      locations = cells_body(columns = population, rows = year == 2017)
    ) |>
    tab_footnote(
      footnote = "2018",
      locations = cells_body(columns = population, rows = year == 2018)
    ) |>
    tab_footnote(
      footnote = "2019",
      locations = cells_body(columns = population, rows = year == 2019)
    ) |>
    tab_footnote(
      footnote = "2020",
      locations = cells_body(columns = population, rows = year == 2020)
    ) |>
    tab_footnote(
      footnote = "2021",
      locations = cells_body(columns = population, rows = year == 2021)
    ) |>
    tab_footnote(
      footnote = "2017-2018",
      locations = cells_body(columns = population, rows = year %in% c(2017, 2018))
    ) |>
    tab_footnote(
      footnote = "2018-2019",
      locations = cells_body(columns = population, rows = year %in% c(2018, 2019))
    ) |>
    tab_footnote(
      footnote = "2019-2020",
      locations = cells_body(columns = population, rows = year %in% c(2019, 2020))
    ) |>
    tab_footnote(
      footnote = "2020-2021",
      locations = cells_body(columns = population, rows = year %in% c(2020, 2021))
    ) |>
    rows_hide(rows = c("2018", "2020"))

  expect_snapshot_html(tbl)
})
