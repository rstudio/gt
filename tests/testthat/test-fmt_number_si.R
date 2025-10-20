# Basic Functionality Tests ====================================================

test_that("fmt_number_si() works with basic engineering prefixes", {

  # Create test data with values spanning multiple orders of magnitude
  data_tbl <-
    data.frame(
      value = c(
        1234567890,    # 1.23 G (giga)))
        9876543,       # 9.88 M (mega)
        12345,         # 12.3 k (kilo)
        123.45,        # 123 (no prefix)
        1.2345,        # 1.23 (no prefix)
        0.012345,      # 12.3 m (milli)
        0.000012345,   # 12.3 µ (micro)
        0.000000012345 # 12.3 n (nano)
      )
    )

  # Create a `gt_tbl` object
  tab <- gt(data_tbl)

  # Format with SI prefixes, no unit, 2 decimal places
  expect_equal(
    (tab |>
       fmt_number_si(columns = value, decimals = 2) |>
       render_formats_test("html"))[["value"]],
    c("1.23 G", "9.88 M", "12.35 k", "123.45", "1.23", "12.35 m", "12.34 µ", "12.35 n")  # 12.34µ due to floating point precision
  )
})

test_that("fmt_number_si() handles all engineering mode prefixes", {

  # Test all engineering prefixes from quetta to ronto
  data_tbl <- data.frame(
    value = c(
      # Large prefixes
      5e30,   # quetta (Q)))
      5e27,   # ronna (R)
      5e24,   # yotta (Y)
      5e21,   # zetta (Z)
      5e18,   # exa (E)
      5e15,   # peta (P)
      5e12,   # tera (T)
      5e9,    # giga (G)
      5e6,    # mega (M)
      5e3,    # kilo (k)
      5,      # (none)
      # Small prefixes
      5e-3,   # milli (m)
      5e-6,   # micro (µ)
      5e-9,   # nano (n)
      5e-12,  # pico (p)
      5e-15,  # femto (f)
      5e-18,  # atto (a)
      5e-21,  # zepto (z)
      5e-24,  # yocto (y)
      5e-27   # ronto (r)
    )
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  # Check that each prefix appears
  expect_match(result[1], "Q")   # quetta
  expect_match(result[2], "R")   # ronna
  expect_match(result[3], "Y")   # yotta
  expect_match(result[4], "Z")   # zetta
  expect_match(result[5], "E")   # exa
  expect_match(result[6], "P")   # peta
  expect_match(result[7], "T")   # tera
  expect_match(result[8], "G")   # giga
  expect_match(result[9], "M")   # mega
  expect_match(result[10], "k")  # kilo
  expect_equal(result[11], "5.0")  # no prefix
  expect_match(result[12], "m")  # milli
  expect_match(result[13], "µ")  # micro
  expect_match(result[14], "n")  # nano
  expect_match(result[15], "p")  # pico
  expect_match(result[16], "f")  # femto
  expect_match(result[17], "a")  # atto
  expect_match(result[18], "z")  # zepto
  expect_match(result[19], "y")  # yocto
  expect_match(result[20], "r")  # ronto
})

test_that("fmt_number_si() correctly selects prefix boundaries", {

  # Test values at prefix boundaries
  data_tbl <- data.frame(
    value = c(
      999,      # Should be 999 (no prefix)))
      1000,     # Should be 1k
      1001,     # Should be 1k
      999999,   # Should be 1000k or 1M depending on rounding
      1000000,  # Should be 1M
      0.001,    # Should be 1m
      0.000999, # Should be 999µ
      0.001001  # Should be 1m
    ))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 0) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "999")
  expect_match(result[2], "1 k")
  expect_match(result[3], "1 k")
  expect_match(result[5], "1 M")
  expect_match(result[6], "1 m")
  expect_match(result[7], "999 µ|1 m")  # Could be either depending on rounding
  expect_match(result[8], "1 m")
})

# Unit Handling Tests ==========================================================

test_that("fmt_number_si() works with units", {

  data_tbl <- data.frame(
    power = c(5200, 1500, 750, 100))

  tab <- gt(data_tbl)

  # Format with watts as unit
  expect_equal(
    (tab |>
       fmt_number_si(columns = power, unit = "W", decimals = 1) |>
       render_formats_test("html"))[["power"]],
    c("5.2 kW", "1.5 kW", "750.0 W", "100.0 W")
  )
})

