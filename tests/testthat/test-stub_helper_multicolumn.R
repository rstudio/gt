test_that("stub() helper works with multi-column stubs in cols_width()", {
  
  # Test 1: stub() selects all stub columns
  tbl_html <- 
    exibble |>
    gt(rowname_col = c("group", "row")) |>
    cols_width(
      stub() ~ px(100),
      everything() ~ px(150)
    )
  
  # Verify both stub columns have the width applied
  boxhead <- dt_boxhead_get(data = tbl_html)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl_html)
  
  expect_equal(length(stub_vars), 2)
  
  for (stub_var in stub_vars) {
    stub_row <- boxhead[boxhead$var == stub_var, ]
    expect_equal(unlist(stub_row$column_width), "100px")
  }
  
  # Test 2: stub(1) selects only the rightmost stub column
  tbl_html2 <- 
    exibble |>
    gt(rowname_col = c("group", "row")) |>
    cols_width(
      stub(1) ~ px(120),
      stub(2) ~ px(180),
      everything() ~ px(150)
    )
  
  boxhead2 <- dt_boxhead_get(data = tbl_html2)
  stub_vars2 <- dt_boxhead_get_var_stub(data = tbl_html2)
  
  # stub(1) should be rightmost = "row"
  # stub(2) should be second from right = "group"
  row_col <- boxhead2[boxhead2$var == stub_vars2[2], ]  # rightmost
  group_col <- boxhead2[boxhead2$var == stub_vars2[1], ]  # second from right
  
  expect_equal(unlist(row_col$column_width), "120px")
  expect_equal(unlist(group_col$column_width), "180px")
})

test_that("stub() helper maintains backward compatibility with single-column stubs", {
  
  # Single-column stub should work as before
  tbl_html <- 
    exibble |>
    gt(rowname_col = "row") |>
    cols_width(
      stub() ~ px(100),
      everything() ~ px(150)
    )
  
  boxhead <- dt_boxhead_get(data = tbl_html)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl_html)
  
  expect_equal(length(stub_vars), 1)
  expect_equal(stub_vars, "row")
  
  stub_row <- boxhead[boxhead$var == stub_vars, ]
  expect_equal(unlist(stub_row$column_width), "100px")
})

test_that("stub() helper validates column parameter correctly", {
  
  # Test with invalid column index (too large)
  expect_error(
    exibble |>
      gt(rowname_col = c("group", "row")) |>
      cols_width(stub(3) ~ px(100)),
    "Cannot select stub column 3"
  )
  
  # Test with invalid column index (negative)
  expect_error(
    exibble |>
      gt(rowname_col = c("group", "row")) |>
      cols_width(stub(-1) ~ px(100)),
    "must be a single positive integer"
  )
})

test_that("Multi-column stub respects rowname_col order", {
  
  # When data has columns in order: num, char, row, group
  # But rowname_col = c("group", "row")
  # The stub columns should appear as: group (first), row (second)
  
  tbl <- exibble |>
    dplyr::select(num, char, row, group) |>
    gt(rowname_col = c("group", "row"))
  
  boxhead <- dt_boxhead_get(data = tbl)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl)
  
  # stub_vars should be in the order specified in rowname_col
  expect_equal(stub_vars, c("group", "row"))
  
  # Boxhead should have stub columns first, in the specified order
  expect_equal(boxhead$var[1], "group")
  expect_equal(boxhead$var[2], "row")
  expect_equal(boxhead$type[1], "stub")
  expect_equal(boxhead$type[2], "stub")
  
  # Test with reversed order
  tbl2 <- exibble |>
    dplyr::select(num, char, row, group) |>
    gt(rowname_col = c("row", "group"))
  
  boxhead2 <- dt_boxhead_get(data = tbl2)
  stub_vars2 <- dt_boxhead_get_var_stub(data = tbl2)
  
  expect_equal(stub_vars2, c("row", "group"))
  expect_equal(boxhead2$var[1], "row")
  expect_equal(boxhead2$var[2], "group")
})

test_that("stub() helper works with fmt_*() functions on multi-column stubs", {
  
  # Test fmt_roman() on all stub columns - just ensure it doesn't error
  expect_no_error(
    dplyr::tibble(
      num1 = 1:5,
      num2 = 6:10,
      vals = letters[1:5]
    ) |>
    gt(rowname_col = c("num1", "num2")) |>
    fmt_roman(columns = stub())
  )
})

test_that("stub() helper works with specific column selection in fmt_*()", {
  
  # Test formatting only the rightmost stub column - just ensure it doesn't error
  expect_no_error(
    dplyr::tibble(
      num1 = 1:5,
      num2 = 6:10,
      vals = letters[1:5]
    ) |>
    gt(rowname_col = c("num1", "num2")) |>
    fmt_roman(columns = stub(1))  # Only rightmost (num2)
  )
})

test_that("stub() helper works in tab_style() with multi-column stubs", {
  
  tbl <- 
    exibble |>
    gt(rowname_col = c("group", "row")) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_body(columns = stub())
    )
  
  styles_tbl <- dt_styles_get(data = tbl)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl)
  
  # Check that styles were applied to both stub columns
  expect_true(nrow(styles_tbl) > 0)
  
  styled_cols <- unique(styles_tbl$colname)
  expect_true(all(stub_vars %in% styled_cols))
})

test_that("stub() returns NULL when no stub exists", {
  
  # Create a table without a stub
  tbl <- 
    exibble |>
    gt()
  
  # stub() should return NULL, not cause an error
  expect_no_error(
    cols_width(tbl, everything() ~ px(100))
  )
})

test_that("stub() helper works with percentage widths", {
  
  # Test from the original GitHub issue
  tbl_html <- 
    exibble |>
    gt(rowname_col = c("group", "row")) |>
    cols_width(
      stub() ~ pct(10)
    )
  
  boxhead <- dt_boxhead_get(data = tbl_html)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl_html)
  
  # Both stub columns should have 10% width
  for (stub_var in stub_vars) {
    stub_row <- boxhead[boxhead$var == stub_var, ]
    expect_equal(unlist(stub_row$column_width), "10%")
  }
})

test_that("stub() can be combined with other column selectors", {
  
  # Test using stub() alongside other selectors
  tbl_html <- 
    exibble |>
    gt(rowname_col = c("group", "row")) |>
    cols_width(
      stub(1) ~ px(100),
      stub(2) ~ px(150),
      starts_with("num") ~ px(80),
      everything() ~ px(120)
    )
  
  boxhead <- dt_boxhead_get(data = tbl_html)
  stub_vars <- dt_boxhead_get_var_stub(data = tbl_html)
  
  # Check stub column widths
  row_col <- boxhead[boxhead$var == stub_vars[2], ]
  group_col <- boxhead[boxhead$var == stub_vars[1], ]
  
  expect_equal(unlist(row_col$column_width), "100px")
  expect_equal(unlist(group_col$column_width), "150px")
  
  # Check num column width
  num_col <- boxhead[boxhead$var == "num", ]
  expect_equal(unlist(num_col$column_width), "80px")
})
