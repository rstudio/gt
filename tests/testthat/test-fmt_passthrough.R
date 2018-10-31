context("Ensuring that the `fmt_passthrough()` function works as expected")

test_that("the `fmt_passthrough()` function works correctly", {

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

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  expect_true(
    all(
      names(attributes(tab)) %in%
        c("names", "class", "row.names",
          "boxh_df", "stub_df", "footnotes_df", "styles_df",
          "rows_df", "cols_df", "col_labels", "grp_labels",
          "arrange_groups", "data_df", "opts_df", "formats", "transforms")))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char_1 <- (tab %>% as.data.frame())[["char_1"]]
  char_2 <- (tab %>% as.data.frame())[["char_2"]]
  num_1 <- (tab %>% as.data.frame())[["num_1"]]
  num_2 <- (tab %>% as.data.frame())[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$char_1, char_1)
  expect_equal(data_tbl$char_2, char_2)
  expect_equal(data_tbl$num_1, num_1)
  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>% fmt_passthrough(columns = "num_3"))

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "char_1") %>%
       render_formats_test(context = "default"))[["char_1"]],
    c("saturday", "sunday", "monday", "tuesday",
      "wednesday", "thursday", "friday"))

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "char_2") %>%
       render_formats_test(context = "default"))[["char_2"]],
    c("june", "july", "august", "september",
      "october", "november", "december"))

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "num_1") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("1836.23", "2763.39", "937.29", "643", "212.232", "0", "-23.24"))

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "num_1", pattern = "{x} d") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("1836.23 d", "2763.39 d", "937.29 d",
      "643 d", "212.232 d", "0 d", "-23.24 d"))

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "num_2", pattern = "{x}%") %>%
       render_formats_test(context = "default"))[["num_2"]],
    c("34%", "74%", "23%", "93%", "35%", "76%", "57%"))

  expect_equal(
    (tab %>%
       fmt_passthrough(columns = "num_2", rows = num_2 < 50, pattern = "{x}%") %>%
       render_formats_test(context = "default"))[["num_2"]],
    c("34%", NA, "23%", NA, "35%", NA, NA))
})
