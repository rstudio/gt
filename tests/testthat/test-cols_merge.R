# Create a table with four columns of values
tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,
     767.6,  928.1,  382.0,  674.5,
     403.3,  461.5,   15.1,  242.8,
     686.4,   54.1,  282.7,   56.3,
     662.6,  148.8,  984.6,  928.1,
     198.5,   65.1,  127.4,  219.3,
     132.1,  118.1,   91.2,  874.3,
     349.7,  307.1,  566.7,  542.9,
      63.7,  504.3,  152.0,  724.5,
     105.4,  729.8,  962.4,  336.4,
     924.2,  424.6,  740.8,  104.2
  )

# Create a table with three columns, the last two having different
# combinations of NA values
tbl_na <-
  dplyr::tibble(
    a = 1:4,
    b = c(1, NA, 3,  NA),
    c = c(1, 2,  NA, NA),
    d = c("1", "2", NA_character_, NA_character_),
    e = c(TRUE, FALSE, NA, NA)
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_merge() works correctly", {

  local_options("rlib_warning_verbosity" = "verbose")

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with a `pattern`
  tbl_html <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c("drat", "wt"),
      hide_columns = wt,
      pattern = "{1} ({2})"
    )

  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1} ({2})")
  expect_equal(merged_res$vars, c("drat", "wt"))
  expect_equal(merged_res$type, "merge")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with a `pattern` and use `c()`
  tbl_html <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    )

  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1} ({2})")
  expect_equal(merged_res$vars, c("drat", "wt"))
  expect_equal(merged_res$type, "merge")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with two different `pattern`s; use `c()`
  tbl_html <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    ) |>
    cols_merge(
      columns = c(gear, carb),
      hide_columns = carb,
      pattern = "{1}-{2}"
    )

  # Expect that merging statements are stored in `col_merge`
  merged_res1 <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res1$pattern, "{1} ({2})")
  expect_equal(merged_res1$vars, c("drat", "wt"))
  expect_equal(merged_res1$type, "merge")

  merged_res2 <- dt_col_merge_get(data = tbl_html)[[2]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res2$pattern, "{1}-{2}")
  expect_equal(merged_res2$vars, c("gear", "carb"))
  expect_equal(merged_res2$type, "merge")

  # Expect a warning if additional, out of scope columns, are
  # included in `hide_columns`
  expect_warning(
    gt(mtcars_short) |>
      cols_merge(
        columns = c(drat, wt),
        hide_columns = c(wt, carb),
      )
  )

  #
  # Expect that the column set as the row group can participate
  # in column merging
  #

  tbl <-
    dplyr::tibble(
      row = "Part",
      a = 1:5,
      b = c("one", "two", "three", "four", "five")
    )

  # Merge the stub column with column `a` (has integers)
  gt_tbl_1 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge(columns = c(row, a))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)

  # Merge the stub column with column `b` (has character values)
  gt_tbl_2 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge(columns = c(row, b))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_2)

  # Merge the stub column with a formatted column `a`
  # (has lowercase Roman numerals, transformed to character from integer)
  gt_tbl_3 <-
    gt(tbl, rowname_col = "row") |>
    fmt_roman(columns = "a", case = "lower") |>
    cols_merge(columns = c(row, a))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_3)

  # Ensure that `group` columns don't get the same treatment
  expect_equal(
    gt(tbl, groupname_col = "row") |>
      render_as_html(),
    gt(tbl, groupname_col = "row") |>
      cols_merge(columns = c(row, a)) |>
      render_as_html()
  )

  # Use `cols_merge()` with a vector of `rows` which limits the rows
  # that participate in the merging process
  gt_tbl_4 <-
    gt(mtcars_short) |>
    cols_merge(
      columns = c(drat, wt),
      rows = c(2, 4),
      pattern = "{1} ({2})"
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_4)
})

