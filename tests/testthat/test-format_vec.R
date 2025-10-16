# Define numeric vectors for testing
vec_num_1 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf)
vec_num_2 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 10
vec_num_3 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 100
vec_num_4 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 1e6
vec_num_5 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 1e12
vec_num_6 <- seq(0, 2, 0.1)

range_0_1 <- c(0.0001, 0.001, 0.01, 0.1, 0.25, 0.4, 0.5, 0.6, 0.75, 0.9, 0.99, 0.999, 0.9999)
range_0_1_minus <- range_0_1 * -1
range_1_2 <- range_0_1 + 1
range_1_2_minus <- range_0_1_minus - 1
exact_numbers <- c(-1, 0, 1)
not_numbers <- c(NA_real_, NaN, Inf, -Inf)

# Define vectors with dates and times
years <- 2020:2024
months <- 1:5
days <- 5:9
hours <- 15:19
minutes <- 35:39
seconds <- 0:4

datetimes <-
  ISOdatetime(
    year = years,
    month = months,
    day = days,
    hour = hours,
    min = minutes,
    sec = seconds,
    tz = "GMT"
  )

dates <- as.Date(datetimes)
times <- paste0(hours, ":", minutes)

test_that("vec_fmt_number() works", {

  vec_fmt_number(vec_num_1, output = "plain") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50",
        "0.00", "0.50", "1.00", "1.50", "2.00", "2.50",
        "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50"),
        paste0("\U02212", "2.00"),
        paste0("\U02212", "1.50"),
        paste0("\U02212", "1.00"),
        paste0("\U02212", "0.50"),
        "0.00", "0.50", "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, output = "latex") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00",
        "0.50", "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, output = "rtf") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00", "0.50",
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_6, decimals = 4, output = "plain") |>
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000", "0.6000",
        "0.7000", "0.8000", "0.9000", "1.0000", "1.1000", "1.2000", "1.3000",
        "1.4000", "1.5000", "1.6000", "1.7000", "1.8000", "1.9000", "2.0000"
      )
    )

  vec_fmt_number(vec_num_6, decimals = 4, output = "html") |>
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000", "0.6000",
        "0.7000", "0.8000", "0.9000", "1.0000", "1.1000", "1.2000", "1.3000",
        "1.4000", "1.5000", "1.6000", "1.7000", "1.8000", "1.9000", "2.0000"
      )
    )

  vec_fmt_number(vec_num_6, decimals = 4, output = "latex") |>
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000",
        "0.6000", "0.7000", "0.8000", "0.9000", "1.0000", "1.1000",
        "1.2000", "1.3000", "1.4000", "1.5000", "1.6000", "1.7000",
        "1.8000", "1.9000", "2.0000"
      )
    )

  vec_fmt_number(vec_num_6, decimals = 4, output = "rtf") |>
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000", "0.6000",
        "0.7000", "0.8000", "0.9000", "1.0000", "1.1000", "1.2000", "1.3000",
        "1.4000", "1.5000", "1.6000", "1.7000", "1.8000", "1.9000", "2.0000"
      )
    )

  vec_fmt_number(vec_num_1, drop_trailing_zeros = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.5", "-2", "-1.5", "-1", "-0.5",
        "0", "0.5", "1", "1.5", "2", "2.5", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, drop_trailing_zeros = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.5"), paste0("\U02212", "2"),
        paste0("\U02212", "1.5"), paste0("\U02212", "1"),
        paste0("\U02212", "0.5"),
        "0", "0.5", "1", "1.5", "2", "2.5", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, drop_trailing_zeros = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.5", "-2", "-1.5", "-1", "-0.5", "0", "0.5",
        "1", "1.5", "2", "2.5", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, drop_trailing_zeros = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.5", "-2", "-1.5", "-1", "-0.5", "0", "0.5", "1", "1.5",
        "2", "2.5", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, n_sigfig = 3, output = "plain") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00",
        "-0.500", "0", "0.500", "1.00", "1.50",
        "2.00", "2.50", "NA", " Inf"
      )
    )

  vec_fmt_number(vec_num_1, n_sigfig = 3, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50"), paste0("\U02212", "2.00"),
        paste0("\U02212", "1.50"), paste0("\U02212", "1.00"),
        paste0("\U02212", "0.500"), "0", "0.500", "1.00", "1.50",
        "2.00", "2.50", "NA", " Inf"
      )
    )

  vec_fmt_number(vec_num_1, n_sigfig = 3, output = "latex") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.500", "0",
        "0.500", "1.00", "1.50", "2.00", "2.50", "NA", " Inf"
      )
    )

  vec_fmt_number(vec_num_1, n_sigfig = 3, output = "rtf") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.500", "0", "0.500",
        "1.00", "1.50", "2.00", "2.50", "NA", " Inf"
      )
    )

  vec_fmt_number(vec_num_4, use_seps = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-2500000.00", "-2000000.00", "-1500000.00", "-1000000.00",
        "-500000.00", "0.00", "500000.00", "1000000.00", "1500000.00",
        "2000000.00", "2500000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, use_seps = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2500000.00"), paste0("\U02212", "2000000.00"),
        paste0("\U02212", "1500000.00"), paste0("\U02212", "1000000.00"),
        paste0("\U02212", "500000.00"), "0.00", "500000.00",
        "1000000.00", "1500000.00", "2000000.00", "2500000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, use_seps = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-2500000.00", "-2000000.00", "-1500000.00", "-1000000.00",
        "-500000.00", "0.00", "500000.00", "1000000.00", "1500000.00",
        "2000000.00", "2500000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, use_seps = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-2500000.00", "-2000000.00", "-1500000.00", "-1000000.00",
        "-500000.00", "0.00", "500000.00", "1000000.00", "1500000.00",
        "2000000.00", "2500000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, accounting = TRUE, output = "plain") |>
    expect_equal(
      c(
        "(2,500,000.00)", "(2,000,000.00)", "(1,500,000.00)", "(1,000,000.00)",
        "(500,000.00)", "0.00", "500,000.00", "1,000,000.00", "1,500,000.00",
        "2,000,000.00", "2,500,000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, accounting = TRUE, output = "html") |>
    expect_equal(
      c(
        "(2.50)", "(2.00)", "(1.50)", "(1.00)", "(0.50)", "0.00", "0.50",
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, accounting = TRUE, output = "latex") |>
    expect_equal(
      c(
        "(2.50)", "(2.00)", "(1.50)", "(1.00)", "(0.50)",
        "0.00", "0.50", "1.00", "1.50", "2.00", "2.50", "NA",
        "Inf"
      )
    )

  vec_fmt_number(vec_num_4, accounting = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "(2,500,000.00)", "(2,000,000.00)", "(1,500,000.00)", "(1,000,000.00)",
        "(500,000.00)", "0.00", "500,000.00", "1,000,000.00", "1,500,000.00",
        "2,000,000.00", "2,500,000.00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, scale_by = 2.5, output = "plain") |>
    expect_equal(
      c(
        "-6.25", "-5.00", "-3.75", "-2.50", "-1.25", "0.00", "1.25",
        "2.50", "3.75", "5.00", "6.25", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, scale_by = 2.5, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "6.25"), paste0("\U02212", "5.00"),
        paste0("\U02212", "3.75"), paste0("\U02212", "2.50"),
        paste0("\U02212", "1.25"), "0.00", "1.25", "2.50", "3.75",
        "5.00", "6.25", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, scale_by = 2.5, output = "latex") |>
    expect_equal(
      c(
        "-6.25", "-5.00", "-3.75", "-2.50", "-1.25", "0.00",
        "1.25", "2.50", "3.75", "5.00", "6.25", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_1, scale_by = 2.5, output = "rtf") |>
    expect_equal(
      c(
        "-6.25", "-5.00", "-3.75", "-2.50", "-1.25", "0.00", "1.25",
        "2.50", "3.75", "5.00", "6.25", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-2.500.000,00", "-2.000.000,00", "-1.500.000,00", "-1.000.000,00",
        "-500.000,00", "0,00", "500.000,00", "1.000.000,00", "1.500.000,00",
        "2.000.000,00", "2.500.000,00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.500.000,00"), paste0("\U02212", "2.000.000,00"),
        paste0("\U02212", "1.500.000,00"), paste0("\U02212", "1.000.000,00"),
        paste0("\U02212", "500.000,00"),
        "0,00", "500.000,00", "1.000.000,00", "1.500.000,00", "2.000.000,00",
        "2.500.000,00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-2.500.000,00", "-2.000.000,00", "-1.500.000,00", "-1.000.000,00",
        "-500.000,00", "0,00", "500.000,00", "1.000.000,00",
        "1.500.000,00", "2.000.000,00", "2.500.000,00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-2.500.000,00", "-2.000.000,00", "-1.500.000,00", "-1.000.000,00",
        "-500.000,00", "0,00", "500.000,00", "1.000.000,00", "1.500.000,00",
        "2.000.000,00", "2.500.000,00", "NA", "Inf"
      )
    )

  vec_fmt_number(vec_num_4, suffixing = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.50M", "-2.00M", "-1.50M", "-1.00M", "-500.00K", "0.00",
        "500.00K", "1.00M", "1.50M", "2.00M", "2.50M", "NA", "InfT"
      )
    )

  vec_fmt_number(vec_num_4, suffixing = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50M"), paste0("\U02212", "2.00M"),
        paste0("\U02212", "1.50M"), paste0("\U02212", "1.00M"),
        paste0("\U02212", "500.00K"), "0.00", "500.00K", "1.00M",
        "1.50M", "2.00M", "2.50M", "NA", "InfT"
      )
    )

  vec_fmt_number(vec_num_4, suffixing = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.50M", "-2.00M", "-1.50M", "-1.00M", "-500.00K",
        "0.00", "500.00K", "1.00M", "1.50M", "2.00M", "2.50M",
        "NA", "InfT"
      )
    )

  vec_fmt_number(vec_num_4, suffixing = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.50M", "-2.00M", "-1.50M", "-1.00M", "-500.00K", "0.00",
        "500.00K", "1.00M", "1.50M", "2.00M", "2.50M", "NA", "InfT"
      )
    )

  vec_fmt_number(vec_num_1, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-2.50b", "a-2.00b", "a-1.50b", "a-1.00b", "a-0.50b", "a0.00b",
        "a0.50b", "a1.00b", "a1.50b", "a2.00b", "a2.50b", "NA", "aInfb"
      )
    )

  vec_fmt_number(vec_num_1, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "2.50b"), paste0("a\U02212", "2.00b"),
        paste0("a\U02212", "1.50b"), paste0("a\U02212", "1.00b"),
        paste0("a\U02212", "0.50b"), "a0.00b", "a0.50b", "a1.00b",
        "a1.50b", "a2.00b", "a2.50b", "NA", "aInfb"
      )
    )

  vec_fmt_number(vec_num_1, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-2.50b", "a-2.00b", "a-1.50b", "a-1.00b", "a-0.50b",
        "a0.00b", "a0.50b", "a1.00b", "a1.50b", "a2.00b", "a2.50b",
        "NA", "aInfb"
      )
    )

  vec_fmt_number(vec_num_1, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-2.50b", "a-2.00b", "a-1.50b", "a-1.00b", "a-0.50b", "a0.00b",
        "a0.50b", "a1.00b", "a1.50b", "a2.00b", "a2.50b", "NA", "aInfb"
      )
    )

  vec_fmt_number(vec_num_1, force_sign = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00", "+0.50",
        "+1.00", "+1.50", "+2.00", "+2.50", "NA", "+Inf"
      )
    )

  vec_fmt_number(vec_num_1, force_sign = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50"), paste0("\U02212", "2.00"),
        paste0("\U02212", "1.50"), paste0("\U02212", "1.00"),
        paste0("\U02212", "0.50"), "0.00", "+0.50", "+1.00",
        "+1.50", "+2.00", "+2.50", "NA", "+Inf"
      )
    )

  vec_fmt_number(vec_num_1, force_sign = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00",
        "+0.50", "+1.00", "+1.50", "+2.00", "+2.50", "NA", "+Inf"
      )
    )

  vec_fmt_number(vec_num_1, force_sign = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00", "+0.50",
        "+1.00", "+1.50", "+2.00", "+2.50", "NA", "+Inf"
      )
    )
})

test_that("vec_fmt_integer() works", {

  vec_fmt_integer(vec_num_1, output = "plain") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "0", "1", "2", "2", "2",
        "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_1, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2"), paste0("\U02212", "2"),
        paste0("\U02212", "2"), paste0("\U02212", "1"),
        "0", "0", "0", "1", "2", "2", "2", "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_1, output = "latex") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "0", "1",
        "2", "2", "2", "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_1, output = "rtf") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "0", "1", "2", "2", "2",
        "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_4, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-2.500.000", "-2.000.000", "-1.500.000", "-1.000.000", "-500.000",
        "0", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000",
        "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_4, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.500.000"), paste0("\U02212", "2.000.000"),
        paste0("\U02212", "1.500.000"), paste0("\U02212", "1.000.000"),
        paste0("\U02212", "500.000"), "0", "500.000", "1.000.000",
        "1.500.000", "2.000.000", "2.500.000", "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_4, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-2.500.000", "-2.000.000", "-1.500.000", "-1.000.000",
        "-500.000", "0", "500.000", "1.000.000", "1.500.000",
        "2.000.000", "2.500.000", "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_4, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-2.500.000", "-2.000.000", "-1.500.000", "-1.000.000", "-500.000",
        "0", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000",
        "NA", "Inf"
      )
    )

  vec_fmt_integer(vec_num_4, suffixing = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2M", "-2M", "-2M", "-1M", "-500K", "0", "500K", "1M", "2M",
        "2M", "2M", "NA", "InfT"
      )
    )

  vec_fmt_integer(vec_num_4, suffixing = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2M"), paste0("\U02212", "2M"),
        paste0("\U02212", "2M"), paste0("\U02212", "1M"),
        paste0("\U02212", "500K"), "0", "500K", "1M", "2M",
        "2M", "2M", "NA", "InfT"
      )
    )

  vec_fmt_integer(vec_num_4, suffixing = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2M", "-2M", "-2M", "-1M", "-500K", "0", "500K",
        "1M", "2M", "2M", "2M", "NA", "InfT"
      )
    )

  vec_fmt_integer(vec_num_4, suffixing = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2M", "-2M", "-2M", "-1M", "-500K", "0", "500K", "1M", "2M",
        "2M", "2M", "NA", "InfT"
      )
    )

  vec_fmt_integer(vec_num_1, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-2b", "a-2b", "a-2b", "a-1b", "a0b", "a0b", "a0b", "a1b",
        "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  vec_fmt_integer(vec_num_1, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "2b"), paste0("a\U02212", "2b"),
        paste0("a\U02212", "2b"), paste0("a\U02212", "1b"),
        "a0b", "a0b", "a0b", "a1b", "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  vec_fmt_integer(vec_num_1, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-2b", "a-2b", "a-2b", "a-1b", "a0b", "a0b", "a0b",
        "a1b", "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  vec_fmt_integer(vec_num_1, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-2b", "a-2b", "a-2b", "a-1b", "a0b", "a0b", "a0b", "a1b",
        "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  vec_fmt_integer(vec_num_1, force_sign = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "+0", "+1", "+2", "+2", "+2",
        "NA", "+Inf"
      )
    )

  vec_fmt_integer(vec_num_1, force_sign = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2"), paste0("\U02212", "2"), paste0("\U02212", "2"),
        paste0("\U02212", "1"), "0", "0", "+0", "+1", "+2", "+2", "+2",
        "NA", "+Inf"
      )
    )

  vec_fmt_integer(vec_num_1, force_sign = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "+0", "+1",
        "+2", "+2", "+2", "NA", "+Inf"
      )
    )

  vec_fmt_integer(vec_num_1, force_sign = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "+0", "+1", "+2", "+2", "+2",
        "NA", "+Inf"
      )
    )
})

