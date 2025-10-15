test_that("fmt_spelled_num() works correctly", {

  # Create an input data frame two columns: one
  # character-based and one that is numeric
  data_tbl <-
    data.frame(
      char = "a",
      num = c(
        -50,
        0.1,
        1.000010,
        1.1,
        1.95,
        1:20,
        0,
        55,
        75,
        100,
        101,
        1634,
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
  expect_error(tab |> fmt_spelled_num(columns = num_2))

  # Format the `num` column generate spelled out numbers
  expect_equal(
    (tab |>
       fmt_spelled_num(columns = num) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "-50", "zero", "one", "one", "one", "one", "two", "three",
      "four", "five", "six", "seven", "eight", "nine", "ten", "eleven",
      "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen",
      "eighteen", "nineteen", "twenty", "zero", "fifty-five", "seventy-five",
      "one hundred", "101", "1634", "NA", "Inf", "-Inf"
    )
  )

  # Expect that a pattern will work correctly
  expect_equal(
    (tab |>
       fmt_spelled_num(columns = num, pattern = "..{x}..") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "..-50..", "..zero..", "..one..", "..one..", "..one..", "..one..",
      "..two..", "..three..", "..four..", "..five..", "..six..", "..seven..",
      "..eight..", "..nine..", "..ten..", "..eleven..", "..twelve..",
      "..thirteen..", "..fourteen..", "..fifteen..", "..sixteen..",
      "..seventeen..", "..eighteen..", "..nineteen..", "..twenty..",
      "..zero..", "..fifty-five..", "..seventy-five..", "..one hundred..",
      "..101..", "..1634..", "NA", "..Inf..", "..-Inf.."
    )
  )

  # Expect that a column with NAs will work fine with `fmt_spelled_num()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_spelled_num()`
  expect_no_error(
    na_col_tbl |> fmt_spelled_num(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_spelled_num(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_spelled_num(columns = a, pattern = "a{x}b") |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  # FIXME creates many warning File not found (on windows)
  expect_equal(
    (na_col_tbl |>
       fmt_spelled_num(columns = a) |>
       fmt_spelled_num(columns = b) |>
       render_formats_test("html"))[["b"]],
    c(
      "one", "two", "three", "four", "five",
      "six", "seven", "eight", "nine", "ten"
    )
  )
})
