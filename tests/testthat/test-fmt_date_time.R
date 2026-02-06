skip_on_os("linux")

suppressPackageStartupMessages(library(lubridate))

test_that("fmt_date() works correctly", {

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
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  date <- dt_data_get(tab)[["date"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$date, date)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_date(columns = "num_1", date_style = 1))

  # Create three gt objects with a `date` column having different types
  tab_1 <-
    dplyr::tibble(date = c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01"
    )) |>
    gt()

  tab_2 <-
    dplyr::tibble(date = as.Date(c(
      "2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01"
    ))) |>
    gt()

  tab_3 <-
    dplyr::tibble(date = c(
      "2017-10-15 20:00:10", "2013-02-22 00:00:00",
      "2014-09-22 23:59:59", "2018-01-10 06:30:34",
      "2000-01-01 12:00:00"
    )) |>
    dplyr::mutate(date = lubridate::ymd_hms(date)) |>
    gt()

  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2, tab_3)

  #
  # Format `date` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 1) |>
         render_formats_test(context = "html"))[["date"]],
      c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10", "2000-01-01")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 2) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "Sunday, October 15, 2017", "Friday, February 22, 2013",
        "Monday, September 22, 2014", "Wednesday, January 10, 2018",
        "Saturday, January 1, 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 3) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "Sun, Oct 15, 2017", "Fri, Feb 22, 2013",
        "Mon, Sep 22, 2014", "Wed, Jan 10, 2018",
        "Sat, Jan 1, 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 4) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "Sunday 15 October 2017", "Friday 22 February 2013",
        "Monday 22 September 2014", "Wednesday 10 January 2018",
        "Saturday 1 January 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 5) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "October 15, 2017", "February 22, 2013",
        "September 22, 2014", "January 10, 2018",
        "January 1, 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 6) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "Oct 15, 2017", "Feb 22, 2013", "Sep 22, 2014",
        "Jan 10, 2018", "Jan 1, 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 7) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "15 Oct 2017", "22 Feb 2013", "22 Sep 2014",
        "10 Jan 2018", "1 Jan 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 8) |>
         render_formats_test(context = "html"))[["date"]],
      c(
        "15 October 2017", "22 February 2013", "22 September 2014",
        "10 January 2018", "1 January 2000"
      )
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 9) |>
         render_formats_test(context = "html"))[["date"]],
      c("15 October", "22 February", "22 September", "10 January", "1 January")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 10) |>
         render_formats_test(context = "html"))[["date"]],
      c("15 Oct", "22 Feb", "22 Sep", "10 Jan", "1 Jan")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 11) |>
         render_formats_test(context = "html"))[["date"]],
      c("2017", "2013", "2014", "2018", "2000")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 12) |>
         render_formats_test(context = "html"))[["date"]],
      c("October", "February", "September", "January", "January")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 13) |>
         render_formats_test(context = "html"))[["date"]],
      c("15", "22", "22", "10", "01")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 14) |>
         render_formats_test(context = "html"))[["date"]],
      c("2017/10/15", "2013/02/22", "2014/09/22", "2018/01/10", "2000/01/01")
    )

    expect_equal(
      (tab |>
         fmt_date(columns = "date", date_style = 15) |>
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
        (tab |>
           fmt_date(columns = "date", date_style = i) |>
           render_formats_test(context = "html"))[["date"]],
        (tab |>
           fmt_date(columns = "date", date_style = date_style_names[i]) |>
           render_formats_test(context = "html"))[["date"]]
      )

      expect_equal(
        (tab |>
           fmt_date(columns = "date", date_style = i) |>
           render_formats_test(context = "html"))[["date"]],
        (tab |>
           fmt_date(columns = "date", date_style = as.character(i)) |>
           render_formats_test(context = "html"))[["date"]]
      )
    }
  }

  # Expect errors if invalid input is provided to `fmt_date()`
  expect_error(tab_1 |> fmt_date(columns = "date", date_style = "none"))
  expect_error(tab_1 |> fmt_date(columns = "date", date_style = 50))

  # Expect an error if providing a time as input for `fmt_date()`
  expect_error(
    dplyr::tibble(time = c(
      "23:01", "15:30", "08:22"
    )) |>
      gt() |>
      fmt_date(columns = "time") |>
      as_raw_html(inline_css = FALSE)
  )

  # Expect an error if any string-based dates are invalid
  expect_error(
    dplyr::tibble(date = c("2013-12-30", "2017-30-15")) |>
      gt() |>
      fmt_date(columns = "date") |>
      as_raw_html(inline_css = FALSE)
  )
})

