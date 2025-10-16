# LaTeX-specific tests for multicolumn stubs

# Test data setup
test_data <-
  dplyr::tibble(
    mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
    model = c("GT", "F-150", "X5", "X3", "A4"),
    trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
    year = c(2017, 2018, 2019, 2020, 2021),
    hp = c(647, 450, 300, 228, 261),
    msrp = c(447000, 28000, 57000, 34000, 37000)
  )

test_that("Basic multicolumn stub renders in LaTeX", {

  # Create table with multicolumn stub
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Three-Column Stub LaTeX")

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification with multiple stub columns
  expect_true(grepl("l\\|l\\|l\\|", latex_output))

  # Should not error
  expect_no_error(as_latex(gt_tbl))
})

test_that("Two-column stub renders in LaTeX", {

  # Create table with two stub columns
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_stubhead(label = c("Manufacturer", "Model")) |>
    tab_header(title = "Two-Column Stub LaTeX")

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|", latex_output))

  # Should not error
  expect_no_error(as_latex(gt_tbl))
})

test_that("Single stub column renders in LaTeX (regression test)", {

  # Create table with single stub column (should still work)
  gt_tbl <-
    test_data |>
    gt(rowname_col = "mfr") |>
    tab_stubhead(label = "Manufacturer") |>
    tab_header(title = "Single Stub Column LaTeX")

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain stub separator
  expect_true(grepl("l\\|", latex_output))
})

test_that("Multicolumn stub with footnotes renders in LaTeX", {

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

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain footnote text
  expect_true(grepl("Target: Ford", latex_output))
  expect_true(grepl("Target: GT", latex_output))
})

test_that("Multiple rows with multicolumn stub footnotes in LaTeX", {

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

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain all footnote text
  expect_true(grepl("Ford manufacturer", latex_output))
  expect_true(grepl("GT model", latex_output))
  expect_true(grepl("BMW manufacturer", latex_output))
  expect_true(grepl("X5 model", latex_output))
})

test_that("Multicolumn stub footnotes with row groups as conventional rows in LaTeX", {

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

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain group names
  expect_true(grepl("American & German", latex_output) || grepl("American \\\\& German", latex_output))
})

test_that("All stub columns with footnotes in LaTeX", {

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

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", latex_output))
  expect_true(grepl("GT model", latex_output))
  expect_true(grepl("Base trim", latex_output))
})

test_that("Footnotes on non-first row with multicolumn stub in LaTeX", {

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

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain footnotes
  expect_true(grepl("Ford manufacturer", latex_output))
  expect_true(grepl("F-150 model", latex_output))
})

test_that("Mixed stub and data column footnotes in LaTeX", {

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
      footnote = "GT model",
      locations = cells_stub(rows = 1, columns = "model")
    ) |>
    tab_footnote(
      footnote = "High horsepower",
      locations = cells_body(columns = "hp", rows = 1)
    ) |>
    tab_footnote(
      footnote = "Premium price",
      locations = cells_body(columns = "msrp", rows = 1)
    )

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain all footnotes
  expect_true(grepl("Ford manufacturer", latex_output))
  expect_true(grepl("GT model", latex_output))
  expect_true(grepl("High horsepower", latex_output))
  expect_true(grepl("Premium price", latex_output))
})

test_that("Multicolumn stub with styles renders in LaTeX", {

  # Create table with styles (original issue #2044 scenario)
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_header(title = "Styled Multicolumn Stub") |>
    tab_style(
      style = cell_fill(color = "lightblue"),
      locations = cells_stub(columns = "mfr")
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_stub(columns = "model")
    )

  # Test LaTeX output - this should not error (original issue)
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|l\\|", latex_output))
})

test_that("Multicolumn stub with per-column styling in LaTeX", {

  # Create test data with multi-column stub
  style_data <-
    dplyr::tibble(
      region = c("Americas", "Americas", "Europe", "Europe"),
      country = c("USA", "Canada", "Germany", "France"),
      gdp = c(23.3, 1.7, 4.2, 2.7)
    )

  # Test per-column styling with two-column stub
  gt_tbl <-
    style_data |>
    gt(rowname_col = c("region", "country")) |>
    tab_style(
      style = cell_fill(color = "lightblue"),
      locations = cells_stub(columns = "region")
    ) |>
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_stub(columns = "country")
    )

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|", latex_output))
})

