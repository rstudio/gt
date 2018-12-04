context("LaTeX -- Ensuring that the `cols_move*()` functions work as expected")

# Create a shortened version of `mtcars`
mtcars_short <- mtcars[1:5, ]

test_that("the `cols_move()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat`
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move(columns = vars(mpg, cyl, disp), after = vars(drat))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat` using vectors
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move(columns = c("mpg", "cyl", "disp"), after = c("drat"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `carb` (the end of the series)
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move(columns = vars(mpg, cyl, disp), after = vars(carb))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*hp & drat & wt & qsec & vs & am & gear & carb & mpg & cyl & disp.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})

test_that("the `cols_move_to_start()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move_to_start(columns = vars(gear, carb))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move_to_start(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})

test_that("the `cols_move_to_end()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move_to_end(columns = vars(gear, carb))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end using vectors
  tbl_latex <-
    gt(data = mtcars_short) %>%
    cols_move_to_end(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})
