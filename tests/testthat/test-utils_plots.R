test_that("Value stream processing produces the correct numeric vectors", {

    num_stream_01 <- "1 2 3 4 5  6"
    num_stream_02 <- "1;2;3;4;5;6"
    num_stream_03 <- "1,2,3,4,5,6"
    num_stream_04 <- "1, 2 3 4; 5,6 "
    num_stream_05 <- "1.2 2.3 3.34 4.1 5 6"
    num_stream_06 <- "1.2 2.3 3.34 4.1 5.23 6.233232"
    num_stream_07 <- "-1.2 2.3 +3.34 4.1 -5.23 6.22"
    num_stream_08 <- "-1.2E-05 2.3E2 +3.34 4.1e-1 -5.23 -6.2e4"
    num_stream_09 <- "(-1.2E-05 2.3E2 +3.34 4.1e-1 -5.23 -6.2e4)"
    num_stream_10 <- "c(-1.2E-05 2.3E2 +3.34 4.1e-1 -5.23 -6.2e4)"
    num_stream_11 <- "[-1.2E-05 2.3E2 +3.34 4.1e-1 -5.23 -6.2e4]"
    num_stream_12 <- "[ -1.2E-05  2.3E2 +3.34  4.1e-1   -5.23  -6.2e4 ]"
    num_stream_13 <- "[ -1.2E-05,  2.3E2, +3.34,  4.1e-1,   -5.23,  -6.2e4 ]"
    num_stream_14 <- "1 2 3 4 5 NA 6"
    num_stream_15 <- "1,2,3,4,5,NA,6"
    num_stream_16 <- "NA -1.2E-05 2.3E2 +3.34 4.1e-1 -5.23 -6.2e4"
    num_stream_17 <- "NA -1.2E-05 2.3E2 NA +3.34 NA 4.1e-1 NA -5.23 NA -6.2e4 NA"

    expect_equal(
      process_number_stream(num_stream_01),
      c(1, 2, 3, 4, 5, 6)
    )
    expect_equal(
      process_number_stream(num_stream_02),
      c(1, 2, 3, 4, 5, 6)
    )
    expect_equal(
      process_number_stream(num_stream_03),
      c(1, 2, 3, 4, 5, 6)
    )
    expect_equal(
      process_number_stream(num_stream_04),
      c(1, 2, 3, 4, 5, 6)
    )
    expect_equal(
      process_number_stream(num_stream_05),
      c(1.2, 2.3, 3.34, 4.1, 5, 6)
    )
    expect_equal(
      process_number_stream(num_stream_06),
      c(1.2, 2.3, 3.34, 4.1, 5.23, 6.233232)
    )
    expect_equal(
      process_number_stream(num_stream_07),
      c(-1.2, 2.3, 3.34, 4.1, -5.23, 6.22)
    )
    expect_equal(
      process_number_stream(num_stream_08),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_09),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_10),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_11),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_12),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_13),
      c(-1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_14),
      c(1, 2, 3, 4, 5, NA, 6)
    )
    expect_equal(
      process_number_stream(num_stream_15),
      c(1, 2, 3, 4, 5, NA, 6)
    )
    expect_equal(
      process_number_stream(num_stream_16),
      c(NA, -1.2e-05, 230, 3.34, 0.41, -5.23, -62000)
    )
    expect_equal(
      process_number_stream(num_stream_17),
      c(NA, -1.2e-05, 230, NA, 3.34, NA, 0.41, NA, -5.23, NA, -62000, NA)
    )

    time_stream_01 <- "2000-02-24 02:03:58, 2000-02-25 15:24:04, 2000-02-26 00:23:26"
    time_stream_02 <- "2000-02-24 02:03:58,2000-02-25 15:24:04,   2000-02-26 00:23:26"
    time_stream_03 <- "2000-02-24 02:03:58;2000-02-25 15:24:04 ; 2000-02-26 00:23:26"
    time_stream_04 <- "2000-02-24T02:03:58,2000-02-25T15:24:04, 2000-02-26T00:23:26"
    time_stream_05 <- "2000-02-24 02:03:58,2000-02-25, 2000-02-25 00:00, 2000-02-25 00:00:00, 2000-02-26T00:23:26"

    expect_equal(
      process_time_stream(time_stream_01),
      c(
        `2000-02-24 02:03:58` = 951357838,
        `2000-02-25 15:24:04` = 951492244,
        `2000-02-26 00:23:26` = 951524606
      )
    )
    expect_equal(
      process_time_stream(time_stream_02),
      c(
        `2000-02-24 02:03:58` = 951357838,
        `2000-02-25 15:24:04` = 951492244,
        `2000-02-26 00:23:26` = 951524606
      )
    )
    expect_equal(
      process_time_stream(time_stream_03),
      c(
        `2000-02-24 02:03:58` = 951357838,
        `2000-02-25 15:24:04` = 951492244,
        `2000-02-26 00:23:26` = 951524606
      )
    )
    expect_equal(
      process_time_stream(time_stream_04),
      c(
        `2000-02-24 02:03:58` = 951357838,
        `2000-02-25 15:24:04` = 951492244,
        `2000-02-26 00:23:26` = 951524606
      )
    )
    expect_equal(
      process_time_stream(time_stream_05),
      c(
        `2000-02-24 02:03:58` = 951350400,
        `2000-02-25` = 951436800,
        `2000-02-25 00:00` = 951436800,
        `2000-02-25 00:00:00` = 951436800,
        `2000-02-26 00:23:26` = 951523200
      )
    )
})

