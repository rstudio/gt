# Test data setup
test_data <-
  data.frame(
    mfr = c("Ford", "Ford", "BMW", "BMW", "Audi"),
    model = c("GT", "F-150", "X5", "X3", "A4"),
    trim = c("Base", "XLT", "xDrive35i", "sDrive28i", "Premium"),
    year = c(2017, 2018, 2019, 2020, 2021),
    hp = c(647, 450, 300, 228, 261),
    msrp = c(447000, 28000, 57000, 34000, 37000)
  )

test_that("`dt_boxhead_get_var_by_type()` works with multicolumn stubs", {

  # Single column stub
  single_stub <-
    test_data %>%
    gt(rowname_col = "mfr")

  # Multi-column stub
  multi_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model"))

  # Three-column stub
  triple_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"))

  # Test single stub column
  single_stub_vars <- gt:::dt_boxhead_get_var_by_type(single_stub, type = "stub")
  expect_equal(single_stub_vars, "mfr")
  expect_length(single_stub_vars, 1)

  # Test multi-column stub
  multi_stub_vars <- gt:::dt_boxhead_get_var_by_type(multi_stub, type = "stub")
  expect_equal(multi_stub_vars, c("mfr", "model"))
  expect_length(multi_stub_vars, 2)

  # Test three-column stub
  triple_stub_vars <- gt:::dt_boxhead_get_var_by_type(triple_stub, type = "stub")
  expect_equal(triple_stub_vars, c("mfr", "model", "trim"))
  expect_length(triple_stub_vars, 3)

  # Test default columns (should be the non-stub columns)
  single_default_vars <- gt:::dt_boxhead_get_var_by_type(single_stub, type = "default")
  expect_equal(single_default_vars, c("model", "trim", "year", "hp", "msrp"))

  multi_default_vars <- gt:::dt_boxhead_get_var_by_type(multi_stub, type = "default")
  expect_equal(multi_default_vars, c("trim", "year", "hp", "msrp"))

  triple_default_vars <- gt:::dt_boxhead_get_var_by_type(triple_stub, type = "default")
  expect_equal(triple_default_vars, c("year", "hp", "msrp"))
})

test_that("`dt_boxhead_get_var_stub()` returns correct values", {

  # Single column stub
  single_stub <-
    test_data %>%
    gt(rowname_col = "mfr")

  # Multi-column stub
  multi_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"))

  # No stub
  no_stub <-
    test_data %>%
    gt()

  # Test single stub
  single_result <- gt:::dt_boxhead_get_var_stub(single_stub)
  expect_equal(single_result, "mfr")

  # Test multi-column stub
  multi_result <- gt:::dt_boxhead_get_var_stub(multi_stub)
  expect_equal(multi_result, c("mfr", "model", "trim"))

  # Test no stub (should return NA_character_)
  no_stub_result <- gt:::dt_boxhead_get_var_stub(no_stub)
  expect_true(is.na(no_stub_result))
  expect_length(no_stub_result, 1)
})

test_that("`get_stub_layout()` works with different stub configurations", {

  # No stub
  no_stub <-
    test_data %>%
    gt()

  # Single rowname stub
  single_stub <-
    test_data %>%
    gt(rowname_col = "mfr")

  # Multi-column rowname stub
  multi_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model"))

  # Grouped data with conventional row groups
  grouped_data <-
    test_data %>%
    dplyr::mutate(
      group = ifelse(mfr %in% c("Ford", "BMW"), "American & German", "German Premium")
    )

  group_stub <-
    grouped_data %>%
    gt(rowname_col = "mfr", groupname_col = "group")

  # Grouped data with row groups as columns
  group_as_col_stub <-
    grouped_data %>%
    gt(rowname_col = "mfr", groupname_col = "group") %>%
    tab_options(row_group.as_column = TRUE)

  # Basic validation that these tables can be created without error
  expect_no_error(as_raw_html(no_stub))
  expect_no_error(as_raw_html(single_stub))
  expect_no_error(as_raw_html(multi_stub))
  expect_no_error(as_raw_html(group_stub))
  expect_no_error(as_raw_html(group_as_col_stub))

  # Test that the stub layouts are reasonable
  expect_true(length(gt:::dt_boxhead_get_var_by_type(no_stub, "stub")) == 0)
  expect_true(length(gt:::dt_boxhead_get_var_by_type(single_stub, "stub")) == 1)
  expect_true(length(gt:::dt_boxhead_get_var_by_type(multi_stub, "stub")) == 2)
  expect_true(length(gt:::dt_boxhead_get_var_by_type(group_stub, "stub")) == 1)
  expect_true(length(gt:::dt_boxhead_get_var_by_type(group_as_col_stub, "stub")) == 1)
})

