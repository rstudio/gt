test_that("cols_hide() and cols_unhide() do not error when no columns selected", {

  # when no columns selected, gt table return unaltered
  expect_no_error(gt(exibble) |> cols_hide())

  expect_equal(
    gt(sp500),
    gt(sp500) |> cols_hide(columns = starts_with("xxxxxxxxxxxx"))
  )

  expect_equal(
    gt(exibble),
    gt(exibble) |> cols_unhide(columns = starts_with("xxxxxxxxxxxx"))
  )
  expect_snapshot(
    error = TRUE,
    gt(exibble) |> cols_hide(problem)
  )
})

test_that("check cols_hide/unhide is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply hide to table and group
  hide_gt_tbl <-
    gt_tbl |>
    cols_hide(columns = c(mpg, cyl, drat))

  hide_gt_group <-
    gt_group |>
    cols_hide(columns = c(mpg, cyl, drat))

  # Expect identical if function applied before or after group is constructed
  expect_identical(hide_gt_group, gt_group(hide_gt_tbl, hide_gt_tbl))

  unhide_gt_tbl <-
    hide_gt_tbl |>
    cols_unhide(columns = drat)

  unhide_gt_group <-
    hide_gt_group |>
    cols_unhide(columns = drat)

  expect_identical(unhide_gt_group, gt_group(unhide_gt_tbl, unhide_gt_tbl))
})
