test_that("The `fmt_scientific()` function works correctly", {

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
  char_1 <- (tab %>% dt_data_get())[["char_1"]]
  char_2 <- (tab %>% dt_data_get())[["char_2"]]
  num_1 <-  (tab %>% dt_data_get())[["num_1"]]
  num_2 <-  (tab %>% dt_data_get())[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$char_1, char_1)
  expect_equal(data_tbl$char_2, char_2)
  expect_equal(data_tbl$num_1, num_1)
  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>%
      fmt_scientific(columns = "num_3", decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab %>%
      fmt_scientific(columns = "num_2", decimals = 2, locale = "aa_bb")
  )

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2) %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2.23", "0.00",
      paste0("\U02212", "2.32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_2` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the HTML context
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_2", decimals = 2) %>%
       render_formats_test("html"))[["num_2"]],
    c(
      paste0("3.40 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      paste0("7.40 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      paste0("2.30 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      paste0("9.30 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      paste0("3.50 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>"),
      paste0("1.00 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "2</sup>"),
      "NA"
    )
  )

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` in the default context
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2) %>%
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
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 5) %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.83623 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76339 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37290 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43000 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2.23200", "0.00000",
      paste0("\U02212", "2.32400 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` in the default context
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 5) %>%
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

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` in the HTML context and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2,
                      sep_mark = ".", dec_mark = ",") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` in the default context and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2,
                      sep_mark = ".", dec_mark = ",") %>%
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
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num_1"]],
    c(
      "1.8362", "2.7634",
      paste0("9.3729 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
      paste0("6.4300 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "1</sup>"),
      paste0("2.2320 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "3</sup>"),
      "0.0000",
      paste0("\U02212", "2.3240 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "2</sup>")
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` in the default
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 4, scale_by = 1/1000) %>%
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

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` in the HTML context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, pattern = "a {x} b") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("a 1.84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup> b"),
      paste0("a 2.76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup> b"),
      paste0("a 9.37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup> b"),
      paste0("a 6.43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup> b"),
      "a 2.23 b", "a 0.00 b",
      paste0("a ", "\U02212", "2.32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup> b")
    )
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` in the default context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, pattern = "a {x} b") %>%
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
    (tab %>%
       fmt_scientific(
         columns = num_1, decimals = 3, force_sign = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("+1.836 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("+2.763 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("+9.373 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("+6.430 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "+2.232", "0.000",
      paste0("\U02212", "2.324 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab %>%
       fmt_scientific(
         columns = num_1, pattern = "*{x}*", force_sign = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("*+1.84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>*"),
      paste0("*+2.76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>*"),
      paste0("*+9.37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>*"),
      paste0("*+6.43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>*"),
      "*+2.23*", "*0.00*",
      paste0("*", "\U02212", "2.32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>*")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, locale = "en_US") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1.84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2.76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9.37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6.43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2.23", "0.00",
      paste0("\U02212", "2.32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, locale = "da_DK") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, locale = "de_AT") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, locale = "et_EE") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_scientific(columns = "num_1", decimals = 2, locale = "gl_ES") %>%
       render_formats_test("html"))[["num_1"]],
    c(
      paste0("1,84 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("2,76 ", "\U000D7", " 10<sup style='font-size: 65%;'>3</sup>"),
      paste0("9,37 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      paste0("6,43 ", "\U000D7", " 10<sup style='font-size: 65%;'>2</sup>"),
      "2,23", "0,00",
      paste0("\U02212", "2,32 ", "\U000D7", " 10<sup style='font-size: 65%;'>1</sup>")
    )
  )
})

test_that("The `fmt_scientific()` fn can handle extremely large and small values", {

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
    (tab %>%
       fmt_scientific(columns = "num", decimals = 5) %>%
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
    (tab %>%
       fmt_scientific(columns = "num", decimals = 5) %>%
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "1.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>200</sup>"),
      paste0("\U02212", "1.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>100</sup>"),
      paste0("\U02212", "2.50000"),
      paste0("\U02212", "3.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "100</sup>"),
      paste0("\U02212", "3.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "200</sup>"),
      paste0("1.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "200</sup>"),
      paste0("1.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>", "\U02212", "100</sup>"),
      "2.50000",
      paste0("3.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>100</sup>"),
      paste0("3.50000 ", "\U000D7", " 10<sup style='font-size: 65%;'>200</sup>")
    )
  )
})
