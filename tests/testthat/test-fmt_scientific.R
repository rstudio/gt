test_that("fmt_scientific() works correctly", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      char_1 = c("saturday", "sunday", "monday", "tuesday",
                 "wednesday", "thursday", "friday"),
      char_2 = c("june", "july", "august", "september",
                 "october", "november", "december"),
      num_1 = c(1836.23, 2763.39, 937.29, 643.00, 2.232, 0, -23.24),
      num_2 = c(34, 74, 23, 93, 35, 0.01, NA),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char_1 <- dt_data_get(tab)[["char_1"]]
  char_2 <- dt_data_get(tab)[["char_2"]]
  num_1 <-  dt_data_get(tab)[["num_1"]]
  num_2 <-  dt_data_get(tab)[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$char_1, char_1)

  expect_equal(data_tbl$char_2, char_2)

  expect_equal(data_tbl$num_1, num_1)

  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab |>
      fmt_scientific(columns = "num_3", decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab |>
      fmt_scientific(columns = "num_2", decimals = 2, locale = "aa_bb")
  )

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2) |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2.23", "0.00",
      paste0("\U02212", "2.32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_2` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_2", decimals = 2) |>
       render_formats_test("html"))[["num_2"]],
    c(
      paste0("3.40&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      paste0("7.40&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      paste0("2.30&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      paste0("9.30&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      paste0("3.50&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>"),
      paste0("1.00&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "2</sup>"),
      "NA"
    )
  )

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the default context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2) |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.84 \U000D7 10^3",
      "2.76 \U000D7 10^3",
      "9.37 \U000D7 10^2",
      "6.43 \U000D7 10^2",
      "2.23", "0.00",
      "-2.32 \U000D7 10^1"
    )
  )

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 5) |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.83623&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76339&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37290&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2.23200", "0.00000",
      paste0("\U02212", "2.32400&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` in the default context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 5) |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.83623 \U000D7 10^3",
      "2.76339 \U000D7 10^3",
      "9.37290 \U000D7 10^2",
      "6.43000 \U000D7 10^2",
      "2.23200", "0.00000",
      "-2.32400 \U000D7 10^1"
    )
  )

  # Format the `num` column to exactly 4 decimal places
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 4, exp_style = "E") |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.8362E03", "2.7634E03", "9.3729E02", "6.4300E02",
      "2.2320E00", "0.0000E00", "-2.3240E01"
    )
  )

  # Format the `num` column to exactly 6 significant figures
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", n_sigfig = 6, exp_style = "E") |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.83623E03", "2.76339E03", "9.37290E02", "6.43000E02", "2.23200E00",
      "0.00000E00", "-2.32400E01"
    )
  )

  # Verify that setting `drop_trailing_zeros` to TRUE has no effect when
  # using significant figures
  expect_equal(
    (tab |>
       fmt_scientific(
         columns = "num_1",
         n_sigfig = 6,
         drop_trailing_zeros = TRUE,
         exp_style = "E"
       ) |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.83623E03", "2.76339E03", "9.37290E02", "6.43000E02", "2.23200E00",
      "0.00000E00", "-2.32400E01"
    )
  )

  # Should `n_sigfig` be set to `NA` then significant figures cannot be
  # used and any value for `decimals` is no longer ignored
  expect_equal(
    (tab |>
       fmt_scientific(
         columns = "num_1",
         decimals = 8,
         n_sigfig = NA,
         exp_style = "E"
       ) |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.83623000E03", "2.76339000E03", "9.37290000E02", "6.43000000E02",
      "2.23200000E00", "0.00000000E00", "-2.32400000E01"
    )
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` in the HTML context and
  # compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, sep_mark = ".", dec_mark = ",") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` in the default context and
  # compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, sep_mark = ".", dec_mark = ",") |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1,84 \U000D7 10^3",
      "2,76 \U000D7 10^3",
      "9,37 \U000D7 10^2",
      "6,43 \U000D7 10^2",
      "2,23", "0,00",
      "-2,32 \U000D7 10^1"
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 4, scale_by = 1 / 1000) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "1.8362", "2.7634",
      paste0("9.3729&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
      paste0("6.4300&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
      paste0("2.2320&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "3</sup>"),
      "0.0000",
      paste0("\U02212", "2.3240&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "2</sup>")
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` in the default
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 4, scale_by = 1 / 1000) |>
       render_formats_test("default"))[["num_1"]],
    c(
      "1.8362",
      "2.7634",
      "9.3729 \U000D7 10^-1",
      "6.4300 \U000D7 10^-1",
      "2.2320 \U000D7 10^-3",
      "0.0000",
      "-2.3240 \U000D7 10^-2"
    )
  )

  # Create a gt table with a mix of small and large numbers, both
  # positive and negative
  tab_2 <-
    dplyr::tibble(
      num = c(-3.49E13, -3453, -0.000234, 0, 0.00007534, 82794, 7.16E14)
    ) |>
    gt()

  # Format the `num` column and force the sign on the 'm' part of the
  # notation; extract in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_m = TRUE) |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49 \U000D7 10^13", "-3.45 \U000D7 10^3", "-2.34 \U000D7 10^-4", "0.00",
      "+7.53 \U000D7 10^-5", "+8.28 \U000D7 10^4", "+7.16 \U000D7 10^14"
    )
  )

  # Format the `num` column and force the sign on the 'm' part of the
  # notation; extract in the HTML context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_m = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      "−3.49&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "−3.45&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "−2.34&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−4</sup>",
      "0.00",
      "+7.53&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−5</sup>",
      "+8.28&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>4</sup>",
      "+7.16&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>14</sup>"
    )
  )

  # Format the `num` column and force the sign on the 'n' part of the
  # notation; extract in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_n = TRUE) |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49 \U000D7 10^+13", "-3.45 \U000D7 10^+3", "-2.34 \U000D7 10^-4", "0.00",
      "7.53 \U000D7 10^-5", "8.28 \U000D7 10^+4", "7.16 \U000D7 10^+14"
    )
  )

  # Format the `num` column and force the sign on the 'n' part of the
  # notation; extract in the HTML context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_n = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      "−3.49&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+13</sup>",
      "−3.45&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+3</sup>",
      "−2.34&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−4</sup>",
      "0.00",
      "7.53&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−5</sup>",
      "8.28&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+4</sup>",
      "7.16&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+14</sup>"
    )
  )

  # Format the `num` column and force the sign on the 'm' and 'n' parts of the
  # notation; extract in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_m = TRUE, force_sign_n = TRUE) |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49 \U000D7 10^+13", "-3.45 \U000D7 10^+3", "-2.34 \U000D7 10^-4", "0.00",
      "+7.53 \U000D7 10^-5", "+8.28 \U000D7 10^+4", "+7.16 \U000D7 10^+14"
    )
  )

  # Format the `num` column and force the sign on the 'm' and 'n' parts of the
  # notation; extract in the HTML context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", force_sign_m = TRUE, force_sign_n = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      "−3.49&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+13</sup>",
      "−3.45&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+3</sup>",
      "−2.34&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−4</sup>",
      "0.00",
      "+7.53&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>−5</sup>",
      "+8.28&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+4</sup>",
      "+7.16&nbsp;\U000D7&nbsp;10<sup style='font-size: 65%;'>+14</sup>"
    )
  )

  # Format the `num` column and force the sign on the 'm' and 'n' parts of the
  # notation and choose a exponent style of `"E"`; extract in the default
  # context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "E", force_sign_m = TRUE, force_sign_n = TRUE) |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E+13", "-3.45E+03", "-2.34E-04", "0.00E+00",
      "+7.53E-05", "+8.28E+04", "+7.16E+14"
    )
  )

  # Format the `num` column and force the sign on the 'm' and 'n' parts of the
  # notation and choose a exponent style of `"E"`; extract in the HTML
  # context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "E", force_sign_m = TRUE, force_sign_n = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      "−3.49E+13", "−3.45E+03", "−2.34E−04", "0.00E+00",
      "+7.53E−05", "+8.28E+04", "+7.16E+14"
    )
  )

  # Format the `num` column and choose a exponent style of `"E"`; extract in
  # the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "E") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E03", "-2.34E-04", "0.00E00", "7.53E-05",
      "8.28E04", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"E1"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "E1") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E3", "-2.34E-4", "0.00E0", "7.53E-5",
      "8.28E4", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"D3"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "D3") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E03", "-2.34E-04", "0.00E00", "7.53E-05",
      "8.28E04", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"e1"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "e1") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49e13", "-3.45e3", "-2.34e-4", "0.00e0", "7.53e-5",
      "8.28e4", "7.16e14"
    )
  )

  # Format the `num` column and choose a exponent style of `"e2"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "e2") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E03", "-2.34E-04", "0.00E00", "7.53E-05",
      "8.28E04", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"E2"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "E2") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E03", "-2.34E-04", "0.00E00", "7.53E-05",
      "8.28E04", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"low-ten"`; extract
  # in the default context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "low-ten") |>
       render_formats_test("default"))[["num"]],
    c(
      "-3.49E13", "-3.45E03", "-2.34E-04", "0.00E00", "7.53E-05",
      "8.28E04", "7.16E14"
    )
  )

  # Format the `num` column and choose a exponent style of `"low-ten"`; extract
  # in the HTML context and compare to expected values
  expect_equal(
    (tab_2 |>
       fmt_scientific(columns = "num", exp_style = "low-ten") |>
       render_formats_test("html"))[["num"]],
    c(
      "−3.49<sub style='font−size: 65%;'>10</sub>13",
      "−3.45<sub style='font−size: 65%;'>10</sub>03",
      "−2.34<sub style='font−size: 65%;'>10</sub>−04",
      "0.00<sub style='font−size: 65%;'>10</sub>00",
      "7.53<sub style='font−size: 65%;'>10</sub>−05",
      "8.28<sub style='font−size: 65%;'>10</sub>04",
      "7.16<sub style='font−size: 65%;'>10</sub>14"
    )
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` in the HTML context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, pattern = "a {x} b") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("a 1.84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup> b"),
      paste0("a 2.76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup> b"),
      paste0("a 9.37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup> b"),
      paste0("a 6.43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup> b"),
      "a 2.23 b", "a 0.00 b",
      paste0("a ", "\U02212", "2.32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup> b")
    )
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` in the default context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, pattern = "a {x} b") |>
       render_formats_test("default"))[["num_1"]],
    c(
      "a 1.84 \U000D7 10^3 b",
      "a 2.76 \U000D7 10^3 b",
      "a 9.37 \U000D7 10^2 b",
      "a 6.43 \U000D7 10^2 b",
      "a 2.23 b", "a 0.00 b",
      "a -2.32 \U000D7 10^1 b"
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tab |>
       fmt_scientific(
         columns = num_1, decimals = 3, force_sign_m = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("+1.836&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("+2.763&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("+9.373&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("+6.430&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "+2.232", "0.000",
      paste0("\U02212", "2.324&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab |>
       fmt_scientific(
         columns = num_1, pattern = "*{x}*", force_sign_m = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("*+1.84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>*"),
      paste0("*+2.76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>*"),
      paste0("*+9.37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>*"),
      paste0("*+6.43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>*"),
      "*+2.23*", "*0.00*",
      paste0("*", "\U02212", "2.32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>*")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "en_US") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2.23", "0.00",
      paste0("\U02212", "2.32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "da_DK") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "de_AT") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "et_EE") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num_1", decimals = 2, locale = "gl_ES") |>
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>1</sup>")
    )
  )
})

test_that("fmt_scientific() can handle extremely large and small values", {

  # Create an input data frame with very
  # large and very small numbers (both
  # positive and negative)
  data_tbl <-
    data.frame(
      num = c(
        -1.5E200, -1.5E100, -2.5E0, -3.5E-100, -3.5E-200,
        1.5E-200, 1.5E-100, 2.5E0, 3.5E100, 3.5E200
      )
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Format the `num` column to 5 decimal places, use all
  # other defaults; extract values in the default context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num", decimals = 5) |>
       render_formats_test("default"))[["num"]],
    c(
      "-1.50000 \U000D7 10^200",
      "-1.50000 \U000D7 10^100",
      "-2.50000",
      "-3.50000 \U000D7 10^-100",
      "-3.50000 \U000D7 10^-200",
      "1.50000 \U000D7 10^-200",
      "1.50000 \U000D7 10^-100",
      "2.50000",
      "3.50000 \U000D7 10^100",
      "3.50000 \U000D7 10^200"
    )
  )

  # Format the `num` column to 5 decimal places, use all
  # other defaults; extract values in the HTML context
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_scientific(columns = "num", decimals = 5) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "1.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>200</sup>"),
      paste0("\U02212", "1.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>100</sup>"),
      paste0("\U02212", "2.50000"),
      paste0("\U02212", "3.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "100</sup>"),
      paste0("\U02212", "3.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "200</sup>"),
      paste0("1.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "200</sup>"),
      paste0("1.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>", "\U02212", "100</sup>"),
      "2.50000",
      paste0("3.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>100</sup>"),
      paste0("3.50000&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>200</sup>")
    )
  )
})

test_that("fmt_scientific() handles Inf values correctly", {

  # Test fmt_scientific() with Inf values
  tab_inf <-
    data.frame(a = c(1234, Inf, -5678, Inf)) |>
    gt() |>
    fmt_scientific()

  expect_equal(
    (tab_inf |> render_formats_test(context = "html"))[["a"]],
    c(
      paste0("1.23&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      "Inf",
      paste0("\U02212", "5.68&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      "Inf"
    )
  )

  # Test fmt_scientific() with Inf at the start
  tab_inf_first <-
    data.frame(a = c(Inf, 1234, 5678)) |>
    gt() |>
    fmt_scientific()

  expect_equal(
    (tab_inf_first |> render_formats_test(context = "html"))[["a"]],
    c(
      "Inf",
      paste0("1.23&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("5.68&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>")
    )
  )

  # Test fmt_scientific() with mix of NA and Inf
  tab_mixed <-
    data.frame(a = c(1234, NA, Inf, 5678, Inf)) |>
    gt() |>
    fmt_scientific()

  expect_equal(
    (tab_mixed |> render_formats_test(context = "html"))[["a"]],
    c(
      paste0("1.23&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      "NA",
      "Inf",
      paste0("5.68&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      "Inf"
    )
  )

  # Test fmt_scientific() with Inf and different exp_style
  tab_inf_exp_style <-
    data.frame(a = c(1234, Inf, 5678)) |>
    gt() |>
    fmt_scientific(exp_style = "E")

  expect_equal(
    (tab_inf_exp_style |> render_formats_test(context = "html"))[["a"]],
    c(
      "1.23E03",
      "Inf",
      "5.68E03"
    )
  )

  # Test fmt_scientific() with negative Inf (-Inf)
  tab_neg_inf <-
    data.frame(a = c(1234, -Inf, 5678, Inf)) |>
    gt() |>
    fmt_scientific()

  expect_equal(
    (tab_neg_inf |> render_formats_test(context = "html"))[["a"]],
    c(
      paste0("1.23&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      paste0("\U02212", "Inf"),
      paste0("5.68&nbsp;", "\U000D7", "&nbsp;10<sup style='font-size: 65%;'>3</sup>"),
      "Inf"
    )
  )

  # Test that the example from the issue works without error
  expect_no_error({
    data.frame(a = c(1234, Inf)) |>
      gt() |>
      fmt_scientific()
  })
})
