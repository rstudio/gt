test_that("cols_add() works", {
  tbl <- gt(exibble)
  expect_no_error(
    dat <- cols_add(tbl, x = 1, .before = 1)
  )
  expect_equal(dat$`_boxhead`$var[1], "x")
  
  expect_no_error(
    dat <- cols_add(tbl, x = 1, .before = 2)
  )
  expect_equal(dat$`_boxhead`$var[2], "x")
  expect_no_error(
    dat <- cols_add(tbl, x = 1, .after = 1)
  )
  expect_equal(dat$`_boxhead`$var[2], "x")
  expect_no_error(
    dat <- cols_add(tbl, x = 1, .after = dplyr::last_col())
  )
})

test_that("cols_add() errors with bad input", {
  tbl <- gt(exibble)
  
  expect_snapshot(
    error = TRUE, {
      cols_add(tbl, x = 1, .after = 2, .before = 3)
      cols_add(tbl, x = 1, .after = 15)
      cols_add(tbl, x = 1, .before = c(1, 2))
      cols_add(tbl, x = 1, .after = c(1, 2))
      
    }
  )
})

