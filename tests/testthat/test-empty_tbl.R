test_that("We can build gt tables starting from an empty table", {

  empty_tbl <- dplyr::tibble()

  # A completely empty table can be rendered in different output
  # formats without failing
  expect_error(
    regexp = NA,
    gt(empty_tbl) %>% render_as_html()
  )
  expect_error(
    regexp = NA,
    gt(empty_tbl) %>% as_latex()
  )
  expect_error(
    regexp = NA,
    gt(empty_tbl) %>% as_rtf()
  )
  expect_error(
    regexp = NA,
    gt(empty_tbl) %>% as_word()
  )
})
