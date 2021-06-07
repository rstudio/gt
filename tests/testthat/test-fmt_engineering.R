test_that("the `fmt_engineering()` function works correctly", {

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
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$num, (tab %>% dt_data_get())[["num"]])

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab %>%
      fmt_engineering(columns = "num_3", decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab %>%
      fmt_engineering(columns = "num", decimals = 2, locale = "aa_bb")
  )

  # Format the `num` column to 2 decimal places, use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 2) %>%
       render_formats_test("html"))[["num"]],
    c(
      "82.03 &times; 10<sup class='gt_super'>30</sup>",
      "829.30 &times; 10<sup class='gt_super'>18</sup>",
      "492.03 &times; 10<sup class='gt_super'>9</sup>",
      "84.93 &times; 10<sup class='gt_super'>9</sup>",
      "5.04 &times; 10<sup class='gt_super'>9</sup>",
      "203.82 &times; 10<sup class='gt_super'>6</sup>",
      "84.73 &times; 10<sup class='gt_super'>6</sup>",
      "2.32 &times; 10<sup class='gt_super'>6</sup>",
      "230.32 &times; 10<sup class='gt_super'>3</sup>",
      "50.00 &times; 10<sup class='gt_super'>3</sup>",
      "1.00 &times; 10<sup class='gt_super'>3</sup>",
      "10.00", "12.35 &times; 10<sup class='gt_super'>3</sup>",
      "1.23 &times; 10<sup class='gt_super'>3</sup>", "123.45", "1.23",
      "123.45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12.35 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;50.00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;10.00", "&minus;12.35 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.23 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;123.45", "&minus;1.23",
      "&minus;123.45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12.35 &times; 10<sup class='gt_super'>&minus;6</sup>"
    )
  )

  # Format the `num` column to 2 decimal places, use all other defaults
  # (checking values in the `default` context)
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 2) %>%
       render_formats_test("default"))[["num"]],
    c(
      "82.03 x 10(30)", "829.30 x 10(18)", "492.03 x 10(9)", "84.93 x 10(9)",
      "5.04 x 10(9)", "203.82 x 10(6)", "84.73 x 10(6)", "2.32 x 10(6)",
      "230.32 x 10(3)", "50.00 x 10(3)", "1.00 x 10(3)", "10.00",
      "12.35 x 10(3)", "1.23 x 10(3)", "123.45", "1.23", "123.45 x 10(-3)",
      "12.35 x 10(-6)", "-50.00 x 10(3)", "-1.00 x 10(3)", "-10.00",
      "-12.35 x 10(3)", "-1.23 x 10(3)", "-123.45", "-1.23", "-123.45 x 10(-3)",
      "-12.35 x 10(-6)"
    )
  )

  # Format the `num` column to 5 decimal places, use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 5) %>%
       render_formats_test("html"))[["num"]],
    c(
      "82.03048 &times; 10<sup class='gt_super'>30</sup>",
      "829.30023 &times; 10<sup class='gt_super'>18</sup>",
      "492.03218 &times; 10<sup class='gt_super'>9</sup>",
      "84.93028 &times; 10<sup class='gt_super'>9</sup>",
      "5.04320 &times; 10<sup class='gt_super'>9</sup>",
      "203.82093 &times; 10<sup class='gt_super'>6</sup>",
      "84.72920 &times; 10<sup class='gt_super'>6</sup>",
      "2.32344 &times; 10<sup class='gt_super'>6</sup>",
      "230.32340 &times; 10<sup class='gt_super'>3</sup>",
      "50.00001 &times; 10<sup class='gt_super'>3</sup>",
      "1.00000 &times; 10<sup class='gt_super'>3</sup>",
      "10.00001",
      "12.34500 &times; 10<sup class='gt_super'>3</sup>",
      "1.23450 &times; 10<sup class='gt_super'>3</sup>",
      "123.45000", "1.23450",
      "123.45000 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12.34560 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;50.00001 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.00000 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;10.00001",
      "&minus;12.34500 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.23450 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;123.45000", "&minus;1.23450",
      "&minus;123.45000 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12.34560 &times; 10<sup class='gt_super'>&minus;6</sup>"
    )
  )

  # Format the `num` column to 2 decimal places, use a period for the
  # digit grouping separators
  expect_equal(
    (tab %>%
       fmt_engineering(
         columns = "num", decimals = 2,
         sep_mark = ".", dec_mark = ","
       ) %>%
       render_formats_test("html"))[["num"]],
    c(
      "82,03 &times; 10<sup class='gt_super'>30</sup>",
      "829,30 &times; 10<sup class='gt_super'>18</sup>",
      "492,03 &times; 10<sup class='gt_super'>9</sup>",
      "84,93 &times; 10<sup class='gt_super'>9</sup>",
      "5,04 &times; 10<sup class='gt_super'>9</sup>",
      "203,82 &times; 10<sup class='gt_super'>6</sup>",
      "84,73 &times; 10<sup class='gt_super'>6</sup>",
      "2,32 &times; 10<sup class='gt_super'>6</sup>",
      "230,32 &times; 10<sup class='gt_super'>3</sup>",
      "50,00 &times; 10<sup class='gt_super'>3</sup>",
      "1,00 &times; 10<sup class='gt_super'>3</sup>",
      "10,00", "12,35 &times; 10<sup class='gt_super'>3</sup>",
      "1,23 &times; 10<sup class='gt_super'>3</sup>", "123,45", "1,23",
      "123,45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12,35 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;50,00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1,00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;10,00", "&minus;12,35 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1,23 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;123,45", "&minus;1,23",
      "&minus;123,45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12,35 &times; 10<sup class='gt_super'>&minus;6</sup>"
    )
  )

  # Format the `num` column to 4 decimal places, scale all values by
  # 1/1000, use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 4, scale_by = 1/1000) %>%
       render_formats_test("html"))[["num"]],
    c(
      "82.0305 &times; 10<sup class='gt_super'>27</sup>",
      "829.3002 &times; 10<sup class='gt_super'>15</sup>",
      "492.0322 &times; 10<sup class='gt_super'>6</sup>",
      "84.9303 &times; 10<sup class='gt_super'>6</sup>",
      "5.0432 &times; 10<sup class='gt_super'>6</sup>",
      "203.8209 &times; 10<sup class='gt_super'>3</sup>",
      "84.7292 &times; 10<sup class='gt_super'>3</sup>",
      "2.3234 &times; 10<sup class='gt_super'>3</sup>",
      "230.3234", "50.0000", "1.0000",
      "10.0000 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12.3450", "1.2345",
      "123.4500 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "1.2345 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "123.4500 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "12.3456 &times; 10<sup class='gt_super'>&minus;9</sup>",
      "&minus;50.0000",
      "&minus;1.0000",
      "&minus;10.0000 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12.3450", "&minus;1.2345",
      "&minus;123.4500 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;1.2345 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;123.4500 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;12.3456 &times; 10<sup class='gt_super'>&minus;9</sup>"
    )
  )

  # Format the `num` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 2, pattern = "a {x} b") %>%
       render_formats_test("html"))[["num"]],
    c(
      "a 82.03 &times; 10<sup class='gt_super'>30</sup> b",
      "a 829.30 &times; 10<sup class='gt_super'>18</sup> b",
      "a 492.03 &times; 10<sup class='gt_super'>9</sup> b",
      "a 84.93 &times; 10<sup class='gt_super'>9</sup> b",
      "a 5.04 &times; 10<sup class='gt_super'>9</sup> b",
      "a 203.82 &times; 10<sup class='gt_super'>6</sup> b",
      "a 84.73 &times; 10<sup class='gt_super'>6</sup> b",
      "a 2.32 &times; 10<sup class='gt_super'>6</sup> b",
      "a 230.32 &times; 10<sup class='gt_super'>3</sup> b",
      "a 50.00 &times; 10<sup class='gt_super'>3</sup> b",
      "a 1.00 &times; 10<sup class='gt_super'>3</sup> b", "a 10.00 b",
      "a 12.35 &times; 10<sup class='gt_super'>3</sup> b",
      "a 1.23 &times; 10<sup class='gt_super'>3</sup> b",
      "a 123.45 b", "a 1.23 b",
      "a 123.45 &times; 10<sup class='gt_super'>&minus;3</sup> b",
      "a 12.35 &times; 10<sup class='gt_super'>&minus;6</sup> b",
      "a &minus;50.00 &times; 10<sup class='gt_super'>3</sup> b",
      "a &minus;1.00 &times; 10<sup class='gt_super'>3</sup> b",
      "a &minus;10.00 b",
      "a &minus;12.35 &times; 10<sup class='gt_super'>3</sup> b",
      "a &minus;1.23 &times; 10<sup class='gt_super'>3</sup> b",
      "a &minus;123.45 b", "a &minus;1.23 b",
      "a &minus;123.45 &times; 10<sup class='gt_super'>&minus;3</sup> b",
      "a &minus;12.35 &times; 10<sup class='gt_super'>&minus;6</sup> b"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 2, locale = "en_US") %>%
       render_formats_test("html"))[["num"]],
    c(
      "82.03 &times; 10<sup class='gt_super'>30</sup>",
      "829.30 &times; 10<sup class='gt_super'>18</sup>",
      "492.03 &times; 10<sup class='gt_super'>9</sup>",
      "84.93 &times; 10<sup class='gt_super'>9</sup>",
      "5.04 &times; 10<sup class='gt_super'>9</sup>",
      "203.82 &times; 10<sup class='gt_super'>6</sup>",
      "84.73 &times; 10<sup class='gt_super'>6</sup>",
      "2.32 &times; 10<sup class='gt_super'>6</sup>",
      "230.32 &times; 10<sup class='gt_super'>3</sup>",
      "50.00 &times; 10<sup class='gt_super'>3</sup>",
      "1.00 &times; 10<sup class='gt_super'>3</sup>", "10.00",
      "12.35 &times; 10<sup class='gt_super'>3</sup>",
      "1.23 &times; 10<sup class='gt_super'>3</sup>", "123.45", "1.23",
      "123.45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12.35 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;50.00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;10.00", "&minus;12.35 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1.23 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;123.45", "&minus;1.23",
      "&minus;123.45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12.35 &times; 10<sup class='gt_super'>&minus;6</sup>"
    )
  )

  # Format the `num` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 2, locale = "da_DK") %>%
       render_formats_test("html"))[["num"]],
    c(
      "82,03 &times; 10<sup class='gt_super'>30</sup>",
      "829,30 &times; 10<sup class='gt_super'>18</sup>",
      "492,03 &times; 10<sup class='gt_super'>9</sup>",
      "84,93 &times; 10<sup class='gt_super'>9</sup>",
      "5,04 &times; 10<sup class='gt_super'>9</sup>",
      "203,82 &times; 10<sup class='gt_super'>6</sup>",
      "84,73 &times; 10<sup class='gt_super'>6</sup>",
      "2,32 &times; 10<sup class='gt_super'>6</sup>",
      "230,32 &times; 10<sup class='gt_super'>3</sup>",
      "50,00 &times; 10<sup class='gt_super'>3</sup>",
      "1,00 &times; 10<sup class='gt_super'>3</sup>", "10,00",
      "12,35 &times; 10<sup class='gt_super'>3</sup>",
      "1,23 &times; 10<sup class='gt_super'>3</sup>", "123,45", "1,23",
      "123,45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "12,35 &times; 10<sup class='gt_super'>&minus;6</sup>",
      "&minus;50,00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1,00 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;10,00", "&minus;12,35 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;1,23 &times; 10<sup class='gt_super'>3</sup>",
      "&minus;123,45", "&minus;1,23",
      "&minus;123,45 &times; 10<sup class='gt_super'>&minus;3</sup>",
      "&minus;12,35 &times; 10<sup class='gt_super'>&minus;6</sup>"
    )
  )
})

