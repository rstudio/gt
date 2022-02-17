skip_on_cran()

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

test_that("The `x_number()` function works", {

  x_number(vec_num_1) %>%
    expect_equal(
      c(
        "&minus;2.50", "&minus;2.00", "&minus;1.50", "&minus;1.00",
        "&minus;0.50", "0.00", "0.50", "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  x_number(vec_num_1, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50$", "$-2.00$", "$-1.50$", "$-1.00$", "$-0.50$", "$0.00$",
        "$0.50$", "$1.00$", "$1.50$", "$2.00$", "$2.50$", "NA", "$Inf$"
      )
    )

  x_number(vec_num_1, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00", "0.50",
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  x_number(vec_num_6, decimals = 4) %>%
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000", "0.6000",
        "0.7000", "0.8000", "0.9000", "1.0000", "1.1000", "1.2000", "1.3000",
        "1.4000", "1.5000", "1.6000", "1.7000", "1.8000", "1.9000", "2.0000"
      )
    )

  x_number(vec_num_6, decimals = 4, output = "latex") %>%
    expect_equal(
      c(
        "$0.0000$", "$0.1000$", "$0.2000$", "$0.3000$", "$0.4000$", "$0.5000$",
        "$0.6000$", "$0.7000$", "$0.8000$", "$0.9000$", "$1.0000$", "$1.1000$",
        "$1.2000$", "$1.3000$", "$1.4000$", "$1.5000$", "$1.6000$", "$1.7000$",
        "$1.8000$", "$1.9000$", "$2.0000$"
      )
    )

  x_number(vec_num_6, decimals = 4, output = "rtf") %>%
    expect_equal(
      c(
        "0.0000", "0.1000", "0.2000", "0.3000", "0.4000", "0.5000", "0.6000",
        "0.7000", "0.8000", "0.9000", "1.0000", "1.1000", "1.2000", "1.3000",
        "1.4000", "1.5000", "1.6000", "1.7000", "1.8000", "1.9000", "2.0000"
      )
    )

  x_number(vec_num_1, drop_trailing_zeros = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.5", "&minus;2", "&minus;1.5", "&minus;1", "&minus;0.5",
        "0", "0.5", "1", "1.5", "2", "2.5", "NA", "Inf"
      )
    )

  x_number(vec_num_1, drop_trailing_zeros = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.5$", "$-2$", "$-1.5$", "$-1$", "$-0.5$", "$0$", "$0.5$",
        "$1$", "$1.5$", "$2$", "$2.5$", "NA", "$Inf$"
      )
    )

  x_number(vec_num_1, drop_trailing_zeros = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.5", "-2", "-1.5", "-1", "-0.5", "0", "0.5", "1", "1.5",
        "2", "2.5", "NA", "Inf"
      )
    )

  x_number(vec_num_1, n_sigfig = 3) %>%
    expect_equal(
      c(
        "&minus;2.50", "&minus;2.00", "&minus;1.50", "&minus;1.00",
        "&minus;0.500", "0", "0.500", "1.00", "1.50", "2.00", "2.50",
        "NA", " Inf"
      )
    )

  x_number(vec_num_1, n_sigfig = 3, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50$", "$-2.00$", "$-1.50$", "$-1.00$", "$-0.500$", "$0$",
        "$0.500$", "$1.00$", "$1.50$", "$2.00$", "$2.50$", "NA", "$ Inf$"
      )
    )

  x_number(vec_num_1, n_sigfig = 3, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.500", "0", "0.500",
        "1.00", "1.50", "2.00", "2.50", "NA", " Inf"
      )
    )

  x_number(vec_num_4, use_seps = FALSE) %>%
    expect_equal(
      c(
        "&minus;2500000.00", "&minus;2000000.00", "&minus;1500000.00",
        "&minus;1000000.00", "&minus;500000.00", "0.00", "500000.00",
        "1000000.00", "1500000.00", "2000000.00", "2500000.00", "NA",
        "Inf"
      )
    )

  x_number(vec_num_4, use_seps = FALSE, output = "latex") %>%
    expect_equal(
      c(
        "$-2500000.00$", "$-2000000.00$", "$-1500000.00$", "$-1000000.00$",
        "$-500000.00$", "$0.00$", "$500000.00$", "$1000000.00$", "$1500000.00$",
        "$2000000.00$", "$2500000.00$", "NA", "$Inf$"
      )
    )

  x_number(vec_num_4, use_seps = FALSE, output = "rtf") %>%
    expect_equal(
      c(
        "-2500000.00", "-2000000.00", "-1500000.00", "-1000000.00",
        "-500000.00", "0.00", "500000.00", "1000000.00", "1500000.00",
        "2000000.00", "2500000.00", "NA", "Inf"
      )
    )

  x_number(vec_num_1, accounting = TRUE) %>%
    expect_equal(
      c(
        "(2.50)", "(2.00)", "(1.50)", "(1.00)", "(0.50)", "0.00", "0.50",
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf"
      )
    )

  x_number(vec_num_1, accounting = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$(2.50)$", "$(2.00)$", "$(1.50)$", "$(1.00)$", "$(0.50)$",
        "$0.00$", "$0.50$", "$1.00$", "$1.50$", "$2.00$", "$2.50$", "NA",
        "$Inf$"
      )
    )

  x_number(vec_num_4, accounting = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "(2,500,000.00)", "(2,000,000.00)", "(1,500,000.00)", "(1,000,000.00)",
        "(500,000.00)", "0.00", "500,000.00", "1,000,000.00", "1,500,000.00",
        "2,000,000.00", "2,500,000.00", "NA", "Inf"
      )
    )

  x_number(vec_num_1, scale_by = 2.5) %>%
    expect_equal(
      c(
        "&minus;6.25", "&minus;5.00", "&minus;3.75", "&minus;2.50",
        "&minus;1.25", "0.00", "1.25", "2.50", "3.75", "5.00", "6.25",
        "NA", "Inf"
      )
    )

  x_number(vec_num_1, scale_by = 2.5, output = "latex") %>%
    expect_equal(
      c(
        "$-6.25$", "$-5.00$", "$-3.75$", "$-2.50$", "$-1.25$", "$0.00$",
        "$1.25$", "$2.50$", "$3.75$", "$5.00$", "$6.25$", "NA", "$Inf$"
      )
    )

  x_number(vec_num_1, scale_by = 2.5, output = "rtf") %>%
    expect_equal(
      c(
        "-6.25", "-5.00", "-3.75", "-2.50", "-1.25", "0.00", "1.25",
        "2.50", "3.75", "5.00", "6.25", "NA", "Inf"
      )
    )

  x_number(vec_num_4, locale = "de") %>%
    expect_equal(
      c(
        "&minus;2.500.000,00", "&minus;2.000.000,00", "&minus;1.500.000,00",
        "&minus;1.000.000,00", "&minus;500.000,00", "0,00", "500.000,00",
        "1.000.000,00", "1.500.000,00", "2.000.000,00", "2.500.000,00",
        "NA", "Inf"
      )
    )

  x_number(vec_num_4, locale = "de", output = "latex") %>%
    expect_equal(
      c(
        "$-2.500.000,00$", "$-2.000.000,00$", "$-1.500.000,00$", "$-1.000.000,00$",
        "$-500.000,00$", "$0,00$", "$500.000,00$", "$1.000.000,00$",
        "$1.500.000,00$", "$2.000.000,00$", "$2.500.000,00$", "NA", "$Inf$"
      )
    )

  x_number(vec_num_4, locale = "de", output = "rtf") %>%
    expect_equal(
      c(
        "-2.500.000,00", "-2.000.000,00", "-1.500.000,00", "-1.000.000,00",
        "-500.000,00", "0,00", "500.000,00", "1.000.000,00", "1.500.000,00",
        "2.000.000,00", "2.500.000,00", "NA", "Inf"
      )
    )

  x_number(vec_num_4, suffixing = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.50M", "&minus;2.00M", "&minus;1.50M", "&minus;1.00M",
        "&minus;500.00K", "0.00", "500.00K", "1.00M", "1.50M", "2.00M",
        "2.50M", "NA", "InfT"
      )
    )

  x_number(vec_num_4, suffixing = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50M$", "$-2.00M$", "$-1.50M$", "$-1.00M$", "$-500.00K$",
        "$0.00$", "$500.00K$", "$1.00M$", "$1.50M$", "$2.00M$", "$2.50M$",
        "NA", "$InfT$"
      )
    )

  x_number(vec_num_4, suffixing = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50M", "-2.00M", "-1.50M", "-1.00M", "-500.00K", "0.00",
        "500.00K", "1.00M", "1.50M", "2.00M", "2.50M", "NA", "InfT"
      )
    )

  x_number(vec_num_1, pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a&minus;2.50b", "a&minus;2.00b", "a&minus;1.50b", "a&minus;1.00b",
        "a&minus;0.50b", "a0.00b", "a0.50b", "a1.00b", "a1.50b", "a2.00b",
        "a2.50b", "NA", "aInfb"
      )
    )

  x_number(vec_num_1, pattern = "a{x}b", output = "latex") %>%
    expect_equal(
      c(
        "a$-2.50$b", "a$-2.00$b", "a$-1.50$b", "a$-1.00$b", "a$-0.50$b",
        "a$0.00$b", "a$0.50$b", "a$1.00$b", "a$1.50$b", "a$2.00$b", "a$2.50$b",
        "NA", "a$Inf$b"
      )
    )

  x_number(vec_num_1, pattern = "a{x}b", output = "rtf") %>%
    expect_equal(
      c(
        "a-2.50b", "a-2.00b", "a-1.50b", "a-1.00b", "a-0.50b", "a0.00b",
        "a0.50b", "a1.00b", "a1.50b", "a2.00b", "a2.50b", "NA", "aInfb"
      )
    )

  x_number(vec_num_1, force_sign = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.50", "&minus;2.00", "&minus;1.50", "&minus;1.00",
        "&minus;0.50", "0.00", "+0.50", "+1.00", "+1.50", "+2.00", "+2.50",
        "NA", "+Inf"
      )
    )

  x_number(vec_num_1, force_sign = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50$", "$-2.00$", "$-1.50$", "$-1.00$", "$-0.50$", "$0.00$",
        "$+0.50$", "$+1.00$", "$+1.50$", "$+2.00$", "$+2.50$", "NA", "$+Inf$"
      )
    )

  x_number(vec_num_1, force_sign = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-0.50", "0.00", "+0.50",
        "+1.00", "+1.50", "+2.00", "+2.50", "NA", "+Inf"
      )
    )

  expect_equal(x_number(numeric(0)), character(0))
  expect_equal(x_number(integer(0)), character(0))

  expect_error(x_number(letters))
  expect_error(x_number(TRUE))
  expect_error(x_number(list(1, 2, 3)))
  expect_error(x_number(dplyr::tibble(a = c(1, 2, 3))))
})

