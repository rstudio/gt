test_that("fmt_scientific() works correctly for LaTeX output tables", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      char_1 = c("saturday", "sunday", "monday", "tuesday",
                 "wednesday", "thursday", "friday"),
      char_2 = c("june", "july", "august", "september",
                 "october", "november", "december"),
      num_1 = c(1836.23, 2763.39, 937.29, 643.00, 2.232, 0, -23.24),
      num_2 = c(34, 74, 23, 93, 35, 76, 57),
      stringsAsFactors = FALSE
    )

  # Create a `tbl_latex` object with `gt()` and the
  # `data_tbl` dataset
  tbl_latex <- gt(data_tbl)

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.84 $\\times$ 10\\textsuperscript{3}", "2.76 $\\times$ 10\\textsuperscript{3}",
      "9.37 $\\times$ 10\\textsuperscript{2}", "6.43 $\\times$ 10\\textsuperscript{2}",
      "2.23", "0.00", "-2.32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 5) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.83623 $\\times$ 10\\textsuperscript{3}", "2.76339 $\\times$ 10\\textsuperscript{3}",
      "9.37290 $\\times$ 10\\textsuperscript{2}", "6.43000 $\\times$ 10\\textsuperscript{2}",
      "2.23200", "0.00000", "-2.32400 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` in the HTML context and
  # compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(
         columns = "num_1", decimals = 2,
         sep_mark = ".", dec_mark = ","
       ) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,84 $\\times$ 10\\textsuperscript{3}", "2,76 $\\times$ 10\\textsuperscript{3}",
      "9,37 $\\times$ 10\\textsuperscript{2}", "6,43 $\\times$ 10\\textsuperscript{2}",
      "2,23", "0,00", "-2,32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 4, scale_by = 1 / 1000) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.8362", "2.7634",
      "9.3729 $\\times$ 10\\textsuperscript{-1}", "6.4300 $\\times$ 10\\textsuperscript{-1}",
      "2.2320 $\\times$ 10\\textsuperscript{-3}", "0.0000", "-2.3240 $\\times$ 10\\textsuperscript{-2}")
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` in the HTML context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, pattern = "a {x} b") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "a 1.84 $\\times$ 10\\textsuperscript{3} b", "a 2.76 $\\times$ 10\\textsuperscript{3} b",
      "a 9.37 $\\times$ 10\\textsuperscript{2} b", "a 6.43 $\\times$ 10\\textsuperscript{2} b",
      "a 2.23 b", "a 0.00 b", "a -2.32 $\\times$ 10\\textsuperscript{1} b")
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tbl_latex |>
       fmt_scientific(
         columns = num_1, decimals = 3, force_sign_m = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "+1.836 $\\times$ 10\\textsuperscript{3}", "+2.763 $\\times$ 10\\textsuperscript{3}",
      "+9.373 $\\times$ 10\\textsuperscript{2}", "+6.430 $\\times$ 10\\textsuperscript{2}",
      "+2.232", "0.000", "-2.324 $\\times$ 10\\textsuperscript{1}"
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(
         columns = num_1, pattern = "*{x}*", force_sign_m = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "*+1.84 $\\times$ 10\\textsuperscript{3}*", "*+2.76 $\\times$ 10\\textsuperscript{3}*",
      "*+9.37 $\\times$ 10\\textsuperscript{2}*", "*+6.43 $\\times$ 10\\textsuperscript{2}*",
      "*+2.23*", "*0.00*", "*-2.32 $\\times$ 10\\textsuperscript{1}*"
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "en_US") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1.84 $\\times$ 10\\textsuperscript{3}", "2.76 $\\times$ 10\\textsuperscript{3}",
      "9.37 $\\times$ 10\\textsuperscript{2}", "6.43 $\\times$ 10\\textsuperscript{2}",
      "2.23", "0.00", "-2.32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "da_DK") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,84 $\\times$ 10\\textsuperscript{3}", "2,76 $\\times$ 10\\textsuperscript{3}",
      "9,37 $\\times$ 10\\textsuperscript{2}", "6,43 $\\times$ 10\\textsuperscript{2}",
      "2,23", "0,00", "-2,32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "de_AT") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,84 $\\times$ 10\\textsuperscript{3}", "2,76 $\\times$ 10\\textsuperscript{3}",
      "9,37 $\\times$ 10\\textsuperscript{2}", "6,43 $\\times$ 10\\textsuperscript{2}",
      "2,23", "0,00", "-2,32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "et_EE") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,84 $\\times$ 10\\textsuperscript{3}", "2,76 $\\times$ 10\\textsuperscript{3}",
      "9,37 $\\times$ 10\\textsuperscript{2}", "6,43 $\\times$ 10\\textsuperscript{2}",
      "2,23", "0,00", "-2,32 $\\times$ 10\\textsuperscript{1}")
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "gl_ES") |>
       render_formats_test("latex"))[["num_1"]],
    c(
      "1,84 $\\times$ 10\\textsuperscript{3}", "2,76 $\\times$ 10\\textsuperscript{3}",
      "9,37 $\\times$ 10\\textsuperscript{2}", "6,43 $\\times$ 10\\textsuperscript{2}",
      "2,23", "0,00", "-2,32 $\\times$ 10\\textsuperscript{1}")
  )
})
