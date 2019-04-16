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

test_that("the the `cell_text()` helper function works correctly", {

  # Create a properly-formatted style string using the `cell_text()` function
  text_styles <-
    cell_text(
      color = "green",
      font = "Courier",
      style = "normal",
      size = px(12),
      align = "right",
      indent = px(5),
      decorate = "line-through",
      transform = "uppercase"
    )

  # Expect that the generated string matches the correct output string
  text_styles %>%
    expect_equal("color:green;font-family:Courier;font-size:12px;text-align:right;font-style:normal;text-indent:5px;text-decoration:line-through;text-transform:uppercase;")
})
