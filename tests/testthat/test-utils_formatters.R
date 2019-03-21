context("Ensuring that the utility functions for the formatters work correctly")

test_that("the `filter_table_to_value()` function works correctly", {

  # Expect that filtering the `locales` table with
  # `filter_table_to_value()` will return a single value
  # so long as the filtering expressions are well chosen
  expect_equal(
    locales %>%
      filter_table_to_value(lang, base_locale_id == "en_US"),
    "en"
  )

  # Expect an error with `filter_table_to_value()` if the
  # chosen filtering expressions result in a number of
  # returned rows not equal to 1
  expect_error(
    locales %>%
      filter_table_to_value(base_locale_id, lang == "en")
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
  expect_equal(
    get_locale_sep_mark(locale = "en_US", default = ",", use_seps = FALSE),
    get_locale_sep_mark(locale = "do_IT", default = ",", use_seps = FALSE),
    get_locale_sep_mark(locale = NULL, default = ",", use_seps = FALSE),
    get_locale_sep_mark(locale = NULL, use_seps = FALSE),
    get_locale_sep_mark(use_seps = FALSE),
    ""
  )

  # Expect the correct `sep_mark` values for a range of locales
  expect_equal(
    c(
      get_locale_sep_mark(locale = "fr_CF",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en_JE",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en_KY",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "ln_CF",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en_MO",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "teo_UG", default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en_IL",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "pt_PT",  default = ",", use_seps = TRUE),
      get_locale_sep_mark(locale = "en_DE",  default = ",", use_seps = TRUE)
    ),
    c(" ", ",", ",", ".", ",", ",", ",", " ", ".")
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
      get_locale_dec_mark(locale = "fr_CF",  default = "."),
      get_locale_dec_mark(locale = "en_JE",  default = "."),
      get_locale_dec_mark(locale = "en_KY",  default = "."),
      get_locale_dec_mark(locale = "ln_CF",  default = "."),
      get_locale_dec_mark(locale = "en_MO",  default = "."),
      get_locale_dec_mark(locale = "teo_UG", default = "."),
      get_locale_dec_mark(locale = "en_IL",  default = "."),
      get_locale_dec_mark(locale = "pt_PT",  default = "."),
      get_locale_dec_mark(locale = "en_DE",  default = ".")
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
    x_has_NA %>% has_order_zero(),
    c(FALSE, FALSE, TRUE, FALSE, FALSE, TRUE,
      FALSE, FALSE, TRUE, FALSE, FALSE)
  )
})
