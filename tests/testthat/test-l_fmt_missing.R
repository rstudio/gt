test_that("sub_missing() works correctly for LaTeX output tables", {

  # Create an input data frame with two columns, both numeric
  data_tbl <-
    data.frame(
      num_1 = c(NA, 74, NA, 93, NA, 76, NA),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE
    )

  # Create a `tbl_latex` object with `gt()` and the `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Use `sub_missing()` with various options
  #

  expect_equal(
    (tbl_latex |>
       sub_missing(columns = "num_1") |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "74", "—", "93", "—", "76", "—")
  )

  expect_equal(
    (tbl_latex |>
       sub_missing(columns = "num_1", missing_text = "--") |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("–", "74", "–", "93", "–", "76", "–")
  )

  expect_equal(
    (tbl_latex |>
       sub_missing(columns = "num_1", missing_text = "a") |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tbl_latex |>
       sub_missing(columns = "num_2") |>
       render_formats_test(context = "latex"))[["num_2"]],
    c("34", "74", "23", "93", "35", "76", "57")
  )

  expect_equal(
    (tbl_latex |>
       sub_missing(columns = "num_1", rows = num_2 < 50) |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "74", "—", "93", "—", "76", "NA")
  )

  # Format columns with `fmt_number()` then use
  # `sub_missing()` on all columns (the two functions
  # shouldn't wipe out formatting on cells)
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = everything(),
         decimals = 3
       ) |>
       sub_missing(columns = everything()) |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "74.000", "—", "93.000", "—", "76.000", "—")
  )

  # Reverse the ordering: use `sub_missing()` first
  # then `fmt_number()`; expect the same output as before
  expect_equal(
    (tbl_latex |>
       sub_missing(columns = everything()) |>
       fmt_number(
         columns = everything(),
         decimals = 3
       ) |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "74.000", "—", "93.000", "—", "76.000", "—")
  )
})
