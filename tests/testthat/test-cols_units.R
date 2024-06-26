
test_that("cols_units() errors well with wrong input", {
  # Test that you can override some things with everything()
  d <- data.frame(
    col1 = 1,
    col2 = 2
  )
  # tab0 and tab1 will not have the same units as `cols_label()`
  expect_snapshot(error = TRUE, {
    cols_units(gt(d), col2 ~ 1, everything() ~ "degree")
    cols_units(gt(d), everything() ~ 1, col2 ~ 2)
    cols_units(gt(d), col1 ~ c("x", "y"))
  })
})

