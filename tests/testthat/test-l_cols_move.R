# Create a shortened version of `mtcars`
mtcars_short <- mtcars[1:5, ]

test_that("The `cols_move()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat`
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move(columns = c(mpg, cyl, disp), after = drat)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat` using vectors
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move(columns = c("mpg", "cyl", "disp"), after = c("drat"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `carb` (the end of the series)
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move(columns = c(mpg, cyl, disp), after = carb)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*hp & drat & wt & qsec & vs & am & gear & carb & mpg & cyl & disp.*"
  )
})

test_that("The `cols_move_to_start()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move_to_start(columns = c(gear, carb))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move_to_start(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"
    )
})

test_that("The `cols_move_to_end()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move_to_end(columns = c(gear, carb))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end using vectors
  tbl_latex <-
    gt(mtcars_short) %>%
    cols_move_to_end(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"
  )
})
