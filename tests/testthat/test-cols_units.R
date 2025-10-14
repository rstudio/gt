test_that("cols_units() works with formulas (and is consistent with cols_label())", {

  # Test that you can override some things with everything()
  d <- data.frame(
    col1 = 1,
    col2 = 2
  )

  # tab0 and tab1 will not have the same units as `cols_label()`
  tab0 <- cols_units(gt(d), col2 ~ "aa", everything() ~ "degree")
  tab1 <- cols_units(gt(d), everything() ~ "degree", col2 ~ "aa")

  expect_no_error(render_as_html(tab0))
  expect_no_error(render_as_html(tab1))
  units0 <- dt_boxhead_get(tab0)$column_units
  units1 <- dt_boxhead_get(tab1)$column_units

  # col2 is silently ignored if specified first.
  expect_equal(units0, c("degree", "degree"))

  # col2 specified after, so works
  expect_equal(units1, c("degree", "aa"))
})

test_that("cols_units() errors well with wrong input", {

  # Test that you can override some things with everything()
  d <- data.frame(
    col1 = 1,
    col2 = 2
  )

  # tab0 and tab1 will not have the same units as `cols_label()`
  expect_snapshot(error = TRUE, {
    cols_units(gt(d), col2 ~ 1, everything() ~ "degree")
    cols_units(gt(d), everything() ~ 1, col2 ~ 2)
    cols_units(gt(d), col1 ~ c("x", "y"))
  })
})

test_that("cols_units() works when unit is caught (#1733)", {

  d <- data.frame(
    col1 = 1,
    col2 = 2
  )

  tab <- cols_units(gt(d), everything() ~ "1")

  expect_no_error(render_as_html(tab))
})

test_that("check cols_units is applied to gt_group objects", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply units to table and group
  units_gt_tbl <-
    gt_tbl |>
    cols_units(mpg="miles gallon^-1")

  units_gt_group <-
    gt_group |>
    cols_units(mpg="miles gallon^-1")

  # Expect identical if function applied before or after group is constructed
  expect_identical(units_gt_group, gt_group(units_gt_tbl, units_gt_tbl))
})