test_that("`dt_boxhead_get_vars_default()` returns correct columns", {

  # Single stub
  single_stub <-
    test_data %>%
    gt(rowname_col = "mfr")

  # Multi-column stub
  multi_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"))

  # No stub
  no_stub <-
    test_data %>%
    gt()

  # Test single stub (all columns except stub should be default)
  single_default <- gt:::dt_boxhead_get_vars_default(single_stub)
  expect_equal(single_default, c("model", "trim", "year", "hp", "msrp"))
  expect_false("mfr" %in% single_default)

  # Test multi-column stub
  multi_default <- gt:::dt_boxhead_get_vars_default(multi_stub)
  expect_equal(multi_default, c("year", "hp", "msrp"))
  expect_false(any(c("mfr", "model", "trim") %in% multi_default))

  # Test no stub (all columns should be default)
  no_stub_default <- gt:::dt_boxhead_get_vars_default(no_stub)
  expect_equal(no_stub_default, c("mfr", "model", "trim", "year", "hp", "msrp"))
})

test_that("Internal functions handle edge cases correctly", {

  # Empty data frame
  empty_data <- data.frame()

  # gt() should succeed with empty data (it creates an empty table)
  expect_no_error(gt(empty_data))

  # Single row, single column
  single_cell <- data.frame(value = 1)
  single_gt <- single_cell %>% gt()

  single_vars <- gt:::dt_boxhead_get_var_by_type(single_gt, type = "default")
  expect_equal(single_vars, "value")

  stub_vars <- gt:::dt_boxhead_get_var_by_type(single_gt, type = "stub")
  expect_length(stub_vars, 0)

  # Single row, single column with stub
  single_stub_gt <- single_cell %>% gt(rowname_col = "value")
  stub_vars_single <- gt:::dt_boxhead_get_var_by_type(single_stub_gt, type = "stub")
  expect_equal(stub_vars_single, "value")

  default_vars_single <- gt:::dt_boxhead_get_var_by_type(single_stub_gt, type = "default")
  expect_length(default_vars_single, 0)
})

test_that("boxhead type assignment works correctly", {

  # Test that stub columns get proper type assignment
  multi_stub <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"))

  boxhead <- gt:::dt_boxhead_get(multi_stub)

  # Check that stub columns have type "stub"
  expect_equal(boxhead$type[boxhead$var == "mfr"], "stub")
  expect_equal(boxhead$type[boxhead$var == "model"], "stub")
  expect_equal(boxhead$type[boxhead$var == "trim"], "stub")

  # Check that non-stub columns have type "default"
  expect_equal(boxhead$type[boxhead$var == "year"], "default")
  expect_equal(boxhead$type[boxhead$var == "hp"], "default")
  expect_equal(boxhead$type[boxhead$var == "msrp"], "default")

  # Test alignment defaults for stub columns
  expect_equal(boxhead$column_align[boxhead$var == "mfr"], "left")
  expect_equal(boxhead$column_align[boxhead$var == "model"], "left")
  expect_equal(boxhead$column_align[boxhead$var == "trim"], "left")
})

test_that("`get_stub_layout()` works with summary rows", {

  # Test with summary rows and different stub configurations
  multi_stub_with_summary <-
    test_data %>%
    gt(rowname_col = c("mfr", "model")) %>%
    summary_rows(
      groups = TRUE,
      columns = c(hp, msrp),
      fns = list(
        avg = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE)
      )
    )

  # Test that the table renders without error
  expect_no_error(as_raw_html(multi_stub_with_summary))

  # Test that summary rows are added
  expect_true(length(multi_stub_with_summary) > 0)

  # Test that stub structure is preserved
  stub_vars <- gt:::dt_boxhead_get_var_by_type(multi_stub_with_summary, type = "stub")
  expect_equal(stub_vars, c("mfr", "model"))
})

test_that("Basic multicolumn stub footnotes render correctly", {

  # Create table with multicolumn stub and footnotes
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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
  expect_snapshot(cat(as_raw_html(gt_tbl)))

  # Test LaTeX output
  expect_snapshot(as.character(as_latex(gt_tbl)))
})

test_that("Multicolumn stub footnotes with visual order priority", {

  # Create table with footnotes in call order ('Ford' first, then 'GT')
  gt_tbl_1 <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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
  expect_snapshot(cat(as_raw_html(gt_tbl_1)))
  expect_snapshot(cat(as_raw_html(gt_tbl_2)))
})

