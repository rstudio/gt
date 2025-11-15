tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,    ~row,       ~group,
    767.6,  928.1,  382.0,  674.5,   "one", "first_five",
    403.3,  461.5,   15.1,  242.8,   "two", "first_five",
    686.4,   54.1,  282.7,   56.3, "three", "first_five",
    662.6,  148.8,  984.6,  928.1,  "four", "first_five",
    198.5,   65.1,  127.4,  219.3,  "five", "first_five",
    132.1,  118.1,   91.2,  874.3,   "six",   "2nd_five",
    349.7,  307.1,  566.7,  542.9, "seven",   "2nd_five",
    63.7,  504.3,  152.0,  724.5, "eight",   "2nd_five",
    105.4,  729.8,  962.4,  336.4,  "nine",   "2nd_five",
    924.2,  424.6,  740.8,  104.2,   "ten",   "2nd_five"
  )

test_that("Using summary rows in LaTeX tables is correct", {

  #
  # Tests with `grand_summary_rows()`
  #

  gt_tbl_1 <- gt(tbl) |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  expect_snapshot_latex(gt_tbl_1)

  gt_tbl_2 <- gt(tbl, rowname_col = "row") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_2)

  gt_tbl_3 <- gt(tbl, groupname_col = "group") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_3)

  gt_tbl_4 <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    grand_summary_rows(
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_4)

  #
  # Tests with `summary_rows()`
  #

  gt_tbl_5 <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_5)

  gt_tbl_6 <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_6)

  gt_tbl_7 <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_1, col_3),
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_7)

  gt_tbl_8 <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_3, col_1, col_4),
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_8)

  gt_tbl_9 <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_3, col_1, col_4, col_2),
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_9)

  gt_tbl_10 <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = c(col_1, col_3),
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_10)

  #
  # Tests with both `summary_rows()` and `grand_summary_rows()`
  #

  gt_tbl_11 <- gt(tbl, groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "first_five",
      columns = col_2,
      fns = list(min = ~ min(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "first_five",
      columns = col_4,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "2nd_five",
      columns = col_4,
      fns = list(max = ~ max(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = everything(),
      columns = col_3,
      fns = list(count = ~ length(.)),
      fmt = list(~ fmt_number(., decimals = 0))
    ) |>
    grand_summary_rows(
      columns = starts_with("col"),
      fns = list(
        MEAN = ~ mean(., na.rm = TRUE),
        MIN = ~ min(., na.rm = TRUE),
        MAX = ~ max(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)

  expect_snapshot_latex(gt_tbl_11)
  gt_tbl_12 <- gt(tbl, rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "first_five",
      columns = col_1,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "first_five",
      columns = col_2,
      fns = list(min = ~ min(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "first_five",
      columns = col_4,
      fns = list(average = ~ mean(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = "2nd_five",
      columns = col_4,
      fns = list(max = ~ max(., na.rm = TRUE)),
      fmt = list(~ fmt_number(.))
    ) |>
    summary_rows(
      groups = everything(),
      columns = col_3,
      fns = list(count = ~ length(.)),
      fmt = list(~ fmt_number(., decimals = 0))
    ) |>
    grand_summary_rows(
      columns = starts_with("col"),
      fns = list(
        MEAN = ~ mean(., na.rm = TRUE),
        MIN = ~ min(., na.rm = TRUE),
        MAX = ~ max(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_12)
})
