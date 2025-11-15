test_that("fmt_date() works correctly with character input for all date formats", {

  # Create an input tibble frame with a single column
  # that contains dates as character values
  data_tbl <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"
    ))

  # Create a `tbl_latex` object with `gt()` and the `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Format `date` in various date formats and verify the output
  #

  expect_no_error(d01 <- fmt_date(tbl_latex, columns = "date", date_style = 1))
  expect_no_error(d02 <- fmt_date(tbl_latex, columns = "date", date_style = 2))
  expect_no_error(d03 <- fmt_date(tbl_latex, columns = "date", date_style = 3))
  expect_no_error(d04 <- fmt_date(tbl_latex, columns = "date", date_style = 4))
  expect_no_error(d05 <- fmt_date(tbl_latex, columns = "date", date_style = 5))
  expect_no_error(d06 <- fmt_date(tbl_latex, columns = "date", date_style = 6))
  expect_no_error(d07 <- fmt_date(tbl_latex, columns = "date", date_style = 7))
  expect_no_error(d08 <- fmt_date(tbl_latex, columns = "date", date_style = 8))
  expect_no_error(d09 <- fmt_date(tbl_latex, columns = "date", date_style = 9))
  expect_no_error(d10 <- fmt_date(tbl_latex, columns = "date", date_style = 10))
  expect_no_error(d11 <- fmt_date(tbl_latex, columns = "date", date_style = 11))
  expect_no_error(d12 <- fmt_date(tbl_latex, columns = "date", date_style = 12))
  expect_no_error(d13 <- fmt_date(tbl_latex, columns = "date", date_style = 13))
  expect_no_error(d14 <- fmt_date(tbl_latex, columns = "date", date_style = 14))
  expect_no_error(d15 <- fmt_date(tbl_latex, columns = "date", date_style = 15))

  expect_equal(
    render_formats_test(d01, context = "latex")[["date"]],
    c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10")
  )

  expect_equal(
    render_formats_test(d02, context = "latex")[["date"]],
    c(
      "Sunday, October 15, 2017", "Friday, February 22, 2013",
      "Monday, September 22, 2014", "Wednesday, January 10, 2018"
    )
  )

  expect_equal(
    render_formats_test(d03, context = "latex")[["date"]],
    c(
      "Sun, Oct 15, 2017", "Fri, Feb 22, 2013",
      "Mon, Sep 22, 2014", "Wed, Jan 10, 2018"
    )
  )

  expect_equal(
    render_formats_test(d04, context = "latex")[["date"]],
    c(
      "Sunday 15 October 2017", "Friday 22 February 2013",
      "Monday 22 September 2014", "Wednesday 10 January 2018"
    )
  )

  expect_equal(
    render_formats_test(d05, context = "latex")[["date"]],
    c(
      "October 15, 2017", "February 22, 2013",
      "September 22, 2014", "January 10, 2018"
    )
  )

  expect_equal(
    render_formats_test(d06, context = "latex")[["date"]],
    c("Oct 15, 2017", "Feb 22, 2013", "Sep 22, 2014", "Jan 10, 2018")
  )

  expect_equal(
    render_formats_test(d07, context = "latex")[["date"]],
    c("15 Oct 2017", "22 Feb 2013", "22 Sep 2014", "10 Jan 2018")
  )

  expect_equal(
    render_formats_test(d08, context = "latex")[["date"]],
    c(
      "15 October 2017", "22 February 2013",
      "22 September 2014", "10 January 2018"
    )
  )

  expect_equal(
    render_formats_test(d09, context = "latex")[["date"]],
    c("15 October", "22 February", "22 September", "10 January")
  )

  expect_equal(
    render_formats_test(d10, context = "latex")[["date"]],
    c("15 Oct", "22 Feb", "22 Sep", "10 Jan")
  )

  expect_equal(
    render_formats_test(d11, context = "latex")[["date"]],
    c("2017", "2013", "2014", "2018")
  )

  expect_equal(
    render_formats_test(d12, context = "latex")[["date"]],
    c("October", "February", "September", "January")
  )

  expect_equal(
    render_formats_test(d13, context = "latex")[["date"]],
    c("15", "22", "22", "10")
  )

  expect_equal(
    render_formats_test(d14, context = "latex")[["date"]],
    c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10")
  )

  expect_equal(
    render_formats_test(d15, context = "latex")[["date"]],
    c("17/10/15", "13/02/22", "14/09/22", "18/01/10")
  )
})