test_that("fmt_time() works correctly", {

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
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  time <- dt_data_get(tab)[["time"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$time, time)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_time(columns = "num_1", time_style = 1))

  # Create three gt objects with a `time` column having different types
  tab_1 <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00"
    )) |>
    gt()

  tab_2 <-
    dplyr::tibble(time = c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )) |>
    gt()

  tab_3 <-
    dplyr::tibble(time = c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )) |>
    dplyr::mutate(time = lubridate::ymd_hms(time)) |>
    gt()


  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2, tab_3)

  #
  # Format `time` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab |>
         fmt_time(columns = "time", time_style = 1) |>
         render_formats_test(context = "default"))[["time"]],
      c("12:35:23", "15:01:34", "09:45:23", "01:32:00")
    )

    expect_equal(
      (tab |>
         fmt_time(columns = "time", time_style = 2) |>
         render_formats_test(context = "default"))[["time"]],
      c("12:35", "15:01", "09:45", "01:32")
    )

    expect_equal(
      (tab |>
         fmt_time(columns = "time", time_style = 3) |>
         render_formats_test(context = "default"))[["time"]],
      c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM")
    )

    expect_equal(
      (tab |>
         fmt_time(columns = "time", time_style = 4) |>
         render_formats_test(context = "default"))[["time"]],
      c("12:35 PM", "3:01 PM", "9:45 AM", "1:32 AM")
    )

    expect_equal(
      (tab |>
         fmt_time(columns = "time", time_style = 5) |>
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
        (tab |>
           fmt_time(columns = "time", time_style = i) |>
           render_formats_test(context = "html"))[["time"]],
        (tab |>
           fmt_time(columns = "time", time_style = time_style_names[i]) |>
           render_formats_test(context = "html"))[["time"]]
      )

      expect_equal(
        (tab |>
           fmt_time(columns = "time", time_style = i) |>
           render_formats_test(context = "html"))[["time"]],
        (tab |>
           fmt_time(columns = "time", time_style = as.character(i)) |>
           render_formats_test(context = "html"))[["time"]]
      )
    }
  }

  # Create a gt table that has `Date` values in the `time` column
  tab_4 <-
    dplyr::tibble(time = as.Date(c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    ))) |>
    gt()

  expect_equal(
    (tab_4 |>
       fmt_time(columns = "time", time_style = 1) |>
       render_formats_test(context = "default"))[["time"]],
    rep("00:00:00", 4)
  )

  expect_equal(
    (tab_4 |>
       fmt_time(columns = "time", time_style = 2) |>
       render_formats_test(context = "default"))[["time"]],
    rep("00:00", 4)
  )

  expect_equal(
    (tab_4 |>
       fmt_time(columns = "time", time_style = 3) |>
       render_formats_test(context = "default"))[["time"]],
    rep("12:00:00 AM", 4)
  )

  expect_equal(
    (tab_4 |>
       fmt_time(columns = "time", time_style = 4) |>
       render_formats_test(context = "default"))[["time"]],
    rep("12:00 AM", 4)
  )

  expect_equal(
    (tab_4 |>
       fmt_time(columns = "time", time_style = 5) |>
       render_formats_test(context = "default"))[["time"]],
    rep("12 AM", 4)
  )

  # Expect errors if invalid input is provided to `fmt_time()`
  expect_error(tab_1 |> fmt_time(columns = "time", time_style = "none"))
  expect_error(tab_1 |> fmt_time(columns = "time", time_style = 50))

  # Expect that mixed, string-based dates and date-times
  # will result in the time value always being "00:00"
  expect_equal(
    (dplyr::tibble(date = c("2013-12-30 12:30", "2017-03-15")) |>
      gt() |>
      fmt_time(columns = "date") |>
      render_formats_test(context = "default"))[["date"]],
    rep("00:00:00", 2)
  )
  expect_equal(
    (dplyr::tibble(date = c("2013-12-30", "2017-03-15 12:30")) |>
       gt() |>
       fmt_time(columns = "date") |>
       render_formats_test(context = "default"))[["date"]],
    rep("00:00:00", 2)
  )

  # Don't expect an error if any string-based date-times have invalid
  # time components
  expect_no_error(
    dplyr::tibble(date = c("2013-12-30 25:30", "2017-03-15 02:32")) |>
      gt() |>
      fmt_time(columns = "date")
  )

  # Expect an error if any string-based date-times have invalid
  # date components
  expect_error(
    dplyr::tibble(date = c("2013-14-30 22:30", "2017-03-15 02:32")) |>
      gt() |>
      fmt_time(columns = "date") |>
      as_raw_html(inline_css = FALSE)
  )
})

