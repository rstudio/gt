test_that("fmt_number() works correctly in the HTML context", {

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
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char_1 <- dt_data_get(tab)[["char_1"]]
  char_2 <- dt_data_get(tab)[["char_2"]]
  num_1 <- dt_data_get(tab)[["num_1"]]
  num_2 <- dt_data_get(tab)[["num_2"]]

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
      fmt_number(columns = num_3, decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab |>
      fmt_number(columns = num_2, decimals = 2, locale = "aa_bb")
  )

  # Format the `num_1` column to 2 decimal places, use all
  # other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2) |>
       render_formats_test(context = "html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", paste0("\U02212", "23.24"))
  )

  # Format the `num_1` column to 5 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 5) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "1,836.23000", "2,763.39000", "937.29000", "643.00000",
      "212.23200", "0.00000", paste0("\U02212", "23.24000")
    )
  )

  # Format the `num_1` column to 2 decimal places, drop the trailing
  # zeros, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2,
                  drop_trailing_zeros = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643", "212.23", "0", paste0("\U02212", "23.24"))
  )

  # Format the `num_1` column to 2 decimal places, don't use digit
  # grouping separators, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, use_seps = FALSE) |>
       render_formats_test("html"))[["num_1"]],
    c("1836.23", "2763.39", "937.29", "643.00", "212.23", "0.00", paste0("\U02212", "23.24"))
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, sep_mark = " ") |>
       render_formats_test("html"))[["num_1"]],
    c("1 836.23", "2 763.39", "937.29", "643.00", "212.23", "0.00", paste0("\U02212", "23.24"))
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2,
                  sep_mark = ".", dec_mark = ",") |>
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", paste0("\U02212", "23,24"))
  )

  # Format the `num_1` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 4, scale_by = 1/1000) |>
       render_formats_test("html"))[["num_1"]],
    c("1.8362", "2.7634", "0.9373", "0.6430", "0.2122", "0.0000", paste0("\U02212", "0.0232"))
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, pattern = "a {x} b") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "a 1,836.23 b", "a 2,763.39 b", "a 937.29 b", "a 643.00 b",
      "a 212.23 b", "a 0.00 b", paste0("a \U02212", "23.24 b")
    )
  )

  # Format the `num_1` column to 4 decimal places, scale all values
  # by 1/1000 and append a `K` character to the resultant values, use
  # all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 4,
                  scale_by = 1/1000, pattern = "{x}K") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "1.8362K", "2.7634K", "0.9373K", "0.6430K",
      "0.2122K", "0.0000K", paste0("\U02212", "0.0232K")
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, accounting = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", "(23.24)")
  )

  # Format the `num_1` column to 3 decimal places, use accounting style
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 3, accounting = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "1,836.230", "2,763.390", "937.290", "643.000", "212.232",
      "0.000", "(23.240)"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and a pattern around the values
  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1, decimals = 3,
         accounting = TRUE, pattern = "a{x}b") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "a1,836.230b", "a2,763.390b", "a937.290b", "a643.000b", "a212.232b",
      "a0.000b", "a(23.240)b"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and drop all trailing zeros
  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1, decimals = 3,
         accounting = TRUE, drop_trailing_zeros = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643", "212.232", "0", "(23.24)")
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1, decimals = 3, force_sign = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c("+1,836.230", "+2,763.390", "+937.290", "+643.000", "+212.232", "0.000", paste0("\U02212", "23.240"))
  )

  # Expect that using `force_sign = TRUE` with `accounting = TRUE`
  # will render values in accounting format
  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1, decimals = 3, accounting = TRUE, force_sign = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    (tab |>
       fmt_number(
         columns = num_1, decimals = 3, accounting = TRUE) |>
       render_formats_test("html"))[["num_1"]]
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab |>
       fmt_number(
         columns = num_1, pattern = "*{x}*", force_sign = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "*+1,836.23*", "*+2,763.39*", "*+937.29*", "*+643.00*", "*+212.23*",
      "*0.00*", paste0("*\U02212", "23.24*")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, locale = "en_US") |>
       render_formats_test("html"))[["num_1"]],
    c("1,836.23", "2,763.39", "937.29", "643.00", "212.23", "0.00", paste0("\U02212", "23.24"))
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, locale = "da_DK") |>
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", paste0("\U02212", "23,24"))
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, locale = "de_AT") |>
       render_formats_test("html"))[["num_1"]],
    c("1 836,23", "2 763,39", "937,29", "643,00", "212,23", "0,00", paste0("\U02212", "23,24"))
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults
  # Note: Estonian (et) has minimum_grouping_digits=2 (CLDR), so only numbers
  # with 5+ digits (10000+) get separators
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, locale = "et_EE") |>
       render_formats_test("html"))[["num_1"]],
    c("1836,23", "2763,39", "937,29", "643,00", "212,23", "0,00", paste0("\U02212", "23,24"))
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_number(columns = num_1, decimals = 2, locale = "gl_ES") |>
       render_formats_test("html"))[["num_1"]],
    c("1.836,23", "2.763,39", "937,29", "643,00", "212,23", "0,00", paste0("\U02212", "23,24"))
  )

  # Expect that a column with NAs will work fine with `fmt_number()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various uses of `fmt_number()`
  expect_no_error(
    na_col_tbl |> fmt_number(columns = a) |>
      as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_number(columns = a, rows = 1:5) |>
      as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_number(columns = a, scale_by = 100) |>
      as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_number(columns = a, suffixing = TRUE) |>
      as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_number(columns = a, pattern = "a{x}b") |>
      as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_number(columns = a) |>
       fmt_number(columns = b) |> render_formats_test("html"))[["b"]],
    c("1.00", "2.00", "3.00", "4.00", "5.00", "6.00", "7.00", "8.00", "9.00", "10.00")
  )
})

