test_that("The `info_date_style()` function works correctly", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_s3_class(info_date_style(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_date_style() %>%
      dt_data_get() %>%
      dim(),
    c(41, 5)
  )
})

test_that("The `info_time_style()` function works correctly", {

  # Expect that the `info_time_style()` function produces an
  # information table with certain classes
  expect_s3_class(info_time_style(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_time_style() %>%
      dt_data_get() %>%
      dim(),
    c(25, 6)
  )
})

test_that("The `info_currencies()` function works correctly", {

  # Expect that the `info_currencies()` function produces an
  # information table with certain classes
  expect_s3_class(info_currencies(type = "symbol"), c("gt_tbl", "data.frame"))
  expect_s3_class(info_currencies(type = "code", begins_with = "a"), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of
  # specific dimensions
  expect_equal(
    info_currencies() %>%
      dt_data_get() %>%
      dim(),
    c(172, 5)
  )
})

test_that("The `info_locales()` function works correctly", {

  # Expect that the `info_locales()` function produces an
  # information table with certain classes
  expect_s3_class(info_locales(), c("gt_tbl", "data.frame"))
  expect_s3_class(info_locales(begins_with = "a"), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_locales() %>%
      dt_data_get() %>%
      dim(),
    c(574, 5)
  )
})

test_that("The `info_paletteer()` function works correctly", {

  # Expect that the `info_paletteer()` function produces an
  # information table with certain classes
  expect_s3_class(info_paletteer(), c("gt_tbl", "data.frame"))
  expect_s3_class(info_paletteer(color_pkgs = c("awtools", "dichromat")), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_paletteer() %>%
      dt_data_get() %>%
      dim(),
    c(840, 4)
  )
})

test_that("The `info_google_fonts()` function works correctly", {

  # Expect that the `info_google_fonts()` function produces an
  # information table with certain classes
  expect_s3_class(info_google_fonts(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_google_fonts() %>%
      dt_data_get() %>%
      dim(),
    c(38, 4)
  )
})
