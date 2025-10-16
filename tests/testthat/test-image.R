library(ggplot2)

test_that("test_image() works correctly", {

  # Expect that the `test_image()` function returns paths for
  # either a PNG or SVG test image
  test_image(type = "png") |> expect_match(".*/test_image.png")
  test_image(type = "svg") |> expect_match(".*/test_image.svg")
})

test_that("get_mime_type() works correctly", {

  # Expect that `get_mime_type()` returns
  # a mime-type string for svg and jpg files
  get_mime_type(file = "file.svg") |> expect_equal("image/svg+xml")
  get_mime_type(file = "file.jpg") |> expect_equal("image/jpeg")
})

test_that("get_image_uri() works correctly", {

  # Expect that the beginning of the PNG-based image URI has the
  # correct MIME and encoding types
  expect_match(
    get_image_uri(file = system_file("./graphics/test_image.png")),
    "^data:image/png;base64,"
  )

  # Expect that the beginning of the SVG-based image URI has the
  # correct MIME and encoding types
  expect_match(
    get_image_uri(file = system_file("./graphics/test_image.svg")),
    "data:image/svg\\+xml;base64"
  )

  # Expect that the image URI for the included test image (in PNG form)
  # produces the same URI string
  expect_snapshot(get_image_uri(file = test_image(type = "png")))
})

test_that("local_image() works correctly", {

  # Expect that the image tags generated for the included test image
  # are correctly formed
  expect_snapshot(local_image(filename = test_image(type = "png")))
  expect_snapshot(local_image(filename = test_image(type = "svg")))

  # Expect that `local_image()` can return multiple image tags
  expect_snapshot(local_image(filename = rep(test_image(type = "png"), 2)))
})

test_that("web_image() works correctly", {

  # Expect that the image tag is correctly formed
  expect_equal(
    web_image(url = "example.png"),
    "<img src=\"example.png\" style=\"height:30px;\">"
  )

  # Expect that `web_image()` returns an image tag
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

test_that("ggplot_image() works correctly", {

  skip_on_ci()

  # Create a ggplot plot
  gg <-
    ggplot(
      data = gtcars,
      aes(x = hp, y = trq,
          size = msrp)) +
    geom_point(color = "blue") +
    theme(legend.position = "none")

  # Expect that a single plot object can be contained in a list
  expect_equal(
    ggplot_image(plot_object = gg),
    ggplot_image(plot_object = list(gg))
  )

  # Expect that `ggplot_image()` can return multiple image tags
  img_tags <- ggplot_image(plot_object = list(gg, gg))

  expect_length(img_tags, 2)

  expect_equal(img_tags[1], img_tags[2])

  expect_type(img_tags, "character")

  skip_on_os("windows") # FIXME Snapshot is different on Windows

  # Expect that the image tag generated for the ggplot is correctly formed
  expect_snapshot(ggplot_image(plot_object = gg))
})
