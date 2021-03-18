context("Ensuring that the `cols_merge*()` functions work as expected")

# Create a shortened version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Create a table with rownames and four columns of values
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

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the function `cols_merge()` works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with a `pattern`
  tbl_html <-
    mtcars_short %>%
    gt() %>%
    cols_merge(
      columns = c("drat", "wt"),
      hide_columns = wt,
      pattern = "{1} ({2})"
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1} ({2})")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("drat", "wt"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with a `pattern` and use `c()`
  tbl_html <-
    mtcars_short %>%
    gt() %>%
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1} ({2})")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("drat", "wt"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with two different `pattern`s; use `c()`
  tbl_html <-
    mtcars_short %>%
    gt() %>%
    cols_merge(
      columns = c(drat, wt),
      hide_columns = wt,
      pattern = "{1} ({2})"
    ) %>%
    cols_merge(
      columns = c(gear, carb),
      hide_columns = carb,
      pattern = "{1}-{2}"
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1} ({2})")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("drat", "wt"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$pattern %>%
    expect_equal("{1}-{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$vars %>%
    expect_equal(c("gear", "carb"))

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$type %>%
    expect_equal("merge")

  # Expect a warning if additional, out of scope columns, are
  # included in `hide_columns`
  expect_warning(
    mtcars_short %>%
      gt() %>%
      cols_merge(
        columns = c(drat, wt),
        hide_columns = c(wt, carb),
      )
  )
})

test_that("the `cols_merge_uncert()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = "col_1",
      col_uncert = "col_2"
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_uncert")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()` and use `c()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_uncert")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with `cols_merge_uncert()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2
    ) %>%
    cols_merge_uncert(
      col_val = col_3,
      col_uncert = col_4
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_uncert")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$vars %>%
    expect_equal(c("col_3", "col_4"))

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$type %>%
    expect_equal("merge_uncert")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_uncert()` but use the `I()`
  # function to keep the separator text as is
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = col_1,
      col_uncert = col_2,
      sep = I(" +/- ")
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_uncert")

  # Get the separator object
  sep <- dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep

  # Expect that `sep` has the `AsIs` class
  expect_is(sep, "AsIs")
  expect_equal(as.character(sep), " +/- ")
  expect_equal(sep, I(" +/- "))
})

test_that("the `cols_merge_range()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = "col_1",
      col_end = "col_2"
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal("--")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_range()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal("--")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with `cols_merge_range()`
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    ) %>%
    cols_merge_range(
      col_begin = col_3,
      col_end = col_4
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal("--")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$vars %>%
    expect_equal(c("col_3", "col_4"))

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$sep %>%
    expect_equal("--")

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_range()` but use the `I()`
  # function to keep the `--` separator text as is
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2,
      sep = I("--")
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  # Get the separator object
  sep <- dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep

  # Expect that `sep` has the `AsIs` class
  expect_is(sep, "AsIs")
  expect_equal(as.character(sep), "--")
  expect_equal(sep, I("--"))

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_range()` but use the `I()`
  # function to keep the `---` separator text as is
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2,
      sep = I("---")
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  # Get the separator object
  sep <- dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep

  # Expect that `sep` has the `AsIs` class
  expect_is(sep, "AsIs")
  expect_equal(as.character(sep), "---")
  expect_equal(sep, I("---"))

  # Create two gt table objects; the first will be based
  # on `tbl` while the second will use a different column name
  # in `tbl` (`sep`) that collides with a pattern element name
  tbl_html_1 <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = col_2
    )

  tbl_html_2 <-
    tbl %>%
    dplyr::rename(sep = col_2) %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = sep
    )

  # Expect that the HTML produced from the two tables is the same
  expect_identical(
    tbl_html_1 %>% as_raw_html(),
    tbl_html_2 %>% as_raw_html()
  )

  # Create another variant that renames `col_2` as `1`, which
  # might be thought to interfere with the default pattern
  tbl_html_3 <-
    tbl %>%
    dplyr::rename(`1` = col_2) %>%
    gt() %>%
    cols_merge_range(
      col_begin = col_1,
      col_end = `1`
    )

  # Expect that the HTML produced from `tbl_html_2` and
  # `tbl_html_3` is the same
  expect_identical(
    tbl_html_2 %>% as_raw_html(),
    tbl_html_3 %>% as_raw_html()
  )
})


test_that("the `cols_merge_n_pct()` function works correctly", {

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
    tbl_n_pct %>%
    gt() %>%
    cols_merge_n_pct(col_n = a, col_pct = b) %>%
    fmt_percent(columns = b, decimals = 1)

  # # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("a", "b"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_n_pct")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal("")

  expect_equal(
    (tbl_html %>% render_formats_test("html"))[["a"]],
    c(
      "1 (7.1&percnt;)", "5 (35.7&percnt;)", "0", "2 (14.3&percnt;)",
      "NA", "6 (42.9&percnt;)", "5", "NA", "0", "NA"
    )
  )

  expect_equal(
    (tbl_html %>% render_formats_test("html"))[["b"]],
    c(
      "7.1&percnt;", "35.7&percnt;", "0.0&percnt;", "14.3&percnt;",
      "NA", "42.9&percnt;", "NA", "100,000.0&percnt;", "NA",
      "0.0&percnt;"
    )
  )
})
