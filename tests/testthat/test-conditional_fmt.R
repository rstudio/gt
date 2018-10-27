context("Ensuring that conditional formatting works as expected")

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
tab <- gt(data = data_tbl)

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
tab_time <- gt(data = time_tbl)


test_that("the `fmt_number()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_number(
         columns = vars(num_1),
         decimals = 4,
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(NA, NA, "937.2900", "643.0000", "212.2320", "0.0000", "-23.2400"))

  expect_equal(
    (tab %>%
       fmt_number(
         columns = vars(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("34.0000", rep(NA, 6)))
})

test_that("the `fmt_scientific()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_scientific(
         columns = vars(num_1),
         decimals = 4,
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(NA, NA, "9.3729 &times; 10<sup class='gt_super'>2</sup>",
      "6.4300 &times; 10<sup class='gt_super'>2</sup>",
      "2.1223 &times; 10<sup class='gt_super'>2</sup>", "0.0000",
      "-2.3240 &times; 10<sup class='gt_super'>1</sup>"))

  expect_equal(
    (tab %>%
       fmt_scientific(
         columns = vars(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("3.4000 &times; 10<sup class='gt_super'>1</sup>", rep(NA, 6)))
})

test_that("the `fmt_percent()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_percent(
         columns = vars(num_1),
         decimals = 2,
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(NA, NA, "93,729.00%", "64,300.00%", "21,223.20%", "0.00%", "-2,324.00%"))

  expect_equal(
    (tab %>%
       fmt_percent(
         columns = vars(num_1, num_2),
         decimals = 2,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("3,400.00%", rep(NA, 6)))
})

test_that("the `fmt_currency()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_currency(
         columns = vars(num_1),
         currency = "USD",
         rows = num_1 < 1000) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(NA, NA, "$937.29", "$643.00", "$212.23", "$0.00", "$-23.24"))

  expect_equal(
    (tab %>%
       fmt_currency(
         columns = vars(num_1, num_2),
         currency = "USD",
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c("$34.00", rep(NA, 6)))
})

test_that("the `fmt_date()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_date(
         columns = vars(date),
         date_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", rep(NA, 3)))

  expect_equal(
    (tab_time %>%
       fmt_date(
         columns = vars(date),
         date_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", rep(NA, 3)))
})

test_that("the `fmt_time()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_time(
         columns = vars(time),
         time_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["time"]],
    c("16:45", rep(NA, 3)))

  expect_equal(
    (tab_time %>%
       fmt_time(
         columns = vars(time),
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["time"]],
    c("16:45", rep(NA, 3)))
})

test_that("the `fmt_datetime()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_datetime(
         columns = vars(datetime),
         date_style = 2,
         time_style = 2,
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", rep(NA, 3)))

  expect_equal(
    (tab_time %>%
       fmt_datetime(
         columns = vars(datetime),
         date_style = 2,
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", rep(NA, 3)))
})

test_that("the `fmt_passthrough()` function works with conditional `rows`", {

  expect_equal(
    (tab_time %>%
       fmt_passthrough(
         columns = vars(datetime),
         rows = time == "16:45") %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", rep(NA, 3)))

  expect_equal(
    (tab_time %>%
       fmt_passthrough(
         columns = vars(datetime),
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) %>%
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", rep(NA, 3)))
})

test_that("the `fmt_missing()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt_missing(
         columns = vars(num_2),
         rows = num_1 <= 0) %>%
       render_formats_test(context = "html"))[["num_2"]],
    c(rep(NA_character_, 5), rep("—", 2)))
})

test_that("the `fmt()` function works with conditional `rows`", {

  expect_equal(
    (tab %>%
       fmt(
         columns = vars(num_1),rows = num_1 > 1000,
         fns = function(x){
           x * 1000
         }) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1836230", "2763390", rep(NA_character_, 5)))
})
