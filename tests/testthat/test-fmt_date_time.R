library(lubridate)

test_that("the `fmt_date()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains dates as character values
  data_tbl <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01"
    ))

  # Create a `tab` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  date <- (tab %>% dt_data_get())[["date"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$date, date)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% fmt_date(columns = "num_1", date_style = 1))

  # Create three gt objects with a `date` column having different types
  tab_1 <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01"
    )) %>%
    gt()

  tab_2 <-
    dplyr::tibble(date = as.Date(c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01"
    ))) %>%
    gt()

  tab_3 <-
    dplyr::tibble(date = c(
      "2017-10-15 20:00:10", "2013-02-22 00:00:00",
      "2014-09-22 23:59:59", "2018-01-10 06:30:34",
      "2000-01-01 12:00:00"
    )) %>%
    dplyr::mutate(date = lubridate::ymd_hms(date)) %>%
    gt()

  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2, tab_3)

  #
  # Format `date` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 1) %>%
         render_formats_test(context = "html"))[["date"]],
      c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 2) %>%
         render_formats_test(context = "html"))[["date"]],
      c("Sunday, October 15, 2017", "Friday, February 22, 2013",
        "Monday, September 22, 2014", "Wednesday, January 10, 2018",
        "Saturday, January 1, 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 3) %>%
         render_formats_test(context = "html"))[["date"]],
      c("Sun, Oct 15, 2017", "Fri, Feb 22, 2013",
        "Mon, Sep 22, 2014", "Wed, Jan 10, 2018",
        "Sat, Jan 1, 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 4) %>%
         render_formats_test(context = "html"))[["date"]],
      c("Sunday 15 October 2017", "Friday 22 February 2013",
        "Monday 22 September 2014", "Wednesday 10 January 2018",
        "Saturday 1 January 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 5) %>%
         render_formats_test(context = "html"))[["date"]],
      c("October 15, 2017", "February 22, 2013",
        "September 22, 2014", "January 10, 2018",
        "January 1, 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 6) %>%
         render_formats_test(context = "html"))[["date"]],
      c("Oct 15, 2017", "Feb 22, 2013", "Sep 22, 2014",
        "Jan 10, 2018", "Jan 1, 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 7) %>%
         render_formats_test(context = "html"))[["date"]],
      c("15 Oct 2017", "22 Feb 2013", "22 Sep 2014",
        "10 Jan 2018", "1 Jan 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 8) %>%
         render_formats_test(context = "html"))[["date"]],
      c("15 October 2017", "22 February 2013", "22 September 2014",
        "10 January 2018", "1 January 2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 9) %>%
         render_formats_test(context = "html"))[["date"]],
      c("15 October", "22 February", "22 September", "10 January", "1 January")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 10) %>%
         render_formats_test(context = "html"))[["date"]],
      c("2017", "2013", "2014", "2018", "2000")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 11) %>%
         render_formats_test(context = "html"))[["date"]],
      c("October", "February", "September", "January", "January")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 12) %>%
         render_formats_test(context = "html"))[["date"]],
      c("15", "22", "22", "10", "01")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 13) %>%
         render_formats_test(context = "html"))[["date"]],
      c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10", "2000/01/01")
    )

    expect_equal(
      (tab %>%
         fmt_date(columns = "date", date_style = 14) %>%
         render_formats_test(context = "html"))[["date"]],
      c("17/10/15", "13/02/22", "14/09/22", "18/01/10", "00/01/01")
    )
  }

  # Ensure that using named `date_style` values results in
  # equivalent output as compared to using numbered `date_style`s
  date_style_names <- date_formats()[["format_name"]]

  for (tab in gt_tables) {

    for (i in 1:14) {

      expect_equal(
        (tab %>%
           fmt_date(columns = "date", date_style = i) %>%
           render_formats_test(context = "html"))[["date"]],
        (tab %>%
           fmt_date(columns = "date", date_style = date_style_names[i]) %>%
           render_formats_test(context = "html"))[["date"]]
      )

      expect_equal(
        (tab %>%
           fmt_date(columns = "date", date_style = i) %>%
           render_formats_test(context = "html"))[["date"]],
        (tab %>%
           fmt_date(columns = "date", date_style = as.character(i)) %>%
           render_formats_test(context = "html"))[["date"]]
      )
    }
  }

  # Expect errors if invalid input is provided to `fmt_date()`
  expect_error(tab_1 %>% fmt_date(columns = "date", date_style = "none"))
  expect_error(tab_1 %>% fmt_date(columns = "date", date_style = 50))

  # Expect an error if providing a time as input for `fmt_date()`
  expect_error(
    dplyr::tibble(time = c(
      "23:01", "15:30", "08:22"
    )) %>%
      gt() %>%
      fmt_date(columns = "time") %>%
      as_raw_html(inline_css = FALSE)
  )

  # Expect an error if any string-based dates are invalid
  expect_error(
    dplyr::tibble(date = c("2013-12-30", "2017-30-15")) %>%
      gt() %>%
      fmt_date(columns = "date") %>%
      as_raw_html(inline_css = FALSE)
  )
})

