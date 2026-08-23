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

test_that("normalize_locale() works correctly", {

  # NULL locale returns NULL
  expect_null(normalize_locale(NULL))

  # Underscores are converted to hyphens
  expect_equal(normalize_locale("en_US"), "en")

  # Default locales (e.g., 'en-US') map to their base locale ('en')
  expect_equal(normalize_locale("en-US"), "en")
  expect_equal(normalize_locale("de-DE"), "de")

  # Non-default locales are returned with hyphens substituted
  expect_equal(normalize_locale("fr-CA"), "fr-CA")
  expect_equal(normalize_locale("zh_Hant"), "zh-Hant")
})

test_that("validate_locale() works correctly", {

  # NULL locale returns NULL
  expect_null(validate_locale(NULL))

  # A valid locale is returned unchanged
  expect_equal(validate_locale("en"), "en")
  expect_equal(validate_locale("de"), "de")

  # Underscore separators are normalised to hyphens before lookup
  expect_equal(validate_locale("en_US"), "en-US")

  # A default locale (en-US) is also accepted
  expect_equal(validate_locale("en-US"), "en-US")

  # An invalid locale raises an error
  expect_error(validate_locale("xx-ZZ"), class = "rlang_error")
})

test_that("validate_currency() works correctly", {

  # A `gt_currency` object passes through without error
  expect_no_error(validate_currency(currency("USD")))

  # A valid ISO currency code passes through
  expect_no_error(validate_currency("USD"))
  expect_no_error(validate_currency("EUR"))

  # A valid currency symbol string passes through
  expect_no_error(validate_currency("dollar"))

  # An invalid currency raises an error
  expect_error(validate_currency("ZZZZ"), class = "rlang_error")
})

test_that("get_locale_min_sep_threshold() works correctly", {

  # NULL locale returns the default
  expect_equal(get_locale_min_sep_threshold(locale = NULL, default = 1L), 1L)
  expect_equal(get_locale_min_sep_threshold(locale = NULL, default = 2L), 2L)

  # Invalid locale raises an error
  expect_error(get_locale_min_sep_threshold(locale = "xx-ZZ", default = 1L))

  # A valid locale returns the correct threshold
  expect_equal(get_locale_min_sep_threshold(locale = "en", default = 1L), 1L)
})

test_that("get_locale_range_pattern() works correctly", {

  # NULL locale uses 'en' and returns the en range pattern (with 0→1, 1→2)
  en_raw <- locales$range_pattern[locales$locale == "en"]
  en_expected <- gsub("0", "1", gsub("1", "2", en_raw, fixed = TRUE), fixed = TRUE)
  expect_equal(get_locale_range_pattern(NULL), en_expected)

  # A specific locale returns its own (transformed) pattern
  expect_type(get_locale_range_pattern("de"), "character")
  expect_length(get_locale_range_pattern("de"), 1L)
})

test_that("get_locale_currency_code() works correctly", {

  # NULL locale returns 'USD'
  expect_equal(get_locale_currency_code(NULL), "USD")

  # A locale with a valid currency code returns that code
  expect_equal(get_locale_currency_code("en"), "USD")
  expect_equal(get_locale_currency_code("de"), "EUR")

  # A locale where currency_code is NA returns 'USD'
  expect_equal(get_locale_currency_code("ar"), "USD")
})

test_that("get_locale_idx_set() works correctly", {

  # NULL locale returns LETTERS
  expect_equal(get_locale_idx_set(NULL), LETTERS)

  # An invalid locale raises an error (validate_length_one)
  expect_error(get_locale_idx_set("xx-ZZ"))

  # A valid locale returns a length-1 value (stored as a list-column in the lookup)
  result <- get_locale_idx_set("en")
  expect_length(result, 1L)
})

