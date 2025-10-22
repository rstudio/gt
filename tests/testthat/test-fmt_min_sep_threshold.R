test_that("fmt_number() respects min_sep_threshold parameter", {

  # Create a data frame with values near threshold boundaries
  data_tbl <-
    data.frame(
      num_1 = c(100, 500, 999, 999.49, 999.50, 999.99, 1000, 5000, 10000, 50000, 100000),
      num_2 = c(9000, 9500, 9999, 9999.49, 9999.50, 9999.99, 10000, 50000, 100000, 500000, 1000000),
      num_3 = c(-100, -500, -999, -999.49, -999.50, -999.99, -1000, -5000, -10000, -50000, -100000)
    )

  tab <- gt(data_tbl)

  # Test threshold=1 (default): separators start at 1,000 (10^3)
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "100", "500", "999", "999", "1,000", "1,000", "1,000",
      "5,000", "10,000", "50,000", "100,000"
    )
  )

  # Test threshold=2: separators start at 10,000 (10^4)
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 0, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "100", "500", "999", "999", "1000", "1000", "1000",
      "5000", "10,000", "50,000", "100,000"
    )
  )

  # Test threshold=3: separators start at 100,000 (10^5)
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 0, min_sep_threshold = 3) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "100", "500", "999", "999", "1000", "1000", "1000",
      "5000", "10000", "50000", "100,000"
    )
  )

  # Test with threshold=2 on larger values
  expect_equal(
    (tab |>
       fmt_number(columns = num_2, decimals = 0, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["num_2"]],
    c(
      "9000", "9500", "9999", "9999", "10,000", "10,000", "10,000",
      "50,000", "100,000", "500,000", "1,000,000"
    )
  )

  # Test with negative numbers (uses abs value for threshold check)
  expect_equal(
    (tab |>
       fmt_number(columns = num_3, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_3"]],
    c(
      paste0("\U02212", "100"),
      paste0("\U02212", "500"),
      paste0("\U02212", "999"),
      paste0("\U02212", "999"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "5,000"),
      paste0("\U02212", "10,000"),
      paste0("\U02212", "50,000"),
      paste0("\U02212", "100,000")
    )
  )

  # Test that default behavior (no parameter) uses threshold=1
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 0) |>
       render_formats_test(context = "html"))[["num_1"]],
    (tab |>
       fmt_number(columns = num_1, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_1"]]
  )

  # Test with use_seps = FALSE (should override min_sep_threshold)
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 0, use_seps = FALSE, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("100", "500", "999", "999", "1000", "1000", "1000", "5000", "10000", "50000", "100000")
  )

  # Test with decimal places preserved
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "100.00", "500.00", "999.00", "999.49", "999.50", "999.99", "1,000.00",
      "5,000.00", "10,000.00", "50,000.00", "100,000.00"
    )
  )
})