test_that("the `fmt_time()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains times as character values
  data_tbl <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"
    ))

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  time <- (tab %>% dt_data_get())[["time"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$time, time)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% fmt_time(columns = "num_1", time_style = 1))

  # Create three gt objects with a `time` column having different types
  tab_1 <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"
    )) %>%
    gt()

  tab_2 <-
    dplyr::tibble(time = c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )) %>%
    gt()

  tab_3 <-
    dplyr::tibble(time = c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )) %>%
    dplyr::mutate(time = lubridate::ymd_hms(time)) %>%
    gt()


  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2, tab_3)

  #
  # Format `time` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab %>%
         fmt_time(columns = "time", time_style = 1) %>%
         render_formats_test(context = "default"))[["time"]],
      c("12:35:23", "15:01:34", "09:45:23", "01:32:00")
    )

    expect_equal(
      (tab %>%
         fmt_time(columns = "time", time_style = 2) %>%
         render_formats_test(context = "default"))[["time"]],
      c("12:35", "15:01", "09:45", "01:32")
    )

    expect_equal(
      (tab %>%
         fmt_time(columns = "time", time_style = 3) %>%
         render_formats_test(context = "default"))[["time"]],
      c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM")
    )

    expect_equal(
      (tab %>%
         fmt_time(columns = "time", time_style = 4) %>%
         render_formats_test(context = "default"))[["time"]],
      c("12:35 PM", "3:01 PM", "9:45 AM", "1:32 AM")
    )

    expect_equal(
      (tab %>%
         fmt_time(columns = "time", time_style = 5) %>%
         render_formats_test(context = "default"))[["time"]],
      c("12 PM", "3 PM", "9 AM", "1 AM")
    )
  }

  # Ensure that using named `time_style` values results in
  # equivalent output as compared to using numbered `time_style`s
  time_style_names <- time_formats()[["format_name"]]

  for (tab in gt_tables) {

    for (i in 1:5) {

      expect_equal(
        (tab %>%
           fmt_time(columns = "time", time_style = i) %>%
           render_formats_test(context = "html"))[["time"]],
        (tab %>%
           fmt_time(columns = "time", time_style = time_style_names[i]) %>%
           render_formats_test(context = "html"))[["time"]]
      )

      expect_equal(
        (tab %>%
           fmt_time(columns = "time", time_style = i) %>%
           render_formats_test(context = "html"))[["time"]],
        (tab %>%
           fmt_time(columns = "time", time_style = as.character(i)) %>%
           render_formats_test(context = "html"))[["time"]]
      )
    }
  }

  # Create a gt table that has `Date` values in the `time` column
  tab_4 <-
    dplyr::tibble(time = as.Date(c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    ))) %>%
    gt()

  expect_equal(
    (tab_4 %>%
       fmt_time(columns = "time", time_style = 1) %>%
       render_formats_test(context = "default"))[["time"]],
    rep("00:00:00", 4)
  )

  expect_equal(
    (tab_4 %>%
       fmt_time(columns = "time", time_style = 2) %>%
       render_formats_test(context = "default"))[["time"]],
    rep("00:00", 4)
  )

  expect_equal(
    (tab_4 %>%
       fmt_time(columns = "time", time_style = 3) %>%
       render_formats_test(context = "default"))[["time"]],
    rep("12:00:00 AM", 4)
  )

  expect_equal(
    (tab_4 %>%
       fmt_time(columns = "time", time_style = 4) %>%
       render_formats_test(context = "default"))[["time"]],
    rep("12:00 AM", 4)
  )

  expect_equal(
    (tab_4 %>%
       fmt_time(columns = "time", time_style = 5) %>%
       render_formats_test(context = "default"))[["time"]],
    rep("12 AM", 4)
  )

  # Expect errors if invalid input is provided to `fmt_time()`
  expect_error(tab_1 %>% fmt_time(columns = "time", time_style = "none"))
  expect_error(tab_1 %>% fmt_time(columns = "time", time_style = 50))

  # Expect that mixed, string-based dates and date-times
  # will result in the time value always being "00:00"
  expect_equal(
    (dplyr::tibble(date = c("2013-12-30 12:30", "2017-03-15")) %>%
      gt() %>%
      fmt_time(columns = "date") %>%
      render_formats_test(context = "default"))[["date"]],
    rep("00:00", 2)
  )
  expect_equal(
    (dplyr::tibble(date = c("2013-12-30", "2017-03-15 12:30")) %>%
       gt() %>%
       fmt_time(columns = "date") %>%
       render_formats_test(context = "default"))[["date"]],
    rep("00:00", 2)
  )

  # Don't expect an error if any string-based date-times have invalid
  # time components
  expect_error(
    regexp = NA,
    dplyr::tibble(date = c("2013-12-30 25:30", "2017-03-15 02:32")) %>%
      gt() %>%
      fmt_time(columns = "date")
  )

  # Expect an error if any string-based date-times have invalid
  # date components
  expect_error(
    dplyr::tibble(date = c("2013-14-30 22:30", "2017-03-15 02:32")) %>%
      gt() %>%
      fmt_time(columns = "date") %>%
      as_raw_html(inline_css = FALSE)
  )
})