test_that("vec_fmt_scientific() works", {

  # TODO: `vec_fmt_scientific()` and `fmt_scientific()` are incompatible with
  # Inf values so we will omit them from the test vectors until a fix is
  # available

  vec_num_1_m <- vec_num_1[-13]
  vec_num_4_m <- vec_num_4[-13]

  vec_fmt_scientific(vec_num_1_m, output = "plain") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00",
        "-5.00 \U000D7 10^-1", "0.00", "5.00 \U000D7 10^-1",
        "1.00", "1.50", "2.00", "2.50", "NA"
      )
    )

  vec_fmt_scientific(vec_num_1_m, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50"), paste0("\U02212", "2.00"),
        paste0("\U02212", "1.50"), paste0("\U02212", "1.00"),
        paste0("\U02212", "5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
        "0.00",
        paste0("5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
        "1.00", "1.50", "2.00", "2.50", "NA"
      )
    )

  vec_fmt_scientific(vec_num_1_m, output = "latex") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-5.00 $\\times$ 10\\textsuperscript{-1}",
        "0.00", "5.00 $\\times$ 10\\textsuperscript{-1}", "1.00", "1.50", "2.00",
        "2.50", "NA"
      )
    )

  vec_fmt_scientific(vec_num_1_m, output = "rtf") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-5.00 \\'d7 10{\\super -1}",
        "0.00", "5.00 \\'d7 10{\\super -1}", "1.00", "1.50", "2.00",
        "2.50", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, output = "plain") |>
    expect_equal(
      c(
        "-2.50 \U000D7 10^6", "-2.00 \U000D7 10^6",
        "-1.50 \U000D7 10^6", "-1.00 \U000D7 10^6",
        "-5.00 \U000D7 10^5", "0.00", "5.00 \U000D7 10^5",
        "1.00 \U000D7 10^6", "1.50 \U000D7 10^6",
        "2.00 \U000D7 10^6", "2.50 \U000D7 10^6", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        "0.00",
        paste0("5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        paste0("1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, output = "latex") |>
    expect_equal(
      c(
        "-2.50 $\\times$ 10\\textsuperscript{6}", "-2.00 $\\times$ 10\\textsuperscript{6}", "-1.50 $\\times$ 10\\textsuperscript{6}",
        "-1.00 $\\times$ 10\\textsuperscript{6}", "-5.00 $\\times$ 10\\textsuperscript{5}", "0.00",
        "5.00 $\\times$ 10\\textsuperscript{5}", "1.00 $\\times$ 10\\textsuperscript{6}", "1.50 $\\times$ 10\\textsuperscript{6}",
        "2.00 $\\times$ 10\\textsuperscript{6}", "2.50 $\\times$ 10\\textsuperscript{6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, output = "rtf") |>
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-5.00 \\'d7 10{\\super 5}", "0.00",
        "5.00 \\'d7 10{\\super 5}", "1.00 \\'d7 10{\\super 6}", "1.50 \\'d7 10{\\super 6}",
        "2.00 \\'d7 10{\\super 6}", "2.50 \\'d7 10{\\super 6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, drop_trailing_zeros = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.5 \U000D7 10^6", "-2 \U000D7 10^6",
        "-1.5 \U000D7 10^6", "-1 \U000D7 10^6",
        "-5 \U000D7 10^5", "0", "5 \U000D7 10^5",
        "1 \U000D7 10^6", "1.5 \U000D7 10^6",
        "2 \U000D7 10^6", "2.5 \U000D7 10^6", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, drop_trailing_zeros = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        "0",
        paste0("5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        paste0("1&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, drop_trailing_zeros = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.5 $\\times$ 10\\textsuperscript{6}", "-2 $\\times$ 10\\textsuperscript{6}", "-1.5 $\\times$ 10\\textsuperscript{6}",
        "-1 $\\times$ 10\\textsuperscript{6}", "-5 $\\times$ 10\\textsuperscript{5}", "0",
        "5 $\\times$ 10\\textsuperscript{5}", "1 $\\times$ 10\\textsuperscript{6}", "1.5 $\\times$ 10\\textsuperscript{6}",
        "2 $\\times$ 10\\textsuperscript{6}", "2.5 $\\times$ 10\\textsuperscript{6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, drop_trailing_zeros = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.5 \\'d7 10{\\super 6}", "-2 \\'d7 10{\\super 6}", "-1.5 \\'d7 10{\\super 6}",
        "-1 \\'d7 10{\\super 6}", "-5 \\'d7 10{\\super 5}", "0",
        "5 \\'d7 10{\\super 5}", "1 \\'d7 10{\\super 6}", "1.5 \\'d7 10{\\super 6}",
        "2 \\'d7 10{\\super 6}", "2.5 \\'d7 10{\\super 6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-2,50 \U000D7 10^6", "-2,00 \U000D7 10^6",
        "-1,50 \U000D7 10^6", "-1,00 \U000D7 10^6",
        "-5,00 \U000D7 10^5", "0,00",
        "5,00 \U000D7 10^5", "1,00 \U000D7 10^6",
        "1,50 \U000D7 10^6", "2,00 \U000D7 10^6",
        "2,50 \U000D7 10^6", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "5,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        "0,00",
        paste0("5,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        paste0("1,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-2,50 $\\times$ 10\\textsuperscript{6}", "-2,00 $\\times$ 10\\textsuperscript{6}", "-1,50 $\\times$ 10\\textsuperscript{6}",
        "-1,00 $\\times$ 10\\textsuperscript{6}", "-5,00 $\\times$ 10\\textsuperscript{5}", "0,00",
        "5,00 $\\times$ 10\\textsuperscript{5}", "1,00 $\\times$ 10\\textsuperscript{6}", "1,50 $\\times$ 10\\textsuperscript{6}",
        "2,00 $\\times$ 10\\textsuperscript{6}", "2,50 $\\times$ 10\\textsuperscript{6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-2,50 \\'d7 10{\\super 6}", "-2,00 \\'d7 10{\\super 6}", "-1,50 \\'d7 10{\\super 6}",
        "-1,00 \\'d7 10{\\super 6}", "-5,00 \\'d7 10{\\super 5}", "0,00",
        "5,00 \\'d7 10{\\super 5}", "1,00 \\'d7 10{\\super 6}", "1,50 \\'d7 10{\\super 6}",
        "2,00 \\'d7 10{\\super 6}", "2,50 \\'d7 10{\\super 6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-2.50 \U000D7 10^6b", "a-2.00 \U000D7 10^6b",
        "a-1.50 \U000D7 10^6b", "a-1.00 \U000D7 10^6b",
        "a-5.00 \U000D7 10^5b", "a0.00b", "a5.00 \U000D7 10^5b",
        "a1.00 \U000D7 10^6b", "a1.50 \U000D7 10^6b",
        "a2.00 \U000D7 10^6b",
        "a2.50 \U000D7 10^6b", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>b"),
        "a0.00b",
        paste0("a5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>b"),
        paste0("a1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-2.50 $\\times$ 10\\textsuperscript{6}b", "a-2.00 $\\times$ 10\\textsuperscript{6}b",
        "a-1.50 $\\times$ 10\\textsuperscript{6}b", "a-1.00 $\\times$ 10\\textsuperscript{6}b",
        "a-5.00 $\\times$ 10\\textsuperscript{5}b", "a0.00b",
        "a5.00 $\\times$ 10\\textsuperscript{5}b", "a1.00 $\\times$ 10\\textsuperscript{6}b",
        "a1.50 $\\times$ 10\\textsuperscript{6}b", "a2.00 $\\times$ 10\\textsuperscript{6}b",
        "a2.50 $\\times$ 10\\textsuperscript{6}b", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-2.50 \\'d7 10{\\super 6}b", "a-2.00 \\'d7 10{\\super 6}b",
        "a-1.50 \\'d7 10{\\super 6}b", "a-1.00 \\'d7 10{\\super 6}b",
        "a-5.00 \\'d7 10{\\super 5}b", "a0.00b", "a5.00 \\'d7 10{\\super 5}b",
        "a1.00 \\'d7 10{\\super 6}b", "a1.50 \\'d7 10{\\super 6}b",
        "a2.00 \\'d7 10{\\super 6}b",
        "a2.50 \\'d7 10{\\super 6}b", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, force_sign_m = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.50 \U000D7 10^6", "-2.00 \U000D7 10^6",
        "-1.50 \U000D7 10^6", "-1.00 \U000D7 10^6",
        "-5.00 \U000D7 10^5", "0.00",
        "+5.00 \U000D7 10^5", "+1.00 \U000D7 10^6",
        "+1.50 \U000D7 10^6", "+2.00 \U000D7 10^6",
        "+2.50 \U000D7 10^6", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, force_sign_m = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        "0.00",
        paste0("+5.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>5</sup>"),
        paste0("+1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, force_sign_m = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.50 $\\times$ 10\\textsuperscript{6}", "-2.00 $\\times$ 10\\textsuperscript{6}", "-1.50 $\\times$ 10\\textsuperscript{6}",
        "-1.00 $\\times$ 10\\textsuperscript{6}", "-5.00 $\\times$ 10\\textsuperscript{5}", "0.00",
        "+5.00 $\\times$ 10\\textsuperscript{5}", "+1.00 $\\times$ 10\\textsuperscript{6}", "+1.50 $\\times$ 10\\textsuperscript{6}",
        "+2.00 $\\times$ 10\\textsuperscript{6}", "+2.50 $\\times$ 10\\textsuperscript{6}", "NA"
      )
    )

  vec_fmt_scientific(vec_num_4_m, force_sign_m = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-5.00 \\'d7 10{\\super 5}", "0.00",
        "+5.00 \\'d7 10{\\super 5}", "+1.00 \\'d7 10{\\super 6}", "+1.50 \\'d7 10{\\super 6}",
        "+2.00 \\'d7 10{\\super 6}", "+2.50 \\'d7 10{\\super 6}", "NA"
      )
    )
})

test_that("vec_fmt_engineering() works", {

  vec_fmt_engineering(vec_num_1, output = "plain") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-500.00 \U000D7 10^-3",
        "0.00", "500.00 \U000D7 10^-3", "1.00", "1.50", "2.00",
        "2.50", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_1, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50"), paste0("\U02212", "2.00"),
        paste0("\U02212", "1.50"), paste0("\U02212", "1.00"),
        paste0("\U02212", "500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "3</sup>"),
        "0.00",
        paste0("500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "3</sup>"),
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_1, output = "latex") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-500.00 $\\times$ 10\\textsuperscript{-3}",
        "0.00", "500.00 $\\times$ 10\\textsuperscript{-3}", "1.00", "1.50", "2.00",
        "2.50", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_1, output = "rtf") |>
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-500.00 \\'d7 10{\\super -3}",
        "0.00", "500.00 \\'d7 10{\\super -3}", "1.00", "1.50", "2.00",
        "2.50", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, output = "plain") |>
    expect_equal(
      c(
        "-2.50 \U000D7 10^6", "-2.00 \U000D7 10^6",
        "-1.50 \U000D7 10^6", "-1.00 \U000D7 10^6",
        "-500.00 \U000D7 10^3", "0.00",
        "500.00 \U000D7 10^3", "1.00 \U000D7 10^6",
        "1.50 \U000D7 10^6", "2.00 \U000D7 10^6",
        "2.50 \U000D7 10^6", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        "0.00",
        paste0("500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        paste0("1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, output = "latex") |>
    expect_equal(
      c(
        "-2.50 $\\times$ 10\\textsuperscript{6}", "-2.00 $\\times$ 10\\textsuperscript{6}", "-1.50 $\\times$ 10\\textsuperscript{6}",
        "-1.00 $\\times$ 10\\textsuperscript{6}", "-500.00 $\\times$ 10\\textsuperscript{3}", "0.00",
        "500.00 $\\times$ 10\\textsuperscript{3}", "1.00 $\\times$ 10\\textsuperscript{6}", "1.50 $\\times$ 10\\textsuperscript{6}",
        "2.00 $\\times$ 10\\textsuperscript{6}", "2.50 $\\times$ 10\\textsuperscript{6}", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, output = "rtf") |>
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-500.00 \\'d7 10{\\super 3}", "0.00",
        "500.00 \\'d7 10{\\super 3}", "1.00 \\'d7 10{\\super 6}", "1.50 \\'d7 10{\\super 6}",
        "2.00 \\'d7 10{\\super 6}", "2.50 \\'d7 10{\\super 6}", "NA",
        "Inf"
      )
    )

  vec_fmt_engineering(vec_num_5, output = "plain") |>
    expect_equal(
      c(
        "-2.50 \U000D7 10^12", "-2.00 \U000D7 10^12",
        "-1.50 \U000D7 10^12", "-1.00 \U000D7 10^12",
        "-500.00 \U000D7 10^9", "0.00", "500.00 \U000D7 10^9",
        "1.00 \U000D7 10^12", "1.50 \U000D7 10^12",
        "2.00 \U000D7 10^12", "2.50 \U000D7 10^12",
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_5, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("\U02212", "500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>9</sup>"),
        "0.00",
        paste0("500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>9</sup>"),
        paste0("1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        paste0("2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>12</sup>"),
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_5, output = "latex") |>
    expect_equal(
      c(
        "-2.50 $\\times$ 10\\textsuperscript{12}", "-2.00 $\\times$ 10\\textsuperscript{12}",
        "-1.50 $\\times$ 10\\textsuperscript{12}", "-1.00 $\\times$ 10\\textsuperscript{12}",
        "-500.00 $\\times$ 10\\textsuperscript{9}", "0.00",
        "500.00 $\\times$ 10\\textsuperscript{9}", "1.00 $\\times$ 10\\textsuperscript{12}",
        "1.50 $\\times$ 10\\textsuperscript{12}", "2.00 $\\times$ 10\\textsuperscript{12}",
        "2.50 $\\times$ 10\\textsuperscript{12}", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_5, output = "rtf") |>
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 12}", "-2.00 \\'d7 10{\\super 12}",
        "-1.50 \\'d7 10{\\super 12}", "-1.00 \\'d7 10{\\super 12}",
        "-500.00 \\'d7 10{\\super 9}", "0.00", "500.00 \\'d7 10{\\super 9}",
        "1.00 \\'d7 10{\\super 12}", "1.50 \\'d7 10{\\super 12}",
        "2.00 \\'d7 10{\\super 12}", "2.50 \\'d7 10{\\super 12}",
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.5 \U000D7 10^6", "-2 \U000D7 10^6",
        "-1.5 \U000D7 10^6", "-1 \U000D7 10^6",
        "-500 \U000D7 10^3", "0", "500 \U000D7 10^3",
        "1 \U000D7 10^6", "1.5 \U000D7 10^6",
        "2 \U000D7 10^6", "2.5 \U000D7 10^6", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "500&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        "0",
        paste0("500&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        paste0("1&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.5 $\\times$ 10\\textsuperscript{6}", "-2 $\\times$ 10\\textsuperscript{6}", "-1.5 $\\times$ 10\\textsuperscript{6}",
        "-1 $\\times$ 10\\textsuperscript{6}", "-500 $\\times$ 10\\textsuperscript{3}", "0", "500 $\\times$ 10\\textsuperscript{3}",
        "1 $\\times$ 10\\textsuperscript{6}", "1.5 $\\times$ 10\\textsuperscript{6}", "2 $\\times$ 10\\textsuperscript{6}",
        "2.5 $\\times$ 10\\textsuperscript{6}", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.5 \\'d7 10{\\super 6}", "-2 \\'d7 10{\\super 6}", "-1.5 \\'d7 10{\\super 6}",
        "-1 \\'d7 10{\\super 6}", "-500 \\'d7 10{\\super 3}", "0",
        "500 \\'d7 10{\\super 3}", "1 \\'d7 10{\\super 6}", "1.5 \\'d7 10{\\super 6}",
        "2 \\'d7 10{\\super 6}", "2.5 \\'d7 10{\\super 6}", "NA", "Inf"
      )
    )

  vec_fmt_engineering(
    vec_num_4,
    drop_trailing_zeros = TRUE,
    drop_trailing_dec_mark = FALSE,
    output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.5 \U000D7 10^6", "-2. \U000D7 10^6",
        "-1.5 \U000D7 10^6", "-1. \U000D7 10^6",
        "-500. \U000D7 10^3", "0.", "500. \U000D7 10^3",
        "1. \U000D7 10^6", "1.5 \U000D7 10^6",
        "2. \U000D7 10^6", "2.5 \U000D7 10^6", "NA", "Inf."
      )
    )

  vec_fmt_engineering(
    vec_num_4,
    drop_trailing_zeros = TRUE,
    drop_trailing_dec_mark = FALSE,
    output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "500.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        "0.",
        paste0("500.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        paste0("1.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2.5&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA", "Inf."
      )
    )

  vec_fmt_engineering(
    vec_num_4,
    drop_trailing_zeros = TRUE,
    drop_trailing_dec_mark = FALSE,
    output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.5 $\\times$ 10\\textsuperscript{6}", "-2. $\\times$ 10\\textsuperscript{6}", "-1.5 $\\times$ 10\\textsuperscript{6}",
        "-1. $\\times$ 10\\textsuperscript{6}", "-500. $\\times$ 10\\textsuperscript{3}", "0.", "500. $\\times$ 10\\textsuperscript{3}",
        "1. $\\times$ 10\\textsuperscript{6}", "1.5 $\\times$ 10\\textsuperscript{6}", "2. $\\times$ 10\\textsuperscript{6}",
        "2.5 $\\times$ 10\\textsuperscript{6}", "NA", "Inf."
      )
    )

  vec_fmt_engineering(
    vec_num_4,
    drop_trailing_zeros = TRUE,
    drop_trailing_dec_mark = FALSE,
    output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.5 \\'d7 10{\\super 6}", "-2. \\'d7 10{\\super 6}", "-1.5 \\'d7 10{\\super 6}",
        "-1. \\'d7 10{\\super 6}", "-500. \\'d7 10{\\super 3}", "0.",
        "500. \\'d7 10{\\super 3}", "1. \\'d7 10{\\super 6}", "1.5 \\'d7 10{\\super 6}",
        "2. \\'d7 10{\\super 6}", "2.5 \\'d7 10{\\super 6}", "NA", "Inf."
      )
    )

  vec_fmt_engineering(vec_num_4, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-2,50 \U000D7 10^6", "-2,00 \U000D7 10^6",
        "-1,50 \U000D7 10^6", "-1,00 \U000D7 10^6",
        "-500,00 \U000D7 10^3", "0,00",
        "500,00 \U000D7 10^3", "1,00 \U000D7 10^6",
        "1,50 \U000D7 10^6", "2,00 \U000D7 10^6",
        "2,50 \U000D7 10^6", "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "500,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        "0,00",
        paste0("500,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        paste0("1,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("1,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2,00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("2,50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-2,50 $\\times$ 10\\textsuperscript{6}", "-2,00 $\\times$ 10\\textsuperscript{6}",
        "-1,50 $\\times$ 10\\textsuperscript{6}", "-1,00 $\\times$ 10\\textsuperscript{6}",
        "-500,00 $\\times$ 10\\textsuperscript{3}", "0,00", "500,00 $\\times$ 10\\textsuperscript{3}",
        "1,00 $\\times$ 10\\textsuperscript{6}", "1,50 $\\times$ 10\\textsuperscript{6}",
        "2,00 $\\times$ 10\\textsuperscript{6}", "2,50 $\\times$ 10\\textsuperscript{6}",
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-2,50 \\'d7 10{\\super 6}", "-2,00 \\'d7 10{\\super 6}",
        "-1,50 \\'d7 10{\\super 6}", "-1,00 \\'d7 10{\\super 6}",
        "-500,00 \\'d7 10{\\super 3}", "0,00", "500,00 \\'d7 10{\\super 3}",
        "1,00 \\'d7 10{\\super 6}", "1,50 \\'d7 10{\\super 6}",
        "2,00 \\'d7 10{\\super 6}", "2,50 \\'d7 10{\\super 6}",
        "NA", "Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-2.50 \U000D7 10^6b", "a-2.00 \U000D7 10^6b",
        "a-1.50 \U000D7 10^6b", "a-1.00 \U000D7 10^6b",
        "a-500.00 \U000D7 10^3b", "a0.00b", "a500.00 \U000D7 10^3b",
        "a1.00 \U000D7 10^6b", "a1.50 \U000D7 10^6b",
        "a2.00 \U000D7 10^6b", "a2.50 \U000D7 10^6b",
        "NA", "aInfb"
      )
    )

  vec_fmt_engineering(vec_num_4, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a\U02212", "500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>b"),
        "a0.00b",
        paste0("a500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>b"),
        paste0("a1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        paste0("a2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>b"),
        "NA", "aInfb"
      )
    )

  vec_fmt_engineering(vec_num_4, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-2.50 $\\times$ 10\\textsuperscript{6}b", "a-2.00 $\\times$ 10\\textsuperscript{6}b",
        "a-1.50 $\\times$ 10\\textsuperscript{6}b", "a-1.00 $\\times$ 10\\textsuperscript{6}b",
        "a-500.00 $\\times$ 10\\textsuperscript{3}b", "a0.00b",
        "a500.00 $\\times$ 10\\textsuperscript{3}b", "a1.00 $\\times$ 10\\textsuperscript{6}b",
        "a1.50 $\\times$ 10\\textsuperscript{6}b", "a2.00 $\\times$ 10\\textsuperscript{6}b",
        "a2.50 $\\times$ 10\\textsuperscript{6}b", "NA", "aInfb"
      )
    )

  vec_fmt_engineering(vec_num_4, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-2.50 \\'d7 10{\\super 6}b", "a-2.00 \\'d7 10{\\super 6}b",
        "a-1.50 \\'d7 10{\\super 6}b", "a-1.00 \\'d7 10{\\super 6}b",
        "a-500.00 \\'d7 10{\\super 3}b", "a0.00b", "a500.00 \\'d7 10{\\super 3}b",
        "a1.00 \\'d7 10{\\super 6}b", "a1.50 \\'d7 10{\\super 6}b",
        "a2.00 \\'d7 10{\\super 6}b", "a2.50 \\'d7 10{\\super 6}b",
        "NA", "aInfb"
      )
    )

  vec_fmt_engineering(vec_num_4, force_sign_m = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2.50 \U000D7 10^6", "-2.00 \U000D7 10^6",
        "-1.50 \U000D7 10^6", "-1.00 \U000D7 10^6",
        "-500.00 \U000D7 10^3", "0.00",
        "+500.00 \U000D7 10^3", "+1.00 \U000D7 10^6",
        "+1.50 \U000D7 10^6", "+2.00 \U000D7 10^6",
        "+2.50 \U000D7 10^6", "NA", "+Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, force_sign_m = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("\U02212", "500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        "0.00",
        paste0("+500.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
        paste0("+1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+1.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+2.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        paste0("+2.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>6</sup>"),
        "NA", "+Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, force_sign_m = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2.50 $\\times$ 10\\textsuperscript{6}", "-2.00 $\\times$ 10\\textsuperscript{6}",
        "-1.50 $\\times$ 10\\textsuperscript{6}", "-1.00 $\\times$ 10\\textsuperscript{6}",
        "-500.00 $\\times$ 10\\textsuperscript{3}", "0.00", "+500.00 $\\times$ 10\\textsuperscript{3}",
        "+1.00 $\\times$ 10\\textsuperscript{6}", "+1.50 $\\times$ 10\\textsuperscript{6}",
        "+2.00 $\\times$ 10\\textsuperscript{6}", "+2.50 $\\times$ 10\\textsuperscript{6}", "NA", "+Inf"
      )
    )

  vec_fmt_engineering(vec_num_4, force_sign_m = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}",
        "-1.50 \\'d7 10{\\super 6}", "-1.00 \\'d7 10{\\super 6}",
        "-500.00 \\'d7 10{\\super 3}", "0.00",
        "+500.00 \\'d7 10{\\super 3}", "+1.00 \\'d7 10{\\super 6}",
        "+1.50 \\'d7 10{\\super 6}", "+2.00 \\'d7 10{\\super 6}",
        "+2.50 \\'d7 10{\\super 6}", "NA", "+Inf"
      )
    )
})