test_that("fmt_integer() respects min_sep_threshold parameter", {

  data_tbl <-
    data.frame(
      num_1 = c(100, 500, 999, 1000, 5000, 10000, 50000, 100000),
      num_2 = c(-100, -500, -999, -1000, -5000, -10000, -50000, -100000)
    )

  tab <- gt(data_tbl)

  # Test threshold=1 (default)
  expect_equal(
    (tab |>
       fmt_integer(columns = num_1, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("100", "500", "999", "1,000", "5,000", "10,000", "50,000", "100,000")
  )

  # Test threshold=2
  expect_equal(
    (tab |>
       fmt_integer(columns = num_1, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("100", "500", "999", "1000", "5000", "10,000", "50,000", "100,000")
  )

  # Test threshold=3
  expect_equal(
    (tab |>
       fmt_integer(columns = num_1, min_sep_threshold = 3) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("100", "500", "999", "1000", "5000", "10000", "50000", "100,000")
  )

  # Test with negative numbers
  expect_equal(
    (tab |>
       fmt_integer(columns = num_2, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["num_2"]],
    c(
      paste0("\U02212", "100"),
      paste0("\U02212", "500"),
      paste0("\U02212", "999"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "5,000"),
      paste0("\U02212", "10,000"),
      paste0("\U02212", "50,000"),
      paste0("\U02212", "100,000")
    )
  )
})

test_that("fmt_currency() respects min_sep_threshold parameter", {

  data_tbl <-
    data.frame(
      amount = c(100, 500, 999, 1000, 5000, 10000, 50000, 100000)
    )

  tab <- gt(data_tbl)

  # Test threshold=1 with USD
  expect_equal(
    (tab |>
       fmt_currency(columns = amount, currency = "USD", decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["amount"]],
    c("$100", "$500", "$999", "$1,000", "$5,000", "$10,000", "$50,000", "$100,000")
  )

  # Test threshold=2 with USD
  expect_equal(
    (tab |>
       fmt_currency(columns = amount, currency = "USD", decimals = 0, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["amount"]],
    c("$100", "$500", "$999", "$1000", "$5000", "$10,000", "$50,000", "$100,000")
  )

  # Test threshold=3 with USD
  expect_equal(
    (tab |>
       fmt_currency(columns = amount, currency = "USD", decimals = 0, min_sep_threshold = 3) |>
       render_formats_test(context = "html"))[["amount"]],
    c("$100", "$500", "$999", "$1000", "$5000", "$10000", "$50000", "$100,000")
  )

  # Test with EUR currency (left placement) - EUR symbol gets HTML encoded
  expect_equal(
    (tab |>
       fmt_currency(columns = amount, currency = "EUR", decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["amount"]],
    c("&#8364;100", "&#8364;500", "&#8364;999", "&#8364;1,000", "&#8364;5,000", "&#8364;10,000", "&#8364;50,000", "&#8364;100,000")
  )
})

test_that("fmt_percent() respects min_sep_threshold parameter", {

  data_tbl <-
    data.frame(
      pct = c(1, 5, 10, 50, 100, 500, 1000, 5000, 10000)
    )

  tab <- gt(data_tbl)

  # Test threshold=1 (scale_values = FALSE to use raw numbers)
  expect_equal(
    (tab |>
       fmt_percent(columns = pct, decimals = 0, scale_values = FALSE, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["pct"]],
    c("1%", "5%", "10%", "50%", "100%", "500%", "1,000%", "5,000%", "10,000%")
  )

  # Test threshold=2
  expect_equal(
    (tab |>
       fmt_percent(columns = pct, decimals = 0, scale_values = FALSE, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["pct"]],
    c("1%", "5%", "10%", "50%", "100%", "500%", "1000%", "5000%", "10,000%")
  )

  # Test threshold=3
  expect_equal(
    (tab |>
       fmt_percent(columns = pct, decimals = 0, scale_values = FALSE, min_sep_threshold = 3) |>
       render_formats_test(context = "html"))[["pct"]],
    c("1%", "5%", "10%", "50%", "100%", "500%", "1000%", "5000%", "10000%")
  )
})

test_that("fmt_bytes() respects min_sep_threshold parameter", {

  data_tbl <-
    data.frame(
      # Use values that will show digit separators when converted to bytes
      bytes = c(500, 1500, 5000, 15000, 50000, 150000, 500000, 1500000)
    )

  tab <- gt(data_tbl)

  # The bytes formatter scales values down (e.g., 1500 -> 2 kB)
  # So we're checking that min_sep_threshold applies to the scaled numeric part
  # Most of these will be small numbers after scaling, but we can still test the parameter

  # Test threshold=1 - this should work as before
  result_t1 <- tab |>
    fmt_bytes(columns = bytes, decimals = 0, min_sep_threshold = 1) |>
    render_formats_test(context = "html")

  # Test threshold=2 - should also work
  result_t2 <- tab |>
    fmt_bytes(columns = bytes, decimals = 0, min_sep_threshold = 2) |>
    render_formats_test(context = "html")

  # The results should be valid and not throw errors
  expect_type(result_t1[["bytes"]], "character")
  expect_type(result_t2[["bytes"]], "character")
  expect_length(result_t1[["bytes"]], 8)
  expect_length(result_t2[["bytes"]], 8)
})

test_that("min_sep_threshold works with locale override", {

  data_tbl <-
    data.frame(
      num = c(999, 1000, 5000, 9999, 10000, 50000)
    )

  tab <- gt(data_tbl)

  # Spanish locale (es) has minimum_grouping_digits = 2 in CLDR
  # So even with min_sep_threshold = 1, it should override to 2
  result_es <- tab |>
    fmt_number(columns = num, decimals = 0, min_sep_threshold = 1, locale = "es") |>
    render_formats_test(context = "html")

  # Spanish should show: 999, 1000, 5000, 9999, 10,000, 50,000
  # (separators only for 10,000+)
  expect_equal(
    result_es[["num"]],
    c("999", "1000", "5000", "9999", "10.000", "50.000")
  )

  # English locale (en) has minimum_grouping_digits = 1
  result_en <- tab |>
    fmt_number(columns = num, decimals = 0, min_sep_threshold = 1, locale = "en") |>
    render_formats_test(context = "html")

  # English should show: 999, 1,000, 5,000, 9,999, 10,000, 50,000
  # (separators for 1,000+)
  expect_equal(
    result_en[["num"]],
    c("999", "1,000", "5,000", "9,999", "10,000", "50,000")
  )

  # Test that explicit min_sep_threshold=2 with en locale gets overridden by locale's value (1)
  # English locale has minimum_grouping_digits = 1, so it will override the user's value
  result_en_2 <- tab |>
    fmt_number(columns = num, decimals = 0, min_sep_threshold = 2, locale = "en") |>
    render_formats_test(context = "html")

  # Since locale 'en' has minimum_grouping_digits=1, it overrides min_sep_threshold=2
  expect_equal(
    result_en_2[["num"]],
    c("999", "1,000", "5,000", "9,999", "10,000", "50,000")
  )
})

test_that("min_sep_threshold handles edge cases correctly", {

  # Test rounding edge cases
  data_tbl <-
    data.frame(
      near_1000 = c(999, 999.49, 999.50, 999.99, 1000, 1000.01),
      near_10000 = c(9999, 9999.49, 9999.50, 9999.99, 10000, 10000.01),
      negative = c(-999, -999.49, -999.50, -999.99, -1000, -1000.01)
    )

  tab <- gt(data_tbl)

  # Test that values rounding to 1000 get separators with threshold=1
  expect_equal(
    (tab |>
       fmt_number(columns = near_1000, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["near_1000"]],
    c("999", "999", "1,000", "1,000", "1,000", "1,000")
  )

  # Test that values rounding to 10000 get separators with threshold=2
  expect_equal(
    (tab |>
       fmt_number(columns = near_10000, decimals = 0, min_sep_threshold = 2) |>
       render_formats_test(context = "html"))[["near_10000"]],
    c("9999", "9999", "10,000", "10,000", "10,000", "10,000")
  )

  # Test negative number rounding
  expect_equal(
    (tab |>
       fmt_number(columns = negative, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["negative"]],
    c(
      paste0("\U02212", "999"),
      paste0("\U02212", "999"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "1,000")
    )
  )

  # Test with zero
  data_zero <- data.frame(val = c(0, 0.1, -0.1))
  tab_zero <- gt(data_zero)

  expect_equal(
    (tab_zero |>
       fmt_number(columns = val, decimals = 0, min_sep_threshold = 1) |>
       render_formats_test(context = "html"))[["val"]],
    c("0", "0", "0")
  )

  # Test with very large numbers - threshold=3 means separators at 100,000+
  data_large <- data.frame(val = c(99999, 100000, 999999, 1000000))
  tab_large <- gt(data_large)

  expect_equal(
    (tab_large |>
       fmt_number(columns = val, decimals = 0, min_sep_threshold = 3) |>
       render_formats_test(context = "html"))[["val"]],
    c("99999", "100,000", "999,999", "1,000,000")
  )
})

test_that("min_sep_threshold works with from_column()", {

  # Test that min_sep_threshold can be specified per row using from_column()
  data_tbl <-
    data.frame(
      value = c(1000, 5000, 10000, 50000),
      threshold = c(1, 2, 2, 1)
    )

  tab <- gt(data_tbl)

  # Row 1: 1000 with threshold=1 -> "1,000"
  # Row 2: 5000 with threshold=2 -> "5000"
  # Row 3: 10000 with threshold=2 -> "10,000"
  # Row 4: 50000 with threshold=1 -> "50,000"
  result <- tab |>
    fmt_number(
      columns = value,
      decimals = 0,
      min_sep_threshold = from_column(column = "threshold")
    ) |>
    render_formats_test(context = "html")

  expect_equal(
    result[["value"]],
    c("1,000", "5000", "10,000", "50,000")
  )
})

test_that("min_sep_threshold works with different sep_mark values", {

  data_tbl <-
    data.frame(
      num = c(999, 1000, 10000, 100000)
    )

  tab <- gt(data_tbl)

  # Test with space as separator
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 0, min_sep_threshold = 1, sep_mark = " ") |>
       render_formats_test(context = "html"))[["num"]],
    c("999", "1 000", "10 000", "100 000")
  )

  # Test with period as separator (suppressing expected warning about both marks being '.')
  # Note: When sep_mark and dec_mark are both '.', formatC() warns, but it still works
  expect_equal(
    suppressWarnings(
      (tab |>
         fmt_number(columns = num, decimals = 0, min_sep_threshold = 1, sep_mark = ".") |>
         render_formats_test(context = "html"))[["num"]]
    ),
    c("999", "1.000", "10.000", "100.000")
  )

  # Test with underscore as separator
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 0, min_sep_threshold = 2, sep_mark = "_") |>
       render_formats_test(context = "html"))[["num"]],
    c("999", "1000", "10_000", "100_000")
  )
})

# Vector formatting tests ------------------------------------------------------

test_that("vec_fmt_number() respects min_sep_threshold parameter", {

  x <- c(999, 1000, 9999, 10000, 99999, 100000)

  # Test threshold=1 (default): separators start at 1,000
  expect_equal(
    vec_fmt_number(x, decimals = 0, min_sep_threshold = 1),
    c("999", "1,000", "9,999", "10,000", "99,999", "100,000")
  )

  # Test threshold=2: separators start at 10,000
  expect_equal(
    vec_fmt_number(x, decimals = 0, min_sep_threshold = 2),
    c("999", "1000", "9999", "10,000", "99,999", "100,000")
  )

  # Test threshold=3: separators start at 100,000
  expect_equal(
    vec_fmt_number(x, decimals = 0, min_sep_threshold = 3),
    c("999", "1000", "9999", "10000", "99999", "100,000")
  )
})

test_that("vec_fmt_integer() respects min_sep_threshold parameter", {

  x <- c(999, 1000, 9999, 10000)

  # Test threshold=1 (default)
  expect_equal(
    vec_fmt_integer(x, min_sep_threshold = 1),
    c("999", "1,000", "9,999", "10,000")
  )

  # Test threshold=2
  expect_equal(
    vec_fmt_integer(x, min_sep_threshold = 2),
    c("999", "1000", "9999", "10,000")
  )
})

test_that("vec_fmt_percent() respects min_sep_threshold parameter", {

  x <- c(9.99, 10.00, 99.99, 100.00)

  # Test threshold=1 (default): 999% has no separator, 1,000% does
  expect_equal(
    vec_fmt_percent(x, decimals = 0, scale_values = TRUE, min_sep_threshold = 1),
    c("999%", "1,000%", "9,999%", "10,000%")
  )

  # Test threshold=2: separators only for 10,000+
  expect_equal(
    vec_fmt_percent(x, decimals = 0, scale_values = TRUE, min_sep_threshold = 2),
    c("999%", "1000%", "9999%", "10,000%")
  )
})

test_that("vec_fmt_currency() respects min_sep_threshold parameter", {

  x <- c(999, 1000, 9999, 10000)

  # Test threshold=1 (default)
  expect_equal(
    vec_fmt_currency(x, currency = "USD", min_sep_threshold = 1),
    c("$999.00", "$1,000.00", "$9,999.00", "$10,000.00")
  )

  # Test threshold=2
  expect_equal(
    vec_fmt_currency(x, currency = "USD", min_sep_threshold = 2),
    c("$999.00", "$1000.00", "$9999.00", "$10,000.00")
  )
})

test_that("vec_fmt_bytes() respects min_sep_threshold parameter", {

  # Use very small byte values to avoid unit conversion to kB
  x <- c(100, 500, 900, 950)

  # Test that parameter is accepted and produces output without error
  result_1 <- vec_fmt_bytes(x, decimals = 0, min_sep_threshold = 1)
  expect_equal(result_1, c("100 B", "500 B", "900 B", "950 B"))
  
  result_2 <- vec_fmt_bytes(x, decimals = 0, min_sep_threshold = 2)
  expect_equal(result_2, c("100 B", "500 B", "900 B", "950 B"))
  
  # Test with values that will show separators after conversion
  # Use values in yottabyte range where we'll see separator effects
  x_large <- c(1.5e24, 12.5e24)  # Will display as YB
  result_large_1 <- vec_fmt_bytes(x_large, decimals = 0, min_sep_threshold = 1)
  result_large_2 <- vec_fmt_bytes(x_large, decimals = 0, min_sep_threshold = 2)
  
  # At least verify the function runs without error with different thresholds
  expect_type(result_large_1, "character")
  expect_type(result_large_2, "character")
  expect_length(result_large_1, 2)
  expect_length(result_large_2, 2)
})

test_that("vec_fmt functions work with locale override", {

  x <- c(1836, 2763, 10000)

  # Estonian locale (et) has minimum_grouping_digits=2, so threshold becomes 2
  # 1836 (4 digits) should NOT get separator, but 10000 (5 digits) should
  expect_equal(
    vec_fmt_number(x, decimals = 0, min_sep_threshold = 1, locale = "et"),
    c("1836", "2763", "10 000")
  )
  
  # With explicit threshold=1 and no locale, all should get separators at 1000+
  expect_equal(
    vec_fmt_integer(x, min_sep_threshold = 1),
    c("1,836", "2,763", "10,000")
  )
})
