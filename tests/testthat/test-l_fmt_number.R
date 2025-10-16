test_that("fmt_number() works correctly for LaTeX output tables", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      char_1 = c("saturday", "sunday", "monday", "tuesday",
                 "wednesday", "thursday", "friday"),
      char_2 = c("june", "july", "august", "september",
                 "october", "november", "december"),
      num_1 = c(1836.23, 2763.39, 937.29, 643.00, 212.232, 0, -23.24),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE
    )

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  # Format the `num_1` column to 2 decimal places, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2) |>
       render_formats_test(context = "latex"))[["num_1"]],
    c(
      "1,836.23", "2,763.39", "937.29", "643.00",
      "212.23", "0.00", "-23.24"
    )
  )

  # Format the `num_1` column to 5 decimal places, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 5) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.23000", "2,763.39000", "937.29000",
      "643.00000", "212.23200", "0.00000", "-23.24000"
    )
  )

  # Format the `num_1` column to 2 decimal places, drop the trailing
  # zeros, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 2,
         drop_trailing_zeros = TRUE
       ) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.23", "2,763.39", "937.29", "643",
      "212.23", "0", "-23.24"
    )
  )

  # Format the `num_1` column to 2 decimal places, don't use digit
  # grouping separators, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, use_seps = FALSE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1836.23", "2763.39", "937.29", "643.00",
      "212.23", "0.00", "-23.24"
    )
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, sep_mark = " ") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1 836.23", "2 763.39", "937.29", "643.00",
      "212.23", "0.00", "-23.24"
    )
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 2,
         sep_mark = ".", dec_mark = ","
       ) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.836,23", "2.763,39", "937,29", "643,00",
      "212,23", "0,00", "-23,24"
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 4, scale_by = 1 / 1000) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.8362", "2.7634", "0.9373", "0.6430", "0.2122",
      "0.0000", "-0.0232"
    )
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, pattern = "a {x} b") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "a 1,836.23 b", "a 2,763.39 b", "a 937.29 b", "a 643.00 b",
      "a 212.23 b", "a 0.00 b", "a -23.24 b"
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 4,
                  scale_by = 1/1000, pattern = "{x}K") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.8362K", "2.7634K", "0.9373K", "0.6430K",
      "0.2122K", "0.0000K", "-0.0232K"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, accounting = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.23", "2,763.39", "937.29", "643.00", "212.23",
      "0.00", "(23.24)"
    )
  )

  # Format the `num_1` column to 3 decimal places, use accounting style
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 3, accounting = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.230", "2,763.390", "937.290", "643.000", "212.232",
      "0.000", "(23.240)"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and a pattern around the values
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 3,
         accounting = TRUE, pattern = "a{x}b") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "a1,836.230b", "a2,763.390b", "a937.290b", "a643.000b",
      "a212.232b", "a0.000b", "a(23.240)b"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and drop all trailing zeros
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 3,
         accounting = TRUE, drop_trailing_zeros = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.23", "2,763.39", "937.29", "643", "212.232",
      "0", "(23.24)"
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 3, force_sign = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "+1,836.230", "+2,763.390", "+937.290", "+643.000",
      "+212.232", "0.000", "-23.240"
    )
  )

  # Expect that using `force_sign = TRUE` with `accounting = TRUE`
  # will render values in accounting format
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 3, accounting = TRUE, force_sign = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    (tbl_latex |>
       fmt_number(
         columns = num_1, decimals = 3, accounting = TRUE) |>
       render_formats_test("latex"))[["num_1"]]
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tbl_latex |>
       fmt_number(
         columns = num_1, pattern = "*{x}*", force_sign = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "*+1,836.23*", "*+2,763.39*", "*+937.29*", "*+643.00*",
      "*+212.23*", "*0.00*", "*-23.24*"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, locale = "en_US") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,836.23", "2,763.39", "937.29", "643.00",
      "212.23", "0.00", "-23.24"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, locale = "da_DK") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.836,23", "2.763,39", "937,29", "643,00",
      "212,23", "0,00", "-23,24"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, locale = "de_AT") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1 836,23", "2 763,39", "937,29", "643,00",
      "212,23", "0,00", "-23,24"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, locale = "et_EE") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1 836,23", "2 763,39", "937,29", "643,00",
      "212,23", "0,00", "-23,24"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults
  expect_equal(
    (tbl_latex |>
       fmt_number(columns = num_1, decimals = 2, locale = "gl_ES") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.836,23", "2.763,39", "937,29", "643,00",
      "212,23", "0,00", "-23,24"
    )
  )
})
