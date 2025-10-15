test_that("fmt_fraction() works correctly", {

  # Create an input data frame two columns: one
  # character-based and one that is numeric
  data_tbl <-
    data.frame(
      char = "a",
      num = c(
        -50,
        -1.5,
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

  # Extract vectors from the table object for comparison
  # to the original dataset
  char <- dt_data_get(tab)[["char"]]
  num <- dt_data_get(tab)[["num"]]

  # Expect the extracted values to match those of the original dataset
  expect_equal(data_tbl$char, char)

  expect_equal(data_tbl$num, num)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab |> fmt_fraction(columns = num_2))

  # Expect an error when using a locale that does not exist
  expect_error(tab |> fmt_fraction(columns = num, locale = "aa_bb"))

  # Expect an error when using an invalid accuracy value
  expect_error(tab |> fmt_fraction(columns = num, accuracy = "invalid"))

  expect_error(tab |> fmt_fraction(columns = num, accuracy = 0))

  expect_no_error(tab |> fmt_fraction(columns = num, accuracy = 1))

  expect_error(tab |> fmt_fraction(columns = num, accuracy = FALSE))

  # Format the `num` column to fractions with the 'low' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(columns = num, accuracy = "low", layout = "inline") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "8/9"),
      "0", "0", "0", "0",
      "1/9", "1/9", "2/7", "1/2", "5/9", "8/9", "1", "1", "1 1/9",
      "2", "2,000,000 1/5", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with the 'medium' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(columns = num, accuracy = "med", layout = "inline") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "9/10"),
      "0", "0", "0",
      "1/25", "3/50", "1/10", "3/10", "1/2", "5/9", "23/25", "1", "1",
      "1 1/10", "1 19/20", "2,000,000 1/5", "30,000,000,000", "NA",
      "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with the 'high' accuracy
  # level and have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(columns = num, accuracy = "high", layout = "inline") |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "998/999"), paste0("\U02212", "9/10"),
      paste0("\U02212", "1/500"),
      "0", "1/500", "1/25", "3/50", "1/10", "3/10", "1/2", "139/250",
      "23/25", "998/999", "1", "1 1/10", "1 19/20", "2,000,000 1/5",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # halves (`2`) for the denominator; have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 2,
         simplify = FALSE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "1"),
      "0", "0", "0", "0", "0", "0", "1/2", "1/2", "1/2",
      "1", "1", "1", "1", "2", "2,000,000",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # halves (`2`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 2,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "1"),
      "0", "0", "0", "0", "0", "0", "1/2", "1/2", "1/2",
      "1", "1", "1", "1", "2", "2,000,000",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # quarters (`4`) for the denominator; have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 4,
         simplify = FALSE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 2/4"),
      paste0("\U02212", "1"), paste0("\U02212", "1"),
      "0", "0", "0", "0", "0", "0", "1/4", "2/4", "2/4",
      "1", "1", "1", "1", "2", "2,000,000 1/4",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # quarters (`4`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 4,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "1"),
      "0", "0", "0", "0", "0", "0", "1/4", "1/2", "1/2",
      "1", "1", "1", "1", "2", "2,000,000 1/4",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # eighths (`8`) for the denominator; have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 8,
         simplify = FALSE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 4/8"),
      paste0("\U02212", "1"), paste0("\U02212", "7/8"),
      "0", "0", "0", "0", "0", "1/8", "2/8",
      "4/8", "4/8", "7/8", "1", "1", "1 1/8", "2",
      "2,000,000 2/8", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # eighths (`8`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 8,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "7/8"),
      "0", "0", "0", "0", "0", "1/8", "1/4", "1/2", "1/2",
      "7/8", "1", "1", "1 1/8", "2", "2,000,000 1/4", "30,000,000,000",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # sixteenths (`16`) for the denominator; have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 16,
         simplify = FALSE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 8/16"),
      paste0("\U02212", "1"), paste0("\U02212", "14/16"), "0", "0", "0",
      "1/16", "1/16", "2/16", "5/16", "8/16", "9/16", "15/16", "1",
      "1", "1 2/16", "1 15/16", "2,000,000 3/16", "30,000,000,000",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # sixteenths (`16`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 16,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "7/8"), "0", "0", "0", "1/16",
      "1/16", "1/8", "5/16", "1/2", "9/16", "15/16", "1", "1", "1 1/8",
      "1 15/16", "2,000,000 3/16", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator; have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100,
         simplify = FALSE, layout = "inline"
        ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 50/100"),
      paste0("\U02212", "1"), paste0("\U02212", "90/100"), "0", "0",
      "0", "4/100", "6/100", "10/100", "30/100", "50/100", "56/100",
      "92/100", "1", "1", "1 10/100", "1 95/100", "2,000,000 20/100",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "9/10"), "0", "0", "0",
      "1/25", "3/50", "1/10", "3/10", "1/2", "14/25", "23/25", "1",
      "1", "1 1/10", "1 19/20", "2,000,000 1/5", "30,000,000,000",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # a very large denominator (`9999999`); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 9999999,
         simplify = FALSE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 5000000/9999999"),
      paste0("\U02212", "9989999/9999999"),
      paste0("\U02212", "8999999/9999999"),
      paste0("\U02212", "20000/9999999"),
      "0", "20000/9999999", "400000/9999999", "600000/9999999",
      "1000000/9999999", "3000000/9999999", "5000000/9999999",
      "5559999/9999999", "9199999/9999999", "9989999/9999999", "1",
      "1 1000000/9999999", "1 9499999/9999999", "2,000,000 2000000/9999999",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # a very large denominator (`9999999`); simplify and have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 9999999,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 5000000/9999999"),
      paste0("\U02212", "9989999/9999999"), paste0("\U02212", "8999999/9999999"),
      paste0("\U02212", "20000/9999999"),
      "0", "20000/9999999", "400000/9999999", "200000/3333333",
      "1000000/9999999", "1000000/3333333", "5000000/9999999",
      "1853333/3333333", "9199999/9999999", "9989999/9999999", "1",
      "1 1000000/9999999", "1 9499999/9999999", "2,000,000 2000000/9999999",
      "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator (and simplify); have the layout be 'inline'
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100,
         simplify = TRUE, layout = "inline"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 1/2"),
      paste0("\U02212", "1"), paste0("\U02212", "9/10"),
      "0", "0", "0", "1/25", "3/50", "1/10", "3/10", "1/2", "14/25", "23/25",
      "1", "1", "1 1/10", "1 19/20", "2,000,000 1/5", "30,000,000,000",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator, have the layout be 'inline' and
  # apply the `en_US` locale
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100, simplify = FALSE,
         layout = "inline", locale = "en_US"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 50/100"),
      paste0("\U02212", "1"), paste0("\U02212", "90/100"),
      "0", "0", "0", "4/100", "6/100", "10/100", "30/100", "50/100",
      "56/100", "92/100", "1", "1", "1 10/100", "1 95/100",
      "2,000,000 20/100", "30,000,000,000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator, have the layout be 'inline' and
  # apply the `da_DK` locale
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100, simplify = FALSE,
         layout = "inline", locale = "da_DK"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 50/100"),
      paste0("\U02212", "1"), paste0("\U02212", "90/100"),
      "0", "0", "0", "4/100", "6/100", "10/100", "30/100", "50/100",
      "56/100", "92/100", "1", "1", "1 10/100", "1 95/100", "2.000.000 20/100",
      "30.000.000.000", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to fractions with an accuracy in terms of
  # hundredths (`100`) for the denominator, have the layout be 'inline' and
  # apply the `de_AT` locale
  expect_equal(
    (tab |>
       fmt_fraction(
         columns = num, accuracy = 100, simplify = FALSE,
         layout = "inline", locale = "de_AT"
       ) |>
       render_formats_test("html"))[["num"]],
    c(
      paste0("\U02212", "50"), paste0("\U02212", "1 50/100"),
      paste0("\U02212", "1"), paste0("\U02212", "90/100"), "0", "0", "0",
      "4/100", "6/100", "10/100", "30/100", "50/100", "56/100", "92/100",
      "1", "1", "1 10/100", "1 95/100", "2 000 000 20/100", "30 000 000 000",
      "NA", "Inf", "-Inf"
    )
  )

  # Expect that a column with NAs will work fine with `fmt_fraction()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_fraction()`
  expect_no_error(
    na_col_tbl |> fmt_fraction(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_fraction(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_fraction(columns = a, pattern = "a{x}b") |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_fraction(columns = a) |>
       fmt_fraction(columns = b) |> render_formats_test("html"))[["b"]],
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10")
  )
})

