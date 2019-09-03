context("Ensuring that the formatting of dates and times works as expected")

test_that("the `fmt_date()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains dates as character values
  data_tbl <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"))

  # Create a `tab` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  # expect_true(
  #   all(
  #     names(attributes(tab)) %in%
  #       c("names", "class", "row.names",
  #         "boxh_df", "stub_df", "footnotes_df", "styles_df",
  #         "rows_df", "cols_df", "col_labels", "grp_labels",
  #         "arrange_groups", "data_df", "opts_df", "formats", "transforms")))

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
    c("2017&#8209;10&#8209;15", "2013&#8209;02&#8209;22",
      "2014&#8209;09&#8209;22", "2018&#8209;01&#8209;10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 2) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday,&nbsp;October&nbsp;15,&nbsp;2017", "Friday,&nbsp;February&nbsp;22,&nbsp;2013",
      "Monday,&nbsp;September&nbsp;22,&nbsp;2014", "Wednesday,&nbsp;January&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 3) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sun,&nbsp;Oct&nbsp;15,&nbsp;2017", "Fri,&nbsp;Feb&nbsp;22,&nbsp;2013",
      "Mon,&nbsp;Sep&nbsp;22,&nbsp;2014", "Wed,&nbsp;Jan&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 4) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday&nbsp;15&nbsp;October&nbsp;2017", "Friday&nbsp;22&nbsp;February&nbsp;2013",
      "Monday&nbsp;22&nbsp;September&nbsp;2014", "Wednesday&nbsp;10&nbsp;January&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 5) %>%
       render_formats_test(context = "html"))[["date"]],
    c("October&nbsp;15,&nbsp;2017", "February&nbsp;22,&nbsp;2013",
      "September&nbsp;22,&nbsp;2014", "January&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 6) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Oct&nbsp;15,&nbsp;2017", "Feb&nbsp;22,&nbsp;2013",
      "Sep&nbsp;22,&nbsp;2014", "Jan&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 7) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;Oct&nbsp;2017", "22&nbsp;Feb&nbsp;2013",
      "22&nbsp;Sep&nbsp;2014", "10&nbsp;Jan&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 8) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;October&nbsp;2017", "22&nbsp;February&nbsp;2013",
      "22&nbsp;September&nbsp;2014", "10&nbsp;January&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 9) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;October", "22&nbsp;February", "22&nbsp;September", "10&nbsp;January"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 10) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017", "2013", "2014", "2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 11) %>%
       render_formats_test(context = "html"))[["date"]],
    c("October", "February", "September", "January"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 12) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15", "22", "22", "10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 13) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 14) %>%
       render_formats_test(context = "html"))[["date"]],
    c("17/10/15", "13/02/22", "14/09/22", "18/01/10"))

  # Create an input tibble frame with a single column
  # that contains dates as `Date` values
  data_tbl <-
    dplyr::tibble(date = as.Date(c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10")))

  # Create a `tab` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  #
  # Format `date` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 1) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017&#8209;10&#8209;15", "2013&#8209;02&#8209;22",
      "2014&#8209;09&#8209;22", "2018&#8209;01&#8209;10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 2) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday,&nbsp;October&nbsp;15,&nbsp;2017", "Friday,&nbsp;February&nbsp;22,&nbsp;2013",
      "Monday,&nbsp;September&nbsp;22,&nbsp;2014", "Wednesday,&nbsp;January&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 3) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sun,&nbsp;Oct&nbsp;15,&nbsp;2017", "Fri,&nbsp;Feb&nbsp;22,&nbsp;2013",
      "Mon,&nbsp;Sep&nbsp;22,&nbsp;2014", "Wed,&nbsp;Jan&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 4) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday&nbsp;15&nbsp;October&nbsp;2017", "Friday&nbsp;22&nbsp;February&nbsp;2013",
      "Monday&nbsp;22&nbsp;September&nbsp;2014", "Wednesday&nbsp;10&nbsp;January&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 5) %>%
       render_formats_test(context = "html"))[["date"]],
    c("October&nbsp;15,&nbsp;2017", "February&nbsp;22,&nbsp;2013",
      "September&nbsp;22,&nbsp;2014", "January&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 6) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Oct&nbsp;15,&nbsp;2017", "Feb&nbsp;22,&nbsp;2013",
      "Sep&nbsp;22,&nbsp;2014", "Jan&nbsp;10,&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 7) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;Oct&nbsp;2017", "22&nbsp;Feb&nbsp;2013",
      "22&nbsp;Sep&nbsp;2014", "10&nbsp;Jan&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 8) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;October&nbsp;2017", "22&nbsp;February&nbsp;2013",
      "22&nbsp;September&nbsp;2014", "10&nbsp;January&nbsp;2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 9) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15&nbsp;October", "22&nbsp;February", "22&nbsp;September", "10&nbsp;January"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 10) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017", "2013", "2014", "2018"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 11) %>%
       render_formats_test(context = "html"))[["date"]],
    c("October", "February", "September", "January"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 12) %>%
       render_formats_test(context = "html"))[["date"]],
    c("15", "22", "22", "10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 13) %>%
       render_formats_test(context = "html"))[["date"]],
    c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10"))

  expect_equal(
    (tab %>%
       fmt_date(columns = "date", date_style = 14) %>%
       render_formats_test(context = "html"))[["date"]],
    c("17/10/15", "13/02/22", "14/09/22", "18/01/10"))
})