test_that("The `x_integer()` function works", {

  x_integer(vec_num_1) %>%
    expect_equal(
      c(
        "&minus;2", "&minus;2", "&minus;2", "&minus;1", "0", "0", "0",
        "1", "2", "2", "2", "NA", "Inf"
      )
    )

  x_integer(vec_num_1, output = "latex") %>%
    expect_equal(
      c(
        "$-2$", "$-2$", "$-2$", "$-1$", "$0$", "$0$", "$0$", "$1$",
        "$2$", "$2$", "$2$", "NA", "$Inf$"
      )
    )

  x_integer(vec_num_1, output = "rtf") %>%
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "0", "1", "2", "2", "2",
        "NA", "Inf"
      )
    )

  x_integer(vec_num_4, locale = "de") %>%
    expect_equal(
      c(
        "&minus;2.500.000", "&minus;2.000.000", "&minus;1.500.000",
        "&minus;1.000.000", "&minus;500.000", "0", "500.000", "1.000.000",
        "1.500.000", "2.000.000", "2.500.000", "NA", "Inf"
      )
    )

  x_integer(vec_num_4, locale = "de", output = "latex") %>%
    expect_equal(
      c(
        "$-2.500.000$", "$-2.000.000$", "$-1.500.000$", "$-1.000.000$",
        "$-500.000$", "$0$", "$500.000$", "$1.000.000$", "$1.500.000$",
        "$2.000.000$", "$2.500.000$", "NA", "$Inf$"
      )
    )

  x_integer(vec_num_4, locale = "de", output = "rtf") %>%
    expect_equal(
      c(
        "-2.500.000", "-2.000.000", "-1.500.000", "-1.000.000", "-500.000",
        "0", "500.000", "1.000.000", "1.500.000", "2.000.000", "2.500.000",
        "NA", "Inf"
      )
    )

  x_integer(vec_num_4, suffixing = TRUE) %>%
    expect_equal(
      c(
        "&minus;2M", "&minus;2M", "&minus;2M", "&minus;1M", "&minus;500K",
        "0", "500K", "1M", "2M", "2M", "2M", "NA", "InfT"
      )
    )

  x_integer(vec_num_4, suffixing = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2M$", "$-2M$", "$-2M$", "$-1M$", "$-500K$", "$0$", "$500K$",
        "$1M$", "$2M$", "$2M$", "$2M$", "NA", "$InfT$"
      )
    )

  x_integer(vec_num_4, suffixing = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2M", "-2M", "-2M", "-1M", "-500K", "0", "500K", "1M", "2M",
        "2M", "2M", "NA", "InfT"
      )
    )

  x_integer(vec_num_1, pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a&minus;2b", "a&minus;2b", "a&minus;2b", "a&minus;1b", "a0b",
        "a0b", "a0b", "a1b", "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  x_integer(vec_num_1, pattern = "a{x}b", output = "latex") %>%
    expect_equal(
      c(
        "a$-2$b", "a$-2$b", "a$-2$b", "a$-1$b", "a$0$b", "a$0$b", "a$0$b",
        "a$1$b", "a$2$b", "a$2$b", "a$2$b", "NA", "a$Inf$b"
      )
    )

  x_integer(vec_num_1, pattern = "a{x}b", output = "rtf") %>%
    expect_equal(
      c(
        "a-2b", "a-2b", "a-2b", "a-1b", "a0b", "a0b", "a0b", "a1b",
        "a2b", "a2b", "a2b", "NA", "aInfb"
      )
    )

  x_integer(vec_num_1, force_sign = TRUE) %>%
    expect_equal(
      c(
        "&minus;2", "&minus;2", "&minus;2", "&minus;1", "0", "0", "+0",
        "+1", "+2", "+2", "+2", "NA", "+Inf"
      )
    )

  x_integer(vec_num_1, force_sign = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2$", "$-2$", "$-2$", "$-1$", "$0$", "$0$", "$+0$", "$+1$",
        "$+2$", "$+2$", "$+2$", "NA", "$+Inf$"
      )
    )

  x_integer(vec_num_1, force_sign = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2", "-2", "-2", "-1", "0", "0", "+0", "+1", "+2", "+2", "+2",
        "NA", "+Inf"
      )
    )

  expect_equal(x_integer(numeric(0)), character(0))
  expect_equal(x_integer(integer(0)), character(0))

  expect_error(x_integer(letters))
  expect_error(x_integer(TRUE))
  expect_error(x_integer(list(1, 2, 3)))
  expect_error(x_integer(dplyr::tibble(a = c(1, 2, 3))))
})