test_that("fmt_datetime() works correctly", {

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
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract a vector from the table object for comparison
  # to the original dataset
  datetime <- dt_data_get(tab)[["datetime"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$datetime, datetime)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab |>
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
    )) |>
    gt()

  tab_2 <-
    dplyr::tibble(datetime = c(
      "2017-06-10 12:35:23", "2017-07-12 15:01:34", "2017-08-05 09:45:23",
      "2017-10-23 01:32:00", "2000-01-01 00:00:00"
    )) |>
    dplyr::mutate(datetime = lubridate::ymd_hms(datetime)) |>
    gt()

  # Combine the gt tables into a list
  gt_tables <- list(tab_1, tab_2)

  #
  # Format `datetime` in various date formats and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab |>
         fmt_datetime(columns = "datetime", date_style = 1, time_style = 1) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("2017-06-10 12:35:23", "2017-07-12 15:01:34", "2017-08-05 09:45:23",
        "2017-10-23 01:32:00", "2000-01-01 00:00:00")
    )

    expect_equal(
      (tab |>
         fmt_datetime(columns = "datetime", date_style = 2, time_style = 2) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("Saturday, June 10, 2017 12:35", "Wednesday, July 12, 2017 15:01",
        "Saturday, August 5, 2017 09:45", "Monday, October 23, 2017 01:32",
        "Saturday, January 1, 2000 00:00")
    )

    expect_equal(
      (tab |>
         fmt_datetime(columns = "datetime", date_style = 3, time_style = 3) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("Sat, Jun 10, 2017 12:35:23 PM", "Wed, Jul 12, 2017 3:01:34 PM",
        "Sat, Aug 5, 2017 9:45:23 AM", "Mon, Oct 23, 2017 1:32:00 AM",
        "Sat, Jan 1, 2000 12:00:00 AM")
    )

    expect_equal(
      (tab |>
         fmt_datetime(columns = "datetime", date_style = 4, time_style = 4) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("Saturday 10 June 2017 12:35 PM", "Wednesday 12 July 2017 3:01 PM",
        "Saturday 5 August 2017 9:45 AM", "Monday 23 October 2017 1:32 AM",
        "Saturday 1 January 2000 12:00 AM")
    )

    expect_equal(
      (tab |>
         fmt_datetime(columns = "datetime", date_style = 5, time_style = 5) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("June 10, 2017 12 PM", "July 12, 2017 3 PM", "August 5, 2017 9 AM",
        "October 23, 2017 1 AM", "January 1, 2000 12 AM")
    )
  }

  # Expect errors if invalid input is provided to `fmt_datetime()`
  expect_error(tab_1 |> fmt_datetime(columns = "datetime", date_style = "none"))
  expect_error(tab_1 |> fmt_datetime(columns = "datetime", date_style = 50))

  #
  # Format `datetime` using a custom `format` and verify the output
  #

  for (tab in gt_tables) {

    expect_equal(
      (tab |>
         fmt_datetime(
           columns = "datetime",
           format = "%F",
           tz = NULL
         ) |>
         render_formats_test(context = "default"))[["datetime"]],
      c("2017-06-10", "2017-07-12", "2017-08-05", "2017-10-23", "2000-01-01")
    )

    expect_equal(
      (tab |>
         fmt_datetime(
           columns = "datetime",
           format = "%B %d, %Y %H:%M:%S",
           tz = NULL
         ) |>
         render_formats_test(context = "default"))[["datetime"]],
      c(
        "June 10, 2017 12:35:23", "July 12, 2017 15:01:34",
        "August 05, 2017 09:45:23", "October 23, 2017 01:32:00",
        "January 01, 2000 00:00:00"
      )
    )

    expect_equal(
      (tab |>
         fmt_datetime(
           columns = "datetime",
           date_style = 1,
           time_style = 1,
           format = "%B %d, %Y %H:%M:%S",
           tz = NULL
         ) |>
         render_formats_test(context = "default"))[["datetime"]],
      c(
        "June 10, 2017 12:35:23", "July 12, 2017 15:01:34",
        "August 05, 2017 09:45:23", "October 23, 2017 01:32:00",
        "January 01, 2000 00:00:00"
      )
    )

    expect_equal(
      (tab |>
         fmt_datetime(
           columns = "datetime",
           format = "%B %d, %Y %H:%M:%S (%z)",
           tz = NULL
         ) |>
         render_formats_test(context = "default"))[["datetime"]],
      c(
        "June 10, 2017 12:35:23 (+0000)", "July 12, 2017 15:01:34 (+0000)",
        "August 05, 2017 09:45:23 (+0000)", "October 23, 2017 01:32:00 (+0000)",
        "January 01, 2000 00:00:00 (+0000)"
      )
    )
  }

  # Using a string to represent a date or date-time doesn't allow the
  # output time to be altered by `tz` but it should change the tz
  # that is displayed
  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "GMT"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (+0000)", "July 12, 2017 15:01:34 (+0000)",
      "August 05, 2017 09:45:23 (+0000)", "October 23, 2017 01:32:00 (+0000)",
      "January 01, 2000 00:00:00 (+0000)"
    )
  )

  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (-0400)", "July 12, 2017 15:01:34 (-0400)",
      "August 05, 2017 09:45:23 (-0400)", "October 23, 2017 01:32:00 (-0400)",
      "January 01, 2000 00:00:00 (-0500)"
    )
  )

  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "America/Vancouver"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (-0700)", "July 12, 2017 15:01:34 (-0700)",
      "August 05, 2017 09:45:23 (-0700)", "October 23, 2017 01:32:00 (-0700)",
      "January 01, 2000 00:00:00 (-0800)"
    )
  )


  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "GMT"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (+0000)", "July 12, 2017 15:01:34 (+0000)",
      "August 5, 2017 09:45:23 (+0000)", "October 23, 2017 01:32:00 (+0000)",
      "January 1, 2000 00:00:00 (+0000)"
    )
  )

  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (-0400)", "July 12, 2017 15:01:34 (-0400)",
      "August 5, 2017 09:45:23 (-0400)", "October 23, 2017 01:32:00 (-0400)",
      "January 1, 2000 00:00:00 (-0500)"
    )
  )

  expect_equal(
    (gt_tables[[1]] |> # table where `datetime` column was `character`
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "America/Vancouver"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 12:35:23 (-0700)", "July 12, 2017 15:01:34 (-0700)",
      "August 5, 2017 09:45:23 (-0700)", "October 23, 2017 01:32:00 (-0700)",
      "January 1, 2000 00:00:00 (-0800)"
    )
  )

  # Using a POSIXct-formatted date-time *does* allow
  # the output time to be altered by changing `tz`
  expect_equal(
    (gt_tables[[2]] |>
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 08:35:23 (-0400)", "July 12, 2017 11:01:34 (-0400)",
      "August 05, 2017 05:45:23 (-0400)", "October 22, 2017 21:32:00 (-0400)",
      "December 31, 1999 19:00:00 (-0500)"
    )
  )

  expect_equal(
    (gt_tables[[2]] |>
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 08:35:23 (-0400)", "July 12, 2017 11:01:34 (-0400)",
      "August 5, 2017 05:45:23 (-0400)", "October 22, 2017 21:32:00 (-0400)",
      "December 31, 1999 19:00:00 (-0500)"
    )
  )

  expect_equal(
    (gt_tables[[2]] |>
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "Asia/Tokyo"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 21:35:23 (+0900)", "July 13, 2017 00:01:34 (+0900)",
      "August 05, 2017 18:45:23 (+0900)", "October 23, 2017 10:32:00 (+0900)",
      "January 01, 2000 09:00:00 (+0900)"
    )
  )

  expect_equal(
    (gt_tables[[2]] |>
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "Asia/Tokyo"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "June 10, 2017 21:35:23 (+0900)", "July 13, 2017 00:01:34 (+0900)",
      "August 5, 2017 18:45:23 (+0900)", "October 23, 2017 10:32:00 (+0900)",
      "January 1, 2000 09:00:00 (+0900)"
    )
  )

  # Create a table with datetime values set in JST
  datetime_jst_tbl <-
    dplyr::tibble(datetime = c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )) |>
    dplyr::mutate(datetime = lubridate::ymd_hms(datetime, tz = "Asia/Tokyo"))

  # Expect that the default display of date-time values matches the input
  # date-time values
  expect_equal(
    (datetime_jst_tbl |>
       gt() |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "2017-10-15 12:35:23", "2013-02-22 15:01:34",
      "2014-09-22 09:45:23", "2018-01-10 01:32:00"
    )
  )

  # Expect that the display of date-time values and time zone is correct
  # since the `tz` matches the input time zone
  expect_equal(
    (datetime_jst_tbl |>
       gt() |>
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)", # strftime pattern
         tz = "Asia/Tokyo"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "October 15, 2017 12:35:23 (+0900)", "February 22, 2013 15:01:34 (+0900)",
      "September 22, 2014 09:45:23 (+0900)", "January 10, 2018 01:32:00 (+0900)"
    )
  )
  expect_equal(
    (datetime_jst_tbl |>
       gt() |>
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)", # fdt pattern
         tz = "Asia/Tokyo"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "October 15, 2017 12:35:23 (+0900)", "February 22, 2013 15:01:34 (+0900)",
      "September 22, 2014 09:45:23 (+0900)", "January 10, 2018 01:32:00 (+0900)"
    )
  )

  # Expect that the display of date-time values can be moved to a different
  # time zone using the output `tz` of "America/Toronto"
  expect_equal(
    (datetime_jst_tbl |>
       gt() |>
       fmt_datetime(
         columns = "datetime",
         format = "%B %d, %Y %H:%M:%S (%z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "October 14, 2017 23:35:23 (-0400)", "February 22, 2013 01:01:34 (-0500)",
      "September 21, 2014 20:45:23 (-0400)", "January 09, 2018 11:32:00 (-0500)"
    )
  )
  expect_equal(
    (datetime_jst_tbl |>
       gt() |>
       fmt_datetime(
         columns = "datetime",
         format = "MMMM d, y HH:mm:ss (Z)",
         tz = "America/Toronto"
       ) |>
       render_formats_test(context = "default"))[["datetime"]],
    c(
      "October 14, 2017 23:35:23 (-0400)", "February 22, 2013 01:01:34 (-0500)",
      "September 21, 2014 20:45:23 (-0400)", "January 9, 2018 11:32:00 (-0500)"
    )
  )

  # Create a gt table with a `time` column containing valid time strings
  tab_3 <-
    dplyr::tibble(time = c(
      "12:35:23", "15:01:34", "09:45:23", "01:32:00", "00:00:00"
    )) |>
    gt()

  #
  # Format `time` with a time format and verify the output
  #

  expect_equal(
    (tab_3 |>
       fmt_datetime(
         columns = "time",
         format = "%I:%M:%S %P"
       ) |>
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23 pm", "03:01:34 pm", "09:45:23 am", "01:32:00 am", "12:00:00 am")
  )

  expect_equal(
    (tab_3 |>
       fmt_datetime(
         columns = "time",
         format = "%I:%M:%S %P",
         tz = "America/Vancouver"
       ) |>
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23 pm", "03:01:34 pm", "09:45:23 am", "01:32:00 am", "12:00:00 am")
  )

  expect_equal(
    (tab_3 |>
       fmt_datetime(
         columns = "time",
         format = "h:mm:ss a"
       ) |>
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM", "12:00:00 AM")
  )

  expect_equal(
    (tab_3 |>
       fmt_datetime(
         columns = "time",
         format = "h:mm:ss a",
         tz = "America/Vancouver"
       ) |>
       render_formats_test(context = "default"))[["time"]],
    c("12:35:23 PM", "3:01:34 PM", "9:45:23 AM", "1:32:00 AM", "12:00:00 AM")
  )
})

test_that("fmt_date(), fmt_time(), and fmt_datetime() handle Inf values correctly", {

  # Test fmt_date() with Inf values
  tab_date_inf <-
    dplyr::tibble(date = structure(c(18000, 20000, Inf, 19000, Inf), class = "Date")) |>
    gt() |>
    fmt_date(date)

  expect_equal(
    (tab_date_inf |> render_formats_test(context = "html"))[["date"]],
    c("2019-04-14", "2024-10-04", "Inf", "2022-01-08", "Inf")
  )

  # Test fmt_date() with Inf at the start
  tab_date_inf_first <-
    dplyr::tibble(date = structure(c(Inf, 18000, 20000), class = "Date")) |>
    gt() |>
    fmt_date(date)

  expect_equal(
    (tab_date_inf_first |> render_formats_test(context = "html"))[["date"]],
    c("Inf", "2019-04-14", "2024-10-04")
  )

  # Test fmt_date() with mix of NA and Inf
  tab_date_mixed <-
    dplyr::tibble(date = structure(c(18000, NA, Inf, 19000, Inf), class = "Date")) |>
    gt() |>
    fmt_date(date)

  expect_equal(
    (tab_date_mixed |> render_formats_test(context = "html"))[["date"]],
    c("2019-04-14", NA, "Inf", "2022-01-08", "Inf")
  )

  # Test fmt_time() with Inf values
  tab_time_inf <-
    dplyr::tibble(time = structure(c(1000, Inf, 2000, Inf), class = c("POSIXct", "POSIXt"))) |>
    gt() |>
    fmt_time(time)

  expect_equal(
    (tab_time_inf |> render_formats_test(context = "html"))[["time"]],
    c("00:16:40", "Inf", "00:33:20", "Inf")
  )

  # Test fmt_datetime() with Inf values
  tab_datetime_inf <-
    dplyr::tibble(datetime = structure(c(1000000, Inf, 2000000, Inf), class = c("POSIXct", "POSIXt"), tzone = "GMT")) |>
    gt() |>
    fmt_datetime(datetime, date_style = "iso", time_style = "iso")

  expect_equal(
    (tab_datetime_inf |> render_formats_test(context = "html"))[["datetime"]],
    c("1970-01-12 13:46:40", "Inf", "1970-01-24 03:33:20", "Inf")
  )
})
