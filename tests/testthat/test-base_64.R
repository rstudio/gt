context("Ensuring that the Base64 functions work as expected")

test_that("the `get_file_ext()` function works correctly", {

  # Expect that filenames with various extensions are
  # work with `get_file_ext()` to return the file extension
  get_file_ext(file = "file.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001.svg") %>% expect_equal("svg")
  get_file_ext(file = "file.001..svg") %>% expect_equal("svg")
  get_file_ext(file = "_file.jpg") %>% expect_equal("jpg")
  get_file_ext(file = "file.png") %>% expect_equal("png")
  get_file_ext(file = "file.gif") %>% expect_equal("gif")
})

test_that("the `get_mime_type()` function works correctly", {

  # Expect that the `get_mime_type()` function returns
  # a mime-type string for svg and jpg files
  get_mime_type(file = "file.svg") %>% expect_equal("image/svg+xml")
  get_mime_type(file = "file.jpg") %>% expect_equal("image/jpeg")
})

test_that("the `get_image_uri()` function works correctly", {

  # Expect that the image URI string based on a PNG test image
  # matches a known good image URI created from that image
  expect_equal(
    get_image_uri(file = system_file("./graphics/test_image.png")),
    readLines(system_file("./graphics/test_image_png_uri.txt"), warn = FALSE))

  # Expect that the beginning of the PNG-based image URI has the MIME
  # type and the encoding type
  grepl(
    "^data:image/png;base64,",
    get_image_uri(file = system_file("./graphics/test_image.png"))) %>%
    expect_true()
})