test_that("The `x_scientific()` function works", {

  # TODO: `x_scientifc()` and `fmt_scientific()` are incompatible with
  # Inf values so we will omit them from the test vectors until a fix is
  # available

  vec_num_1_m <- vec_num_1[-13]
  vec_num_4_m <- vec_num_4[-13]

  x_scientific(vec_num_1_m) %>%
    expect_equal(
      c(
        "&minus;2.50", "&minus;2.00", "&minus;1.50", "&minus;1.00",
        "&minus;5.00 &times; 10<sup class='gt_super'>&minus;1</sup>",
        "0.00", "5.00 &times; 10<sup class='gt_super'>&minus;1</sup>",
        "1.00", "1.50", "2.00", "2.50", "NA"
      )
    )

  x_scientific(vec_num_1_m, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50$", "$-2.00$", "$-1.50$", "$-1.00$", "$-5.00 \\times 10^{-1}$",
        "$0.00$", "$5.00 \\times 10^{-1}$", "$1.00$", "$1.50$", "$2.00$",
        "$2.50$", "NA"
      )
    )

  x_scientific(vec_num_1_m, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-5.00 \\'d7 10{\\super -1}",
        "0.00", "5.00 \\'d7 10{\\super -1}", "1.00", "1.50", "2.00",
        "2.50", "NA"
      )
    )

  x_scientific(vec_num_4_m) %>%
    expect_equal(
      c(
        "&minus;2.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;5.00 &times; 10<sup class='gt_super'>5</sup>", "0.00",
        "5.00 &times; 10<sup class='gt_super'>5</sup>", "1.00 &times; 10<sup class='gt_super'>6</sup>",
        "1.50 &times; 10<sup class='gt_super'>6</sup>", "2.00 &times; 10<sup class='gt_super'>6</sup>",
        "2.50 &times; 10<sup class='gt_super'>6</sup>", "NA"
      )
    )

  x_scientific(vec_num_4_m, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50 \\times 10^{6}$", "$-2.00 \\times 10^{6}$", "$-1.50 \\times 10^{6}$",
        "$-1.00 \\times 10^{6}$", "$-5.00 \\times 10^{5}$", "$0.00$",
        "$5.00 \\times 10^{5}$", "$1.00 \\times 10^{6}$", "$1.50 \\times 10^{6}$",
        "$2.00 \\times 10^{6}$", "$2.50 \\times 10^{6}$", "NA"
      )
    )

  x_scientific(vec_num_4_m, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-5.00 \\'d7 10{\\super 5}", "0.00",
        "5.00 \\'d7 10{\\super 5}", "1.00 \\'d7 10{\\super 6}", "1.50 \\'d7 10{\\super 6}",
        "2.00 \\'d7 10{\\super 6}", "2.50 \\'d7 10{\\super 6}", "NA"
      )
    )

  # TODO: `x_scientifc()` and `fmt_scientific()` both error when
  # `drop_trailing_zeros = TRUE`; omit these test until a fix is available
  # x_scientific(vec_num_4_m, drop_trailing_zeros = TRUE) %>%
  #   expect_equal(
  #     c(
  #     )
  #   )
  #
  # x_scientific(vec_num_1, drop_trailing_zeros = TRUE, output = "latex") %>%
  #   expect_equal(
  #     c(
  #     )
  #   )
  #
  # x_scientific(vec_num_1, drop_trailing_zeros = TRUE, output = "rtf") %>%
  #   expect_equal(
  #     c(
  #     )
  #   )


  x_scientific(vec_num_4_m, locale = "de") %>%
    expect_equal(
      c(
        "&minus;2,50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2,00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1,50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1,00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;5,00 &times; 10<sup class='gt_super'>5</sup>", "0,00",
        "5,00 &times; 10<sup class='gt_super'>5</sup>", "1,00 &times; 10<sup class='gt_super'>6</sup>",
        "1,50 &times; 10<sup class='gt_super'>6</sup>", "2,00 &times; 10<sup class='gt_super'>6</sup>",
        "2,50 &times; 10<sup class='gt_super'>6</sup>", "NA"
      )
    )

  x_scientific(vec_num_4_m, locale = "de", output = "latex") %>%
    expect_equal(
      c(
        "$-2,50 \\times 10^{6}$", "$-2,00 \\times 10^{6}$", "$-1,50 \\times 10^{6}$",
        "$-1,00 \\times 10^{6}$", "$-5,00 \\times 10^{5}$", "$0,00$",
        "$5,00 \\times 10^{5}$", "$1,00 \\times 10^{6}$", "$1,50 \\times 10^{6}$",
        "$2,00 \\times 10^{6}$", "$2,50 \\times 10^{6}$", "NA"
      )
    )

  x_scientific(vec_num_4_m, locale = "de", output = "rtf") %>%
    expect_equal(
      c(
        "-2,50 \\'d7 10{\\super 6}", "-2,00 \\'d7 10{\\super 6}", "-1,50 \\'d7 10{\\super 6}",
        "-1,00 \\'d7 10{\\super 6}", "-5,00 \\'d7 10{\\super 5}", "0,00",
        "5,00 \\'d7 10{\\super 5}", "1,00 \\'d7 10{\\super 6}", "1,50 \\'d7 10{\\super 6}",
        "2,00 \\'d7 10{\\super 6}", "2,50 \\'d7 10{\\super 6}", "NA"
      )
    )

  x_scientific(vec_num_4_m, pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a&minus;2.50 &times; 10<sup class='gt_super'>6</sup>b", "a&minus;2.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a&minus;1.50 &times; 10<sup class='gt_super'>6</sup>b", "a&minus;1.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a&minus;5.00 &times; 10<sup class='gt_super'>5</sup>b", "a0.00b",
        "a5.00 &times; 10<sup class='gt_super'>5</sup>b", "a1.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a1.50 &times; 10<sup class='gt_super'>6</sup>b", "a2.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a2.50 &times; 10<sup class='gt_super'>6</sup>b", "NA"
      )
    )

  x_scientific(vec_num_4_m, pattern = "a{x}b", output = "latex") %>%
    expect_equal(
      c(
        "a$-2.50 \\times 10^{6}$b", "a$-2.00 \\times 10^{6}$b", "a$-1.50 \\times 10^{6}$b",
        "a$-1.00 \\times 10^{6}$b", "a$-5.00 \\times 10^{5}$b", "a$0.00$b",
        "a$5.00 \\times 10^{5}$b", "a$1.00 \\times 10^{6}$b", "a$1.50 \\times 10^{6}$b",
        "a$2.00 \\times 10^{6}$b", "a$2.50 \\times 10^{6}$b", "NA"
      )
    )

  x_scientific(vec_num_4_m, pattern = "a{x}b", output = "rtf") %>%
    expect_equal(
      c(
        "a-2.50 \\'d7 10{\\super 6}b", "a-2.00 \\'d7 10{\\super 6}b",
        "a-1.50 \\'d7 10{\\super 6}b", "a-1.00 \\'d7 10{\\super 6}b",
        "a-5.00 \\'d7 10{\\super 5}b", "a0.00b", "a5.00 \\'d7 10{\\super 5}b",
        "a1.00 \\'d7 10{\\super 6}b", "a1.50 \\'d7 10{\\super 6}b", "a2.00 \\'d7 10{\\super 6}b",
        "a2.50 \\'d7 10{\\super 6}b", "NA"
      )
    )

  x_scientific(vec_num_4_m, force_sign = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;5.00 &times; 10<sup class='gt_super'>5</sup>", "0.00",
        "+5.00 &times; 10<sup class='gt_super'>5</sup>", "+1.00 &times; 10<sup class='gt_super'>6</sup>",
        "+1.50 &times; 10<sup class='gt_super'>6</sup>", "+2.00 &times; 10<sup class='gt_super'>6</sup>",
        "+2.50 &times; 10<sup class='gt_super'>6</sup>", "NA"
      )
    )

  x_scientific(vec_num_4_m, force_sign = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50 \\times 10^{6}$", "$-2.00 \\times 10^{6}$", "$-1.50 \\times 10^{6}$",
        "$-1.00 \\times 10^{6}$", "$-5.00 \\times 10^{5}$", "$0.00$",
        "$+5.00 \\times 10^{5}$", "$+1.00 \\times 10^{6}$", "$+1.50 \\times 10^{6}$",
        "$+2.00 \\times 10^{6}$", "$+2.50 \\times 10^{6}$", "NA"
      )
    )

  x_scientific(vec_num_4_m, force_sign = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-5.00 \\'d7 10{\\super 5}", "0.00",
        "+5.00 \\'d7 10{\\super 5}", "+1.00 \\'d7 10{\\super 6}", "+1.50 \\'d7 10{\\super 6}",
        "+2.00 \\'d7 10{\\super 6}", "+2.50 \\'d7 10{\\super 6}", "NA"
      )
    )

  expect_equal(x_scientific(numeric(0)), character(0))
  expect_equal(x_scientific(integer(0)), character(0))

  expect_error(x_scientific(letters))
  expect_error(x_scientific(TRUE))
  expect_error(x_scientific(list(1, 2, 3)))
  expect_error(x_scientific(dplyr::tibble(a = c(1, 2, 3))))
})

