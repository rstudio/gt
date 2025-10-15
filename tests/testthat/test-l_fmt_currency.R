test_that("fmt_currency() works correctly in LaTeX output tables", {

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

  # Format the `num_1` column as USD, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(columns = "num_1", currency = "USD") |>
       render_formats_test(context = "latex"))[["num_1"]],
    c("\\$1,836.23", "\\$2,763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "-\\$23.24")
  )

  # Format the `num_1` column as USD to 5 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(columns = "num_1", currency = "USD", decimals = 5) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1,836.23000", "\\$2,763.39000",
      "\\$937.29000", "\\$643.00000",
      "\\$212.23200", "\\$0.00000",
      "-\\$23.24000")
  )

  # Format the `num_1` column as USD, and don't include the subunits;
  # use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(columns = "num_1", currency = "USD", use_subunits = FALSE) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1,836", "\\$2,763", "\\$937",
      "\\$643", "\\$212", "\\$0",
      "-\\$23")
  )

  # Format the `num_1` column as USD, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(columns = "num_1", currency = "USD", use_seps = FALSE) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1836.23", "\\$2763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "-\\$23.24")
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(columns = "num_1", currency = "USD", sep_mark = " ") |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1 836.23", "\\$2 763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "-\\$23.24")
  )

  # Format the `num_1` column as USD, use a period for the digit grouping
  # separators and a comma for the decimal mark, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD",
         sep_mark = ".", dec_mark = ",") |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1.836,23", "\\$2.763,39", "\\$937,29",
      "\\$643,00", "\\$212,23", "\\$0,00",
      "-\\$23,24")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1,836.23", "\\$2,763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "(\\$23.24)")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; apply the default context, extract
  # `output_df`, and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1,836.23", "\\$2,763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "(\\$23.24)")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD",
         decimals = 4, scale_by = 1/1000) |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1.8362", "\\$2.7634", "\\$0.9373",
      "\\$0.6430", "\\$0.2122", "\\$0.0000",
      "-\\$0.0232")
  )

  # Format the `num_1` column as USD, prepend and append all values by 2
  # different literals, use all other defaults; extract `output_df` and
  # compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD", pattern = "a {x} b") |>
       render_formats_test("latex"))[["num_1"]],
    c("a \\$1,836.23 b", "a \\$2,763.39 b",
      "a \\$937.29 b", "a \\$643.00 b",
      "a \\$212.23 b", "a \\$0.00 b",
      "a -\\$23.24 b")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD", decimals = 4,
         scale_by = 1/1000, pattern = "{x}K") |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1.8362K", "\\$2.7634K", "\\$0.9373K",
      "\\$0.6430K", "\\$0.2122K", "\\$0.0000K",
      "-\\$0.0232K")
  )

  # Format the `num_1` column as USD, apply the `en_US` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "USD", locale = "en_US") |>
       render_formats_test("latex"))[["num_1"]],
    c("\\$1,836.23", "\\$2,763.39", "\\$937.29",
      "\\$643.00", "\\$212.23", "\\$0.00",
      "-\\$23.24")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK",
         placement = "right", incl_space = TRUE) |>
       render_formats_test("latex"))[["num_1"]],
    c("1.836,23 kr.", "2.763,39 kr.",
      "937,29 kr.", "643,00 kr.", "212,23 kr.",
      "0,00 kr.", "-23,24 kr.")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; extract `output_df`, and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK") |>
       render_formats_test("latex"))[["num_1"]],
    c("kr.1.836,23", "kr.2.763,39", "kr.937,29",
      "kr.643,00", "kr.212,23", "kr.0,00",
      "-kr.23,24" )
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") |>
       render_formats_test("latex"))[["num_1"]],
    c("EUR1 836,23", "EUR2 763,39", "EUR937,29",
      "EUR643,00", "EUR212,23", "EUR0,00",
      "-EUR23,24")
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; use the default context, extract `output_df`, and
  # compare to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") |>
       render_formats_test("latex"))[["num_1"]],
    c("EUR1 836,23", "EUR2 763,39", "EUR937,29",
      "EUR643,00", "EUR212,23", "EUR0,00",
      "-EUR23,24")
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex |>
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "et_EE") |>
       render_formats_test("latex"))[["num_1"]],
    c("EUR1 836,23", "EUR2 763,39", "EUR937,29",
      "EUR643,00", "EUR212,23", "EUR0,00",
      "-EUR23,24")
  )
})
