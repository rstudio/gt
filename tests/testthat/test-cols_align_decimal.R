test_that("Decimal alignment works in the basic case", {

  small_tbl <-
    dplyr::tibble(
      char = LETTERS[1:9],
      num = c(1.2, -33.52, 9023.2, -283.527, NA, 0.401, -123.1, NA, 41)
    )

  # Use `cols_align_decimal()` on both columns
  gt_tbl_1 <-
    gt(small_tbl) |>
    fmt_number(
      columns = num,
      decimals = 3,
      drop_trailing_zeros = TRUE
    ) |>
    cols_align_decimal()

  # Use `cols_align_decimal()` on just the `num` column
  gt_tbl_2 <-
    gt(small_tbl) |>
    fmt_number(
      columns = num,
      decimals = 3,
      drop_trailing_zeros = TRUE
    ) |>
    cols_align_decimal(columns = num)

  # Expect that both tables result in the same HTML output
  expect_equal(
    render_as_html(gt_tbl_1),
    render_as_html(gt_tbl_2)
  )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_1)

  # Ensure that trailing decimal marks are aligned;
  # use `cols_align_decimal()` on both columns
  gt_tbl_3 <-
    gt(small_tbl) |>
    fmt_number(
      columns = num,
      decimals = 3,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_3)

  # Use `fmt_percent()` on the `num` column, then align
  # decimal marks
  gt_tbl_4 <-
    gt(small_tbl) |>
    fmt_percent(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_4)

  # Use `fmt_percent()` on the `num` column again, ensuring that
  # trailing decimal marks are not dropped; then align decimal marks
  gt_tbl_5 <-
    gt(small_tbl) |>
    fmt_percent(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_5)

  # Use `fmt_partsper()` on the `num` column, then align
  # decimal marks
  gt_tbl_6 <-
    gt(small_tbl) |>
    fmt_partsper(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_6)

  # Use `fmt_partsper()` on the `num` column again, ensuring that
  # trailing decimal marks are not dropped; then align decimal marks
  gt_tbl_7 <-
    gt(small_tbl) |>
    fmt_partsper(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_7)

  # Use `fmt_partsper()` with `ppm` units; then align decimal marks
  gt_tbl_8 <-
    gt(small_tbl) |>
    fmt_partsper(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE,
      to_units = "ppm"
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_8)

  # Use `fmt_partsper()` with `ppm` units, ensuring that
  # trailing decimal marks are not dropped; then align decimal marks
  gt_tbl_9 <-
    gt(small_tbl) |>
    fmt_partsper(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE,
      to_units = "ppm"
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_9)

  # Use `cols_align_decimal()` on a table based on the exibble
  # dataset; expect that `cols_align_decimal()` has no material affect
  # on all of the columns
  gt_tbl_10 <-
    gt(exibble) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_10)

  # Use `fmt_percent()` and use a non-default `pattern` value;
  # then align decimal marks
  gt_tbl_11 <-
    gt(small_tbl) |>
    fmt_percent(
      columns = num,
      decimals = 3,
      scale_values = FALSE,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE,
      pattern = "abc{x}def"
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_11)

  # Use `fmt_number()` and use the `accounting` option; then align
  # decimal marks
  gt_tbl_12 <-
    gt(small_tbl) |>
    fmt_number(
      columns = num,
      decimals = 3,
      drop_trailing_zeros = TRUE,
      drop_trailing_dec_mark = FALSE,
      accounting = TRUE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_12)

  # Use `fmt_currency()` and use the `accounting` option with no decimals; then align
  # based on implied decimal
  gt_tbl_13 <-
    gt(small_tbl) |>
    fmt_currency(
      columns = num,
      decimals = 0,
      accounting = TRUE
    ) |>
    cols_align_decimal()

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_13)
})


test_that("check cols_align_decimal is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <-
    dplyr::tibble(
      char = LETTERS[1:9],
      num = c(1.2, -33.52, 9023.2, -283.527, NA, 0.401, -123.1, NA, 41)
    ) |>
    gt() |>
    fmt_number(
      columns = num,
      decimals = 3,
      drop_trailing_zeros = TRUE
    )

  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply alignment to table and group
  aligned_gt_tbl <- cols_align_decimal(gt_tbl)

  aligned_gt_group <- cols_align_decimal(gt_group)

  # Expect identical if function applied before or after group is constructed
  expect_identical(aligned_gt_group, gt_group(aligned_gt_tbl, aligned_gt_tbl))
})
