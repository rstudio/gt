context("LaTeX -- Ensuring that the formatting of dates and times works as expected")

test_that("the `fmt_date()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains dates as character values
  data_tbl <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"))

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data = data_tbl)

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 1) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 2) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("Sunday, October 15, 2017", "Friday, February 22, 2013",
      "Monday, September 22, 2014", "Wednesday, January 10, 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 3) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("Sun, Oct 15, 2017", "Fri, Feb 22, 2013",
      "Mon, Sep 22, 2014", "Wed, Jan 10, 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 4) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("Sunday 15 October 2017", "Friday 22 February 2013",
      "Monday 22 September 2014", "Wednesday 10 January 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 5) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("October 15, 2017", "February 22, 2013",
      "September 22, 2014", "January 10, 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 6) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("Oct 15, 2017", "Feb 22, 2013",
      "Sep 22, 2014", "Jan 10, 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 7) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("15 Oct 2017", "22 Feb 2013", "22 Sep 2014", "10 Jan 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 8) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("15 October 2017", "22 February 2013",
      "22 September 2014", "10 January 2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 9) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("15 October", "22 February", "22 September", "10 January"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 10) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("2017", "2013", "2014", "2018"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 11) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("October", "February", "September", "January"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 12) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("15", "22", "22", "10"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 13) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10"))

  expect_equal(
    (tbl_latex %>%
       fmt_date(columns = "date", date_style = 14) %>%
       render_formats_test(context = "latex"))[["date"]],
    c("17/10/15", "13/02/22", "14/09/22", "18/01/10"))
})

test_that("the `fmt_time()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains times as character values
  data_tbl <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"))

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data = data_tbl)

  #
  # Format `time` in various date formats and verify the output
  #

  expect_equal(
    (tbl_latex %>%
       fmt_time(columns = "time", time_style = 1) %>%
       render_formats_test(context = "latex"))[["time"]],
    c("12:35:23", "15:01:34", "9:45:23", "1:32:00"))

  expect_equal(
    (tbl_latex %>%
       fmt_time(columns = "time", time_style = 2) %>%
       render_formats_test(context = "latex"))[["time"]],
    c("12:35", "15:01", "9:45", "1:32"))

  expect_equal(
    (tbl_latex %>%
       fmt_time(columns = "time", time_style = 3) %>%
       render_formats_test(context = "latex"))[["time"]],
    c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM"))

  expect_equal(
    (tbl_latex %>%
       fmt_time(columns = "time", time_style = 4) %>%
       render_formats_test(context = "latex"))[["time"]],
    c("12:35 PM", "3:01 PM", "9:45 AM", "1:32 AM"))

  expect_equal(
    (tbl_latex %>%
       fmt_time(columns = "time", time_style = 5) %>%
       render_formats_test(context = "latex"))[["time"]],
    c("12 PM", "3 PM", "9 AM", "1 AM"))
})

test_that("the `fmt_datetime()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains date-times as character values
  data_tbl <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23",
      "2017-07-12 15:01:34",
      "2017-08-05 09:45:23",
      "2017-10-23 01:32:00"))

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data = data_tbl)

  #
  # Format `time` in various date formats and verify the output
  #

  expect_equal(
    (tbl_latex %>%
       fmt_datetime(columns = "datetime", date_style = 1, time_style = 1) %>%
       render_formats_test(context = "latex"))[["datetime"]],
    c("2017-06-10 12:35:23", "2017-07-12 15:01:34",
      "2017-08-05 9:45:23", "2017-10-23 1:32:00"))

  expect_equal(
    (tbl_latex %>%
       fmt_datetime(columns = "datetime", date_style = 2, time_style = 2) %>%
       render_formats_test(context = "latex"))[["datetime"]],
    c("Saturday, June 10, 2017 12:35", "Wednesday, July 12, 2017 15:01",
      "Saturday, August 5, 2017 9:45", "Monday, October 23, 2017 1:32"))

  expect_equal(
    (tbl_latex %>%
       fmt_datetime(columns = "datetime", date_style = 3, time_style = 3) %>%
       render_formats_test(context = "latex"))[["datetime"]],
    c("Sat, Jun 10, 2017 12:35:23 PM", "Wed, Jul 12, 2017 3:01:34 PM",
      "Sat, Aug 5, 2017 9:45:23 AM", "Mon, Oct 23, 2017 1:32:00 AM"))

  expect_equal(
    (tbl_latex %>%
       fmt_datetime(columns = "datetime", date_style = 4, time_style = 4) %>%
       render_formats_test(context = "latex"))[["datetime"]],
    c("Saturday 10 June 2017 12:35 PM", "Wednesday 12 July 2017 3:01 PM",
      "Saturday 5 August 2017 9:45 AM", "Monday 23 October 2017 1:32 AM"))

  expect_equal(
    (tbl_latex %>%
       fmt_datetime(columns = "datetime", date_style = 5, time_style = 5) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("June 10, 2017 12 PM", "July 12, 2017 3 PM",
      "August 5, 2017 9 AM", "October 23, 2017 1 AM"))
})
