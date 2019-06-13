context("LaTeX -- Ensuring that the `fmt_currency()` function works as expected")

test_that("the `fmt_currency()` function works correctly", {

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
  tbl_latex <- gt(data = data_tbl)

  # Format the `num_1` column as USD, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(columns = "num_1", currency = "USD") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$\\text{\\$}1,836.23$", "$\\text{\\$}2,763.39$", "$\\text{\\$}937.29$",
      "$\\text{\\$}643.00$", "$\\text{\\$}212.23$", "$\\text{\\$}0.00$",
      "$-\\text{\\$}23.24$")
  )

  # Format the `num_1` column as USD to 5 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(columns = "num_1", currency = "USD", decimals = 5) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1,836.23000$", "$\\text{\\$}2,763.39000$",
      "$\\text{\\$}937.29000$", "$\\text{\\$}643.00000$",
      "$\\text{\\$}212.23200$", "$\\text{\\$}0.00000$",
      "$-\\text{\\$}23.24000$")
  )

  # Format the `num_1` column as USD, and don't include the subunits;
  # use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(columns = "num_1", currency = "USD", use_subunits = FALSE) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1,836$", "$\\text{\\$}2,763$", "$\\text{\\$}937$",
      "$\\text{\\$}643$", "$\\text{\\$}212$", "$\\text{\\$}0$",
      "$-\\text{\\$}23$")
  )

  # Format the `num_1` column as USD, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(columns = "num_1", currency = "USD", use_seps = FALSE) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1836.23$", "$\\text{\\$}2763.39$", "$\\text{\\$}937.29$",
      "$\\text{\\$}643.00$", "$\\text{\\$}212.23$", "$\\text{\\$}0.00$",
      "$-\\text{\\$}23.24$")
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(columns = "num_1", currency = "USD", sep_mark = " ") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1 836.23$", "$\\text{\\$}2 763.39$", "$\\text{\\$}937.29$",
      "$\\text{\\$}643.00$", "$\\text{\\$}212.23$", "$\\text{\\$}0.00$",
      "$-\\text{\\$}23.24$")
  )

  # Format the `num_1` column as USD, use a period for the digit grouping
  # separators and a comma for the decimal mark, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD",
         sep_mark = ".", dec_mark = ",") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1.836,23$", "$\\text{\\$}2.763,39$", "$\\text{\\$}937,29$",
      "$\\text{\\$}643,00$", "$\\text{\\$}212,23$", "$\\text{\\$}0,00$",
      "$-\\text{\\$}23,24$")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\hphantom{(}\\text{\\$}1,836.23\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}2,763.39\\hphantom{)}$", 
      "$\\hphantom{(}\\text{\\$}937.29\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}643.00\\hphantom{)}$",
      "$\\hphantom{(}\\text{\\$}212.23\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}0.00\\hphantom{)}$",
      "$(\\text{\\$}23.24)$")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; apply the default context, extract
  # `output_df`, and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\hphantom{(}\\text{\\$}1,836.23\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}2,763.39\\hphantom{)}$", 
      "$\\hphantom{(}\\text{\\$}937.29\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}643.00\\hphantom{)}$",
      "$\\hphantom{(}\\text{\\$}212.23\\hphantom{)}$", "$\\hphantom{(}\\text{\\$}0.00\\hphantom{)}$",
      "$(\\text{\\$}23.24)$")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD",
         decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1.8362$", "$\\text{\\$}2.7634$", "$\\text{\\$}0.9373$",
      "$\\text{\\$}0.6430$", "$\\text{\\$}0.2122$", "$\\text{\\$}0.0000$",
      "$-\\text{\\$}0.0232$")
  )

  # Format the `num_1` column as USD, prepend and append all values by 2
  # different literals, use all other defaults; extract `output_df` and
  # compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD", pattern = "a {x} b") %>%
       render_formats_test("latex"))[["num_1"]],
    c("a $\\text{\\$}1,836.23$ b", "a $\\text{\\$}2,763.39$ b",
      "a $\\text{\\$}937.29$ b", "a $\\text{\\$}643.00$ b",
      "a $\\text{\\$}212.23$ b", "a $\\text{\\$}0.00$ b",
      "a $-\\text{\\$}23.24$ b")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD", decimals = 4,
         scale_by = 1/1000, pattern = "{x}K") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1.8362$K", "$\\text{\\$}2.7634$K", "$\\text{\\$}0.9373$K",
      "$\\text{\\$}0.6430$K", "$\\text{\\$}0.2122$K", "$\\text{\\$}0.0000$K",
      "$-\\text{\\$}0.0232$K")
  )

  # Format the `num_1` column as USD, apply the `en_US` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "USD", locale = "en_US") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{\\$}1,836.23$", "$\\text{\\$}2,763.39$", "$\\text{\\$}937.29$",
      "$\\text{\\$}643.00$", "$\\text{\\$}212.23$", "$\\text{\\$}0.00$",
      "$-\\text{\\$}23.24$")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK",
         placement = "right", incl_space = TRUE) %>%
       render_formats_test("latex"))[["num_1"]],
    c("$1.836,23 \\text{kr.}$", "$2.763,39 \\text{kr.}$",
      "$937,29 \\text{kr.}$", "$643,00 \\text{kr.}$", "$212,23 \\text{kr.}$",
      "$0,00 \\text{kr.}$", "$-23,24 \\text{kr.}$")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; extract `output_df`, and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{kr.}1.836,23$", "$\\text{kr.}2.763,39$", "$\\text{kr.}937,29$",
      "$\\text{kr.}643,00$", "$\\text{kr.}212,23$", "$\\text{kr.}0,00$",
      "$-\\text{kr.}23,24$" )
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{EUR}1 836,23$", "$\\text{EUR}2 763,39$", "$\\text{EUR}937,29$",
      "$\\text{EUR}643,00$", "$\\text{EUR}212,23$", "$\\text{EUR}0,00$",
      "$-\\text{EUR}23,24$")
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; use the default context, extract `output_df`, and
  # compare to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{EUR}1 836,23$", "$\\text{EUR}2 763,39$", "$\\text{EUR}937,29$",
      "$\\text{EUR}643,00$", "$\\text{EUR}212,23$", "$\\text{EUR}0,00$",
      "$-\\text{EUR}23,24$")
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tbl_latex %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "et_EE") %>%
       render_formats_test("latex"))[["num_1"]],
    c("$\\text{EUR}1 836,23$", "$\\text{EUR}2 763,39$", "$\\text{EUR}937,29$",
      "$\\text{EUR}643,00$", "$\\text{EUR}212,23$", "$\\text{EUR}0,00$",
      "$-\\text{EUR}23,24$")
  )
})