test_that("vec_fmt_percent() works", {

  vec_fmt_percent(vec_num_1, output = "plain") |>
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "50.00%", "100.00%", "150.00%", "200.00%", "250.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250.00%"), paste0("\U02212", "200.00%"),
        paste0("\U02212", "150.00%"), paste0("\U02212", "100.00%"),
        paste0("\U02212", "50.00%"), "0.00%", "50.00%", "100.00%",
        "150.00%", "200.00%", "250.00%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, output = "latex") |>
    expect_equal(
      c(
        "-250.00\\%", "-200.00\\%", "-150.00\\%", "-100.00\\%",
        "-50.00\\%", "0.00\\%", "50.00\\%", "100.00\\%", "150.00\\%",
        "200.00\\%", "250.00\\%", "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_1, output = "rtf") |>
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "50.00%", "100.00%", "150.00%", "200.00%", "250.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, decimals = 4, output = "plain") |>
    expect_equal(
      c(
        "-250.0000%", "-200.0000%", "-150.0000%", "-100.0000%", "-50.0000%",
        "0.0000%", "50.0000%", "100.0000%", "150.0000%", "200.0000%",
        "250.0000%", "NA", "  Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, decimals = 4, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250.0000%"), paste0("\U02212", "200.0000%"),
        paste0("\U02212", "150.0000%"), paste0("\U02212", "100.0000%"),
        paste0("\U02212", "50.0000%"), "0.0000%", "50.0000%",
        "100.0000%", "150.0000%", "200.0000%", "250.0000%", "NA", "  Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, decimals = 4, output = "latex") |>
    expect_equal(
      c(
        "-250.0000\\%", "-200.0000\\%", "-150.0000\\%", "-100.0000\\%",
        "-50.0000\\%", "0.0000\\%", "50.0000\\%", "100.0000\\%",
        "150.0000\\%", "200.0000\\%", "250.0000\\%", "NA", "  Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_1, decimals = 4, output = "rtf") |>
    expect_equal(
      c(
        "-250.0000%", "-200.0000%", "-150.0000%", "-100.0000%", "-50.0000%",
        "0.0000%", "50.0000%", "100.0000%", "150.0000%", "200.0000%",
        "250.0000%", "NA", "  Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, scale_values = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-2.50%", "-2.00%", "-1.50%", "-1.00%", "-0.50%", "0.00%",
        "0.50%", "1.00%", "1.50%", "2.00%", "2.50%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, scale_values = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50%"), paste0("\U02212", "2.00%"),
        paste0("\U02212", "1.50%"), paste0("\U02212", "1.00%"),
        paste0("\U02212", "0.50%"), "0.00%", "0.50%", "1.00%",
        "1.50%", "2.00%", "2.50%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, scale_values = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-2.50\\%", "-2.00\\%", "-1.50\\%", "-1.00\\%", "-0.50\\%",
        "0.00\\%", "0.50\\%", "1.00\\%", "1.50\\%", "2.00\\%",
        "2.50\\%", "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_1, scale_values = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-2.50%", "-2.00%", "-1.50%", "-1.00%", "-0.50%", "0.00%",
        "0.50%", "1.00%", "1.50%", "2.00%", "2.50%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(
    vec_num_1, scale_values = FALSE,
    drop_trailing_zeros = TRUE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.5%", "-2%", "-1.5%", "-1%", "-0.5%", "0%", "0.5%", "1%",
        "1.5%", "2%", "2.5%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(
    vec_num_1, scale_values = FALSE,
    drop_trailing_zeros = TRUE, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.5%"), paste0("\U02212", "2%"),
        paste0("\U02212", "1.5%"), paste0("\U02212", "1%"),
        paste0("\U02212", "0.5%"),
        "0%", "0.5%", "1%", "1.5%", "2%", "2.5%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(
    vec_num_1, scale_values = FALSE,
    drop_trailing_zeros = TRUE, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.5\\%", "-2\\%", "-1.5\\%", "-1\\%", "-0.5\\%",
        "0\\%", "0.5\\%", "1\\%", "1.5\\%", "2\\%", "2.5\\%",
        "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(
    vec_num_1, scale_values = FALSE,
    drop_trailing_zeros = TRUE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.5%", "-2%", "-1.5%", "-1%", "-0.5%", "0%", "0.5%", "1%",
        "1.5%", "2%", "2.5%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, use_seps = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-250000000.00%", "-200000000.00%", "-150000000.00%", "-100000000.00%",
        "-50000000.00%", "0.00%", "50000000.00%", "100000000.00%", "150000000.00%",
        "200000000.00%", "250000000.00%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, use_seps = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250000000.00%"), paste0("\U02212", "200000000.00%"),
        paste0("\U02212", "150000000.00%"), paste0("\U02212", "100000000.00%"),
        paste0("\U02212", "50000000.00%"), "0.00%", "50000000.00%",
        "100000000.00%", "150000000.00%", "200000000.00%", "250000000.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, use_seps = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-250000000.00\\%", "-200000000.00\\%", "-150000000.00\\%",
        "-100000000.00\\%", "-50000000.00\\%", "0.00\\%", "50000000.00\\%",
        "100000000.00\\%", "150000000.00\\%", "200000000.00\\%",
        "250000000.00\\%", "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_4, use_seps = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-250000000.00%", "-200000000.00%", "-150000000.00%", "-100000000.00%",
        "-50000000.00%", "0.00%", "50000000.00%", "100000000.00%", "150000000.00%",
        "200000000.00%", "250000000.00%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, accounting = TRUE, output = "plain") |>
    expect_equal(
      c(
        "(250,000,000.00%)", "(200,000,000.00%)", "(150,000,000.00%)",
        "(100,000,000.00%)", "(50,000,000.00%)", "0.00%", "50,000,000.00%",
        "100,000,000.00%", "150,000,000.00%", "200,000,000.00%", "250,000,000.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, accounting = TRUE, output = "html") |>
    expect_equal(
      c(
        "(250.00%)", "(200.00%)", "(150.00%)", "(100.00%)", "(50.00%)",
        "0.00%", "50.00%", "100.00%", "150.00%", "200.00%", "250.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, accounting = TRUE, output = "latex") |>
    expect_equal(
      c(
        "(250.00\\%)", "(200.00\\%)", "(150.00\\%)", "(100.00\\%)",
        "(50.00\\%)", "0.00\\%", "50.00\\%", "100.00\\%", "150.00\\%",
        "200.00\\%", "250.00\\%", "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_4, accounting = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "(250,000,000.00%)", "(200,000,000.00%)", "(150,000,000.00%)",
        "(100,000,000.00%)", "(50,000,000.00%)", "0.00%", "50,000,000.00%",
        "100,000,000.00%", "150,000,000.00%", "200,000,000.00%", "250,000,000.00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-250.000.000,00%", "-200.000.000,00%", "-150.000.000,00%",
        "-100.000.000,00%", "-50.000.000,00%", "0,00%", "50.000.000,00%",
        "100.000.000,00%", "150.000.000,00%", "200.000.000,00%",
        "250.000.000,00%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250.000.000,00%"), paste0("\U02212", "200.000.000,00%"),
        paste0("\U02212", "150.000.000,00%"), paste0("\U02212", "100.000.000,00%"),
        paste0("\U02212", "50.000.000,00%"), "0,00%", "50.000.000,00%",
        "100.000.000,00%", "150.000.000,00%", "200.000.000,00%", "250.000.000,00%",
        "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_4, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-250.000.000,00\\%", "-200.000.000,00\\%", "-150.000.000,00\\%",
        "-100.000.000,00\\%", "-50.000.000,00\\%", "0,00\\%", "50.000.000,00\\%",
        "100.000.000,00\\%", "150.000.000,00\\%", "200.000.000,00\\%",
        "250.000.000,00\\%", "NA", "Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_4, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-250.000.000,00%", "-200.000.000,00%", "-150.000.000,00%",
        "-100.000.000,00%", "-50.000.000,00%", "0,00%", "50.000.000,00%",
        "100.000.000,00%", "150.000.000,00%", "200.000.000,00%",
        "250.000.000,00%", "NA", "Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-250.00%b", "a-200.00%b", "a-150.00%b", "a-100.00%b", "a-50.00%b",
        "a0.00%b", "a50.00%b", "a100.00%b", "a150.00%b", "a200.00%b",
        "a250.00%b", "NA", "aInf%b"
      )
    )

  vec_fmt_percent(vec_num_1, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "250.00%b"), paste0("a\U02212", "200.00%b"),
        paste0("a\U02212", "150.00%b"), paste0("a\U02212", "100.00%b"),
        paste0("a\U02212", "50.00%b"), "a0.00%b", "a50.00%b",
        "a100.00%b", "a150.00%b", "a200.00%b", "a250.00%b", "NA", "aInf%b"
      )
    )

  vec_fmt_percent(vec_num_1, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-250.00\\%b", "a-200.00\\%b", "a-150.00\\%b", "a-100.00\\%b",
        "a-50.00\\%b", "a0.00\\%b", "a50.00\\%b", "a100.00\\%b",
        "a150.00\\%b", "a200.00\\%b", "a250.00\\%b", "NA", "aInf\\%b"
      )
    )

  vec_fmt_percent(vec_num_1, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-250.00%b", "a-200.00%b", "a-150.00%b", "a-100.00%b", "a-50.00%b",
        "a0.00%b", "a50.00%b", "a100.00%b", "a150.00%b", "a200.00%b",
        "a250.00%b", "NA", "aInf%b"
      )
    )

  vec_fmt_percent(vec_num_1, force_sign = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "+50.00%", "+100.00%", "+150.00%", "+200.00%", "+250.00%",
        "NA", "+Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, force_sign = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250.00%"), paste0("\U02212", "200.00%"),
        paste0("\U02212", "150.00%"), paste0("\U02212", "100.00%"),
        paste0("\U02212", "50.00%"), "0.00%", "+50.00%", "+100.00%",
        "+150.00%", "+200.00%", "+250.00%", "NA", "+Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, force_sign = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-250.00\\%", "-200.00\\%", "-150.00\\%", "-100.00\\%",
        "-50.00\\%", "0.00\\%", "+50.00\\%", "+100.00\\%", "+150.00\\%",
        "+200.00\\%", "+250.00\\%", "NA", "+Inf\\%"
      )
    )

  vec_fmt_percent(vec_num_1, force_sign = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "+50.00%", "+100.00%", "+150.00%", "+200.00%", "+250.00%",
        "NA", "+Inf%"
      )
    )

  vec_fmt_percent(vec_num_1, placement = "left", output = "plain") |>
    expect_equal(
      c(
        "-%250.00", "-%200.00", "-%150.00", "-%100.00", "-%50.00",
        "%0.00", "%50.00", "%100.00", "%150.00", "%200.00", "%250.00",
        "NA", "%Inf"
      )
    )

  vec_fmt_percent(vec_num_1, placement = "left", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "%250.00"), paste0("\U02212", "%200.00"),
        paste0("\U02212", "%150.00"), paste0("\U02212", "%100.00"),
        paste0("\U02212", "%50.00"), "%0.00", "%50.00", "%100.00", "%150.00", "%200.00",
        "%250.00", "NA", "%Inf"
      )
    )

  vec_fmt_percent(vec_num_1, placement = "left", output = "latex") |>
    expect_equal(
      c(
        "-\\%250.00", "-\\%200.00", "-\\%150.00", "-\\%100.00",
        "-\\%50.00", "\\%0.00", "\\%50.00", "\\%100.00", "\\%150.00",
        "\\%200.00", "\\%250.00", "NA", "\\%Inf"
      )
    )

  vec_fmt_percent(vec_num_1, placement = "left", output = "rtf") |>
    expect_equal(
      c(
        "-%250.00", "-%200.00", "-%150.00", "-%100.00", "-%50.00",
        "%0.00", "%50.00", "%100.00", "%150.00", "%200.00", "%250.00",
        "NA", "%Inf"
      )
    )

  vec_fmt_percent(vec_num_1, incl_space = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-250.00 %", "-200.00 %", "-150.00 %", "-100.00 %", "-50.00 %",
        "0.00 %", "50.00 %", "100.00 %", "150.00 %", "200.00 %", "250.00 %",
        "NA", "Inf %"
      )
    )

  vec_fmt_percent(vec_num_1, incl_space = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250.00 %"), paste0("\U02212", "200.00 %"),
        paste0("\U02212", "150.00 %"), paste0("\U02212", "100.00 %"),
        paste0("\U02212", "50.00 %"), "0.00 %", "50.00 %",
        "100.00 %", "150.00 %", "200.00 %", "250.00 %", "NA", "Inf %"
      )
    )

  vec_fmt_percent(vec_num_1, incl_space = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-250.00 \\%", "-200.00 \\%", "-150.00 \\%", "-100.00 \\%",
        "-50.00 \\%", "0.00 \\%", "50.00 \\%", "100.00 \\%",
        "150.00 \\%", "200.00 \\%", "250.00 \\%", "NA", "Inf \\%"
      )
    )

  vec_fmt_percent(vec_num_1, incl_space = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-250.00 %", "-200.00 %", "-150.00 %", "-100.00 %", "-50.00 %",
        "0.00 %", "50.00 %", "100.00 %", "150.00 %", "200.00 %", "250.00 %",
        "NA", "Inf %"
      )
    )

  vec_fmt_percent(
    vec_num_1, placement = "left", incl_space = TRUE,
    output = "plain"
  ) |>
    expect_equal(
      c(
        "-% 250.00", "-% 200.00", "-% 150.00", "-% 100.00", "-% 50.00",
        "% 0.00", "% 50.00", "% 100.00", "% 150.00", "% 200.00", "% 250.00",
        "NA", "% Inf"
      )
    )

  vec_fmt_percent(
    vec_num_1, placement = "left", incl_space = TRUE,
    output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "% 250.00"), paste0("\U02212", "% 200.00"),
        paste0("\U02212", "% 150.00"), paste0("\U02212", "% 100.00"),
        paste0("\U02212", "% 50.00"), "% 0.00", "% 50.00", "% 100.00",
        "% 150.00", "% 200.00", "% 250.00", "NA", "% Inf"
      )
    )

  vec_fmt_percent(
    vec_num_1, placement = "left", incl_space = TRUE,
    output = "latex"
  ) |>
    expect_equal(
      c(
        "-\\% 250.00", "-\\% 200.00", "-\\% 150.00", "-\\% 100.00",
        "-\\% 50.00", "\\% 0.00", "\\% 50.00", "\\% 100.00",
        "\\% 150.00", "\\% 200.00", "\\% 250.00", "NA", "\\% Inf"
      )
    )

  vec_fmt_percent(
    vec_num_1, placement = "left", incl_space = TRUE,
    output = "rtf"
  ) |>
    expect_equal(
      c(
        "-% 250.00", "-% 200.00", "-% 150.00", "-% 100.00", "-% 50.00",
        "% 0.00", "% 50.00", "% 100.00", "% 150.00", "% 200.00", "% 250.00",
        "NA", "% Inf"
      )
    )
})

test_that("vec_fmt_partsper() works", {

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", decimals = 3, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2,500,000.000 ppm", "-2,000,000.000 ppm", "-1,500,000.000 ppm",
        "-1,000,000.000 ppm", "-500,000.000 ppm", "0.000 ppm",
        "500,000.000 ppm", "1,000,000.000 ppm", "1,500,000.000 ppm",
        "2,000,000.000 ppm", "2,500,000.000 ppm", "NA", " Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", decimals = 3, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2,500,000.000 ppm"),
        paste0("\U02212", "2,000,000.000 ppm"),
        paste0("\U02212", "1,500,000.000 ppm"),
        paste0("\U02212", "1,000,000.000 ppm"),
        paste0("\U02212", "500,000.000 ppm"),
        "0.000 ppm", "500,000.000 ppm", "1,000,000.000 ppm",
        "1,500,000.000 ppm", "2,000,000.000 ppm",
        "2,500,000.000 ppm", "NA", " Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", decimals = 3, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2,500,000.000 ppm", "-2,000,000.000 ppm",
        "-1,500,000.000 ppm", "-1,000,000.000 ppm",
        "-500,000.000 ppm", "0.000 ppm",
        "500,000.000 ppm", "1,000,000.000 ppm",
        "1,500,000.000 ppm", "2,000,000.000 ppm",
        "2,500,000.000 ppm", "NA", " Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", decimals = 3, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2,500,000.000 ppm", "-2,000,000.000 ppm", "-1,500,000.000 ppm",
        "-1,000,000.000 ppm", "-500,000.000 ppm", "0.000 ppm",
        "500,000.000 ppm", "1,000,000.000 ppm", "1,500,000.000 ppm",
        "2,000,000.000 ppm", "2,500,000.000 ppm", "NA", " Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", scale_values = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.50 ppm", "-2.00 ppm", "-1.50 ppm", "-1.00 ppm", "-0.50 ppm",
        "0.00 ppm", "0.50 ppm", "1.00 ppm", "1.50 ppm", "2.00 ppm", "2.50 ppm",
        "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", scale_values = FALSE, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.50 ppm"),
        paste0("\U02212", "2.00 ppm"),
        paste0("\U02212", "1.50 ppm"),
        paste0("\U02212", "1.00 ppm"),
        paste0("\U02212", "0.50 ppm"),
        "0.00 ppm", "0.50 ppm", "1.00 ppm", "1.50 ppm",
        "2.00 ppm", "2.50 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", scale_values = FALSE, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.50 ppm", "-2.00 ppm", "-1.50 ppm",
        "-1.00 ppm", "-0.50 ppm", "0.00 ppm",
        "0.50 ppm", "1.00 ppm", "1.50 ppm",
        "2.00 ppm", "2.50 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", scale_values = FALSE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.50 ppm", "-2.00 ppm", "-1.50 ppm", "-1.00 ppm", "-0.50 ppm",
        "0.00 ppm", "0.50 ppm", "1.00 ppm", "1.50 ppm", "2.00 ppm", "2.50 ppm",
        "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", locale = "de", output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.500.000,00 ppm", "-2.000.000,00 ppm", "-1.500.000,00 ppm",
        "-1.000.000,00 ppm", "-500.000,00 ppm", "0,00 ppm", "500.000,00 ppm",
        "1.000.000,00 ppm", "1.500.000,00 ppm", "2.000.000,00 ppm",
        "2.500.000,00 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", locale = "de", output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.500.000,00 ppm"),
        paste0("\U02212", "2.000.000,00 ppm"),
        paste0("\U02212", "1.500.000,00 ppm"),
        paste0("\U02212", "1.000.000,00 ppm"),
        paste0("\U02212", "500.000,00 ppm"),
        "0,00 ppm", "500.000,00 ppm", "1.000.000,00 ppm", "1.500.000,00 ppm",
        "2.000.000,00 ppm", "2.500.000,00 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", locale = "de", output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.500.000,00 ppm", "-2.000.000,00 ppm",
        "-1.500.000,00 ppm", "-1.000.000,00 ppm",
        "-500.000,00 ppm", "0,00 ppm",
        "500.000,00 ppm", "1.000.000,00 ppm",
        "1.500.000,00 ppm", "2.000.000,00 ppm",
        "2.500.000,00 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(
    vec_num_1, to_units = "ppm", locale = "de", output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.500.000,00 ppm", "-2.000.000,00 ppm", "-1.500.000,00 ppm",
        "-1.000.000,00 ppm", "-500.000,00 ppm", "0,00 ppm", "500.000,00 ppm",
        "1.000.000,00 ppm", "1.500.000,00 ppm", "2.000.000,00 ppm",
        "2.500.000,00 ppm", "NA", "Inf ppm"
      )
    )

  vec_fmt_partsper(vec_num_1, to_units = "ppm", incl_space = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-2,500,000.00ppm", "-2,000,000.00ppm", "-1,500,000.00ppm",
        "-1,000,000.00ppm", "-500,000.00ppm", "0.00ppm", "500,000.00ppm",
        "1,000,000.00ppm", "1,500,000.00ppm", "2,000,000.00ppm", "2,500,000.00ppm",
        "NA", "Infppm"
      )
    )

  vec_fmt_partsper(vec_num_1, to_units = "ppm", incl_space = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2,500,000.00ppm"),
        paste0("\U02212", "2,000,000.00ppm"),
        paste0("\U02212", "1,500,000.00ppm"),
        paste0("\U02212", "1,000,000.00ppm"),
        paste0("\U02212", "500,000.00ppm"),
        "0.00ppm", "500,000.00ppm", "1,000,000.00ppm", "1,500,000.00ppm",
        "2,000,000.00ppm", "2,500,000.00ppm", "NA", "Infppm"
      )
    )

  vec_fmt_partsper(vec_num_1, to_units = "ppm", incl_space = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-2,500,000.00ppm", "-2,000,000.00ppm",
        "-1,500,000.00ppm", "-1,000,000.00ppm", "-500,000.00ppm",
        "0.00ppm", "500,000.00ppm", "1,000,000.00ppm",
        "1,500,000.00ppm", "2,000,000.00ppm", "2,500,000.00ppm",
        "NA", "Infppm"
      )
    )

  vec_fmt_partsper(vec_num_1, to_units = "ppm", incl_space = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-2,500,000.00ppm", "-2,000,000.00ppm", "-1,500,000.00ppm",
        "-1,000,000.00ppm", "-500,000.00ppm", "0.00ppm", "500,000.00ppm",
        "1,000,000.00ppm", "1,500,000.00ppm", "2,000,000.00ppm", "2,500,000.00ppm",
        "NA", "Infppm"
      )
    )
})

