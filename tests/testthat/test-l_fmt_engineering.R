test_that("fmt_engineering() works correctly in LaTeX output tables", {

  # Create an input data frame with a single numeric column
  data_tbl <-
    data.frame(
      num = c(
        82030482871264190319039109717191.1,
        829300232923103939802.4,
        492032183020.5,
        84930284002.1,
        5043202435.0,
        203820929.2,
        84729202.4,
        2323435.1,
        230323.4,
        50000.01,
        1000.001,
        10.00001,
        12345,
        1234.5,
        123.45,
        1.2345,
        0.12345,
        0.0000123456,
        -50000.01,
        -1000.001,
        -10.00001,
        -12345,
        -1234.5,
        -123.45,
        -1.2345,
        -0.12345,
        -0.0000123456
      )
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(dt_data_get(tab)[["num"]], data_tbl$num)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab |> fmt_engineering(columns = "num_3", decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab |> fmt_engineering(columns = "num", decimals = 2, locale = "aa_bb")
  )

  # Format the `num` column to 2 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 2) |>
       render_formats_test("latex"))[["num"]],
    c(
      "82.03 $\\times$ 10\\textsuperscript{30}", "829.30 $\\times$ 10\\textsuperscript{18}",
      "492.03 $\\times$ 10\\textsuperscript{9}", "84.93 $\\times$ 10\\textsuperscript{9}",
      "5.04 $\\times$ 10\\textsuperscript{9}", "203.82 $\\times$ 10\\textsuperscript{6}",
      "84.73 $\\times$ 10\\textsuperscript{6}", "2.32 $\\times$ 10\\textsuperscript{6}",
      "230.32 $\\times$ 10\\textsuperscript{3}", "50.00 $\\times$ 10\\textsuperscript{3}",
      "1.00 $\\times$ 10\\textsuperscript{3}", "10.00", "12.35 $\\times$ 10\\textsuperscript{3}",
      "1.23 $\\times$ 10\\textsuperscript{3}", "123.45", "1.23",
      "123.45 $\\times$ 10\\textsuperscript{-3}", "12.35 $\\times$ 10\\textsuperscript{-6}",
      "-50.00 $\\times$ 10\\textsuperscript{3}", "-1.00 $\\times$ 10\\textsuperscript{3}", "-10.00",
      "-12.35 $\\times$ 10\\textsuperscript{3}", "-1.23 $\\times$ 10\\textsuperscript{3}", "-123.45",
      "-1.23", "-123.45 $\\times$ 10\\textsuperscript{-3}", "-12.35 $\\times$ 10\\textsuperscript{-6}"
    )
  )

  # Format the `num` column to 5 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 5) |>
       render_formats_test("latex"))[["num"]],
    c(
      "82.03048 $\\times$ 10\\textsuperscript{30}", "829.30023 $\\times$ 10\\textsuperscript{18}",
      "492.03218 $\\times$ 10\\textsuperscript{9}", "84.93028 $\\times$ 10\\textsuperscript{9}",
      "5.04320 $\\times$ 10\\textsuperscript{9}", "203.82093 $\\times$ 10\\textsuperscript{6}",
      "84.72920 $\\times$ 10\\textsuperscript{6}", "2.32344 $\\times$ 10\\textsuperscript{6}",
      "230.32340 $\\times$ 10\\textsuperscript{3}", "50.00001 $\\times$ 10\\textsuperscript{3}",
      "1.00000 $\\times$ 10\\textsuperscript{3}", "10.00001", "12.34500 $\\times$ 10\\textsuperscript{3}",
      "1.23450 $\\times$ 10\\textsuperscript{3}", "123.45000", "1.23450",
      "123.45000 $\\times$ 10\\textsuperscript{-3}", "12.34560 $\\times$ 10\\textsuperscript{-6}",
      "-50.00001 $\\times$ 10\\textsuperscript{3}", "-1.00000 $\\times$ 10\\textsuperscript{3}", "-10.00001",
      "-12.34500 $\\times$ 10\\textsuperscript{3}", "-1.23450 $\\times$ 10\\textsuperscript{3}", "-123.45000",
      "-1.23450", "-123.45000 $\\times$ 10\\textsuperscript{-3}", "-12.34560 $\\times$ 10\\textsuperscript{-6}"
    )
  )

  # Format the `num` column to 2 decimal places, use a period for the
  # digit grouping separators
  expect_equal(
    (tab |>
       fmt_engineering(
         columns = "num", decimals = 2,
         sep_mark = ".", dec_mark = ","
       ) |>
       render_formats_test("latex"))[["num"]],
    c(
      "82,03 $\\times$ 10\\textsuperscript{30}", "829,30 $\\times$ 10\\textsuperscript{18}",
      "492,03 $\\times$ 10\\textsuperscript{9}", "84,93 $\\times$ 10\\textsuperscript{9}",
      "5,04 $\\times$ 10\\textsuperscript{9}", "203,82 $\\times$ 10\\textsuperscript{6}",
      "84,73 $\\times$ 10\\textsuperscript{6}", "2,32 $\\times$ 10\\textsuperscript{6}",
      "230,32 $\\times$ 10\\textsuperscript{3}", "50,00 $\\times$ 10\\textsuperscript{3}",
      "1,00 $\\times$ 10\\textsuperscript{3}", "10,00", "12,35 $\\times$ 10\\textsuperscript{3}",
      "1,23 $\\times$ 10\\textsuperscript{3}", "123,45", "1,23", "123,45 $\\times$ 10\\textsuperscript{-3}",
      "12,35 $\\times$ 10\\textsuperscript{-6}", "-50,00 $\\times$ 10\\textsuperscript{3}",
      "-1,00 $\\times$ 10\\textsuperscript{3}", "-10,00", "-12,35 $\\times$ 10\\textsuperscript{3}",
      "-1,23 $\\times$ 10\\textsuperscript{3}", "-123,45", "-1,23",
      "-123,45 $\\times$ 10\\textsuperscript{-3}", "-12,35 $\\times$ 10\\textsuperscript{-6}"
    )
  )

  # Format the `num` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 4, scale_by = 1/1000) |>
       render_formats_test("latex"))[["num"]],
    c(
      "82.0305 $\\times$ 10\\textsuperscript{27}", "829.3002 $\\times$ 10\\textsuperscript{15}",
      "492.0322 $\\times$ 10\\textsuperscript{6}", "84.9303 $\\times$ 10\\textsuperscript{6}",
      "5.0432 $\\times$ 10\\textsuperscript{6}", "203.8209 $\\times$ 10\\textsuperscript{3}",
      "84.7292 $\\times$ 10\\textsuperscript{3}", "2.3234 $\\times$ 10\\textsuperscript{3}",
      "230.3234", "50.0000", "1.0000", "10.0000 $\\times$ 10\\textsuperscript{-3}",
      "12.3450", "1.2345", "123.4500 $\\times$ 10\\textsuperscript{-3}",
      "1.2345 $\\times$ 10\\textsuperscript{-3}", "123.4500 $\\times$ 10\\textsuperscript{-6}",
      "12.3456 $\\times$ 10\\textsuperscript{-9}", "-50.0000", "-1.0000",
      "-10.0000 $\\times$ 10\\textsuperscript{-3}", "-12.3450", "-1.2345",
      "-123.4500 $\\times$ 10\\textsuperscript{-3}", "-1.2345 $\\times$ 10\\textsuperscript{-3}",
      "-123.4500 $\\times$ 10\\textsuperscript{-6}", "-12.3456 $\\times$ 10\\textsuperscript{-9}"
    )
  )

  # Format the `num` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 2, pattern = "a {x} b") |>
       render_formats_test("latex"))[["num"]],
    c(
      "a 82.03 $\\times$ 10\\textsuperscript{30} b", "a 829.30 $\\times$ 10\\textsuperscript{18} b",
      "a 492.03 $\\times$ 10\\textsuperscript{9} b", "a 84.93 $\\times$ 10\\textsuperscript{9} b",
      "a 5.04 $\\times$ 10\\textsuperscript{9} b", "a 203.82 $\\times$ 10\\textsuperscript{6} b",
      "a 84.73 $\\times$ 10\\textsuperscript{6} b", "a 2.32 $\\times$ 10\\textsuperscript{6} b",
      "a 230.32 $\\times$ 10\\textsuperscript{3} b", "a 50.00 $\\times$ 10\\textsuperscript{3} b",
      "a 1.00 $\\times$ 10\\textsuperscript{3} b", "a 10.00 b", "a 12.35 $\\times$ 10\\textsuperscript{3} b",
      "a 1.23 $\\times$ 10\\textsuperscript{3} b", "a 123.45 b", "a 1.23 b",
      "a 123.45 $\\times$ 10\\textsuperscript{-3} b", "a 12.35 $\\times$ 10\\textsuperscript{-6} b",
      "a -50.00 $\\times$ 10\\textsuperscript{3} b", "a -1.00 $\\times$ 10\\textsuperscript{3} b",
      "a -10.00 b", "a -12.35 $\\times$ 10\\textsuperscript{3} b",
      "a -1.23 $\\times$ 10\\textsuperscript{3} b", "a -123.45 b", "a -1.23 b",
      "a -123.45 $\\times$ 10\\textsuperscript{-3} b", "a -12.35 $\\times$ 10\\textsuperscript{-6} b"
    )
  )

  # Format the `num` column to 2 decimal places, force the sign
  expect_equal(
    (tab |>
       fmt_engineering(
         columns = "num", decimals = 3, force_sign_m = TRUE) |>
       render_formats_test("latex"))[["num"]],
    c(
      "+82.030 $\\times$ 10\\textsuperscript{30}", "+829.300 $\\times$ 10\\textsuperscript{18}",
      "+492.032 $\\times$ 10\\textsuperscript{9}", "+84.930 $\\times$ 10\\textsuperscript{9}",
      "+5.043 $\\times$ 10\\textsuperscript{9}", "+203.821 $\\times$ 10\\textsuperscript{6}",
      "+84.729 $\\times$ 10\\textsuperscript{6}", "+2.323 $\\times$ 10\\textsuperscript{6}",
      "+230.323 $\\times$ 10\\textsuperscript{3}", "+50.000 $\\times$ 10\\textsuperscript{3}",
      "+1.000 $\\times$ 10\\textsuperscript{3}", "+10.000", "+12.345 $\\times$ 10\\textsuperscript{3}",
      "+1.234 $\\times$ 10\\textsuperscript{3}", "+123.450", "+1.234",
      "+123.450 $\\times$ 10\\textsuperscript{-3}", "+12.346 $\\times$ 10\\textsuperscript{-6}",
      "-50.000 $\\times$ 10\\textsuperscript{3}", "-1.000 $\\times$ 10\\textsuperscript{3}", "-10.000",
      "-12.345 $\\times$ 10\\textsuperscript{3}", "-1.234 $\\times$ 10\\textsuperscript{3}", "-123.450",
      "-1.234", "-123.450 $\\times$ 10\\textsuperscript{-3}", "-12.346 $\\times$ 10\\textsuperscript{-6}"
    )
  )

  # Format the `num` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab |>
       fmt_engineering(
         columns = "num", pattern = "*{x}*", force_sign_m = TRUE) |>
       render_formats_test("latex"))[["num"]],
    c(
      "*+82.03 $\\times$ 10\\textsuperscript{30}*", "*+829.30 $\\times$ 10\\textsuperscript{18}*",
      "*+492.03 $\\times$ 10\\textsuperscript{9}*", "*+84.93 $\\times$ 10\\textsuperscript{9}*",
      "*+5.04 $\\times$ 10\\textsuperscript{9}*", "*+203.82 $\\times$ 10\\textsuperscript{6}*",
      "*+84.73 $\\times$ 10\\textsuperscript{6}*", "*+2.32 $\\times$ 10\\textsuperscript{6}*",
      "*+230.32 $\\times$ 10\\textsuperscript{3}*", "*+50.00 $\\times$ 10\\textsuperscript{3}*",
      "*+1.00 $\\times$ 10\\textsuperscript{3}*", "*+10.00*", "*+12.35 $\\times$ 10\\textsuperscript{3}*",
      "*+1.23 $\\times$ 10\\textsuperscript{3}*", "*+123.45*", "*+1.23*",
      "*+123.45 $\\times$ 10\\textsuperscript{-3}*", "*+12.35 $\\times$ 10\\textsuperscript{-6}*",
      "*-50.00 $\\times$ 10\\textsuperscript{3}*", "*-1.00 $\\times$ 10\\textsuperscript{3}*", "*-10.00*",
      "*-12.35 $\\times$ 10\\textsuperscript{3}*", "*-1.23 $\\times$ 10\\textsuperscript{3}*", "*-123.45*",
      "*-1.23*", "*-123.45 $\\times$ 10\\textsuperscript{-3}*", "*-12.35 $\\times$ 10\\textsuperscript{-6}*"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 2, locale = "en_US") |>
       render_formats_test("latex"))[["num"]],
    c(
      "82.03 $\\times$ 10\\textsuperscript{30}", "829.30 $\\times$ 10\\textsuperscript{18}",
      "492.03 $\\times$ 10\\textsuperscript{9}", "84.93 $\\times$ 10\\textsuperscript{9}",
      "5.04 $\\times$ 10\\textsuperscript{9}", "203.82 $\\times$ 10\\textsuperscript{6}",
      "84.73 $\\times$ 10\\textsuperscript{6}", "2.32 $\\times$ 10\\textsuperscript{6}",
      "230.32 $\\times$ 10\\textsuperscript{3}", "50.00 $\\times$ 10\\textsuperscript{3}",
      "1.00 $\\times$ 10\\textsuperscript{3}", "10.00", "12.35 $\\times$ 10\\textsuperscript{3}",
      "1.23 $\\times$ 10\\textsuperscript{3}", "123.45", "1.23",
      "123.45 $\\times$ 10\\textsuperscript{-3}", "12.35 $\\times$ 10\\textsuperscript{-6}",
      "-50.00 $\\times$ 10\\textsuperscript{3}", "-1.00 $\\times$ 10\\textsuperscript{3}", "-10.00",
      "-12.35 $\\times$ 10\\textsuperscript{3}", "-1.23 $\\times$ 10\\textsuperscript{3}", "-123.45",
      "-1.23", "-123.45 $\\times$ 10\\textsuperscript{-3}", "-12.35 $\\times$ 10\\textsuperscript{-6}"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 2, locale = "da_DK") |>
       render_formats_test("latex"))[["num"]],
    c(
      "82,03 $\\times$ 10\\textsuperscript{30}", "829,30 $\\times$ 10\\textsuperscript{18}",
      "492,03 $\\times$ 10\\textsuperscript{9}", "84,93 $\\times$ 10\\textsuperscript{9}",
      "5,04 $\\times$ 10\\textsuperscript{9}", "203,82 $\\times$ 10\\textsuperscript{6}",
      "84,73 $\\times$ 10\\textsuperscript{6}", "2,32 $\\times$ 10\\textsuperscript{6}",
      "230,32 $\\times$ 10\\textsuperscript{3}", "50,00 $\\times$ 10\\textsuperscript{3}",
      "1,00 $\\times$ 10\\textsuperscript{3}", "10,00", "12,35 $\\times$ 10\\textsuperscript{3}",
      "1,23 $\\times$ 10\\textsuperscript{3}", "123,45", "1,23",
      "123,45 $\\times$ 10\\textsuperscript{-3}", "12,35 $\\times$ 10\\textsuperscript{-6}",
      "-50,00 $\\times$ 10\\textsuperscript{3}", "-1,00 $\\times$ 10\\textsuperscript{3}", "-10,00",
      "-12,35 $\\times$ 10\\textsuperscript{3}", "-1,23 $\\times$ 10\\textsuperscript{3}", "-123,45",
      "-1,23", "-123,45 $\\times$ 10\\textsuperscript{-3}", "-12,35 $\\times$ 10\\textsuperscript{-6}"
    )
  )
})