test_that("fmt_date() works correctly with Date input.", {
  # Create an input tibble frame with a single column
  # that contains dates as `Date` values
  data_tbl <-
    dplyr::tibble(date = as.Date(c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"
    )))

  # Create a `tbl_latex` object with `gt()` and the `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Format `date` in various date formats and verify the output
  #
  expect_no_error(d01 <- fmt_date(tbl_latex, columns = "date", date_style = 1))
  expect_no_error(d02 <- fmt_date(tbl_latex, columns = "date", date_style = 2))
  expect_no_error(d03 <- fmt_date(tbl_latex, columns = "date", date_style = 3))
  expect_no_error(d04 <- fmt_date(tbl_latex, columns = "date", date_style = 4))
  expect_no_error(d05 <- fmt_date(tbl_latex, columns = "date", date_style = 5))
  expect_no_error(d06 <- fmt_date(tbl_latex, columns = "date", date_style = 6))
  expect_no_error(d07 <- fmt_date(tbl_latex, columns = "date", date_style = 7))
  expect_no_error(d08 <- fmt_date(tbl_latex, columns = "date", date_style = 8))
  expect_no_error(d09 <- fmt_date(tbl_latex, columns = "date", date_style = 9))
  expect_no_error(d10 <- fmt_date(tbl_latex, columns = "date", date_style = 10))
  expect_no_error(d11 <- fmt_date(tbl_latex, columns = "date", date_style = 11))
  expect_no_error(d12 <- fmt_date(tbl_latex, columns = "date", date_style = 12))
  expect_no_error(d13 <- fmt_date(tbl_latex, columns = "date", date_style = 13))
  expect_no_error(d14 <- fmt_date(tbl_latex, columns = "date", date_style = 14))
  expect_no_error(d15 <- fmt_date(tbl_latex, columns = "date", date_style = 15))

  expect_equal(
    render_formats_test(d01, context = "latex")[["date"]],
    c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10")
  )

  expect_equal(
    render_formats_test(d02, context = "latex")[["date"]],
    c(
      "Sunday, October 15, 2017", "Friday, February 22, 2013",
      "Monday, September 22, 2014", "Wednesday, January 10, 2018"
    )
  )

  expect_equal(
    render_formats_test(d03, context = "latex")[["date"]],
    c("Sun, Oct 15, 2017", "Fri, Feb 22, 2013", "Mon, Sep 22, 2014", "Wed, Jan 10, 2018")
  )

  expect_equal(
    render_formats_test(d04, context = "latex")[["date"]],
    c(
      "Sunday 15 October 2017", "Friday 22 February 2013",
      "Monday 22 September 2014", "Wednesday 10 January 2018"
    )
  )

  expect_equal(
    render_formats_test(d05, context = "latex")[["date"]],
    c(
      "October 15, 2017", "February 22, 2013",
      "September 22, 2014", "January 10, 2018"
    )
  )

  expect_equal(
    render_formats_test(d06, context = "latex")[["date"]],
    c("Oct 15, 2017", "Feb 22, 2013", "Sep 22, 2014", "Jan 10, 2018")
  )

  expect_equal(
    render_formats_test(d07, context = "latex")[["date"]],
    c("15 Oct 2017", "22 Feb 2013", "22 Sep 2014", "10 Jan 2018")
  )

  expect_equal(
    render_formats_test(d08, context = "latex")[["date"]],
    c(
      "15 October 2017", "22 February 2013",
      "22 September 2014", "10 January 2018"
    )
  )

  expect_equal(
    render_formats_test(d09, context = "latex")[["date"]],
    c("15 October", "22 February", "22 September", "10 January")
  )

  expect_equal(
    render_formats_test(d10, context = "latex")[["date"]],
    c("15 Oct", "22 Feb", "22 Sep", "10 Jan")
  )

  expect_equal(
    render_formats_test(d11, context = "latex")[["date"]],
    c("2017", "2013", "2014", "2018")
  )

  expect_equal(
    render_formats_test(d12, context = "latex")[["date"]],
    c("October", "February", "September", "January")
  )

  expect_equal(
    render_formats_test(d13, context = "latex")[["date"]],
    c("15", "22", "22", "10")
  )

  expect_equal(
    render_formats_test(d14, context = "latex")[["date"]],
    c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10")
  )

  expect_equal(
    render_formats_test(d15, context = "latex")[["date"]],
    c("17/10/15", "13/02/22", "14/09/22", "18/01/10")
  )
})

