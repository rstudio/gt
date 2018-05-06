context("test-gt_object.R")

test_that("an HTML table object contains the correct components", {

  # Create an HTML table object with `tab_create()`
  table_object <-
    dplyr::tibble(a = 1:5, b = letters[1:5]) %>%
    tab_create()

  # Expect that the list object has 14 components
  expect_equal(
    length(table_object), 14)

  # Expect certain named components
  expect_equal(
    table_object %>% names(),
    c("transforms", "formats", "aesthetics", "fonts",
      "source_tbl", "modified_tbl", "content_tbl",
      "heading", "footnote", "source_note",
      "stubhead_caption", "boxhead_panel", "stub_block",
      "html_head"))
})
