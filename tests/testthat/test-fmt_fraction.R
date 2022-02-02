test_that("the `fmt_fraction()` function works correctly", {

  # Create an input data frame two columns: one
  # character-based and one that is numeric
  data_tbl <-
    data.frame(
      char = "a",
      num = c(
        -50,
        -1.5
        -0.999,
        -0.9,
        -0.002,
        0,
        0.002,
        0.04,
        0.06,
        0.1,
        0.3,
        0.5,
        0.5555555555555555,
        0.92,
        0.999,
        1.000010,
        1.1,
        1.95,
        2000000.2,
        30000000000.0,
        NA,
        Inf,
        -Inf
      ),
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data = data_tbl)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  char <- (tab %>% dt_data_get())[["char"]]
  num <- (tab %>% dt_data_get())[["num"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$char, char)
  expect_equal(data_tbl$num, num)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% fmt_fraction(columns = num_2))

  # Expect an error when using a locale that does not exist
  expect_error(tab %>% fmt_fraction(columns = num_2, locale = "aa_bb"))

  # Format the `num` column to fractions with the 'low' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "low", layout = "inline") %>%
       render_formats_test(context = "html"))[["num"]],
    c(
      "&minus;50", "&minus;2 1/2", "&minus;8/9", "0", "0", "0", "0",
      "1/9", "1/9", "2/7", "1/2", "5/9", "8/9", "1", "1", "1 1/9",
      "2", "2,000,000 1/5", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with the 'medium' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "med", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 1/2", "&minus;9/10", "0", "0", "0",
      "1/25", "3/50", "1/10", "3/10", "1/2", "5/9", "23/25", "1", "1",
      "1 1/10", "1 19/20", "2,000,000 1/5", "30,000,000,000", "NA",
      "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with the 'high' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "high", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 250/501", "&minus;9/10", "&minus;1/500",
      "0", "1/500", "1/25", "3/50", "1/10", "3/10", "1/2", "139/250",
      "23/25", "998/999", "1", "1 1/10", "1 19/20", "2,000,000 1/5",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # halves ("/2") for the denominator, have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "/2", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 1/2", "&minus;1", "0", "0", "0", "0",
      "0", "0", "1/2", "1/2", "1/2", "1", "1", "1", "1", "2", "2,000,000",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # quarters ("/4") for the denominator, have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "/4", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 2/4", "&minus;1", "0", "0", "0", "0",
      "0", "0", "1/4", "2/4", "2/4", "1", "1", "1", "1", "2", "2,000,000 1/4",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # eighths ("/8") for the denominator, have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "/8", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 4/8", "&minus;7/8", "0", "0", "0", "0",
      "0", "1/8", "2/8", "4/8", "4/8", "7/8", "1", "1", "1 1/8", "2",
      "2,000,000 2/8", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # sixteenths ("/16") for the denominator, have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "/16", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 8/16", "&minus;14/16", "0", "0", "0",
      "1/16", "1/16", "2/16", "5/16", "8/16", "9/16", "15/16", "1",
      "1", "1 2/16", "1 15/16", "2,000,000 3/16", "30,000,000,000",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths ("/100") for the denominator, have the layout be 'inline'
  expect_equal(
    (tab %>%
       fmt_fraction(columns = num, accuracy = "/100", layout = "inline") %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 50/100", "&minus;90/100", "0", "0",
      "0", "4/100", "6/100", "10/100", "30/100", "50/100", "56/100",
      "92/100", "1", "1", "1 10/100", "1 95/100", "2,000,000 20/100",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths ("/100") for the denominator, have the layout be 'inline' and
  # apply the `en_US` locale
  expect_equal(
    (tab %>%
       fmt_fraction(
         columns = num, accuracy = "/100",
         layout = "inline", locale = "en_US"
       ) %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 50/100", "&minus;90/100", "0", "0",
      "0", "4/100", "6/100", "10/100", "30/100", "50/100", "56/100",
      "92/100", "1", "1", "1 10/100", "1 95/100", "2,000,000 20/100",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths ("/100") for the denominator, have the layout be 'inline' and
  # apply the `da_DK` locale
  expect_equal(
    (tab %>%
       fmt_fraction(
         columns = num, accuracy = "/100",
         layout = "inline", locale = "da_DK"
       ) %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 50/100", "&minus;90/100", "0", "0",
      "0", "4/100", "6/100", "10/100", "30/100", "50/100", "56/100",
      "92/100", "1", "1", "1 10/100", "1 95/100", "2.000.000 20/100",
      "30.000.000.000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths ("/100") for the denominator, have the layout be 'inline' and
  # apply the `de_AT` locale
  expect_equal(
    (tab %>%
       fmt_fraction(
         columns = num, accuracy = "/100",
         layout = "inline", locale = "de_AT"
       ) %>%
       render_formats_test("html"))[["num"]],
    c(
      "&minus;50", "&minus;2 50/100", "&minus;90/100", "0", "0",
      "0", "4/100", "6/100", "10/100", "30/100", "50/100", "56/100",
      "92/100", "1", "1", "1 10/100", "1 95/100", "2 000 000 20/100",
      "30 000 000 000", "NA", "Inf", "-Inf"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_fraction()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) %>% gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_fraction()`
  expect_error(
    regexp = NA,
    na_col_tbl %>% fmt_fraction(columns = a) %>% as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_fraction(columns = a, rows = 1:5) %>% as_raw_html()
  )
  expect_error(
    regexp = NA,
    na_col_tbl %>%
      fmt_fraction(columns = a, pattern = "a{x}b") %>% as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl %>%
       fmt_fraction(columns = a) %>%
       fmt_fraction(columns = b) %>% render_formats_test("html"))[["b"]],
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
  )
})