test_that("fmt_time() works correctly", {

  # Create an input tibble frame with a single column
  # that contains times as character values
  data_tbl <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"
    ))

  # Create a `tbl_latex` object with `gt()` and the `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Format `time` in various date formats and verify the output
  #
  # Verify no error
  expect_no_error(t1 <- fmt_time(tbl_latex, columns = "time", time_style = 1))
  expect_no_error(t2 <- fmt_time(tbl_latex, columns = "time", time_style = 2))
  expect_no_error(t3 <- fmt_time(tbl_latex, columns = "time", time_style = 3))
  expect_no_error(t4 <- fmt_time(tbl_latex, columns = "time", time_style = 4))
  expect_no_error(t5 <- fmt_time(tbl_latex, columns = "time", time_style = 5))

  # Verify output
  expect_equal(
    render_formats_test(t1, context = "latex")[["time"]],
    c("12:35:23", "15:01:34", "09:45:23", "01:32:00")
  )

  expect_equal(
    render_formats_test(t2, context = "latex")[["time"]],
    c("12:35", "15:01", "09:45", "01:32")
  )

  # FIXME #1481
  expect_equal(
    render_formats_test(t3, context = "latex")[["time"]],
    c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM")
  )

  expect_equal(
    render_formats_test(t4, context = "latex")[["time"]],
    c("12:35 PM", "3:01 PM", "9:45 AM", "1:32 AM")
  )

  expect_equal(
    render_formats_test(t5, context = "latex")[["time"]],
    c("12 PM", "3 PM", "9 AM", "1 AM")
  )
})

test_that("fmt_datetime() works correctly", {

  # Create an input tibble frame with a single column
  # that contains date-times as character values
  data_tbl <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23", "2017-07-12 15:01:34",
      "2017-08-05 09:45:23", "2017-10-23 01:32:00"
    ))

  # Create a `tbl_latex` object with `gt()` and the `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  #
  # Format `time` in various date formats and verify the output
  #
  # Verify no error
  expect_no_error(dt1 <- fmt_datetime(tbl_latex, columns = "datetime", date_style = 1, time_style = 1))
  expect_no_error(dt2 <- fmt_datetime(tbl_latex, columns = "datetime", date_style = 2, time_style = 2))
  expect_no_error(dt3 <- fmt_datetime(tbl_latex, columns = "datetime", date_style = 3, time_style = 3))
  expect_no_error(dt4 <- fmt_datetime(tbl_latex, columns = "datetime", date_style = 4, time_style = 4))
  expect_no_error(dt5 <- fmt_datetime(tbl_latex, columns = "datetime", date_style = 5, time_style = 5))

  # Verify output as expected.
  expect_equal(
    render_formats_test(dt1, context = "latex")[["datetime"]],
    c(
      "2017-06-10 12:35:23", "2017-07-12 15:01:34",
      "2017-08-05 09:45:23", "2017-10-23 01:32:00"
    )
  )

  expect_equal(
    render_formats_test(dt2, context = "latex")[["datetime"]],
    c(
      "Saturday, June 10, 2017 12:35", "Wednesday, July 12, 2017 15:01",
      "Saturday, August 5, 2017 09:45", "Monday, October 23, 2017 01:32"
    )
  )

  # FIXME #1481
  expect_equal(
    render_formats_test(dt3, context = "latex")[["datetime"]],
    c(
      "Sat, Jun 10, 2017 12:35:23 PM", "Wed, Jul 12, 2017 3:01:34 PM",
      "Sat, Aug 5, 2017 9:45:23 AM", "Mon, Oct 23, 2017 1:32:00 AM"
    )
  )

  expect_equal(
    render_formats_test(dt4, context = "latex")[["datetime"]],
    c(
      "Saturday 10 June 2017 12:35 PM", "Wednesday 12 July 2017 3:01 PM",
      "Saturday 5 August 2017 9:45 AM", "Monday 23 October 2017 1:32 AM"
    )
  )

  expect_equal(
    render_formats_test(dt5, context = "latex")[["datetime"]],
    c(
      "June 10, 2017 12 PM", "July 12, 2017 3 PM",
      "August 5, 2017 9 AM", "October 23, 2017 1 AM"
    )
  )
})

test_that("A gt table will properly output a date to LaTeX out of the box", {

  skip("Needs fmt_date() to work.")

  tab <- gt(dplyr::tibble(date = as.Date("2015-12-31"), open = 2060.5901))

  expect_match(
    as_latex(tab),
    "2015-12-31"
  )
})