test_that("The `x_engineering()` function works", {

  x_engineering(vec_num_1) %>%
    expect_equal(
      c(
        "&minus;2.50", "&minus;2.00", "&minus;1.50", "&minus;1.00",
        "&minus;500.00 &times; 10<sup class='gt_super'>&minus;3</sup>",
        "0.00", "500.00 &times; 10<sup class='gt_super'>&minus;3</sup>",
        "1.00", "1.50", "2.00", "2.50", "NA", "Inf."
      )
    )

  x_engineering(vec_num_1, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50$", "$-2.00$", "$-1.50$", "$-1.00$", "$-500.00 \\times 10^{-3}$",
        "$0.00$", "$500.00 \\times 10^{-3}$", "$1.00$", "$1.50$", "$2.00$",
        "$2.50$", "NA", "$Inf.$"
      )
    )

  x_engineering(vec_num_1, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50", "-2.00", "-1.50", "-1.00", "-500.00 \\'d7 10{\\super -3}",
        "0.00", "500.00 \\'d7 10{\\super -3}", "1.00", "1.50", "2.00",
        "2.50", "NA", "Inf."
      )
    )

  x_engineering(vec_num_4) %>%
    expect_equal(
      c(
        "&minus;2.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;500.00 &times; 10<sup class='gt_super'>3</sup>", "0.00",
        "500.00 &times; 10<sup class='gt_super'>3</sup>", "1.00 &times; 10<sup class='gt_super'>6</sup>",
        "1.50 &times; 10<sup class='gt_super'>6</sup>", "2.00 &times; 10<sup class='gt_super'>6</sup>",
        "2.50 &times; 10<sup class='gt_super'>6</sup>", "NA", "Inf."
      )
    )

  x_engineering(vec_num_4, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50 \\times 10^{6}$", "$-2.00 \\times 10^{6}$", "$-1.50 \\times 10^{6}$",
        "$-1.00 \\times 10^{6}$", "$-500.00 \\times 10^{3}$", "$0.00$",
        "$500.00 \\times 10^{3}$", "$1.00 \\times 10^{6}$", "$1.50 \\times 10^{6}$",
        "$2.00 \\times 10^{6}$", "$2.50 \\times 10^{6}$", "NA", "$Inf.$"
      )
    )

  x_engineering(vec_num_4, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-500.00 \\'d7 10{\\super 3}", "0.00",
        "500.00 \\'d7 10{\\super 3}", "1.00 \\'d7 10{\\super 6}", "1.50 \\'d7 10{\\super 6}",
        "2.00 \\'d7 10{\\super 6}", "2.50 \\'d7 10{\\super 6}", "NA",
        "Inf."
      )
    )

  x_engineering(vec_num_5) %>%
    expect_equal(
      c(
        "&minus;2.50 &times; 10<sup class='gt_super'>12</sup>", "&minus;2.00 &times; 10<sup class='gt_super'>12</sup>",
        "&minus;1.50 &times; 10<sup class='gt_super'>12</sup>", "&minus;1.00 &times; 10<sup class='gt_super'>12</sup>",
        "&minus;500.00 &times; 10<sup class='gt_super'>9</sup>", "0.00",
        "500.00 &times; 10<sup class='gt_super'>9</sup>", "1.00 &times; 10<sup class='gt_super'>12</sup>",
        "1.50 &times; 10<sup class='gt_super'>12</sup>", "2.00 &times; 10<sup class='gt_super'>12</sup>",
        "2.50 &times; 10<sup class='gt_super'>12</sup>", "NA", "Inf."
      )
    )

  x_engineering(vec_num_5, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50 \\times 10^{12}$", "$-2.00 \\times 10^{12}$", "$-1.50 \\times 10^{12}$",
        "$-1.00 \\times 10^{12}$", "$-500.00 \\times 10^{9}$", "$0.00$",
        "$500.00 \\times 10^{9}$", "$1.00 \\times 10^{12}$", "$1.50 \\times 10^{12}$",
        "$2.00 \\times 10^{12}$", "$2.50 \\times 10^{12}$", "NA", "$Inf.$"
      )
    )

  x_engineering(vec_num_5, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 12}", "-2.00 \\'d7 10{\\super 12}",
        "-1.50 \\'d7 10{\\super 12}", "-1.00 \\'d7 10{\\super 12}", "-500.00 \\'d7 10{\\super 9}",
        "0.00", "500.00 \\'d7 10{\\super 9}", "1.00 \\'d7 10{\\super 12}",
        "1.50 \\'d7 10{\\super 12}", "2.00 \\'d7 10{\\super 12}", "2.50 \\'d7 10{\\super 12}",
        "NA", "Inf."
      )
    )

  x_engineering(vec_num_4, drop_trailing_zeros = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.5 &times; 10<sup class='gt_super'>6</sup>", "&minus;2. &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1.5 &times; 10<sup class='gt_super'>6</sup>", "&minus;1. &times; 10<sup class='gt_super'>6</sup>",
        "&minus;500. &times; 10<sup class='gt_super'>3</sup>", "0.",
        "500. &times; 10<sup class='gt_super'>3</sup>", "1. &times; 10<sup class='gt_super'>6</sup>",
        "1.5 &times; 10<sup class='gt_super'>6</sup>", "2. &times; 10<sup class='gt_super'>6</sup>",
        "2.5 &times; 10<sup class='gt_super'>6</sup>", "NA", "Inf."
      )
    )

  x_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.5 \\times 10^{6}$", "$-2. \\times 10^{6}$", "$-1.5 \\times 10^{6}$",
        "$-1. \\times 10^{6}$", "$-500. \\times 10^{3}$", "$0.$", "$500. \\times 10^{3}$",
        "$1. \\times 10^{6}$", "$1.5 \\times 10^{6}$", "$2. \\times 10^{6}$",
        "$2.5 \\times 10^{6}$", "NA", "$Inf.$"
      )
    )

  x_engineering(vec_num_4, drop_trailing_zeros = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.5 \\'d7 10{\\super 6}", "-2. \\'d7 10{\\super 6}", "-1.5 \\'d7 10{\\super 6}",
        "-1. \\'d7 10{\\super 6}", "-500. \\'d7 10{\\super 3}", "0.",
        "500. \\'d7 10{\\super 3}", "1. \\'d7 10{\\super 6}", "1.5 \\'d7 10{\\super 6}",
        "2. \\'d7 10{\\super 6}", "2.5 \\'d7 10{\\super 6}", "NA", "Inf."
      )
    )


  x_engineering(vec_num_4, locale = "de") %>%
    expect_equal(
      c(
        "&minus;2,50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2,00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1,50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1,00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;500,00 &times; 10<sup class='gt_super'>3</sup>", "0,00",
        "500,00 &times; 10<sup class='gt_super'>3</sup>", "1,00 &times; 10<sup class='gt_super'>6</sup>",
        "1,50 &times; 10<sup class='gt_super'>6</sup>", "2,00 &times; 10<sup class='gt_super'>6</sup>",
        "2,50 &times; 10<sup class='gt_super'>6</sup>", "NA", "Inf,"
      )
    )

  x_engineering(vec_num_4, locale = "de", output = "latex") %>%
    expect_equal(
      c(
        "$-2,50 \\times 10^{6}$", "$-2,00 \\times 10^{6}$", "$-1,50 \\times 10^{6}$",
        "$-1,00 \\times 10^{6}$", "$-500,00 \\times 10^{3}$", "$0,00$",
        "$500,00 \\times 10^{3}$", "$1,00 \\times 10^{6}$", "$1,50 \\times 10^{6}$",
        "$2,00 \\times 10^{6}$", "$2,50 \\times 10^{6}$", "NA", "$Inf,$"
      )
    )

  x_engineering(vec_num_4, locale = "de", output = "rtf") %>%
    expect_equal(
      c(
        "-2,50 \\'d7 10{\\super 6}", "-2,00 \\'d7 10{\\super 6}", "-1,50 \\'d7 10{\\super 6}",
        "-1,00 \\'d7 10{\\super 6}", "-500,00 \\'d7 10{\\super 3}", "0,00",
        "500,00 \\'d7 10{\\super 3}", "1,00 \\'d7 10{\\super 6}", "1,50 \\'d7 10{\\super 6}",
        "2,00 \\'d7 10{\\super 6}", "2,50 \\'d7 10{\\super 6}", "NA",
        "Inf,"
      )
    )

  x_engineering(vec_num_4, pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a&minus;2.50 &times; 10<sup class='gt_super'>6</sup>b", "a&minus;2.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a&minus;1.50 &times; 10<sup class='gt_super'>6</sup>b", "a&minus;1.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a&minus;500.00 &times; 10<sup class='gt_super'>3</sup>b", "a0.00b",
        "a500.00 &times; 10<sup class='gt_super'>3</sup>b", "a1.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a1.50 &times; 10<sup class='gt_super'>6</sup>b", "a2.00 &times; 10<sup class='gt_super'>6</sup>b",
        "a2.50 &times; 10<sup class='gt_super'>6</sup>b", "NA", "aInf.b"
      )
    )

  x_engineering(vec_num_4, pattern = "a{x}b", output = "latex") %>%
    expect_equal(
      c(
        "a$-2.50 \\times 10^{6}$b", "a$-2.00 \\times 10^{6}$b", "a$-1.50 \\times 10^{6}$b",
        "a$-1.00 \\times 10^{6}$b", "a$-500.00 \\times 10^{3}$b", "a$0.00$b",
        "a$500.00 \\times 10^{3}$b", "a$1.00 \\times 10^{6}$b", "a$1.50 \\times 10^{6}$b",
        "a$2.00 \\times 10^{6}$b", "a$2.50 \\times 10^{6}$b", "NA", "a$Inf.$b"
      )
    )

  x_engineering(vec_num_4, pattern = "a{x}b", output = "rtf") %>%
    expect_equal(
      c(
        "a-2.50 \\'d7 10{\\super 6}b", "a-2.00 \\'d7 10{\\super 6}b",
        "a-1.50 \\'d7 10{\\super 6}b", "a-1.00 \\'d7 10{\\super 6}b",
        "a-500.00 \\'d7 10{\\super 3}b", "a0.00b", "a500.00 \\'d7 10{\\super 3}b",
        "a1.00 \\'d7 10{\\super 6}b", "a1.50 \\'d7 10{\\super 6}b", "a2.00 \\'d7 10{\\super 6}b",
        "a2.50 \\'d7 10{\\super 6}b", "NA", "aInf.b"
      )
    )

  x_engineering(vec_num_4, force_sign = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;2.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;1.50 &times; 10<sup class='gt_super'>6</sup>", "&minus;1.00 &times; 10<sup class='gt_super'>6</sup>",
        "&minus;500.00 &times; 10<sup class='gt_super'>3</sup>", "0.00",
        "+500.00 &times; 10<sup class='gt_super'>3</sup>", "+1.00 &times; 10<sup class='gt_super'>6</sup>",
        "+1.50 &times; 10<sup class='gt_super'>6</sup>", "+2.00 &times; 10<sup class='gt_super'>6</sup>",
        "+2.50 &times; 10<sup class='gt_super'>6</sup>", "NA", "+Inf."
      )
    )

  x_engineering(vec_num_4, force_sign = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50 \\times 10^{6}$", "$-2.00 \\times 10^{6}$", "$-1.50 \\times 10^{6}$",
        "$-1.00 \\times 10^{6}$", "$-500.00 \\times 10^{3}$", "$0.00$",
        "$+500.00 \\times 10^{3}$", "$+1.00 \\times 10^{6}$", "$+1.50 \\times 10^{6}$",
        "$+2.00 \\times 10^{6}$", "$+2.50 \\times 10^{6}$", "NA", "$+Inf.$"
      )
    )

  x_engineering(vec_num_4, force_sign = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50 \\'d7 10{\\super 6}", "-2.00 \\'d7 10{\\super 6}", "-1.50 \\'d7 10{\\super 6}",
        "-1.00 \\'d7 10{\\super 6}", "-500.00 \\'d7 10{\\super 3}", "0.00",
        "+500.00 \\'d7 10{\\super 3}", "+1.00 \\'d7 10{\\super 6}", "+1.50 \\'d7 10{\\super 6}",
        "+2.00 \\'d7 10{\\super 6}", "+2.50 \\'d7 10{\\super 6}", "NA",
        "+Inf."
      )
    )

  expect_equal(x_engineering(numeric(0)), character(0))
  expect_equal(x_engineering(integer(0)), character(0))

  expect_error(x_engineering(letters))
  expect_error(x_engineering(TRUE))
  expect_error(x_engineering(list(1, 2, 3)))
  expect_error(x_engineering(dplyr::tibble(a = c(1, 2, 3))))
})