test_that("fmt_engineering() can handle extremely large and small values", {

  # Create an input data frame with very large and very small numbers
  # (both positive and negative)
  data_tbl <-
    data.frame(
      num = c(
        -1.5E200, -1.5E100, -2.5E0, -3.5E-100, -3.5E-200,
        1.5E-200, 1.5E-100, 2.5E0, 3.5E100, 3.5E200
      )
    )

  # Create a `gt_tbl` object with `gt()` and the`data_tbl` dataset
  tab <- gt(data_tbl)

  # Format the `num` column to 5 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_engineering(columns = "num", decimals = 5) |>
       render_formats_test("latex"))[["num"]],
    c(
      "-150.00000 $\\times$ 10\\textsuperscript{198}", "-15.00000 $\\times$ 10\\textsuperscript{99}",
      "-2.50000", "-350.00000 $\\times$ 10\\textsuperscript{-102}",
      "-35.00000 $\\times$ 10\\textsuperscript{-201}", "15.00000 $\\times$ 10\\textsuperscript{-201}",
      "150.00000 $\\times$ 10\\textsuperscript{-102}", "2.50000",
      "35.00000 $\\times$ 10\\textsuperscript{99}", "350.00000 $\\times$ 10\\textsuperscript{198}"
    )
  )
})
