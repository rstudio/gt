test_that("the `fmt_integer()` function works correctly in the HTML context", {

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

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data_tbl)

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
      fmt_integer(columns = num_3)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab %>%
      fmt_integer(columns = num_2, locale = "aa_bb")
  )

  # Format the `num_1` column, use all
  # other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("1,836", "2,763", "937", "643", "212", "0", "&minus;23")
  )

  # Format the `num_1` column, don't use digit
  # grouping separators, use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, use_seps = FALSE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1836", "2763", "937", "643", "212", "0", "&minus;23")
  )

  # Format the `num_1` column, use a single space
  # character as digit grouping separators, use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, sep_mark = " ") %>%
       render_formats_test("html"))[["num_1"]],
    c("1 836", "2 763", "937", "643", "212", "0", "&minus;23")
  )

  # Format the `num_1` column, use a period for the
  # digit grouping separators
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, sep_mark = ".") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836", "2.763", "937", "643", "212", "0", "&minus;23")
  )

  # Format the `num_1` column, scale all values by
  # 1/1000, use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num_1"]],
    c("2", "3", "1", "1", "0", "0", "0")
  )

  # Format the `num_1` column, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, pattern = "a {x} b") %>%
       render_formats_test("html"))[["num_1"]],
    c("a 1,836 b", "a 2,763 b", "a 937 b", "a 643 b", "a 212 b",
      "a 0 b", "a &minus;23 b")
  )

  # Format the `num_1` column, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, scale_by = 1/1000, pattern = "{x}K") %>%
       render_formats_test("html"))[["num_1"]],
    c("2K", "3K", "1K", "1K", "0K", "0K", "0K")
  )

  # Format the `num_1` column, use accounting style
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, accounting = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836", "2,763", "937", "643", "212", "0", "(23)")
  )

  # Format the `num_1` column, use accounting style
  # and a pattern around the values
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num_1, accounting = TRUE, pattern = "a{x}b") %>%
       render_formats_test("html"))[["num_1"]],
    c("a1,836b", "a2,763b", "a937b", "a643b", "a212b", "a0b", "a(23)b")
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num_1, force_sign = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("+1,836", "+2,763", "+937", "+643", "+212", "0", "&minus;23")
  )

  # Expect that using `force_sign = TRUE` with `accounting = TRUE`
  # will render values in accounting format
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num_1, accounting = TRUE, force_sign = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    (tab %>%
       fmt_integer(
         columns = num_1, accounting = TRUE) %>%
       render_formats_test("html"))[["num_1"]]
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num_1, pattern = "*{x}*", force_sign = TRUE) %>%
       render_formats_test("html"))[["num_1"]],
    c("*+1,836*", "*+2,763*", "*+937*", "*+643*", "*+212*", "*0*", "*&minus;23*")
  )

  # Format the `num_1`, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, locale = "en_US") %>%
       render_formats_test("html"))[["num_1"]],
    c("1,836", "2,763", "937", "643", "212", "0", "&minus;23")
  )

  # Format the `num_1` column, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tab %>%
       fmt_integer(columns = num_1, locale = "da_DK") %>%
       render_formats_test("html"))[["num_1"]],
    c("1.836", "2.763", "937", "643", "212", "0", "&minus;23")
  )

  # Expect that a column with NAs will work fine with `fmt_integer()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) %>% gt()

  # Expect a returned object of class `gt_tbl` with various uses of `fmt_integer()`
  expect_error(
    regexp = NA,
    na_col_tbl %>% fmt_integer(columns = a) %>%
      as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_integer(columns = a, rows = 1:5) %>%
      as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_integer(columns = a, scale_by = 100) %>%
      as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_integer(columns = a, suffixing = TRUE) %>%
      as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_integer(columns = a, pattern = "a{x}b") %>%
      as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl %>%
       fmt_integer(columns = a) %>%
       fmt_integer(columns = b) %>% render_formats_test("html"))[["b"]],
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
  )
})

test_that("the `fmt_integer()` function can scale/suffix larger numbers", {

  # Create an input data frame four columns: two
  # character-based and two that are numeric
  data_tbl <-
    data.frame(
      num = c(
        -1.8E15, -1.7E13, -1.6E10, -1.5E8, -1.4E6, -1.3E4, -1.2E3, -1.1E1,
        0,
        1.1E1, 1.2E3, 1.3E4, 1.4E6, 1.5E8, 1.6E10, 1.7E13, 1.8E15
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data_tbl)

  # Format the `num` column, have the `suffixing` option
  # set to TRUE (default labels, all 4 ranges used)
  expect_equal(
    (tab %>%
       fmt_integer(columns = num, suffixing = TRUE) %>%
       render_formats_test(context = "html"))[["num"]],
    c(
      "&minus;1,800T", "&minus;17T", "&minus;16B", "&minus;150M",
      "&minus;1M", "&minus;13K", "&minus;1K", "&minus;11", "0", "11",
      "1K", "13K", "1M", "150M", "16B", "17T", "1,800T"
    )
  )

  # Format the `num` column, have the `suffixing`
  # option set to use custom symbols across the 4 different ranges
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num,
         suffixing = c("k", "Mn", "Bn", "Tr")) %>%
       render_formats_test(context = "html"))[["num"]],
    c(
      "&minus;1,800Tr", "&minus;17Tr", "&minus;16Bn", "&minus;150Mn",
      "&minus;1Mn", "&minus;13k", "&minus;1k", "&minus;11", "0", "11",
      "1k", "13k", "1Mn", "150Mn", "16Bn", "17Tr", "1,800Tr"
    )
  )

  # Format the `num` column, have the `suffixing` option
  # set to use custom symbols for the middle two ranges (millions and billions)
  expect_equal(
    (tab %>%
       fmt_integer(
         columns = num,
         suffixing = c(NA, "Mio.", "Mia.", NA)) %>%
       render_formats_test(context = "html"))[["num"]],
    c(
      "&minus;1,800,000Mia.", "&minus;17,000Mia.", "&minus;16Mia.",
      "&minus;150Mio.", "&minus;1Mio.", "&minus;13,000", "&minus;1,200",
      "&minus;11", "0", "11", "1,200", "13,000", "1Mio.", "150Mio.",
      "16Mia.", "17,000Mia.", "1,800,000Mia."
    )
  )

  # Expect an error if any vector length other than four is used for `suffixing`
  expect_silent(
    tab %>%
      fmt_integer(
        columns = num, suffixing = c("k", "M", "Bn", "Tr", "Zn")
      )
  )

  expect_silent(
    tab %>%
      fmt_integer(
        columns = num, suffixing = c("k", NA)
      )
  )
})

test_that("rownames and groupnames aren't included in columns = TRUE", {

  mtcars1 <- cbind(mtcars, chardata = row.names(mtcars))

  # This fails; can't apply numeric formatting to the "chardata" col
  expect_error(mtcars1 %>% gt() %>% fmt_integer(columns = everything()))

  # These succeed because the "chardata" col no longer counts as a
  # resolvable column if it's a rowname_col or groupname_col, yet, it's
  # still visible as a column in the `rows` expression
  expect_error(
    regexp = NA,
    mtcars1 %>%
      gt(rowname_col = "chardata") %>%
      fmt_integer(columns = everything(), rows = chardata == "Mazda RX4")
  )

  expect_error(
    regexp = NA,
    mtcars1 %>%
      gt(groupname_col = "chardata") %>%
      fmt_integer(columns = everything(), rows = chardata == "Mazda RX4")
  )
})
