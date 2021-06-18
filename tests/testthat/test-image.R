skip_on_cran()
skip_on_os("windows")

test_that("the `test_image()` function works correctly", {

  # Expect that the `test_image()` function returns paths for
  # either a PNG or SVG test image
  test_image(type = "png") %>% expect_match(".*/test_image.png")
  test_image(type = "svg") %>% expect_match(".*/test_image.svg")
})

test_that("the `get_mime_type()` function works correctly", {

  # Expect that the `get_mime_type()` function returns
  # a mime-type string for svg and jpg files
  get_mime_type(file = "file.svg") %>% expect_equal("image/svg+xml")
  get_mime_type(file = "file.jpg") %>% expect_equal("image/jpeg")
})

test_that("the `get_image_uri()` function works correctly", {

  testthat::local_edition(3)

  # Expect that the beginning of the PNG-based image URI has the
  # correct MIME and encoding types
  expect_true(
    grepl(
      "^data:image/png;base64,",
      get_image_uri(file = system_file("./graphics/test_image.png"))
    )
  )

  # Expect that the beginning of the SVG-based image URI has the
  # correct MIME and encoding types
  expect_true(
    grepl(
      "data:image/svg\\+xml;base64",
      get_image_uri(file = system_file("./graphics/test_image.svg"))
    )
  )

  # Expect that the image URIs for the included test image
  # produce the same URI strings
  expect_snapshot(get_image_uri(file = test_image(type = "png")))
  expect_snapshot(get_image_uri(file = test_image(type = "svg")))
})

test_that("the `local_image()` function works correctly", {

  testthat::local_edition(3)

  # Expect that the image tags generated for the included test image
  # are correctly formed
  expect_snapshot(local_image(filename = test_image(type = "png")))
  expect_snapshot(local_image(filename = test_image(type = "svg")))
})

test_that("the `web_image()` function works correctly", {

  # Expect that the image tag is correctly formed
  expect_equal(
    web_image(url = "example.png"),
    "<img src=\"example.png\" style=\"height:30px;\">"
  )

  # Expect that the `web_image()` function returns an image tag
  expect_equal(
    web_image(url = "example.com/img.png", height = px(200)),
    "<img src=\"example.com/img.png\" style=\"height:200px;\">"
  )

  # Expect that the `web_image()` function returns the same image tag
  # even if `height` is provided in different ways
  expect_equal(
    web_image(url = "example.com/img.png", height = px(200)),
    web_image(url = "example.com/img.png", height = 200)
  )

  expect_equal(
    web_image(url = "example.com/img.png", height = 200),
    web_image(url = "example.com/img.png", height = "200px")
  )

  # Expect that `web_image()` can return multiple image tags
  expect_equal(
    web_image(
      url = c("example.com/img1.png", "example.com/img2.png"),
      height = px(200)
    ),
    paste0("<img src=\"example.com/img", 1:2, ".png\" style=\"height:200px;\">")
  )
})

# # Create a `tbl_html` that contains local images in column `b`
# tbl_html <-
#   dplyr::tibble(
#     a = 1:5,
#     b = c(1.6, 9.6, 5.3, 3.5, 6.3)) %>%
#   gt() %>%
#   text_transform(
#     locations = cells_body(columns = b),
#     fn = function(x) {
#       x <- as.numeric(x)
#       ifelse(
#         x >= 5,
#         local_image(file = test_image(type = "svg"), height = px(x * 10)),
#         local_image(file = test_image(type = "png"), height = px(x * 10)))
#     })