test_that("get_locale_num_spellout() works correctly", {

  # NULL locale uses 'en' and returns the English spellout vector
  result <- get_locale_num_spellout(NULL)
  expect_type(result, "character")
  expect_true(length(result) > 0)

  # 'sr-Latn' variant is normalised to 'sr-Latn' key in spelled_num
  result_sr <- get_locale_num_spellout("sr-Latn-RS")
  result_base <- get_locale_num_spellout("sr-Latn")
  expect_equal(result_sr, result_base)

  # A locale that exists only as a subtag falls back to the language ('fr-CA' -> 'fr')
  result_fr_ca <- get_locale_num_spellout("fr-CA")
  result_fr    <- get_locale_num_spellout("fr")
  expect_equal(result_fr_ca, result_fr)

  # A completely unknown locale falls back to 'en'
  result_unknown <- get_locale_num_spellout("zz")
  expect_equal(result_unknown, get_locale_num_spellout("en"))
})

test_that("get_locale_no_table_data_text() works correctly", {

  # NULL locale uses 'en'
  en_text <- get_locale_no_table_data_text(NULL)
  expect_type(en_text, "character")
  expect_length(en_text, 1L)

  # A known locale returns its localised string
  de_text <- get_locale_no_table_data_text("de")
  expect_false(identical(de_text, en_text))

  # An invalid locale raises an error
  expect_error(get_locale_no_table_data_text("xx-ZZ"))
})

test_that("get_locale_segments() works correctly", {

  # A simple locale without hyphens returns itself
  expect_equal(get_locale_segments("en"), "en")

  # A locale with one segment returns both the full and the root
  expect_equal(get_locale_segments("en-US"), c("en-US", "en"))

  # A three-part locale returns all progressive segments
  expect_equal(
    get_locale_segments("zh-Hant-TW"),
    c("zh-Hant-TW", "zh-Hant", "zh")
  )
})

test_that("resolve_locale() works correctly", {

  tab <- gt(data.frame(x = 1))

  # NULL locale falls back to the data's locale (NULL by default → returns NULL)
  expect_null(resolve_locale(tab, NULL))

  # 'und' maps to 'en'
  expect_equal(resolve_locale(tab, "und"), "en")

  # A valid locale is normalised and validated
  expect_equal(resolve_locale(tab, "en-US"), "en")
  expect_equal(resolve_locale(tab, "de"), "de")
})

test_that("get_currency_decimals() works correctly", {

  curr_obj <- currency("USD")

  # gt_currency: NULL decimals + use_subunits → 2
  expect_equal(get_currency_decimals(curr_obj, NULL, TRUE), 2)

  # gt_currency: explicit decimals + use_subunits → that value
  expect_equal(get_currency_decimals(curr_obj, 3, TRUE), 3)

  # gt_currency: !use_subunits → 0
  expect_equal(get_currency_decimals(curr_obj, NULL, FALSE), 0)

  # Normal currency symbol: NULL decimals + use_subunits → 2
  expect_equal(get_currency_decimals("dollar", NULL, TRUE), 2)

  # Normal currency code: NULL decimals + use_subunits → from exponent (numeric)
  expect_true(is.numeric(get_currency_decimals("USD", NULL, TRUE)))

  # NULL decimals + !use_subunits → 0
  expect_equal(get_currency_decimals("USD", NULL, FALSE), 0)

  # Explicit decimals are always returned as-is
  expect_equal(get_currency_decimals("USD", 4, TRUE), 4)
})

test_that("scale_x_values() works correctly", {

  # A function as scale_by is called directly on x
  expect_equal(scale_x_values(1:3, scale_by = function(x) x * 2), c(2, 4, 6))

  # A scalar multiplies all values
  expect_equal(scale_x_values(c(1, 2, 3), scale_by = 10), c(10, 20, 30))

  # A vector of the same length multiplies element-wise
  expect_equal(scale_x_values(c(1, 2, 3), scale_by = c(1, 2, 3)), c(1, 4, 9))

  # A vector of the wrong length raises an error
  expect_error(
    scale_x_values(1:3, scale_by = c(2, 3)),
    class = "rlang_error"
  )
})

