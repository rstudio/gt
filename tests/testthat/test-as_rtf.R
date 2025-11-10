test_that("table with image refs work - local only",{

  skip_on_ci()

  ref_png <- system.file("graphics", "test_image.png", package = "gt")
  ref_jpeg <- system.file("graphics", "test_image.jpeg", package = "gt")

  temp_png <- file.path(tempdir(), "test_image.png")
  temp_jpeg <- file.path(tempdir(), "test_image.jpeg")

  file.copy(ref_png, temp_png)
  file.copy(ref_jpeg, temp_jpeg)

  image_gt <- dplyr::tribble(
    ~md,
    paste0(c(temp_png,temp_jpeg), collapse = ", "), ## two images next to each other
    temp_png # single image, square
  ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  rtf_output <- as_rtf(image_gt)

  expect_equal(
    length(gregexpr("pngblip", rtf_output)[[1]]),2
  )
  expect_equal(
    length(gregexpr("jpegblip", rtf_output)[[1]]),1
  )
})

test_that("table with image refs work - https",{

  skip_on_ci()

  https_image_gt <-
    dplyr::tribble(
    ~https_image,
    "https://gt.rstudio.com/reference/figures/gt_tables_footer.png"
  ) |>
    gt() |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  rtf_output <- as_rtf(https_image_gt)

  expect_true(
    grepl("pngblip", rtf_output)
  )
})

test_that("table with image refs work - local only - setting image widths and heights",{

  skip_on_ci()

  ref_png <- system.file("graphics", "test_image.png", package = "gt")
  ref_jpeg <- system.file("graphics", "test_image.jpeg", package = "gt")

  temp_png <- file.path(tempdir(),"test_image.png")
  temp_jpeg <- file.path(tempdir(),"test_image.jpeg")


  file.copy(ref_png, temp_png)
  file.copy(ref_jpeg, temp_jpeg)

  gt <-
    dplyr::tribble(
    ~md,
    paste0(c(temp_png,temp_jpeg), collapse = ", "), ## two images next to each other
    temp_png # single image, square
  ) |>
    gt()

  image_gt_height_and_width <-
    gt |>
    fmt_image(columns = everything(), sep = ",", height = "1in", width = "2in")

  image_gt_height <-
    gt |>
    fmt_image(columns = everything(), sep = ",", height = "2in")

  image_gt_width <-
    gt |>
    fmt_image(columns = everything(), sep = ",", width = "1in")

  # inches are 1440 twips
  expect_true(
    grepl(
      "picwgoal2880\\pichgoal1440",
      image_gt_height_and_width |> as_rtf(),
      fixed = TRUE
    )
  )

  # square displays
  expect_true(
    grepl(
      "picwgoal2880\\pichgoal2880",
      image_gt_height |> as_rtf(),
      fixed = TRUE
    )
  )

  expect_true(
    grepl(
      "picwgoal1440\\pichgoal1440",
      image_gt_width |> as_rtf(),
      fixed = TRUE
    )
  )
})
