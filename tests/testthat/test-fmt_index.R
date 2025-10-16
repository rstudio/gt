test_that("fmt_index() works correctly", {

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
        1500,
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
  expect_error(fmt_index(tab, columns = num_2))

  # Format the `num` column to uppercase letters
  expect_equal(
    (tab |>
       fmt_index(columns = num) |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "XX", "B", "A", "A", "", "", "", "", "", "", "", "A", "A",
      "A", "A", "A", "A", "B", "A", "B", "C", "D", "E", "F", "G", "H",
      "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "CCC",
      "BBBBBBBBB", "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
      "RRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRRR",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to lowercase letters
  expect_equal(
    (tab |>
       fmt_index(columns = num, case = "lower") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "xx", "b", "a", "a", "", "", "", "", "", "", "", "a", "a",
      "a", "a", "a", "a", "b", "a", "b", "c", "d", "e", "f", "g", "h",
      "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "ccc",
      "bbbbbbbbb", "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx",
      "rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr",
      "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to uppercase letters; use the alternative
  # indexing algorithm
  expect_equal(
    (tab |>
       fmt_index(columns = num, index_algo = "excel") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "AX", "B", "A", "A", "", "", "", "", "", "", "", "A", "A",
      "A", "A", "A", "A", "B", "A", "B", "C", "D", "E", "F", "G", "H",
      "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "BC",
      "HB", "AEX", "BER", "NA", "Inf", "-Inf"
    )
  )

  # Format the `num` column to lowercase letters; use the alternative
  # indexing algorithm
  expect_equal(
    (tab |>
       fmt_index(columns = num, case = "lower", index_algo = "excel") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "ax", "b", "a", "a", "", "", "", "", "", "", "", "a", "a",
      "a", "a", "a", "a", "b", "a", "b", "c", "d", "e", "f", "g", "h",
      "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "bc",
      "hb", "aex", "ber", "NA", "Inf", "-Inf"
    )
  )

  # Expect that a pattern will work correctly
  expect_equal(
    (tab |>
       fmt_index(columns = num, case = "lower", pattern = "..{x}..") |>
       render_formats_test(context = "html"))[["num"]],
    c(
      "..xx..", "..b..", "..a..", "..a..", "....", "....", "....",
      "....", "....", "....", "....", "..a..", "..a..", "..a..", "..a..",
      "..a..", "..a..", "..b..", "..a..", "..b..", "..c..", "..d..",
      "..e..", "..f..", "..g..", "..h..", "..i..", "..j..", "..k..",
      "..l..", "..m..", "..n..", "..o..", "..p..", "..q..", "..r..",
      "..s..", "..t..", "..ccc..", "..bbbbbbbbb..",
      "..xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx..",
      "..rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr..",
      "NA", "..Inf..", "..-Inf.."
    )
  )

  # Expect that a column with NAs will work fine with `fmt_index()`,
  # it'll just produce NA values
  na_col_tbl <- dplyr::tibble(a = rep(NA_real_, 10), b = 1:10) |> gt()

  # Expect a returned object of class `gt_tbl` with various
  # uses of `fmt_index()`
  expect_no_error(
    na_col_tbl |> fmt_index(columns = a) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_index(columns = a, rows = 1:5) |> as_raw_html()
  )

  expect_no_error(
    na_col_tbl |>
      fmt_index(columns = a, pattern = "a{x}b") |> as_raw_html()
  )

  # Expect that two columns being formatted (one entirely NA) will work
  expect_equal(
    (na_col_tbl |>
       fmt_index(columns = a) |>
       fmt_index(columns = b) |> render_formats_test("html"))[["b"]],
    c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J")
  )
})
