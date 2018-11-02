context("Ensuring that the `fmt_missing()` function works as expected")

test_that("the `fmt_missing()` function works correctly", {

  # Create an input data frame with two columns, both numeric
  data_tbl <-
    data.frame(
      num_1 = c(NA, 74, NA, 93, NA, 76, NA),
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
  num_1 <- (tab %>% as.data.frame())[["num_1"]]
  num_2 <- (tab %>% as.data.frame())[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$num_1, num_1)
  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>% fmt_missing(columns = "num_3"))

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("---", "74", "---", "93", "---", "76", "---"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("—", "74", "—", "93", "—", "76", "—"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("–", "74", "–", "93", "–", "76", "–"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("--", "74", "--", "93", "--", "76", "--"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_2") %>%
       render_formats_test(context = "default"))[["num_2"]],
    c("34", "74", "23", "93", "35", "76", "57"))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1", rows = num_2 < 50) %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("---", NA, "---", NA, "---", NA, NA))

  expect_equal(
    (tab %>%
       fmt_missing(columns = "num_1", rows = num_2 < 50) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("—", NA, "—", NA, "—", NA, NA))
})

