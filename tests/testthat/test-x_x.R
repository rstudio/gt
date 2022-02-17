skip_on_cran()

vec_num_1 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf)
vec_num_2 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 10
vec_num_3 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 100
vec_num_4 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 1e6
vec_num_5 <- c(-2.5, -2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2, 2.5, NA, Inf) * 1e12
vec_num_6 <- seq(0, 2, 0.1)

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

