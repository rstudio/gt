test_that("fmt_percent() works correctly in the HTML context", {

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

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(
    tab |>
      fmt_percent(columns = num_3, decimals = 2)
  )

  # Expect an error when using a locale that does not exist
  expect_error(
    tab |>
      fmt_percent(columns = num_2, decimals = 2, locale = "aa_bb")
  )

  # Format the `num_1` column to 2 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623.00%", "276,339.00%", "93,729.00%",
      "64,300.00%", "21,223.20%", "0.00%",
      paste0("\U02212", "2,324.00%")
    )
  )

  # Format the `num_1` column to 5 decimal places, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 5) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623.00000%", "276,339.00000%", "93,729.00000%",
      "64,300.00000%", "21,223.20000%", "0.00000%",
      paste0("\U02212", "2,324.00000%")
    )
  )

  # Format the `num_1` column to 2 decimal places, drop the trailing
  # zeros, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2,
                   drop_trailing_zeros = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623%", "276,339%", "93,729%", "64,300%",
      "21,223.2%", "0%", paste0("\U02212", "2,324%")
    )
  )

  # Format the `num_1` column to 2 decimal places, don't use digit
  # grouping separators, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, use_seps = FALSE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183623.00%", "276339.00%", "93729.00%",
      "64300.00%", "21223.20%", "0.00%",
      paste0("\U02212", "2324.00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, use a single space
  # character as digit grouping separators, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, sep_mark = " ") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183 623.00%", "276 339.00%", "93 729.00%",
      "64 300.00%", "21 223.20%", "0.00%",
      paste0("\U02212", "2 324.00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, use a period for the
  # digit grouping separators and a comma for the decimal mark, use
  # all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2,
                   sep_mark = ".", dec_mark = ",") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183.623,00%", "276.339,00%", "93.729,00%",
      "64.300,00%", "21.223,20%", "0,00%",
      paste0("\U02212", "2.324,00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, prepend and append
  # all values by 2 different literals, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, pattern = "a {x}:n") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "a 183,623.00%:n", "a 276,339.00%:n",
      "a 93,729.00%:n", "a 64,300.00%:n",
      "a 21,223.20%:n", "a 0.00%:n",
      paste0("a \U02212", "2,324.00%:n")
    )
  )

  # Format the `num_1` column to 0 decimal places, place a space between
  # the percent sign (on the right) and the value, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 0,
                   placement = "right", incl_space = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623 %", "276,339 %", "93,729 %",
      "64,300 %", "21,223 %", "0 %",
      paste0("\U02212", "2,324 %")
    )
  )

  # Format the `num_1` column to 0 decimal places, place a space between
  # the percent sign (on the left) and the value, use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 0,
                   placement = "left", incl_space = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "% 183,623", "% 276,339", "% 93,729",
      "% 64,300", "% 21,223", "% 0",
      paste0("\U02212", "% 2,324")
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, accounting = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623.00%", "276,339.00%", "93,729.00%",
      "64,300.00%", "21,223.20%", "0.00%", "(2,324.00%)"
    )
  )

  # Format the `num_1` column to 3 decimal places, use accounting style
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 3, accounting = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623.000%", "276,339.000%", "93,729.000%",
      "64,300.000%", "21,223.200%", "0.000%",
      "(2,324.000%)"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and a pattern around the values
  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 3,
         accounting = TRUE, pattern = "a{x}b") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "a183,623.000%b", "a276,339.000%b", "a93,729.000%b",
      "a64,300.000%b", "a21,223.200%b", "a0.000%b",
      "a(2,324.000%)b"
    )
  )

  # Format the `num_1` column to 2 decimal places, use accounting style
  # and drop all trailing zeros
  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 3,
         accounting = TRUE, drop_trailing_zeros = TRUE) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623%", "276,339%", "93,729%", "64,300%",
      "21,223.2%", "0%", "(2,324%)"
    )
  )

  # Format the `num_1` column to 2 decimal places, force the sign
  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 2,  drop_trailing_zeros = TRUE,
         scale_values = FALSE, force_sign = TRUE
       ) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "+1,836.23%", "+2,763.39%", "+937.29%",
      "+643%", "+212.23%", "0%", paste0("\U02212", "23.24%")
    )
  )

  # Expect that using `force_sign = TRUE` with `accounting = TRUE`
  # will render values in accounting format
  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 2, drop_trailing_zeros = TRUE,
         scale_values = FALSE, accounting = TRUE, force_sign = TRUE
       ) |>
       render_formats_test("html"))[["num_1"]],
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 2,  drop_trailing_zeros = TRUE,
         scale_values = FALSE, accounting = TRUE
       ) |>
       render_formats_test("html"))[["num_1"]]
  )

  # Format the `num_1` column to 2 decimal places, force the sign and
  # define a pattern for decorating values
  expect_equal(
    (tab |>
       fmt_percent(
         columns = num_1, decimals = 2, drop_trailing_zeros = TRUE,
         pattern = "*{x}*", force_sign = TRUE
       ) |>
       render_formats_test("html"))[["num_1"]],
    c(
      "*+183,623%*", "*+276,339%*", "*+93,729%*",
      "*+64,300%*", "*+21,223.2%*", "*0%*",
      paste0("*\U02212", "2,324%*")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `en_US`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, locale = "en_US") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183,623.00%", "276,339.00%", "93,729.00%",
      "64,300.00%", "21,223.20%", "0.00%",
      paste0("\U02212", "2,324.00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `da_DK`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, locale = "da_DK") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183.623,00%", "276.339,00%", "93.729,00%",
      "64.300,00%", "21.223,20%", "0,00%",
      paste0("\U02212", "2.324,00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `de_AT`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, locale = "de_AT") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183 623,00%", "276 339,00%", "93 729,00%",
      "64 300,00%", "21 223,20%", "0,00%",
      paste0("\U02212", "2 324,00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `et_EE`
  # locale and use all other defaults
  # Note: Estonian (et) has minimum_grouping_digits=2 (CLDR), so only numbers
  # with 5+ digits (10000+) get separators. 2324 has 4 digits so no separator.
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, locale = "et_EE") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183 623,00%", "276 339,00%", "93 729,00%",
      "64 300,00%", "21 223,20%", "0,00%",
      paste0("\U02212", "2324,00%")
    )
  )

  # Format the `num_1` column to 2 decimal places, apply the `gl_ES`
  # locale and use all other defaults
  expect_equal(
    (tab |>
       fmt_percent(columns = num_1, decimals = 2, locale = "gl_ES") |>
       render_formats_test("html"))[["num_1"]],
    c(
      "183.623,00%", "276.339,00%", "93.729,00%",
      "64.300,00%", "21.223,20%", "0,00%",
      paste0("\U02212", "2.324,00%")
    )
  )

  # Format the `num_2` column to 2 decimal places, expect that these
  # values are prescaled and just require a percent mark
  expect_equal(
    (tab |>
       fmt_percent(columns = num_2, decimals = 2, scale_values = FALSE) |>
       render_formats_test("html"))[["num_2"]],
    c(
      "34.00%", "74.00%", "23.00%", "93.00%",
      "35.00%", "76.00%", "57.00%"
    )
  )
})