test_that("vec_fmt_fraction() works", {

  vec_fmt_fraction(range_0_1, layout = "diagonal", output = "plain") |>
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2",
        "3/5", "3/4", "8/9", "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "diagonal", output = "html") |>
    expect_equal(
      c(
        "0", "0", "0",
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">8</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "diagonal", output = "latex") |>
    expect_equal(
      c(
        "0", "0", "0", "\\textsuperscript{1}\\!/\\textsubscript{9}", "\\textsuperscript{1}\\!/\\textsubscript{4}",
        "\\textsuperscript{2}\\!/\\textsubscript{5}", "\\textsuperscript{1}\\!/\\textsubscript{2}", "\\textsuperscript{3}\\!/\\textsubscript{5}",
        "\\textsuperscript{3}\\!/\\textsubscript{4}", "\\textsuperscript{8}\\!/\\textsubscript{9}", "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "diagonal", output = "rtf") |>
    expect_equal(
      c(
        "0", "0", "0", "{\\super 1}/{\\sub 9}", "{\\super 1}/{\\sub 4}",
        "{\\super 2}/{\\sub 5}", "{\\super 1}/{\\sub 2}", "{\\super 3}/{\\sub 5}",
        "{\\super 3}/{\\sub 4}", "{\\super 8}/{\\sub 9}", "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "diagonal", output = "plain") |>
    expect_equal(
      c(
        "0", "0", "0", "-1/9", "-1/4", "-2/5",
        "-1/2", "-3/5", "-3/4", "-8/9", "-1", "-1", "-1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "diagonal", output = "html") |>
    expect_equal(
      c(
        "0", "0", "0",
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("\U02212", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">8</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("\U02212", "1"),
        paste0("\U02212", "1"),
        paste0("\U02212", "1")
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "diagonal", output = "latex") |>
    expect_equal(
      c(
        "0", "0", "0", "-\\textsuperscript{1}\\!/\\textsubscript{9}", "-\\textsuperscript{1}\\!/\\textsubscript{4}",
        "-\\textsuperscript{2}\\!/\\textsubscript{5}", "-\\textsuperscript{1}\\!/\\textsubscript{2}", "-\\textsuperscript{3}\\!/\\textsubscript{5}",
        "-\\textsuperscript{3}\\!/\\textsubscript{4}", "-\\textsuperscript{8}\\!/\\textsubscript{9}", "-1", "-1",
        "-1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "diagonal", output = "rtf") |>
    expect_equal(
      c(
        "0", "0", "0", "-{\\super 1}/{\\sub 9}", "-{\\super 1}/{\\sub 4}",
        "-{\\super 2}/{\\sub 5}", "-{\\super 1}/{\\sub 2}", "-{\\super 3}/{\\sub 5}",
        "-{\\super 3}/{\\sub 4}", "-{\\super 8}/{\\sub 9}", "-1", "-1",
        "-1"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "diagonal", output = "plain") |>
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5",
        "1 1/2", "1 3/5", "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "diagonal", output = "html") |>
    expect_equal(
      c(
        "1", "1", "1",
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">8</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        "2", "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "diagonal", output = "latex") |>
    expect_equal(
      c(
        "1", "1", "1", "1\\textsuperscript{1}\\!/\\textsubscript{9}", "1\\textsuperscript{1}\\!/\\textsubscript{4}",
        "1\\textsuperscript{2}\\!/\\textsubscript{5}", "1\\textsuperscript{1}\\!/\\textsubscript{2}", "1\\textsuperscript{3}\\!/\\textsubscript{5}",
        "1\\textsuperscript{3}\\!/\\textsubscript{4}", "1\\textsuperscript{8}\\!/\\textsubscript{9}", "2",
        "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "diagonal", output = "rtf") |>
    expect_equal(
      c(
        "1", "1", "1", "1{\\super 1}/{\\sub 9}", "1{\\super 1}/{\\sub 4}",
        "1{\\super 2}/{\\sub 5}", "1{\\super 1}/{\\sub 2}", "1{\\super 3}/{\\sub 5}",
        "1{\\super 3}/{\\sub 4}", "1{\\super 8}/{\\sub 9}", "2", "2",
        "2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "diagonal", output = "plain") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1 1/9", "-1 1/4", "-1 2/5",
        "-1 1/2", "-1 3/5", "-1 3/4", "-1 8/9", "-2", "-2", "-2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "diagonal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "1"),
        paste0("\U02212", "1"),
        paste0("\U02212", "1"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">3</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">4</span>"),
        paste0("\U02212", "1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">8</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"),
        paste0("\U02212", "2"),
        paste0("\U02212", "2"),
        paste0("\U02212", "2")
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "diagonal", output = "latex") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1\\textsuperscript{1}\\!/\\textsubscript{9}", "-1\\textsuperscript{1}\\!/\\textsubscript{4}",
        "-1\\textsuperscript{2}\\!/\\textsubscript{5}", "-1\\textsuperscript{1}\\!/\\textsubscript{2}", "-1\\textsuperscript{3}\\!/\\textsubscript{5}",
        "-1\\textsuperscript{3}\\!/\\textsubscript{4}", "-1\\textsuperscript{8}\\!/\\textsubscript{9}", "-2",
        "-2", "-2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "diagonal", output = "rtf") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1{\\super 1}/{\\sub 9}", "-1{\\super 1}/{\\sub 4}",
        "-1{\\super 2}/{\\sub 5}", "-1{\\super 1}/{\\sub 2}", "-1{\\super 3}/{\\sub 5}",
        "-1{\\super 3}/{\\sub 4}", "-1{\\super 8}/{\\sub 9}", "-2", "-2",
        "-2"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "inline", output = "plain") |>
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5", "3/4", "8/9",
        "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "inline", output = "html") |>
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5", "3/4", "8/9",
        "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "inline", output = "latex") |>
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5",
        "3/4", "8/9", "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1, layout = "inline", output = "rtf") |>
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5", "3/4", "8/9",
        "1", "1", "1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "inline", output = "plain") |>
    expect_equal(
      c(
        "0", "0", "0", "-1/9", "-1/4", "-2/5", "-1/2", "-3/5", "-3/4",
        "-8/9", "-1", "-1", "-1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "inline", output = "html") |>
    expect_equal(
      c(
        "0", "0", "0",
        paste0("\U02212", "1/9"), paste0("\U02212", "1/4"),
        paste0("\U02212", "2/5"), paste0("\U02212", "1/2"),
        paste0("\U02212", "3/5"), paste0("\U02212", "3/4"),
        paste0("\U02212", "8/9"), paste0("\U02212", "1"),
        paste0("\U02212", "1"), paste0("\U02212", "1")
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "inline", output = "latex") |>
    expect_equal(
      c(
        "0", "0", "0", "-1/9", "-1/4", "-2/5", "-1/2",
        "-3/5", "-3/4", "-8/9", "-1", "-1", "-1"
      )
    )

  vec_fmt_fraction(range_0_1_minus, layout = "inline", output = "rtf") |>
    expect_equal(
      c(
        "0", "0", "0", "-1/9", "-1/4", "-2/5", "-1/2", "-3/5", "-3/4",
        "-8/9", "-1", "-1", "-1"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "inline", output = "plain") |>
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "inline", output = "html") |>
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "inline", output = "latex") |>
    expect_equal(
      c(
        "1", "1", "1", "1\\ 1/9", "1\\ 1/4", "1\\ 2/5",
        "1\\ 1/2", "1\\ 3/5", "1\\ 3/4", "1\\ 8/9", "2", "2",
        "2"
      )
    )

  vec_fmt_fraction(range_1_2, layout = "inline", output = "rtf") |>
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "inline", output = "plain") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1 1/9", "-1 1/4", "-1 2/5", "-1 1/2", "-1 3/5",
        "-1 3/4", "-1 8/9", "-2", "-2", "-2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "inline", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "1"), paste0("\U02212", "1"), paste0("\U02212", "1"),
        paste0("\U02212", "1 1/9"), paste0("\U02212", "1 1/4"),
        paste0("\U02212", "1 2/5"), paste0("\U02212", "1 1/2"),
        paste0("\U02212", "1 3/5"), paste0("\U02212", "1 3/4"),
        paste0("\U02212", "1 8/9"), paste0("\U02212", "2"),
        paste0("\U02212", "2"), paste0("\U02212", "2")
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "inline", output = "latex") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1\\ 1/9", "-1\\ 1/4", "-1\\ 2/5",
        "-1\\ 1/2", "-1\\ 3/5", "-1\\ 3/4", "-1\\ 8/9", "-2",
        "-2", "-2"
      )
    )

  vec_fmt_fraction(range_1_2_minus, layout = "inline", output = "rtf") |>
    expect_equal(
      c(
        "-1", "-1", "-1", "-1 1/9", "-1 1/4", "-1 2/5", "-1 1/2", "-1 3/5",
        "-1 3/4", "-1 8/9", "-2", "-2", "-2"
      )
    )

  w_range <- sort(c(range_1_2_minus, range_0_1_minus, range_0_1, range_1_2))

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = "med", output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-1 98/99", "-1 9/10", "-1 3/4", "-1 3/5", "-1 1/2",
        "-1 2/5", "-1 1/4", "-1 1/10", "-1 1/99", "-1", "-1", "-1", "-1",
        "-98/99", "-9/10", "-3/4", "-3/5", "-1/2", "-2/5", "-1/4", "-1/10",
        "-1/99", "0", "0", "0", "0", "1/99", "1/10", "1/4", "2/5", "1/2",
        "3/5", "3/4", "9/10", "98/99", "1", "1", "1", "1", "1 1/99",
        "1 1/10", "1 1/4", "1 2/5", "1 1/2", "1 3/5", "1 3/4", "1 9/10",
        "1 98/99", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = "med", output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-1 98/99", "-1 9/10", "-1 3/4", "-1 3/5", "-1 1/2",
        "-1 2/5", "-1 1/4", "-1 1/10", "-1 1/99", "-1", "-1", "-1", "-1",
        "-98/99", "-9/10", "-3/4", "-3/5", "-1/2", "-2/5", "-1/4", "-1/10",
        "-1/99", "0", "0", "0", "0", "1/99", "1/10", "1/4", "2/5", "1/2",
        "3/5", "3/4", "9/10", "98/99", "1", "1", "1", "1", "1 1/99",
        "1 1/10", "1 1/4", "1 2/5", "1 1/2", "1 3/5", "1 3/4", "1 9/10",
        "1 98/99", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = "high", output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2", "-1 998/999", "-1 99/100", "-1 9/10", "-1 3/4", "-1 3/5",
        "-1 1/2", "-1 2/5", "-1 1/4", "-1 1/10", "-1 1/100", "-1 1/999",
        "-1", "-1", "-998/999", "-99/100", "-9/10", "-3/4", "-3/5", "-1/2",
        "-2/5", "-1/4", "-1/10", "-1/100", "-1/999", "0", "0", "1/999",
        "1/100", "1/10", "1/4", "2/5", "1/2", "3/5", "3/4", "9/10", "99/100",
        "998/999", "1", "1", "1 1/999", "1 1/100", "1 1/10", "1 1/4",
        "1 2/5", "1 1/2", "1 3/5", "1 3/4", "1 9/10", "1 99/100", "1 998/999",
        "2"
      )
    )

  vec_fmt_fraction(
    w_range, accuracy = 1, layout = "inline", output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-2", "-2", "-1", "-1", "-1",
        "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "0",
        "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1",
        "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "2", "2",
        "2", "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 1,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-2", "-2", "-1", "-1", "-1",
        "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "0",
        "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1",
        "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "2", "2",
        "2", "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 2, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-1 1/2", "-1 1/2", "-1 1/2",
        "-1 1/2", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1",
        "-1/2", "-1/2", "-1/2", "-1/2", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/2", "1/2", "1/2", "1/2", "1", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/2", "1 1/2", "1 1/2", "1 1/2", "2",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 2,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-1 1/2", "-1 1/2", "-1 1/2",
        "-1 1/2", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1",
        "-1/2", "-1/2", "-1/2", "-1/2", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/2", "1/2", "1/2", "1/2", "1", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/2", "1 1/2", "1 1/2", "1 1/2", "2",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 3, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-1 2/3", "-1 2/3", "-1 2/3", "-1 1/3",
        "-1 1/3", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-2/3",
        "-2/3", "-2/3", "-1/3", "-1/3", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/3", "1/3", "2/3", "2/3", "2/3", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/3", "1 1/3", "1 2/3", "1 2/3", "1 2/3",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 3,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-1 2/3", "-1 2/3", "-1 2/3", "-1 1/3",
        "-1 1/3", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-2/3",
        "-2/3", "-2/3", "-1/3", "-1/3", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/3", "1/3", "2/3", "2/3", "2/3", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/3", "1 1/3", "1 2/3", "1 2/3", "1 2/3",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 4, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-1 3/4", "-1 1/2", "-1 1/2", "-1 1/2",
        "-1 1/4", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-3/4",
        "-1/2", "-1/2", "-1/2", "-1/4", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/4", "1/2", "1/2", "1/2", "3/4", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/4", "1 1/2", "1 1/2", "1 1/2", "1 3/4",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 4,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-1 3/4", "-1 2/4", "-1 2/4", "-1 2/4",
        "-1 1/4", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-3/4",
        "-2/4", "-2/4", "-2/4", "-1/4", "0", "0", "0", "0", "0", "0",
        "0", "0", "1/4", "2/4", "2/4", "2/4", "3/4", "1", "1", "1", "1",
        "1", "1", "1", "1", "1 1/4", "1 2/4", "1 2/4", "1 2/4", "1 3/4",
        "2", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 10, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1 9/10", "-1 4/5", "-1 3/5", "-1 1/2",
        "-1 2/5", "-1 3/10", "-1 1/10", "-1", "-1", "-1", "-1", "-1",
        "-1", "-9/10", "-4/5", "-3/5", "-1/2", "-2/5", "-3/10", "-1/10",
        "0", "0", "0", "0", "0", "0", "1/10", "3/10", "2/5", "1/2", "3/5",
        "4/5", "9/10", "1", "1", "1", "1", "1", "1", "1 1/10", "1 3/10",
        "1 2/5", "1 1/2", "1 3/5", "1 4/5", "1 9/10", "2", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 10,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-2", "-1 9/10", "-1 8/10", "-1 6/10", "-1 5/10",
        "-1 4/10", "-1 3/10", "-1 1/10", "-1", "-1", "-1", "-1", "-1",
        "-1", "-9/10", "-8/10", "-6/10", "-5/10", "-4/10", "-3/10", "-1/10",
        "0", "0", "0", "0", "0", "0", "1/10", "3/10", "4/10", "5/10",
        "6/10", "8/10", "9/10", "1", "1", "1", "1", "1", "1", "1 1/10",
        "1 3/10", "1 4/10", "1 5/10", "1 6/10", "1 8/10", "1 9/10", "2",
        "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 100, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-1 99/100", "-1 9/10", "-1 3/4", "-1 3/5", "-1 1/2",
        "-1 2/5", "-1 1/4", "-1 1/10", "-1 1/100", "-1", "-1", "-1",
        "-1", "-99/100", "-9/10", "-3/4", "-3/5", "-1/2", "-2/5", "-1/4",
        "-1/10", "-1/100", "0", "0", "0", "0", "1/100", "1/10", "1/4",
        "2/5", "1/2", "3/5", "3/4", "9/10", "99/100", "1", "1", "1",
        "1", "1 1/100", "1 1/10", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 9/10", "1 99/100", "2", "2"
      )
    )

  vec_fmt_fraction(
    w_range, layout = "inline", accuracy = 100,
    simplify = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2", "-2", "-1 99/100", "-1 90/100", "-1 75/100", "-1 60/100",
        "-1 50/100", "-1 40/100", "-1 25/100", "-1 10/100", "-1 1/100",
        "-1", "-1", "-1", "-1", "-99/100", "-90/100", "-75/100", "-60/100",
        "-50/100", "-40/100", "-25/100", "-10/100", "-1/100", "0", "0",
        "0", "0", "1/100", "10/100", "25/100", "40/100", "50/100", "60/100",
        "75/100", "90/100", "99/100", "1", "1", "1", "1", "1 1/100",
        "1 10/100", "1 25/100", "1 40/100", "1 50/100", "1 60/100", "1 75/100",
        "1 90/100", "1 99/100", "2", "2"
      )
    )

  vec_fmt_fraction(c(5000.3, 10000.8), layout = "diagonal", output = "plain") |>
    expect_equal(c("5,000 2/7", "10,000 4/5"))

  vec_fmt_fraction(c(5000.3, 10000.8), layout = "diagonal", output = "html") |>
    expect_equal(
      c(
        paste0("5,000",  "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">7</span>"),
        paste0("10,000", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">4</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>")
      )
    )

  vec_fmt_fraction(c(5000.3, 10000.8), layout = "diagonal", output = "latex") |>
    expect_equal(c("5,000\\textsuperscript{2}\\!/\\textsubscript{7}", "10,000\\textsuperscript{4}\\!/\\textsubscript{5}"))

  vec_fmt_fraction(c(5000.3, 10000.8), layout = "diagonal", output = "rtf") |>
    expect_equal(c("5,000{\\super 2}/{\\sub 7}", "10,000{\\super 4}/{\\sub 5}"))

  # TODO: With `use_seps = FALSE` we get the following warning that requires
  # a fix in `fmt_fraction()`:
  # In prettyNum(r, big.mark = big.mark, big.interval = big.interval,  :
  #                'big.mark' and 'decimal.mark' are both '', which could be confusing
  # vec_fmt_fraction(c(5000.3, 10000.8), use_seps = FALSE) |>
  #   expect_equal(
  #     c(
  #     )
  #   )
  #
  # vec_fmt_fraction(c(5000.3, 10000.8), use_seps = FALSE, output = "latex") |>
  #   expect_equal(c())
  #
  # vec_fmt_fraction(c(5000.3, 10000.8), use_seps = FALSE, output = "rtf") |>
  #   expect_equal(c())

  vec_fmt_fraction(
    c(5000.3, 10000.8), layout = "diagonal",
    sep_mark = ".", output = "plain"
  ) |>
    expect_equal(c("5.000 2/7", "10.000 4/5"))

  vec_fmt_fraction(
    c(5000.3, 10000.8), layout = "diagonal",
    sep_mark = ".", output = "html"
  ) |>
    expect_equal(
      c(
        paste0("5.000",  "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">7</span>"),
        paste0("10.000", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">4</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">5</span>")
      )
    )

  vec_fmt_fraction(
    c(5000.3, 10000.8), layout = "diagonal",
    sep_mark = ".", output = "latex"
  ) |>
    expect_equal(c("5.000\\textsuperscript{2}\\!/\\textsubscript{7}", "10.000\\textsuperscript{4}\\!/\\textsubscript{5}"))

  vec_fmt_fraction(
    c(5000.3, 10000.8), layout = "diagonal",
    sep_mark = ".", output = "rtf"
  ) |>
    expect_equal(c("5.000{\\super 2}/{\\sub 7}", "10.000{\\super 4}/{\\sub 5}"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "diagonal",
    pattern = "a{x}b", output = "plain"
  ) |>
    expect_equal(c("a1/2b", "a1 1/2b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "diagonal",
    pattern = "a{x}b", output = "html"
  ) |>
    expect_equal(
      c(
        paste0("a",             "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>b"),
        paste0("a1", "\U0202F", "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">", "\U02044", "</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">2</span>b")
      )
    )

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "diagonal",
    pattern = "a{x}b", output = "latex"
  ) |>
    expect_equal(c("a\\textsuperscript{1}\\!/\\textsubscript{2}b", "a1\\textsuperscript{1}\\!/\\textsubscript{2}b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "diagonal",
    pattern = "a{x}b", output = "rtf"
  ) |>
    expect_equal(c("a{\\super 1}/{\\sub 2}b", "a1{\\super 1}/{\\sub 2}b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "inline",
    pattern = "a{x}b", output = "plain"
  ) |>
    expect_equal(c("a1/2b", "a1 1/2b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "inline",
    pattern = "a{x}b", output = "html"
  ) |>
    expect_equal(c("a1/2b", "a1 1/2b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "inline",
    pattern = "a{x}b", output = "latex"
  ) |>
    expect_equal(c("a1/2b", "a1\\ 1/2b"))

  vec_fmt_fraction(
    c(0.5, 1.5), layout = "inline",
    pattern = "a{x}b", output = "rtf"
  ) |>
    expect_equal(c("a1/2b", "a1 1/2b"))

  vec_fmt_fraction(exact_numbers, layout = "diagonal", output = "plain") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "diagonal", output = "html") |>
    expect_equal(c(paste0("\U02212", "1"), "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "diagonal", output = "latex") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "diagonal", output = "rtf") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "inline", output = "plain") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "inline", output = "html") |>
    expect_equal(c(paste0("\U02212", "1"), "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "inline", output = "latex") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(exact_numbers, layout = "inline", output = "rtf") |>
    expect_equal(c("-1", "0", "1"))

  vec_fmt_fraction(not_numbers, layout = "diagonal", output = "plain") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "diagonal", output = "html") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "diagonal", output = "latex") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "diagonal", output = "rtf") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "inline", output = "plain") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "inline", output = "html") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "inline", output = "latex") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  vec_fmt_fraction(not_numbers, layout = "inline", output = "rtf") |>
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  expect_error(vec_fmt_fraction(c(1, 2, 3), accuracy = 0))
  expect_error(vec_fmt_fraction(c(1, 2, 3), accuracy = -1))
})

test_that("vec_fmt_currency() works", {

  vec_fmt_currency(vec_num_1, output = "plain") |>
    expect_equal(
      c(
        "-$2.50", "-$2.00", "-$1.50", "-$1.00", "-$0.50", "$0.00",
        "$0.50", "$1.00", "$1.50", "$2.00", "$2.50", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2.50"), paste0("\U02212", "$2.00"),
        paste0("\U02212", "$1.50"), paste0("\U02212", "$1.00"),
        paste0("\U02212", "$0.50"), "$0.00", "$0.50", "$1.00",
        "$1.50", "$2.00", "$2.50", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, output = "latex") |>
    expect_equal(
      c(
        "-\\$2.50", "-\\$2.00", "-\\$1.50",
        "-\\$1.00", "-\\$0.50", "\\$0.00",
        "\\$0.50", "\\$1.00", "\\$1.50",
        "\\$2.00", "\\$2.50", "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, output = "rtf") |>
    expect_equal(
      c(
        "-$2.50", "-$2.00", "-$1.50", "-$1.00", "-$0.50", "$0.00",
        "$0.50", "$1.00", "$1.50", "$2.00", "$2.50", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, use_subunits = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-$2", "-$2", "-$2", "-$1", "-$0", "$0", "$0", "$1", "$2",
        "$2", "$2", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, use_subunits = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2"), paste0("\U02212", "$2"),
        paste0("\U02212", "$2"), paste0("\U02212", "$1"),
        paste0("\U02212", "$0"),
        "$0", "$0", "$1", "$2", "$2", "$2", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, use_subunits = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-\\$2", "-\\$2", "-\\$2", "-\\$1",
        "-\\$0", "\\$0", "\\$0", "\\$1",
        "\\$2", "\\$2", "\\$2", "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, use_subunits = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-$2", "-$2", "-$2", "-$1", "-$0", "$0", "$0", "$1", "$2",
        "$2", "$2", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_6, decimals = 4, output = "plain") |>
    expect_equal(
      c(
        "$0.0000", "$0.1000", "$0.2000", "$0.3000", "$0.4000", "$0.5000",
        "$0.6000", "$0.7000", "$0.8000", "$0.9000", "$1.0000", "$1.1000",
        "$1.2000", "$1.3000", "$1.4000", "$1.5000", "$1.6000", "$1.7000",
        "$1.8000", "$1.9000", "$2.0000"
      )
    )

  vec_fmt_currency(vec_num_6, decimals = 4, output = "html") |>
    expect_equal(
      c(
        "$0.0000", "$0.1000", "$0.2000", "$0.3000", "$0.4000", "$0.5000",
        "$0.6000", "$0.7000", "$0.8000", "$0.9000", "$1.0000", "$1.1000",
        "$1.2000", "$1.3000", "$1.4000", "$1.5000", "$1.6000", "$1.7000",
        "$1.8000", "$1.9000", "$2.0000"
      )
    )

  vec_fmt_currency(vec_num_6, decimals = 4, output = "latex") |>
    expect_equal(
      c(
        "\\$0.0000", "\\$0.1000", "\\$0.2000",
        "\\$0.3000", "\\$0.4000", "\\$0.5000",
        "\\$0.6000", "\\$0.7000", "\\$0.8000",
        "\\$0.9000", "\\$1.0000", "\\$1.1000",
        "\\$1.2000", "\\$1.3000", "\\$1.4000",
        "\\$1.5000", "\\$1.6000", "\\$1.7000",
        "\\$1.8000", "\\$1.9000", "\\$2.0000"
      )
    )

  vec_fmt_currency(vec_num_6, decimals = 4, output = "rtf") |>
    expect_equal(
      c(
        "$0.0000", "$0.1000", "$0.2000", "$0.3000", "$0.4000", "$0.5000",
        "$0.6000", "$0.7000", "$0.8000", "$0.9000", "$1.0000", "$1.1000",
        "$1.2000", "$1.3000", "$1.4000", "$1.5000", "$1.6000", "$1.7000",
        "$1.8000", "$1.9000", "$2.0000"
      )
    )

  # Expect that using `decimals = 0` is equivalent to `use_subunits = FALSE`
  expect_equal(
    vec_fmt_currency(seq(-5, 5, 0.1), decimals = 0, output = "html"),
    vec_fmt_currency(seq(-5, 5, 0.1), use_subunits = FALSE, output = "html")
  )

  vec_fmt_currency(
    vec_num_6, decimals = 0, drop_trailing_dec_mark = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "$0.", "$0.", "$0.", "$0.", "$0.", "$0.", "$1.", "$1.", "$1.",
        "$1.", "$1.", "$1.", "$1.", "$1.", "$1.", "$2.", "$2.", "$2.",
        "$2.", "$2.", "$2."
      )
    )

  vec_fmt_currency(
    vec_num_6, decimals = 0, drop_trailing_dec_mark = FALSE, output = "html"
  ) |>
    expect_equal(
      c(
        "$0.", "$0.", "$0.", "$0.", "$0.", "$0.", "$1.", "$1.", "$1.",
        "$1.", "$1.", "$1.", "$1.", "$1.", "$1.", "$2.", "$2.", "$2.",
        "$2.", "$2.", "$2."
      )
    )

  vec_fmt_currency(
    vec_num_6, decimals = 0, drop_trailing_dec_mark = FALSE, output = "latex"
  ) |>
    expect_equal(
      c(
        "\\$0.", "\\$0.", "\\$0.", "\\$0.",
        "\\$0.", "\\$0.", "\\$1.", "\\$1.",
        "\\$1.", "\\$1.", "\\$1.", "\\$1.",
        "\\$1.", "\\$1.", "\\$1.", "\\$2.",
        "\\$2.", "\\$2.", "\\$2.", "\\$2.",
        "\\$2."
      )
    )

  vec_fmt_currency(
    vec_num_6, decimals = 0, drop_trailing_dec_mark = FALSE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "$0.", "$0.", "$0.", "$0.", "$0.", "$0.", "$1.", "$1.", "$1.",
        "$1.", "$1.", "$1.", "$1.", "$1.", "$1.", "$2.", "$2.", "$2.",
        "$2.", "$2.", "$2."
      )
    )

  vec_fmt_currency(vec_num_4, use_seps = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-$2500000.00", "-$2000000.00", "-$1500000.00", "-$1000000.00",
        "-$500000.00", "$0.00", "$500000.00", "$1000000.00", "$1500000.00",
        "$2000000.00", "$2500000.00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, use_seps = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2500000.00"), paste0("\U02212", "$2000000.00"),
        paste0("\U02212", "$1500000.00"), paste0("\U02212", "$1000000.00"),
        paste0("\U02212", "$500000.00"), "$0.00", "$500000.00",
        "$1000000.00", "$1500000.00", "$2000000.00", "$2500000.00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, use_seps = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-\\$2500000.00", "-\\$2000000.00", "-\\$1500000.00",
        "-\\$1000000.00", "-\\$500000.00", "\\$0.00",
        "\\$500000.00", "\\$1000000.00", "\\$1500000.00",
        "\\$2000000.00", "\\$2500000.00", "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, use_seps = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-$2500000.00", "-$2000000.00", "-$1500000.00", "-$1000000.00",
        "-$500000.00", "$0.00", "$500000.00", "$1000000.00", "$1500000.00",
        "$2000000.00", "$2500000.00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, accounting = TRUE, output = "plain") |>
    expect_equal(
      c(
        "($2.50)", "($2.00)", "($1.50)", "($1.00)", "($0.50)", "$0.00",
        "$0.50", "$1.00", "$1.50", "$2.00", "$2.50", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, accounting = TRUE, output = "html") |>
    expect_equal(
      c(
        "($2.50)", "($2.00)", "($1.50)", "($1.00)", "($0.50)", "$0.00",
        "$0.50", "$1.00", "$1.50", "$2.00", "$2.50", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, accounting = TRUE, output = "latex") |>
    expect_equal(
      c(
        "(\\$2.50)", "(\\$2.00)", "(\\$1.50)",
        "(\\$1.00)", "(\\$0.50)", "\\$0.00",
        "\\$0.50", "\\$1.00", "\\$1.50",
        "\\$2.00", "\\$2.50", "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, accounting = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "($2,500,000.00)", "($2,000,000.00)", "($1,500,000.00)", "($1,000,000.00)",
        "($500,000.00)", "$0.00", "$500,000.00", "$1,000,000.00", "$1,500,000.00",
        "$2,000,000.00", "$2,500,000.00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, scale_by = 2.5, output = "plain") |>
    expect_equal(
      c(
        "-$6.25", "-$5.00", "-$3.75", "-$2.50", "-$1.25", "$0.00",
        "$1.25", "$2.50", "$3.75", "$5.00", "$6.25", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, scale_by = 2.5, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$6.25"), paste0("\U02212", "$5.00"),
        paste0("\U02212", "$3.75"), paste0("\U02212", "$2.50"),
        paste0("\U02212", "$1.25"), "$0.00", "$1.25", "$2.50",
        "$3.75", "$5.00", "$6.25", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, scale_by = 2.5, output = "latex") |>
    expect_equal(
      c(
        "-\\$6.25", "-\\$5.00", "-\\$3.75",
        "-\\$2.50", "-\\$1.25", "\\$0.00",
        "\\$1.25", "\\$2.50", "\\$3.75",
        "\\$5.00", "\\$6.25", "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, scale_by = 2.5, output = "rtf") |>
    expect_equal(
      c(
        "-$6.25", "-$5.00", "-$3.75", "-$2.50", "-$1.25", "$0.00",
        "$1.25", "$2.50", "$3.75", "$5.00", "$6.25", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-EUR2.500.000,00", "-EUR2.000.000,00", "-EUR1.500.000,00",
        "-EUR1.000.000,00", "-EUR500.000,00", "EUR0,00", "EUR500.000,00",
        "EUR1.000.000,00", "EUR1.500.000,00", "EUR2.000.000,00",
        "EUR2.500.000,00", "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_4, locale = "de", output = "html") |>
    expect_equal(
      c(
        "−&#8364;2.500.000,00", "−&#8364;2.000.000,00", "−&#8364;1.500.000,00",
        "−&#8364;1.000.000,00", "−&#8364;500.000,00", "&#8364;0,00",
        "&#8364;500.000,00", "&#8364;1.000.000,00", "&#8364;1.500.000,00",
        "&#8364;2.000.000,00", "&#8364;2.500.000,00", "NA", "&#8364;Inf"
      )
    )

  vec_fmt_currency(vec_num_4, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-EUR2.500.000,00", "-EUR2.000.000,00",
        "-EUR1.500.000,00", "-EUR1.000.000,00", "-EUR500.000,00",
        "EUR0,00", "EUR500.000,00", "EUR1.000.000,00",
        "EUR1.500.000,00", "EUR2.000.000,00", "EUR2.500.000,00",
        "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_4, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-EUR2.500.000,00", "-EUR2.000.000,00", "-EUR1.500.000,00",
        "-EUR1.000.000,00", "-EUR500.000,00", "EUR0,00", "EUR500.000,00",
        "EUR1.000.000,00", "EUR1.500.000,00", "EUR2.000.000,00", "EUR2.500.000,00",
        "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_4, suffixing = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-$2.50M", "-$2.00M", "-$1.50M", "-$1.00M", "-$500.00K", "$0.00",
        "$500.00K", "$1.00M", "$1.50M", "$2.00M", "$2.50M", "NA", "$InfT"
      )
    )

  vec_fmt_currency(vec_num_4, suffixing = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2.50M"), paste0("\U02212", "$2.00M"),
        paste0("\U02212", "$1.50M"), paste0("\U02212", "$1.00M"),
        paste0("\U02212", "$500.00K"), "$0.00", "$500.00K", "$1.00M",
        "$1.50M", "$2.00M", "$2.50M", "NA", "$InfT"
      )
    )

  vec_fmt_currency(vec_num_4, suffixing = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-\\$2.50M", "-\\$2.00M", "-\\$1.50M",
        "-\\$1.00M", "-\\$500.00K", "\\$0.00",
        "\\$500.00K", "\\$1.00M", "\\$1.50M",
        "\\$2.00M", "\\$2.50M", "NA", "\\$InfT"
      )
    )

  vec_fmt_currency(vec_num_4, suffixing = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-$2.50M", "-$2.00M", "-$1.50M", "-$1.00M", "-$500.00K", "$0.00",
        "$500.00K", "$1.00M", "$1.50M", "$2.00M", "$2.50M", "NA", "$InfT"
      )
    )

  vec_fmt_currency(vec_num_1, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-$2.50b", "a-$2.00b", "a-$1.50b", "a-$1.00b", "a-$0.50b",
        "a$0.00b", "a$0.50b", "a$1.00b", "a$1.50b", "a$2.00b", "a$2.50b",
        "NA", "a$Infb"
      )
    )

  vec_fmt_currency(vec_num_1, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "$2.50b"), paste0("a\U02212", "$2.00b"),
        paste0("a\U02212", "$1.50b"), paste0("a\U02212", "$1.00b"),
        paste0("a\U02212", "$0.50b"), "a$0.00b", "a$0.50b", "a$1.00b",
        "a$1.50b", "a$2.00b", "a$2.50b", "NA", "a$Infb"
      )
    )

  vec_fmt_currency(vec_num_1, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-\\$2.50b", "a-\\$2.00b", "a-\\$1.50b",
        "a-\\$1.00b", "a-\\$0.50b", "a\\$0.00b",
        "a\\$0.50b", "a\\$1.00b", "a\\$1.50b",
        "a\\$2.00b", "a\\$2.50b", "NA", "a\\$Infb"
      )
    )

  vec_fmt_currency(vec_num_1, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-$2.50b", "a-$2.00b", "a-$1.50b", "a-$1.00b", "a-$0.50b",
        "a$0.00b", "a$0.50b", "a$1.00b", "a$1.50b", "a$2.00b", "a$2.50b",
        "NA", "a$Infb"
      )
    )

  vec_fmt_currency(vec_num_4, sep_mark = " ", dec_mark = ",", output = "plain") |>
    expect_equal(
      c(
        "-$2 500 000,00", "-$2 000 000,00", "-$1 500 000,00", "-$1 000 000,00",
        "-$500 000,00", "$0,00", "$500 000,00", "$1 000 000,00", "$1 500 000,00",
        "$2 000 000,00", "$2 500 000,00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, sep_mark = " ", dec_mark = ",", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2 500 000,00"), paste0("\U02212", "$2 000 000,00"),
        paste0("\U02212", "$1 500 000,00"), paste0("\U02212", "$1 000 000,00"),
        paste0("\U02212", "$500 000,00"), "$0,00", "$500 000,00",
        "$1 000 000,00", "$1 500 000,00", "$2 000 000,00", "$2 500 000,00",
        "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, sep_mark = " ", dec_mark = ",", output = "latex") |>
    expect_equal(
      c(
        "-\\$2 500 000,00", "-\\$2 000 000,00",
        "-\\$1 500 000,00", "-\\$1 000 000,00", "-\\$500 000,00",
        "\\$0,00", "\\$500 000,00", "\\$1 000 000,00",
        "\\$1 500 000,00", "\\$2 000 000,00", "\\$2 500 000,00",
        "NA", "\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_4, sep_mark = " ", dec_mark = ",", output = "rtf") |>
    expect_equal(
      c(
        "-$2 500 000,00", "-$2 000 000,00", "-$1 500 000,00", "-$1 000 000,00",
        "-$500 000,00", "$0,00", "$500 000,00", "$1 000 000,00", "$1 500 000,00",
        "$2 000 000,00", "$2 500 000,00", "NA", "$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, force_sign = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-$2.50", "-$2.00", "-$1.50", "-$1.00", "-$0.50", "$0.00",
        "+$0.50", "+$1.00", "+$1.50", "+$2.00", "+$2.50", "NA", "+$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, force_sign = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$2.50"), paste0("\U02212", "$2.00"),
        paste0("\U02212", "$1.50"), paste0("\U02212", "$1.00"),
        paste0("\U02212", "$0.50"), "$0.00", "+$0.50", "+$1.00",
        "+$1.50", "+$2.00", "+$2.50", "NA", "+$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, force_sign = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-\\$2.50", "-\\$2.00", "-\\$1.50",
        "-\\$1.00", "-\\$0.50", "\\$0.00",
        "+\\$0.50", "+\\$1.00", "+\\$1.50",
        "+\\$2.00", "+\\$2.50", "NA", "+\\$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, force_sign = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-$2.50", "-$2.00", "-$1.50", "-$1.00", "-$0.50", "$0.00",
        "+$0.50", "+$1.00", "+$1.50", "+$2.00", "+$2.50", "NA", "+$Inf"
      )
    )

  vec_fmt_currency(vec_num_1, incl_space = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-$ 2.50", "-$ 2.00", "-$ 1.50", "-$ 1.00", "-$ 0.50", "$ 0.00",
        "$ 0.50", "$ 1.00", "$ 1.50", "$ 2.00", "$ 2.50", "NA", "$ Inf"
      )
    )

  vec_fmt_currency(vec_num_1, incl_space = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "$ 2.50"), paste0("\U02212", "$ 2.00"),
        paste0("\U02212", "$ 1.50"), paste0("\U02212", "$ 1.00"),
        paste0("\U02212", "$ 0.50"), "$ 0.00", "$ 0.50", "$ 1.00",
        "$ 1.50", "$ 2.00", "$ 2.50", "NA", "$ Inf"
      )
    )

  vec_fmt_currency(vec_num_1, incl_space = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-\\$ 2.50", "-\\$ 2.00", "-\\$ 1.50",
        "-\\$ 1.00", "-\\$ 0.50", "\\$ 0.00",
        "\\$ 0.50", "\\$ 1.00", "\\$ 1.50",
        "\\$ 2.00", "\\$ 2.50", "NA", "\\$ Inf"
      )
    )

  vec_fmt_currency(vec_num_1, incl_space = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-$ 2.50", "-$ 2.00", "-$ 1.50", "-$ 1.00", "-$ 0.50", "$ 0.00",
        "$ 0.50", "$ 1.00", "$ 1.50", "$ 2.00", "$ 2.50", "NA", "$ Inf"
      )
    )

  vec_fmt_currency(vec_num_1, placement = "right", output = "plain") |>
    expect_equal(
      c(
        "-2.50$", "-2.00$", "-1.50$", "-1.00$", "-0.50$", "0.00$",
        "0.50$", "1.00$", "1.50$", "2.00$", "2.50$", "NA", "Inf$"
      )
    )

  vec_fmt_currency(vec_num_1, placement = "right", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50$"), paste0("\U02212", "2.00$"),
        paste0("\U02212", "1.50$"), paste0("\U02212", "1.00$"),
        paste0("\U02212", "0.50$"), "0.00$", "0.50$", "1.00$",
        "1.50$", "2.00$", "2.50$", "NA", "Inf$"
      )
    )

  vec_fmt_currency(vec_num_1, placement = "right", output = "latex") |>
    expect_equal(
      c(
        "-2.50\\$", "-2.00\\$", "-1.50\\$",
        "-1.00\\$", "-0.50\\$", "0.00\\$",
        "0.50\\$", "1.00\\$", "1.50\\$",
        "2.00\\$", "2.50\\$", "NA", "Inf\\$"
      )
    )

  vec_fmt_currency(vec_num_1, placement = "right", output = "rtf") |>
    expect_equal(
      c(
        "-2.50$", "-2.00$", "-1.50$", "-1.00$", "-0.50$", "0.00$",
        "0.50$", "1.00$", "1.50$", "2.00$", "2.50$", "NA", "Inf$"
      )
    )

  vec_fmt_currency(
    vec_num_1, incl_space = TRUE, placement = "right", output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.50 $", "-2.00 $", "-1.50 $", "-1.00 $", "-0.50 $", "0.00 $",
        "0.50 $", "1.00 $", "1.50 $", "2.00 $", "2.50 $", "NA", "Inf $"
      )
    )

  vec_fmt_currency(
    vec_num_1, incl_space = TRUE, placement = "right", output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.50 $"), paste0("\U02212", "2.00 $"),
        paste0("\U02212", "1.50 $"), paste0("\U02212", "1.00 $"),
        paste0("\U02212", "0.50 $"), "0.00 $", "0.50 $", "1.00 $",
        "1.50 $", "2.00 $", "2.50 $", "NA", "Inf $"
      )
    )

  vec_fmt_currency(
    vec_num_1, incl_space = TRUE, placement = "right", output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.50 \\$", "-2.00 \\$", "-1.50 \\$",
        "-1.00 \\$", "-0.50 \\$", "0.00 \\$",
        "0.50 \\$", "1.00 \\$", "1.50 \\$",
        "2.00 \\$", "2.50 \\$", "NA", "Inf \\$"
      )
    )

  vec_fmt_currency(
    vec_num_1, incl_space = TRUE, placement = "right", output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.50 $", "-2.00 $", "-1.50 $", "-1.00 $", "-0.50 $", "0.00 $",
        "0.50 $", "1.00 $", "1.50 $", "2.00 $", "2.50 $", "NA", "Inf $"
      )
    )

  vec_fmt_currency(vec_num_1, currency = "EUR", output = "plain") |>
    expect_equal(
      c(
        "-EUR2.50", "-EUR2.00", "-EUR1.50", "-EUR1.00", "-EUR0.50",
        "EUR0.00", "EUR0.50", "EUR1.00", "EUR1.50", "EUR2.00", "EUR2.50",
        "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_1, currency = "EUR", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "&#8364;2.50"), paste0("\U02212", "&#8364;2.00"),
        paste0("\U02212", "&#8364;1.50"), paste0("\U02212", "&#8364;1.00"),
        paste0("\U02212", "&#8364;0.50"), "&#8364;0.00", "&#8364;0.50",
        "&#8364;1.00", "&#8364;1.50", "&#8364;2.00", "&#8364;2.50", "NA",
        "&#8364;Inf"
      )
    )

  vec_fmt_currency(vec_num_1, currency = "EUR", output = "latex") |>
    expect_equal(
      c(
        "-EUR2.50", "-EUR2.00", "-EUR1.50",
        "-EUR1.00", "-EUR0.50", "EUR0.00",
        "EUR0.50", "EUR1.00", "EUR1.50",
        "EUR2.00", "EUR2.50", "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_1, currency = "EUR", output = "rtf") |>
    expect_equal(
      c(
        "-EUR2.50", "-EUR2.00", "-EUR1.50", "-EUR1.00", "-EUR0.50",
        "EUR0.00", "EUR0.50", "EUR1.00", "EUR1.50", "EUR2.00", "EUR2.50",
        "NA", "EURInf"
      )
    )

  vec_fmt_currency(vec_num_1, currency = "yen", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "&#165;2.50"), paste0("\U02212", "&#165;2.00"),
        paste0("\U02212", "&#165;1.50"), paste0("\U02212", "&#165;1.00"),
        paste0("\U02212", "&#165;0.50"), "&#165;0.00", "&#165;0.50",
        "&#165;1.00", "&#165;1.50", "&#165;2.00", "&#165;2.50", "NA",
        "&#165;Inf"
      )
    )

  expect_error(vec_fmt_currency(c(1, 2), currency = "NOTREAL"))
})

test_that("vec_fmt_roman() works", {

  vec_roman <- c(1, 4, 5, 8, 12, 20, 0, -5, 1.3, NA, 3799, 3800, 1e6)

  vec_fmt_roman(vec_roman, output = "plain") |>
    expect_equal(
      c(
        "I", "IV", "V", "VIII", "XII", "XX", "N", "V", "I", "NA", "MMMDCCXCIX",
        "MMMDCCC", "ex terminis"
      )
    )

  expect_equal(
    vec_fmt_roman(vec_roman, output = "plain"),
    vec_fmt_roman(vec_roman, output = "html")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, output = "plain"),
    vec_fmt_roman(vec_roman, output = "latex")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, output = "plain"),
    vec_fmt_roman(vec_roman, output = "rtf")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, output = "plain"),
    vec_fmt_roman(vec_roman, output = "word")
  )

  vec_fmt_roman(vec_roman, case = "lower", output = "plain") |>
    expect_equal(
      c(
        "i", "iv", "v", "viii", "xii", "xx", "n", "v", "i", "NA", "mmmdccxcix",
        "mmmdccc", "ex terminis"
      )
    )

  expect_equal(
    vec_fmt_roman(vec_roman, case = "lower", output = "plain"),
    vec_fmt_roman(vec_roman, case = "lower", output = "html")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, case = "lower", output = "plain"),
    vec_fmt_roman(vec_roman, case = "lower", output = "latex")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, case = "lower", output = "plain"),
    vec_fmt_roman(vec_roman, case = "lower", output = "rtf")
  )
  expect_equal(
    vec_fmt_roman(vec_roman, case = "lower", output = "plain"),
    vec_fmt_roman(vec_roman, case = "lower", output = "word")
  )

  expect_error(vec_fmt_roman(c(1, 2), case = "middle"))
})

test_that("vec_fmt_index() works", {

  vec_index <- c(1, 4, 5, 8, 12, 20, 0, -5, 1.3, NA, 20, 80)

  vec_fmt_index(vec_index, output = "plain") |>
    expect_equal(
      c("A", "D", "E", "H", "L", "T", "", "E", "A", "NA", "T", "BBBB")
    )

  expect_equal(
    vec_fmt_index(vec_index, output = "plain"),
    vec_fmt_index(vec_index, output = "html")
  )
  expect_equal(
    vec_fmt_index(vec_index, output = "plain"),
    vec_fmt_index(vec_index, output = "latex")
  )
  expect_equal(
    vec_fmt_index(vec_index, output = "plain"),
    vec_fmt_index(vec_index, output = "rtf")
  )
  expect_equal(
    vec_fmt_index(vec_index, output = "plain"),
    vec_fmt_index(vec_index, output = "word")
  )

  vec_fmt_index(vec_index, case = "lower", output = "plain") |>
    expect_equal(
      c("a", "d", "e", "h", "l", "t", "", "e", "a", "NA", "t", "bbbb")
    )

  expect_equal(
    vec_fmt_index(vec_index, case = "lower", output = "plain"),
    vec_fmt_index(vec_index, case = "lower", output = "html")
  )

  expect_equal(
    vec_fmt_index(vec_index, case = "lower", output = "plain"),
    vec_fmt_index(vec_index, case = "lower", output = "latex")
  )

  expect_equal(
    vec_fmt_index(vec_index, case = "lower", output = "plain"),
    vec_fmt_index(vec_index, case = "lower", output = "rtf")
  )

  expect_equal(
    vec_fmt_index(vec_index, case = "lower", output = "plain"),
    vec_fmt_index(vec_index, case = "lower", output = "word")
  )

  vec_fmt_index(
    vec_index,
    case = "lower",
    index_algo = "excel",
    output = "plain"
  ) |>
    expect_equal(
      c("a", "d", "e", "h", "l", "t", "", "e", "a", "NA", "t", "cb")
    )

  expect_error(vec_fmt_index(c(1, 2), case = "middle"))
})

test_that("vec_fmt_spelled_num() works", {

  vec_index <- c(1, 4, 5, 8, 12, 20, 0, -5, 1.3, NA, 20, 80, 100, 200)

  vec_fmt_spelled_num(vec_index, output = "plain") |>
    expect_equal(
      c(
        "one", "four", "five", "eight", "twelve", "twenty", "zero",
        "-5", "one", "NA", "twenty", "eighty", "one hundred", "200"
      )
    )

  expect_equal(
    vec_fmt_spelled_num(vec_index, output = "plain"),
    vec_fmt_spelled_num(vec_index, output = "html")
  )
  expect_equal(
    vec_fmt_spelled_num(vec_index, output = "plain"),
    vec_fmt_spelled_num(vec_index, output = "latex")
  )
  expect_equal(
    vec_fmt_spelled_num(vec_index, output = "plain"),
    vec_fmt_spelled_num(vec_index, output = "rtf")
  )
  expect_equal(
    vec_fmt_spelled_num(vec_index, output = "plain"),
    vec_fmt_spelled_num(vec_index, output = "word")
  )

  vec_fmt_spelled_num(vec_index, output = "plain", locale = "af") |>
    expect_equal(
      c(
        "een", "vier", "vyf", "agt", "twaalf", "twintig", "nul", "-5",
        "een", "NA", "twintig", "tagtig", "honderd", "200"
      )
    )
})

test_that("vec_fmt_bytes() works", {

  vec_fmt_bytes(vec_num_1, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "1 B",
        "1 B", "2 B", "2 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2 B"), paste0("\U02212", "2 B"),
        paste0("\U02212", "1 B"), paste0("\U02212", "1 B"), "0 B",
        "0 B", "0 B", "1 B", "1 B", "2 B", "2 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B",
        "1 B", "1 B", "2 B", "2 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "1 B",
        "1 B", "2 B", "2 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B", "5 B", "10 B",
        "15 B", "20 B", "25 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "25 B"), paste0("\U02212", "20 B"),
        paste0("\U02212", "15 B"), paste0("\U02212", "10 B"),
        paste0("\U02212", "5 B"), "0 B", "5 B", "10 B", "15 B",
        "20 B", "25 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B",
        "5 B", "10 B", "15 B", "20 B", "25 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B", "5 B", "10 B",
        "15 B", "20 B", "25 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B", "0 B", "50 B",
        "100 B", "150 B", "200 B", "250 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250 B"), paste0("\U02212", "200 B"),
        paste0("\U02212", "150 B"), paste0("\U02212", "100 B"),
        paste0("\U02212", "50 B"), "0 B", "50 B", "100 B", "150 B",
        "200 B", "250 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B",
        "0 B", "50 B", "100 B", "150 B", "200 B", "250 B",
        "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B", "0 B", "50 B",
        "100 B", "150 B", "200 B", "250 B", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "-2.5 MB", "-2 MB", "-1.5 MB", "-1 MB", "-500 kB", "0 B", "500 kB",
        "1 MB", "1.5 MB", "2 MB", "2.5 MB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.5 MB"), paste0("\U02212", "2 MB"),
        paste0("\U02212", "1.5 MB"), paste0("\U02212", "1 MB"),
        paste0("\U02212", "500 kB"), "0 B", "500 kB", "1 MB",
        "1.5 MB", "2 MB", "2.5 MB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "-2.5 MB", "-2 MB", "-1.5 MB", "-1 MB", "-500 kB",
        "0 B", "500 kB", "1 MB", "1.5 MB", "2 MB", "2.5 MB",
        "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "-2.5 MB", "-2 MB", "-1.5 MB", "-1 MB", "-500 kB", "0 B", "500 kB",
        "1 MB", "1.5 MB", "2 MB", "2.5 MB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1.5 TB", "2 TB", "2.5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.5 TB"), paste0("\U02212", "2 TB"),
        paste0("\U02212", "1.5 TB"), paste0("\U02212", "1 TB"),
        paste0("\U02212", "500 GB"), "0 B", "500 GB", "1 TB",
        "1.5 TB", "2 TB", "2.5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB",
        "0 B", "500 GB", "1 TB", "1.5 TB", "2 TB", "2.5 TB",
        "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1.5 TB", "2 TB", "2.5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "decimal", output = "plain") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "decimal", output = "html") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "decimal", output = "latex") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "0 B", "0 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "decimal", output = "rtf") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "1 B",
        "1 B", "2 B", "2 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "binary", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2 B"), paste0("\U02212", "2 B"),
        paste0("\U02212", "1 B"), paste0("\U02212", "1 B"),
        "0 B", "0 B", "0 B", "1 B", "1 B", "2 B", "2 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B",
        "1 B", "1 B", "2 B", "2 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_1, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "1 B",
        "1 B", "2 B", "2 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B", "5 B", "10 B",
        "15 B", "20 B", "25 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "binary", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "25 B"), paste0("\U02212", "20 B"),
        paste0("\U02212", "15 B"), paste0("\U02212", "10 B"),
        paste0("\U02212", "5 B"), "0 B", "5 B", "10 B", "15 B",
        "20 B", "25 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B",
        "5 B", "10 B", "15 B", "20 B", "25 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_2, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "-25 B", "-20 B", "-15 B", "-10 B", "-5 B", "0 B", "5 B", "10 B",
        "15 B", "20 B", "25 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B", "0 B", "50 B",
        "100 B", "150 B", "200 B", "250 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "binary", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "250 B"), paste0("\U02212", "200 B"),
        paste0("\U02212", "150 B"), paste0("\U02212", "100 B"),
        paste0("\U02212", "50 B"), "0 B", "50 B", "100 B", "150 B",
        "200 B", "250 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B",
        "0 B", "50 B", "100 B", "150 B", "200 B", "250 B",
        "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_3, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "-250 B", "-200 B", "-150 B", "-100 B", "-50 B", "0 B", "50 B",
        "100 B", "150 B", "200 B", "250 B", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "-2.4 MiB", "-1.9 MiB", "-1.4 MiB", "-976.6 KiB", "-488.3 KiB",
        "0 B", "488.3 KiB", "976.6 KiB", "1.4 MiB", "1.9 MiB", "2.4 MiB",
        "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "binary", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.4 MiB"), paste0("\U02212", "1.9 MiB"),
        paste0("\U02212", "1.4 MiB"), paste0("\U02212", "976.6 KiB"),
        paste0("\U02212", "488.3 KiB"), "0 B", "488.3 KiB", "976.6 KiB",
        "1.4 MiB", "1.9 MiB", "2.4 MiB", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "-2.4 MiB", "-1.9 MiB", "-1.4 MiB", "-976.6 KiB", "-488.3 KiB",
        "0 B", "488.3 KiB", "976.6 KiB", "1.4 MiB", "1.9 MiB",
        "2.4 MiB", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_4, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "-2.4 MiB", "-1.9 MiB", "-1.4 MiB", "-976.6 KiB", "-488.3 KiB",
        "0 B", "488.3 KiB", "976.6 KiB", "1.4 MiB", "1.9 MiB", "2.4 MiB",
        "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "-2.3 TiB", "-1.8 TiB", "-1.4 TiB", "-931.3 GiB", "-465.7 GiB",
        "0 B", "465.7 GiB", "931.3 GiB", "1.4 TiB", "1.8 TiB", "2.3 TiB",
        "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "binary", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.3 TiB"), paste0("\U02212", "1.8 TiB"),
        paste0("\U02212", "1.4 TiB"), paste0("\U02212", "931.3 GiB"),
        paste0("\U02212", "465.7 GiB"), "0 B", "465.7 GiB", "931.3 GiB",
        "1.4 TiB", "1.8 TiB", "2.3 TiB", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "-2.3 TiB", "-1.8 TiB", "-1.4 TiB", "-931.3 GiB", "-465.7 GiB",
        "0 B", "465.7 GiB", "931.3 GiB", "1.4 TiB", "1.8 TiB",
        "2.3 TiB", "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_5, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "-2.3 TiB", "-1.8 TiB", "-1.4 TiB", "-931.3 GiB", "-465.7 GiB",
        "0 B", "465.7 GiB", "931.3 GiB", "1.4 TiB", "1.8 TiB", "2.3 TiB",
        "NA", "Inf YiB"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "binary", output = "plain") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "binary", output = "html") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "binary", output = "latex") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "0 B", "0 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(vec_num_6, standard = "binary", output = "rtf") |>
    expect_equal(
      c(
        "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B", "0 B",
        "0 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B", "1 B",
        "1 B", "1 B", "2 B"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = TRUE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1.5 TB", "2 TB", "2.5 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = TRUE, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.5 TB"), paste0("\U02212", "2 TB"),
        paste0("\U02212", "1.5 TB"), paste0("\U02212", "1 TB"),
        paste0("\U02212", "500 GB"), "0 B", "500 GB", "1 TB",
        "1.5 TB", "2 TB", "2.5 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = TRUE, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB",
        "0 B", "500 GB", "1 TB", "1.5 TB", "2 TB", "2.5 TB",
        "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = TRUE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.5 TB", "-2 TB", "-1.5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1.5 TB", "2 TB", "2.5 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2.5000 TB", "-2.0000 TB", "-1.5000 TB", "-1.0000 TB", "-500.0000 GB",
        "0.0000 B", "500.0000 GB", "1.0000 TB", "1.5000 TB", "2.0000 TB",
        "2.5000 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = FALSE, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2.5000 TB"), paste0("\U02212", "2.0000 TB"),
        paste0("\U02212", "1.5000 TB"), paste0("\U02212", "1.0000 TB"),
        paste0("\U02212", "500.0000 GB"), "0.0000 B", "500.0000 GB",
        "1.0000 TB", "1.5000 TB", "2.0000 TB", "2.5000 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = FALSE, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2.5000 TB", "-2.0000 TB", "-1.5000 TB", "-1.0000 TB",
        "-500.0000 GB", "0.0000 B", "500.0000 GB", "1.0000 TB",
        "1.5000 TB", "2.0000 TB", "2.5000 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 4, drop_trailing_zeros = FALSE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2.5000 TB", "-2.0000 TB", "-1.5000 TB", "-1.0000 TB", "-500.0000 GB",
        "0.0000 B", "500.0000 GB", "1.0000 TB", "1.5000 TB", "2.0000 TB",
        "2.5000 TB", "NA", "  Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 0, drop_trailing_dec_mark = FALSE, output = "plain"
  ) |>
    expect_equal(
      c(
        "-2. TB", "-2. TB", "-2. TB", "-1. TB", "-500. GB", "0. B",
        "500. GB", "1. TB", "2. TB", "2. TB", "2. TB", "NA", "Inf. YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 0, drop_trailing_dec_mark = FALSE, output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2. TB"), paste0("\U02212", "2. TB"),
        paste0("\U02212", "2. TB"), paste0("\U02212", "1. TB"),
        paste0("\U02212", "500. GB"), "0. B", "500. GB", "1. TB", "2. TB",
        "2. TB", "2. TB", "NA", "Inf. YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 0, drop_trailing_dec_mark = FALSE, output = "latex"
  ) |>
    expect_equal(
      c(
        "-2. TB", "-2. TB", "-2. TB", "-1. TB", "-500. GB",
        "0. B", "500. GB", "1. TB", "2. TB", "2. TB", "2. TB",
        "NA", "Inf. YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5, decimals = 0, drop_trailing_dec_mark = FALSE, output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2. TB", "-2. TB", "-2. TB", "-1. TB", "-500. GB", "0. B",
        "500. GB", "1. TB", "2. TB", "2. TB", "2. TB", "NA", "Inf. YB"
      )
    )

  vec_fmt_bytes(vec_num_1, n_sigfig = 3, output = "plain") |>
    expect_equal(
      c(
        "-2.00 B", "-2.00 B", "-1.00 B", "-1.00 B", "0 B", "0 B", "0 B",
        "1.00 B", "1.00 B", "2.00 B", "2.00 B", "NA", " Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_4, n_sigfig = 3, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2.50 MB"), paste0("\U02212", "2.00 MB"),
        paste0("\U02212", "1.50 MB"), paste0("\U02212", "1.00 MB"),
        paste0("\U02212", "500 kB"), "0 B", "500 kB", "1.00 MB",
        "1.50 MB", "2.00 MB", "2.50 MB", "NA", " Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, n_sigfig = 3, output = "latex") |>
    expect_equal(
      c(
        "-2.00 B", "-2.00 B", "-1.00 B", "-1.00 B", "0 B",
        "0 B", "0 B", "1.00 B", "1.00 B", "2.00 B", "2.00 B",
        "NA", " Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, n_sigfig = 3, output = "rtf") |>
    expect_equal(
      c(
        "-2.00 B", "-2.00 B", "-1.00 B", "-1.00 B", "0 B", "0 B", "0 B",
        "1.00 B", "1.00 B", "2.00 B", "2.00 B", "NA", " Inf YB"
      )
    )

  vec_fmt_bytes(
    c(1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24, 1e27),
    use_seps = FALSE, output = "plain"
  ) |>
    expect_equal(c("1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB", "1 YB", "1000 YB"))

  vec_fmt_bytes(
    c(1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24, 1e27),
    use_seps = FALSE, output = "html"
  ) |>
    expect_equal(c("1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB", "1 YB", "1000 YB"))

  vec_fmt_bytes(
    c(1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24, 1e27),
    use_seps = FALSE, output = "latex"
  ) |>
    expect_equal(c("1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB", "1 YB", "1000 YB"))

  vec_fmt_bytes(
    c(1e6, 1e9, 1e12, 1e15, 1e18, 1e21, 1e24, 1e27),
    use_seps = FALSE, output = "rtf"
  ) |>
    expect_equal(c("1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB", "1 YB", "1000 YB"))

  vec_fmt_bytes(vec_num_1, pattern = "a{x}b", output = "plain") |>
    expect_equal(
      c(
        "a-2 Bb", "a-2 Bb", "a-1 Bb", "a-1 Bb", "a0 Bb", "a0 Bb", "a0 Bb",
        "a1 Bb", "a1 Bb", "a2 Bb", "a2 Bb", "NA", "aInf YBb"
      )
    )

  vec_fmt_bytes(vec_num_1, pattern = "a{x}b", output = "html") |>
    expect_equal(
      c(
        paste0("a\U02212", "2 Bb"), paste0("a\U02212", "2 Bb"),
        paste0("a\U02212", "1 Bb"), paste0("a\U02212", "1 Bb"),
        "a0 Bb", "a0 Bb", "a0 Bb", "a1 Bb", "a1 Bb", "a2 Bb", "a2 Bb",
        "NA", "aInf YBb"
      )
    )

  vec_fmt_bytes(vec_num_1, pattern = "a{x}b", output = "latex") |>
    expect_equal(
      c(
        "a-2 Bb", "a-2 Bb", "a-1 Bb", "a-1 Bb", "a0 Bb",
        "a0 Bb", "a0 Bb", "a1 Bb", "a1 Bb", "a2 Bb", "a2 Bb",
        "NA", "aInf YBb"
      )
    )

  vec_fmt_bytes(vec_num_1, pattern = "a{x}b", output = "rtf") |>
    expect_equal(
      c(
        "a-2 Bb", "a-2 Bb", "a-1 Bb", "a-1 Bb", "a0 Bb", "a0 Bb", "a0 Bb",
        "a1 Bb", "a1 Bb", "a2 Bb", "a2 Bb", "NA", "aInf YBb"
      )
    )

  vec_fmt_bytes(vec_num_5, locale = "de", output = "plain") |>
    expect_equal(
      c(
        "-2,5 TB", "-2 TB", "-1,5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1,5 TB", "2 TB", "2,5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, locale = "de", output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2,5 TB"), paste0("\U02212", "2 TB"),
        paste0("\U02212", "1,5 TB"), paste0("\U02212", "1 TB"),
        paste0("\U02212", "500 GB"), "0 B", "500 GB", "1 TB",
        "1,5 TB", "2 TB", "2,5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, locale = "de", output = "latex") |>
    expect_equal(
      c(
        "-2,5 TB", "-2 TB", "-1,5 TB", "-1 TB", "-500 GB",
        "0 B", "500 GB", "1 TB", "1,5 TB", "2 TB", "2,5 TB",
        "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_5, locale = "de", output = "rtf") |>
    expect_equal(
      c(
        "-2,5 TB", "-2 TB", "-1,5 TB", "-1 TB", "-500 GB", "0 B", "500 GB",
        "1 TB", "1,5 TB", "2 TB", "2,5 TB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5 * 1e15, decimals = 1, drop_trailing_zeros = FALSE,
    sep_mark = " ", dec_mark = ",", output = "plain"
  ) |>
    expect_equal(
      c(
        "-2 500,0 YB", "-2 000,0 YB", "-1 500,0 YB", "-1 000,0 YB",
        "-500,0 YB", "0,0 B", "500,0 YB", "1 000,0 YB", "1 500,0 YB",
        "2 000,0 YB", "2 500,0 YB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5 * 1e15, decimals = 1, drop_trailing_zeros = FALSE,
    sep_mark = " ", dec_mark = ",", output = "html"
  ) |>
    expect_equal(
      c(
        paste0("\U02212", "2 500,0 YB"), paste0("\U02212", "2 000,0 YB"),
        paste0("\U02212", "1 500,0 YB"), paste0("\U02212", "1 000,0 YB"),
        paste0("\U02212", "500,0 YB"), "0,0 B", "500,0 YB", "1 000,0 YB",
        "1 500,0 YB", "2 000,0 YB", "2 500,0 YB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5 * 1e15, decimals = 1, drop_trailing_zeros = FALSE,
    sep_mark = " ", dec_mark = ",", output = "latex"
  ) |>
    expect_equal(
      c(
        "-2 500,0 YB", "-2 000,0 YB", "-1 500,0 YB", "-1 000,0 YB",
        "-500,0 YB", "0,0 B", "500,0 YB", "1 000,0 YB", "1 500,0 YB",
        "2 000,0 YB", "2 500,0 YB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(
    vec_num_5 * 1e15, decimals = 1, drop_trailing_zeros = FALSE,
    sep_mark = " ", dec_mark = ",", output = "rtf"
  ) |>
    expect_equal(
      c(
        "-2 500,0 YB", "-2 000,0 YB", "-1 500,0 YB", "-1 000,0 YB",
        "-500,0 YB", "0,0 B", "500,0 YB", "1 000,0 YB", "1 500,0 YB",
        "2 000,0 YB", "2 500,0 YB", "NA", "Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, force_sign = TRUE, output = "plain") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "+1 B",
        "+1 B", "+2 B", "+2 B", "NA", "+Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, force_sign = TRUE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2 B"), paste0("\U02212", "2 B"),
        paste0("\U02212", "1 B"), paste0("\U02212", "1 B"), "0 B",
        "0 B", "0 B", "+1 B", "+1 B", "+2 B", "+2 B", "NA", "+Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, force_sign = TRUE, output = "latex") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B",
        "+1 B", "+1 B", "+2 B", "+2 B", "NA", "+Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, force_sign = TRUE, output = "rtf") |>
    expect_equal(
      c(
        "-2 B", "-2 B", "-1 B", "-1 B", "0 B", "0 B", "0 B", "+1 B",
        "+1 B", "+2 B", "+2 B", "NA", "+Inf YB"
      )
    )

  vec_fmt_bytes(vec_num_1, incl_space = FALSE, output = "plain") |>
    expect_equal(
      c(
        "-2B", "-2B", "-1B", "-1B", "0B", "0B", "0B", "1B", "1B", "2B",
        "2B", "NA", "InfYB"
      )
    )

  vec_fmt_bytes(vec_num_1, incl_space = FALSE, output = "html") |>
    expect_equal(
      c(
        paste0("\U02212", "2B"), paste0("\U02212", "2B"),
        paste0("\U02212", "1B"), paste0("\U02212", "1B"),
        "0B", "0B", "0B", "1B", "1B", "2B", "2B", "NA", "InfYB"
      )
    )

  vec_fmt_bytes(vec_num_1, incl_space = FALSE, output = "latex") |>
    expect_equal(
      c(
        "-2B", "-2B", "-1B", "-1B", "0B", "0B", "0B",
        "1B", "1B", "2B", "2B", "NA", "InfYB"
      )
    )

  vec_fmt_bytes(vec_num_1, incl_space = FALSE, output = "rtf") |>
    expect_equal(
      c(
        "-2B", "-2B", "-1B", "-1B", "0B", "0B", "0B", "1B", "1B", "2B",
        "2B", "NA", "InfYB"
      )
    )

  expect_error(vec_fmt_bytes(c(1, 2), standard = "NONE"))
})

test_that("vec_fmt_date() works", {

  vec_fmt_date(dates, date_style = 2, output = "html") |>
    expect_equal(
      c(
        "Sunday, January 5, 2020", "Saturday, February 6, 2021",
        "Monday, March 7, 2022", "Saturday, April 8, 2023",
        "Thursday, May 9, 2024"
      )
    )

  vec_fmt_date(dates, date_style = "wday_month_day_year", output = "html") |>
    expect_equal(
      c(
        "Sunday, January 5, 2020", "Saturday, February 6, 2021",
        "Monday, March 7, 2022", "Saturday, April 8, 2023",
        "Thursday, May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "html"),
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "html"),
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "html"),
    vec_fmt_date(dates, date_style = "wday_month_day_year", output = "plain")
  )

  expect_equal(
    vec_fmt_date(dates, date_style = "iso", output = "html"),
    as.character(dates)
  )

  expect_equal(
    vec_fmt_date(dates, date_style = "iso", output = "html"),
    vec_fmt_date(dates, date_style = "iso", output = "latex")
  )

  expect_equal(
    vec_fmt_date(dates, date_style = "iso", output = "html"),
    vec_fmt_date(dates, date_style = "iso", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(dates, date_style = 1, output = "html"),
    vec_fmt_date(dates, date_style = 1, output = "plain")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "iso", output = "html"),
    as.character(dates)
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "iso", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "iso", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "iso", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "iso", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "iso", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "iso", output = "plain")
  )

  vec_fmt_date(dates, date_style = "wd_m_day_year", output = "html") |>
    expect_equal(
      c(
        "Sun, Jan 5, 2020", "Sat, Feb 6, 2021", "Mon, Mar 7, 2022",
        "Sat, Apr 8, 2023", "Thu, May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wd_m_day_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "wday_day_month_year", output = "html") |>
    expect_equal(
      c(
        "Sunday 5 January 2020", "Saturday 6 February 2021",
        "Monday 7 March 2022", "Saturday 8 April 2023", "Thursday 9 May 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "wday_day_month_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "month_day_year", output = "html") |>
    expect_equal(
      c(
        "January 5, 2020", "February 6, 2021", "March 7, 2022",
        "April 8, 2023", "May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month_day_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "m_day_year", output = "html") |>
    expect_equal(
      c(
        "Jan 5, 2020", "Feb 6, 2021", "Mar 7, 2022",
        "Apr 8, 2023", "May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "m_day_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "day_m_year", output = "html") |>
    expect_equal(
      c(
        "5 Jan 2020", "6 Feb 2021", "7 Mar 2022", "8 Apr 2023", "9 May 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "day_month_year", output = "html") |>
    expect_equal(
      c(
        "5 January 2020", "6 February 2021", "7 March 2022",
        "8 April 2023", "9 May 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month_year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "day_month", output = "html") |>
    expect_equal(
      c("5 January", "6 February", "7 March", "8 April", "9 May")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_month", output = "plain")
  )

  vec_fmt_date(dates, date_style = "day_m", output = "html") |>
    expect_equal(c("5 Jan", "6 Feb", "7 Mar", "8 Apr", "9 May"))

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day_m", output = "plain")
  )

  vec_fmt_date(dates, date_style = "year", output = "html") |>
    expect_equal(c("2020", "2021", "2022", "2023", "2024"))

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year", output = "plain")
  )

  vec_fmt_date(dates, date_style = "month", output = "html") |>
    expect_equal(c("January", "February", "March", "April", "May"))

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "month", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "month", output = "plain")
  )

  vec_fmt_date(dates, date_style = "day", output = "html") |>
    expect_equal(c("05", "06", "07", "08", "09"))

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "day", output = "plain")
  )

  vec_fmt_date(dates, date_style = "year.mn.day", output = "html") |>
    expect_equal(
      c(
        "2020/01/05", "2021/02/06", "2022/03/07", "2023/04/08", "2024/05/09"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year.mn.day", output = "plain")
  )

  vec_fmt_date(dates, date_style = "y.mn.day", output = "html") |>
    expect_equal(
      c(
        "20/01/05", "21/02/06", "22/03/07", "23/04/08", "24/05/09"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y.mn.day", output = "plain")
  )

  vec_fmt_date(dates, date_style = "year_week", output = "html") |>
    expect_equal(
      c(
        "2020-W01", "2021-W05", "2022-W10", "2023-W14", "2024-W19"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_week", output = "plain")
  )

  vec_fmt_date(dates, date_style = "year_quarter", output = "html") |>
    expect_equal(
      c(
        "2020-Q1", "2021-Q1", "2022-Q1", "2023-Q2", "2024-Q2"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "year_quarter", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMd", output = "html") |>
    expect_equal(
      c(
        "1/5/2020", "2/6/2021", "3/7/2022", "4/8/2023", "5/9/2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMEd", output = "html") |>
    expect_equal(
      c(
        "Sun, 1/5/2020", "Sat, 2/6/2021", "Mon, 3/7/2022", "Sat, 4/8/2023",
        "Thu, 5/9/2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMEd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMMM", output = "html") |>
    expect_equal(
      c("Jan 2020", "Feb 2021", "Mar 2022", "Apr 2023", "May 2024")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMM", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMMMM", output = "html") |>
    expect_equal(
      c(
        "January 2020", "February 2021", "March 2022", "April 2023",
        "May 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMM", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMMMd", output = "html") |>
    expect_equal(
      c(
        "Jan 5, 2020", "Feb 6, 2021", "Mar 7, 2022", "Apr 8, 2023",
        "May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yMMMEd", output = "html") |>
    expect_equal(
      c(
        "Sun, Jan 5, 2020", "Sat, Feb 6, 2021", "Mon, Mar 7, 2022",
        "Sat, Apr 8, 2023", "Thu, May 9, 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yMMMEd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "GyMd", output = "html") |>
    expect_equal(
      c("1/5/2020 A", "2/6/2021 A", "3/7/2022 A", "4/8/2023 A", "5/9/2024 A")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "GyMMMd", output = "html") |>
    expect_equal(
      c(
        "Jan 5, 2020 AD", "Feb 6, 2021 AD", "Mar 7, 2022 AD", "Apr 8, 2023 AD",
        "May 9, 2024 AD"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "GyMMMEd", output = "html") |>
    expect_equal(
      c(
        "Sun, Jan 5, 2020 AD", "Sat, Feb 6, 2021 AD", "Mon, Mar 7, 2022 AD",
        "Sat, Apr 8, 2023 AD", "Thu, May 9, 2024 AD"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMMEd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yM", output = "html") |>
    expect_equal(
      c("1/2020", "2/2021", "3/2022", "4/2023", "5/2024")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yM", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yM", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yM", output = "plain")
  )

  vec_fmt_date(dates, date_style = "Md", output = "html") |>
    expect_equal(
      c("1/5", "2/6", "3/7", "4/8", "5/9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Md", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Md", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Md", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Md", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Md", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Md", output = "plain")
  )

  vec_fmt_date(dates, date_style = "MEd", output = "html") |>
    expect_equal(
      c("Sun, 1/5", "Sat, 2/6", "Mon, 3/7", "Sat, 4/8", "Thu, 5/9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MEd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "MMMd", output = "html") |>
    expect_equal(
      c("Jan 5", "Feb 6", "Mar 7", "Apr 8", "May 9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "MMMEd", output = "html") |>
    expect_equal(
      c("Sun, Jan 5", "Sat, Feb 6", "Mon, Mar 7", "Sat, Apr 8", "Thu, May 9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMEd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "MMMMd", output = "html") |>
    expect_equal(
      c("January 5", "February 6", "March 7", "April 8", "May 9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMMMd", output = "plain")
  )

  vec_fmt_date(dates, date_style = "GyMMM", output = "html") |>
    expect_equal(
      c(
        "Jan 2020 AD", "Feb 2021 AD", "Mar 2022 AD", "Apr 2023 AD",
        "May 2024 AD"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "GyMMM", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yQQQ", output = "html") |>
    expect_equal(
      c("Q1 2020", "Q1 2021", "Q1 2022", "Q2 2023", "Q2 2024")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQ", output = "plain")
  )

  vec_fmt_date(dates, date_style = "yQQQQ", output = "html") |>
    expect_equal(
      c(
        "1st quarter 2020", "1st quarter 2021", "1st quarter 2022",
        "2nd quarter 2023", "2nd quarter 2024"
      )
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "yQQQQ", output = "plain")
  )

  vec_fmt_date(dates, date_style = "Gy", output = "html") |>
    expect_equal(
      c("2020 AD", "2021 AD", "2022 AD", "2023 AD", "2024 AD")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Gy", output = "plain")
  )

  vec_fmt_date(dates, date_style = "y", output = "html") |>
    expect_equal(
      c("2020", "2021", "2022", "2023", "2024")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "y", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "y", output = "plain")
  )

  vec_fmt_date(dates, date_style = "M", output = "html") |>
    expect_equal(
      c("1", "2", "3", "4", "5")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "M", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "M", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "M", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "M", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "M", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "M", output = "plain")
  )

  vec_fmt_date(dates, date_style = "MMM", output = "html") |>
    expect_equal(
      c("Jan", "Feb", "Mar", "Apr", "May")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "MMM", output = "plain")
  )

  vec_fmt_date(dates, date_style = "d", output = "html") |>
    expect_equal(
      c("5", "6", "7", "8", "9")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "d", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "d", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "d", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "d", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "d", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "d", output = "plain")
  )

  vec_fmt_date(dates, date_style = "Ed", output = "html") |>
    expect_equal(
      c("5 Sun", "6 Sat", "7 Mon", "8 Sat", "9 Thu")
    )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "latex")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "rtf")
  )

  expect_equal(
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "html"),
    vec_fmt_date(as.character(dates), date_style = "Ed", output = "plain")
  )


  vec_fmt_date(dates, date_style = "yMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "05/01/2020", "06/02/2021", "07/03/2022", "08/04/2023", "09/05/2024"
      )
    )

  vec_fmt_date(dates, date_style = "yMEd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 05/01/2020", "sam. 06/02/2021", "lun. 07/03/2022", "sam. 08/04/2023",
        "jeu. 09/05/2024"
      )
    )

  vec_fmt_date(dates, date_style = "yMMM", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "janv. 2020", "févr. 2021", "mars 2022", "avr. 2023", "mai 2024"
      )
    )

  vec_fmt_date(dates, date_style = "yMMMM", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "janvier 2020", "février 2021", "mars 2022", "avril 2023", "mai 2024"
      )
    )

  vec_fmt_date(dates, date_style = "yMMMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "5 janv. 2020", "6 févr. 2021", "7 mars 2022", "8 avr. 2023",
        "9 mai 2024"
      )
    )

  vec_fmt_date(dates, date_style = "yMMMEd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 5 janv. 2020", "sam. 6 févr. 2021", "lun. 7 mars 2022",
        "sam. 8 avr. 2023", "jeu. 9 mai 2024"
      )
    )

  vec_fmt_date(dates, date_style = "GyMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "05/01/2020 ap. J.-C.", "06/02/2021 ap. J.-C.", "07/03/2022 ap. J.-C.",
        "08/04/2023 ap. J.-C.", "09/05/2024 ap. J.-C."
      )
    )

  vec_fmt_date(dates, date_style = "GyMMMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "5 janv. 2020 ap. J.-C.", "6 févr. 2021 ap. J.-C.", "7 mars 2022 ap. J.-C.",
        "8 avr. 2023 ap. J.-C.", "9 mai 2024 ap. J.-C."
      )
    )

  vec_fmt_date(dates, date_style = "GyMMMEd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 5 janv. 2020 ap. J.-C.", "sam. 6 févr. 2021 ap. J.-C.",
        "lun. 7 mars 2022 ap. J.-C.", "sam. 8 avr. 2023 ap. J.-C.",
        "jeu. 9 mai 2024 ap. J.-C."
      )
    )

  vec_fmt_date(dates, date_style = "yM", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "01/2020", "02/2021", "03/2022", "04/2023", "05/2024"
      )
    )

  vec_fmt_date(dates, date_style = "Md", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "05/01", "06/02", "07/03", "08/04", "09/05"
      )
    )

  vec_fmt_date(dates, date_style = "MEd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 05/01", "sam. 06/02", "lun. 07/03", "sam. 08/04", "jeu. 09/05"
      )
    )

  vec_fmt_date(dates, date_style = "MMMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "5 janv.", "6 févr.", "7 mars", "8 avr.", "9 mai"
      )
    )

  vec_fmt_date(dates, date_style = "MMMEd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 5 janv.", "sam. 6 févr.", "lun. 7 mars", "sam. 8 avr.", "jeu. 9 mai"
      )
    )

  vec_fmt_date(dates, date_style = "MMMMd", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "5 janvier", "6 février", "7 mars", "8 avril", "9 mai"
      )
    )

  vec_fmt_date(dates, date_style = "GyMMM", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "janv. 2020 ap. J.-C.", "févr. 2021 ap. J.-C.", "mars 2022 ap. J.-C.",
        "avr. 2023 ap. J.-C.", "mai 2024 ap. J.-C."
      )
    )

  vec_fmt_date(dates, date_style = "yQQQ", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "T1 2020", "T1 2021", "T1 2022", "T2 2023", "T2 2024"
      )
    )

  vec_fmt_date(dates, date_style = "yQQQQ", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "1er trimestre 2020", "1er trimestre 2021", "1er trimestre 2022",
        "2e trimestre 2023", "2e trimestre 2024"
      )
    )

  vec_fmt_date(dates, date_style = "Gy", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "2020 ap. J.-C.", "2021 ap. J.-C.", "2022 ap. J.-C.", "2023 ap. J.-C.",
        "2024 ap. J.-C."
      )
    )

  vec_fmt_date(dates, date_style = "y", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "2020", "2021", "2022", "2023", "2024"
      )
    )

  vec_fmt_date(dates, date_style = "M", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "1", "2", "3", "4", "5"
      )
    )

  vec_fmt_date(dates, date_style = "MMM", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "janv.", "févr.", "mars", "avr.", "mai"
      )
    )

  vec_fmt_date(dates, date_style = "d", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "5", "6", "7", "8", "9"
      )
    )

  vec_fmt_date(dates, date_style = "Ed", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 5", "sam. 6", "lun. 7", "sam. 8", "jeu. 9"
      )
    )

  vec_fmt_date(
    dates,
    date_style = "wday_month_day_year",
    pattern = "d{x}d",
    output = "html"
  ) |>
    expect_equal(
      c(
        "dSunday, January 5, 2020d", "dSaturday, February 6, 2021d",
        "dMonday, March 7, 2022d", "dSaturday, April 8, 2023d",
        "dThursday, May 9, 2024d"
      )
    )
})

test_that("vec_fmt_time() works", {

  vec_fmt_time(times, time_style = 1, output = "html") |>
    expect_equal(c("15:35:00", "16:36:00", "17:37:00", "18:38:00", "19:39:00"))

  vec_fmt_time(times, time_style = "iso", output = "html") |>
    expect_equal(c("15:35:00", "16:36:00", "17:37:00", "18:38:00", "19:39:00"))

  expect_equal(
    vec_fmt_time(times, time_style = "iso", output = "html"),
    vec_fmt_time(times, time_style = "iso", output = "latex")
  )

  expect_equal(
    vec_fmt_time(times, time_style = "iso", output = "html"),
    vec_fmt_time(times, time_style = "iso", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(times, time_style = "iso", output = "html"),
    vec_fmt_time(times, time_style = "iso", output = "plain")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "html"),
    as.character(times)
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "html"),
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "html"),
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "html"),
    vec_fmt_time(as.character(times), time_style = "iso-short", output = "plain")
  )

  vec_fmt_time(times, time_style = "h_m_s_p", output = "html") |>
    expect_equal(
      c("3:35:00 PM", "4:36:00 PM", "5:37:00 PM", "6:38:00 PM", "7:39:00 PM")
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_s_p", output = "plain")
  )

  vec_fmt_time(times, time_style = "h_m_p", output = "html") |>
    expect_equal(
      c("3:35 PM", "4:36 PM", "5:37 PM", "6:38 PM", "7:39 PM")
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_m_p", output = "plain")
  )

  vec_fmt_time(times, time_style = "h_p", output = "html") |>
    expect_equal(c("3 PM", "4 PM", "5 PM", "6 PM", "7 PM"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_p", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_p", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h_p", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h_p", output = "plain")
  )

  vec_fmt_time(times, time_style = "Hms", output = "html") |>
    expect_equal(c("15:35:00", "16:36:00", "17:37:00", "18:38:00", "19:39:00"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hms", output = "plain")
  )

  vec_fmt_time(times, time_style = "Hm", output = "html") |>
    expect_equal(c("15:35", "16:36", "17:37", "18:38", "19:39"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hm", output = "plain")
  )

  vec_fmt_time(times, time_style = "H", output = "html") |>
    expect_equal(c("15", "16", "17", "18", "19"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "H", output = "html"),
    vec_fmt_time(as.character(times), time_style = "H", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "H", output = "html"),
    vec_fmt_time(as.character(times), time_style = "H", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "H", output = "html"),
    vec_fmt_time(as.character(times), time_style = "H", output = "plain")
  )

  vec_fmt_time(times, time_style = "EHm", output = "html") |>
    expect_equal(
      c("Thu 15:35", "Thu 16:36", "Thu 17:37", "Thu 18:38", "Thu 19:39")
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHm", output = "plain")
  )

  vec_fmt_time(times, time_style = "EHms", output = "html") |>
    expect_equal(
      c(
        "Thu 15:35:00", "Thu 16:36:00", "Thu 17:37:00", "Thu 18:38:00",
        "Thu 19:39:00"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EHms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EHms", output = "plain")
  )

  # vec_fmt_time(times, time_style = "Hmsv", output = "html") |>
  #   expect_equal(
  #     c(
  #       "15:35:00 GMT", "16:36:00 GMT", "17:37:00 GMT",
  #       "18:38:00 GMT", "19:39:00 GMT"
  #     )
  #   )
  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmsv", output = "plain")
  )

  # vec_fmt_time(times, time_style = "Hmv", output = "html") |>
  #   expect_equal(c("15:35 GMT", "16:36 GMT", "17:37 GMT", "18:38 GMT", "19:39 GMT"))
  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Hmv", output = "plain")
  )

  vec_fmt_time(times, time_style = "hms", output = "html") |>
    expect_equal(c("3:35:00 PM", "4:36:00 PM", "5:37:00 PM", "6:38:00 PM", "7:39:00 PM"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hms", output = "plain")
  )

  vec_fmt_time(times, time_style = "hm", output = "html") |>
    expect_equal(c("3:35 PM", "4:36 PM", "5:37 PM", "6:38 PM", "7:39 PM"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hm", output = "plain")
  )

  vec_fmt_time(times, time_style = "h", output = "html") |>
    expect_equal(c("3 PM", "4 PM", "5 PM", "6 PM", "7 PM"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "h", output = "html"),
    vec_fmt_time(as.character(times), time_style = "h", output = "plain")
  )

  vec_fmt_time(times, time_style = "Ehm", output = "html") |>
    expect_equal(
      c(
        "Thu 3:35 PM", "Thu 4:36 PM", "Thu 5:37 PM",
        "Thu 6:38 PM", "Thu 7:39 PM"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehm", output = "plain")
  )

  vec_fmt_time(times, time_style = "Ehms", output = "html") |>
    expect_equal(
      c(
        "Thu 3:35:00 PM", "Thu 4:36:00 PM", "Thu 5:37:00 PM",
        "Thu 6:38:00 PM", "Thu 7:39:00 PM"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Ehms", output = "plain")
  )

  vec_fmt_time(times, time_style = "EBhms", output = "html") |>
    expect_equal(
      c(
        "Thu 3:35:00 in the afternoon", "Thu 4:36:00 in the afternoon",
        "Thu 5:37:00 in the afternoon", "Thu 6:38:00 in the evening",
        "Thu 7:39:00 in the evening"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhms", output = "plain")
  )

  vec_fmt_time(times, time_style = "Bhms", output = "html") |>
    expect_equal(
      c(
        "3:35:00 in the afternoon", "4:36:00 in the afternoon",
        "5:37:00 in the afternoon", "6:38:00 in the evening",
        "7:39:00 in the evening"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhms", output = "plain")
  )

  vec_fmt_time(times, time_style = "EBhm", output = "html") |>
    expect_equal(
      c(
        "Thu 3:35 in the afternoon", "Thu 4:36 in the afternoon",
        "Thu 5:37 in the afternoon", "Thu 6:38 in the evening",
        "Thu 7:39 in the evening"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "EBhm", output = "plain")
  )

  vec_fmt_time(times, time_style = "Bhm", output = "html") |>
    expect_equal(
      c(
        "3:35 in the afternoon", "4:36 in the afternoon",
        "5:37 in the afternoon", "6:38 in the evening",
        "7:39 in the evening"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bhm", output = "plain")
  )

  vec_fmt_time(times, time_style = "Bh", output = "html") |>
    expect_equal(
      c(
        "3 in the afternoon", "4 in the afternoon", "5 in the afternoon",
        "6 in the evening", "7 in the evening"
      )
    )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bh", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bh", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bh", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bh", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "Bh", output = "html"),
    vec_fmt_time(as.character(times), time_style = "Bh", output = "plain")
  )

  # vec_fmt_time(times, time_style = "hmsv", output = "html") |>
  #   expect_equal(
  #     c(
  #       "3:35:00 PM GMT", "4:36:00 PM GMT", "5:37:00 PM GMT",
  #       "6:38:00 PM GMT", "7:39:00 PM GMT"
  #     )
  #   )
  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmsv", output = "plain")
  )

  # vec_fmt_time(times, time_style = "hmv", output = "html") |>
  #   expect_equal(
  #     c(
  #       "3:35 PM GMT", "4:36 PM GMT", "5:37 PM GMT",
  #       "6:38 PM GMT", "7:39 PM GMT"
  #     )
  #   )
  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmv", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmv", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "hmv", output = "html"),
    vec_fmt_time(as.character(times), time_style = "hmv", output = "plain")
  )

  vec_fmt_time(times, time_style = "ms", output = "html") |>
    expect_equal(c("35:00", "36:00", "37:00", "38:00", "39:00"))

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "ms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "ms", output = "latex")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "ms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "ms", output = "rtf")
  )

  expect_equal(
    vec_fmt_time(as.character(times), time_style = "ms", output = "html"),
    vec_fmt_time(as.character(times), time_style = "ms", output = "plain")
  )

  vec_fmt_time(times, time_style = "EHm", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "jeu. 15:35", "jeu. 16:36", "jeu. 17:37", "jeu. 18:38", "jeu. 19:39"
      )
    )

  vec_fmt_time(dates, time_style = "EBhms", locale = "fr", output = "html") |>
    expect_equal(
      c(
        "dim. 12:00:00 minuit", "sam. 12:00:00 minuit", "lun. 12:00:00 minuit",
        "sam. 12:00:00 minuit", "jeu. 12:00:00 minuit"
      )
    )

  vec_fmt_time(
    times,
    time_style = "Bhms",
    pattern = "d{x}d",
    output = "html"
  ) |>
    expect_equal(
      c(
        "d3:35:00 in the afternoond", "d4:36:00 in the afternoond",
        "d5:37:00 in the afternoond", "d6:38:00 in the eveningd",
        "d7:39:00 in the eveningd"
      )
    )
})

