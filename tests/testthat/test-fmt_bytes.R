test_that("fmt_bytes() works correctly", {

  # Create an input data frame two columns: one
  # character-based and one that is numeric
  data_tbl <-
    data.frame(
      char = "a",
      num = c(
        -500, # "-500 B"
        -0.9, 0, 0.9, # All should be "0 B"
        500,  # "500 B"
        1023,
        1001,
        1024,                        # 1 kB binary
        1048576,                     # 1 MB ''
        1073741824,                  # 1 GB ''
        1099511627776,               # 1 TB ''
        1125899906842624,            # 1 PB ''
        1152921504606846976,         # 1 EB ''
        1180591620717411303424,      # 1 ZB ''
        1208925819614629174706176,   # 1 YB ''
        10^(c(3, 6, 9, 12, 15, 18, 21, 24)), # 1 KiB ... 1 YiB decimal
        15000000000000000000000000,
        150000000000000000000000000,
        1500000000000000000000000000,
        15000000000000000000000000000,
        NA
        ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char <- dt_data_get(tab)[["char"]]
  num <- dt_data_get(tab)[["num"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$char, char)

  expect_equal(data_tbl$num, num)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_bytes(columns = num_2, decimals = 2))

  # Expect an error when using a locale that does not exist
  expect_error(tab |> fmt_bytes(columns = num_2, decimals = 2, locale = "aa_bb"))

  # Format the `num` column to 1 decimal place, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 1) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1 kB", "1 kB",
      "1 kB", "1 MB", "1.1 GB", "1.1 TB", "1.1 PB", "1.2 EB", "1.2 ZB",
      "1.2 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB",
      "1 YB", "15 YB", "150 YB", "1,500 YB", "15,000 YB", "NA"
    )
  )

  # Format the `num` column to 4 decimal places, use all
  # other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 4) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1.023 kB", "1.001 kB",
      "1.024 kB", "1.0486 MB", "1.0737 GB", "1.0995 TB", "1.1259 PB",
      "1.1529 EB", "1.1806 ZB", "1.2089 YB", "1 kB", "1 MB", "1 GB",
      "1 TB", "1 PB", "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1,500 YB",
      "15,000 YB", "NA"
    )
  )

  # Format the `num` column to 2 decimal places, keep the trailing
  # zeros, use all other defaults; extract `output_df` and compare to
  # expected values
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num, decimals = 2,
         drop_trailing_zeros = FALSE
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500.00 B"), "0.00 B", "0.00 B", "0.00 B", "500.00 B",
      "1.02 kB", "1.00 kB", "1.02 kB", "1.05 MB", "1.07 GB", "1.10 TB",
      "1.13 PB", "1.15 EB", "1.18 ZB", "1.21 YB", "1.00 kB", "1.00 MB",
      "1.00 GB", "1.00 TB", "1.00 PB", "1.00 EB", "1.00 ZB", "1.00 YB",
      "15.00 YB", "150.00 YB", "1,500.00 YB", "15,000.00 YB", "NA"
    )
  )

  # Format the `num` column to 2 decimal places, keep the trailing
  # zeros, express byte sizes in the binary standard; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num, standard = "binary", decimals = 2,
         drop_trailing_zeros = FALSE
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500.00 B"), "0.00 B", "0.00 B", "0.00 B", "500.00 B",
      "1,023.00 B", "1,001.00 B", "1.00 KiB", "1.00 MiB", "1.00 GiB",
      "1.00 TiB", "1.00 PiB", "1.00 EiB", "1.00 ZiB", "1.00 YiB", "1,000.00 B",
      "976.56 KiB", "953.67 MiB", "931.32 GiB", "909.49 TiB", "888.18 PiB",
      "867.36 EiB", "847.03 ZiB", "12.41 YiB", "124.08 YiB", "1,240.77 YiB",
      "12,407.71 YiB", "NA"
    )
  )

  # Format the `num` column to 1 decimal place, don't use digit
  # grouping separators, use all other defaults; extract `output_df`
  # and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, use_seps = FALSE) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1 kB", "1 kB",
      "1 kB", "1 MB", "1.1 GB", "1.1 TB", "1.1 PB", "1.2 EB", "1.2 ZB",
      "1.2 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB", "1 EB", "1 ZB",
      "1 YB", "15 YB", "150 YB", "1500 YB", "15000 YB", "NA"
    )
  )

  # Format the `num` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, sep_mark = " ") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1.02 kB", "1 kB",
      "1.02 kB", "1.05 MB", "1.07 GB", "1.1 TB", "1.13 PB", "1.15 EB",
      "1.18 ZB", "1.21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1 500 YB", "15 000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, don't use a space between
  # the numeric value and the units, use all other defaults;
  # extract `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, incl_space = FALSE) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500B"), "0B", "0B", "0B", "500B", "1.02kB", "1kB", "1.02kB",
      "1.05MB", "1.07GB", "1.1TB", "1.13PB", "1.15EB", "1.18ZB", "1.21YB",
      "1kB", "1MB", "1GB", "1TB", "1PB", "1EB", "1ZB", "1YB", "15YB",
      "150YB", "1,500YB", "15,000YB", "NA"
    )
  )

  # Format the `num` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults; extract `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num, decimals = 2, sep_mark = ".", dec_mark = ","
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1,02 kB", "1 kB",
      "1,02 kB", "1,05 MB", "1,07 GB", "1,1 TB", "1,13 PB", "1,15 EB",
      "1,18 ZB", "1,21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1.500 YB", "15.000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults; extract
  # `output_df` and compare to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, pattern = "a {x} b") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("a ", "\U02212", "500 B b"), "a 0 B b", "a 0 B b", "a 0 B b", "a 500 B b",
      "a 1.02 kB b", "a 1 kB b", "a 1.02 kB b", "a 1.05 MB b", "a 1.07 GB b",
      "a 1.1 TB b", "a 1.13 PB b", "a 1.15 EB b", "a 1.18 ZB b", "a 1.21 YB b",
      "a 1 kB b", "a 1 MB b", "a 1 GB b", "a 1 TB b", "a 1 PB b", "a 1 EB b",
      "a 1 ZB b", "a 1 YB b", "a 15 YB b", "a 150 YB b", "a 1,500 YB b",
      "a 15,000 YB b", "NA"
    )
  )

  # Format the `num` column to 3 decimal places, force the sign
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num, decimals = 3, force_sign = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "+500 B", "+1.023 kB",
      "+1.001 kB", "+1.024 kB", "+1.049 MB", "+1.074 GB", "+1.1 TB",
      "+1.126 PB", "+1.153 EB", "+1.181 ZB", "+1.209 YB", "+1 kB",
      "+1 MB", "+1 GB", "+1 TB", "+1 PB", "+1 EB", "+1 ZB", "+1 YB",
      "+15 YB", "+150 YB", "+1,500 YB", "+15,000 YB", "NA"
    )
  )

  # Format the `num` column, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab |>
       fmt_bytes(
         columns = num, pattern = "*{x}*", force_sign = TRUE) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("*\U02212", "500 B*"), "*0 B*", "*0 B*", "*0 B*", "*+500 B*", "*+1 kB*",
      "*+1 kB*", "*+1 kB*", "*+1 MB*", "*+1.1 GB*", "*+1.1 TB*", "*+1.1 PB*",
      "*+1.2 EB*", "*+1.2 ZB*", "*+1.2 YB*", "*+1 kB*", "*+1 MB*",
      "*+1 GB*", "*+1 TB*", "*+1 PB*", "*+1 EB*", "*+1 ZB*", "*+1 YB*",
      "*+15 YB*", "*+150 YB*", "*+1,500 YB*", "*+15,000 YB*", "NA"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, locale = "en_US") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1.02 kB", "1 kB",
      "1.02 kB", "1.05 MB", "1.07 GB", "1.1 TB", "1.13 PB", "1.15 EB",
      "1.18 ZB", "1.21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1,500 YB", "15,000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, locale = "da_DK") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1,02 kB", "1 kB",
      "1,02 kB", "1,05 MB", "1,07 GB", "1,1 TB", "1,13 PB", "1,15 EB",
      "1,18 ZB", "1,21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1.500 YB", "15.000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, locale = "de_AT") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1,02 kB", "1 kB",
      "1,02 kB", "1,05 MB", "1,07 GB", "1,1 TB", "1,13 PB", "1,15 EB",
      "1,18 ZB", "1,21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1 500 YB", "15 000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  # Note: Estonian (et) has minimum_grouping_digits=2 (CLDR), so only numbers
  # with 5+ digits (10000+) get separators. 1500 has 4 digits so no separator.
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, locale = "et_EE") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1,02 kB", "1 kB",
      "1,02 kB", "1,05 MB", "1,07 GB", "1,1 TB", "1,13 PB", "1,15 EB",
      "1,18 ZB", "1,21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1500 YB", "15 000 YB",
      "NA"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults; extract `output_df` and compare
  # to expected values
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, decimals = 2, locale = "gl_ES") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "500 B"), "0 B", "0 B", "0 B", "500 B", "1,02 kB", "1 kB",
      "1,02 kB", "1,05 MB", "1,07 GB", "1,1 TB", "1,13 PB", "1,15 EB",
      "1,18 ZB", "1,21 YB", "1 kB", "1 MB", "1 GB", "1 TB", "1 PB",
      "1 EB", "1 ZB", "1 YB", "15 YB", "150 YB", "1.500 YB", "15.000 YB",
      "NA"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_bytes()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_bytes()`
  expect_no_error(
    na_col_tbl |> fmt_bytes(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_bytes(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_bytes(columns = a, pattern = "a{x}b", incl_space = FALSE) |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_bytes(columns = a) |>
       fmt_bytes(columns = b) |> render_formats_test("html"))[["b"]],
    c("1 B", "2 B", "3 B", "4 B", "5 B", "6 B", "7 B", "8 B", "9 B", "10 B")
  )
})

test_that("fmt_bytes() format to specified significant figures", {

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

  # Create a `gt_tbl` object with `gt()` and the `numbers` data
  tab <- gt(dplyr::tibble(num = numbers))

  # Format the `num` column to 5 significant figures
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, n_sigfig = 5) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.000 kB", "1.0000 kB", "10.000 B", "12.345 kB", "1.2340 kB",
      "123.00 B", "1.0000 B", "0 B", "0 B",
      paste0("\U02212", "50.000 kB"),
      paste0("\U02212", "1.0000 kB"),
      paste0("\U02212", "10.000 B"),
      paste0("\U02212", "12.345 kB"),
      paste0("\U02212", "1.2340 kB"),
      paste0("\U02212", "123.00 B"),
      paste0("\U02212", "1.0000 B"),
      "0 B", "0 B"
    )
  )

  # Format the `num` column to 4 significant figures
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, n_sigfig = 4) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.00 kB", "1.000 kB", "10.00 B", "12.34 kB",
      "1.234 kB", "123.0 B", "1.000 B", "0 B", "0 B",
      paste0("\U02212", "50.00 kB"),
      paste0("\U02212", "1.000 kB"),
      paste0("\U02212", "10.00 B"),
      paste0("\U02212", "12.34 kB"),
      paste0("\U02212", "1.234 kB"),
      paste0("\U02212", "123.0 B"),
      paste0("\U02212", "1.000 B"),
      "0 B", "0 B"
    )
  )

  # Format the `num` column to 3 significant figures
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, n_sigfig = 3) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50.0 kB", "1.00 kB", "10.0 B", "12.3 kB", "1.23 kB", "123 B",
      "1.00 B", "0 B", "0 B",
      paste0("\U02212", "50.0 kB"),
      paste0("\U02212", "1.00 kB"),
      paste0("\U02212", "10.0 B"),
      paste0("\U02212", "12.3 kB"),
      paste0("\U02212", "1.23 kB"),
      paste0("\U02212", "123 B"),
      paste0("\U02212", "1.00 B"),
      "0 B", "0 B"
    )
  )

  # Format the `num` column to 2 significant figures
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, n_sigfig = 2) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50 kB", "1.0 kB", "10 B", "12 kB",
      "1.2 kB", "120 B", "1.0 B", "0 B", "0 B",
      paste0("\U02212", "50 kB"),
      paste0("\U02212", "1.0 kB"),
      paste0("\U02212", "10 B"),
      paste0("\U02212", "12 kB"),
      paste0("\U02212", "1.2 kB"),
      paste0("\U02212", "120 B"),
      paste0("\U02212", "1.0 B"),
      "0 B", "0 B"
    )
  )

  # Format the `num` column to 1 significant figure
  expect_equal(
    (tab |>
       fmt_bytes(columns = num, n_sigfig = 1) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50 kB", "1 kB", "10 B", "10 kB",
      "1 kB", "100 B", "1 B", "0 B", "0 B",
      paste0("\U02212", "50 kB"),
      paste0("\U02212", "1 kB"),
      paste0("\U02212", "10 B"),
      paste0("\U02212", "10 kB"),
      paste0("\U02212", "1 kB"),
      paste0("\U02212", "100 B"),
      paste0("\U02212", "1 B"),
      "0 B", "0 B"
    )
  )

  # Expect an error if the length of `n_sigfig` is not 1
  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = c(1, 2)))

  # Expect an error if `n_sigfig` is NA
  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = NA))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = NA_integer_))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = NA_real_))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = NA_integer_))

  # Expect an error if `n_sigfig` is not numeric
  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = "3"))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = TRUE))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = factor(3)))

  # Don't expect errors when using integers or doubles
  expect_no_error(tab |> fmt_bytes(columns = num, n_sigfig = 2L))

  expect_no_error(tab |> fmt_bytes(columns = num, n_sigfig = 2))

  # Expect an error if `n_sigfig` is less than 1
  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = 0L))

  expect_error(tab |> fmt_bytes(columns = num, n_sigfig = -1L))
})
