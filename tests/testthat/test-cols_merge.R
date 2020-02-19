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
      hide_columns = vars(wt),
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
  # with a `pattern` and use the `vars()` helper
  tbl_html <-
    mtcars_short %>%
    gt() %>%
    cols_merge(
      columns = vars(drat, wt),
      hide_columns = vars(wt),
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
  # with two different `pattern`s; use the `vars()` helper
  tbl_html <-
    mtcars_short %>%
    gt() %>%
    cols_merge(
      columns = vars(drat, wt),
      hide_columns = vars(wt),
      pattern = "{1} ({2})"
    ) %>%
    cols_merge(
      columns = vars(gear, carb),
      hide_columns = vars(carb),
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
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns
  # with `cols_merge_uncert()` and use the `vars()` helper
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = vars(col_1),
      col_uncert = vars(col_2)
    )

  # Expect that merging statements are stored in `col_merge`
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two columns, twice,
  # with `cols_merge_uncert()` and use the `vars()` helper
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = vars(col_1),
      col_uncert = vars(col_2)
    ) %>%
    cols_merge_uncert(
      col_val = vars(col_3),
      col_uncert = vars(col_4)
    )

  # Expect that merging statements are stored in `col_merge`\
  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$vars %>%
    expect_equal(c("col_1", "col_2"))

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[1]] %>% .$sep %>%
    expect_equal(" +/- ")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$pattern %>%
    expect_equal("{1}{sep}{2}")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$vars %>%
    expect_equal(c("col_3", "col_4"))

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$type %>%
    expect_equal("merge_range")

  dt_col_merge_get(data = tbl_html) %>% .[[2]] %>% .$sep %>%
    expect_equal(" +/- ")

  # Create a `tbl_html` object with `gt()`; merge two
  # columns with `cols_merge_uncert()` but use the `I()`
  # function to keep the separator text as is
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_uncert(
      col_val = vars(col_1),
      col_uncert = vars(col_2),
      sep = I(" +/- ")
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
  # with `cols_merge_range()` and use the `vars()` helper
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = vars(col_1),
      col_end = vars(col_2)
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
  # with `cols_merge_range()` and use the `vars()` helper
  tbl_html <-
    tbl %>%
    gt() %>%
    cols_merge_range(
      col_begin = vars(col_1),
      col_end = vars(col_2)
    ) %>%
    cols_merge_range(
      col_begin = vars(col_3),
      col_end = vars(col_4)
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
      col_begin = vars(col_1),
      col_end = vars(col_2),
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
      col_begin = vars(col_1),
      col_end = vars(col_2),
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
})
