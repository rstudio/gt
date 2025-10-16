test_that("A gt table can contain indentation in the stub", {

  # Create a table with a stub that has rownames; indent the first
  # three row labels in the stub at level 1
  tbl_1 <-
    exibble |>
    gt(rowname_col = "row") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_1`
  expect_snapshot_html(tbl_1)
  expect_snapshot_latex(tbl_1)

  # Do much the same as previously but perform the same indentation
  # operation twice, putting the three row labels at level 2
  tbl_2 <-
    exibble |>
    gt(rowname_col = "row") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") |>
    tab_options(latex.use_longtable = TRUE)

  # Perform the equivalent operation a previously, this time using
  # an explicit setting of the level (2)
  tbl_3 <-
    exibble |>
    gt(rowname_col = "row") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = 2) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that `tbl_2` and `tbl_3` are the same
  expect_equal_gt(tbl_2, tbl_3, f = render_as_html)
  expect_equal_gt(tbl_2, tbl_3, f = as_latex)

  # Indent the three row labels by a level and then decrease by
  # the same amount; should be the same as no indentation at all
  tbl_4 <-
    exibble |>
    gt(rowname_col = "row") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = "increase") |>
    tab_stub_indent(rows = c(1, 2, 3), indent = "decrease") |>
    tab_options(latex.use_longtable = TRUE)

  expect_equal_gt(
    tbl_4,
    gt(exibble, rowname_col = "row")
  )

  # Indent using a `matches()` expression; this matches rows
  # 3, 4, and 5
  tbl_5 <-
    exibble |>
    gt(rowname_col = "row") |>
    tab_stub_indent(rows = matches("3|4|5"), indent = 2) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_5`
  expect_snapshot_html(tbl_5)
  expect_snapshot_latex(tbl_5)
})

test_that("Indentation values can be obtained from a table column", {

  # Indent via `from_column()`, using values from the `rank` column
  tbl_6 <-
    exibble |>
    dplyr::select(char, fctr, currency) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency))) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char") |>
    tab_stub_indent(
      rows = everything(),
      indent = from_column(column = "rank")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_6`
  expect_snapshot_html(tbl_6)
  expect_snapshot_latex(tbl_6)

  # This time, create a table that also has row groups; use the same indentation
  tbl_7 <-
    exibble |>
    dplyr::select(char, fctr, currency, group) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency))) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char", groupname_col = "group") |>
    tab_stub_indent(
      rows = everything(),
      indent = from_column(column = "rank")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_7`
  expect_snapshot_html(tbl_7)
  expect_snapshot_latex(tbl_7)

  # This variation of the previous includes an `na_value`
  tbl_8 <-
    exibble |>
    dplyr::select(char, fctr, currency, group) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency))) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char", groupname_col = "group") |>
    tab_stub_indent(
      rows = everything(),
      indent = from_column(column = "rank", na_value = 3)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_8`
  expect_snapshot_html(tbl_8)
  expect_snapshot_latex(tbl_8)

  # This variation of the previous includes a function provided to `fn`
  tbl_9 <-
    exibble |>
    dplyr::select(char, fctr, currency, group) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency))) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char", groupname_col = "group") |>
    tab_stub_indent(
      rows = everything(),
      indent = from_column(
        column = "rank",
        na_value = 3,
        fn = function(x) x + 1
      )
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_9`
  expect_snapshot_html(tbl_9)
  expect_snapshot_latex(tbl_9)

  # This variation only affects rows where `matches("a")` is true for the stub
  tbl_10 <-
    exibble |>
    dplyr::select(char, fctr, currency, group) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency))) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char", groupname_col = "group") |>
    tab_stub_indent(
      rows = matches("a"),
      indent = from_column(column = "rank", na_value = 3)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_10`
  expect_snapshot_html(tbl_10)
  expect_snapshot_latex(tbl_10)

  # This variation uses non-intergerish values for `rank` (values are truncated)
  tbl_11 <-
    exibble |>
    dplyr::select(char, fctr, currency) |>
    dplyr::mutate(rank = dplyr::dense_rank(dplyr::desc(currency)) + 0.7) |>
    dplyr::arrange(rank) |>
    gt(rowname_col = "char") |>
    tab_stub_indent(
      rows = everything(),
      indent = from_column(column = "rank")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Take snapshots of `tbl_11`
  expect_snapshot_html(tbl_11)
  expect_snapshot_latex(tbl_11)
})
