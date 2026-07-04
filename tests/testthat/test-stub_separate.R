test_that("stub.separate option works correctly for HTML output", {

  # Create a simple table with a stub
  test_tbl <- data.frame(
    row = c("Row 1", "Row 2", "Row 3"),
    col_a = c(10, 20, 30),
    col_b = c(100, 200, 300)
  ) |>
    gt(rowname_col = "row") |>
    tab_stubhead(label = "Item")

  # Test with stub.separate = TRUE (default)
  tbl_sep_true <- test_tbl |>
    tab_options(stub.separate = TRUE)

  expect_snapshot_html(tbl_sep_true)

  # Test with stub.separate = FALSE
  tbl_sep_false <- test_tbl |>
    tab_options(stub.separate = FALSE)

  expect_snapshot_html(tbl_sep_false)
})

test_that("stub.separate option works correctly for LaTeX output", {

  # Create a simple table with a stub
  test_tbl <- data.frame(
    row = c("Row 1", "Row 2", "Row 3"),
    col_a = c(10, 20, 30),
    col_b = c(100, 200, 300)
  ) |>
    gt(rowname_col = "row") |>
    tab_stubhead(label = "Item")

  # Test with stub.separate = TRUE (default)
  tbl_sep_true <- test_tbl |>
    tab_options(stub.separate = TRUE)

  expect_snapshot_latex(tbl_sep_true)

  # Test with stub.separate = FALSE
  tbl_sep_false <- test_tbl |>
    tab_options(stub.separate = FALSE)

  expect_snapshot_latex(tbl_sep_false)
})

test_that("stub.separate = TRUE produces vertical bar in LaTeX column spec", {

  test_tbl <- data.frame(
    row = c("A", "B"),
    val = c(1, 2)
  ) |>
    gt(rowname_col = "row") |>
    tab_options(stub.separate = TRUE)

  latex_output <- as.character(as_latex(test_tbl))

  # Should contain 'l|' pattern for stub column with separator

  expect_match(latex_output, "\\{.*l\\|.*\\}", perl = TRUE)
})

test_that("stub.separate = FALSE removes vertical bar from LaTeX column spec", {

  test_tbl <- data.frame(
    row = c("A", "B"),
    val = c(1, 2)
  ) |>
    gt(rowname_col = "row") |>
    tab_options(stub.separate = FALSE)

  latex_output <- as.character(as_latex(test_tbl))

  # Should NOT contain 'l|' pattern - just 'l' followed by other column specs
  expect_no_match(latex_output, "\\{.*l\\|.*\\}", perl = TRUE)
})