test_that("the `fmt_time()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains times as character values
  data_tbl <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"))

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  # expect_true(
  #   all(
  #     names(attributes(tab)) %in%
  #       c("names", "class", "row.names",
  #         "boxh_df", "stub_df", "footnotes_df", "styles_df",
  #         "rows_df", "cols_df", "col_labels", "grp_labels",
  #         "arrange_groups", "data_df", "opts_df", "formats", "transforms")))

  # Extract a vector from the table object for comparison
  # to the original dataset
  time <- (tab %>% as.data.frame())[["time"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$time, time)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>% fmt_time(columns = "num_1", time_style = 1))

  #
  # Format `time` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_time(columns = "time", time_style = 1) %>%
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23", "15:01:34", "09:45:23", "01:32:00"))

  expect_equal(
    (tab %>%
       fmt_time(columns = "time", time_style = 2) %>%
       render_formats_test(context = "default"))[["time"]],
    c("12:35", "15:01", "09:45", "01:32"))

  expect_equal(
    (tab %>%
       fmt_time(columns = "time", time_style = 3) %>%
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM"))

  expect_equal(
    (tab %>%
       fmt_time(columns = "time", time_style = 4) %>%
       render_formats_test(context = "default"))[["time"]],
    c("12:35 PM", "3:01 PM", "9:45 AM", "1:32 AM"))

  expect_equal(
    (tab %>%
       fmt_time(columns = "time", time_style = 5) %>%
       render_formats_test(context = "default"))[["time"]],
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

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  # expect_true(
  #   all(
  #     names(attributes(tab)) %in%
  #       c("names", "class", "row.names",
  #         "boxh_df", "stub_df", "footnotes_df", "styles_df",
  #         "rows_df", "cols_df", "col_labels", "grp_labels",
  #         "arrange_groups", "data_df", "opts_df", "formats", "transforms")))

  # Extract a vector from the table object for comparison
  # to the original dataset
  datetime <- (tab %>% as.data.frame())[["datetime"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$datetime, datetime)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>%
      fmt_datetime(
        columns = "num_1",
        date_style = 1,
        time_style = 1)
  )

  #
  # Format `time` in various date formats and verify the output
  #

  expect_equal(
    (tab %>%
       fmt_datetime(columns = "datetime", date_style = 1, time_style = 1) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("2017-06-10 12:35:23", "2017-07-12 15:01:34",
      "2017-08-05 09:45:23", "2017-10-23 01:32:00"))

  expect_equal(
    (tab %>%
       fmt_datetime(columns = "datetime", date_style = 2, time_style = 2) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("Saturday, June 10, 2017 12:35", "Wednesday, July 12, 2017 15:01",
      "Saturday, August 5, 2017 09:45", "Monday, October 23, 2017 01:32"))

  expect_equal(
    (tab %>%
       fmt_datetime(columns = "datetime", date_style = 3, time_style = 3) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("Sat, Jun 10, 2017 12:35:23 PM", "Wed, Jul 12, 2017 3:01:34 PM",
      "Sat, Aug 5, 2017 9:45:23 AM", "Mon, Oct 23, 2017 1:32:00 AM"))

  expect_equal(
    (tab %>%
       fmt_datetime(columns = "datetime", date_style = 4, time_style = 4) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("Saturday 10 June 2017 12:35 PM", "Wednesday 12 July 2017 3:01 PM",
      "Saturday 5 August 2017 9:45 AM", "Monday 23 October 2017 1:32 AM"))

  expect_equal(
    (tab %>%
       fmt_datetime(columns = "datetime", date_style = 5, time_style = 5) %>%
       render_formats_test(context = "default"))[["datetime"]],
    c("June 10, 2017 12 PM", "July 12, 2017 3 PM",
      "August 5, 2017 9 AM", "October 23, 2017 1 AM"))
})

