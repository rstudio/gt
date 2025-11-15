test_that("cols_add() works", {

  tbl <- gt(exibble)

  expect_no_error(
    dat <- cols_add(tbl, x = 1, .before = 1)
  )

  expect_equal(dat$`_boxhead`$var[1], "x")

  expect_no_error(
    dat <- cols_add(tbl, x = 1, .before = 2)
  )

  expect_equal(dat$`_boxhead`$var[2], "x")

  expect_no_error(
    dat <- cols_add(tbl, x = 1, .after = 1)
  )

  expect_equal(dat$`_boxhead`$var[2], "x")

  expect_no_error(
    dat <- cols_add(tbl, x = 1, .after = dplyr::last_col())
  )
})

test_that("cols_add() errors with bad input", {

  tbl <- gt(exibble)

  expect_snapshot(
    error = TRUE, {
      cols_add(tbl, x = 1, .after = 2, .before = 3)
      cols_add(tbl, x = 1, .after = 15)
      cols_add(tbl, x = 1, .before = c(1, 2))
      cols_add(tbl, x = 1, .after = c(1, 2))
    }
  )
})

test_that("cols_add() handles empty data frames", {

  expect_equal_gt(
    gt(data.frame()) |> cols_add(x = 1),
    gt(data.frame(x = 1))
  )

  expect_no_error(gt(data.frame()) |> cols_add())

  expect_no_error(
    tab <- gt(data.frame(x = character(0), y = character(0))) |> cols_add(z = character(0))
    )

  expect_named(tab$`_data`, c("x", "y", "z"))
})

test_that("check cols_add is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply cols_add to table and group
  add_gt_tbl <-
    gt_tbl |>
    cols_add(num = 1:5, char = rep("x",5))

  add_gt_group <-
    gt_group |>
    cols_add(num = 1:5, char = rep("x",5))

  # Expect identical if function applied before or after group is constructed
  expect_identical(add_gt_group, gt_group(add_gt_tbl, add_gt_tbl))
})