test_that("format_number_compactly() works well", {

  values <-
    c(
      0, NA, NaN, Inf, -Inf, 1, -1, 10, -10, 0.234, -0.432, 0.142537342, -0.36342342,
      1.243 * 10^seq(1, 15), 6.257363 * 10^seq(-1, -15),
      0.0000000024200240024240, 0.0000000000000000007, 23492879275207850274,
      239472947294782.2947829427, 23947294729478229478.29427
    )

  values_fmt <- character(length = length(values))
  for (i in seq_along(values)) {
    values_fmt[i] <- format_number_compactly(val = values[i])
  }

  expect_equal(
    values_fmt,
    c(
      "0", "NA", "NA", "Inf", "−Inf", "1.00", "−1.00", "10.0",
      "−10.0", "0.23", "−0.43", "0.14", "−0.36", "12.4", "124",
      "1.24K", "12.4K", "124K", "1.24M", "12.4M", "124M", "1.24B",
      "12.4B", "124B", "1.24T", "12.4T", "124T", "1.2E15", "0.63",
      "0.063", "6.3E−03", "6.3E−04", "6.3E−05", "6.3E−06",
      "6.3E−07", "6.3E−08", "6.3E−09", "6.3E−10", "6.3E−11",
      "6.3E−12", "6.3E−13", "6.3E−14", "6.3E−15", "2.4E−09",
      "7.0E−19", "2.3E19", "239T", "2.4E19"
    )
  )

  values_fmt_curr <- character(length = length(values))
  for (i in seq_along(values)) {
    values_fmt_curr[i] <- format_number_compactly(val = values[i], currency = "EUR")
  }

  expect_equal(
    values_fmt_curr,
    c(
      "0", "NA", "NA", ">&#8364;1,000T", ">&#8364;1,000T", "&#8364;1.00",
      "−&#8364;1.00", "&#8364;10.00", "−&#8364;10.00", "&#8364;0.23",
      "−&#8364;0.43", "&#8364;0.14", "−&#8364;0.36", "&#8364;12.43",
      "&#8364;124.30", "&#8364;1.24K", "&#8364;12.4K", "&#8364;124K",
      "&#8364;1.2M", "&#8364;12.4M", "&#8364;124.3M", "&#8364;1.2B",
      "&#8364;12.4B", "&#8364;124.3B", "&#8364;1.2T", "&#8364;12.4T",
      "&#8364;124.3T", ">&#8364;1,000T", "&#8364;0.63", "&#8364;0.06",
      "&#8364;0.01", "&#8364;0.00", "&#8364;0.00", "&#8364;0.00",
      "&#8364;0.00", "&#8364;0.00", "&#8364;0.00", "&#8364;0.00",
      "&#8364;0.00", "&#8364;0.00", "&#8364;0.00", "&#8364;0.00",
      "&#8364;0.00", "&#8364;0.00", "&#8364;0.00", ">&#8364;1,000T",
      "&#8364;239.5T", ">&#8364;1,000T"
    )
  )
})