test_that("The secondary pattern language works well in `cols_merge()`", {

  # Create a `tbl_html` object with `gt()`
  tbl_gt <- gt(tbl_na)

  #
  # Perform several merges of all columns onto column `a` with
  # different variations of a secondary pattern (i.e., `<< >>`)
  #

  tbl_gt_1 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_1, "html")[["a"]],
    c("111", "2NA2", "33", "4NA")
  )

  tbl_gt_2 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "{1}{2}<<{3}>>") |>
    sub_missing(missing_text = "X")

  expect_equal(
    render_formats_test(tbl_gt_2, "html")[["a"]],
    c("111", "2X2", "33X", "4XX")
  )

  tbl_gt_3 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "{1}<<{2}<<{3}>>>>")

  expect_equal(
    render_formats_test(tbl_gt_3, "html")[["a"]],
    c("111", "2", "33", "4")
  )

  tbl_gt_4 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "{1}<<{2}-{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_4, "html")[["a"]],
    c("11-1", "2", "3", "4")
  )

  tbl_gt_5 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "<<{1}-{2}-{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_5, "html")[["a"]],
    c("1-1-1", "", "", "")
  )

  tbl_gt_6 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "<<{1}<<{2}<<{3}>>>>>>")

  expect_equal(
    render_formats_test(tbl_gt_6, "html")[["a"]],
    c("111", "2", "33", "4")
  )

  tbl_gt_7 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, c), pattern = "<<<<<<X>>>>>>")

  expect_equal(
    render_formats_test(tbl_gt_7, "html")[["a"]],
    rep("X", 4)
  )

  tbl_gt_9 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, d), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_9, "html")[["a"]],
    c("111", "2NA2", "33", "4NA")
  )

  tbl_gt_10 <-
    tbl_gt |>
    sub_missing(missing_text = "X") |>
    cols_merge(columns = c(a, b, d), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_10, "html")[["a"]],
    c("111", "2X2", "33X", "4XX")
  )

  tbl_gt_11 <-
    tbl_gt |>
    cols_merge(columns = c(a, b, e), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    render_formats_test(tbl_gt_11, "html")[["a"]],
    c("11TRUE", "2NAFALSE", "33", "4NA")
  )

  tbl_gt_12 <-
    tbl_gt |>
    sub_missing(missing_text = "X") |>
    cols_merge(columns = c(a, b, e), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    (tbl_gt_12 |> render_formats_test("html"))[["a"]],
    c("11TRUE", "2XFALSE", "33X", "4XX")
  )

  tbl_gt_13 <-
    tbl_gt |>
    sub_missing(missing_text = "X") |>
    cols_merge(columns = c(a, b, e), rows = c(1, 3), pattern = "{1}{2}<<{3}>>")

  expect_equal(
    (tbl_gt_13 |> render_formats_test("html"))[["a"]],
    c("11TRUE", "2", "33X", "4")
  )
})

