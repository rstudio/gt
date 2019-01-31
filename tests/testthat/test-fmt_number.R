context("Ensuring that the `fmt_number()` function works as expected")

test_that("the `fmt_number()` function works correctly", {

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
      stringsAsFactors = FALSE)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  expect_true(
    all(
      names(attributes(tab)) %in%
        c("names", "class", "row.names",
          "boxh_df", "stub_df", "footnotes_df", "styles_df",
          "rows_df", "cols_df", "col_labels", "grp_labels",
          "arrange_groups", "data_df", "opts_df", "formats", "transforms")))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char_1 <- (tab %>% as.data.frame())[["char_1"]]
  char_2 <- (tab %>% as.data.frame())[["char_2"]]
  num_1 <- (tab %>% as.data.frame())[["num_1"]]
  num_2 <- (tab %>% as.data.frame())[["num_2"]]

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
      fmt_number(columns = "num_3", decimals = 2))

  # Expect an error when using a locale that does not exist
  expect_error(
    tab %>%
      fmt_number(columns = "num_2", decimals = 2, locale = "aa_bb"))

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "-23.24"))

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 5) %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23000", "2,763.39000", "937.29000", "643.00000",
      "212.23200", "0.00000", "-23.24000"))

  # Format the `num_1` column to 2 decimal places, drop the trailing
  # zeros, use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2,
                  drop_trailing_zeros = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643", "212.23", "0", "-23.24"))

  # Format the `num_1` column to 2 decimal places, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, use_seps = FALSE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1836.23", "2763.39", "937.29", "643.00", "212.23", "0.00", "-23.24"))

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, sep_mark = " ") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836.23", "2 763.39", "937.29", "643.00", "212.23", "0.00", "-23.24"))

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2,
                  sep_mark = ".", dec_mark = ",") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "-23,24"))

  # Format the `num_1` column to 2 decimal places, apply parentheses to
  # all negative values, use all other defaults; extract `output_df` and
  # compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, negative_val = "parens") %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "(23.24)"))

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num_1"]],
    c("1.8362", "2.7634", "0.9373", "0.6430", "0.2122", "0.0000", "-0.0232"))

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, pattern = "a {x} b") %>%
       render_formats_test("html"))[["num_1"]],
    c("a 1,836.23 b", "a 2,763.39 b", "a 937.29 b", "a 643.00 b",
      "a 212.23 b", "a 0.00 b", "a -23.24 b"))

  # Format the `num_1` column to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 4,
                  scale_by = 1/1000, pattern = "{x}K") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.8362K", "2.7634K", "0.9373K", "0.6430K",
      "0.2122K", "0.0000K", "-0.0232K"))

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "en_US") %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "-23.24"))

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "da_DK") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "-23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "de_AT") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836,23", "2 763,39", "937,29", "643,00", "212,23", "0,00", "-23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "et_EE") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836,23", "2 763,39", "937,29", "643,00", "212,23", "0,00", "-23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "gl_ES") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "-23,24"))
})

test_that("the `fmt_number()` function can scale/suffix larger numbers", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      num = c(
        -1.8E15, -1.7E13, -1.6E10, -1.5E8, -1.4E6, -1.3E4, -1.2E3, -1.1E1,
        0,
        1.1E1, 1.2E3, 1.3E4, 1.4E6, 1.5E8, 1.6E10, 1.7E13, 1.8E15),
      stringsAsFactors = FALSE)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to TRUE (default labels, all
  # 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_number(columns = "num", decimals = 2, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1,800.00T", "-17.00T", "-16.00B", "-150.00M", "-1.40M", "-13.00K",
      "-1.20K", "-11.00", "0.00", "11.00", "1.20K", "13.00K", "1.40M",
      "150.00M", "16.00B", "17.00T", "1,800.00T"))

  # Format the `num` column to no decimal places, have the
  # `suffixing` option set to TRUE (default labels, all
  # 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_number(columns = "num", decimals = 0, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1,800T", "-17T", "-16B", "-150M", "-1M", "-13K",
      "-1K", "-11", "0", "11", "1K", "13K", "1M",
      "150M", "16B", "17T", "1,800T"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols across the
  # 4 different ranges
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = c("k", "Mn", "Bn", "Tr")) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1,800.00Tr", "-17.00Tr", "-16.00Bn", "-150.00Mn", "-1.40Mn", "-13.00k",
      "-1.20k", "-11.00", "0.00", "11.00", "1.20k", "13.00k", "1.40Mn",
      "150.00Mn", "16.00Bn", "17.00Tr", "1,800.00Tr"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols for the middle
  # two ranges (millions and billions)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = c(NA, "Mio.", "Mia.", NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1,800,000.00Mia.", "-17,000.00Mia.", "-16.00Mia.", "-150.00Mio.",
      "-1.40Mio.", "-13,000.00", "-1,200.00", "-11.00", "0.00", "11.00",
      "1,200.00", "13,000.00", "1.40Mio.", "150.00Mio.", "16.00Mia.",
      "17,000.00Mia.", "1,800,000.00Mia."))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols with some NAs
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = c("K", NA, "Bn", NA, "Qa", NA, NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1.80Qa", "-17,000.00Bn", "-16.00Bn", "-150,000.00K",
      "-1,400.00K", "-13.00K", "-1.20K", "-11.00", "0.00", "11.00",
      "1.20K", "13.00K", "1,400.00K", "150,000.00K", "16.00Bn",
      "17,000.00Bn", "1.80Qa"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to FALSE (the default option, where
  # no scaling or suffixing is performed)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = FALSE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("-1,800,000,000,000,000.00", "-17,000,000,000,000.00",
      "-16,000,000,000.00", "-150,000,000.00", "-1,400,000.00", "-13,000.00",
      "-1,200.00", "-11.00", "0.00", "11.00", "1,200.00", "13,000.00",
      "1,400,000.00", "150,000,000.00", "16,000,000,000.00",
      "17,000,000,000,000.00", "1,800,000,000,000,000.00"))

  # Expect an error if any vector length other than
  # four is used for `suffixing`
  expect_silent(
    tab %>%
      fmt_number(
        columns = "num", decimals = 2,
        suffixing = c("k", "M", "Bn", "Tr", "Zn")
      )
  )

  expect_silent(
    tab %>%
      fmt_number(
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
       fmt_number(
         columns = "num", decimals = 1,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "1.0K")

  expect_equal(
    (tab_2 %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "1.00K")

  expect_equal(
    (tab_2 %>%
       fmt_number(
         columns = "num", decimals = 3,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "1.000K")

  expect_equal(
    (tab_2 %>%
       fmt_number(
         columns = "num", decimals = 4,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "999.9999")

  expect_equal(
    (tab_2 %>%
       fmt_number(
         columns = "num", decimals = 5,
         suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    "999.99990")
})
