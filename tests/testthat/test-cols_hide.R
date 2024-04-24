test_that("The `cols_hide()` and `cols_hide()` do not error when no columns selected", {
  # when no columns selected, gt table return unaltered
  expect_no_error(gt(exibble) %>% cols_hide())
  expect_equal(
    gt(sp500),
    gt(sp500) %>% cols_hide(columns = starts_with("xxxxxxxxxxxx"))
  )

  expect_equal(
    gt(exibble),
    gt(exibble) %>% cols_unhide(columns = starts_with("xxxxxxxxxxxx"))
  )
  expect_snapshot(
    error = TRUE,
    gt(exibble) %>% cols_hide(problem)
  )
})
