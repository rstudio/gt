test_data <-
  dplyr::tibble(
    mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
    model = c("GT", "F-150", "X5", "X3", "A4"),
    trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
    year = c(2017, 2018, 2019, 2020, 2021),
    hp = c(647, 450, 300, 228, 261),
    msrp = c(447000, 28000, 57000, 34000, 37000)
  )

test_that("Basic multicolumn stub renders in RTF", {

  # Create table with multicolumn stub
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Three-Column Stub RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all stub column data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("GT", rtf_output))
  expect_true(grepl("Base", rtf_output))
})

test_that("Two-column stub renders in RTF", {

  # Create table with two stub columns
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_stubhead(label = c("Manufacturer", "Model")) |>
    tab_header(title = "Two-Column Stub RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain stub column data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("GT", rtf_output))
})

test_that("Single stub column renders in RTF (regression test)", {

  # Create table with single stub column
  gt_tbl <-
    test_data |>
    gt(rowname_col = "mfr") |>
    tab_stubhead(label = "Manufacturer") |>
    tab_header(title = "Single Stub Column RTF")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain stub data
  expect_true(grepl("Ford", rtf_output))
})

test_that("Multicolumn stub with footnotes renders in RTF", {

  # Create table with multicolumn stub and footnotes
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Three-Column Stub with Footnotes") |>
    tab_footnote(
      footnote = "Target: GT",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "Target: Ford",
      locations = cells_stub(rows = 1, columns = "mfr")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain footnote text
  expect_true(grepl("Target: Ford", rtf_output))
  expect_true(grepl("Target: GT", rtf_output))
})

test_that("Multiple rows with multicolumn stub footnotes in RTF", {

  # Create table with footnotes on multiple rows
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Multiple Rows with Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "BMW manufacturer",
      locations = cells_stub(rows = 3, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "X5 model",
      locations = cells_stub(rows = 3, columns = "model")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnote text
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("GT model", rtf_output))
  expect_true(grepl("BMW manufacturer", rtf_output))
  expect_true(grepl("X5 model", rtf_output))
})

test_that("Multicolumn stub footnotes with row groups as conventional rows in RTF", {

  # Create grouped data
  grouped_data <-
    dplyr::mutate(
      test_data,
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  # Create table with row groups and footnotes
  gt_tbl <-
    grouped_data |>
    gt(
      rowname_col = c("mfr", "model", "trim"),
      groupname_col = "group"
    ) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Multicolumn Stub with Row Groups") |>
    tab_footnote(
      footnote = "Ford note",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT note",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "BMW note",
      locations = cells_stub(rows = 3, columns = "mfr")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain group names
  expect_true(
    grepl("American & German", rtf_output) ||
      grepl("American \\\\& German", rtf_output)
  )
})

test_that("All stub columns with footnotes in RTF", {

  # Create table with footnotes on all three stub columns
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "All Stub Columns with Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "Base trim",
      locations = cells_stub(rows = 1, columns = "trim")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("GT model", rtf_output))
  expect_true(grepl("Base trim", rtf_output))
})

test_that("Footnotes on non-first row with multicolumn stub in RTF", {

  # Create table with footnotes on second row
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Footnotes on Second Row") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 2, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "F-150 model",
      locations = cells_stub(rows = 2, columns = "model")
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("F-150 model", rtf_output))
})

test_that("Mixed stub and data column footnotes in RTF", {

  # Create table with both stub and data column footnotes
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Mixed Stub and Data Footnotes") |>
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "High HP",
      locations = cells_body(columns = "hp", rows = 1)
    )

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", rtf_output))
  expect_true(grepl("High HP", rtf_output))
})

test_that("Hierarchical stub display in RTF", {

  # Create test data with repeated manufacturer values
  hierarchical_data <-
    dplyr::tibble(
      mfr = c("Ford", "Ford", "Ford", "BMW", "BMW"),
      model = c("GT", "F-150", "Mustang", "X5", "X3"),
      trim = c("Base", "XLT", "GT", "xDrive35i", "sDrive28i"),
      year = c(2017, 2018, 2019, 2020, 2021),
      hp = c(647, 450, 460, 300, 228)
    )

  gt_tbl <-
    hierarchical_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Hierarchical Stub Display")

  rtf_output <- as.character(as_rtf(gt_tbl))

  # Should not error
  expect_no_error(as_rtf(gt_tbl))

  # Should contain the data
  expect_true(grepl("Ford", rtf_output))
  expect_true(grepl("BMW", rtf_output))
})