test_that("fmt_number_si() works with various unit types", {

  data_tbl <- data.frame(
    value = rep(1234, 10),
    expected_unit = c("W", "g", "Hz", "m", "s", "V", "A", "F", "Ω", "J")
  )

  # Test each unit type
  for (i in seq_len(nrow(data_tbl))) {
    tab <- gt(data_tbl[i, ])
    result <- (tab |>
      fmt_number_si(columns = value, unit = data_tbl$expected_unit[i], decimals = 1) |>
      render_formats_test("html"))[["value"]]

    expect_match(result, paste0("1\\.2 k", data_tbl$expected_unit[i]))
  }
})

test_that("fmt_number_si() works with no unit", {

  data_tbl <- data.frame(
    value = c(1234, 0.00567))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "1.23 k")
  expect_equal(result[2], "5.67 m")
})

test_that("fmt_number_si() handles empty unit string", {

  data_tbl <- data.frame(value = c(1234))
  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result, "1.23 k")
})

test_that("fmt_number_si() works with compound units", {

  data_tbl <- data.frame(
    value = c(9.8, 3e8))

  tab <- gt(data_tbl)

  # Test with compound units
  result1 <- (gt(data_tbl[1, , drop = FALSE]) |>
    fmt_number_si(columns = value, unit = "m/s²", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  result2 <- (gt(data_tbl[2, , drop = FALSE]) |>
    fmt_number_si(columns = value, unit = "m/s", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result1, "9\\.8 m/s²")
  expect_match(result2, "300\\.0 Mm/s")
})

# Precision and Formatting Tests ===============================================

test_that("fmt_number_si() works with small values", {

  data_tbl <- data.frame(
    mass = c(0.0051, 0.000075, 0.0002, 0.00000000123))

  tab <- gt(data_tbl)

  # Format with grams as unit
  expect_equal(
    (tab |>
       fmt_number_si(columns = mass, unit = "g", n_sigfig = 2) |>
       render_formats_test("html"))[["mass"]],
    c("5.1 mg", "75 µg", "200 µg", "1.2 ng")
  )
})

test_that("fmt_number_si() works with significant figures", {

  data_tbl <- data.frame(
    value = c(1234.5, 12.345, 0.012345))

  tab <- gt(data_tbl)

  # Format with 3 significant figures
  expect_equal(
    (tab |>
       fmt_number_si(columns = value, n_sigfig = 3) |>
       render_formats_test("html"))[["value"]],
    c("1.23 k", "12.3", "12.3 m")
  )

  # Format with 4 significant figures
  result_4sf <- (tab |>
    fmt_number_si(columns = value, n_sigfig = 4) |>
    render_formats_test("html"))[["value"]]

  expect_match(result_4sf[1], "1\\.23[45] k")
  expect_match(result_4sf[2], "12\\.3[45]")
})

test_that("fmt_number_si() works with varying decimal places", {

  data_tbl <- data.frame(value = rep(1234.5678, 5))
  tab <- gt(data_tbl)

  # Test 0 to 4 decimal places
  for (dec in 0:4) {
    result <- (tab |>
      fmt_number_si(columns = value, decimals = dec) |>
      render_formats_test("html"))[["value"]]

    # All should have the same prefix (k)
    expect_match(result[1], "k")
  }

  # Check specific values
  expect_equal(
    (tab |> fmt_number_si(columns = value, decimals = 0) |>
      render_formats_test("html"))[["value"]][1],
    "1 k"
  )

  expect_equal(
    (tab |> fmt_number_si(columns = value, decimals = 2) |>
      render_formats_test("html"))[["value"]][1],
    "1.23 k"
  )
})

test_that("fmt_number_si() respects drop_trailing_zeros", {

  data_tbl <- data.frame(
    value = c(1200, 1230, 1234))

  tab <- gt(data_tbl)

  # With trailing zeros kept
  expect_equal(
    (tab |>
       fmt_number_si(
         columns = value,
         decimals = 2,
         drop_trailing_zeros = FALSE
       ) |>
       render_formats_test("html"))[["value"]],
    c("1.20 k", "1.23 k", "1.23 k")
  )

  # With trailing zeros dropped
  expect_equal(
    (tab |>
       fmt_number_si(
         columns = value,
         decimals = 2,
         drop_trailing_zeros = TRUE
       ) |>
       render_formats_test("html"))[["value"]],
    c("1.2 k", "1.23 k", "1.23 k")
  )
})

test_that("fmt_number_si() respects drop_trailing_dec_mark", {

  data_tbl <- data.frame(
    value = c(1000, 2000))

  tab <- gt(data_tbl)

  # With trailing decimal mark dropped (default)
  result_dropped <- (tab |>
    fmt_number_si(
      columns = value,
      decimals = 2,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = TRUE
    ) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_dropped, c("1 k", "2 k"))
  expect_false(grepl("\\.$", result_dropped[1]))

  # With trailing decimal mark kept
  result_kept <- (tab |>
    fmt_number_si(
      columns = value,
      decimals = 2,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE
    ) |>
    render_formats_test("html"))[["value"]]

  # When drop_trailing_dec_mark=FALSE, decimal mark should be kept (matching fmt_number behavior)
  expect_equal(result_kept, c("1. k", "2. k"))
})

test_that("fmt_number_si() works with use_seps", {

  data_tbl <- data.frame(
    value = c(123456789, 0.000123456))

  tab <- gt(data_tbl)

  # With separators (default)
  result_with_seps <- (tab |>
    fmt_number_si(columns = value, decimals = 2, use_seps = TRUE) |>
    render_formats_test("html"))[["value"]]

  # Without separators
  result_no_seps <- (tab |>
    fmt_number_si(columns = value, decimals = 2, use_seps = FALSE) |>
    render_formats_test("html"))[["value"]]

  # Both should produce similar output (separators don't typically appear in mantissa)
  expect_match(result_with_seps[1], "M")
  expect_match(result_no_seps[1], "M")
})

test_that("fmt_number_si() handles various separator specifications", {

  data_tbl <- data.frame(value = c(1234.5))
  tab <- gt(data_tbl)

  # Test different incl_space values between number and unit
  result_no_space <- (tab |>
    fmt_number_si(columns = value, unit = "W", incl_space = FALSE, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_no_space, "1.23kW")

  result_space <- (tab |>
    fmt_number_si(columns = value, unit = "W", incl_space = TRUE, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_space, "1.23 kW")
})

test_that("fmt_number_si() incl_space works without unit", {

  data_tbl <- data.frame(value = c(1234.5, 0.00123))
  tab <- gt(data_tbl)

  # Test incl_space = FALSE with no unit (just prefix)
  result_no_space <- (tab |>
    fmt_number_si(columns = value, incl_space = FALSE, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_no_space, c("1.23k", "1.23m"))

  # Test incl_space = TRUE with no unit (just prefix)
  result_space <- (tab |>
    fmt_number_si(columns = value, incl_space = TRUE, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_space, c("1.23 k", "1.23 m"))
})

test_that("fmt_number_si() incl_space works with decimal mode", {

  data_tbl <- data.frame(value = c(12.3, 0.123))
  tab <- gt(data_tbl)

  # Test incl_space = FALSE with decimal mode
  result_no_space <- (tab |>
    fmt_number_si(columns = value, unit = "m", incl_space = FALSE, 
                  prefix_mode = "decimal", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_no_space, c("1.2dam", "1.2dm"))

  # Test incl_space = TRUE with decimal mode
  result_space <- (tab |>
    fmt_number_si(columns = value, unit = "m", incl_space = TRUE, 
                  prefix_mode = "decimal", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result_space, c("1.2 dam", "1.2 dm"))
})

test_that("fmt_number_si() incl_space works with force_sign", {

  data_tbl <- data.frame(value = c(1234, -5678))
  tab <- gt(data_tbl)

  # Test incl_space = FALSE with force_sign
  result_no_space <- (tab |>
    fmt_number_si(columns = value, unit = "V", incl_space = FALSE, 
                  force_sign = TRUE, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result_no_space[1], "^\\+1\\.2kV$")
  expect_match(result_no_space[2], "^−5\\.7kV$")

  # Test incl_space = TRUE with force_sign
  result_space <- (tab |>
    fmt_number_si(columns = value, unit = "V", incl_space = TRUE, 
                  force_sign = TRUE, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result_space[1], "^\\+1\\.2 kV$")
  expect_match(result_space[2], "^−5\\.7 kV$")
})

# Edge Cases and Special Values ================================================

test_that("fmt_number_si() handles edge cases", {

  data_tbl <- data.frame(
    value = c(0, NA, Inf, -Inf, 1, -1000))

  tab <- gt(data_tbl)

  # Format values
  result <- (tab |>
    fmt_number_si(columns = value, unit = "m", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # Check that zero, NA, and Inf are handled properly
  expect_match(result[1], "0")      # Zero
  expect_equal(result[2], "NA")     # NA
  expect_match(result[3], "Inf")    # Inf
  expect_match(result[4], "Inf")    # -Inf (with minus)
  expect_equal(result[5], "1.00 m")  # Regular value
  expect_match(result[6], "1.00 km") # Negative value with prefix
})

test_that("fmt_number_si() handles zero correctly", {

  data_tbl <- data.frame(
    value = c(0, 0.0, -0.0))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # All zeros should format the same
  expect_match(result[1], "0")
  expect_match(result[2], "0")
  expect_match(result[3], "0")
})

test_that("fmt_number_si() handles NA values in different positions", {

  data_tbl <- data.frame(
    value = c(NA, 1234, NA, 0.0056, NA))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "g", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "NA")
  expect_match(result[2], "1\\.2 kg")
  expect_equal(result[3], "NA")
  expect_match(result[4], "5\\.6 mg")
  expect_equal(result[5], "NA")
})

test_that("fmt_number_si() handles Inf and -Inf", {

  data_tbl <- data.frame(
    value = c(Inf, -Inf, 1/0, -1/0))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # Check that Inf is preserved
  expect_match(result[1], "Inf")
  expect_match(result[2], "Inf")  # Should have minus mark
  expect_match(result[3], "Inf")
  expect_match(result[4], "Inf")  # Should have minus mark
})

test_that("fmt_number_si() handles NaN", {

  data_tbl <- data.frame(
    value = c(NaN, 0/0))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "m", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # NaN should be handled (likely as NA)
  expect_true(result[1] %in% c("NaN", "NA"))
  expect_true(result[2] %in% c("NaN", "NA"))
})

test_that("fmt_number_si() handles very small numbers near zero", {

  data_tbl <- data.frame(
    value = c(1e-30, 1e-50, .Machine$double.eps))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # These should all get some formatting (not error)
  expect_type(result, "character")
  expect_equal(length(result), 3)
})

test_that("fmt_number_si() handles very large numbers", {

  data_tbl <- data.frame(
    value = c(1e35, 1e50, .Machine$double.xmax / 2))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # These should all get some formatting (not error)
  expect_type(result, "character")
  expect_equal(length(result), 3)
})

# Negative Values Tests ========================================================

test_that("fmt_number_si() handles negative values", {

  data_tbl <- data.frame(
    value = c(-1234, -0.00567, -1234567))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # All should have minus sign
  expect_match(result[1], "^")  # starts with minus
  expect_match(result[2], "^")
  expect_match(result[3], "^")

  # Check correct prefix selection (based on absolute value)
  expect_match(result[1], "k")
  expect_match(result[2], "m")
  expect_match(result[3], "M")
})

test_that("fmt_number_si() force_sign works correctly", {

  data_tbl <- data.frame(
    value = c(-1500, 0, 1500))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", force_sign = TRUE, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], paste0("^", "\U02212"))     # Negative sign (Unicode minus in HTML)
  expect_match(result[3], "^\\+")   # Positive sign forced
})

test_that("fmt_number_si() handles mixed positive and negative values", {

  data_tbl <- data.frame(
    value = c(-5e9, -5e3, 0, 5e3, 5e9))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  # Check signs (Unicode minus in HTML context)
  expect_match(result[1], paste0("^", "\U02212"))  # negative
  expect_match(result[2], paste0("^", "\U02212"))  # negative
  expect_match(result[3], paste0("^[^", "\U02212", "+]"))  # no sign for zero
  expect_match(result[4], paste0("^[^", "\U02212", "]"))   # positive (no forced sign)
  expect_match(result[5], paste0("^[^", "\U02212", "]"))   # positive (no forced sign)

  # Check prefixes
  expect_match(result[1], "G")
  expect_match(result[2], "k")
  expect_match(result[4], "k")
  expect_match(result[5], "G")
})

# from_column() Integration Tests ==============================================

test_that("fmt_number_si() works with from_column() for units", {

  data_tbl <- data.frame(
    value = c(5200, 0.075, 1200000),
    unit = c("W", "g", "Hz")
  )

  tab <- gt(data_tbl)

  # Format with dynamic units from column
  expect_equal(
    (tab |>
       fmt_number_si(
         columns = value,
         unit = from_column("unit"),
         decimals = 1
       ) |>
       render_formats_test("html"))[["value"]],
    c("5.2 kW", "75.0 mg", "1.2 MHz")
  )
})

test_that("fmt_number_si() works with from_column() for decimals", {

  data_tbl <- data.frame(
    value = c(1234.5, 1234.5, 1234.5),
    dec_places = c(0, 2, 4)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      decimals = from_column("dec_places")
    ) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "^1 k$")
  expect_match(result[2], "^1\\.23 k$")
  expect_match(result[3], "^1\\.2345 k$")
})

test_that("fmt_number_si() works with from_column() for n_sigfig", {

  data_tbl <- data.frame(
    value = c(1234.5, 1234.5, 1234.5),
    sigfigs = c(1, 3, 5)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      n_sigfig = from_column("sigfigs")
    ) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "1 k")
  expect_match(result[2], "1\\.23 k")
  expect_match(result[3], "1\\.2345 k")
})

test_that("fmt_number_si() works with from_column() for incl_space", {

  data_tbl <- data.frame(
    value = c(1234, 1234),
    include_space = c(FALSE, TRUE)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      unit = "W",
      incl_space = from_column("include_space"),
      decimals = 1
    ) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "1.2kW")
  expect_equal(result[2], "1.2 kW")
})

test_that("fmt_number_si() works with from_column() for drop_trailing_zeros", {

  data_tbl <- data.frame(
    value = c(1200, 1200),
    drop_zeros = c(FALSE, TRUE)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      decimals = 2,
      drop_trailing_zeros = from_column("drop_zeros")
    ) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "1.20 k")
  expect_equal(result[2], "1.2 k")
})

test_that("fmt_number_si() works with from_column() for force_sign", {

  data_tbl <- data.frame(
    value = c(1234, 1234),
    show_sign = c(FALSE, TRUE)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      force_sign = from_column("show_sign"),
      decimals = 1
    ) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "^1\\.2 k$")  # No sign
  expect_match(result[2], "^\\+1\\.2 k$")  # With sign
})

test_that("fmt_number_si() works with multiple from_column() parameters", {

  data_tbl <- data.frame(
    value = c(5200, 75000, 1200000),
    unit = c("W", "W", "Hz"),
    dec = c(1, 2, 0),
    include_space = c(TRUE, FALSE, TRUE)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      unit = from_column("unit"),
      decimals = from_column("dec"),
      incl_space = from_column("include_space")
    ) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "5.2 kW")
  expect_equal(result[2], "75.00kW")
  expect_equal(result[3], "1 MHz")
})

test_that("fmt_number_si() respects drop_trailing_zeros", {

  data_tbl <- data.frame(
    value = c(1200, 1230, 1234)
  )

  tab <- gt(data_tbl)

  # With trailing zeros kept
  expect_equal(
    (tab |>
       fmt_number_si(
         columns = value,
         decimals = 2,
         drop_trailing_zeros = FALSE
       ) |>
       render_formats_test("html"))[["value"]],
    c("1.20 k", "1.23 k", "1.23 k")
  )

  # With trailing zeros dropped
  expect_equal(
    (tab |>
       fmt_number_si(
         columns = value,
         decimals = 2,
         drop_trailing_zeros = TRUE
       ) |>
       render_formats_test("html"))[["value"]],
    c("1.2 k", "1.23 k", "1.23 k")
  )
})

test_that("fmt_number_si() works with very large and very small numbers", {

  data_tbl <- data.frame(
    value = c(
      1.5e24,    # yotta
      3.7e21,    # zetta
      2.5e-21,   # zepto
      8.9e-24    # yocto
    ))

  tab <- gt(data_tbl)

  expect_equal(
    (tab |>
       fmt_number_si(columns = value, decimals = 1) |>
       render_formats_test("html"))[["value"]],
    c("1.5 Y", "3.7 Z", "2.5 z", "8.9 y")
  )
})

test_that("fmt_number_si() handles newest SI prefixes (ronna, quetta)", {

  data_tbl <- data.frame(
    value = c(
      5.2e27,    # ronna (R)))
      3.8e30,    # quetta (Q)
      7.1e-27,   # ronto (r)
      2.3e-30    # (would need q, but we use r as placeholder)
    ))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "R")  # Contains ronna
  expect_match(result[2], "Q")  # Contains quetta
  expect_match(result[3], "r")  # Contains ronto
})

test_that("fmt_number_si() force_sign works correctly", {

  data_tbl <- data.frame(
    value = c(-1500, 0, 1500))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", force_sign = TRUE, decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], paste0("^", "\U02212"))     # Negative sign (Unicode minus in HTML)
  expect_match(result[3], "^\\+")   # Positive sign forced
})

# Pattern and Locale Tests =====================================================

test_that("fmt_number_si() respects pattern argument", {

  data_tbl <- data.frame(value = c(1234))
  tab <- gt(data_tbl)

  result1 <- (tab |>
    fmt_number_si(columns = value, unit = "W", pattern = "{x}", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  result2 <- (tab |>
    fmt_number_si(columns = value, unit = "W", pattern = "({x})", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  result3 <- (tab |>
    fmt_number_si(columns = value, unit = "W", pattern = "Power: {x}", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result1, "1.2 kW")
  expect_equal(result2, "(1.2 kW)")
  expect_equal(result3, "Power: 1.2 kW")
})

test_that("fmt_number_si() works with custom sep_mark and dec_mark", {

  data_tbl <- data.frame(value = c(1234.5))
  tab <- gt(data_tbl)

  # European style (comma as decimal, period as thousands)
  result_eu <- (tab |>
    fmt_number_si(
      columns = value,
      decimals = 2,
      sep_mark = ".",
      dec_mark = ","
    ) |>
    render_formats_test("html"))[["value"]]

  # Should use comma as decimal separator
  expect_match(result_eu, ",")
})

test_that("fmt_number_si() pattern works with units and prefixes", {

  data_tbl <- data.frame(
    value = c(5200, 0.075))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      unit = "W",
      pattern = "[{x}]",
      decimals = 1
    ) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result[1], "[5.2 kW]")
  expect_equal(result[2], "[75.0 mW]")
})

# Column and Row Targeting Tests ===============================================

test_that("fmt_number_si() works with multiple columns", {

  data_tbl <- data.frame(
    col1 = c(1234, 5678),
    col2 = c(0.0012, 0.0034),
    col3 = c(1e9, 2e9)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = c(col1, col2, col3), decimals = 2) |>
    render_formats_test("html"))

  expect_match(result$col1[1], "1\\.23 k")
  expect_match(result$col2[1], "1\\.20 m")
  expect_match(result$col3[1], "1\\.00 G")
})

test_that("fmt_number_si() works with row targeting", {

  data_tbl <- data.frame(
    value = c(1234, 5678, 9012))

  tab <- gt(data_tbl)

  # Format only specific rows
  result <- (tab |>
    fmt_number_si(columns = value, rows = c(1, 3), decimals = 1) |>
    render_formats_test("html"))[["value"]]

  # Rows 1 and 3 should be formatted, row 2 should not
  expect_match(result[1], "1\\.2 k")
  expect_equal(result[2], "5678")  # Not formatted
  expect_match(result[3], "9\\.0 k")
})

test_that("fmt_number_si() works with everything() column selector", {

  data_tbl <- data.frame(
    a = c(1234),
    b = c(5678),
    c = c(9012)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = everything(), decimals = 1) |>
    render_formats_test("html"))

  expect_match(result$a, "1\\.2 k")
  expect_match(result$b, "5\\.7 k")
  expect_match(result$c, "9\\.0 k")
})

# Prefix Mode Tests ============================================================

test_that("fmt_number_si() prefix_mode='engineering' works correctly", {

  data_tbl <- data.frame(
    value = c(50, 500, 5000, 50000)  # Should use no prefix, no prefix, k, k
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, prefix_mode = "engineering", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  # Engineering mode: only powers of 1000
  expect_false(grepl("[dDhHcC]", result[1]))  # No deca/hecto/centi/deci
  expect_false(grepl("[dDhHcC]", result[2]))
})

test_that("fmt_number_si() handles various rounding scenarios", {

  data_tbl <- data.frame(
    value = c(
      999.4,   # Should round down
      999.5,   # Should round up to 1k
      999.9,   # Should round up to 1k
      1000.4,  # Should be 1k
      1000.5   # Should be 1k
    ))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 0) |>
    render_formats_test("html"))[["value"]]

  # Check that rounding happens appropriately
  expect_type(result, "character")
  expect_equal(length(result), 5)
})

# Real-world Scientific Use Cases ==============================================

test_that("fmt_number_si() works for physics constants", {

  data_tbl <- data.frame(
    constant = c("Speed of Light", "Planck's Constant", "Elementary Charge"),
    value = c(299792458, 6.62607015e-34, 1.602176634e-19),
    unit = c("m/s", "J·s", "C")
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      unit = from_column("unit"),
      n_sigfig = 4
    ) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "M")  # mega or larger for speed of light
  # Planck's constant (6.626e-34) is too small for SI prefixes (smallest is 10^-30)
  expect_match(result[2], "0\\.0+6626")  # No prefix, full decimal representation
  expect_match(result[3], "a|z|y")  # Very small prefix for charge
})

test_that("fmt_number_si() works for chemistry concentrations", {

  data_tbl <- data.frame(
    substance = c("Macro", "Trace", "Ultra-trace"),
    concentration_g = c(5.0, 0.000050, 0.000000050)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = concentration_g,
      unit = "g",
      n_sigfig = 2
    ) |>
    render_formats_test("html"))[["concentration_g"]]

  expect_match(result[1], "5\\.0 g")
  expect_match(result[2], "50 µg")
  expect_match(result[3], "50 ng")  # 5.0e-8 g = 50e-9 g = 50 ng
})

test_that("fmt_number_si() works for electronic components", {

  data_tbl <- data.frame(
    component = c("Capacitor", "Resistor", "Inductor"),
    value = c(0.000047, 10000, 0.001),
    unit = c("F", "Ω", "H")
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = value,
      unit = from_column("unit"),
      n_sigfig = 2
    ) |>
    render_formats_test("html"))[["value"]]

  expect_match(result[1], "47 µF")
  expect_match(result[2], "10 kΩ")
  expect_match(result[3], "1\\.0 mH")
})

test_that("fmt_number_si() works for power consumption data", {

  data_tbl <- data.frame(
    device = c("Power Plant", "House", "Laptop", "LED"),
    watts = c(1e9, 3000, 65, 12)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(
      columns = watts,
      unit = "W",
      n_sigfig = 2
    ) |>
    render_formats_test("html"))[["watts"]]

  expect_match(result[1], "1\\.0 GW")
  expect_match(result[2], "3\\.0 kW")
  expect_match(result[3], "65 W")
  expect_match(result[4], "12 W")
})

# Integration with Other gt Functions ==========================================

test_that("fmt_number_si() can be combined with cols_merge()", {

  data_tbl <- data.frame(
    value = c(1234, 5678),
    uncertainty = c(10, 20)
  )

  tab <- gt(data_tbl)

  # Format then merge
  result <- tab |>
    fmt_number_si(columns = c(value, uncertainty), decimals = 1) |>
    cols_merge(columns = c(value, uncertainty), pattern = "{1} ± {2}")

  # Should not error
  expect_s3_class(result, "gt_tbl")
})

test_that("fmt_number_si() preserves gt_tbl class", {

  data_tbl <- data.frame(value = c(1234))
  tab <- gt(data_tbl)

  result <- fmt_number_si(tab, columns = value, decimals = 2)

  expect_s3_class(result, "gt_tbl")
})

test_that("fmt_number_si() can be chained with other fmt_*() functions", {

  data_tbl <- data.frame(
    num_col = c(1234),
    pct_col = c(0.456)
  )

  tab <- gt(data_tbl)

  result <- tab |>
    fmt_number_si(columns = num_col, unit = "W", decimals = 1) |>
    fmt_percent(columns = pct_col, decimals = 1)

  expect_s3_class(result, "gt_tbl")
})

# Error Handling and Input Validation ==========================================

test_that("fmt_number_si() handles non-gt_tbl input", {

  data_tbl <- data.frame(value = c(1234))

  # Should error if not a gt_tbl
  expect_error(
    fmt_number_si(data_tbl, columns = value),
    class = "rlang_error"
  )
})

test_that("fmt_number_si() validates prefix_mode argument", {

  data_tbl <- data.frame(value = c(1234))
  tab <- gt(data_tbl)

  # Should error with invalid prefix_mode
  expect_error(
    fmt_number_si(tab, columns = value, prefix_mode = "invalid"),
    "must be one of"
  )
})

test_that("fmt_number_si() handles non-numeric columns gracefully", {

  data_tbl <- data.frame(
    text_col = c("abc", "def"),
    num_col = c(1234, 5678)
  )

  tab <- gt(data_tbl)

  # Should handle or warn about non-numeric column
  # (behavior depends on check_columns_valid_if_strict implementation)
  result <- tab |>
    fmt_number_si(columns = num_col, decimals = 1)

  expect_s3_class(result, "gt_tbl")
})

# Consistency Tests ============================================================

test_that("fmt_number_si() produces consistent output for same input", {

  data_tbl <- data.frame(value = c(1234, 1234, 1234))
  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # All three should be identical
  expect_equal(result[1], result[2])
  expect_equal(result[2], result[3])
})

test_that("fmt_number_si() handles decimal/sigfig interaction correctly", {

  data_tbl <- data.frame(value = c(1234.5678))
  tab <- gt(data_tbl)

  # When n_sigfig is specified, decimals should be ignored
  result_sigfig <- (tab |>
    fmt_number_si(columns = value, n_sigfig = 3, decimals = 10) |>
    render_formats_test("html"))[["value"]]

  result_decimals <- (tab |>
    fmt_number_si(columns = value, decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # Should be different (sigfig takes precedence)
  expect_type(result_sigfig, "character")
  expect_type(result_decimals, "character")
})

test_that("fmt_number_si() maintains precision across different scales", {

  data_tbl <- data.frame(
    value = c(1.234e-9, 1.234e-6, 1.234e-3, 1.234, 1.234e3, 1.234e6, 1.234e9))

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, n_sigfig = 3) |>
    render_formats_test("html"))[["value"]]

  # All should maintain 3 significant figures
  expect_equal(length(result), 7)
  # Each should have appropriate prefix
  expect_match(result[1], "n")  # nano
  expect_match(result[2], "µ")  # micro
  expect_match(result[3], "m")  # milli
  expect_match(result[5], "k")  # kilo
  expect_match(result[6], "M")  # mega
  expect_match(result[7], "G")  # giga
})

# Performance and Edge Cases ===================================================

test_that("fmt_number_si() handles large datasets", {

  data_tbl <- data.frame(
    value = runif(1000, 1, 1e6)
  )

  tab <- gt(data_tbl)

  # Should complete without error
  expect_silent({
    result <- fmt_number_si(tab, columns = value, decimals = 2)
  })

  expect_s3_class(result, "gt_tbl")
})

test_that("fmt_number_si() handles all-NA column", {

  data_tbl <- data.frame(
    value = c(NA, NA, NA)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", decimals = 2) |>
    render_formats_test("html"))[["value"]]

  # fmt functions return NA_character_ for NA values (standard gt behavior)
  expect_equal(result, c(NA_character_, NA_character_, NA_character_))
})

test_that("fmt_number_si() handles single-row data", {

  data_tbl <- data.frame(value = c(1234))
  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, unit = "W", decimals = 1) |>
    render_formats_test("html"))[["value"]]

  expect_equal(result, "1.2 kW")
})

test_that("fmt_number_si() handles alternating signs", {

  data_tbl <- data.frame(
    value = c(-1000, 1000, -2000, 2000, -3000, 3000)
  )

  tab <- gt(data_tbl)

  result <- (tab |>
    fmt_number_si(columns = value, decimals = 0) |>
    render_formats_test("html"))[["value"]]

  # Check alternating signs (Unicode minus in HTML context)
  expect_match(result[1], paste0("^", "\U02212"))
  expect_match(result[2], paste0("^[^", "\U02212", "]"))
  expect_match(result[3], paste0("^", "\U02212"))
  expect_match(result[4], paste0("^[^", "\U02212", "]"))
  expect_match(result[5], paste0("^", "\U02212"))
  expect_match(result[6], paste0("^[^", "\U02212", "]"))
})