test_that("fmt_fraction() produces reproducible results for HTML output", {

  # Define values
  range_0_1 <- c(0.0001, 0.001, 0.01, 0.1, 0.25, 0.4, 0.5, 0.6, 0.75, 0.9, 0.99, 0.999, 0.9999)
  range_0_1_minus <- range_0_1 * -1
  range_1_2 <- range_0_1 + 1
  range_1_2_minus <- range_0_1_minus - 1
  exact_numbers <- c(-1, 0, 1)
  not_numbers <- c(NA_real_, NaN, Inf, -Inf)

  #
  # Generate gt tables that exhaustively use `fmt_fraction()`
  # across a wide range of numbers and formatting accuracy
  #

  input_data <-
    dplyr::tibble(
      x = c(
        range_0_1, range_0_1_minus, range_1_2, range_1_2_minus,
        exact_numbers, not_numbers
      ),
      category = c(
        rep("0 to 1", length(range_0_1)),
        rep("0 to -1", length(range_0_1_minus)),
        rep("1 to 2", length(range_1_2)),
        rep("-1 to -2", length(range_1_2_minus)),
        rep("Exact Numbers", length(exact_numbers)),
        rep("Not Numbers", length(not_numbers))
      ),
      low = x,
      med = x,
      high = x,
      halves = x,
      quarters = x,
      eighths = x,
      sixteenths = x,
      hundredths = x
    )

  # Generate table with the `layout = "diagonal"` option (the default)
  fraction_tbl_diagonal <-
    input_data |>
    gt(rowname_col = "x", groupname_col = "category") |>
    fmt_fraction(columns = low, accuracy = "low", layout = "diagonal") |>
    fmt_fraction(columns = med, accuracy = "med", layout = "diagonal") |>
    fmt_fraction(columns = high, accuracy = "high", layout = "diagonal") |>
    fmt_fraction(columns = halves, accuracy = 2, simplify = FALSE, layout = "diagonal") |>
    fmt_fraction(columns = quarters, accuracy = 4, simplify = FALSE, layout = "diagonal") |>
    fmt_fraction(columns = eighths, accuracy = 8, simplify = FALSE, layout = "diagonal") |>
    fmt_fraction(columns = sixteenths, accuracy = 16, simplify = FALSE, layout = "diagonal") |>
    fmt_fraction(columns = hundredths, accuracy = 100, simplify = FALSE, layout = "diagonal") |>
    cols_width(everything() ~ px(100)) |>
    opt_all_caps() |>
    tab_options(latex.use_longtable = TRUE)

  # Generate table with the `layout = "inline"` option
  fraction_tbl_inline <-
    input_data |>
    gt(rowname_col = "x", groupname_col = "category") |>
    fmt_fraction(columns = low, accuracy = "low", layout = "inline") |>
    fmt_fraction(columns = med, accuracy = "med", layout = "inline") |>
    fmt_fraction(columns = high, accuracy = "high", layout = "inline") |>
    fmt_fraction(columns = halves, accuracy = 2, layout = "inline", simplify = FALSE) |>
    fmt_fraction(columns = quarters, accuracy = 4, layout = "inline", simplify = FALSE) |>
    fmt_fraction(columns = eighths, accuracy = 8, layout = "inline", simplify = FALSE) |>
    fmt_fraction(columns = sixteenths, accuracy = 16, layout = "inline", simplify = FALSE) |>
    fmt_fraction(columns = hundredths, accuracy = 100, layout = "inline", simplify = FALSE) |>
    cols_width(everything() ~ px(100)) |>
    opt_all_caps() |>
    tab_options(latex.use_longtable = TRUE)

  # Generate table with inline fractions that are simplified when specifying a
  # denominator value for `accuracy`
  fraction_tbl_simplified <-
    input_data |>
    gt(rowname_col = "x", groupname_col = "category") |>
    fmt_fraction(columns = low, accuracy = "low") |>
    fmt_fraction(columns = med, accuracy = "med") |>
    fmt_fraction(columns = high, accuracy = "high") |>
    fmt_fraction(columns = halves, accuracy = 2) |>
    fmt_fraction(columns = quarters, accuracy = 4) |>
    fmt_fraction(columns = eighths, accuracy = 8) |>
    fmt_fraction(columns = sixteenths, accuracy = 16) |>
    fmt_fraction(columns = hundredths, accuracy = 100) |>
    cols_width(everything() ~ px(100)) |>
    opt_all_caps() |>
    tab_options(latex.use_longtable = TRUE)

  # Perform snapshot tests for HTML outputs
  expect_snapshot_html(fraction_tbl_diagonal)

  expect_snapshot_html(fraction_tbl_inline)

  expect_snapshot_html(fraction_tbl_simplified)

  # Perform snapshot tests for LaTeX outputs
  expect_snapshot_latex(fraction_tbl_diagonal)

  expect_snapshot_latex(fraction_tbl_inline)

  expect_snapshot_latex(fraction_tbl_simplified)

  # Perform snapshot tests for RTF outputs
  expect_snapshot_rtf(fraction_tbl_diagonal)

  expect_snapshot_rtf(fraction_tbl_inline)

  expect_snapshot_rtf(fraction_tbl_simplified)
})