test_that("the `fmt_datetime()` function works correctly", {

  # Create an input tibble frame with a single column
  # that contains date-times as character values
  data_tbl <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23",
      "2017-07-12 15:01:34",
      "2017-08-05 09:45:23",
      "2017-10-23 01:32:00",
      "2000-01-01 00:00:00"
    ))

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  datetime <- (tab %>% dt_data_get())[["datetime"]]

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
        time_style = 1
      )
  )

  # Create two gt objects with a `datetime` column having different types
  tab_1 <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23", "2017-07-12 15:01:34", "2017-08-05 09:45:23",
      "2017-10-23 01:32:00", "2000-01-01 00:00:00"
    )) %>%
    gt()

  tab_2 <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23", "2017-07-12 15:01:34", "2017-08-05 09:45:23",
      "2017-10-23 01:32:00", "2000-01-01 00:00:00"
    )) %>%
    dplyr::mutate(datetime = lubridate::ymd_hms(datetime)) %>%
    gt()

  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2)


  #
  # Format `datetime` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab %>%
         fmt_datetime(columns = "datetime", date_style = 1, time_style = 1) %>%
         render_formats_test(context = "default"))[["datetime"]],
      c("2017-06-10 12:35:23", "2017-07-12 15:01:34", "2017-08-05 09:45:23",
        "2017-10-23 01:32:00", "2000-01-01 00:00:00")
    )

    expect_equal(
      (tab %>%
         fmt_datetime(columns = "datetime", date_style = 2, time_style = 2) %>%
         render_formats_test(context = "default"))[["datetime"]],
      c("Saturday, June 10, 2017 12:35", "Wednesday, July 12, 2017 15:01",
        "Saturday, August 5, 2017 09:45", "Monday, October 23, 2017 01:32",
        "Saturday, January 1, 2000 00:00")
    )

    expect_equal(
      (tab %>%
         fmt_datetime(columns = "datetime", date_style = 3, time_style = 3) %>%
         render_formats_test(context = "default"))[["datetime"]],
      c("Sat, Jun 10, 2017 12:35:23 PM", "Wed, Jul 12, 2017 3:01:34 PM",
        "Sat, Aug 5, 2017 9:45:23 AM", "Mon, Oct 23, 2017 1:32:00 AM",
        "Sat, Jan 1, 2000 12:00:00 AM")
    )

    expect_equal(
      (tab %>%
         fmt_datetime(columns = "datetime", date_style = 4, time_style = 4) %>%
         render_formats_test(context = "default"))[["datetime"]],
      c("Saturday 10 June 2017 12:35 PM", "Wednesday 12 July 2017 3:01 PM",
        "Saturday 5 August 2017 9:45 AM", "Monday 23 October 2017 1:32 AM",
        "Saturday 1 January 2000 12:00 AM")
    )

    expect_equal(
      (tab %>%
         fmt_datetime(columns = "datetime", date_style = 5, time_style = 5) %>%
         render_formats_test(context = "default"))[["datetime"]],
      c("June 10, 2017 12 PM", "July 12, 2017 3 PM", "August 5, 2017 9 AM",
        "October 23, 2017 1 AM", "January 1, 2000 12 AM")
    )
  }

  # Expect errors if invalid input is provided to `fmt_datetime()`
  expect_error(tab_1 %>% fmt_datetime(columns = "datetime", date_style = "none"))
  expect_error(tab_1 %>% fmt_datetime(columns = "datetime", date_style = 50))
})