test_that("cols_merge_uncert() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()`
  tbl_html <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = "col_1",
      col_uncert = "col_2"
    )

  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_uncert")
  expect_equal(merged_res$sep, " +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()` and tidyselect
  tbl_html <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    )

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_uncert")
  expect_equal(merged_res$sep, " +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with `cols_merge_uncert()`
  tbl_html <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    ) |>
    cols_merge_uncert(
      col_val = col_3,
      col_uncert = col_4
    )

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_uncert")
  expect_equal(merged_res$sep, " +/- ")

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[2]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_3", "col_4"))
  expect_equal(merged_res$type, "merge_uncert")
  expect_equal(merged_res$sep, " +/- ")

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_uncert()` but use the `I()`
  # function to keep the separator text as is
  tbl_html <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2,
      sep = I(" +/- ")
    )

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_uncert")

  # Expect that `sep` has the `AsIs` class
  expect_s3_class(merged_res$sep, "AsIs")
  expect_equal(as.character(merged_res$sep), " +/- ")
  expect_equal(merged_res$sep, I(" +/- "))

})

test_that("cols_merge_uncert() works with row groups", {

  # Expect that the column set as the row group can participate
  # in column merging through `cols_merge_uncert()`

  tbl <-
    dplyr::tibble(
      row = c(2.3, 6.3, 2.5, 2.4, 6.5),
      a = 6:10 / 100,
      b = LETTERS[1:5]
    )

  # Merge the stub column with column `a`
  gt_tbl_1 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge_uncert(col_val = row, col_uncert = a)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)

  # Use `cols_merge_uncert()` with a vector of `rows` which limits the rows
  # that participate in the merging process
  gt_tbl_2 <-
    gt(tbl) |>
    cols_merge_uncert(
      col_val = row,
      col_uncert = a,
      rows = c(2, 4)
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_2)
})

test_that("cols_merge_uncert() works nicely with different error bounds", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a table with three columns of values
  tbl_uncert <-
    dplyr::tibble(
      value = c(34.5, 29.2, 36.3, 31.6, 28.5, 30.9,  NA, NA, Inf, 30, 32,  34,  NaN),
      lu =    c(2.1,   2.4,  2.6,  1.8,   NA,   NA, 1.2, NA,  NA,  0, 0.1, NaN, 0.1),
      uu =    c(1.8,   2.7,  2.6,   NA,  1.6,   NA,  NA, NA,  NA,  0, 0,   0.1, 0.3)
    )

  # Create a `tbl_html` object with `gt()`; merge three columns together
  # with `cols_merge_uncert()`
  tbl_gt <-
    gt(tbl_uncert) |>
    cols_merge_uncert(
      col_val = "value",
      col_uncert = c("lu", "uu")
    )

  expect_equal(
    (tbl_gt |> render_formats_test("html"))[["value"]],
    c(
      paste0("34.5<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+1.8<br>", "\U02212", "2.1</span>"),
      paste0("29.2<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+2.7<br>", "\U02212", "2.4</span>"),
      paste0("36.3 \U000B1 2.6"),
      paste0("31.6<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+NA<br>", "\U02212", "1.8</span>"),
      paste0("28.5<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+1.6<br>", "\U02212", "NA</span>"),
      "30.9", "NA", "NA", "Inf",
      paste0("30.0 \U000B1 0.0"),
      paste0("32.0<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+0.0<br>", "\U02212", "0.1</span>"),
      paste0("34.0<span style=\"display:inline-block;line-height:1em;text-align:right;font-size:60%;vertical-align:-0.25em;margin-left:0.1em;\">+0.1<br>", "\U02212", "NaN</span>"),
      "NaN"
    )
  )

  expect_equal(
    (tbl_gt |> render_formats_test("latex"))[["value"]],
    c(
      "$34.5^{+1.8}_{-2.1}$", "$29.2^{+2.7}_{-2.4}$", "36.3 ± 2.6",
      "$31.6^{+NA}_{-1.8}$", "$28.5^{+1.6}_{-NA}$", "30.9", "NA", "NA",
      "Inf", "30.0 ± 0.0", "$32.0^{+0.0}_{-0.1}$", "$34.0^{+0.1}_{-NaN}$",
      "NaN"
    )
  )

  expect_equal(
    (tbl_gt |> render_formats_test("rtf"))[["value"]],
    c(
      "34.5(+1.8, -2.1)", "29.2(+2.7, -2.4)", "36.3 \\'b1 2.6", "31.6(+NA, -1.8)",
      "28.5(+1.6, -NA)", "30.9", "NA", "NA", "Inf", "30.0 \\'b1 0.0",
      "32.0(+0.0, -0.1)", "34.0(+0.1, -NaN)", "NaN"
    )
  )

  # Use `cols_merge_uncert()` with a vector of `rows` which limits the rows
  # that participate in the merging process
  gt_tbl_1 <-
    gt(tbl_uncert) |>
    cols_merge_uncert(
      col_val = "value",
      col_uncert = c("lu", "uu"),
      rows = c(1, 4, 6:11)
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)
})

test_that("cols_merge_range() works correctly", {

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_html <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = "col_1",
      col_end = "col_2"
    )

  merged_range <- dt_col_merge_get(tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_range$pattern, "{1}{sep}{2}")
  expect_equal(merged_range$vars, c("col_1", "col_2"))
  expect_equal(merged_range$type, "merge_range")
  expect_equal(merged_range$sep, "\U2013")
})

test_that("cols_merge_range works 2", {

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_html <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  merged_range <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_range$pattern, "{1}{sep}{2}")
  expect_equal(merged_range$vars, c("col_1", "col_2"))
  expect_equal(merged_range$type, "merge_range")
  expect_equal(merged_range$sep, "\U2013")
})

test_that("cols_merge_range() works with 2 statements", {

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with `cols_merge_range()`
  tbl_html <-
    gt(tbl) |>
    cols_merge_range(col_begin = col_1, col_end = col_2) |>
    cols_merge_range(col_begin = col_3, col_end = col_4)

  merged_range1 <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_range1$pattern, "{1}{sep}{2}")
  expect_equal(merged_range1$vars, c("col_1", "col_2"))
  expect_equal(merged_range1$type, "merge_range")
  expect_equal(merged_range1$sep, "\U2013")

  merged_range2 <- dt_col_merge_get(data = tbl_html)[[2]]

  expect_equal(merged_range2$pattern, "{1}{sep}{2}")
  expect_equal(merged_range2$vars, c("col_3", "col_4"))
  expect_equal(merged_range2$type, "merge_range")
  expect_equal(merged_range2$sep, "\U2013")
})

test_that("cols_merge_range() respects locale for separators", {

  # only locale set in cols_merge
  expect_merge_locale_sep(locale = "en", expected_sep = "\U2013")
  expect_merge_locale_sep(locale = "es", expected_sep = "-")
  expect_merge_locale_sep(locale = "nl", expected_sep = "-")
  expect_merge_locale_sep(locale = "zh", expected_sep = "-")
  expect_merge_locale_sep(locale = "ja", expected_sep = "\UFF5E")
  expect_merge_locale_sep(locale = "ko", expected_sep = "~")
  expect_merge_locale_sep(locale = "to", expected_sep = "\U2014")
  expect_merge_locale_sep(locale = "bg", expected_sep = " \U2013 ")
  expect_merge_locale_sep(locale = "bs", expected_sep =  " \U2013 ")
  expect_merge_locale_sep(locale = "pt", expected_sep =  "\U2013")
  expect_merge_locale_sep(locale = "pt-PT", expected_sep = " - ")

  # Expect that different `locale` priorities and `sep` overrides work correctly
  expect_merge_locale_sep(global_locale = "pt-PT", expected_sep = " - ")
  expect_merge_locale_sep(global_locale = "ja", expected_sep = "\UFF5E")
  expect_merge_locale_sep(global_locale = "ja", locale = "ja", expected_sep = "\UFF5E")
  expect_merge_locale_sep(global_locale = "ja", locale = "en", expected_sep = "\U2013")
  expect_merge_locale_sep(global_locale = "ja", locale = "ko", sep = "q", expected_sep = "q")
})

test_that("cols_merge_range() works", {

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_range()` but use the `I()`
  # function to keep the `--` separator text as is
  tbl_html <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2,
      sep = I("--")
    )

  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_range")

  # Expect that `sep` has the `AsIs` class
  expect_s3_class(merged_res$sep, "AsIs")
  expect_equal(as.character(merged_res$sep), "--")
  expect_equal(merged_res$sep, I("--"))

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_range()` but use the `I()`
  # function to keep the `---` separator text as is
  tbl_html <-
    gt(tbl) |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2,
      sep = I("---")
    )

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("col_1", "col_2"))
  expect_equal(merged_res$type, "merge_range")

  # Expect that `sep` has the `AsIs` class
  expect_s3_class(merged_res$sep, "AsIs")
  expect_equal(as.character(merged_res$sep), "---")
  expect_equal(merged_res$sep, I("---"))
})

test_that("cols_merge_range() works well", {

  # Create two gt table objects; the first will be based
  # on `tbl` while the second will use a different column name
  # in `tbl` (`sep`) that collides with a pattern element name
  tbl_html_1 <-
    tbl |>
    gt() |>
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  tbl_html_2 <-
    tbl |>
    dplyr::rename(sep = col_2) |>
    gt() |>
    cols_merge_range(
      col_begin = col_1,
      col_end = sep
    )

  # Expect that the HTML produced from the two tables is the same
  expect_equal_gt(tbl_html_1, tbl_html_2, f = as_raw_html, ignore_id = TRUE)

  # Create another variant that renames `col_2` as `1`, which
  # might be thought to interfere with the default pattern
  tbl_html_3 <-
    tbl |>
    dplyr::rename(`1` = col_2) |>
    gt() |>
    cols_merge_range(
      col_begin = col_1,
      col_end = `1`
    )

  # Expect that the HTML produced from `tbl_html_2` and
  # `tbl_html_3` is the same
  expect_equal_gt(tbl_html_2, tbl_html_3, f = as_raw_html, ignore_id = TRUE)
})

test_that("cols_merge_range() produces the correct output", {

  check_suggests()

  #
  # Expect that the column set as the row group can participate
  # in column merging through `col_merge_range()`
  #

  tbl <-
    dplyr::tibble(
      row = 1:5,
      a = 6:10,
      b = c("one", "two", "three", "four", "five")
    )

  # Merge the stub column with column `a` (has integers)
  gt_tbl_1 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge_range(col_begin = row, col_end = a)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)

  # Merge the stub column with column `b` (has character values)
  gt_tbl_2 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge_range(col_begin = row, col_end = b)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_2)

  # Merge the stub column with a formatted column `a`
  # (has lowercase Roman numerals, transformed to character from integer)
  gt_tbl_3 <-
    gt(tbl, rowname_col = "row") |>
    fmt_roman(columns = "a", case = "lower") |>
    cols_merge_range(col_begin = row, col_end = a)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_3)

  # Merge the formatted stub column with column `a`
  # (has lowercase Roman numerals, transformed to character from integer)
  gt_tbl_4 <-
    gt(tbl, rowname_col = "row") |>
    fmt_roman(columns = "row", case = "lower") |>
    cols_merge_range(col_begin = row, col_end = a)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_4)

  # Use `cols_merge_range()` with a vector of `rows` which limits the rows
  # that participate in the merging process
  gt_tbl_5 <-
    gt(tbl, rowname_col = "row") |>
    cols_merge_range(
      col_begin = a,
      col_end = b,
      rows = c(2, 4)
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_5)
})

test_that("cols_merge_n_pct() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  tbl_n_pct <-
    dplyr::tribble(
      ~a, ~b,
      1,  0.0714,
      5,  0.3571,
      0,  0.0,
      2,  0.1429,
      NA, NA,
      6,  0.4286,
      5, NA,
      NA, 1000,
      0, NA,
      NA, 0
    )

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()`
  tbl_html <-
    gt(tbl_n_pct) |>
    cols_merge_n_pct(col_n = a, col_pct = b) |>
    fmt_percent(columns = b, decimals = 1)

  # Expect that merging statements are stored in `col_merge`
  merged_res <- dt_col_merge_get(data = tbl_html)[[1]]

  # Expect that merging statements are stored in `col_merge`
  expect_equal(merged_res$pattern, "{1}{sep}{2}")
  expect_equal(merged_res$vars, c("a", "b"))
  expect_equal(merged_res$type, "merge_n_pct")
  expect_equal(merged_res$sep, "")

  expect_equal(
    render_formats_test(tbl_html, "html")[["a"]],
    c(
      "1 (7.1%)", "5 (35.7%)", "0", "2 (14.3%)",
      "NA", "6 (42.9%)", "5", "NA", "0", "NA"
    )
  )

  expect_equal(
    render_formats_test(tbl_html, "html")[["b"]],
    c(
      "7.1%", "35.7%", "0.0%", "14.3%",
      "NA", "42.9%", "NA", "100,000.0%", "NA",
      "0.0%"
    )
  )

  #
  # Expect that the column set as the row group can participate
  # in column merging through `cols_merge_n_pct()`
  #

  tbl <-
    dplyr::tibble(
      row = 1:5,
      a = 6:10 / 100,
      b = LETTERS[1:5]
    )

  # Merge the stub column with column `a` (formatted as percentage values)
  gt_tbl_1 <-
    gt(tbl, rowname_col = "row") |>
    fmt_percent(columns = a) |>
    cols_merge_n_pct(col_n = row, col_pct = a)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)

  # Use `cols_merge_n_pct()` with a vector of `rows` which limits the rows
  # that participate in the merging process
  gt_tbl_2 <-
    tbl_n_pct |>
    gt() |>
    cols_merge_n_pct(
      col_n = a,
      col_pct = b,
      rows = c(1, 4)
    ) |>
    fmt_percent(columns = b, decimals = 1)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_2)
})