test_that("fmt_fraction() can render values in the Indian numbering system", {

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

  # Format the `num` column as fractions using the Indian numbering system
  expect_equal(
    (tab |>
       fmt_fraction(columns = num, layout = "diagonal", system = "ind") |>
       render_formats_test(context = "latex"))[["num"]],
    c(
      "50,00,000", "1,000", "10", "12,345", "1,234\\textsuperscript{1}\\!/\\textsubscript{2}",
      "123\\textsuperscript{4}\\!/\\textsubscript{9}", "1\\textsuperscript{2}\\!/\\textsubscript{9}", "\\textsuperscript{1}\\!/\\textsubscript{8}",
      "25,83,063\\textsuperscript{2}\\!/\\textsubscript{9}", "1,53,56,74,223\\textsuperscript{1}\\!/\\textsubscript{3}",
      "6,42,56,48,25,73,36,228", "-50,00,00,000", "-1,000", "-10",
      "-12,345", "-1,234\\textsuperscript{1}\\!/\\textsubscript{2}", "-123\\textsuperscript{4}\\!/\\textsubscript{9}",
      "-1\\textsuperscript{2}\\!/\\textsubscript{9}", "-\\textsuperscript{1}\\!/\\textsubscript{8}", "0", "0",
      "NA", "Inf", "-Inf"
    )
  )
})