test_that("Multicolumn stub with row-specific styling in LaTeX", {

  # Create test data
  style_data <-
    dplyr::tibble(
      region = c("Americas", "Americas", "Europe", "Europe"),
      country = c("USA", "Canada", "Germany", "France"),
      code = c("US", "CA", "DE", "FR"),
      gdp = c(23.3, 1.7, 4.2, 2.7)
    )

  # Test row-specific styling within columns
  gt_tbl <-
    style_data |>
    gt(rowname_col = c("region", "country", "code")) |>
    tab_style(
      style = cell_fill(color = "orange"),
      locations = cells_stub(columns = "country", rows = c(1, 3))
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_stub(columns = "region", rows = 2)
    )

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|l\\|", latex_output))
})

test_that("Multicolumn stub with summary rows in LaTeX", {

  # Test with summary rows and different stub configurations
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    summary_rows(
      groups = TRUE,
      columns = c(hp, msrp),
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE)
      )
    )

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|", latex_output))
})

test_that("Multicolumn stub with spanners in LaTeX", {

  # Create table with spanners
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_spanner(
      label = "Vehicle Info",
      columns = c(trim, year)
    ) |>
    tab_spanner(
      label = "Performance & Price",
      columns = c(hp, msrp)
    )

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain spanner labels
  expect_true(grepl("Vehicle Info", latex_output))
  expect_true(grepl("Performance", latex_output))
})

test_that("Complex multicolumn stub scenario in LaTeX", {

  # Create grouped data
  grouped_data <-
    dplyr::mutate(
      test_data,
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  # Create complex table with groups, spanners, styles, and footnotes
  gt_tbl <-
    grouped_data |>
    gt(
      rowname_col = c("mfr", "model", "trim"),
      groupname_col = "group"
    ) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_spanner(
      label = "Specifications",
      columns = c(year, hp)
    ) |>
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = cells_stub(columns = "mfr")
    ) |>
    tab_footnote(
      footnote = "American manufacturer",
      locations = cells_stub(rows = 1, columns = "mfr")
    ) |>
    summary_rows(
      groups = TRUE,
      columns = c(hp, msrp),
      fns = list(avg = ~mean(., na.rm = TRUE))
    )

  # This is the ultimate test - should handle everything without error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper structure
  expect_true(grepl("l\\|l\\|l\\|", latex_output))
})

test_that("Hierarchical stub merging in LaTeX output", {

  # Create table with repeated values that should be merged
  hierarchical_data <-
    dplyr::tibble(
      region = c("Americas", "Americas", "Americas", "Europe", "Europe"),
      country = c("USA", "USA", "Canada", "Germany", "France"),
      city = c("New York", "Los Angeles", "Toronto", "Berlin", "Paris"),
      value = c(10, 20, 30, 40, 50)
    )

  gt_tbl <-
    hierarchical_data |>
    gt(rowname_col = c("region", "country", "city"))

  # Test LaTeX output
  latex_output <- as.character(as_latex(gt_tbl))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|l\\|", latex_output))

  # Note: Hierarchical merging (hiding repeated values) should be visible
  # in the LaTeX output, but we're mainly testing that it doesn't error
})

test_that("Multicolumn stub order is preserved in LaTeX", {

  # Test that stub columns appear in the same order as specified
  ordered_data <-
    dplyr::tibble(
      z_col = c("Z1", "Z2", "Z3"),
      a_col = c("A1", "A2", "A3"),
      m_col = c("M1", "M2", "M3"),
      value = c(1, 2, 3)
    )

  # Order should be preserved as specified, not alphabetical
  gt_tbl <- gt(ordered_data, rowname_col = c("z_col", "a_col", "m_col"))

  # Check that rendering preserves order
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification with 3 stub columns
  expect_true(grepl("l\\|l\\|l\\|", latex_output))

  # Check that data values appear in order (Z1 before A1 before M1)
  z1_pos <- regexpr("Z1", latex_output)
  a1_pos <- regexpr("A1", latex_output)
  m1_pos <- regexpr("M1", latex_output)

  # Order should be Z1, then A1, then M1 in the first data row
  expect_true(z1_pos[1] > 0)
  expect_true(a1_pos[1] > 0)
  expect_true(m1_pos[1] > 0)
  expect_true(z1_pos[1] < a1_pos[1])
  expect_true(a1_pos[1] < m1_pos[1])
})

test_that("Empty multicolumn stub cells handled correctly in LaTeX", {

  # Create data with some empty cells
  sparse_data <-
    dplyr::tibble(
      col1 = c("A", "A", "B", "B"),
      col2 = c("X", "", "Y", ""),
      col3 = c("1", "2", "3", "4"),
      value = c(10, 20, 30, 40)
    )

  gt_tbl <- gt(sparse_data, rowname_col = c("col1", "col2", "col3"))

  # Should handle empty strings without error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain proper column specification
  expect_true(grepl("l\\|l\\|l\\|", latex_output))
})

