test_that("We can build gt tables starting from an empty table", {

  empty_tbl <- dplyr::tibble()

  empty_w_cols_tbl <-
    dplyr::tibble(char = character(0), num = double(0))

  empty_w_rows_tbl <- dplyr::tibble(.rows = 5)

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

  # An empty table (having columns though) can be rendered
  # in different output formats without failing
  expect_error(
    regexp = NA,
    gt(empty_w_cols_tbl) %>% render_as_html()
  )
  expect_error(
    regexp = NA,
    gt(empty_w_cols_tbl) %>% as_latex()
  )
  expect_error(
    regexp = NA,
    gt(empty_w_cols_tbl) %>% as_rtf()
  )
  expect_error(
    regexp = NA,
    gt(empty_w_cols_tbl) %>% as_word()
  )

  # An empty table (having some rows though) can be rendered
  # in different output formats without failing
  #expect_error(
  #  regexp = NA,
  #  gt(empty_w_rows_tbl) %>% render_as_html()
  #)
  #expect_error(
  #  regexp = NA,
  #  gt(empty_w_rows_tbl) %>% as_latex()
  #)
  #expect_error(
  #  regexp = NA,
  #  gt(empty_w_rows_tbl) %>% as_rtf()
  #)
  #expect_error(
  #  regexp = NA,
  #  gt(empty_w_rows_tbl) %>% as_word()
  #)
})
