context("Ensuring that the image-based functions work as expected")

test_that("the `test_image()` function works correctly", {

  # Expect that the `test_image()` function returns paths for
  # either a PNG or SVG test image
  test_image(type = "png") %>%
    expect_match(".*/test_image.png")

  test_image(type = "svg") %>%
    expect_match(".*/test_image.svg")
})

test_that("the `local_image()` function works correctly", {

  # Expect that the `local_image()` function returns an image tag
  # with the PNG encoded within a `src` attr
  local_image(file = test_image(type = "png"), height = px(70)) %>%
    expect_match("^<img cid=.*?test_image.png. src=.data:image.png;base64.*?height:70px.*")

  # Expect that the `local_image()` function returns an image tag
  # with the SVG encoded within a `src` attr
  local_image(file = test_image(type = "svg"), height = px(70)) %>%
    expect_match("^<img cid=.*?test_image.svg. src=.data:image.svg.xml;base64.*?height:70px.*")

  # Expect that the `local_image()` function returns an image tag
  # with the PNG encoded within a `src` attr (even if a number is provided
  # to `height`)
  local_image(file = test_image(type = "png"), height = 70) %>%
    expect_match("^<img cid=.*?test_image.png. src=.data:image.png;base64.*?height:70px.*")

  # Create a `tbl_html` that contains local images in column `b`
  tbl_html <-
    dplyr::tibble(
      a = 1:5,
      b = c(1.6, 9.6, 5.3, 3.5, 6.3)) %>%
    gt() %>%
    text_transform(
      locations = cells_data(vars(b)),
      fn = function(x) {
        x <- as.numeric(x)
        ifelse(
          x >= 5,
          local_image(file = test_image(type = "svg"), height = px(x * 10)),
          local_image(file = test_image(type = "png"), height = px(x * 10)))
      })

  # Expect that PNG image tags are in the rendered table
  tbl_html %>%
    render_as_html() %>%
    expect_match("<img cid=.*?test_image.png. src=.data:image.png;base64.*?")

  # Expect that SVG image tags are in the rendered table
  tbl_html %>%
    render_as_html() %>%
    expect_match("<img cid=.*?test_image.svg. src=.data:image.svg.xml;base64.*?")
})

test_that("the `web_image()` function works correctly", {

  url <- "https://upload.wikimedia.org/wikipedia/commons/thumb/3/30/Googlelogo.png/320px-Googlelogo.png"

  # Expect that the `web_image()` function returns an image tag
  web_image(url = url, height = px(200)) %>%
    expect_match(paste0("^<img src=.", url, ". style=.height:200px;.>"))

  # Expect that the `web_image()` function returns an image tag
  # (even if a number is provided to `height`)
  web_image(url = url, height = 200) %>%
    expect_match(paste0("^<img src=.", url, ". style=.height:200px;.>"))

  # Expect that the `web_image()` function returns an image tag
  # (even if a string is provided to `height`)
  web_image(url = url, height = "200px") %>%
    expect_match(paste0("^<img src=.", url, ". style=.height:200px;.>"))
})