test_that("`fmt_engineering() can handle extremely large and small values", {

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
    (tab %>%
       fmt_engineering(columns = "num", decimals = 5) %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;150.00000 &times; 10<sup class='gt_super'>198</sup>",
      "&minus;15.00000 &times; 10<sup class='gt_super'>99</sup>",
      "&minus;2.50000",
      "&minus;350.00000 &times; 10<sup class='gt_super'>&minus;102</sup>",
      "&minus;35.00000 &times; 10<sup class='gt_super'>&minus;201</sup>",
      "15.00000 &times; 10<sup class='gt_super'>&minus;201</sup>",
      "150.00000 &times; 10<sup class='gt_super'>&minus;102</sup>",
      "2.50000", "35.00000 &times; 10<sup class='gt_super'>99</sup>",
      "350.00000 &times; 10<sup class='gt_super'>198</sup>"
    )
  )

  # Format the `num` column to 5 decimal places, use all
  # other defaults; extract values in the default context
  # and compare to expected values
  # (checking values in the `default` context)
  expect_equal(
    (tab %>%
       fmt_engineering(columns = "num", decimals = 5) %>%
       render_formats_test("default"))[["num"]],
    c(
      "-150.00000 x 10(198)", "-15.00000 x 10(99)", "-2.50000",
      "-350.00000 x 10(-102)", "-35.00000 x 10(-201)", "15.00000 x 10(-201)",
      "150.00000 x 10(-102)", "2.50000", "35.00000 x 10(99)",
      "350.00000 x 10(198)"
    )
  )
})
