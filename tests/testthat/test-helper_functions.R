context("Ensuring that the helper functions work as expected")

test_that("the the `pct()` helper function works correctly", {

  # Create a CSS percentage value string
  percentage <- pct(x = 50)

  # Expect that the value is formatted correctly
  percentage %>% expect_equal("50%")

  # Expect an error if the value supplied is not numeric
  expect_error(
    pct(x = "50"))
})

test_that("the the `px()` helper function works correctly", {

  # Create a CSS pixel value string
  pixels <- px(x = 50)

  # Expect that the value is formatted correctly
  pixels %>% expect_equal("50px")

  # Expect an error if the value supplied is not numeric
  expect_error(
    px(x = "50"))
})