test_that("The `x_percent()` function works", {

  x_percent(vec_num_1) %>%
    expect_equal(
      c(
        "&minus;250.00%", "&minus;200.00%", "&minus;150.00%", "&minus;100.00%",
        "&minus;50.00%", "0.00%", "50.00%", "100.00%", "150.00%", "200.00%",
        "250.00%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, output = "latex") %>%
    expect_equal(
      c(
        "$-250.00\\%$", "$-200.00\\%$", "$-150.00\\%$", "$-100.00\\%$",
        "$-50.00\\%$", "$0.00\\%$", "$50.00\\%$", "$100.00\\%$", "$150.00\\%$",
        "$200.00\\%$", "$250.00\\%$", "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_1, output = "rtf") %>%
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "50.00%", "100.00%", "150.00%", "200.00%", "250.00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, decimals = 4) %>%
    expect_equal(
      c(
        "&minus;250.0000%", "&minus;200.0000%", "&minus;150.0000%",
        "&minus;100.0000%", "&minus;50.0000%", "0.0000%", "50.0000%",
        "100.0000%", "150.0000%", "200.0000%", "250.0000%", "NA", "  Inf%"
      )
    )

  x_percent(vec_num_1, decimals = 4, output = "latex") %>%
    expect_equal(
      c(
        "$-250.0000\\%$", "$-200.0000\\%$", "$-150.0000\\%$", "$-100.0000\\%$",
        "$-50.0000\\%$", "$0.0000\\%$", "$50.0000\\%$", "$100.0000\\%$",
        "$150.0000\\%$", "$200.0000\\%$", "$250.0000\\%$", "NA", "$  Inf\\%$"
      )
    )

  x_percent(vec_num_1, decimals = 4, output = "rtf") %>%
    expect_equal(
      c(
        "-250.0000%", "-200.0000%", "-150.0000%", "-100.0000%", "-50.0000%",
        "0.0000%", "50.0000%", "100.0000%", "150.0000%", "200.0000%",
        "250.0000%", "NA", "  Inf%"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE) %>%
    expect_equal(
      c(
        "&minus;2.50%", "&minus;2.00%", "&minus;1.50%", "&minus;1.00%",
        "&minus;0.50%", "0.00%", "0.50%", "1.00%", "1.50%", "2.00%",
        "2.50%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.50\\%$", "$-2.00\\%$", "$-1.50\\%$", "$-1.00\\%$", "$-0.50\\%$",
        "$0.00\\%$", "$0.50\\%$", "$1.00\\%$", "$1.50\\%$", "$2.00\\%$",
        "$2.50\\%$", "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.50%", "-2.00%", "-1.50%", "-1.00%", "-0.50%", "0.00%",
        "0.50%", "1.00%", "1.50%", "2.00%", "2.50%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE, drop_trailing_zeros = TRUE) %>%
    expect_equal(
      c(
        "&minus;2.5%", "&minus;2%", "&minus;1.5%", "&minus;1%", "&minus;0.5%",
        "0%", "0.5%", "1%", "1.5%", "2%", "2.5%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE, drop_trailing_zeros = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-2.5\\%$", "$-2\\%$", "$-1.5\\%$", "$-1\\%$", "$-0.5\\%$",
        "$0\\%$", "$0.5\\%$", "$1\\%$", "$1.5\\%$", "$2\\%$", "$2.5\\%$",
        "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_1, scale_values = FALSE, drop_trailing_zeros = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-2.5%", "-2%", "-1.5%", "-1%", "-0.5%", "0%", "0.5%", "1%",
        "1.5%", "2%", "2.5%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_4, use_seps = FALSE) %>%
    expect_equal(
      c(
        "&minus;250000000.00%", "&minus;200000000.00%", "&minus;150000000.00%",
        "&minus;100000000.00%", "&minus;50000000.00%", "0.00%", "50000000.00%",
        "100000000.00%", "150000000.00%", "200000000.00%", "250000000.00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_4, use_seps = FALSE, output = "latex") %>%
    expect_equal(
      c(
        "$-250000000.00\\%$", "$-200000000.00\\%$", "$-150000000.00\\%$",
        "$-100000000.00\\%$", "$-50000000.00\\%$", "$0.00\\%$", "$50000000.00\\%$",
        "$100000000.00\\%$", "$150000000.00\\%$", "$200000000.00\\%$",
        "$250000000.00\\%$", "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_4, use_seps = FALSE, output = "rtf") %>%
    expect_equal(
      c(
        "-250000000.00%", "-200000000.00%", "-150000000.00%", "-100000000.00%",
        "-50000000.00%", "0.00%", "50000000.00%", "100000000.00%", "150000000.00%",
        "200000000.00%", "250000000.00%", "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, accounting = TRUE) %>%
    expect_equal(
      c(
        "(250.00%)", "(200.00%)", "(150.00%)", "(100.00%)", "(50.00%)",
        "0.00%", "50.00%", "100.00%", "150.00%", "200.00%", "250.00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, accounting = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$(250.00\\%)$", "$(200.00\\%)$", "$(150.00\\%)$", "$(100.00\\%)$",
        "$(50.00\\%)$", "$0.00\\%$", "$50.00\\%$", "$100.00\\%$", "$150.00\\%$",
        "$200.00\\%$", "$250.00\\%$", "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_4, accounting = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "(250,000,000.00%)", "(200,000,000.00%)", "(150,000,000.00%)",
        "(100,000,000.00%)", "(50,000,000.00%)", "0.00%", "50,000,000.00%",
        "100,000,000.00%", "150,000,000.00%", "200,000,000.00%", "250,000,000.00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_4, locale = "de") %>%
    expect_equal(
      c(
        "&minus;250.000.000,00%", "&minus;200.000.000,00%", "&minus;150.000.000,00%",
        "&minus;100.000.000,00%", "&minus;50.000.000,00%", "0,00%", "50.000.000,00%",
        "100.000.000,00%", "150.000.000,00%", "200.000.000,00%", "250.000.000,00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_4, locale = "de", output = "latex") %>%
    expect_equal(
      c(
        "$-250.000.000,00\\%$", "$-200.000.000,00\\%$", "$-150.000.000,00\\%$",
        "$-100.000.000,00\\%$", "$-50.000.000,00\\%$", "$0,00\\%$", "$50.000.000,00\\%$",
        "$100.000.000,00\\%$", "$150.000.000,00\\%$", "$200.000.000,00\\%$",
        "$250.000.000,00\\%$", "NA", "$Inf\\%$"
      )
    )

  x_percent(vec_num_4, locale = "de", output = "rtf") %>%
    expect_equal(
      c(
        "-250.000.000,00%", "-200.000.000,00%", "-150.000.000,00%",
        "-100.000.000,00%", "-50.000.000,00%", "0,00%", "50.000.000,00%",
        "100.000.000,00%", "150.000.000,00%", "200.000.000,00%", "250.000.000,00%",
        "NA", "Inf%"
      )
    )

  x_percent(vec_num_1, pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a&minus;250.00%b", "a&minus;200.00%b", "a&minus;150.00%b",
        "a&minus;100.00%b", "a&minus;50.00%b", "a0.00%b", "a50.00%b",
        "a100.00%b", "a150.00%b", "a200.00%b", "a250.00%b", "NA", "aInf%b"
      )
    )

  x_percent(vec_num_1, pattern = "a{x}b", output = "latex") %>%
    expect_equal(
      c(
        "a$-250.00\\%$b", "a$-200.00\\%$b", "a$-150.00\\%$b", "a$-100.00\\%$b",
        "a$-50.00\\%$b", "a$0.00\\%$b", "a$50.00\\%$b", "a$100.00\\%$b",
        "a$150.00\\%$b", "a$200.00\\%$b", "a$250.00\\%$b", "NA", "a$Inf\\%$b"
      )
    )

  x_percent(vec_num_1, pattern = "a{x}b", output = "rtf") %>%
    expect_equal(
      c(
        "a-250.00%b", "a-200.00%b", "a-150.00%b", "a-100.00%b", "a-50.00%b",
        "a0.00%b", "a50.00%b", "a100.00%b", "a150.00%b", "a200.00%b",
        "a250.00%b", "NA", "aInf%b"
      )
    )

  x_percent(vec_num_1, force_sign = TRUE) %>%
    expect_equal(
      c(
        "&minus;250.00%", "&minus;200.00%", "&minus;150.00%", "&minus;100.00%",
        "&minus;50.00%", "0.00%", "+50.00%", "+100.00%", "+150.00%",
        "+200.00%", "+250.00%", "NA", "+Inf%"
      )
    )

  x_percent(vec_num_1, force_sign = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-250.00\\%$", "$-200.00\\%$", "$-150.00\\%$", "$-100.00\\%$",
        "$-50.00\\%$", "$0.00\\%$", "$+50.00\\%$", "$+100.00\\%$", "$+150.00\\%$",
        "$+200.00\\%$", "$+250.00\\%$", "NA", "$+Inf\\%$"
      )
    )

  x_percent(vec_num_1, force_sign = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-250.00%", "-200.00%", "-150.00%", "-100.00%", "-50.00%",
        "0.00%", "+50.00%", "+100.00%", "+150.00%", "+200.00%", "+250.00%",
        "NA", "+Inf%"
      )
    )

  x_percent(vec_num_1, placement = "left") %>%
    expect_equal(
      c(
        "&minus;%250.00", "&minus;%200.00", "&minus;%150.00", "&minus;%100.00",
        "&minus;%50.00", "%0.00", "%50.00", "%100.00", "%150.00", "%200.00",
        "%250.00", "NA", "%Inf"
      )
    )

  x_percent(vec_num_1, placement = "left", output = "latex") %>%
    expect_equal(
      c(
        "$-\\%250.00$", "$-\\%200.00$", "$-\\%150.00$", "$-\\%100.00$",
        "$-\\%50.00$", "$\\%0.00$", "$\\%50.00$", "$\\%100.00$", "$\\%150.00$",
        "$\\%200.00$", "$\\%250.00$", "NA", "$\\%Inf$"
      )
    )

  x_percent(vec_num_1, placement = "left", output = "rtf") %>%
    expect_equal(
      c(
        "-%250.00", "-%200.00", "-%150.00", "-%100.00", "-%50.00",
        "%0.00", "%50.00", "%100.00", "%150.00", "%200.00", "%250.00",
        "NA", "%Inf"
      )
    )

  x_percent(vec_num_1, incl_space = TRUE) %>%
    expect_equal(
      c(
        "&minus;250.00 %", "&minus;200.00 %", "&minus;150.00 %", "&minus;100.00 %",
        "&minus;50.00 %", "0.00 %", "50.00 %", "100.00 %", "150.00 %",
        "200.00 %", "250.00 %", "NA", "Inf %"
      )
    )

  x_percent(vec_num_1, incl_space = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-250.00 \\%$", "$-200.00 \\%$", "$-150.00 \\%$", "$-100.00 \\%$",
        "$-50.00 \\%$", "$0.00 \\%$", "$50.00 \\%$", "$100.00 \\%$",
        "$150.00 \\%$", "$200.00 \\%$", "$250.00 \\%$", "NA", "$Inf \\%$"
      )
    )

  x_percent(vec_num_1, incl_space = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-250.00 %", "-200.00 %", "-150.00 %", "-100.00 %", "-50.00 %",
        "0.00 %", "50.00 %", "100.00 %", "150.00 %", "200.00 %", "250.00 %",
        "NA", "Inf %"
      )
    )

  x_percent(vec_num_1, placement = "left", incl_space = TRUE) %>%
    expect_equal(
      c(
        "&minus;% 250.00", "&minus;% 200.00", "&minus;% 150.00", "&minus;% 100.00",
        "&minus;% 50.00", "% 0.00", "% 50.00", "% 100.00", "% 150.00",
        "% 200.00", "% 250.00", "NA", "% Inf"
      )
    )

  x_percent(vec_num_1, placement = "left", incl_space = TRUE, output = "latex") %>%
    expect_equal(
      c(
        "$-\\% 250.00$", "$-\\% 200.00$", "$-\\% 150.00$", "$-\\% 100.00$",
        "$-\\% 50.00$", "$\\% 0.00$", "$\\% 50.00$", "$\\% 100.00$",
        "$\\% 150.00$", "$\\% 200.00$", "$\\% 250.00$", "NA", "$\\% Inf$"
      )
    )

  x_percent(vec_num_1, placement = "left", incl_space = TRUE, output = "rtf") %>%
    expect_equal(
      c(
        "-% 250.00", "-% 200.00", "-% 150.00", "-% 100.00", "-% 50.00",
        "% 0.00", "% 50.00", "% 100.00", "% 150.00", "% 200.00", "% 250.00",
        "NA", "% Inf"
      )
    )

  expect_equal(x_percent(numeric(0)), character(0))
  expect_equal(x_percent(integer(0)), character(0))

  expect_error(x_percent(letters))
  expect_error(x_percent(TRUE))
  expect_error(x_percent(list(1, 2, 3)))
  expect_error(x_percent(dplyr::tibble(a = c(1, 2, 3))))
})

# x_fraction <- function(
#     x,
#     accuracy = NULL,
#     simplify = TRUE,
#     layout = c("diagonal", "inline"),
#     use_seps = TRUE,
#     pattern = "{x}",
#     sep_mark = ",",
#     locale = NULL,
#     output = c("html", "latex", "rtf")

# range_0_1 <- c(0.0001, 0.001, 0.01, 0.1, 0.25, 0.4, 0.5, 0.6, 0.75, 0.9, 0.99, 0.999, 0.9999)
# range_0_1_minus <- range_0_1 * -1
# range_1_2 <- range_0_1 + 1
# range_1_2_minus <- range_0_1_minus - 1
# exact_numbers <- c(-1, 0, 1)
# not_numbers <- c(NA_real_, NaN, Inf, -Inf)

test_that("The `x_fraction()` function works", {

  x_fraction(range_0_1) %>%
    expect_equal(
      c(
        "0", "0", "0", "<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>",
        "<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "<span class=\"gt_fraction_numerator\">8</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "1", "1", "1"
      )
    )

  x_fraction(range_0_1, output = "latex") %>%
    expect_equal(
      c(
        "$0$", "$0$", "$0$", "${{}^{1}\\!/_{9}}$", "${{}^{1}\\!/_{4}}$",
        "${{}^{2}\\!/_{5}}$", "${{}^{1}\\!/_{2}}$", "${{}^{3}\\!/_{5}}$",
        "${{}^{3}\\!/_{4}}$", "${{}^{8}\\!/_{9}}$", "$1$", "$1$", "$1$"
      )
    )

  x_fraction(range_0_1, output = "rtf") %>%
    expect_equal(
      c(
        "0", "0", "0", "{\\super 1}/{\\sub 9}", "{\\super 1}/{\\sub 4}",
        "{\\super 2}/{\\sub 5}", "{\\super 1}/{\\sub 2}", "{\\super 3}/{\\sub 5}",
        "{\\super 3}/{\\sub 4}", "{\\super 8}/{\\sub 9}", "1", "1", "1"
      )
    )

  x_fraction(range_0_1_minus) %>%
    expect_equal(
      c(
        "0", "0", "0", "&minus;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "&minus;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "&minus;<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "&minus;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>",
        "&minus;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "&minus;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "&minus;<span class=\"gt_fraction_numerator\">8</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "&minus;1", "&minus;1", "&minus;1"
      )
    )

  x_fraction(range_0_1_minus, output = "latex") %>%
    expect_equal(
      c(
        "$0$", "$0$", "$0$", "$-{{}^{1}\\!/_{9}}$", "$-{{}^{1}\\!/_{4}}$",
        "$-{{}^{2}\\!/_{5}}$", "$-{{}^{1}\\!/_{2}}$", "$-{{}^{3}\\!/_{5}}$",
        "$-{{}^{3}\\!/_{4}}$", "$-{{}^{8}\\!/_{9}}$", "$-1$", "$-1$",
        "$-1$"
      )
    )

  x_fraction(range_0_1_minus, output = "rtf") %>%
    expect_equal(
      c(
        "0", "0", "0", "-{\\super 1}/{\\sub 9}", "-{\\super 1}/{\\sub 4}",
        "-{\\super 2}/{\\sub 5}", "-{\\super 1}/{\\sub 2}", "-{\\super 3}/{\\sub 5}",
        "-{\\super 3}/{\\sub 4}", "-{\\super 8}/{\\sub 9}", "-1", "-1",
        "-1"
      )
    )

  x_fraction(range_1_2) %>%
    expect_equal(
      c(
        "1", "1", "1", "1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "1&#8239;<span class=\"gt_fraction_numerator\">8</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "2", "2", "2"
      )
    )

  x_fraction(range_1_2, output = "latex") %>%
    expect_equal(
      c(
        "$1$", "$1$", "$1$", "$1\\, {{}^{1}\\!/_{9}}$", "$1\\, {{}^{1}\\!/_{4}}$",
        "$1\\, {{}^{2}\\!/_{5}}$", "$1\\, {{}^{1}\\!/_{2}}$", "$1\\, {{}^{3}\\!/_{5}}$",
        "$1\\, {{}^{3}\\!/_{4}}$", "$1\\, {{}^{8}\\!/_{9}}$", "$2$",
        "$2$", "$2$"
      )
    )

  x_fraction(range_1_2, output = "rtf") %>%
    expect_equal(
      c(
        "1", "1", "1", "1{\\super 1}/{\\sub 9}", "1{\\super 1}/{\\sub 4}",
        "1{\\super 2}/{\\sub 5}", "1{\\super 1}/{\\sub 2}", "1{\\super 3}/{\\sub 5}",
        "1{\\super 3}/{\\sub 4}", "1{\\super 8}/{\\sub 9}", "2", "2",
        "2"
      )
    )

  x_fraction(range_1_2_minus) %>%
    expect_equal(
      c(
        "&minus;1", "&minus;1", "&minus;1", "&minus;1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">3</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">4</span>",
        "&minus;1&#8239;<span class=\"gt_fraction_numerator\">8</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">9</span>",
        "&minus;2", "&minus;2", "&minus;2"
      )
    )

  x_fraction(range_1_2_minus, output = "latex") %>%
    expect_equal(
      c(
        "$-1$", "$-1$", "$-1$", "$-1\\, {{}^{1}\\!/_{9}}$", "$-1\\, {{}^{1}\\!/_{4}}$",
        "$-1\\, {{}^{2}\\!/_{5}}$", "$-1\\, {{}^{1}\\!/_{2}}$", "$-1\\, {{}^{3}\\!/_{5}}$",
        "$-1\\, {{}^{3}\\!/_{4}}$", "$-1\\, {{}^{8}\\!/_{9}}$", "$-2$",
        "$-2$", "$-2$"
      )
    )

  x_fraction(range_1_2_minus, output = "rtf") %>%
    expect_equal(
      c(
        "-1", "-1", "-1", "-1{\\super 1}/{\\sub 9}", "-1{\\super 1}/{\\sub 4}",
        "-1{\\super 2}/{\\sub 5}", "-1{\\super 1}/{\\sub 2}", "-1{\\super 3}/{\\sub 5}",
        "-1{\\super 3}/{\\sub 4}", "-1{\\super 8}/{\\sub 9}", "-2", "-2",
        "-2"
      )
    )

  x_fraction(range_0_1, layout = "inline") %>%
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5", "3/4", "8/9",
        "1", "1", "1"
      )
    )

  x_fraction(range_0_1, layout = "inline", output = "latex") %>%
    expect_equal(
      c(
        "$0$", "$0$", "$0$", "$1/9$", "$1/4$", "$2/5$", "$1/2$", "$3/5$",
        "$3/4$", "$8/9$", "$1$", "$1$", "$1$"
      )
    )

  x_fraction(range_0_1, layout = "inline", output = "rtf") %>%
    expect_equal(
      c(
        "0", "0", "0", "1/9", "1/4", "2/5", "1/2", "3/5", "3/4", "8/9",
        "1", "1", "1"
      )
    )

  x_fraction(range_0_1_minus, layout = "inline") %>%
    expect_equal(
      c(
        "0", "0", "0", "&minus;1/9", "&minus;1/4", "&minus;2/5", "&minus;1/2",
        "&minus;3/5", "&minus;3/4", "&minus;8/9", "&minus;1", "&minus;1",
        "&minus;1"
      )
    )

  x_fraction(range_0_1_minus, layout = "inline", output = "latex") %>%
    expect_equal(
      c(
        "$0$", "$0$", "$0$", "$-1/9$", "$-1/4$", "$-2/5$", "$-1/2$",
        "$-3/5$", "$-3/4$", "$-8/9$", "$-1$", "$-1$", "$-1$"
      )
    )

  x_fraction(range_0_1_minus, layout = "inline", output = "rtf") %>%
    expect_equal(
      c(
        "0", "0", "0", "-1/9", "-1/4", "-2/5", "-1/2", "-3/5", "-3/4",
        "-8/9", "-1", "-1", "-1"
      )
    )

  x_fraction(range_1_2, layout = "inline") %>%
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  x_fraction(range_1_2, layout = "inline", output = "latex") %>%
    expect_equal(
      c(
        "$1$", "$1$", "$1$", "$1\\ 1/9$", "$1\\ 1/4$", "$1\\ 2/5$",
        "$1\\ 1/2$", "$1\\ 3/5$", "$1\\ 3/4$", "$1\\ 8/9$", "$2$", "$2$",
        "$2$"
      )
    )

  x_fraction(range_1_2, layout = "inline", output = "rtf") %>%
    expect_equal(
      c(
        "1", "1", "1", "1 1/9", "1 1/4", "1 2/5", "1 1/2", "1 3/5",
        "1 3/4", "1 8/9", "2", "2", "2"
      )
    )

  x_fraction(range_1_2_minus, layout = "inline") %>%
    expect_equal(
      c(
        "&minus;1", "&minus;1", "&minus;1", "&minus;1 1/9", "&minus;1 1/4",
        "&minus;1 2/5", "&minus;1 1/2", "&minus;1 3/5", "&minus;1 3/4",
        "&minus;1 8/9", "&minus;2", "&minus;2", "&minus;2"
      )
    )

  x_fraction(range_1_2_minus, layout = "inline", output = "latex") %>%
    expect_equal(
      c(
        "$-1$", "$-1$", "$-1$", "$-1\\ 1/9$", "$-1\\ 1/4$", "$-1\\ 2/5$",
        "$-1\\ 1/2$", "$-1\\ 3/5$", "$-1\\ 3/4$", "$-1\\ 8/9$", "$-2$",
        "$-2$", "$-2$"
      )
    )

  x_fraction(range_1_2_minus, layout = "inline", output = "rtf") %>%
    expect_equal(
      c(
        "-1", "-1", "-1", "-1 1/9", "-1 1/4", "-1 2/5", "-1 1/2", "-1 3/5",
        "-1 3/4", "-1 8/9", "-2", "-2", "-2"
      )
    )

  w_range <- sort(c(range_1_2_minus, range_0_1_minus, range_0_1, range_1_2))

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = "med") %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = "high") %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 1) %>%
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-2", "-2", "-1", "-1", "-1",
        "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "0",
        "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1",
        "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "2", "2",
        "2", "2", "2", "2", "2"
      )
    )

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 1, simplify = FALSE) %>%
    expect_equal(
      c(
        "-2", "-2", "-2", "-2", "-2", "-2", "-2", "-1", "-1", "-1",
        "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "-1", "0",
        "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "0", "1", "1",
        "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "2", "2",
        "2", "2", "2", "2", "2"
      )
    )

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 2) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 2, simplify = FALSE) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 3) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 3, simplify = FALSE) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 4) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 4, simplify = FALSE) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 10) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 10, simplify = FALSE) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 100) %>%
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

  x_fraction(w_range, layout = "inline", output = "rtf", accuracy = 100, simplify = FALSE) %>%
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

  x_fraction(c(5000.3, 10000.8)) %>%
    expect_equal(
      c(
        "5,000&#8239;<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">7</span>",
        "10,000&#8239;<span class=\"gt_fraction_numerator\">4</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>"
      )
    )

  x_fraction(c(5000.3, 10000.8), output = "latex") %>%
    expect_equal(c("$5,000\\, {{}^{2}\\!/_{7}}$", "$10,000\\, {{}^{4}\\!/_{5}}$"))

  x_fraction(c(5000.3, 10000.8), output = "rtf") %>%
    expect_equal(c("5,000{\\super 2}/{\\sub 7}", "10,000{\\super 4}/{\\sub 5}"))

  # TODO: With `use_seps = FALSE` we get the following warning that requires
  # a fix in `fmt_fraction()`:
  # In prettyNum(r, big.mark = big.mark, big.interval = big.interval,  :
  #                'big.mark' and 'decimal.mark' are both '', which could be confusing
  # x_fraction(c(5000.3, 10000.8), use_seps = FALSE) %>%
  #   expect_equal(
  #     c(
  #     )
  #   )
  #
  # x_fraction(c(5000.3, 10000.8), use_seps = FALSE, output = "latex") %>%
  #   expect_equal(c())
  #
  # x_fraction(c(5000.3, 10000.8), use_seps = FALSE, output = "rtf") %>%
  #   expect_equal(c())

  x_fraction(c(5000.3, 10000.8), sep_mark = ".") %>%
    expect_equal(
      c(
        "5.000&#8239;<span class=\"gt_fraction_numerator\">2</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">7</span>",
        "10.000&#8239;<span class=\"gt_fraction_numerator\">4</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">5</span>"
      )
    )

  x_fraction(c(5000.3, 10000.8), sep_mark = ".", output = "latex") %>%
    expect_equal(c("$5.000\\, {{}^{2}\\!/_{7}}$", "$10.000\\, {{}^{4}\\!/_{5}}$"))

  x_fraction(c(5000.3, 10000.8), sep_mark = ".", output = "rtf") %>%
    expect_equal(c("5.000{\\super 2}/{\\sub 7}", "10.000{\\super 4}/{\\sub 5}"))

  x_fraction(c(0.5, 1.5), pattern = "a{x}b") %>%
    expect_equal(
      c(
        "a<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>b",
        "a1&#8239;<span class=\"gt_fraction_numerator\">1</span><span class=\"gt_slash_mark\">&frasl;</span><span class=\"gt_fraction_denominator\">2</span>b"
      )
    )

  x_fraction(c(0.5, 1.5), pattern = "a{x}b", output = "latex") %>%
    expect_equal(c("a${{}^{1}\\!/_{2}}$b", "a$1\\, {{}^{1}\\!/_{2}}$b"))

  x_fraction(c(0.5, 1.5), pattern = "a{x}b", output = "rtf") %>%
    expect_equal(c("a{\\super 1}/{\\sub 2}b", "a1{\\super 1}/{\\sub 2}b"))

  x_fraction(c(0.5, 1.5), pattern = "a{x}b", layout = "inline") %>%
    expect_equal(c("a1/2b", "a1 1/2b"))

  x_fraction(c(0.5, 1.5), pattern = "a{x}b", layout = "inline", output = "latex") %>%
    expect_equal(c("a$1/2$b", "a$1\\ 1/2$b"))

  x_fraction(c(0.5, 1.5), pattern = "a{x}b", layout = "inline", output = "rtf") %>%
    expect_equal(c("a1/2b", "a1 1/2b"))

  x_fraction(exact_numbers) %>%
    expect_equal(c("&minus;1", "0", "1"))

  x_fraction(exact_numbers, output = "latex") %>%
    expect_equal(c("$-1$", "$0$", "$1$"))

  x_fraction(exact_numbers, output = "rtf") %>%
    expect_equal(c("-1", "0", "1"))

  x_fraction(exact_numbers, layout = "inline") %>%
    expect_equal(c("&minus;1", "0", "1"))

  x_fraction(exact_numbers, layout = "inline", output = "latex") %>%
    expect_equal(c("$-1$", "$0$", "$1$"))

  x_fraction(exact_numbers, layout = "inline", output = "rtf") %>%
    expect_equal(c("-1", "0", "1"))

  x_fraction(not_numbers) %>%
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  x_fraction(not_numbers, output = "latex") %>%
    expect_equal(c("NA", "NaN", "$Inf$", "$-Inf$"))

  x_fraction(not_numbers, output = "rtf") %>%
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  x_fraction(not_numbers, layout = "inline") %>%
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  x_fraction(not_numbers, layout = "inline", output = "latex") %>%
    expect_equal(c("NA", "NaN", "$Inf$", "$-Inf$"))

  x_fraction(not_numbers, layout = "inline", output = "rtf") %>%
    expect_equal(c("NA", "NaN", "Inf", "-Inf"))

  expect_equal(x_fraction(numeric(0)), character(0))
  expect_equal(x_fraction(integer(0)), character(0))

  expect_error(x_fraction(letters))
  expect_error(x_fraction(c(1, 2, 3), accuracy = 0))
  expect_error(x_fraction(c(1, 2, 3), accuracy = -1))
  expect_error(x_fraction(TRUE))
  expect_error(x_fraction(list(1, 2, 3)))
  expect_error(x_fraction(dplyr::tibble(a = c(1, 2, 3))))
})
