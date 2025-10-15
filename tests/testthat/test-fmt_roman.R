test_that("fmt_roman() works correctly", {

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
        1:20,
        55,
        210,
        830,
        1634,
        3529,
        3899,
        3900,
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
  expect_error(tab |> fmt_roman(columns = num_2))

  # Format the `num` column to uppercase Roman numerals
  expect_equal(
    (tab |>
       fmt_roman(columns = num) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "L", "II", "I", "I", "N", "N", "N", "N", "N", "N", "N", "I",
      "I", "I", "I", "I", "I", "II", "I", "II", "III", "IV", "V", "VI",
      "VII", "VIII", "IX", "X", "XI", "XII", "XIII", "XIV", "XV", "XVI",
      "XVII", "XVIII", "XIX", "XX", "LV", "CCX", "DCCCXXX", "MDCXXXIV",
      "MMMDXXIX", "MMMDCCCXCIX", "ex terminis", "ex terminis", "NA",
      "Inf", "-Inf"
    )
  )

  # Format the `num` column to lowercase Roman numerals
  expect_equal(
    (tab |>
       fmt_roman(columns = num, case = "lower") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "l", "ii", "i", "i", "n", "n", "n", "n", "n", "n", "n", "i",
      "i", "i", "i", "i", "i", "ii", "i", "ii", "iii", "iv", "v", "vi",
      "vii", "viii", "ix", "x", "xi", "xii", "xiii", "xiv", "xv", "xvi",
      "xvii", "xviii", "xix", "xx", "lv", "ccx", "dcccxxx", "mdcxxxiv",
      "mmmdxxix", "mmmdcccxcix", "ex terminis", "ex terminis", "NA",
      "Inf", "-Inf"
    )
  )

  # Expect that a pattern will work correctly
  expect_equal(
    (tab |>
       fmt_roman(columns = num, case = "lower", pattern = "..{x}..") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "..l..", "..ii..", "..i..", "..i..", "..n..", "..n..", "..n..",
      "..n..", "..n..", "..n..", "..n..", "..i..", "..i..", "..i..",
      "..i..", "..i..", "..i..", "..ii..", "..i..", "..ii..", "..iii..",
      "..iv..", "..v..", "..vi..", "..vii..", "..viii..", "..ix..",
      "..x..", "..xi..", "..xii..", "..xiii..", "..xiv..", "..xv..",
      "..xvi..", "..xvii..", "..xviii..", "..xix..", "..xx..", "..lv..",
      "..ccx..", "..dcccxxx..", "..mdcxxxiv..", "..mmmdxxix..",
      "..mmmdcccxcix..", rep("..ex terminis..", 2), "NA", "..Inf..", "..-Inf.."
    )
  )

  # Expect that a column with NAs will work fine with `fmt_roman()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_roman()`
  expect_no_error(
    na_col_tbl |> fmt_roman(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_roman(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_roman(columns = a, pattern = "a{x}b") |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_roman(columns = a) |>
       fmt_roman(columns = b) |> render_formats_test("html"))[["b"]],
    c("I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX", "X")
  )
})
