tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,    ~row,       ~group,
    767.6,   928.1,  382.0,  674.5,   "one", "first_five",
    403.3,   461.5,   15.1,  242.8,   "two", "first_five",
    686.4,    54.1,  282.7,   56.3, "three", "first_five",
    662.6,   148.8,  984.6,  928.1,  "four", "first_five",
    198.5,    65.1,  127.4,  219.3,  "five", "first_five",
    132.1,   118.1,   91.2,  874.3,   "six", "2nd_five",
    349.7,   307.1,  566.7,  542.9, "seven", "2nd_five",
    63.7,    504.3,  152.0,  724.5, "eight", "2nd_five",
    105.4,   729.8,  962.4,  336.4,  "nine", "2nd_five",
    924.2,   424.6,  740.8,  104.2,   "ten", "2nd_five"
  )

test_that("Using summary rows works in RTF output tables", {

  #
  # Tests with `grand_summary_rows()`
  #

  gt_tbl <- gt(tbl) |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, rowname_col = "row") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, groupname_col = "group") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  #
  # Tests with `summary_rows()`
  #

  gt_tbl <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_1, col_3),
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_3, col_1, col_4),
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_3, col_1, col_4, col_2),
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)

  gt_tbl <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_1, col_3),
      fns = list(average = ~ mean(., na.rm = TRUE))
    )

  expect_snapshot_rtf(gt_tbl)
})