test_that("fmt_percent() can render in the Indian numbering system", {

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

  # Create a single-column tibble with these values in `num`
  numbers_tbl <- dplyr::tibble(num = numbers)

  # Create a `gt_tbl` object with `gt()` and the `numbers_tbl` dataset
  tab <- gt(numbers_tbl)

  # Format the `num` column using the Indian numbering system
  expect_equal(
    (tab |>
       fmt_percent(columns = num, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "50,00,00,001.00%", "1,00,000.10%", "1,000.00%", "12,34,500.00%",
      "1,23,450.00%", "12,345.00%", "123.45%", "12.35%", "25,83,06,323.45%",
      "1,53,56,74,22,333.00%", "6,42,56,48,25,73,36,22,784.00%",
      paste0("\U02212", "50,00,00,00,000.00%"),
      paste0("\U02212", "1,00,000.10%"),
      paste0("\U02212", "1,000.00%"),
      paste0("\U02212", "12,34,500.00%"),
      paste0("\U02212", "1,23,450.00%"),
      paste0("\U02212", "12,345.00%"),
      paste0("\U02212", "123.45%"),
      paste0("\U02212", "12.35%"),
      paste0("\U02212", "0.00%"),
      "0.00%", "NA", "Inf%",
      paste0("\U02212", "Inf%")
    )
  )

  # Format the `num` column using the Indian numbering system; force
  # each number's sign to always be present
  expect_equal(
    (tab |>
       fmt_percent(columns = num, force_sign = TRUE, system = "ind") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "+50,00,00,001.00%", "+1,00,000.10%", "+1,000.00%", "+12,34,500.00%",
      "+1,23,450.00%", "+12,345.00%", "+123.45%", "+12.35%", "+25,83,06,323.45%",
      "+1,53,56,74,22,333.00%", "+6,42,56,48,25,73,36,22,784.00%",
      paste0("\U02212", "50,00,00,00,000.00%"),
      paste0("\U02212", "1,00,000.10%"),
      paste0("\U02212", "1,000.00%"),
      paste0("\U02212", "12,34,500.00%"),
      paste0("\U02212", "1,23,450.00%"),
      paste0("\U02212", "12,345.00%"),
      paste0("\U02212", "123.45%"),
      paste0("\U02212", "12.35%"),
      paste0("\U02212", "0.00%"),
      "0.00%", "NA",
      "+Inf%",
      paste0("\U02212", "Inf%")
    )
  )
})

test_that("fmt_percent() works correctly when stub present", {

  tbl <-
    dplyr::tibble(
      raw = c("[shiny](https://shiny.posit.co/)", "<a href='https://gt.rstudio.com/'>gt</a>"),
      markdown = lapply(c("[shiny](https://shiny.posit.co/)", "[gt](https://gt.rstudio.com/)"), md),
      html = lapply(c("<a href='https://shiny.posit.co/'>shiny</a>", "<a href='https://gt.rstudio.com/'>gt</a>"), html),
      str_col = c("shiny", "gt"),
      pct_col = c(0.75, 0.25)
  )

  for (test_case in c("raw", "markdown", "html")) {

    tab <-
      gt(tbl, rowname_col = test_case) |>
      fmt_percent(columns = pct_col, decimals = 2, dec_mark = ".") |>
      render_formats_test(context = "html")

    expect_equal(tab[["pct_col"]], c("75.00%", "25.00%"))

    # with row filter
    tab <-
      gt(tbl, rowname_col = test_case) |>
      fmt_percent(columns = pct_col, decimals = 2, dec_mark = ".", rows = contains("gt")) |>
      render_formats_test(context = "html")

    expect_equal(tab[["pct_col"]], c("0.75", "25.00%"))
  }
})
