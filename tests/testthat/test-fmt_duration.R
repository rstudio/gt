test_that("the `fmt_duration()` function works correctly", {

  # Create an input tibble with a numeric column
  data_tbl <-
    dplyr::tibble(
      num_1 = c(1.0030, 36323.005, 5.000003, -34.5, 31.6, 28.5, NA)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Format the `num_1` column using the defaults for `fmt_duration()`
  expect_equal(
    (tab %>%
       fmt_duration(columns = "num_1", input_units = "days") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1d 4m 19s", "5189w", "5d", "&minus;4w 6d 12h", "4w 3d 14h 24m",
      "4w 12h", "NA")
  )
})
