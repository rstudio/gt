context("test-fmt_date")

test_that("formatting a column of numeric data as currency values works correctly", {

  # Create an input tibble frame with a single column
  # that contains dates as character values
  data_tbl <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"))

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
          "rows_df", "cols_df", "arrange_groups", "data_df",
          "opts_df", "formats", "transforms")))

  # Extract a vector from the table object for comparison
  # to the original dataset
  date <- (tab %>% as.data.frame())[["date"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$date, date)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>% fmt_date(columns = "num_1", date_style = 1))

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 1) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 2) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", "Friday, February 22, 2013",
      "Monday, September 22, 2014", "Wednesday, January 10, 2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 3) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sun, Oct 15, 2017", "Fri, Feb 22, 2013",
      "Mon, Sep 22, 2014", "Wed, Jan 10, 2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 4) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday 15 October 2017", "Friday 22 February 2013",
      "Monday 22 September 2014", "Wednesday 10 January 2018"))

})

