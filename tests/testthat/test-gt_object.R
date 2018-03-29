context("test-gt_object.R")

test_that("an HTML table object contains the correct components", {

  # Create an HTML table object with `gt()`
  # and the `iris` dataset
  table_object <-
    tibble(a = 1:5, b = letters[1:5]) %>%
    gt()

  # Expect that the list object has 9 components
  expect_equal(
    length(table_object), 9)

  # Expect certain named components
  expect_equal(
    table_object %>% names(),
    c("source_tbl",
      "transform_opts", "heading", "footnote", "source_note", "stubhead_caption",
      "boxhead_panel",
      "html_head", "html_table"))
})
