context("Ensuring that the information-providing functions work as expected")

test_that("the `info_date_style()` function works correctly", {

  # Expect that the `info_date_style()` function produces an
  # information table with certain classes
  expect_is(
    info_date_style(),
    c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of
  # specific dimensions
  expect_equal(
    info_date_style() %>%
      dt_data_get() %>%
      dim(),
    c(14, 3))
})

test_that("the `info_time_style()` function works correctly", {

  # Expect that the `info_time_style()` function produces an
  # information table with certain classes
  expect_is(
    info_time_style(),
    c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of
  # specific dimensions
  expect_equal(
    info_time_style() %>%
      dt_data_get() %>%
      dim(),
    c(5, 3))
})

test_that("the `info_google_fonts()` function works correctly", {

  # Expect that the `info_google_fonts()` function produces an
  # information table with certain classes
  expect_is(
    info_google_fonts(),
    c("gt_tbl", "data.frame"))

  # Expect the internal source data frame to be of
  # specific dimensions
  expect_equal(
    info_google_fonts() %>%
      dt_data_get() %>%
      dim(),
    c(37, 4))
})
