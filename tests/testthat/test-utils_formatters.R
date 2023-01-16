test_that("the `filter_table_to_value()` function works correctly", {

  # Expect that filtering the `locales` table with
  # `filter_table_to_value()` will return a single value
  # so long as the filtering expressions are well chosen
  expect_equal(
    locales %>% filter_table_to_value(lang_name, locale == "ar-AE"),
    "ar"
  )

  # Expect an error with `filter_table_to_value()` if the
  # chosen filtering expressions result in a number of
  # returned rows not equal to 1
  expect_error(
    locales %>% filter_table_to_value(lang_desc, lang_name == "en")
  )
})

test_that("the `get_locale_sep_mark()` function works correctly", {

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

test_that("the `get_locale_dec_mark()` function works correctly", {

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

test_that("the `has_order_zero()` function works correctly", {

  # Create numeric vectors, with and without
  # NA values
  x <- c(-500, -50, -5, -0.5, -0.05, 0, 0.05, 0.5, 5, 50, 500)
  x_has_NA <- c(NA_real_, -50, -5, -0.5, -0.05, 0, 0.05, 0.5, 5, 50, NA_real_)

  # Expect that a vector of numbers introduced
  # to `has_order_zero()` will result in a equal-
  # length logical vector (for vectors that have
  # and don't have NA values)
  expect_length(
    x %>% has_order_zero(),
    length(x)
  )

  expect_length(
    x_has_NA %>% has_order_zero(),
    length(x_has_NA)
  )

  expect_type(
    x %>% has_order_zero(),
    "logical"
  )

  expect_type(
    x_has_NA %>% has_order_zero(),
    "logical"
  )

  # Expect the correct logical values for
  # vectors that have and don't have NA values
  expect_equal(
    x %>% has_order_zero(),
    c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, TRUE, FALSE, FALSE)
  )
  expect_equal(
    x_has_NA %>% has_order_zero(),
    c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE,FALSE, FALSE, TRUE, FALSE, FALSE)
  )
})

test_that("the `split_string_2()` function works correctly", {

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

test_that("the `paste_between()` function works correctly", {

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

test_that("the `paste_on_side()` function works correctly", {

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

test_that("the `paste_left()` function works correctly", {

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

test_that("the `paste_right()` function works correctly", {

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