test_that("check cols_merge is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply merge to table and group
  merged_gt_tbl <-
    gt_tbl |>
    cols_merge(
      columns = c(mpg,cyl),
      pattern = "<<{1} mpg<</{2} cyl>>>>"
    )

  merged_gt_group <-
    gt_group |>
    cols_merge(
      columns = c(mpg,cyl),
      pattern = "<<{1} mpg<</{2} cyl>>>>"
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(merged_gt_group, gt_group(merged_gt_tbl, merged_gt_tbl))
})

test_that("check cols_merge_uncert is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply merge to table and group
  merged_gt_tbl <-
    gt_tbl |>
    cols_merge_uncert(
      col_val = wt,
      col_uncert = qsec
    )

  merged_gt_group <-
    gt_group |>
    cols_merge_uncert(
      col_val = wt,
      col_uncert = qsec
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(merged_gt_group, gt_group(merged_gt_tbl, merged_gt_tbl))
})

test_that("check cols_merge_range is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply merge to table and group
  merged_gt_tbl <-
    gt_tbl |>
    cols_merge_range(
      col_begin = wt,
      col_end = qsec
    )

  merged_gt_group <-
    gt_group |>
    cols_merge_range(
      col_begin = wt,
      col_end = qsec
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(merged_gt_group, gt_group(merged_gt_tbl, merged_gt_tbl))
})

test_that("check cols_merge_n_pct is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply merge to table and group
  merged_gt_tbl <-
    gt_tbl |>
    cols_merge_n_pct(
      col_n = wt,
      col_pct = qsec
    )

  merged_gt_group <-
    gt_group |>
    cols_merge_n_pct(
      col_n = wt,
      col_pct = qsec
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(merged_gt_group, gt_group(merged_gt_tbl, merged_gt_tbl))
})