test_that("vec_fmt_datetime() works", {

  vec_fmt_datetime(
    datetimes,
    date_style = 2,
    time_style = 1,
    output = "html"
  ) |>
    expect_equal(
      c(
        "Sunday, January 5, 2020 15:35:00",
        "Saturday, February 6, 2021 16:36:01",
        "Monday, March 7, 2022 17:37:02",
        "Saturday, April 8, 2023 18:38:03",
        "Thursday, May 9, 2024 19:39:04"
      )
    )

  vec_fmt_datetime(
    datetimes,
    date_style = "wday_month_day_year",
    time_style = "iso",
    output = "html"
  ) |>
    expect_equal(
      c(
        "Sunday, January 5, 2020 15:35:00",
        "Saturday, February 6, 2021 16:36:01",
        "Monday, March 7, 2022 17:37:02",
        "Saturday, April 8, 2023 18:38:03",
        "Thursday, May 9, 2024 19:39:04"
      )
    )

  expect_equal(
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "html"
    ),
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "latex"
    )
  )

  expect_equal(
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "html"
    ),
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "rtf"
    )
  )

  expect_equal(
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "html"
    ),
    vec_fmt_datetime(
      datetimes,
      date_style = "wday_month_day_year",
      time_style = "iso",
      output = "plain"
    )
  )

  vec_fmt_datetime(
    datetimes,
    date_style = "yMMMEd",
    time_style = "Hms",
    output = "html"
  ) |>
    expect_equal(
      c(
        "Sun, Jan 5, 2020 15:35:00",
        "Sat, Feb 6, 2021 16:36:01",
        "Mon, Mar 7, 2022 17:37:02",
        "Sat, Apr 8, 2023 18:38:03",
        "Thu, May 9, 2024 19:39:04"
      )
    )

  vec_fmt_datetime(
    datetimes,
    date_style = "yMMMEd",
    time_style = "Hms",
    locale = "fr",
    output = "html"
  ) |>
    expect_equal(
      c(
        "dim. 5 janv. 2020 15:35:00",
        "sam. 6 févr. 2021 16:36:01",
        "lun. 7 mars 2022 17:37:02",
        "sam. 8 avr. 2023 18:38:03",
        "jeu. 9 mai 2024 19:39:04"
      )
    )

  vec_fmt_datetime(
    datetimes,
    date_style = 3,
    time_style = 3,
    sep = " / ",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Sun, Jan 5, 2020 / 3:35:00 PM", "Sat, Feb 6, 2021 / 4:36:01 PM",
        "Mon, Mar 7, 2022 / 5:37:02 PM", "Sat, Apr 8, 2023 / 6:38:03 PM",
        "Thu, May 9, 2024 / 7:39:04 PM"
      )
    )

  vec_fmt_datetime(
    datetimes,
    format = "EEEE, MMMM d, y, h:mm a",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Sunday, January 5, 2020, 3:35 PM",
        "Saturday, February 6, 2021, 4:36 PM",
        "Monday, March 7, 2022, 5:37 PM",
        "Saturday, April 8, 2023, 6:38 PM",
        "Thursday, May 9, 2024, 7:39 PM"
      )
    )

  vec_fmt_datetime(
    datetimes,
    format = "EEEE, MMMM d, y, h:mm a",
    pattern = "[ {x} ]",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "[ Sunday, January 5, 2020, 3:35 PM ]",
        "[ Saturday, February 6, 2021, 4:36 PM ]",
        "[ Monday, March 7, 2022, 5:37 PM ]",
        "[ Saturday, April 8, 2023, 6:38 PM ]",
        "[ Thursday, May 9, 2024, 7:39 PM ]"
      )
    )

  vec_fmt_datetime(
    datetimes,
    format = "EEEE, MMMM d, y, h:mm a",
    locale = "fr",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "dimanche, janvier 5, 2020, 3:35 PM",
        "samedi, février 6, 2021, 4:36 PM",
        "lundi, mars 7, 2022, 5:37 PM",
        "samedi, avril 8, 2023, 6:38 PM",
        "jeudi, mai 9, 2024, 7:39 PM"
      )
    )

  # Create a short vector with string-based datetime values
  str_vals <- c("2022-06-13 18:36", "2019-01-25 01:08", NA)

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM",
        "Friday, January 25, 2019, 1:08 AM",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM",
        "Friday, January 25, 2019, 1:08 AM",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (ZZZ)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (-0400)",
        "Friday, January 25, 2019, 1:08 AM (-0500)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (V)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (cator)",
        "Friday, January 25, 2019, 1:08 AM (cator)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (VV)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (America/Toronto)",
        "Friday, January 25, 2019, 1:08 AM (America/Toronto)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (VVV)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (Toronto)",
        "Friday, January 25, 2019, 1:08 AM (Toronto)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (VVVV)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (Toronto Time)",
        "Friday, January 25, 2019, 1:08 AM (Toronto Time)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (v)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (ET)",
        "Friday, January 25, 2019, 1:08 AM (ET)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (vvvv)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (Eastern Time)",
        "Friday, January 25, 2019, 1:08 AM (Eastern Time)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (O)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (GMT-4)",
        "Friday, January 25, 2019, 1:08 AM (GMT-5)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (OOOO)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (GMT-04:00)",
        "Friday, January 25, 2019, 1:08 AM (GMT-05:00)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (z)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (EDT)",
        "Friday, January 25, 2019, 1:08 AM (EST)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (zzzz)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (Eastern Daylight Time)",
        "Friday, January 25, 2019, 1:08 AM (Eastern Standard Time)",
        NA
      )
    )

  vec_fmt_datetime(
    str_vals,
    format = "EEEE, MMMM d, y, h:mm a (Z)",
    tz = "America/Toronto",
    output = "plain"
  ) |>
    expect_equal(
      c(
        "Monday, June 13, 2022, 6:36 PM (-0400)",
        "Friday, January 25, 2019, 1:08 AM (-0500)",
        NA
      )
    )
})

