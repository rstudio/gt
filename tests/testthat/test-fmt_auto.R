test_that("fmt_auto() works correctly", {

  tbl <-
    dplyr::tibble(
      integer = c(100L, 8000L, 4136323L, 345363363L),
      amt.usd = c(23.23, 632.322, 236.34, 12),
      sold_EUR = c(3465.2, 8743.3, 367.02, 23.74),
      real = c(23.45, 0.23, 0.000001, 2332453.2),
      real_small = c(23.45, 352.4, 0.013, 263.8)
    )

  tbl_big_small <-
    dplyr::tibble(
      int = as.integer(10^(1:9)),
      int_like = 10^(1:9),
      real = 10^(1:9) + 0.5
    )

  sp500_tbl <-
    sp500 |>
    dplyr::filter(date >= "2015-01-05", date <= "2015-01-16") |>
    dplyr::arrange(date) |>
    dplyr::mutate(week = paste0("W", strftime(date, format = "%V")))

  tbl_v_large <- dplyr::tibble(num = 10^(1:18))

  # Use `fmt_auto()` on a table having a variety of column types
  gt_tbl_1 <-
    gt(tbl) |>
    fmt_auto()

  # Take a snapshot of `gt_tbl_1`
  expect_snapshot_html(gt_tbl_1)

  # Use `fmt_auto()` on a table having a variety of column types and
  # prefer to use large-number suffixing
  gt_tbl_2 <-
    gt(tbl) |>
    fmt_auto(lg_num_pref = "suf")

  # Take a snapshot of `gt_tbl_2`
  expect_snapshot_html(gt_tbl_2)

  # Use `fmt_auto()` on a table having very small and very large values
  gt_tbl_3 <-
    gt(tbl_big_small) |>
    fmt_auto()

  # Take a snapshot of `gt_tbl_3`
  expect_snapshot_html(gt_tbl_3)

  # Use `fmt_auto()` on a table having very small and very large values
  # and prefer to use large-number suffixing
  gt_tbl_4 <-
    gt(tbl_big_small) |>
    fmt_auto(lg_num_pref = "suf")

  # Take a snapshot of `gt_tbl_4`
  expect_snapshot_html(gt_tbl_4)

  # Use `fmt_auto()` on a table having row groups and row labels
  gt_tbl_5 <-
    gt(sp500_tbl, rowname_col = "date", groupname_col = "week") |>
    fmt_auto()

  # Take a snapshot of `gt_tbl_5`
  expect_snapshot_html(gt_tbl_5)

  # Use `fmt_auto()` on a table having row groups and row labels
  # and prefer to use large-number suffixing
  gt_tbl_6 <-
    gt(sp500_tbl, rowname_col = "date", groupname_col = "week") |>
    fmt_auto(lg_num_pref = "suf")

  # Take a snapshot of `gt_tbl_6`
  expect_snapshot_html(gt_tbl_6)

  # Use `fmt_auto()` on a table having extremely large numbers
  gt_tbl_7 <-
    gt(tbl_v_large) |>
    fmt_auto()

  # Take a snapshot of `gt_tbl_7`
  expect_snapshot_html(gt_tbl_7)

  # Use `fmt_auto()` on a table having extremely large numbers
  # and prefer to use large-number suffixing
  gt_tbl_8 <-
    gt(tbl_v_large) |>
    fmt_auto(lg_num_pref = "suf")

  # Take a snapshot of `gt_tbl_8`
  expect_snapshot_html(gt_tbl_8)

  # Ensure that `fmt_auto()` can target specific columns
  gt_tbl_9 <-
    gt(tbl) |>
    fmt_auto(columns = c(integer, amt.usd))

  # Take a snapshot of `gt_tbl_9`
  expect_snapshot_html(gt_tbl_9)

  # Ensure that `fmt_auto()` can target specific rows
  gt_tbl_10 <-
    gt(tbl_v_large) |>
    fmt_auto(rows = c(2, 4, 6, 8), lg_num_pref = "suf")

  # Take a snapshot of `gt_tbl_10`
  expect_snapshot_html(gt_tbl_10)
})
