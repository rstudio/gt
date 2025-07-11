# Test data setup
test_data <- data.frame(
  mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
  model = c("GT", "F-150", "X5", "X3", "A4"),
  trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
  year = c(2017, 2018, 2019, 2020, 2021),
  hp = c(647, 450, 300, 228, 261),
  msrp = c(447000, 28000, 57000, 34000, 37000)
)

test_that("Basic multicolumn stub footnotes render correctly", {

  # Create table with multicolumn stub and footnotes
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Three-Column Stub with Footnotes") %>%
    tab_footnote(
      footnote = "Target: GT",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "Target: Ford",
      locations = cells_stub(rows = 1, columns = "mfr")
    )

  # Test HTML output
  expect_snapshot(cat(render_as_html(gt_tbl)))

  # Test LaTeX output
  expect_snapshot(as.character(as_latex(gt_tbl)))
})

test_that("Multicolumn stub footnotes with visual order priority", {

  # Create table with footnotes in call order ('Ford' first, then 'GT')
  gt_tbl_1 <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Call Order: Ford First, GT Second") %>%
    tab_footnote(
      footnote = "Target: Ford",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "Target: GT",
      locations = cells_stub(rows = 1, columns = "model")
    )

  # Create table with footnotes in reverse call order ('GT' first, then 'Ford')
  gt_tbl_2 <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Call Order: GT First, Ford Second") %>%
    tab_footnote(
      footnote = "Target: GT",
      locations = cells_stub(rows = 1, columns = "model")
      ) %>%
    tab_footnote(
      footnote = "Target: Ford",
      locations = cells_stub(rows = 1, columns = "mfr")
    )

  # Both should render with footnotes in visual order ('Ford' -> 1, 'GT' -> 2)
  expect_snapshot(cat(render_as_html(gt_tbl_1)))
  expect_snapshot(cat(render_as_html(gt_tbl_2)))
})

test_that("Multiple rows with multicolumn stub footnotes", {

  # Create table with footnotes on multiple rows
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Multiple Rows with Footnotes") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
      ) %>%
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
      ) %>%
    tab_footnote(
      footnote = "BMW manufacturer",
      locations = cells_stub(rows = 3, columns = "mfr")
      ) %>%
    tab_footnote(
      footnote = "X5 model",
      locations = cells_stub(rows = 3, columns = "model")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Multicolumn stub footnotes with row groups as conventional rows", {

  # Create grouped data
  grouped_data <-
    test_data %>%
    dplyr::mutate(
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  # Create table with row groups and footnotes
  gt_tbl <-
    grouped_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), groupname_col = "group") %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Multicolumn Stub with Row Groups") %>%
    tab_footnote(
      footnote = "Ford note",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "GT note",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "BMW note",
      locations = cells_stub(rows = 3, columns = "mfr")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Multicolumn stub footnotes with row groups as columns", {

  # Create grouped data
  grouped_data <-
    test_data %>%
    dplyr::mutate(
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  # Create table with row groups as columns and footnotes
  gt_tbl <-
    grouped_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), groupname_col = "group") %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Multicolumn Stub with Row Groups as Columns") %>%
    tab_options(row_group.as_column = TRUE) %>%
    tab_footnote(
      footnote = "Ford note",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "GT note",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "BMW note",
      locations = cells_stub(rows = 3, columns = "mfr")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("All stub columns with footnotes", {

  # Create table with footnotes on all three stub columns
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "All Stub Columns with Footnotes") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "Base trim",
      locations = cells_stub(rows = 1, columns = "trim")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Footnotes on non-first row with multicolumn stub", {

  # Create table with footnotes on second row
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Footnotes on Second Row") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 2, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "F-150 model",
      locations = cells_stub(rows = 2, columns = "model")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Mixed stub and data column footnotes", {

  # Create table with both stub and data column footnotes
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Mixed Stub and Data Footnotes") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "High horsepower",
      locations = cells_body(columns = "hp", rows = 1)
    ) %>%
    tab_footnote(
      footnote = "Premium price",
      locations = cells_body(columns = "msrp", rows = 1)
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Two-column stub footnotes", {

  # Create table with just two stub columns
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model")) %>%
    tab_stubhead(label = c("Manufacturer", "Model")) %>%
    tab_header(title = "Two-Column Stub with Footnotes") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Single stub column footnotes (regression test)", {

  # Create table with single stub column (should still work)
  gt_tbl <-
    test_data %>%
    gt(rowname_col = "mfr") %>%
    tab_stubhead(label = "Manufacturer") %>%
    tab_header(title = "Single Stub Column") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1)
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})

test_that("Footnotes with specific row references", {

  # Create table using row indices instead of row names
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim")) %>%
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) %>%
    tab_header(title = "Specific Row References") %>%
    tab_footnote(
      footnote = "Ford note",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) %>%
    tab_footnote(
      footnote = "BMW note",
      locations = cells_stub(rows = 3, columns = "mfr")
    )

  expect_snapshot(cat(render_as_html(gt_tbl)))
})