test_that("LaTeX special characters in multicolumn stub", {

  # Create data with LaTeX special characters
  special_data <-
    dplyr::tibble(
      category = c("Type_A", "Type_B", "Type_C"),
      subcategory = c("Sub#1", "Sub#2", "Sub#3"),
      item = c("Item&1", "Item&2", "Item&3"),
      value = c(100, 200, 300)
    )

  gt_tbl <- gt(special_data, rowname_col = c("category", "subcategory", "item"))

  # Should handle special characters properly
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Special characters should be escaped
  expect_true(grepl("\\\\#", latex_output) || grepl("\\\\&", latex_output) || grepl("\\\\_", latex_output))
})

test_that("tab_stubhead() with multiple labels renders correctly in LaTeX", {

  # Create table with three stub columns and three labels
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim"))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain all three labels in the header
  expect_true(grepl("Manufacturer", latex_output))
  expect_true(grepl("Model", latex_output))
  expect_true(grepl("Trim", latex_output))

  # Labels should appear in order (not as a multicolumn)
  # Extract the header line
  header_match <- regexpr("Manufacturer.*Model.*Trim", latex_output)
  expect_true(header_match > 0)
})

test_that("tab_stubhead() with two labels renders correctly in LaTeX", {

  # Create table with two stub columns and two labels
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_stubhead(label = c("Manufacturer", "Model"))

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain both labels
  expect_true(grepl("Manufacturer", latex_output))
  expect_true(grepl("Model", latex_output))

  # Labels should appear before the data columns
  mfr_pos <- regexpr("Manufacturer", latex_output)
  model_pos <- regexpr("Model", latex_output)
  year_pos <- regexpr("year", latex_output)

  expect_true(mfr_pos[1] < model_pos[1])
  expect_true(model_pos[1] < year_pos[1])
})

test_that("tab_stubhead() with single label still works (regression)", {

  # Create table with single stub column and single label
  gt_tbl <-
    test_data |>
    gt(rowname_col = "mfr") |>
    tab_stubhead(label = "Manufacturer")

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain the label
  expect_true(grepl("Manufacturer", latex_output))
})

test_that("tab_stubhead() with fewer labels than columns uses only first label", {

  # Create table with three stub columns but only one label
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = "Stub Header")

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain multicolumn spanning all stub columns
  expect_true(grepl("\\\\multicolumn\\{3\\}", latex_output))
  expect_true(grepl("Stub Header", latex_output))
})

test_that("tab_stubhead() labels maintain order in LaTeX", {

  # Test with non-alphabetical column order
  ordered_data <-
    dplyr::tibble(
      z_col = c("Z1", "Z2"),
      a_col = c("A1", "A2"),
      m_col = c("M1", "M2"),
      value = c(1, 2)
    )

  gt_tbl <-
    ordered_data |>
    gt(rowname_col = c("z_col", "a_col", "m_col")) |>
    tab_stubhead(label = c("Z Label", "A Label", "M Label"))

  latex_output <- as.character(as_latex(gt_tbl))

  # Labels should appear in the specified order
  z_pos <- regexpr("Z Label", latex_output)
  a_pos <- regexpr("A Label", latex_output)
  m_pos <- regexpr("M Label", latex_output)

  expect_true(z_pos[1] > 0)
  expect_true(a_pos[1] > 0)
  expect_true(m_pos[1] > 0)
  expect_true(z_pos[1] < a_pos[1])
  expect_true(a_pos[1] < m_pos[1])
})

test_that("tab_stubhead() with styles works in LaTeX multicolumn stub", {

  # Create table with stubhead labels and styles
  gt_tbl <-
    test_data |>
    gt(rowname_col = c("mfr", "model", "trim")) |>
    tab_stubhead(label = c("Manufacturer", "Model", "Trim")) |>
    tab_style(
      style = cell_fill(color = "lightblue"),
      locations = cells_stub(columns = "mfr")
    )

  # Should not error
  expect_no_error(as_latex(gt_tbl))

  latex_output <- as.character(as_latex(gt_tbl))

  # Should contain all labels
  expect_true(grepl("Manufacturer", latex_output))
  expect_true(grepl("Model", latex_output))
  expect_true(grepl("Trim", latex_output))
})
