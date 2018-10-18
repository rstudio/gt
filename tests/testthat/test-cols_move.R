context("Ensuring that the `cols_move*()` functions work as expected")

# Create a shortened version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the `cols_move()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat`
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move(columns = vars(mpg, cyl, disp), after = vars(drat))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("hp", "drat", "mpg", "cyl", "disp", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("hp", "drat", "mpg", "cyl", "disp", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat` using vectors
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move(columns = c("mpg", "cyl", "disp"), after = c("drat"))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("hp", "drat", "mpg", "cyl", "disp", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("hp", "drat", "mpg", "cyl", "disp", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `carb` (the end of the series)
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move(columns = vars(mpg, cyl, disp), after = vars(carb))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("hp", "drat", "wt", "qsec", "vs", "am",
        "gear", "carb", "mpg", "cyl", "disp"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("hp", "drat", "wt", "qsec", "vs", "am",
        "gear", "carb", "mpg", "cyl", "disp"))

  # Expect an error if more than one column provided in `after`
  expect_error(
    gt(data = mtcars_short) %>%
      cols_move(columns = vars(mpg, cyl, disp), after = vars(am, wt)))

  # Expect an error if the column provided in `after` doesn't exist
  expect_error(
    gt(data = mtcars_short) %>%
      cols_move(columns = vars(mpg, cyl, disp), after = vars(wts)))

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(data = mtcars_short) %>%
      cols_move(columns = vars(mpg, cyls, disp), after = vars(wt)))
})

test_that("the `cols_move_to_start()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move_to_start(columns = vars(gear, carb))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("gear", "carb", "mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("gear", "carb", "mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am"))

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move_to_start(columns = c("gear", "carb"))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("gear", "carb", "mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("gear", "carb", "mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am"))

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(data = mtcars_short) %>%
      cols_move_to_start(columns = vars(mpg, cyls, disp)))
})

test_that("the `cols_move_to_end()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move_to_end(columns = vars(gear, carb))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_move_to_end(columns = c("gear", "carb"))

  # Expect a particular ordering of columns in the internal `boxh_df`
  attr(tbl_html, "boxh_df", exact = TRUE) %>%
    colnames() %>%
    expect_equal(
      c("mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am", "gear", "carb"))

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(data = mtcars_short) %>%
      cols_move_to_end(columns = vars(mpg, cyls, disp)))
})
