test_that("info_date_style() works correctly", {

  # Expect that `info_date_style()` is a gt table
  expect_s3_class(info_date_style(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_date_style() |>
      dt_data_get() |>
      dim(),
    c(41, 5)
  )
})

test_that("info_time_style() works correctly", {

  # Expect that `info_time_style()` is a gt table
  expect_s3_class(info_time_style(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_time_style() |>
      dt_data_get() |>
      dim(),
    c(25, 6)
  )
})

test_that("info_currencies() works correctly", {

  # Expect that `info_currencies()` is a gt table
  expect_s3_class(info_currencies(type = "symbol"), c("gt_tbl", "data.frame"))
  expect_s3_class(info_currencies(type = "code", begins_with = "a"), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of
  # specific dimensions
  expect_equal(
    info_currencies() |>
      dt_data_get() |>
      dim(),
    c(172, 5)
  )
})

test_that("info_locales() works correctly", {

  # Expect that `info_locales()` is a gt table
  expect_s3_class(info_locales(), c("gt_tbl", "data.frame"))
  expect_s3_class(info_locales(begins_with = "a"), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_locales() |>
      dt_data_get() |>
      dim(),
    c(574, 5)
  )
})

test_that("info_paletteer() works correctly", {

  # Expect that `info_paletteer()` is a gt table
  expect_s3_class(info_paletteer(), c("gt_tbl", "data.frame"))
  expect_s3_class(info_paletteer(color_pkgs = c("awtools", "dichromat")), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_paletteer() |>
      dt_data_get() |>
      dim(),
    c(840, 4)
  )
})

test_that("info_google_fonts() works correctly", {

  # Expect that `info_google_fonts()` is a gt table
  expect_s3_class(info_google_fonts(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  expect_equal(
    info_google_fonts() |>
      dt_data_get() |>
      dim(),
    c(38, 4)
  )
})

test_that("info_flags() works correctly", {

  # Expect that `info_flags()` is a gt table
  expect_s3_class(info_flags(), c("gt_tbl", "data.frame"))

  # Expect that the function doesn't error
  expect_no_error(info_flags())
})

test_that("info_icons() works correctly", {

  # Expect that `info_icons()` is a gt table
  expect_s3_class(info_icons(), c("gt_tbl", "data.frame"))

  # Expect that the function doesn't error
  expect_no_error(info_icons())
})

test_that("info_unit_conversions() works correctly", {

  # Expect that `info_unit_conversions()` is a gt table
  expect_s3_class(info_unit_conversions(), c("gt_tbl", "data.frame"))

  # Expect that the function doesn't error
  expect_no_error(info_unit_conversions())
})

test_that("info_tf_style() works correctly", {

  # Expect that `info_tf_style()` is a gt table
  expect_s3_class(info_tf_style(), c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of specific dimensions
  # (10 tf_styles, 5 columns: tf_style, format_name, true_val, false_val, locale_aware)
  expect_equal(
    info_tf_style() |>
      dt_data_get() |>
      dim(),
    c(10, 5)
  )

  # Expect that using a locale parameter doesn't error
  expect_no_error(info_tf_style(locale = "fr"))
  expect_no_error(info_tf_style(locale = "de"))
})
