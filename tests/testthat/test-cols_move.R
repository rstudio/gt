# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_move() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat`
  tbl_html <-
    gt(mtcars_short) |>
    cols_move(columns = c(mpg, cyl, disp), after = drat)

  # Expect a particular ordering of columns in `_boxh`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "hp", "drat", "mpg", "cyl", "disp", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "hp", "drat", "mpg", "cyl", "disp", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `drat` using vectors
  tbl_html <-
    gt(mtcars_short) |>
    cols_move(columns = c("mpg", "cyl", "disp"), after = c("drat"))

  # Expect a particular ordering of columns in `_boxh`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "hp", "drat", "mpg", "cyl", "disp", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "hp", "drat", "mpg", "cyl", "disp", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns placed after `carb` (the end of the series)
  tbl_html <-
    gt(mtcars_short) |>
    cols_move(columns = c(mpg, cyl, disp), after = carb)

  # Expect a particular ordering of columns in the internal `boxh_df`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "hp", "drat", "wt", "qsec", "vs", "am",
      "gear", "carb", "mpg", "cyl", "disp"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "hp", "drat", "wt", "qsec", "vs", "am",
      "gear", "carb", "mpg", "cyl", "disp"
    )
  )

  # Expect an error if more than one column provided in `after`
  expect_error(
    gt(mtcars_short) |>
      cols_move(columns = c(mpg, cyl, disp), after = c(am, wt))
  )

  # Expect an error if the column provided in `after` doesn't exist
  expect_error(
    gt(mtcars_short) |>
      cols_move(columns = c(mpg, cyl, disp), after = wts)
  )

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(mtcars_short) |>
      cols_move(columns = c(mpg, cyls, disp), after = wt)
  )
})

test_that("cols_move_to_start() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start
  tbl_html <-
    gt(mtcars_short) |>
    cols_move_to_start(columns = c(gear, carb))

  # Expect a particular ordering of columns in the internal `boxh_df`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "gear", "carb", "mpg", "cyl", "disp", "hp",
      "drat", "wt", "qsec", "vs", "am"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "gear", "carb", "mpg", "cyl", "disp", "hp",
      "drat", "wt", "qsec", "vs", "am"
    )
  )

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_html <-
    gt(mtcars_short) |>
    cols_move_to_start(columns = c("gear", "carb"))

  # Expect a particular ordering of columns in the internal `boxh_df`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "gear", "carb", "mpg", "cyl", "disp", "hp",
      "drat", "wt", "qsec", "vs", "am"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "gear", "carb", "mpg", "cyl", "disp", "hp",
      "drat", "wt", "qsec", "vs", "am"
    )
  )

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(mtcars_short) |>
      cols_move_to_start(columns = c(mpg, cyls, disp))
  )
})

test_that("cols_move_to_end() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the end
  tbl_html <-
    gt(mtcars_short) |>
    cols_move_to_end(columns = c(gear, carb))

  # Expect a particular ordering of columns in the internal `boxh_df`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "mpg", "cyl", "disp", "hp", "drat", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c(
      "mpg", "cyl", "disp", "hp", "drat", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Create a `tbl_html` object with `gt()`; the `gear`,
  # and `carb` columns placed at the start using vectors
  tbl_html <-
    gt(mtcars_short) |>
    cols_move_to_end(columns = c("gear", "carb"))

  # Expect a particular ordering of columns in the internal `boxh_df`
  expect_equal(
    tbl_html |>
      dt_boxhead_get_vars(),
    c(
      "mpg", "cyl", "disp", "hp", "drat", "wt",
      "qsec", "vs", "am", "gear", "carb"
    )
  )

  # Expect that the columns have the same ordering in
  # the rendered table
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
    rvest::html_text() |>
    expect_equal(
      c(
        "mpg", "cyl", "disp", "hp", "drat", "wt",
        "qsec", "vs", "am", "gear", "carb"
      )
    )

  # Expect an error if any of the `columns` doesn't exist in `data_df`
  expect_error(
    gt(mtcars_short) |>
      cols_move_to_end(columns = c(mpg, cyls, disp))
  )
})

test_that("check cols_move is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply move to table and group
  move_gt_tbl <-
    gt_tbl |>
    cols_move(columns = mpg, after = cyl)

  move_gt_group <-
    gt_group |>
    cols_move(columns = mpg, after = cyl)

  # Expect identical if function applied before or after group is constructed
  expect_identical(move_gt_group, gt_group(move_gt_tbl, move_gt_tbl))
})

test_that("check cols_move_to_start is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply move to table and group
  move_gt_tbl <-
    gt_tbl |>
    cols_move_to_start(columns = gear)

  move_gt_group <-
    gt_group |>
    cols_move_to_start(columns = gear)

  # Expect identical if function applied before or after group is constructed
  expect_identical(move_gt_group, gt_group(move_gt_tbl, move_gt_tbl))
})

test_that("check cols_move_to_end is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply move to table and group
  move_gt_tbl <-
    gt_tbl |>
    cols_move_to_end(columns = gear)

  move_gt_group <-
    gt_group |>
    cols_move_to_end(columns = gear)

  # Expect identical if function applied before or after group is constructed
  expect_identical(move_gt_group, gt_group(move_gt_tbl, move_gt_tbl))
})
