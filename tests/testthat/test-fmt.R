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

test_that("fmt_number() works with conditional `rows`", {

  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1,
         decimals = 4,
         rows = num_1 < 1000) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("1836.23", "2763.39", "937.2900", "643.0000",
      "212.2320", "0.0000", paste0("\U02212", "23.2400")))

  expect_equal(
    (tab |>
       fmt_number(
         columns = c(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) |>
       render_formats_test(context = "html"))[["num_2"]],
    c("34.0000", "74", "23", "NA", "35", "NA", "NA"))
})

test_that("fmt_scientific() works with conditional `rows`", {

  expect_equal(
    (tab |>
       fmt_scientific(
         columns = num_1,
         decimals = 4,
         rows = num_1 < 1000) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39",
      paste0("9.3729&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.4300&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("2.1223&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "0.0000",
      paste0("\U02212", "2.3240&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  expect_equal(
    (tab |>
       fmt_scientific(
         columns = c(num_1, num_2),
         decimals = 4,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) |>
       render_formats_test(context = "html"))[["num_2"]],
    c(
      paste0("3.4000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      "74", "23", "NA", "35", "NA", "NA"
    )
  )
})

test_that("fmt_percent() works with conditional `rows`", {

  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1,
         decimals = 2,
         rows = num_1 < 1000
       ) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39", "93,729.00%", "64,300.00%",
      "21,223.20%", "0.00%", paste0("\U02212", "2,324.00%")
    )
  )

  expect_equal(
    (tab |>
       fmt_percent(
         columns = c(num_1, num_2),
         decimals = 2,
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) |>
       render_formats_test(context = "html"))[["num_2"]],
    c("3,400.00%", "74", "23", "NA", "35", "NA", "NA")
  )
})

test_that("fmt_currency() works with conditional `rows`", {

  expect_equal(
    (tab |>
       fmt_currency(
         columns = num_1,
         currency = "USD",
         rows = num_1 < 1000) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "1836.23", "2763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", paste0("\U02212", "$23.24")
    )
  )

  expect_equal(
    (tab |>
       fmt_currency(
         columns = c(num_1, num_2),
         currency = "USD",
         rows = char_2 %in% c("june", "july") & grepl("sa.*", char_1)) |>
       render_formats_test(context = "html"))[["num_2"]],
    c("$34.00", "74", "23", "NA", "35", "NA", "NA")
  )
})

test_that("fmt_date() works with conditional `rows`", {

  expect_equal(
    (tab_time |>
       fmt_date(
         columns = date,
         date_style = 2,
         rows = time == "16:45") |>
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", "2013-02-22", "2014-09-22", "2018-01-10")
  )

  expect_equal(
    (tab_time |>
       fmt_date(
         columns = date,
         date_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) |>
       render_formats_test(context = "html"))[["date"]],
    c("Sunday, October 15, 2017", "2013-02-22", "2014-09-22", "2018-01-10")
  )
})

test_that("fmt_time() works with conditional `rows`", {

  expect_equal(
    (tab_time |>
       fmt_time(
         columns = time,
         time_style = 2,
         rows = time == "16:45") |>
       render_formats_test(context = "html"))[["time"]],
    c("16:45", "19:23", "01:30", "08:00")
  )

  expect_equal(
    (tab_time |>
       fmt_time(
         columns = time,
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) |>
       render_formats_test(context = "html"))[["time"]],
    c("16:45", "19:23", "01:30", "08:00")
  )
})

test_that("fmt_datetime() works with conditional `rows`", {

  expect_equal(
    (tab_time |>
       fmt_datetime(
         columns = datetime,
         date_style = 2,
         time_style = 2,
         rows = time == "16:45") |>
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )

  expect_equal(
    (tab_time |>
       fmt_datetime(
         columns = datetime,
         date_style = 2,
         time_style = 2,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) |>
       render_formats_test(context = "html"))[["datetime"]],
    c("Thursday, March 25, 2010 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )
})

test_that("fmt_passthrough() works with conditional `rows`", {

  expect_equal(
    (tab_time |>
       fmt_passthrough(
         columns = datetime,
         rows = time == "16:45") |>
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )

  expect_equal(
    (tab_time |>
       fmt_passthrough(
         columns = datetime,
         rows = date %in% c("2017-10-15", "2014-09-22") & grepl("^1", time)) |>
       render_formats_test(context = "html"))[["datetime"]],
    c("2010-03-25 19:45", "2015-06-12 09:25",
      "2016-01-15 14:38", "2012-08-07 12:31")
  )
})

test_that("sub_missing() works with conditional `rows`", {

  expect_equal(
    (tab |>
       sub_missing(
         columns = num_2,
         rows = num_1 <= 0
       ) |>
       render_formats_test(context = "html"))[["num_2"]],
    c("34", "74", "23", "NA", "35", rep("\U02014", 2))
  )
})

test_that("fmt() works with conditional `rows`", {

  expect_equal(
    (tab |>
       fmt(
         columns = num_1,
         rows = num_1 > 1000,
         fns = function(x) {
           x * 1000
         }) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("1836230", "2763390", "937.290", "643.000",
      "212.232", "0.000", "-23.240")
  )
})

test_that("fmt() works when providing a purrr formula (#1762)", {

  # Function has a different class, so that will differ
  # - but makes sense since the passed function is actually different
  expect_equal(
    {v1 <- mtcars |> gt() |> fmt(mpg, fns = ~.x + 1); v1$`_formats`[[1]]$func$default <- NULL; v1},
    {v2 <- mtcars |> gt() |> fmt(mpg, fns = function(x) x + 1); v2$`_formats`[[1]]$func$default <- NULL; v2}
    )
})

test_that("get_locale_sep_mark() works correctly", {

  # Expect that a `locale` which is `NULL` will return the
  # default value
  expect_equal(
    c(
      get_locale_sep_mark(locale = NULL, default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = NULL, default = ".", use_seps = TRUE),
      get_locale_sep_mark(locale = NULL, default = " ", use_seps = TRUE)
    ),
    c(",", ".", " ")
  )

  # Expect that an invalid `locale` will result in
  # an error
  expect_error(
    get_locale_sep_mark(locale = "do_IT", default = ",", use_seps = TRUE)
  )

  # Expect that when `use_seps` is `FALSE`, we always
  # get an empty string `""` returned
  expect_equal("", get_locale_sep_mark(locale = "en_US", default = ",", use_seps = FALSE))
  expect_equal("", get_locale_sep_mark(locale = "do_IT", default = ",", use_seps = FALSE))
  expect_equal("", get_locale_sep_mark(locale = NULL, default = ",", use_seps = FALSE))
  expect_equal("", get_locale_sep_mark(locale = NULL, default = ",", use_seps = FALSE))
  expect_equal("", get_locale_sep_mark(locale = NULL, use_seps = FALSE))
  expect_equal("", get_locale_sep_mark(use_seps = FALSE))

  # Expect the correct `sep_mark` values for a range of locales
  expect_equal(
    c(
      get_locale_sep_mark(locale = "fr-CF",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en-JE",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en-KY",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "ln-CF",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en-MO",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "teo-KE", default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en-IL",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "pt",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en-DE",  default = ",", use_seps = TRUE)
    ),
    c(" ", ",", ",", ".", ",", ",", ",", ".", ".")
  )
})

test_that("get_locale_dec_mark() works correctly", {

  # Expect that a `locale` which is `NULL` will return the
  # default value
  expect_equal(
    c(
      get_locale_dec_mark(locale = NULL, default = "."),
      get_locale_dec_mark(locale = NULL, default = ","),
      get_locale_dec_mark(locale = NULL, default = " ")
    ),
    c(".", ",", " ")
  )

  # Expect that an invalid `locale` will result in
  # an error
  expect_error(
    get_locale_dec_mark(locale = "do_IT", default = ".")
  )

  # Expect the correct `dec_mark` values for a range of locales
  expect_equal(
    c(
      get_locale_dec_mark(locale = "fr-CF",  default = "."),
      get_locale_dec_mark(locale = "en-JE",  default = "."),
      get_locale_dec_mark(locale = "en-KY",  default = "."),
      get_locale_dec_mark(locale = "ln-CF",  default = "."),
      get_locale_dec_mark(locale = "en-MO",  default = "."),
      get_locale_dec_mark(locale = "teo-KE", default = "."),
      get_locale_dec_mark(locale = "en-IL",  default = "."),
      get_locale_dec_mark(locale = "pt",  default = "."),
      get_locale_dec_mark(locale = "en-DE",  default = ".")
    ),
    c(",", ".", ".", ",", ".", ".", ".", ",", ",")
  )
})

test_that("has_order_zero() works correctly", {

  # Create numeric vectors, with and without
  # NA values
  x <- c(-500, -50, -5, -0.5, -0.05, 0, 0.05, 0.5, 5, 50, 500)
  x_has_NA <- c(NA_real_, -50, -5, -0.5, -0.05, 0, 0.05, 0.5, 5, 50, NA_real_)

  # Expect that a vector of numbers introduced
  # to `has_order_zero()` will result in a equal-
  # length logical vector (for vectors that have
  # and don't have NA values)
  expect_length(has_order_zero(x), length(x))

  expect_type(has_order_zero(x), "logical")

  expect_length(has_order_zero(x_has_NA), length(x_has_NA))

  expect_type(has_order_zero(x_has_NA), "logical")

  # Expect the correct logical values for
  # vectors that have and don't have NA values
  expect_equal(
    has_order_zero(x),
    c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)
  )

  expect_equal(
    has_order_zero(x_has_NA),
    c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)
  )
})

test_that("split_string_2() works correctly", {

  test_str <- "-HK$4,299"

  # Expect certain length 2 character vectors from a series
  # of `split_string_2()` operations with regex matching
  expect_equal(split_string_2(x = test_str, before = "HK"), c("-", "HK$4,299"))
  expect_equal(split_string_2(x = test_str, after = "HK"), c("-HK", "$4,299"))
  expect_equal(split_string_2(x = test_str, before = "\\$"), c("-HK", "$4,299"))
  expect_equal(split_string_2(x = test_str, after = "\\$"), c("-HK$", "4,299"))
  expect_equal(split_string_2(x = test_str, before = "9"), c("-HK$4,2", "99"))
  expect_equal(split_string_2(x = test_str, after = "9"), c("-HK$4,29", "9"))
  expect_equal(split_string_2(x = test_str, before = "99"), c("-HK$4,2", "99"))
  expect_equal(split_string_2(x = test_str, after = "99"), c("-HK$4,299", ""))
  expect_equal(split_string_2(x = test_str, before = "9"), c("-HK$4,2", "99"))
  expect_equal(split_string_2(x = test_str, before = "$"), c("-HK$4,299", ""))
  expect_equal(split_string_2(x = test_str, after = "$"), c("-HK$4,299", ""))
  expect_equal(split_string_2(x = test_str, before = ".$"), c("-HK$4,29", "9"))
  expect_equal(split_string_2(x = test_str, after = ".$"), c("-HK$4,299", ""))
  expect_equal(split_string_2(x = test_str, before = "^."), c("", "-HK$4,299"))
  expect_equal(split_string_2(x = test_str, after = "^."), c("-", "HK$4,299"))
  expect_equal(split_string_2(x = test_str, before = "x"), c("-HK$4,299", ""))
  expect_equal(split_string_2(x = test_str, after = "x"), c("-HK$4,299", ""))

  # Expect certain length 2 character vectors from a series
  # of `split_string_2()` operations with numeric positions
  expect_equal(split_string_2(x = test_str, before = 0), c("", "-HK$4,299"))
  expect_equal(split_string_2(x = test_str, before = 1), c("", "-HK$4,299"))
  expect_equal(split_string_2(x = test_str, before = 2), c("-", "HK$4,299"))
  expect_equal(split_string_2(x = test_str, before = 3), c("-H", "K$4,299"))
  expect_equal(split_string_2(x = test_str, before = 4), c("-HK", "$4,299"))
  expect_equal(split_string_2(x = test_str, before = 5), c("-HK$", "4,299"))
  expect_equal(split_string_2(x = test_str, before = 6), c("-HK$4", ",299"))
  expect_equal(split_string_2(x = test_str, before = 7), c("-HK$4,", "299"))
  expect_equal(split_string_2(x = test_str, before = 8), c("-HK$4,2", "99"))
  expect_equal(split_string_2(x = test_str, before = 9), c("-HK$4,29", "9"))
  expect_equal(split_string_2(x = test_str, after = 0),  c("", "-HK$4,299"))
  expect_equal(split_string_2(x = test_str, after = 1),  c("-", "HK$4,299"))
  expect_equal(split_string_2(x = test_str, after = 2),  c("-H", "K$4,299"))
  expect_equal(split_string_2(x = test_str, after = 3),  c("-HK", "$4,299"))
  expect_equal(split_string_2(x = test_str, after = 4),  c("-HK$", "4,299"))
  expect_equal(split_string_2(x = test_str, after = 5),  c("-HK$4", ",299"))
  expect_equal(split_string_2(x = test_str, after = 6),  c("-HK$4,", "299"))
  expect_equal(split_string_2(x = test_str, after = 7),  c("-HK$4,2", "99"))
  expect_equal(split_string_2(x = test_str, after = 8),  c("-HK$4,29", "9"))
  expect_equal(split_string_2(x = test_str, after = 9),  c("-HK$4,299", ""))

  # Expect an error if `x` is not of class character
  expect_error(split_string_2(x = 23432, before = "34"))

  # Expect an error if the length of `x` is not 1
  expect_error(split_string_2(x = c("345", "234"), before = "34"))

  # Expect an error if neither of `before` or `after` has a value
  expect_error(split_string_2(x = "23432"))

  # Expect an error if both `before` and `after` have values
  expect_error(split_string_2(x = "23432", before = "3", after = "2"))

  # Expect an error if the index position is not valid
  expect_error(split_string_2(x = "23432", before = 10))
})

test_that("paste_between() works correctly", {

  # Expect a correctly formed string with `paste_between()`
  expect_equal(
    paste_between(x_2 = c("left", "right"), "-between-"),
    "left-between-right"
  )

  # Expect multiple correctly formed strings with `paste_between()`
  expect_equal(
    paste_between(x_2 = c("left", "right"), c("-a-", "-b-", "-c-")),
    c("left-a-right", "left-b-right", "left-c-right")
  )

  # Expect an error if the class of `x_2` is not `character`
  expect_error(paste_between(x_2 = 1:2, "-between-"))

  # Expect an error if the class of `x_between` is not `character`
  expect_error(paste_between(x_2 = c("left", "right"), 1))

  # Expect an error if the length of `x_2` is not 2
  expect_error(paste_between(x_2 = "left", "between"))
})

test_that("paste_on_side() works correctly", {

  # Expect a correctly formed string with `paste_on_side()`,
  # pasting to the left
  expect_equal(
    paste_on_side(x = "center", x_side = "left-", direction = "left"),
    "left-center"
  )

  # Expect a correctly formed string with `paste_on_side()`,
  # pasting to the right
  expect_equal(
    paste_on_side(x = "center", x_side = "-right", direction = "right"),
    "center-right"
  )

  # Expect an error if `direction` is not valid
  expect_error(paste_on_side(x = "center", x_side = "c", direction = "center"))
})

test_that("paste_left() works correctly", {

  # Expect correctly formed strings with `paste_left()`
  expect_equal(
    paste_left(x = "center", "left-"),
    "left-center"
  )

  expect_equal(
    paste_left(x = c("a", "b", "c"), "left-"),
    c("left-a", "left-b", "left-c")
  )

  expect_equal(
    paste_left(x = c("c1", "c2", "c3"), c("l1-", "l2-", "l3-")),
    c("l1-c1", "l2-c2", "l3-c3")
  )

  # Expect an error if the class of `x` is not `character`
  expect_error(paste_left(x = 1, x_left = "left"))

  # Expect an error if the class of `x_left` is not `character`
  expect_error(paste_left(x = "center", x_left = 1))

  # Expect an error if the length of `x_left` is not 1 of the length of `x`
  expect_error(paste_left(x = "center", x_left = c("l1", "l2", "l3")))

  expect_error(paste_left(x = c("c1", "c2", "c3"), x_left = c("l1", "l2")))
})

test_that("paste_right() works correctly", {

  # Expect correctly formed strings with `paste_right()`
  expect_equal(
    paste_right(x = "center", "-right"),
    "center-right"
  )

  expect_equal(
    paste_right(x = c("a", "b", "c"), "-right"),
    c("a-right", "b-right", "c-right")
  )

  expect_equal(
    paste_right(x = c("c1", "c2", "c3"), c("-r1", "-r2", "-r3")),
    c("c1-r1", "c2-r2", "c3-r3")
  )

  # Expect an error if the class of `x` is not `character`
  expect_error(paste_right(x = 1, x_right = "right"))

  # Expect an error if the class of `x_right` is not `character`
  expect_error(paste_right(x = "center", x_right = 1))

  # Expect an error if the length of `x_right` is not 1 of the length of `x`
  expect_error(paste_left(x = "center", x_right = c("r1", "r2", "r3")))

  expect_error(paste_left(x = c("c1", "c2", "c3"), x_right = c("r1", "r2")))
})