test_that("vec_fmt_duration() function works", {
  tm <- as.difftime(c("0:3:20"))
  # tests are mostly duplicates of `fmt_duration()`
  expect_equal(
    vec_fmt_duration(tm),
    "3m 20s"
  )
})

test_that("vec_fmt_*() error when bad input are supplied.", {

  expect_error(vec_fmt_number(letters))
  expect_error(vec_fmt_number(TRUE))
  expect_error(vec_fmt_number(list(1, 2, 3)))
  expect_error(vec_fmt_number(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_integer(letters))
  expect_error(vec_fmt_integer(TRUE))
  expect_error(vec_fmt_integer(list(1, 2, 3)))
  expect_error(vec_fmt_integer(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_scientific(letters))
  expect_error(vec_fmt_scientific(TRUE))
  expect_error(vec_fmt_scientific(list(1, 2, 3)))
  expect_error(vec_fmt_scientific(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_engineering(letters))
  expect_error(vec_fmt_engineering(TRUE))
  expect_error(vec_fmt_engineering(list(1, 2, 3)))
  expect_error(vec_fmt_engineering(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_percent(letters))
  expect_error(vec_fmt_percent(TRUE))
  expect_error(vec_fmt_percent(list(1, 2, 3)))
  expect_error(vec_fmt_percent(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_partsper(letters))
  expect_error(vec_fmt_partsper(TRUE))
  expect_error(vec_fmt_partsper(list(1, 2, 3)))
  expect_error(vec_fmt_partsper(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_fraction(letters))
  expect_error(vec_fmt_fraction(TRUE))
  expect_error(vec_fmt_fraction(list(1, 2, 3)))
  expect_error(vec_fmt_fraction(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_currency(letters))
  expect_error(vec_fmt_currency(TRUE))
  expect_error(vec_fmt_currency(list(1, 2, 3)))
  expect_error(vec_fmt_currency(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_roman(letters))
  expect_error(vec_fmt_roman(TRUE))
  expect_error(vec_fmt_roman(list(1, 2, 3)))
  expect_error(vec_fmt_roman(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_index(letters))
  expect_error(vec_fmt_index(TRUE))
  expect_error(vec_fmt_index(list(1, 2, 3)))
  expect_error(vec_fmt_index(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_spelled_num(letters))
  expect_error(vec_fmt_spelled_num(TRUE))
  expect_error(vec_fmt_spelled_num(list(1, 2, 3)))
  expect_error(vec_fmt_spelled_num(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_bytes(letters))
  expect_error(vec_fmt_bytes(TRUE))
  expect_error(vec_fmt_bytes(list(1, 2, 3)))
  expect_error(vec_fmt_bytes(dplyr::tibble(a = c(1, 2, 3))))

  expect_error(vec_fmt_duration(letters))
  expect_error(vec_fmt_duration(TRUE))
  expect_error(vec_fmt_duration(list(1, 2, 3)))
  expect_error(vec_fmt_duration(dplyr::tibble(a = c(1, 2, 3))))
})

test_that("check_vector_valid() works correctly", {

  expect_null(check_vector_valid(1))
  expect_null(check_vector_valid(list()))

  expect_snapshot(error = TRUE, {
    check_vector_valid(1, "integer")
    check_vector_valid(TRUE, c("numeric", "integer"))
    check_vector_valid(data.frame(x = 1), c("numeric", "integer"))
  })
})
