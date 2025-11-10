test_that("cols_align() works correctly for LaTeX output tables", {

  # Create a `tbl_latex` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns are aligned left
  tbl_latex <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = c(mpg, cyl, drat)) |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern
  expect_length(tbl_latex, 1)
  expect_match(tbl_latex, ".*begin\\{longtable\\}\\{llrrlrrrrrr\\}.*")

  # Create a `tbl_latex` object with `gt()`; columns `1` (`mpg`),
  # `2` (`cyl`), and `3` (`disp`) are aligned right
  tbl_latex <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = 1:3) |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern
  expect_length(tbl_latex, 1)
  expect_match(tbl_latex, ".*begin\\{longtable\\}\\{lllrrrrrrrr\\}.*")

  # Create a `tbl_latex` object with `gt()`; align all
  # columns to the left
  tbl_latex <-
    gt(mtcars_short) |>
    cols_align(align = "left") |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern
  expect_length(tbl_latex, 1)
  expect_match(tbl_latex, ".*begin\\{longtable\\}\\{lllllllllll\\}.*")

  # Create a `tbl_latex` object with `gt()`; align all
  # columns (using `columns = everything()`) to the left
  tbl_latex <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = everything()) |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern
  expect_length(tbl_latex, 1)
  expect_match(tbl_latex, ".*begin\\{longtable\\}\\{lllllllllll\\}.*")
  # Create a data frame based on the internal `sp500.csv`
  sp500 <-
    read.csv(
      system.file("extdata", "sp500.csv", package = "gt"),
      stringsAsFactors = FALSE)

  # Create a `tbl_latex` object with the `sp500` data
  # frame and `auto`-align all columns
  tbl_latex <-
    gt(sp500) |>
    cols_align(align = "auto") |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern
  expect_length(tbl_latex, 1)
  expect_match(tbl_latex, ".*begin\\{longtable\\}\\{rrrrrr\\}.*")
})
