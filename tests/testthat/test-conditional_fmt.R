# Create an input data frame four columns: two
# character-based and two that are numeric
data_tbl <-
  data.frame(
    char_1 = c("saturday", "sunday", "monday", "tuesday",
               "wednesday", "thursday", "friday"),
    char_2 = c("june", "july", "august", "september",
               "october", "november", "december"),
    num_1 = c(1836.23, 2763.39, 937.29, 643.00, 212.232, 0, -23.24),
    num_2 = c(34, 74, 23, NA, 35, NA, NA),
    stringsAsFactors = FALSE)

# Create a `gt_tbl` object with `gt()` and the
# `data_tbl` dataset
tab <- gt(data_tbl)

# Create an input data frame with dates, times, and date-times (all
# as character)
time_tbl <-
  data.frame(
    date = c("2017-10-15", "2013-02-22", "2014-09-22", "2018-01-10"),
    time = c("16:45", "19:23", "01:30", "08:00"),
    datetime = c("2010-03-25 19:45", "2015-06-12 09:25",
                 "2016-01-15 14:38", "2012-08-07 12:31"),
    stringsAsFactors = FALSE)

# Create a `gt_tbl` object with `gt()` and the
# `data_tbl` dataset
tab_time <- gt(time_tbl)

test_that("The `fmt_number()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_number(
         columns = num_1,
         decimals = 4,
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1836.23", "2763.39", "937.2900", "643.0000",
      "212.2320", "0.0000", paste0("\U02212", "23.2400")))

  expect_equal(
    (tab %>%
       fmt_number(
         columns = c(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("34.0000", "74", "23", "NA", "35", "NA", "NA"))
})

test_that("The `fmt_scientific()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_scientific(
         columns = num_1,
         decimals = 4,
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39",
      paste0("9.3729 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.4300 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("2.1223 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "0.0000",
      paste0("\U02212", "2.3240 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  expect_equal(
    (tab %>%
       fmt_scientific(
         columns = c(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c(
      paste0("3.4000 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      "74", "23", "NA", "35", "NA", "NA"
    )
  )
})

test_that("The `fmt_percent()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_percent(
         columns = num_1,
         decimals = 2,
         rows = num_1 < 1000
       ) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39", "93,729.00%", "64,300.00%",
      "21,223.20%", "0.00%", paste0("\U02212", "2,324.00%")
    )
  )

  expect_equal(
    (tab %>%
       fmt_percent(
         columns = c(num_1, num_2),
         decimals = 2,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("3,400.00%", "74", "23", "NA", "35", "NA", "NA")
  )
})

test_that("The `fmt_currency()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_currency(
         columns = num_1,
         currency = "USD",
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", paste0("\U02212", "$23.24")
    )
  )

  expect_equal(
    (tab %>%
       fmt_currency(
         columns = c(num_1, num_2),
         currency = "USD",
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("$34.00", "74", "23", "NA", "35", "NA", "NA")
  )
})

test_that("The `fmt_date()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_date(
         columns = date,
         date_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", "2013-02-22", "2014-09-22", "2018-01-10")
  )

  expect_equal(
    (tab_time %>%
       fmt_date(
         columns = date,
         date_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", "2013-02-22", "2014-09-22", "2018-01-10")
  )
})

test_that("The `fmt_time()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_time(
         columns = time,
         time_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["time"]],
    c("16:45", "19:23", "01:30", "08:00")
  )

  expect_equal(
    (tab_time %>%
       fmt_time(
         columns = time,
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["time"]],
    c("16:45", "19:23", "01:30", "08:00")
  )
})

test_that("The `fmt_datetime()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_datetime(
         columns = datetime,
         date_style = 2,
         time_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )

  expect_equal(
    (tab_time %>%
       fmt_datetime(
         columns = datetime,
         date_style = 2,
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )
})

test_that("The `fmt_passthrough()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_passthrough(
         columns = datetime,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )

  expect_equal(
    (tab_time %>%
       fmt_passthrough(
         columns = datetime,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )
})

test_that("The `sub_missing()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       sub_missing(
         columns = num_2,
         rows = num_1 <= 0
       ) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("34", "74", "23", "NA", "35", rep("\U02014", 2))
  )
})

test_that("The `fmt()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt(
         columns = num_1,
         rows = num_1 > 1000,
         fns = function(x){
           x * 1000
         }) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1836230", "2763390", "937.290", "643.000",
      "212.232", "0.000", "-23.240")
  )
})