test_that("fmt_number() can scale/suffix larger numbers", {

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

  # Format the `num` column to 2 decimal places, have the `suffixing` option
  # set to TRUE (default labels, all 4 ranges used)
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 2, suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1,800.00T"),
      paste0("\U02212", "17.00T"),
      paste0("\U02212", "16.00B"),
      paste0("\U02212", "150.00M"),
      paste0("\U02212", "1.40M"),
      paste0("\U02212", "13.00K"),
      paste0("\U02212", "1.20K"),
      paste0("\U02212", "11.00"),
      "0.00", "11.00", "1.20K", "13.00K", "1.40M",
      "150.00M", "16.00B", "17.00T", "1,800.00T"
    )
  )

  # Format the `num` column to no decimal places, have the `suffixing`
  # option set to TRUE (default labels, all 4 ranges used)
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 0, suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1,800T"),
      paste0("\U02212", "17T"),
      paste0("\U02212", "16B"),
      paste0("\U02212", "150M"),
      paste0("\U02212", "1M"),
      paste0("\U02212", "13K"),
      paste0("\U02212", "1K"),
      paste0("\U02212", "11"),
      "0", "11", "1K", "13K", "1M",
      "150M", "16B", "17T", "1,800T"
    )
  )

  # Format the `num` column to 2 decimal places, have the `suffixing`
  # option set to use custom symbols across the 4 different ranges
  expect_equal(
    (tab |>
       fmt_number(
         columns = num, decimals = 2,
         suffixing = c("k", "Mn", "Bn", "Tr")) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1,800.00Tr"),
      paste0("\U02212", "17.00Tr"),
      paste0("\U02212", "16.00Bn"),
      paste0("\U02212", "150.00Mn"),
      paste0("\U02212", "1.40Mn"),
      paste0("\U02212", "13.00k"),
      paste0("\U02212", "1.20k"),
      paste0("\U02212", "11.00"),
      "0.00", "11.00", "1.20k", "13.00k", "1.40Mn",
      "150.00Mn", "16.00Bn", "17.00Tr", "1,800.00Tr"
    )
  )

  # Format the `num` column to 2 decimal places, have the `suffixing` option
  # set to use custom symbols for the middle two ranges (millions and billions)
  expect_equal(
    (tab |>
       fmt_number(
         columns = num, decimals = 2,
         suffixing = c(NA, "Mio.", "Mia.", NA)) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1,800,000.00Mia."),
      paste0("\U02212", "17,000.00Mia."),
      paste0("\U02212", "16.00Mia."),
      paste0("\U02212", "150.00Mio."),
      paste0("\U02212", "1.40Mio."),
      paste0("\U02212", "13,000.00"),
      paste0("\U02212", "1,200.00"),
      paste0("\U02212", "11.00"),
      "0.00", "11.00", "1,200.00", "13,000.00", "1.40Mio.",
      "150.00Mio.", "16.00Mia.", "17,000.00Mia.", "1,800,000.00Mia."
    )
  )

  # Format the `num` column to 2 decimal places, have the
  # `suffixing` option set to use custom symbols with some NAs
  expect_equal(
    (tab |>
       fmt_number(
         columns = num, decimals = 2,
         suffixing = c("K", NA, "Bn", NA, "Qa", NA, NA)) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1.80Qa"),
      paste0("\U02212", "17,000.00Bn"),
      paste0("\U02212", "16.00Bn"),
      paste0("\U02212", "150,000.00K"),
      paste0("\U02212", "1,400.00K"),
      paste0("\U02212", "13.00K"),
      paste0("\U02212", "1.20K"),
      paste0("\U02212", "11.00"),
      "0.00", "11.00", "1.20K", "13.00K", "1,400.00K",
      "150,000.00K", "16.00Bn", "17,000.00Bn", "1.80Qa"
    )
  )

  # Format the `num` column to 2 decimal places, have the `suffixing` option
  # set to FALSE (the default option, where no scaling or suffixing is performed)
  expect_equal(
    (tab |>
       fmt_number(
         columns = num, decimals = 2,
         suffixing = FALSE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "1,800,000,000,000,000.00"),
      paste0("\U02212", "17,000,000,000,000.00"),
      paste0("\U02212", "16,000,000,000.00"),
      paste0("\U02212", "150,000,000.00"),
      paste0("\U02212", "1,400,000.00"),
      paste0("\U02212", "13,000.00"),
      paste0("\U02212", "1,200.00"),
      paste0("\U02212", "11.00"),
      "0.00", "11.00", "1,200.00", "13,000.00",
      "1,400,000.00", "150,000,000.00", "16,000,000,000.00",
      "17,000,000,000,000.00", "1,800,000,000,000,000.00"
    )
  )

  # Expect an error if any vector length other than four is used for `suffixing`
  expect_silent(
    tab |>
      fmt_number(
        columns = num, decimals = 2,
        suffixing = c("k", "M", "Bn", "Tr", "Zn")
      )
  )

  expect_silent(
    tab |>
      fmt_number(
        columns = num, decimals = 2,
        suffixing = c("k", NA)
      )
  )

  # Create an input data frame with a single
  # numeric column and with one row
  data_tbl_2 <- data.frame(num = 999.9999)

  # Create a `gt_tbl` object with `gt()` and the `data_tbl_2` dataset
  tab_2 <- gt(data_tbl_2)

  #
  # Adjust the `decimals` value to verify that
  # rounding is taken into consideration when
  # applying large-number scaling
  #

  expect_equal(
    (tab_2 |>
       fmt_number(
         columns = num, decimals = 1,
         suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    "1.0K"
  )

  expect_equal(
    (tab_2 |>
       fmt_number(
         columns = num, decimals = 2,
         suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    "1.00K"
  )

  expect_equal(
    (tab_2 |>
       fmt_number(
         columns = num, decimals = 3,
         suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    "1.000K"
  )

  expect_equal(
    (tab_2 |>
       fmt_number(
         columns = num, decimals = 4,
         suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    "999.9999"
  )

  expect_equal(
    (tab_2 |>
       fmt_number(
         columns = num, decimals = 5,
         suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    "999.99990"
  )
})

test_that("fmt_number() formats to specified significant figures", {

  # These numbers will be used in tests of formatting
  # correctly to n significant figures
  numbers <-
    c(
      50000.01,        #1
      1000.001,        #2
      10.00001,        #3
      12345,           #4
      1234.5,          #5
      123.45,          #6
      1.2345,          #7
      0.12345,         #8
      0.0000123456,    #9
      -50000.01,      #10
      -1000.001,      #11
      -10.00001,      #12
      -12345,         #13
      -1234.5,        #14
      -123.45,        #15
      -1.2345,        #16
      -0.12345,       #17
      -0.0000123456   #18
    )

  # Create a single-column tibble with these values in `num`
  numbers_tbl <- dplyr::tibble(num = numbers)

  # Create a `gt_tbl` object with `gt()` and the `numbers_tbl` dataset
  tab <- gt(numbers_tbl)

  # Format the `num` column to 5 significant figures
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 5) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,000", "1,000.0", "10.000", "12,345", "1,234.5",
      "123.45", "1.2345", "0.12345", "0.000012346",
      paste0("\U02212", "50,000"),
      paste0("\U02212", "1,000.0"),
      paste0("\U02212", "10.000"),
      paste0("\U02212", "12,345"),
      paste0("\U02212", "1,234.5"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.2345"),
      paste0("\U02212", "0.12345"),
      paste0("\U02212", "0.000012346")
    )
  )

  # Format the `num` column to 4 significant figures
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 4) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,000", "1,000", "10.00", "12,340", "1,234",
      "123.4", "1.234", "0.1234", "0.00001235",
      paste0("\U02212", "50,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,340"),
      paste0("\U02212", "1,234"),
      paste0("\U02212", "123.4"),
      paste0("\U02212", "1.234"),
      paste0("\U02212", "0.1234"),
      paste0("\U02212", "0.00001235")
    )
  )

  # Format the `num` column to 3 significant figures
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 3) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,000", "1,000", "10.0", "12,300", "1,230",
      "123", "1.23", "0.123", "0.0000123",
      paste0("\U02212", "50,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "10.0"),
      paste0("\U02212", "12,300"),
      paste0("\U02212", "1,230"),
      paste0("\U02212", "123"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.123"),
      paste0("\U02212", "0.0000123")
    )
  )

  # Format the `num` column to 2 significant figures
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 2) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,000", "1,000", "10", "12,000", "1,200",
      "120", "1.2", "0.12", "0.000012",
      paste0("\U02212", "50,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "10"),
      paste0("\U02212", "12,000"),
      paste0("\U02212", "1,200"),
      paste0("\U02212", "120"),
      paste0("\U02212", "1.2"),
      paste0("\U02212", "0.12"),
      paste0("\U02212", "0.000012")
    )
  )

  # Format the `num` column to 1 significant figure
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 1) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,000", "1,000", "10", "10,000",
      "1,000", "100", "1", "0.1", "0.00001",
      paste0("\U02212", "50,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "10"),
      paste0("\U02212", "10,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "100"),
      paste0("\U02212", "1"),
      paste0("\U02212", "0.1"),
      paste0("\U02212", "0.00001")
    )
  )

  # Expect an error if the length of `n_sigfig` is not 1
  expect_error(fmt_number(tab, columns = num, n_sigfig = c(1, 2)))

  # Don't expect an error if `n_sigfig` is NA (if `n_sigfig` has NA) then
  # `decimals` is used
  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = NA))

  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = NA_integer_))

  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = NA_real_))

  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = NA_integer_))

  # Expect an error if `n_sigfig` is not numeric
  expect_error(tab |> fmt_number(columns = num, n_sigfig = "3"))

  expect_error(tab |> fmt_number(columns = num, n_sigfig = TRUE))

  expect_error(tab |> fmt_number(columns = num, n_sigfig = factor(3)))

  # Don't expect errors when using integers or doubles
  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = 2L))

  expect_no_error(tab |> fmt_number(columns = num, n_sigfig = 2))

  # Expect an error if `n_sigfig` is less than 1
  expect_error(tab |> fmt_number(columns = num, n_sigfig = 0L))

  expect_error(tab |> fmt_number(columns = num, n_sigfig = -1L))
})