test_that("insert_seps_ind() works correctly", {

  # Empty string passes through unchanged
  expect_equal(insert_seps_ind(""), "")

  # Fewer than 4 digits: no separators
  expect_equal(insert_seps_ind("123"), "123")

  # Exactly 4 digits: one separator after position 1
  expect_equal(insert_seps_ind("1234"), "1,234")

  # Classic Indian grouping: 1,23,45,678
  expect_equal(insert_seps_ind("12345678"), "1,23,45,678")

  # Non-digit characters raise an error
  expect_error(insert_seps_ind("12A4"), class = "rlang_error")
})

test_that("to_latex_math_mode() works correctly", {

  # Non-latex context: values passed through unchanged
  expect_equal(to_latex_math_mode(c("1.23", "-4.56"), "html"), c("1.23", "-4.56"))

  # Latex context: values wrapped in $...$
  expect_equal(to_latex_math_mode(c("1.23", "-4.56"), "latex"), c("$1.23$", "$-4.56$"))

  # Latex + textperthousand: $ starts before the number, closes before the mark
  result <- to_latex_math_mode(c("123\\textperthousand"), "latex")
  expect_true(grepl("\\$123", result))
  expect_true(grepl("\\\\textperthousand", result))
})

test_that("context_missing_text() works correctly", {

  # HTML: '---' → em dash
  expect_equal(context_missing_text("---", "html"), "\U02014")

  # HTML: '--' → en dash
  expect_equal(context_missing_text("--", "html"), "\U02013")

  # HTML: blank → <br />
  expect_equal(context_missing_text("", "html"), "<br />")
  expect_equal(context_missing_text("  ", "html"), "<br />")

  # RTF: '---' and '--' get RTF equivalents
  expect_equal(context_missing_text("---", "rtf"), "\\'97")
  expect_equal(context_missing_text("--",  "rtf"), "\\'96")

  # AsIs values bypass substitution
  expect_equal(context_missing_text(I("---"), "html"), I("---"))

  # word context mirrors html for em/en dash
  expect_equal(context_missing_text("---", "word"), "\U02014")
})

test_that("context_plusminus_mark() works correctly", {

  # html/latex/grid/word: ' +/- ' → ' ± '
  for (ctx in c("html", "latex", "grid", "word")) {
    expect_equal(context_plusminus_mark(" +/- ", ctx), " \U000B1 ", info = ctx)
  }

  # rtf: ' +/- ' → RTF form
  expect_equal(context_plusminus_mark(" +/- ", "rtf"), " \\'b1 ")

  # A custom value is returned unchanged
  for (ctx in c("html", "rtf")) {
    expect_equal(context_plusminus_mark("±", ctx), "±", info = ctx)
  }

  # AsIs bypasses substitution
  expect_equal(context_plusminus_mark(I(" +/- "), "html"), I(" +/- "))
})

test_that("resolve_small_vals_text() works correctly", {

  expect_equal(resolve_small_vals_text(0.001, "<{x}"), "<0.001")
  expect_equal(resolve_small_vals_text(-0.5, "below {x}"), "below 0.5")
})

test_that("context_large_vals_text() works correctly", {

  # '>={x}' with positive sign → ≥ threshold
  result_pos <- context_large_vals_text(1000, ">={x}", "+", "html")
  expect_true(grepl("1000", as.character(result_pos)))
  expect_true(inherits(result_pos, "AsIs"))

  # '>={x}' with negative sign → ≤ -threshold
  result_neg <- context_large_vals_text(1000, ">={x}", "-", "html")
  expect_true(grepl("1000", as.character(result_neg)))
  expect_true(inherits(result_neg, "AsIs"))

  # Custom pattern: {x} is substituted
  expect_equal(context_large_vals_text(999, "over {x}!", "+", "html"), "over 999!")
})

