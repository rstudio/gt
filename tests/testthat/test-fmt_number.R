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
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "&minus;23.24"))

  # Format the `num_1` column to 5 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 5) %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23000", "2,763.39000", "937.29000", "643.00000",
      "212.23200", "0.00000", "&minus;23.24000"))

  # Format the `num_1` column to 2 decimal places, drop the trailing
  # zeros, use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2,
                  drop_trailing_zeros = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643", "212.23", "0", "&minus;23.24"))

  # Format the `num_1` column to 2 decimal places, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, use_seps = FALSE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1836.23", "2763.39", "937.29", "643.00", "212.23", "0.00", "&minus;23.24"))

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, sep_mark = " ") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836.23", "2 763.39", "937.29", "643.00", "212.23", "0.00", "&minus;23.24"))
  
  # Format the `num_1` column to use accounting formatting, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", accounting = TRUE) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("<span style=\"visibility: hidden;\">(</span>1,836.23<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>2,763.39<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>937.29<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>643.00<span style=\"visibility: hidden;\">)</span>",
      "<span style=\"visibility: hidden;\">(</span>212.23<span style=\"visibility: hidden;\">)</span>", 
      "<span style=\"visibility: hidden;\">(</span>0.00<span style=\"visibility: hidden;\">)</span>", 
      "(23.24)"))

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2,
                  sep_mark = ".", dec_mark = ",") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "&minus;23,24"))

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num_1"]],
    c("1.8362", "2.7634", "0.9373", "0.6430", "0.2122", "0.0000", "&minus;0.0232"))

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, pattern = "a {x} b") %>%
       render_formats_test("html"))[["num_1"]],
    c("a 1,836.23 b", "a 2,763.39 b", "a 937.29 b", "a 643.00 b",
      "a 212.23 b", "a 0.00 b", "a &minus;23.24 b"))

  # Format the `num_1` column to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 4,
                  scale_by = 1/1000, pattern = "{x}K") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.8362K", "2.7634K", "0.9373K", "0.6430K",
      "0.2122K", "0.0000K", "&minus;0.0232K"))

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "en_US") %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "&minus;23.24"))

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "da_DK") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "&minus;23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "de_AT") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836,23", "2 763,39", "937,29", "643,00", "212,23", "0,00", "&minus;23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "et_EE") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836,23", "2 763,39", "937,29", "643,00", "212,23", "0,00", "&minus;23,24"))

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab %>%
       fmt_number(columns = "num_1", decimals = 2, locale = "gl_ES") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", "&minus;23,24"))

  # Expect that a column with NAs will work fine with `fmt_number()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) %>% gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_number()`
  expect_error(
    na_col_tbl %>% fmt_number(columns = vars(a)) %>% as_raw_html(), NA
  )
  expect_error(
    na_col_tbl %>%
      fmt_number(columns = vars(a), rows = 1:5) %>% as_raw_html(), NA
  )
  expect_error(
    na_col_tbl %>%
      fmt_number(columns = vars(a), scale_by = 100) %>% as_raw_html(), NA
  )
  expect_error(
    na_col_tbl %>%
      fmt_number(columns = vars(a), suffixing = TRUE) %>% as_raw_html(), NA
  )
  expect_error(
    na_col_tbl %>%
      fmt_number(columns = vars(a), pattern = "a{x}b") %>% as_raw_html(), NA
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl %>%
       fmt_number(columns = vars(a)) %>%
       fmt_number(columns = vars(b)) %>% render_formats_test("html"))[["b"]],
    c("1.00", "2.00", "3.00", "4.00", "5.00", "6.00", "7.00", "8.00",
      "9.00", "10.00")
  )
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
    c("&minus;1,800.00T", "&minus;17.00T", "&minus;16.00B",
      "&minus;150.00M", "&minus;1.40M", "&minus;13.00K",
      "&minus;1.20K", "&minus;11.00", "0.00", "11.00",
      "1.20K", "13.00K", "1.40M", "150.00M", "16.00B",
      "17.00T", "1,800.00T")
  )

  # Format the `num` column to no decimal places, have the
  # `suffixing` option set to TRUE (default labels, all
  # 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_number(columns = "num", decimals = 0, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;1,800T", "&minus;17T", "&minus;16B", "&minus;150M",
      "&minus;1M", "&minus;13K", "&minus;1K", "&minus;11", "0", "11",
      "1K", "13K", "1M", "150M", "16B", "17T", "1,800T"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols across the
  # 4 different ranges
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = c("k", "Mn", "Bn", "Tr")) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;1,800.00Tr", "&minus;17.00Tr", "&minus;16.00Bn",
      "&minus;150.00Mn", "&minus;1.40Mn", "&minus;13.00k",
      "&minus;1.20k", "&minus;11.00", "0.00", "11.00", "1.20k",
      "13.00k", "1.40Mn", "150.00Mn", "16.00Bn", "17.00Tr", "1,800.00Tr"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols for the middle
  # two ranges (millions and billions)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = c(NA, "Mio.", "Mia.", NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;1,800,000.00Mia.", "&minus;17,000.00Mia.",
      "&minus;16.00Mia.", "&minus;150.00Mio.", "&minus;1.40Mio.",
      "&minus;13,000.00", "&minus;1,200.00", "&minus;11.00", "0.00", "11.00",
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
    c("&minus;1.80Qa", "&minus;17,000.00Bn", "&minus;16.00Bn",
      "&minus;150,000.00K", "&minus;1,400.00K", "&minus;13.00K",
      "&minus;1.20K", "&minus;11.00", "0.00", "11.00", "1.20K", "13.00K",
      "1,400.00K", "150,000.00K", "16.00Bn", "17,000.00Bn", "1.80Qa"))

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to FALSE (the default option, where
  # no scaling or suffixing is performed)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = "num", decimals = 2,
         suffixing = FALSE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;1,800,000,000,000,000.00", "&minus;17,000,000,000,000.00",
      "&minus;16,000,000,000.00", "&minus;150,000,000.00",
      "&minus;1,400,000.00", "&minus;13,000.00", "&minus;1,200.00",
      "&minus;11.00", "0.00", "11.00", "1,200.00", "13,000.00",
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

test_that("`fmt_number()` with `suffixing = TRUE` works with small numbers", {

  # Create an input data frame with a single column
  data_tbl <-
    data.frame(
      num = c(
        -0.5, -0.05, -0.04, -0.03, -0.02, -0.01,
        0,
        0.01, 0.02, 0.03, 0.04, 0.05, 0.5),
      stringsAsFactors = FALSE)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to TRUE; we shouldn't expect to
  # see any suffixes
  expect_equal(
    (tab %>%
       fmt_number(columns = "num", decimals = 2, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c("&minus;0.50", "&minus;0.05", "&minus;0.04", "&minus;0.03",
      "&minus;0.02", "&minus;0.01", "0.00", "0.01", "0.02", "0.03",
      "0.04", "0.05", "0.50")
  )
})

test_that("rownames and groupnames aren't included in columns = TRUE", {
  mtcars1 <- cbind(mtcars, chardata = row.names(mtcars))

  # This fails; can't apply numeric formatting to the "chardata" col
  expect_error(mtcars1 %>% gt() %>% fmt_number(columns = TRUE))


  # These succeed; the "chardata" col no longer counts as a resolvable column
  # if it's a rowname_col or groupname_col, yet it's still visible as a column
  # in the `rows` expression

  expect_error(regexp = NA,
    mtcars1 %>%
      gt(rowname_col = "chardata") %>%
      fmt_number(columns = TRUE, rows = chardata == "Mazda RX4")
  )

  expect_error(regexp = NA,
    mtcars1 %>%
      gt(groupname_col = "chardata") %>%
      fmt_number(columns = TRUE, rows = chardata == "Mazda RX4")
  )
})
