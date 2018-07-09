context("test-gt_object.R")

test_that("an gt table object contains the correct components", {

  library(dplyr)

  # Create an `gt_tbl` object with `gt()`
  table_object <-
    dplyr::tibble(a = 1:5, b = letters[1:5]) %>%
    gt()

  # Expect that the list object has 8 components
  expect_equal(
    length(table_object), 8)

  # Expect certain named components
  expect_equal(
    table_object %>% names(),
    c("input_df", "boxh_df", "stub_df", "fmts_df",
      "foot_df", "output_df", "formats", "decorators"))
})
