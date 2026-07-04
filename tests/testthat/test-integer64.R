
test_that("fmt_currency() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("foo", "bar", "baz"),
    money = bit64::as.integer64(c(1000, 2000, 3500))
  )

  # Create a gt table and format the integer64 column as currency
  tab <- gt(data_tbl)

  # Expect that formatting works without errors
  expect_no_error(
    formatted_tab <- tab |>
      fmt_currency(columns = money, currency = "USD")
  )

  # Check that the formatted values are correct
  expect_equal(
    (tab |>
       fmt_currency(columns = money, currency = "USD") |>
       render_formats_test(context = "html"))[["money"]],
    c("$1,000.00", "$2,000.00", "$3,500.00")
  )

  # Test with different currencies
  eur_formatted <- (tab |>
       fmt_currency(columns = money, currency = "EUR") |>
       render_formats_test(context = "html"))[["money"]]
  expect_true(all(grepl("1,000.00", eur_formatted[1])))
  expect_true(all(grepl("2,000.00", eur_formatted[2])))
  expect_true(all(grepl("3,500.00", eur_formatted[3])))

  # Test with decimals argument
  expect_equal(
    (tab |>
       fmt_currency(columns = money, currency = "USD", decimals = 0) |>
       render_formats_test(context = "html"))[["money"]],
    c("$1,000", "$2,000", "$3,500")
  )
})

test_that("fmt_number() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("alpha", "beta", "gamma"),
    value = bit64::as.integer64(c(1234567, 9876543, 5555555))
  )

  tab <- gt(data_tbl)

  # Expect that formatting works without errors
  expect_no_error(
    formatted_tab <- tab |>
      fmt_number(columns = value, decimals = 2)
  )

  # Check that the formatted values are correct
  expect_equal(
    (tab |>
       fmt_number(columns = value, decimals = 2) |>
       render_formats_test(context = "html"))[["value"]],
    c("1,234,567.00", "9,876,543.00", "5,555,555.00")
  )

  # Test with no separators
  expect_equal(
    (tab |>
       fmt_number(columns = value, decimals = 0, use_seps = FALSE) |>
       render_formats_test(context = "html"))[["value"]],
    c("1234567", "9876543", "5555555")
  )
})

test_that("fmt_integer() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("one", "two", "three"),
    count = bit64::as.integer64(c(100, 200, 300))
  )

  tab <- gt(data_tbl)

  # Expect that formatting works without errors
  expect_no_error(
    formatted_tab <- tab |>
      fmt_integer(columns = count)
  )

  # Check that the formatted values are correct
  expect_equal(
    (tab |>
       fmt_integer(columns = count) |>
       render_formats_test(context = "html"))[["count"]],
    c("100", "200", "300")
  )

  # Test with large values
  data_tbl_large <- data.frame(
    value = bit64::as.integer64(c(1000000, 2000000, 3000000))
  )

  tab_large <- gt(data_tbl_large)

  expect_equal(
    (tab_large |>
       fmt_integer(columns = value) |>
       render_formats_test(context = "html"))[["value"]],
    c("1,000,000", "2,000,000", "3,000,000")
  )
})

test_that("fmt_percent() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns representing proportions
  # (though this is an unusual use case for integer64)
  data_tbl <- data.frame(
    name = c("A", "B", "C"),
    pct = bit64::as.integer64(c(50, 75, 100))
  )

  tab <- gt(data_tbl)

  # Test with scale_values = FALSE (treating as already scaled)
  expect_no_error(
    formatted_tab <- tab |>
      fmt_percent(columns = pct, scale_values = FALSE, decimals = 0)
  )

  expect_equal(
    (tab |>
       fmt_percent(columns = pct, scale_values = FALSE, decimals = 0) |>
       render_formats_test(context = "html"))[["pct"]],
    c("50%", "75%", "100%")
  )
})

test_that("fmt_scientific() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("X", "Y", "Z"),
    sci = bit64::as.integer64(c(1000000, 5000000, 9000000))
  )

  tab <- gt(data_tbl)

  # Expect that formatting works without errors
  expect_no_error(
    formatted_tab <- tab |>
      fmt_scientific(columns = sci)
  )

  # Check that the formatted values are correct (contain expected parts)
  sci_formatted <- (tab |>
       fmt_scientific(columns = sci, decimals = 2) |>
       render_formats_test(context = "html"))[["sci"]]
  expect_true(grepl("1.00", sci_formatted[1]))
  expect_true(grepl("5.00", sci_formatted[2]))
  expect_true(grepl("9.00", sci_formatted[3]))
  expect_true(all(grepl("10<sup", sci_formatted)))
})

test_that("fmt_engineering() works with integer64 columns", {

  skip_if_not_installed("bit64")

  df <- data.frame(
    name = c("a", "b"),
    value = bit64::as.integer64(c(1000000, 2000000000))
  )

  gt_tbl <- gt(df) |>
    fmt_engineering(columns = value)

  rendered <- render_formats_test(gt_tbl, context = "html")

  # Should format successfully
  expect_false(any(is.na(rendered$value)))
})

test_that("fmt_bytes() works with integer64 columns", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 byte values
  data_tbl <- data.frame(
    name = c("small", "medium", "large"),
    bytes = bit64::as.integer64(c(1024, 1048576, 1073741824))
  )

  tab <- gt(data_tbl)

  # Expect that formatting works without errors
  expect_no_error(
    formatted_tab <- tab |>
      fmt_bytes(columns = bytes)
  )

  # Check that the formatted values contain the expected units
  bytes_formatted <- (tab |>
       fmt_bytes(columns = bytes) |>
       render_formats_test(context = "html"))[["bytes"]]
  expect_true(grepl("kB", bytes_formatted[1]))
  expect_true(grepl("MB", bytes_formatted[2]))
  expect_true(grepl("GB", bytes_formatted[3]))
})

