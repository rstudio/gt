test_that("cols_move() works correctly in LaTeX output tables", {

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat`
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move(columns = c(mpg, cyl, disp), after = drat)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat` using vectors
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move(columns = c("mpg", "cyl", "disp"), after = "drat")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*hp & drat & mpg & cyl & disp & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `carb` (the end of the series)
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move(columns = c(mpg, cyl, disp), after = carb)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*hp & drat & wt & qsec & vs & am & gear & carb & mpg & cyl & disp.*"
  )
})

test_that("cols_move_to_start() works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move_to_start(columns = c(gear, carb))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move_to_start(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*gear & carb & mpg & cyl & disp & hp & drat & wt & qsec & vs & am.*"
    )
})

test_that("cols_move_to_end() works correctly", {

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move_to_end(columns = c(gear, carb))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"
  )

  # Create a `tbl_latex` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end using vectors
  tbl_latex <-
    gt(mtcars_short) |>
    cols_move_to_end(columns = c("gear", "carb"))

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    ".*mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb.*"
  )
})
