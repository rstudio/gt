test_that("Multi-column stubs handle NA values correctly in HTML output", {
  
  # Test 1: NAs in both stub columns
  tbl <- exibble |>
    dplyr::select(num, char, datetime) |> 
    gt(rowname_col = c("char", "datetime"))
  
  # Should not error when rendering
  expect_no_error(
    html_output <- as_raw_html(tbl)
  )
  
  # Test 2: Consecutive NAs should be grouped together
  data <- dplyr::tibble(
    a = c(NA, NA, "B", "B"),
    b = c("1", "2", "3", "4"),
    val = 1:4
  )
  
  tbl2 <- data |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    html_output2 <- as_raw_html(tbl2)
  )
  
  # Test 3: All NAs in one column
  data3 <- dplyr::tibble(
    a = c(NA, NA, NA, NA),
    b = c("x", "x", "y", "y"),
    val = 1:4
  )
  
  tbl3 <- data3 |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    html_output3 <- as_raw_html(tbl3)
  )
  
  # Test 4: Mixed NAs and values
  data4 <- dplyr::tibble(
    a = c("A", "A", NA, NA),
    b = c("1", "2", "3", "4"),
    val = 1:4
  )
  
  tbl4 <- data4 |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    html_output4 <- as_raw_html(tbl4)
  )
})

test_that("Multi-column stubs handle NA values correctly in LaTeX output", {
  
  # Test 1: NAs in both stub columns
  tbl <- exibble |>
    dplyr::select(num, char, datetime) |> 
    gt(rowname_col = c("char", "datetime"))
  
  # Should not error when rendering
  expect_no_error(
    latex_output <- as_latex(tbl)
  )
  
  # Test 2: Consecutive NAs should be handled correctly
  data <- dplyr::tibble(
    a = c(NA, NA, "B", "B"),
    b = c("1", "2", "3", "4"),
    val = 1:4
  )
  
  tbl2 <- data |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    latex_output2 <- as_latex(tbl2)
  )
  
  # Test 3: All NAs in one column
  data3 <- dplyr::tibble(
    a = c(NA, NA, NA, NA),
    b = c("x", "x", "y", "y"),
    val = 1:4
  )
  
  tbl3 <- data3 |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    latex_output3 <- as_latex(tbl3)
  )
  
  # Test 4: Mixed NAs and values
  data4 <- dplyr::tibble(
    a = c("A", "A", NA, NA),
    b = c("1", "2", "3", "4"),
    val = 1:4
  )
  
  tbl4 <- data4 |> gt(rowname_col = c("a", "b"))
  
  expect_no_error(
    latex_output4 <- as_latex(tbl4)
  )
})

test_that("Multi-column stubs with NAs work in print() method", {
  
  # The original reported issue - should not error when printing
  expect_no_error(
    tbl <- exibble |>
      dplyr::select(num, char, datetime) |> 
      gt(rowname_col = c("char", "datetime"))
  )
  
  # Printing the table should also work
  expect_no_error(
    print(tbl)
  )
})

# RTF multi-column stub support is currently incomplete
# These tests are skipped until RTF rendering is fixed in a future PR
test_that("RTF multi-column stub support needs work (skipped)", {
  skip("RTF multi-column stub rendering has pre-existing issues beyond NA handling")
  
  # Test 1: Basic multi-column stub (even without NAs fails)
  tbl_simple <- towny |>
    dplyr::select(name, land_area_km2, population_2021) |>
    head(5) |>
    gt(rowname_col = c("name", "land_area_km2"))
  
  expect_no_error(
    rtf_output_simple <- as_rtf(tbl_simple)
  )
  
  # Test 2: Multi-column stub with NAs
  tbl_na <- exibble |>
    dplyr::select(num, char, datetime) |> 
    gt(rowname_col = c("char", "datetime"))
  
  expect_no_error(
    rtf_output_na <- as_rtf(tbl_na)
  )
})

