test_that("fmt_bins() works correctly", {

  # Create an input data frame with a single column of
  # character-based intervals
  data_tbl <-
    data.frame(
      a = c(
        "(0,10]", "(10,15]", "(15,20]", "(20, 40]"
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Extract vectors from the table object for comparison
  # to the original dataset
  a <- dt_data_get(tab)[["a"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$a, a)

  # Expect an error when attempting to format a column that does not exist
  expect_error(tab |> fmt_bins(columns = b))

  # Format the `a` column to intervals
  expect_equal(
    (tab |>
       fmt_bins(columns = a) |>
       render_formats_test(context = "html"))[["a"]],
    c("0–10", "10–15", "15–20", "20– 40")
  )

  expect_equal(
    (tab |>
       fmt_bins(columns = a, sep = "-") |>
       render_formats_test(context = "html"))[["a"]],
    c("0-10", "10-15", "15-20", "20- 40")
  )

  expect_equal(
    (tab |>
       fmt_bins(columns = a, sep = "/") |>
       render_formats_test(context = "html"))[["a"]],
    c("0/10", "10/15", "15/20", "20/ 40")
  )

  expect_equal(
    (tab |>
       fmt_bins(columns = a, sep = "/", fmt = ~ fmt_number(., decimals = 3)) |>
       render_formats_test(context = "html"))[["a"]],
    c("0.000/10.000", "10.000/15.000", "15.000/20.000", "20.000/40.000")
  )

  # Expect that a column with NAs will work fine with `fmt_bins()`,
  # it'll just produce NA values
  na_col_tbl <- gt(dplyr::tibble(a = rep(NA_real_, 10), b = 1:10))

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_bins()`
  expect_no_error(
    na_col_tbl |> fmt_bins(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_bins(columns = a, rows = 1:5) |> as_raw_html()
  )
})