test_that("context_lte_mark() and context_gte_mark() work correctly", {

  # html / grid / word → unicode symbols
  expect_equal(context_lte_mark("html"),        "\U02264")
  expect_equal(context_lte_mark("grid"),        "\U02264")
  expect_equal(context_lte_mark("word"),        "\U02264")
  expect_equal(context_gte_mark("html"),        "\U02265")

  # latex → LaTeX math commands
  expect_equal(context_lte_mark("latex"), "$\\leq$")
  expect_equal(context_gte_mark("latex"), "$\\geq$")

  # rtf / other → plain ASCII
  expect_equal(context_lte_mark("rtf"), "<=")
  expect_equal(context_gte_mark("rtf"), ">=")
})

test_that("context_minus_mark() works correctly", {

  expect_equal(context_minus_mark("html"), "\U02212")
  expect_equal(context_minus_mark("latex"), "-")
  expect_equal(context_minus_mark("rtf"),   "-")
})

test_that("context_percent_mark() works correctly", {

  expect_equal(context_percent_mark("latex"), "\\%")
  expect_equal(context_percent_mark("html"),  "%")
  expect_equal(context_percent_mark("rtf"),   "%")
})

test_that("context_permille_mark() and context_permyriad_mark() work correctly", {

  expect_equal(context_permille_mark("latex"), "\\textperthousand")
  expect_equal(context_permille_mark("rtf"),   "\\'89")
  expect_equal(context_permille_mark("html"),  "\U02030")

  expect_equal(context_permyriad_mark("latex"), "\\textpertenthousand")
  expect_equal(context_permyriad_mark("rtf"),   "\\uc0\\u8241")
  expect_equal(context_permyriad_mark("html"),  "\U02031")
})

test_that("context_parens_marks() works correctly", {

  # All contexts return the same ASCII pair
  for (ctx in c("html", "latex", "rtf", "word")) {
    expect_equal(context_parens_marks(ctx), c("(", ")"), info = ctx)
  }
})

test_that("context_exp_marks() works correctly", {

  html_marks <- context_exp_marks("html")
  expect_length(html_marks, 2L)
  expect_true(grepl("10<sup", html_marks[1], fixed = TRUE))

  latex_marks <- context_exp_marks("latex")
  expect_true(grepl("times", latex_marks[1]))

  rtf_marks <- context_exp_marks("rtf")
  expect_true(grepl("super", rtf_marks[1]))

  word_marks <- context_exp_marks("word")
  expect_equal(word_marks[2], "")

  grid_marks <- context_exp_marks("grid")
  expect_equal(grid_marks[2], "")
})

test_that("context_exp_str() works correctly", {

  # Default (non-low-ten, non-letter) → 'E'
  expect_equal(context_exp_str("html", "x10n"), "E")

  # 'low-ten' varies by context
  expect_equal(context_exp_str("html",  "low-ten"), "<sub style='font-size: 65%;'>10</sub>")
  expect_equal(context_exp_str("latex", "low-ten"), "{}_10")
  expect_equal(context_exp_str("rtf",   "low-ten"), "{\\sub 10}")
  expect_equal(context_exp_str("word",  "low-ten"), "10^")
  expect_equal(context_exp_str("grid",  "low-ten"), "E")

  # Single letter uses that letter
  expect_equal(context_exp_str("html", "e"),  "e")
  expect_equal(context_exp_str("html", "E"),  "E")

  # Letter + '1' uses the letter only
  expect_equal(context_exp_str("html", "e1"), "e")
})

