context("Ensuring that the `fmt_currency()` function works as expected")

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

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  # expect_true(
  #   all(
  #     names(attributes(tab)) %in%
  #       c("names", "class", "row.names",
  #         "boxh_df", "stub_df", "footnotes_df", "styles_df",
  #         "rows_df", "cols_df", "col_labels", "grp_labels",
  #         "arrange_groups", "data_df", "opts_df", "formats", "transforms")
  #   )
  # )

  # Extract vectors from the table object for comparison
  # to the original dataset
  char_1 <- (tab %>% dt_data_get())[["char_1"]]
  char_2 <- (tab %>% dt_data_get())[["char_2"]]
  num_1 <- (tab %>% dt_data_get())[["num_1"]]
  num_2 <- (tab %>% dt_data_get())[["num_2"]]

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
      fmt_currency(columns = "num_3", currency = "USD")
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab %>%
      fmt_currency(columns = "num_2", decimals = 2, locale = "aa_bb")
  )

  # Format the `num_1` column using defaults (currency of "USD");
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("$1,836.23", "$2,763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", "&minus;$23.24")
  )

  # Format the `num_1` column as USD, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1", currency = "USD") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("$1,836.23", "$2,763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", "&minus;$23.24")
  )

  # Format the `num_1` column as USD to 5 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1", currency = "USD", decimals = 5) %>%
       render_formats_test("html"))[["num_1"]],
    c("$1,836.23000", "$2,763.39000", "$937.29000", "$643.00000",
      "$212.23200", "$0.00000", "&minus;$23.24000")
  )

  # Format the `num_1` column as USD, and don't include the subunits;
  # use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1", currency = "USD", use_subunits = FALSE) %>%
       render_formats_test("html"))[["num_1"]],
    c("$1,836", "$2,763", "$937", "$643", "$212", "$0", "&minus;$23")
  )

  # Format the `num_1` column as USD, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1", currency = "USD", use_seps = FALSE) %>%
       render_formats_test("html"))[["num_1"]],
    c("$1836.23", "$2763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", "&minus;$23.24")
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num_1", currency = "USD", sep_mark = " ") %>%
       render_formats_test("html"))[["num_1"]],
    c("$1 836.23", "$2 763.39", "$937.29", "$643.00", "$212.23",
      "$0.00", "&minus;$23.24")
  )

  # Format the `num_1` column as USD, use a period for the digit grouping
  # separators and a comma for the decimal mark, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD",
         sep_mark = ".", dec_mark = ",") %>%
       render_formats_test("html"))[["num_1"]],
    c("$1.836,23", "$2.763,39", "$937,29", "$643,00", "$212,23",
      "$0,00", "&minus;$23,24")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("<span style=\"visibility: hidden;\">(</span>$1,836.23<span style=\"visibility: hidden;\">)</span>", 
      "<span style=\"visibility: hidden;\">(</span>$2,763.39<span style=\"visibility: hidden;\">)</span>", 
      "<span style=\"visibility: hidden;\">(</span>$937.29<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$643.00<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$212.23<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$0.00<span style=\"visibility: hidden;\">)</span>", "($23.24)")
  )

  # Format the `num_1` column as USD, apply parentheses to all negative
  # values, use all other defaults; apply the default context, extract
  # `output_df`, and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD", accounting = TRUE) %>%
       render_formats_test("default"))[["num_1"]],
    c("<span style=\"visibility: hidden;\">(</span>$1,836.23<span style=\"visibility: hidden;\">)</span>", 
      "<span style=\"visibility: hidden;\">(</span>$2,763.39<span style=\"visibility: hidden;\">)</span>", 
      "<span style=\"visibility: hidden;\">(</span>$937.29<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$643.00<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$212.23<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>$0.00<span style=\"visibility: hidden;\">)</span>", "($23.24)")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD",
         decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num_1"]],
    c("$1.8362", "$2.7634", "$0.9373", "$0.6430", "$0.2122",
      "$0.0000", "&minus;$0.0232")
  )

  # Format the `num_1` column as USD, prepend and append all values by 2
  # different literals, use all other defaults; extract `output_df` and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD", pattern = "a {x} b") %>%
       render_formats_test("html"))[["num_1"]],
    c("a $1,836.23 b", "a $2,763.39 b", "a $937.29 b", "a $643.00 b",
      "a $212.23 b", "a $0.00 b", "a &minus;$23.24 b")
  )

  # Format the `num_1` column as USD to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD", decimals = 4,
         scale_by = 1/1000, pattern = "{x}K") %>%
       render_formats_test("html"))[["num_1"]],
    c("$1.8362K", "$2.7634K", "$0.9373K", "$0.6430K",
      "$0.2122K", "$0.0000K", "&minus;$0.0232K")
  )

  # Format the `num_1` column as USD, apply the `en_US` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "USD", locale = "en_US") %>%
       render_formats_test("html"))[["num_1"]],
    c("$1,836.23", "$2,763.39", "$937.29", "$643.00",
      "$212.23", "$0.00", "&minus;$23.24")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK",
         placement = "right", incl_space = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23 kr.", "2.763,39 kr.", "937,29 kr.", "643,00 kr.",
      "212,23 kr.", "0,00 kr.", "&minus;23,24 kr.")
  )

  # Format the `num_1` column as DKK, apply the `da_DK` locale and use all
  # other defaults; use the default context, extract `output_df`, and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "DKK", locale = "da_DK") %>%
       render_formats_test("default"))[["num_1"]],
    c("kr.1.836,23", "kr.2.763,39", "kr.937,29", "kr.643,00",
      "kr.212,23", "kr.0,00", "-kr.23,24")
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") %>%
       render_formats_test("html"))[["num_1"]],
    c("&#8364;1 836,23", "&#8364;2 763,39", "&#8364;937,29", "&#8364;643,00",
      "&#8364;212,23", "&#8364;0,00", "&minus;&#8364;23,24")
  )

  # Format the `num_1` column as EUR, apply the `de_AT` locale and use all
  # other defaults; use the default context, extract `output_df`, and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "de_AT") %>%
       render_formats_test("default"))[["num_1"]],
    c("EUR1 836,23", "EUR2 763,39", "EUR937,29", "EUR643,00",
      "EUR212,23", "EUR0,00", "-EUR23,24")
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1", currency = "EUR", locale = "et_EE") %>%
       render_formats_test("html"))[["num_1"]],
    c("&#8364;1 836,23", "&#8364;2 763,39", "&#8364;937,29", "&#8364;643,00",
      "&#8364;212,23", "&#8364;0,00", "&minus;&#8364;23,24")
  )
})

