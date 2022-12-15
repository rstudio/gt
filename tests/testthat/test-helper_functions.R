test_that("The `pct()` helper function works correctly", {

  # Create a CSS percentage value string
  percentage <- pct(x = 50)

  # Expect that the value is formatted correctly
  percentage %>% expect_equal("50%")

  # Expect an error if the value supplied is not numeric
  expect_error(
    pct(x = "50"))
})

test_that("The `px()` helper function works correctly", {

  # Create a CSS pixel value string
  pixels <- px(x = 50)

  # Expect that the value is formatted correctly
  pixels %>% expect_equal("50px")

  # Expect an error if the value supplied is not numeric
  expect_error(
    px(x = "50"))
})

test_that("The `cells_group()` emits a warning but works correctly", {

  # Expect a warning from the deprecated `cells_group()` function; it
  # still does return a useful list object
  expect_warning(
    out <- cells_group()
  )

  # Expect that the output from `cells_group()` is a list
  expect_type(out, "list")
})