test_that("`drop_trailing_dec_mark` works in select `fmt_*()` functions", {

  # These numbers will be used in tests with `drop_trailing_dec_mark = FALSE`
  numbers <- c(0.001, 0.01, 0.1, 0, 1, 1.1, 1.12, 50000, -1.5, -5, -500.1)

  # Create a single-column tibble with these values in `num`
  numbers_tbl <- dplyr::tibble(num = numbers)

  # Create a `gt_tbl` object with `gt()` and the `numbers_tbl` dataset
  tab <- gt(numbers_tbl)

  # Format the `num` column using `fmt_number()` with default options
  expect_equal(
    (tab |>
       fmt_number(columns = num, drop_trailing_dec_mark = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0.00", "0.01", "0.10", "0.00", "1.00", "1.10", "1.12", "50,000.00",
      paste0("\U02212", "1.50"),
      paste0("\U02212", "5.00"),
      paste0("\U02212", "500.10")
    )
  )

  # Format the `num` column using `fmt_number()` with `decimals = 0`
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 0) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0", "0", "0", "0", "1", "1", "1", "50,000",
      paste0("\U02212", "2"),
      paste0("\U02212", "5"),
      paste0("\U02212", "500")
    )
  )

  # Format the `num` column using `fmt_number()` with `decimals = 0` and
  # `drop_trailing_dec_mark = FALSE`
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 0, drop_trailing_dec_mark = FALSE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0.", "0.", "0.", "0.", "1.", "1.", "1.", "50,000.",
      paste0("\U02212", "2."),
      paste0("\U02212", "5."),
      paste0("\U02212", "500.")
    )
  )

  # Format the `num` column using `fmt_percent()` with default options
  expect_equal(
    (tab |>
       fmt_percent(columns = num, drop_trailing_dec_mark = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0.10%", "1.00%", "10.00%", "0.00%",
      "100.00%", "110.00%", "112.00%", "5,000,000.00%",
      paste0("\U02212", "150.00%"),
      paste0("\U02212", "500.00%"),
      paste0("\U02212", "50,010.00%")
    )
  )

  # Format the `num` column using `fmt_percent()` with `decimals = 0`
  expect_equal(
    (tab |>
       fmt_percent(columns = num, decimals = 0) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0%", "1%", "10%", "0%", "100%",
      "110%", "112%", "5,000,000%",
      paste0("\U02212", "150%"),
      paste0("\U02212", "500%"),
      paste0("\U02212", "50,010%")
    )
  )

  # Format the `num` column using `fmt_percent()` with `decimals = 0` and
  # `drop_trailing_dec_mark = FALSE`
  expect_equal(
    (tab |>
       fmt_percent(columns = num, decimals = 0, drop_trailing_dec_mark = FALSE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0.%", "1.%", "10.%", "0.%", "100.%",
      "110.%", "112.%", "5,000,000.%",
      paste0("\U02212", "150.%"),
      paste0("\U02212", "500.%"),
      paste0("\U02212", "50,010.%")
    )
  )

  # Format the `num` column using `fmt_currency()` with default options
  expect_equal(
    (tab |>
       fmt_currency(columns = num, drop_trailing_dec_mark = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "$0.00", "$0.01", "$0.10", "$0.00", "$1.00",
      "$1.10", "$1.12", "$50,000.00",
      paste0("\U02212", "$1.50"),
      paste0("\U02212", "$5.00"),
      paste0("\U02212", "$500.10")
    )
  )

  # Format the `num` column using `fmt_currency()` with `decimals = 0`
  expect_equal(
    (tab |>
       fmt_currency(columns = num, decimals = 0) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "$0", "$0", "$0", "$0", "$1", "$1", "$1", "$50,000",
      paste0("\U02212", "$2"),
      paste0("\U02212", "$5"),
      paste0("\U02212", "$500")
    )
  )

  # Format the `num` column using `fmt_currency()` with `decimals = 0` and
  # `drop_trailing_dec_mark = FALSE`
  expect_equal(
    (tab |>
       fmt_currency(columns = num, decimals = 0, drop_trailing_dec_mark = FALSE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "$0.", "$0.", "$0.", "$0.", "$1.", "$1.", "$1.", "$50,000.",
      paste0("\U02212", "$2."),
      paste0("\U02212", "$5."),
      paste0("\U02212", "$500.")
    )
  )

  # Format the `num` column using `fmt_currency()` with `decimals = 0`,
  # `drop_trailing_dec_mark = FALSE`, and placement of the currency
  # symbol ("EUR") to the right-hand side of the figure
  expect_equal(
    (tab |>
       fmt_currency(
         columns = num, currency = "EUR", decimals = 0,
         placement = "right", drop_trailing_dec_mark = FALSE
       ) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "0.&#8364;", "0.&#8364;", "0.&#8364;", "0.&#8364;", "1.&#8364;",
      "1.&#8364;", "1.&#8364;", "50,000.&#8364;",
      paste0("\U02212", "2.&#8364;"),
      paste0("\U02212", "5.&#8364;"),
      paste0("\U02212", "500.&#8364;")
    )
  )
})

test_that("fmt_number() with `suffixing = TRUE` works with small numbers", {

  # Create an input data frame with a single column
  data_tbl <-
    data.frame(
      num = c(
        -0.5, -0.05, -0.04, -0.03, -0.02, -0.01,
        0,
        0.01, 0.02, 0.03, 0.04, 0.05, 0.5
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the `data_tbl` dataset
  tab <- gt(data_tbl)

  # Format the `num` column to 2 decimal places, have the `suffixing` option
  # set to TRUE; we shouldn't expect to see any suffixes
  expect_equal(
    (tab |>
       fmt_number(columns = num, decimals = 2, suffixing = TRUE) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "0.50"),
      paste0("\U02212", "0.05"),
      paste0("\U02212", "0.04"),
      paste0("\U02212", "0.03"),
      paste0("\U02212", "0.02"),
      paste0("\U02212", "0.01"),
      "0.00", "0.01", "0.02", "0.03", "0.04", "0.05", "0.50"
    )
  )
})

test_that("Rownames and groupnames aren't included in `columns = TRUE`", {

  mtcars1 <- cbind(mtcars, chardata = row.names(mtcars))

  # This doesn't fail; it won't apply numeric formatting to the
  # "chardata" column but the formatter will skip over it
  expect_no_error(
    mtcars1 |>
      gt() |>
      fmt_number(columns = everything())
  )

  # These succeed because the "chardata" col no longer counts as a
  # resolvable column if it's a rowname_col or groupname_col, yet, it's
  # still visible as a column in the `rows` expression
  expect_no_error(
    mtcars1 |>
      gt(rowname_col = "chardata") |>
      fmt_number(columns = everything(), rows = chardata == "Mazda RX4")
  )

  expect_no_error(
    mtcars1 |>
      gt(groupname_col = "chardata") |>
      fmt_number(columns = everything(), rows = chardata == "Mazda RX4")
  )
})

test_that("fmt_number() can render values in the Indian numbering system", {

  # These numbers will be used in tests of formatting
  # values to the Indian numbering system
  numbers <-
    c(
      5000000.01,        #1
      1000.001,          #2
      10.00001,          #3
      12345,             #4
      1234.5,            #5
      123.45,            #6
      1.2345,            #7
      0.12345,           #8
      2583063.2345,      #9
      1535674223.33,    #10
      6425648257336228, #11
      -500000000.000,   #12
      -1000.001,        #13
      -10.00001,        #14
      -12345,           #15
      -1234.5,          #16
      -123.45,          #17
      -1.2345,          #18
      -0.12345,         #19
      -0.0000123456,    #20
      0,                #21
      NA_real_,         #22
      Inf,              #23
      -Inf              #24
    )

  # Create a single-column data frame with these values in `num`
  numbers_tbl <- data.frame(num = numbers)

  # Create a `gt_tbl` object with `gt()` and the `numbers_tbl` dataset
  tab <- gt(numbers_tbl)

  # Format the `num` column to 2 decimal places and use the Indian
  # numbering system
  expect_equal(
    (tab |>
       fmt_number(columns = num, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,00,000.01", "1,000.00", "10.00", "12,345.00", "1,234.50",
      "123.45", "1.23", "0.12", "25,83,063.23", "1,53,56,74,223.33",
      "6,42,56,48,25,73,36,228.00",
      paste0("\U02212", "50,00,00,000.00"),
      paste0("\U02212", "1,000.00"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,345.00"),
      paste0("\U02212", "1,234.50"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.12"),
      "0.00", "0.00", "NA", " Inf",
      paste0("\U02212", "Inf")
    )
  )

  # Format the `num` column to 4 significant figures and use the Indian
  # numbering system
  expect_equal(
    (tab |>
       fmt_number(columns = num, n_sigfig = 4, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,00,000", "1,000", "10.00", "12,340", "1,234", "123.4", "1.234",
      "0.1234", "25,83,000", "1,53,60,00,000", "6,42,60,00,00,00,00,000",
      paste0("\U02212", "50,00,00,000"),
      paste0("\U02212", "1,000"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,340"),
      paste0("\U02212", "1,234"),
      paste0("\U02212", "123.4"),
      paste0("\U02212", "1.234"),
      paste0("\U02212", "0.1234"),
      paste0("\U02212", "0.00001235"),
      "0", "NA", "  Inf",
      paste0(" \U02212", "Inf")
    )
  )

  # Format the `num` column using the Indian numbering system; force
  # each number's sign to always be present
  expect_equal(
    (tab |>
       fmt_number(columns = num, force_sign = TRUE, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "+50,00,000.01", "+1,000.00", "+10.00", "+12,345.00", "+1,234.50",
      "+123.45", "+1.23", "+0.12", "+25,83,063.23", "+1,53,56,74,223.33",
      "+6,42,56,48,25,73,36,228.00",
      paste0("\U02212", "50,00,00,000.00"),
      paste0("\U02212", "1,000.00"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,345.00"),
      paste0("\U02212", "1,234.50"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.12"),
      "0.00", "0.00", "NA", "+ Inf",
      paste0("\U02212", "Inf")
    )
  )

  # Format the `num` column and use appropriate suffixes
  expect_equal(
    (tab |>
       fmt_number(columns = num, suffixing = TRUE, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.00 Lac", "1,000.00", "10.00", "12,345.00", "1,234.50",
      "123.45", "1.23", "0.12", "25.83 Lac", "153.57 Cr", "64,25,64,825.73 Cr",
      paste0("\U02212", "50.00 Cr"),
      paste0("\U02212", "1,000.00"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,345.00"),
      paste0("\U02212", "1,234.50"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.12"),
      "0.00", "0.00", "NA", " Inf Cr",
      paste0("\U02212", "Inf Cr")
    )
  )

  expect_equal(
    (tab |>
       fmt_number(columns = num, suffixing = c("K", "Lacs", "Crores"), system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.00 Lacs", "1.00 K", "10.00", "12.35 K", "1.23 K", "123.45",
      "1.23", "0.12", "25.83 Lacs", "153.57 Crores", "64,25,64,825.73 Crores",
      paste0("\U02212", "50.00 Crores"),
      paste0("\U02212", "1.00 K"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12.35 K"),
      paste0("\U02212", "1.23 K"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.12"),
      "0.00", "0.00", "NA", " Inf Crores",
      paste0("\U02212", "Inf Crores")
    )
  )

  expect_equal(
    (tab |>
       fmt_number(columns = num, suffixing = c(NA, "Lacs", NA), system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.00 Lacs", "1,000.00", "10.00", "12,345.00", "1,234.50",
      "123.45", "1.23", "0.12", "25.83 Lacs", "15,356.74 Lacs",
      "64,25,64,82,573.36 Lacs",
      paste0("\U02212", "5,000.00 Lacs"),
      paste0("\U02212", "1,000.00"),
      paste0("\U02212", "10.00"),
      paste0("\U02212", "12,345.00"),
      paste0("\U02212", "1,234.50"),
      paste0("\U02212", "123.45"),
      paste0("\U02212", "1.23"),
      paste0("\U02212", "0.12"),
      "0.00", "0.00", "NA", " Inf Lacs",
      paste0("\U02212", "Inf Lacs")
    )
  )

  expect_equal(
    (tab |>
       fmt_number(columns = num, suffixing = TRUE, accounting = TRUE, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.00 Lac", "1,000.00", "10.00", "12,345.00", "1,234.50",
      "123.45", "1.23", "0.12", "25.83 Lac", "153.57 Cr", "64,25,64,825.73 Cr",
      "(50.00 Cr)", "(1,000.00)", "(10.00)", "(12,345.00)", "(1,234.50)",
      "(123.45)", "(1.23)", "(0.12)", "(0.00)", "0.00", "NA", " Inf Cr",
      "(Inf Cr)"
    )
  )

  expect_no_warning(
    compared_tab <- tab |>
      fmt_number(columns = num, suffixing = TRUE, system = "ind")
  )

  # scale_by warning
  expect_snapshot(
    expected_tab <- tab |>
      fmt_number(columns = num, suffixing = TRUE, scale_by = 200, system = "ind")
  )

  expect_equal(
    render_formats_test(compared_tab, context = "html")[["num"]],
    render_formats_test(expected_tab, context = "html")[["num"]]
  )
})

test_that("fmt_number() works with n_sigfig, drop_trailing_dec_mark = TRUE (#1961)", {

  expect_equal(
    format_num_to_str(
      1335.3, context = "html", n_sigfig = 4, sep_mark = "", dec_mark = ".",
      drop_trailing_dec_mark = TRUE, format = "fg"
    ),
    "1335"
  )
})
