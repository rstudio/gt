test_that("fmt_passthrough() works correctly for LaTeX output tables", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      char_1 = c("saturday", "sunday", "monday", "tuesday",
                 "wednesday", "thursday", "friday"),
      char_2 = c("june", "july", "august", "september",
                 "october", "november", "december"),
      num_1 = c(1836.23, 2763.39, 937.29, 643.00, 212.232, 0, -23.24),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE)

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Format `fmt_passthrough()` with various options
  #

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(columns = "char_1") |>
       render_formats_test(context = "latex"))[["char_1"]],
    c("saturday", "sunday", "monday", "tuesday",
      "wednesday", "thursday", "friday"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(columns = "char_2") |>
       render_formats_test(context = "latex"))[["char_2"]],
    c("june", "july", "august", "september",
      "october", "november", "december"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(columns = "num_1") |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("1836.23", "2763.39", "937.29", "643", "212.232", "0", "-23.24"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(
         columns = "num_1",
         pattern = "{x} d"
       ) |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("1836.23 d", "2763.39 d", "937.29 d",
      "643 d", "212.232 d", "0 d", "-23.24 d"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(
         columns = "num_2",
         pattern = "{x}%"
       ) |>
       render_formats_test(context = "latex"))[["num_2"]],
    c("34\\%", "74\\%", "23\\%", "93\\%", "35\\%", "76\\%", "57\\%"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(
         columns = "num_2",
         pattern = "{x}%",
         escape = FALSE
       ) |>
       render_formats_test(context = "latex"))[["num_2"]],
    c("34%", "74%", "23%", "93%", "35%", "76%", "57%"))

  expect_equal(
    (tbl_latex |>
       fmt_passthrough(
         columns = "num_2",
         rows = num_2 < 50,
         pattern = "{x}%"
       ) |>
       render_formats_test(context = "latex"))[["num_2"]],
    c("34\\%", "74", "23\\%", "93", "35\\%", "76", "57"))
})
