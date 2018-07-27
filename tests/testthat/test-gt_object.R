context("test-gt_object.R")

test_that("an gt table object contains the correct components", {

  library(dplyr)

  # Create an `gt_tbl` object with `gt()`
  table_object <-
    dplyr::tibble(a = 1:5, b = letters[1:5]) %>%
    gt()

  # Expect that the object has 8 attributes
  expect_equal(
    length(attributes(table_object)), 8)

  # Expect certain named attributes
  expect_equal(
    names(attributes(table_object)),
    c("class", "names", "row.names", "boxh_df", "stub_df",
      "fmts_df", "foot_df", "formats"))
})