test_that("the `fmt_currency()` function can scale/suffix larger numbers", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      num = c(
        -1.8E15, -1.7E13, -1.6E10, -1.5E8, -1.4E6, -1.3E4, -1.2E3, -1.1E1,
        0,
        1.1E1, 1.2E3, 1.3E4, 1.4E6, 1.5E8, 1.6E10, 1.7E13, 1.8E15),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to TRUE (default labels, all
  # 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num", decimals = 2, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;$1,800.00T", "&minus;$17.00T", "&minus;$16.00B",
      "&minus;$150.00M", "&minus;$1.40M", "&minus;$13.00K",
      "&minus;$1.20K", "&minus;$11.00", "$0.00", "$11.00",
      "$1.20K", "$13.00K", "$1.40M", "$150.00M", "$16.00B",
      "$17.00T", "$1,800.00T")
  )

  # Format the `num` column to no decimal places, have the
  # `suffixing` option set to TRUE (default labels, all
  # 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_currency(columns = "num", decimals = 0, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;$1,800T", "&minus;$17T", "&minus;$16B", "&minus;$150M",
      "&minus;$1M", "&minus;$13K", "&minus;$1K", "&minus;$11", "$0",
      "$11", "$1K", "$13K", "$1M", "$150M", "$16B", "$17T", "$1,800T")
  )

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols across the
  # 4 different ranges
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num", decimals = 2,
         suffixing = c("k", "Mn", "Bn", "Tr")) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;$1,800.00Tr", "&minus;$17.00Tr", "&minus;$16.00Bn",
      "&minus;$150.00Mn", "&minus;$1.40Mn", "&minus;$13.00k", "&minus;$1.20k",
      "&minus;$11.00", "$0.00", "$11.00", "$1.20k", "$13.00k", "$1.40Mn",
      "$150.00Mn", "$16.00Bn", "$17.00Tr", "$1,800.00Tr")
  )

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols for the middle
  # two ranges (millions and billions)
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num", decimals = 2, currency = "EUR", locale = "de_DE",
         suffixing = c(NA, "Mio.", "Mia.", NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;&#8364;1.800.000,00Mia.", "&minus;&#8364;17.000,00Mia.",
      "&minus;&#8364;16,00Mia.", "&minus;&#8364;150,00Mio.",
      "&minus;&#8364;1,40Mio.", "&minus;&#8364;13.000,00",
      "&minus;&#8364;1.200,00", "&minus;&#8364;11,00", "&#8364;0,00",
      "&#8364;11,00", "&#8364;1.200,00", "&#8364;13.000,00", "&#8364;1,40Mio.",
      "&#8364;150,00Mio.", "&#8364;16,00Mia.", "&#8364;17.000,00Mia.",
      "&#8364;1.800.000,00Mia.")
  )

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols with some NAs
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num", decimals = 2,
         suffixing = c("K", NA, "Bn", NA, "Qa", NA, NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;$1.80Qa", "&minus;$17,000.00Bn", "&minus;$16.00Bn",
      "&minus;$150,000.00K", "&minus;$1,400.00K", "&minus;$13.00K",
      "&minus;$1.20K", "&minus;$11.00", "$0.00", "$11.00", "$1.20K",
      "$13.00K", "$1,400.00K", "$150,000.00K", "$16.00Bn",
      "$17,000.00Bn", "$1.80Qa")
  )

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to FALSE (the default option, where
  # no scaling or suffixing is performed)
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num", decimals = 2,
         suffixing = FALSE) %>%
       render_formats_test(context = "html"))[["num"]],
    c( "&minus;$1,800,000,000,000,000.00", "&minus;$17,000,000,000,000.00",
       "&minus;$16,000,000,000.00", "&minus;$150,000,000.00",
       "&minus;$1,400,000.00", "&minus;$13,000.00", "&minus;$1,200.00",
       "&minus;$11.00", "$0.00", "$11.00", "$1,200.00", "$13,000.00",
       "$1,400,000.00", "$150,000,000.00", "$16,000,000,000.00",
       "$17,000,000,000,000.00", "$1,800,000,000,000,000.00")
  )

  # Expect an error if any vector length other than
  # four is used for `suffixing`
  expect_silent(
    tab %>%
      fmt_currency(
        columns = "num", decimals = 2,
        suffixing = c("k", "M", "Bn", "Tr", "Zn")
      )
  )

  expect_silent(
    tab %>%
      fmt_currency(
        columns = "num", decimals = 2,
        suffixing = c("k", NA)
      )
  )

  # Create an input data frame with a single
  # numeric column and with one row
  data_tbl_2 <- data.frame(num = 999.9999)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl_2` dataset
  tab_2 <- gt(data = data_tbl_2)

  #
  # Adjust the `decimals` value to verify that
  # rounding is taken into consideration when
  # applying large-number scaling
  #

  expect_equal(
    (tab_2 %>%
       fmt_currency(
         columns = "num", decimals = 1,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "$1.0K")

  expect_equal(
    (tab_2 %>%
       fmt_currency(
         columns = "num", decimals = 2,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "$1.00K")

  expect_equal(
    (tab_2 %>%
       fmt_currency(
         columns = "num", decimals = 3,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "$1.000K")

  expect_equal(
    (tab_2 %>%
       fmt_currency(
         columns = "num", decimals = 4,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "$999.9999")

  expect_equal(
    (tab_2 %>%
       fmt_currency(
         columns = "num", decimals = 5,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "$999.99990")
})

test_that("the `currency()` helper function works correctly", {

  # Expect that the object produced by `currency()` is a
  # list with `gt_currency` class
  expect_true(
    currency(html = "&#8383;", latex = "BTC", default = "BTC") %>%
      is.list()
  )

  expect_is(
    currency(html = "&#8383;", latex = "BTC", default = "BTC"),
    "gt_currency"
  )

  # Expect as many components as there are named arguments
  currency(html = "&#8383;", latex = "BTC", default = "BTC") %>%
    length() %>%
    expect_equal(3)

  currency(html = "&#8383;", default = "BTC") %>%
    length() %>%
    expect_equal(2)

  currency(default = "BTC") %>%
    length() %>%
    expect_equal(1)

  # Expect that a single, unnamed string will be upgraded
  # to the `default` context
  single_default_currency <- currency("BTC")

  single_default_currency %>% is.list() %>% expect_true()
  single_default_currency %>% expect_is("gt_currency")
  single_default_currency %>% length() %>% expect_equal(1)
  single_default_currency %>% names() %>% expect_equal("default")
  single_default_currency[[1]] %>% expect_equal("BTC")

  # Expect an error if nothing is provided
  expect_error(currency())

  # Expect an error if any argument names don't correspond
  # to the available contexts
  expect_error(currency(html = "&#8383;", none = "BTC"))

  # Expect an error there are no names and there are multiple items
  expect_error(currency("&#8383;", "BTC"))

  # Expect an error if there is partial naming
  expect_error(currency(html = "&#8383;", "BTC"))

  # Expect an error if there are duplicate names
  expect_error(currency(html = "&#8383;", default = "BTC", default = "BT"))

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

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Format the `num_1` column using the `currency()` helper function;
  # extract `output_df` in the HTML context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1",
         currency = currency(html = "&#8383;", latex = "BTC", default = "BTC"),
         decimals = 4) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&#8383;1,836.2300", "&#8383;2,763.3900", "&#8383;937.2900",
      "&#8383;643.0000", "&#8383;212.2320", "&#8383;0.0000",
      "&minus;&#8383;23.2400")
  )

  # Format the `num_1` column using the `currency()` helper function (not
  # supplying a value for `decimals`); extract `output_df` in the HTML
  # context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1",
         currency = currency(
           html = "&#8383;", latex = "BTC", default = "BTC")
       ) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("&#8383;1,836.23", "&#8383;2,763.39", "&#8383;937.29",
      "&#8383;643.00", "&#8383;212.23", "&#8383;0.00",
      "&minus;&#8383;23.24")
  )

  # Format the `num_1` column using the `currency()` helper function;
  # extract `output_df` in the LaTeX context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1",
         currency = currency(html = "&#8383;", latex = "BTC", default = "BTC"),
         decimals = 4) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$\\text{BTC}1,836.2300$", "$\\text{BTC}2,763.3900$",
      "$\\text{BTC}937.2900$", "$\\text{BTC}643.0000$",
      "$\\text{BTC}212.2320$", "$\\text{BTC}0.0000$", "$-\\text{BTC}23.2400$")
  )

  # Format the `num_1` column using the `currency()` helper function;
  # extract `output_df` in the HTML context and compare to expected values
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1",
         currency = currency(latex = "BTC", default = "bt"),
         decimals = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("bt1,836.23", "bt2,763.39", "bt937.29", "bt643.00", "bt212.23", "bt0.00",
      "&minus;bt23.24")
  )

  # Format the `num_1` column using the `currency()` helper function;
  # extract `output_df` in the LaTeX context and compare to expected values
  # (we expect that values are escaped for LaTeX)
  expect_equal(
    (tab %>%
       fmt_currency(
         columns = "num_1",
         currency = currency(html = "HKD", latex = "HK$", default = "hkd"),
         decimals = 2) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$\\text{HK\\$}1,836.23$", "$\\text{HK\\$}2,763.39$",
      "$\\text{HK\\$}937.29$", "$\\text{HK\\$}643.00$",
      "$\\text{HK\\$}212.23$", "$\\text{HK\\$}0.00$", "$-\\text{HK\\$}23.24$")
  )
})
