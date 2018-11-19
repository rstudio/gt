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

test_that("the the `cells_styles()` helper function works correctly", {

  # Create a properly-formatted style string using the `apply_styles()` function
  styles_vec <-
    cells_styles(
      bkgd_color = "yellow",
      text_color = "green",
      text_font = "Courier",
      text_style = "normal",
      text_size = px(12),
      text_align = "right",
      text_indent = px(5),
      text_decorate = "line-through",
      text_transform = "uppercase")

  # Expect that the generated string matches the correct output string
  styles_vec %>%
    expect_equal("background-color:yellow;color:green;font-family:Courier;font-size:12px;text-align:right;font-style:normal;text-indent:5px;text-decoration:line-through;text-transform:uppercase;")
})
