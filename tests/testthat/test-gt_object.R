context("test-gt_object.R")

test_that("an HTML table object contains the correct components", {

  # Create an HTML table object with `gt()`
  # and the `iris` dataset
  table_object <-
    iris %>% gt()

  # Expect that the list object has 5 components
  expect_equal(
    length(table_object), 5)

  # Expect certain named components
  expect_equal(
    table_object %>% names(),
    c("source_tbl", "heading", "footnote", "source_note", "html_table"))
})