test_that("integer64 with NA values are handled correctly", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns including NA
  data_tbl <- data.frame(
    name = c("A", "B", "C", "D"),
    value = bit64::as.integer64(c(1000, NA, 3000, 4000))
  )

  tab <- gt(data_tbl)

  # Check that NA values result in some NA representation
  na_result <- (tab |>
       fmt_currency(columns = value, currency = "USD") |>
       render_formats_test(context = "html"))[["value"]]
  expect_equal(na_result[1], "$1,000.00")
  expect_equal(na_result[3], "$3,000.00")
  expect_equal(na_result[4], "$4,000.00")
  # NA value should not be formatted as currency

  expect_false(grepl("\\$", na_result[2]))

  # Test with custom NA text using sub_missing before formatting
  # Note: sub_missing may convert certain patterns, so we just check it doesn't
  # render as currency
  na_formatted <- (tab |>
       sub_missing(missing_text = "N/A") |>
       fmt_currency(columns = value, currency = "USD") |>
       render_formats_test(context = "html"))[["value"]]
  expect_equal(na_formatted[1], "$1,000.00")
  expect_equal(na_formatted[2], "N/A")
  expect_equal(na_formatted[3], "$3,000.00")
  expect_equal(na_formatted[4], "$4,000.00")
})

test_that("integer64 works with negative values", {

  skip_if_not_installed("bit64")

  # Create a data frame with negative integer64 values
  data_tbl <- data.frame(
    name = c("A", "B", "C"),
    value = bit64::as.integer64(c(-1000, 2000, -3000))
  )


  tab <- gt(data_tbl)

  # Check that negative values are formatted correctly
  expect_equal(
    (tab |>
       fmt_currency(columns = value, currency = "USD") |>
       render_formats_test(context = "html"))[["value"]],
    c(paste0("\U02212", "$1,000.00"), "$2,000.00", paste0("\U02212", "$3,000.00"))
  )

  # Test with accounting format
  expect_equal(
    (tab |>
       fmt_currency(columns = value, currency = "USD", accounting = TRUE) |>
       render_formats_test(context = "html"))[["value"]],
    c("($1,000.00)", "$2,000.00", "($3,000.00)")
  )
})

test_that("integer64 works with suffixing", {

  skip_if_not_installed("bit64")

  # Create a data frame with large integer64 values
  data_tbl <- data.frame(
    name = c("A", "B", "C"),
    value = bit64::as.integer64(c(1000000, 2500000, 5000000000))
  )

  tab <- gt(data_tbl)

  # Check that suffixing works
  expect_equal(
    (tab |>
       fmt_currency(columns = value, currency = "USD", suffixing = TRUE) |>
       render_formats_test(context = "html"))[["value"]],
    c("$1.00M", "$2.50M", "$5.00B")
  )
})

test_that("integer64 works in LaTeX context", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("foo", "bar"),
    money = bit64::as.integer64(c(1000, 2000))
  )

  tab <- gt(data_tbl)

  # Check LaTeX formatting
  expect_equal(
    (tab |>
       fmt_currency(columns = money, currency = "USD") |>
       render_formats_test(context = "latex"))[["money"]],
    c("\\$1,000.00", "\\$2,000.00")
  )
})

test_that("integer64 works with from_column()", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns and a currency column
  data_tbl <- data.frame(
    amount = bit64::as.integer64(c(1000, 2000, 3000)),
    curr = c("USD", "EUR", "GBP")
  )

  tab <- gt(data_tbl)

  # Format using currency from column
  expect_no_error(
    formatted_tab <- tab |>
      fmt_currency(columns = amount, currency = from_column(column = "curr"))
  )

  # Check that different currencies are applied
  formatted_output <- (formatted_tab |>
    render_formats_test(context = "html"))[["amount"]]

  # Just check that formatting happened (exact symbols may vary)
  expect_true(all(nchar(formatted_output) > 4))
  expect_true(!any(is.na(formatted_output)))
})

test_that("integer64 works with rows argument", {

  skip_if_not_installed("bit64")

  # Create a data frame with integer64 columns
  data_tbl <- data.frame(
    name = c("A", "B", "C", "D"),
    value = bit64::as.integer64(c(1000, 2000, 3000, 4000))
  )

  tab <- gt(data_tbl)

  # Format only specific rows
  expect_equal(
    (tab |>
       fmt_currency(columns = value, currency = "USD", rows = c(1, 3)) |>
       render_formats_test(context = "html"))[["value"]],
    c("$1,000.00", "2000", "$3,000.00", "4000")
  )
})

test_that("integer64 works with large values that exceed integer range", {

  skip_if_not_installed("bit64")

  # Values larger than .Machine$integer.max (2147483647) but within double precision
  # Note: Values larger than 2^53 (9007199254740992) will lose precision when
  # converted to double
  data_tbl <- data.frame(
    name = c("a", "b"),
    value = bit64::as.integer64(c("5000000000000", "9007199254740000"))
  )

  gt_tbl <- gt(data_tbl) |>
    fmt_number(columns = value, decimals = 0)

  rendered <- render_formats_test(gt_tbl, context = "html")

  # Should format without overflow issues for values within double precision
  expect_true(grepl("5,000,000,000,000", rendered$value[1]))
  expect_true(grepl("9,007,199,254,740,000", rendered$value[2]))
})