test_that("Multiple rows with multicolumn stub footnotes", {

  # Create table with footnotes on multiple rows
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
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
    gt(
      rowname_col = c("mfr", "model", "trim"),
      groupname_col = "group",
      id = "test"
    ) %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
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
    gt(
      rowname_col = c("mfr", "model", "trim"),
      groupname_col = "group",
      id = "test"
    ) %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("All stub columns with footnotes", {

  # Create table with footnotes on all three stub columns
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Footnotes on non-first row with multicolumn stub", {

  # Create table with footnotes on second row
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Mixed stub and data column footnotes", {

  # Create table with both stub and data column footnotes
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Two-column stub footnotes", {

  # Create table with just two stub columns
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Single stub column footnotes (regression test)", {

  # Create table with single stub column (should still work)
  gt_tbl <-
    test_data %>%
    gt(rowname_col = "mfr", id = "test") %>%
    tab_stubhead(label = "Manufacturer") %>%
    tab_header(title = "Single Stub Column") %>%
    tab_footnote(
      footnote = "Ford manufacturer",
      locations = cells_stub(rows = 1)
    )

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Footnotes with specific row references", {

  # Create table using row indices instead of row names
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model", "trim"), id = "test") %>%
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

  expect_snapshot(cat(as_raw_html(gt_tbl)))
})

test_that("Error handling for invalid stub column references", {

  # Create basic table
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model"))

  # Test error when targeting non-stub column
  expect_error(
    gt_tbl %>%
      tab_footnote(
        footnote = "Test",
        locations = cells_stub(rows = 1, columns = "year")
      ),
    class = "rlang_error"
  )

  # Test error when targeting column that doesn't exist
  expect_error(
    gt_tbl %>%
      tab_footnote(
        footnote = "Test",
        locations = cells_stub(rows = 1, columns = "nonexistent")
      ),
    class = "rlang_error"
  )
})

test_that("Traditional cells_stub() usage still works", {

  # Test traditional usage without column specification
  gt_tbl <-
    test_data %>%
    gt(rowname_col = c("mfr", "model")) %>%
    tab_footnote(
      footnote = "Traditional footnote",
      locations = cells_stub(rows = 1)
    )

  # Should not error
  expect_no_error(as_raw_html(gt_tbl))

  # Should apply footnote to the row (traditional behavior)
  html_output <- as_raw_html(gt_tbl)
  expect_true(grepl("Traditional footnote", html_output))
})

test_that("Multicolumn stub behavior with different data types", {

  # Create test data with mixed types
  mixed_data <-
    data.frame(
      char_col = c("A", "B", "C"),
      num_col = c(1, 2, 3),
      factor_col = factor(c("X", "Y", "Z")),
      logical_col = c(TRUE, FALSE, TRUE),
      date_col = as.Date(c("2021-01-01", "2021-01-02", "2021-01-03"))
    )

  # Test multicolumn stub with different data types
  mixed_stub <-
    mixed_data %>%
    gt(rowname_col = c("char_col", "num_col", "factor_col"))

  # Should not error
  expect_no_error(as_raw_html(mixed_stub))

  # Check internal structure
  stub_vars <- gt:::dt_boxhead_get_var_by_type(mixed_stub, type = "stub")
  expect_equal(stub_vars, c("char_col", "num_col", "factor_col"))

  default_vars <- gt:::dt_boxhead_get_var_by_type(mixed_stub, type = "default")
  expect_equal(default_vars, c("logical_col", "date_col"))
})

test_that("Stub column alignment and formatting", {

  # Test numeric stub columns get proper alignment
  numeric_data <-
    data.frame(
      id = 1:3,
      code = c("001", "002", "003"),
      value = c(10, 20, 30)
    )

  numeric_stub <-
    numeric_data %>%
    gt(rowname_col = c("id", "code"))

  boxhead <- gt:::dt_boxhead_get(numeric_stub)

  # Check that stub columns maintain right alignment by default
  # (both numeric and character stub columns get right alignment)
  expect_equal(boxhead$column_align[boxhead$var == "id"], "right")
  expect_equal(boxhead$column_align[boxhead$var == "code"], "right")
})

test_that("Performance with large multicolumn stubs", {

  # Create larger test data
  large_data <-
    data.frame(
      group = rep(LETTERS[1:5], each = 20),
      subgroup = rep(letters[1:4], each = 25),
      item = paste0("item_", 1:100),
      value1 = rnorm(100),
      value2 = runif(100)
    )

  # Test multicolumn stub creation doesn't take excessive time
  start_time <- Sys.time()
  large_stub <-
    large_data %>%
    gt(rowname_col = c("group", "subgroup", "item"))
  end_time <- Sys.time()

  # Should complete reasonably quickly (less than 5 seconds)
  expect_true(as.numeric(end_time - start_time, units = "secs") < 5)

  # Test internal functions work correctly
  stub_vars <- gt:::dt_boxhead_get_var_by_type(large_stub, type = "stub")
  expect_equal(stub_vars, c("group", "subgroup", "item"))
  expect_length(stub_vars, 3)

  default_vars <- gt:::dt_boxhead_get_var_by_type(large_stub, type = "default")
  expect_equal(default_vars, c("value1", "value2"))
  expect_length(default_vars, 2)
})

test_that("dt_boxhead_get_var_by_type handles different column types correctly", {

  # Test with mixed column types
  mixed_data <-
    data.frame(
      char_col = c("A", "B", "C"),
      num_col = c(1, 2, 3),
      logical_col = c(TRUE, FALSE, TRUE),
      factor_col = factor(c("X", "Y", "Z"))
    )

  # All as default columns
  all_default <- mixed_data %>% gt()
  default_vars <- gt:::dt_boxhead_get_var_by_type(all_default, "default")
  expect_equal(default_vars, c("char_col", "num_col", "logical_col", "factor_col"))

  # Mixed stub/default
  mixed_stub <- mixed_data %>% gt(rowname_col = c("char_col", "num_col"))
  stub_vars <- gt:::dt_boxhead_get_var_by_type(mixed_stub, "stub")
  default_vars <- gt:::dt_boxhead_get_var_by_type(mixed_stub, "default")
  expect_equal(stub_vars, c("char_col", "num_col"))
  expect_equal(default_vars, c("logical_col", "factor_col"))

  # All as stub columns
  all_stub <- mixed_data %>% gt(rowname_col = c("char_col", "num_col", "logical_col", "factor_col"))
  stub_vars <- gt:::dt_boxhead_get_var_by_type(all_stub, "stub")
  default_vars <- gt:::dt_boxhead_get_var_by_type(all_stub, "default")
  expect_equal(stub_vars, c("char_col", "num_col", "logical_col", "factor_col"))
  expect_length(default_vars, 0)
})

test_that("dt_boxhead_get_var_stub returns correct stub columns", {

  # Test with different stub configurations
  data <- data.frame(a = 1:3, b = 4:6, c = 7:9, d = 10:12)

  # No stub
  no_stub <- data %>% gt()
  expect_true(is.na(gt:::dt_boxhead_get_var_stub(no_stub)))

  # Single stub
  single_stub <- data %>% gt(rowname_col = "a")
  expect_equal(gt:::dt_boxhead_get_var_stub(single_stub), "a")

  # Multiple stub columns
  multi_stub <- data %>% gt(rowname_col = c("a", "b"))
  expect_equal(gt:::dt_boxhead_get_var_stub(multi_stub), c("a", "b"))

  # All columns as stub
  all_stub <- data %>% gt(rowname_col = c("a", "b", "c", "d"))
  expect_equal(gt:::dt_boxhead_get_var_stub(all_stub), c("a", "b", "c", "d"))
})

test_that("Footnote functionality works correctly with multicolumn stubs", {

  # Test data with footnotes on stub columns
  footnote_data <-
    data.frame(
      manufacturer = c("Ford", "BMW", "Audi"),
      model = c("GT", "X5", "A4"),
      year = c(2017, 2019, 2021),
      price = c(447000, 57000, 37000)
    )

  # Create table with footnotes on stub columns
  footnote_table <-
    footnote_data %>%
    gt(rowname_col = c("manufacturer", "model")) %>%
    tab_footnote(
      footnote = "American manufacturer",
      locations = cells_stub(rows = 1, columns = "manufacturer")
    ) %>%
    tab_footnote(
      footnote = "Sports car model",
      locations = cells_stub(rows = 1, columns = "model")
    ) %>%
    tab_footnote(
      footnote = "German manufacturer",
      locations = cells_stub(rows = 2, columns = "manufacturer")
    )

  # Test that the table can be rendered without error
  expect_no_error(as_raw_html(footnote_table))

  # Test that footnotes are present in the output
  html_output <- as_raw_html(footnote_table)
  expect_true(grepl("American manufacturer", html_output))
  expect_true(grepl("Sports car model", html_output))
  expect_true(grepl("German manufacturer", html_output))

  # Test that footnote marks are present
  expect_true(grepl("footnote_marks", html_output))
})

test_that("Stub column order is preserved", {

  # Test that stub columns appear in the same order as specified
  ordered_data <-
    data.frame(
      z_col = c("Z1", "Z2", "Z3"),
      a_col = c("A1", "A2", "A3"),
      m_col = c("M1", "M2", "M3"),
      value = c(1, 2, 3)
    )

  # Order should be preserved as specified, not alphabetical
  ordered_stub <-
    ordered_data %>%
    gt(rowname_col = c("z_col", "a_col", "m_col"))

  stub_vars <- gt:::dt_boxhead_get_var_by_type(ordered_stub, "stub")
  expect_equal(stub_vars, c("z_col", "a_col", "m_col"))

  # Test that rendering preserves order
  expect_no_error(as_raw_html(ordered_stub))
})
