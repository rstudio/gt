context("LaTeX -- Ensuring that the `fmt_missing()` function works as expected")

test_that("the `fmt_missing()` function works correctly", {

  # Create an input data frame with two columns, both numeric
  data_tbl <-
    data.frame(
      num_1 = c(NA, 74, NA, 93, NA, 76, NA),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE)

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data = data_tbl)

  #
  # Use `fmt_missing()` with various options
  #

  expect_equal(
    (tbl_latex %>%
       fmt_missing(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("---", "74", "---", "93", "---", "76", "---"))

  expect_equal(
    (tbl_latex %>%
       fmt_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("--", "74", "--", "93", "--", "76", "--"))

  expect_equal(
    (tbl_latex %>%
       fmt_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a"))

  expect_equal(
    (tbl_latex %>%
       fmt_missing(columns = "num_2") %>%
       render_formats_test(context = "latex"))[["num_2"]],
    c("34", "74", "23", "93", "35", "76", "57"))

  expect_equal(
    (tbl_latex %>%
       fmt_missing(columns = "num_1", rows = num_2 < 50) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("---", NA, "---", NA, "---", NA, NA))
})