test_that("context_symbol_str() works correctly", {

  # NULL symbol → empty string
  expect_equal(context_symbol_str("html", NULL), "")

  # '%' → context-correct percent mark
  expect_equal(context_symbol_str("html",  "%"), "%")
  expect_equal(context_symbol_str("latex", "%"), "\\%")

  # gt_currency object: html context returns HTML currency string
  curr_usd <- currency("USD")
  result <- context_symbol_str("html", curr_usd)
  expect_type(result, "character")
  expect_length(result, 1L)

  # gt_currency missing the context and no default → error
  bad_curr <- structure(list(xyz = "oops"), class = "gt_currency")
  expect_error(context_symbol_str("html", bad_curr), class = "rlang_error")
})

test_that("format_minus() works correctly", {

  # All non-negative values: pass through unchanged
  expect_equal(
    format_minus(c("1.0", "2.0"), c(1, 2), "html"),
    c("1.0", "2.0")
  )

  # Negative values: hyphen is replaced with the context minus mark
  result_html <- format_minus(c("-1.0", "2.0"), c(-1, 2), "html")
  expect_equal(result_html, c(paste0("\U02212", "1.0"), "2.0"))

  # RTF and other contexts keep the plain hyphen minus
  result_rtf <- format_minus(c("-1.0", "2.0"), c(-1, 2), "rtf")
  expect_equal(result_rtf, c("-1.0", "2.0"))
})

test_that("format_as_accounting() works correctly", {

  # accounting = FALSE: pass through unchanged
  expect_equal(
    format_as_accounting(c("-1.00", "2.00"), c(-1, 2), "html", FALSE),
    c("-1.00", "2.00")
  )

  # accounting = TRUE, all positive: pass through unchanged
  expect_equal(
    format_as_accounting(c("1.00", "2.00"), c(1, 2), "html", TRUE),
    c("1.00", "2.00")
  )

  # accounting = TRUE, some negative: negatives get parentheses (minus removed)
  result <- format_as_accounting(
    c("\U021221.00", "2.00"),
    c(-1, 2),
    "html",
    TRUE
  )
  expect_true(grepl("^\\(", result[1]))
  expect_true(grepl("\\)$", result[1]))
  expect_equal(result[2], "2.00")
})

test_that("get_arg_names() works correctly", {

  # No filtering: returns all formals
  all_args <- get_arg_names("fmt_number")
  expect_true("decimals" %in% all_args)
  expect_true("data" %in% all_args)

  # in_args: returns exactly those names
  expect_equal(
    get_arg_names("fmt_number", in_args = c("decimals", "sep_mark")),
    c("decimals", "sep_mark")
  )

  # all_args_except: returns all minus the excluded set
  filtered <- get_arg_names("fmt_number", all_args_except = c("data", "columns", "rows"))
  expect_false("data" %in% filtered)
  expect_true("decimals" %in% filtered)

  # Both in_args and all_args_except → error
  expect_error(
    get_arg_names("fmt_number", in_args = "x", all_args_except = "y"),
    class = "rlang_error"
  )
})

test_that("args_have_gt_column_obj() works correctly", {

  # No gt_column object in the list → FALSE
  expect_false(args_have_gt_column_obj(list(a = 1, b = "x")))

  # At least one gt_column object → TRUE
  col_obj <- structure(list(column = "mpg"), class = "gt_column")
  expect_true(args_have_gt_column_obj(list(a = 1, b = col_obj)))
})

test_that("num_fmt_factory() handles NA and integer64 inputs", {

  fmt_fn <- num_fmt_factory(
    context  = "html",
    pattern  = "{x}",
    format_fn = function(x, context) as.character(round(x, 2))
  )

  # NA values are preserved as NA_character_
  result <- fmt_fn(c(1.5, NA, 3.0))
  expect_equal(result, c("1.5", NA_character_, "3"))

  # All-NA input
  expect_equal(fmt_fn(c(NA_real_, NA_real_)), c(NA_character_, NA_character_))

  # integer64 input is converted to numeric before formatting
  skip_if_not_installed("bit64")
  x64 <- bit64::as.integer64(c(1000, 2000))
  result64 <- fmt_fn(x64)
  expect_type(result64, "character")
  expect_length(result64, 2L)
})
