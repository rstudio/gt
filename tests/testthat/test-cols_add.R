test_that("cols_add() works", {
  tbl <- gt(exibble)
  expect_no_error(
    cols_add(tbl, x = 1, .before = 3)
  )
  expect_equal(cols_add(), what)
})

