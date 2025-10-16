test_that("rows can be added to a table with name-value pairs", {

  gt_tbl_a <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group")

  # Get the internal data table and the `stub_df` tbl
  tbl_a_data <- dt_data_get(data = gt_tbl_a)
  tbl_a_stub <- dt_stub_df_get(data = gt_tbl_a)

  # Perform checks of both internal table objects
  expect_identical(tbl_a_data, exibble)
  expect_equal(tbl_a_stub$rownum_i, 1:8)
  expect_equal(tbl_a_stub$row_id, paste0("row_", 1:8))
  expect_equal(tbl_a_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4)))

  # Add a single row, using two values
  gt_tbl_a_01 <-
    gt_tbl_a |>
    rows_add(
      num = 5.79,
      currency = 25.3
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_01_data <- dt_data_get(data = gt_tbl_a_01)
  tbl_a_01_stub <- dt_stub_df_get(data = gt_tbl_a_01)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_01_data), 9)
  expect_equal(tbl_a_01_stub$rownum_i, 1:9)
  expect_equal(tbl_a_01_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_a_01_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_01)

  # Add a single row, this time with more values
  gt_tbl_a_02 <-
    gt_tbl_a |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_02_data <- dt_data_get(data = gt_tbl_a_02)
  tbl_a_02_stub <- dt_stub_df_get(data = gt_tbl_a_02)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_02_data), 9)
  expect_equal(tbl_a_02_stub$rownum_i, 1:9)
  expect_equal(tbl_a_02_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_a_02_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_02)

  # Add three rows, include repeating values
  gt_tbl_a_03 <-
    gt_tbl_a |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = c("nine", "ten", "eleven"),
      date = "2015-09-15",
      time = c("21:30", "22:30", "00:30"),
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_03_data <- dt_data_get(data = gt_tbl_a_03)
  tbl_a_03_stub <- dt_stub_df_get(data = gt_tbl_a_03)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_03_data), 11)
  expect_equal(tbl_a_03_stub$rownum_i, 1:11)
  expect_equal(tbl_a_03_stub$row_id, c(paste0("row_", 1:8), rep(NA, 3)))
  expect_equal(tbl_a_03_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), rep(NA, 3)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_03)

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_a_04 <-
    gt_tbl_a |>
    rows_add(
      row = "row_9",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_04_data <- dt_data_get(data = gt_tbl_a_04)
  tbl_a_04_stub <- dt_stub_df_get(data = gt_tbl_a_04)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_04_data), 9)
  expect_equal(tbl_a_04_stub$rownum_i, 1:9)
  expect_equal(tbl_a_04_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_a_04_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_04)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_a_05 <-
    gt_tbl_a |>
    rows_add(
      row = "row_9",
      group = "grp_b",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_05_data <- dt_data_get(data = gt_tbl_a_05)
  tbl_a_05_stub <- dt_stub_df_get(data = gt_tbl_a_05)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_05_data), 9)
  expect_equal(tbl_a_05_stub$rownum_i, 1:9)
  expect_equal(tbl_a_05_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_a_05_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 5)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_05)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_a_06 <-
    gt_tbl_a |>
    rows_add(
      row = "row_9",
      group = "grp_c",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_06_data <- dt_data_get(data = gt_tbl_a_06)
  tbl_a_06_stub <- dt_stub_df_get(data = gt_tbl_a_06)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_06_data), 9)
  expect_equal(tbl_a_06_stub$rownum_i, 1:9)
  expect_equal(tbl_a_06_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_a_06_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_c"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_06)

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_a_07 <-
    gt_tbl_a |>
    rows_add(
      row = c("row_4.5", "row_8.5"),
      group = c("grp_a", "grp_b"),
      num = c(5.79, 2.72),
      currency = c(25.3, 62.1),
      char = c("elderberry", "ilama"),
      fctr = c("vier", "acht"),
      date = c("2015-09-15", "2015-11-23"),
      time = c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_07_data <- dt_data_get(data = gt_tbl_a_07)
  tbl_a_07_stub <- dt_stub_df_get(data = gt_tbl_a_07)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_07_data), 10)
  expect_equal(tbl_a_07_stub$rownum_i, 1:10)
  expect_equal(tbl_a_07_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_a_07_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_07)

  # Add two empty rows
  gt_tbl_a_08 <-
    gt_tbl_a |>
    rows_add(.n_empty = 2)

  # Get the internal data table and the `stub_df` tbl
  tbl_a_08_data <- dt_data_get(data = gt_tbl_a_08)
  tbl_a_08_stub <- dt_stub_df_get(data = gt_tbl_a_08)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_08_data), 10)
  expect_equal(tbl_a_08_stub$rownum_i, 1:10)
  expect_equal(tbl_a_08_stub$row_id, c(paste0("row_", 1:8), rep(NA, 2)))
  expect_equal(tbl_a_08_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), rep(NA, 2)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_08)

  # Add no rows by supplying nothing to `rows_add()`
  gt_tbl_a_09 <-
    gt_tbl_a |>
    rows_add()

  # Get the internal data table and the `stub_df` tbl
  tbl_a_09_data <- dt_data_get(data = gt_tbl_a_09)
  tbl_a_09_stub <- dt_stub_df_get(data = gt_tbl_a_09)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_09_data), 8)
  expect_identical(tbl_a_09_data, exibble)
  expect_identical(tbl_a_09_data, tbl_a_data)
  expect_equal(tbl_a_09_stub, tbl_a_stub)
  expect_equal(tbl_a_09_stub$rownum_i, 1:8)
  expect_equal(tbl_a_09_stub$row_id, paste0("row_", 1:8))
  expect_equal(tbl_a_09_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_09)

  # Add no rows by supplying `0` to `.n_empty`
  gt_tbl_a_10 <-
    gt_tbl_a |>
    rows_add(.n_empty = 0)

  # Get the internal data table and the `stub_df` tbl
  tbl_a_10_data <- dt_data_get(data = gt_tbl_a_10)
  tbl_a_10_stub <- dt_stub_df_get(data = gt_tbl_a_10)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_10_data), 8)
  expect_identical(tbl_a_10_data, exibble)
  expect_identical(tbl_a_10_data, tbl_a_data)
  expect_identical(tbl_a_10_data, tbl_a_09_data)
  expect_equal(tbl_a_10_stub, tbl_a_stub)
  expect_equal(tbl_a_10_stub, tbl_a_09_stub)
  expect_equal(tbl_a_10_stub$rownum_i, 1:8)
  expect_equal(tbl_a_10_stub$row_id, paste0("row_", 1:8))
  expect_equal(tbl_a_10_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_10)

  # Add two empty rows with `.n_empty` while attempting to add
  # rows with name-value pairs (which have no effect)
  gt_tbl_a_11 <-
    gt_tbl_a |>
    rows_add(
      row = c("row_4.5", "row_8.5"),
      group = c("grp_a", "grp_b"),
      num = c(5.79, 2.72),
      currency = c(25.3, 62.1),
      char = c("elderberry", "ilama"),
      fctr = c("vier", "acht"),
      date = c("2015-09-15", "2015-11-23"),
      time = c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA),
      .n_empty = 2
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_a_11_data <- dt_data_get(data = gt_tbl_a_11)
  tbl_a_11_stub <- dt_stub_df_get(data = gt_tbl_a_11)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_a_11_data), 10)
  expect_identical(tbl_a_11_data, tbl_a_08_data)
  expect_equal(tbl_a_11_stub$rownum_i, 1:10)
  expect_equal(tbl_a_11_stub$row_id, c(paste0("row_", 1:8), rep(NA, 2)))
  expect_equal(tbl_a_11_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), rep(NA, 2)))
  expect_identical(tbl_a_11_stub, tbl_a_08_stub)

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_a_11)

  gt_tbl_b <-
    exibble |>
    gt(rowname_col = "row")

  # Get the internal data table and the `stub_df` tbl
  tbl_b_data <- dt_data_get(data = gt_tbl_b)
  tbl_b_stub <- dt_stub_df_get(data = gt_tbl_b)

  # Perform checks of both internal table objects
  expect_identical(tbl_b_data, exibble)
  expect_equal(tbl_b_stub$rownum_i, 1:8)
  expect_equal(tbl_b_stub$row_id, paste0("row_", 1:8))
  expect_equal(tbl_b_stub$group_id, rep(NA_character_, 8))

  # Add a single row, using two values
  gt_tbl_b_01 <-
    gt_tbl_b |>
    rows_add(
      num = 5.79,
      currency = 25.3
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_01_data <- dt_data_get(data = gt_tbl_b_01)
  tbl_b_01_stub <- dt_stub_df_get(data = gt_tbl_b_01)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_01_data), 9)
  expect_equal(tbl_b_01_stub$rownum_i, 1:9)
  expect_equal(tbl_b_01_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_b_01_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_01)

  # Add a single row, this time with more values
  gt_tbl_b_02 <-
    gt_tbl_b |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_02_data <- dt_data_get(data = gt_tbl_b_02)
  tbl_b_02_stub <- dt_stub_df_get(data = gt_tbl_b_02)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_02_data), 9)
  expect_equal(tbl_b_02_stub$rownum_i, 1:9)
  expect_equal(tbl_b_02_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_b_02_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_02)

  # Add three rows, include repeating values
  gt_tbl_b_03 <-
    gt_tbl_b |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = c("nine", "ten", "eleven"),
      date = "2015-09-15",
      time = c("21:30", "22:30", "00:30"),
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_03_data <- dt_data_get(data = gt_tbl_b_03)
  tbl_b_03_stub <- dt_stub_df_get(data = gt_tbl_b_03)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_03_data), 11)
  expect_equal(tbl_b_03_stub$rownum_i, 1:11)
  expect_equal(tbl_b_03_stub$row_id, c(paste0("row_", 1:8), rep(NA, 3)))
  expect_equal(tbl_b_03_stub$group_id, rep(NA_character_, 11))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_03)

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_b_04 <-
    gt_tbl_b |>
    rows_add(
      row = "row_9",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_04_data <- dt_data_get(data = gt_tbl_b_04)
  tbl_b_04_stub <- dt_stub_df_get(data = gt_tbl_b_04)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_04_data), 9)
  expect_equal(tbl_b_04_stub$rownum_i, 1:9)
  expect_equal(tbl_b_04_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_b_04_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_04)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_b_05 <-
    gt_tbl_b |>
    rows_add(
      row = "row_9",
      group = "grp_b",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_05_data <- dt_data_get(data = gt_tbl_b_05)
  tbl_b_05_stub <- dt_stub_df_get(data = gt_tbl_b_05)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_05_data), 9)
  expect_equal(tbl_b_05_stub$rownum_i, 1:9)
  expect_equal(tbl_b_05_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_b_05_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_05)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_b_06 <-
    gt_tbl_b |>
    rows_add(
      row = "row_9",
      group = "grp_c",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_06_data <- dt_data_get(data = gt_tbl_b_06)
  tbl_b_06_stub <- dt_stub_df_get(data = gt_tbl_b_06)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_06_data), 9)
  expect_equal(tbl_b_06_stub$rownum_i, 1:9)
  expect_equal(tbl_b_06_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_b_06_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_06)

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_b_07 <-
    gt_tbl_b |>
    rows_add(
      row = c("row_4.5", "row_8.5"),
      group = c("grp_a", "grp_b"),
      num = c(5.79, 2.72),
      currency = c(25.3, 62.1),
      char = c("elderberry", "ilama"),
      fctr = c("vier", "acht"),
      date = c("2015-09-15", "2015-11-23"),
      time = c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_b_07_data <- dt_data_get(data = gt_tbl_b_07)
  tbl_b_07_stub <- dt_stub_df_get(data = gt_tbl_b_07)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_07_data), 10)
  expect_equal(tbl_b_07_stub$rownum_i, 1:10)
  expect_equal(tbl_b_07_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_b_07_stub$group_id, rep(NA_character_, 10))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_07)

  # Add two empty rows
  gt_tbl_b_08 <-
    gt_tbl_b |>
    rows_add(.n_empty = 2)

  # Get the internal data table and the `stub_df` tbl
  tbl_b_08_data <- dt_data_get(data = gt_tbl_b_08)
  tbl_b_08_stub <- dt_stub_df_get(data = gt_tbl_b_08)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_b_08_data), 10)
  expect_equal(tbl_b_08_stub$rownum_i, 1:10)
  expect_equal(tbl_b_08_stub$row_id, c(paste0("row_", 1:8), rep(NA, 2)))
  expect_equal(tbl_b_08_stub$group_id, rep(NA_character_, 10))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_b_08)

  gt_tbl_c <-
    exibble |>
    gt()

  # Get the internal data table and the `stub_df` tbl
  tbl_c_data <- dt_data_get(data = gt_tbl_c)
  tbl_c_stub <- dt_stub_df_get(data = gt_tbl_c)

  # Perform checks of both internal table objects
  expect_identical(tbl_c_data, exibble)
  expect_equal(tbl_c_stub$rownum_i, 1:8)
  expect_equal(tbl_c_stub$row_id, rep(NA_character_, 8))
  expect_equal(tbl_c_stub$group_id, rep(NA_character_, 8))

  # Add a single row, using two values
  gt_tbl_c_01 <-
    gt_tbl_c |>
    rows_add(
      num = 5.79,
      currency = 25.3
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_01_data <- dt_data_get(data = gt_tbl_c_01)
  tbl_c_01_stub <- dt_stub_df_get(data = gt_tbl_c_01)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_01_data), 9)
  expect_equal(tbl_c_01_stub$rownum_i, 1:9)
  expect_equal(tbl_c_01_stub$row_id, rep(NA_character_, 9))
  expect_equal(tbl_c_01_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_01)

  # Add a single row, this time with more values
  gt_tbl_c_02 <-
    gt_tbl_c |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_02_data <- dt_data_get(data = gt_tbl_c_02)
  tbl_c_02_stub <- dt_stub_df_get(data = gt_tbl_c_02)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_02_data), 9)
  expect_equal(tbl_c_02_stub$rownum_i, 1:9)
  expect_equal(tbl_c_02_stub$row_id, rep(NA_character_, 9))
  expect_equal(tbl_c_02_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_02)

  # Add three rows, include repeating values
  gt_tbl_c_03 <-
    gt_tbl_c |>
    rows_add(
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = c("nine", "ten", "eleven"),
      date = "2015-09-15",
      time = c("21:30", "22:30", "00:30"),
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_03_data <- dt_data_get(data = gt_tbl_c_03)
  tbl_c_03_stub <- dt_stub_df_get(data = gt_tbl_c_03)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_03_data), 11)
  expect_equal(tbl_c_03_stub$rownum_i, 1:11)
  expect_equal(tbl_c_03_stub$row_id, rep(NA_character_, 11))
  expect_equal(tbl_c_03_stub$group_id, rep(NA_character_, 11))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_03)

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_c_04 <-
    gt_tbl_c |>
    rows_add(
      row = "row_9",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_04_data <- dt_data_get(data = gt_tbl_c_04)
  tbl_c_04_stub <- dt_stub_df_get(data = gt_tbl_c_04)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_04_data), 9)
  expect_equal(tbl_c_04_stub$rownum_i, 1:9)
  expect_equal(tbl_c_04_stub$row_id, rep(NA_character_, 9))
  expect_equal(tbl_c_04_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_04)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_c_05 <-
    gt_tbl_c |>
    rows_add(
      row = "row_9",
      group = "grp_b",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_05_data <- dt_data_get(data = gt_tbl_c_05)
  tbl_c_05_stub <- dt_stub_df_get(data = gt_tbl_c_05)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_05_data), 9)
  expect_equal(tbl_c_05_stub$rownum_i, 1:9)
  expect_equal(tbl_c_05_stub$row_id, rep(NA_character_, 9))
  expect_equal(tbl_c_05_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_05)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_c_06 <-
    gt_tbl_c |>
    rows_add(
      row = "row_9",
      group = "grp_c",
      num = 5.79,
      currency = 25.3,
      char = "elderberry",
      fctr = "nine",
      date = "2015-09-15",
      time = "21:30",
      datetime = "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_06_data <- dt_data_get(data = gt_tbl_c_06)
  tbl_c_06_stub <- dt_stub_df_get(data = gt_tbl_c_06)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_06_data), 9)
  expect_equal(tbl_c_06_stub$rownum_i, 1:9)
  expect_equal(tbl_c_06_stub$row_id, rep(NA_character_, 9))
  expect_equal(tbl_c_06_stub$group_id, rep(NA_character_, 9))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_06)

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_c_07 <-
    gt_tbl_c |>
    rows_add(
      row = c("row_4.5", "row_8.5"),
      group = c("grp_a", "grp_b"),
      num = c(5.79, 2.72),
      currency = c(25.3, 62.1),
      char = c("elderberry", "ilama"),
      fctr = c("vier", "acht"),
      date = c("2015-09-15", "2015-11-23"),
      time = c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_c_07_data <- dt_data_get(data = gt_tbl_c_07)
  tbl_c_07_stub <- dt_stub_df_get(data = gt_tbl_c_07)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_07_data), 10)
  expect_equal(tbl_c_07_stub$rownum_i, 1:10)
  expect_equal(tbl_c_07_stub$row_id, rep(NA_character_, 10))
  expect_equal(tbl_c_07_stub$group_id, rep(NA_character_, 10))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_07)

  # Add two empty rows
  gt_tbl_c_08 <-
    gt_tbl_c |>
    rows_add(.n_empty = 2)

  # Get the internal data table and the `stub_df` tbl
  tbl_c_08_data <- dt_data_get(data = gt_tbl_c_08)
  tbl_c_08_stub <- dt_stub_df_get(data = gt_tbl_c_08)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_c_08_data), 10)
  expect_equal(tbl_c_08_stub$rownum_i, 1:10)
  expect_equal(tbl_c_08_stub$row_id, rep(NA_character_, 10))
  expect_equal(tbl_c_08_stub$group_id, rep(NA_character_, 10))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_c_08)

  # Expect an error if non-valid values given to `.n_empty`
  expect_error(gt_tbl_c |> rows_add(.n_empty = -1))
  expect_error(gt_tbl_c |> rows_add(.n_empty = 3.2))
  expect_no_error(gt_tbl_c |> rows_add(.n_empty = 3.0))

  gt_tbl_d <-
    exibble |>
    gt()

  gt_tbl_d_add1_b1 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 1)
  expect_snapshot_html(gt_tbl_d_add1_b1)
  gt_tbl_d_add1_b2 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 2)
  expect_snapshot_html(gt_tbl_d_add1_b2)
  gt_tbl_d_add1_b3 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 3)
  expect_snapshot_html(gt_tbl_d_add1_b3)
  gt_tbl_d_add1_b4 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 4)
  expect_snapshot_html(gt_tbl_d_add1_b4)
  gt_tbl_d_add1_b5 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 5)
  expect_snapshot_html(gt_tbl_d_add1_b5)
  gt_tbl_d_add1_b6 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 6)
  expect_snapshot_html(gt_tbl_d_add1_b6)
  gt_tbl_d_add1_b7 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 7)
  expect_snapshot_html(gt_tbl_d_add1_b7)
  gt_tbl_d_add1_b8 <- gt_tbl_d |> rows_add(.n_empty = 1, .before = 8)
  expect_snapshot_html(gt_tbl_d_add1_b8)
  expect_error(gt_tbl_d |> rows_add(.n_empty = 1, .before = 9))

  gt_tbl_d_add1_a1 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 1)
  expect_snapshot_html(gt_tbl_d_add1_a1)
  gt_tbl_d_add1_a2 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 2)
  expect_snapshot_html(gt_tbl_d_add1_a2)
  gt_tbl_d_add1_a3 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 3)
  expect_snapshot_html(gt_tbl_d_add1_a3)
  gt_tbl_d_add1_a4 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 4)
  expect_snapshot_html(gt_tbl_d_add1_a4)
  gt_tbl_d_add1_a5 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 5)
  expect_snapshot_html(gt_tbl_d_add1_a5)
  gt_tbl_d_add1_a6 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 6)
  expect_snapshot_html(gt_tbl_d_add1_a6)
  gt_tbl_d_add1_a7 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 7)
  expect_snapshot_html(gt_tbl_d_add1_a7)
  gt_tbl_d_add1_a8 <- gt_tbl_d |> rows_add(.n_empty = 1, .after = 8)
  expect_snapshot_html(gt_tbl_d_add1_a8)
  expect_error(gt_tbl_d |> rows_add(.n_empty = 1, .after = 9))

  gt_tbl_d_add2_b1 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 1)
  expect_snapshot_html(gt_tbl_d_add2_b1)
  gt_tbl_d_add2_b2 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 2)
  expect_snapshot_html(gt_tbl_d_add2_b2)
  gt_tbl_d_add2_b3 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 3)
  expect_snapshot_html(gt_tbl_d_add2_b3)
  gt_tbl_d_add2_b4 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 4)
  expect_snapshot_html(gt_tbl_d_add2_b4)
  gt_tbl_d_add2_b5 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 5)
  expect_snapshot_html(gt_tbl_d_add2_b5)
  gt_tbl_d_add2_b6 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 6)
  expect_snapshot_html(gt_tbl_d_add2_b6)
  gt_tbl_d_add2_b7 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 7)
  expect_snapshot_html(gt_tbl_d_add2_b7)
  gt_tbl_d_add2_b8 <- gt_tbl_d |> rows_add(.n_empty = 2, .before = 8)
  expect_snapshot_html(gt_tbl_d_add2_b8)
  expect_error(gt_tbl_d |> rows_add(.n_empty = 2, .before = 9))

  gt_tbl_d_add2_a1 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 1)
  expect_snapshot_html(gt_tbl_d_add2_a1)
  gt_tbl_d_add2_a2 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 2)
  expect_snapshot_html(gt_tbl_d_add2_a2)
  gt_tbl_d_add2_a3 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 3)
  expect_snapshot_html(gt_tbl_d_add2_a3)
  gt_tbl_d_add2_a4 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 4)
  expect_snapshot_html(gt_tbl_d_add2_a4)
  gt_tbl_d_add2_a5 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 5)
  expect_snapshot_html(gt_tbl_d_add2_a5)
  gt_tbl_d_add2_a6 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 6)
  expect_snapshot_html(gt_tbl_d_add2_a6)
  gt_tbl_d_add2_a7 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 7)
  expect_snapshot_html(gt_tbl_d_add2_a7)
  gt_tbl_d_add2_a8 <- gt_tbl_d |> rows_add(.n_empty = 2, .after = 8)
  expect_snapshot_html(gt_tbl_d_add2_a8)
  expect_error(gt_tbl_d |> rows_add(.n_empty = 2, .after = 9))

  gt_tbl_e <-
    exibble |>
    gt(rowname_col = "row")

  gt_tbl_e_add1_b1 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 1)
  expect_snapshot_html(gt_tbl_e_add1_b1)
  gt_tbl_e_add1_b2 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 2)
  expect_snapshot_html(gt_tbl_e_add1_b2)
  gt_tbl_e_add1_b3 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 3)
  expect_snapshot_html(gt_tbl_e_add1_b3)
  gt_tbl_e_add1_b4 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 4)
  expect_snapshot_html(gt_tbl_e_add1_b4)
  gt_tbl_e_add1_b5 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 5)
  expect_snapshot_html(gt_tbl_e_add1_b5)
  gt_tbl_e_add1_b6 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 6)
  expect_snapshot_html(gt_tbl_e_add1_b6)
  gt_tbl_e_add1_b7 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 7)
  expect_snapshot_html(gt_tbl_e_add1_b7)
  gt_tbl_e_add1_b8 <- gt_tbl_e |> rows_add(.n_empty = 1, .before = 8)
  expect_snapshot_html(gt_tbl_e_add1_b8)
  expect_error(gt_tbl_e |> rows_add(.n_empty = 1, .before = 9))

  gt_tbl_e_add1_a1 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 1)
  expect_snapshot_html(gt_tbl_e_add1_a1)
  gt_tbl_e_add1_a2 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 2)
  expect_snapshot_html(gt_tbl_e_add1_a2)
  gt_tbl_e_add1_a3 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 3)
  expect_snapshot_html(gt_tbl_e_add1_a3)
  gt_tbl_e_add1_a4 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 4)
  expect_snapshot_html(gt_tbl_e_add1_a4)
  gt_tbl_e_add1_a5 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 5)
  expect_snapshot_html(gt_tbl_e_add1_a5)
  gt_tbl_e_add1_a6 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 6)
  expect_snapshot_html(gt_tbl_e_add1_a6)
  gt_tbl_e_add1_a7 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 7)
  expect_snapshot_html(gt_tbl_e_add1_a7)
  gt_tbl_e_add1_a8 <- gt_tbl_e |> rows_add(.n_empty = 1, .after = 8)
  expect_snapshot_html(gt_tbl_e_add1_a8)
  expect_error(gt_tbl_e |> rows_add(.n_empty = 1, .after = 9))

  gt_tbl_e_add2_b1 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 1)
  expect_snapshot_html(gt_tbl_e_add2_b1)
  gt_tbl_e_add2_b2 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 2)
  expect_snapshot_html(gt_tbl_e_add2_b2)
  gt_tbl_e_add2_b3 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 3)
  expect_snapshot_html(gt_tbl_e_add2_b3)
  gt_tbl_e_add2_b4 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 4)
  expect_snapshot_html(gt_tbl_e_add2_b4)
  gt_tbl_e_add2_b5 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 5)
  expect_snapshot_html(gt_tbl_e_add2_b5)
  gt_tbl_e_add2_b6 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 6)
  expect_snapshot_html(gt_tbl_e_add2_b6)
  gt_tbl_e_add2_b7 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 7)
  expect_snapshot_html(gt_tbl_e_add2_b7)
  gt_tbl_e_add2_b8 <- gt_tbl_e |> rows_add(.n_empty = 2, .before = 8)
  expect_snapshot_html(gt_tbl_e_add2_b8)
  expect_error(gt_tbl_e |> rows_add(.n_empty = 2, .before = 9))

  gt_tbl_e_add2_a1 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 1)
  expect_snapshot_html(gt_tbl_e_add2_a1)
  gt_tbl_e_add2_a2 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 2)
  expect_snapshot_html(gt_tbl_e_add2_a2)
  gt_tbl_e_add2_a3 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 3)
  expect_snapshot_html(gt_tbl_e_add2_a3)
  gt_tbl_e_add2_a4 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 4)
  expect_snapshot_html(gt_tbl_e_add2_a4)
  gt_tbl_e_add2_a5 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 5)
  expect_snapshot_html(gt_tbl_e_add2_a5)
  gt_tbl_e_add2_a6 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 6)
  expect_snapshot_html(gt_tbl_e_add2_a6)
  gt_tbl_e_add2_a7 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 7)
  expect_snapshot_html(gt_tbl_e_add2_a7)
  gt_tbl_e_add2_a8 <- gt_tbl_e |> rows_add(.n_empty = 2, .after = 8)
  expect_snapshot_html(gt_tbl_e_add2_a8)
  expect_error(gt_tbl_e |> rows_add(.n_empty = 2, .after = 9))

  gt_tbl_f <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group")

  gt_tbl_f_add1_b1 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 1)
  expect_snapshot_html(gt_tbl_f_add1_b1)
  gt_tbl_f_add1_b2 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 2)
  expect_snapshot_html(gt_tbl_f_add1_b2)
  gt_tbl_f_add1_b3 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 3)
  expect_snapshot_html(gt_tbl_f_add1_b3)
  gt_tbl_f_add1_b4 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 4)
  expect_snapshot_html(gt_tbl_f_add1_b4)
  gt_tbl_f_add1_b5 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 5)
  expect_snapshot_html(gt_tbl_f_add1_b5)
  gt_tbl_f_add1_b6 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 6)
  expect_snapshot_html(gt_tbl_f_add1_b6)
  gt_tbl_f_add1_b7 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 7)
  expect_snapshot_html(gt_tbl_f_add1_b7)
  gt_tbl_f_add1_b8 <- gt_tbl_f |> rows_add(.n_empty = 1, .before = 8)
  expect_snapshot_html(gt_tbl_f_add1_b8)
  expect_error(gt_tbl_f |> rows_add(.n_empty = 1, .before = 9))

  gt_tbl_f_add1_a1 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 1)
  expect_snapshot_html(gt_tbl_f_add1_a1)
  gt_tbl_f_add1_a2 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 2)
  expect_snapshot_html(gt_tbl_f_add1_a2)
  gt_tbl_f_add1_a3 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 3)
  expect_snapshot_html(gt_tbl_f_add1_a3)
  gt_tbl_f_add1_a4 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 4)
  expect_snapshot_html(gt_tbl_f_add1_a4)
  gt_tbl_f_add1_a5 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 5)
  expect_snapshot_html(gt_tbl_f_add1_a5)
  gt_tbl_f_add1_a6 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 6)
  expect_snapshot_html(gt_tbl_f_add1_a6)
  gt_tbl_f_add1_a7 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 7)
  expect_snapshot_html(gt_tbl_f_add1_a7)
  gt_tbl_f_add1_a8 <- gt_tbl_f |> rows_add(.n_empty = 1, .after = 8)
  expect_snapshot_html(gt_tbl_f_add1_a8)
  expect_error(gt_tbl_f |> rows_add(.n_empty = 1, .after = 9))

  gt_tbl_f_add2_b1 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 1)
  expect_snapshot_html(gt_tbl_f_add2_b1)
  gt_tbl_f_add2_b2 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 2)
  expect_snapshot_html(gt_tbl_f_add2_b2)
  gt_tbl_f_add2_b3 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 3)
  expect_snapshot_html(gt_tbl_f_add2_b3)
  gt_tbl_f_add2_b4 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 4)
  expect_snapshot_html(gt_tbl_f_add2_b4)
  gt_tbl_f_add2_b5 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 5)
  expect_snapshot_html(gt_tbl_f_add2_b5)
  gt_tbl_f_add2_b6 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 6)
  expect_snapshot_html(gt_tbl_f_add2_b6)
  gt_tbl_f_add2_b7 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 7)
  expect_snapshot_html(gt_tbl_f_add2_b7)
  gt_tbl_f_add2_b8 <- gt_tbl_f |> rows_add(.n_empty = 2, .before = 8)
  expect_snapshot_html(gt_tbl_f_add2_b8)
  expect_error(gt_tbl_f |> rows_add(.n_empty = 2, .before = 9))

  gt_tbl_f_add2_a1 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 1)
  expect_snapshot_html(gt_tbl_f_add2_a1)
  gt_tbl_f_add2_a2 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 2)
  expect_snapshot_html(gt_tbl_f_add2_a2)
  gt_tbl_f_add2_a3 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 3)
  expect_snapshot_html(gt_tbl_f_add2_a3)
  gt_tbl_f_add2_a4 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 4)
  expect_snapshot_html(gt_tbl_f_add2_a4)
  gt_tbl_f_add2_a5 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 5)
  expect_snapshot_html(gt_tbl_f_add2_a5)
  gt_tbl_f_add2_a6 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 6)
  expect_snapshot_html(gt_tbl_f_add2_a6)
  gt_tbl_f_add2_a7 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 7)
  expect_snapshot_html(gt_tbl_f_add2_a7)
  gt_tbl_f_add2_a8 <- gt_tbl_f |> rows_add(.n_empty = 2, .after = 8)
  expect_snapshot_html(gt_tbl_f_add2_a8)
  expect_error(gt_tbl_f |> rows_add(.n_empty = 2, .after = 9))

  gt_tbl_g <-
    exibble |>
    gt(groupname_col = "group")

  gt_tbl_g_add1_b1 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 1)
  expect_snapshot_html(gt_tbl_g_add1_b1)
  gt_tbl_g_add1_b2 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 2)
  expect_snapshot_html(gt_tbl_g_add1_b2)
  gt_tbl_g_add1_b3 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 3)
  expect_snapshot_html(gt_tbl_g_add1_b3)
  gt_tbl_g_add1_b4 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 4)
  expect_snapshot_html(gt_tbl_g_add1_b4)
  gt_tbl_g_add1_b5 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 5)
  expect_snapshot_html(gt_tbl_g_add1_b5)
  gt_tbl_g_add1_b6 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 6)
  expect_snapshot_html(gt_tbl_g_add1_b6)
  gt_tbl_g_add1_b7 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 7)
  expect_snapshot_html(gt_tbl_g_add1_b7)
  gt_tbl_g_add1_b8 <- gt_tbl_g |> rows_add(.n_empty = 1, .before = 8)
  expect_snapshot_html(gt_tbl_g_add1_b8)
  expect_error(gt_tbl_g |> rows_add(.n_empty = 1, .before = 9))

  gt_tbl_g_add1_a1 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 1)
  expect_snapshot_html(gt_tbl_g_add1_a1)
  gt_tbl_g_add1_a2 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 2)
  expect_snapshot_html(gt_tbl_g_add1_a2)
  gt_tbl_g_add1_a3 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 3)
  expect_snapshot_html(gt_tbl_g_add1_a3)
  gt_tbl_g_add1_a4 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 4)
  expect_snapshot_html(gt_tbl_g_add1_a4)
  gt_tbl_g_add1_a5 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 5)
  expect_snapshot_html(gt_tbl_g_add1_a5)
  gt_tbl_g_add1_a6 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 6)
  expect_snapshot_html(gt_tbl_g_add1_a6)
  gt_tbl_g_add1_a7 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 7)
  expect_snapshot_html(gt_tbl_g_add1_a7)
  gt_tbl_g_add1_a8 <- gt_tbl_g |> rows_add(.n_empty = 1, .after = 8)
  expect_snapshot_html(gt_tbl_g_add1_a8)
  expect_error(gt_tbl_g |> rows_add(.n_empty = 1, .after = 9))

  gt_tbl_g_add2_b1 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 1)
  expect_snapshot_html(gt_tbl_g_add2_b1)
  gt_tbl_g_add2_b2 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 2)
  expect_snapshot_html(gt_tbl_g_add2_b2)
  gt_tbl_g_add2_b3 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 3)
  expect_snapshot_html(gt_tbl_g_add2_b3)
  gt_tbl_g_add2_b4 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 4)
  expect_snapshot_html(gt_tbl_g_add2_b4)
  gt_tbl_g_add2_b5 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 5)
  expect_snapshot_html(gt_tbl_g_add2_b5)
  gt_tbl_g_add2_b6 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 6)
  expect_snapshot_html(gt_tbl_g_add2_b6)
  gt_tbl_g_add2_b7 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 7)
  expect_snapshot_html(gt_tbl_g_add2_b7)
  gt_tbl_g_add2_b8 <- gt_tbl_g |> rows_add(.n_empty = 2, .before = 8)
  expect_snapshot_html(gt_tbl_g_add2_b8)
  expect_error(gt_tbl_g |> rows_add(.n_empty = 2, .before = 9))

  gt_tbl_g_add2_a1 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 1)
  expect_snapshot_html(gt_tbl_g_add2_a1)
  gt_tbl_g_add2_a2 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 2)
  expect_snapshot_html(gt_tbl_g_add2_a2)
  gt_tbl_g_add2_a3 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 3)
  expect_snapshot_html(gt_tbl_g_add2_a3)
  gt_tbl_g_add2_a4 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 4)
  expect_snapshot_html(gt_tbl_g_add2_a4)
  gt_tbl_g_add2_a5 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 5)
  expect_snapshot_html(gt_tbl_g_add2_a5)
  gt_tbl_g_add2_a6 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 6)
  expect_snapshot_html(gt_tbl_g_add2_a6)
  gt_tbl_g_add2_a7 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 7)
  expect_snapshot_html(gt_tbl_g_add2_a7)
  gt_tbl_g_add2_a8 <- gt_tbl_g |> rows_add(.n_empty = 2, .after = 8)
  expect_snapshot_html(gt_tbl_g_add2_a8)
  expect_error(gt_tbl_g |> rows_add(.n_empty = 2, .after = 9))

  # Expect an error if using both `.before` and `.after`
  expect_error(
    gt_tbl_e |>
      rows_add(.before = 2, .after = 5, .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.before = 3, .after = 2, .n_empty = 2)
  )

  # Expect that targeting rows should only resolve to a single row
  expect_error(
    gt_tbl_e |>
      rows_add(.before = c(2, 5), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.after = c(2, 5), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.before = c("row_2", "row_5"), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.after = c("row_2", "row_5"), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.before = matches("5|6"), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.after = matches("5|6"), .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.after = matches("5|6"), .before = 3, .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.before = matches("5|6"), .after = 3, .n_empty = 2)
  )
  expect_error(
    gt_tbl_e |>
      rows_add(.before = matches("5"), .after = matches("6"), .n_empty = 2)
  )
})

test_that("adding rows can be done using formula-based expressions", {

  gt_tbl_h <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group")

  # Add a single row, using two values
  gt_tbl_h_01 <-
    gt_tbl_h |>
    rows_add(
      num ~ 5.79,
      currency ~ 25.3
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_01_data <- dt_data_get(data = gt_tbl_h_01)
  tbl_h_01_stub <- dt_stub_df_get(data = gt_tbl_h_01)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_01_data), 9)
  expect_equal(tbl_h_01_stub$rownum_i, 1:9)
  expect_equal(tbl_h_01_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_h_01_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_01)

  # Add a single row, this time with more values
  gt_tbl_h_02 <-
    gt_tbl_h |>
    rows_add(
      num ~ 5.79,
      currency ~ 25.3,
      char ~ "elderberry",
      fctr ~ "nine",
      date ~ "2015-09-15",
      time ~ "21:30",
      datetime ~ "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_02_data <- dt_data_get(data = gt_tbl_h_02)
  tbl_h_02_stub <- dt_stub_df_get(data = gt_tbl_h_02)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_02_data), 9)
  expect_equal(tbl_h_02_stub$rownum_i, 1:9)
  expect_equal(tbl_h_02_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_h_02_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_02)

  # Add three rows, include repeating values
  gt_tbl_h_03 <-
    gt_tbl_h |>
    rows_add(
      num ~ 5.79,
      currency ~ 25.3,
      char ~ "elderberry",
      fctr ~ c("nine", "ten", "eleven"),
      date ~ "2015-09-15",
      time ~ c("21:30", "22:30", "00:30"),
      datetime ~ "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_03_data <- dt_data_get(data = gt_tbl_h_03)
  tbl_h_03_stub <- dt_stub_df_get(data = gt_tbl_h_03)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_03_data), 11)
  expect_equal(tbl_h_03_stub$rownum_i, 1:11)
  expect_equal(tbl_h_03_stub$row_id, c(paste0("row_", 1:8), rep(NA, 3)))
  expect_equal(tbl_h_03_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), rep(NA, 3)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_03)

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_h_04 <-
    gt_tbl_h |>
    rows_add(
      row ~ "row_9",
      num ~ 5.79,
      currency ~ 25.3,
      char ~ "elderberry",
      fctr ~ "nine",
      date ~ "2015-09-15",
      time ~ "21:30",
      datetime ~ "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_04_data <- dt_data_get(data = gt_tbl_h_04)
  tbl_h_04_stub <- dt_stub_df_get(data = gt_tbl_h_04)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_04_data), 9)
  expect_equal(tbl_h_04_stub$rownum_i, 1:9)
  expect_equal(tbl_h_04_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_h_04_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_04)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_h_05 <-
    gt_tbl_h |>
    rows_add(
      row ~ "row_9",
      group ~ "grp_b",
      num ~ 5.79,
      currency ~ 25.3,
      char ~ "elderberry",
      fctr ~ "nine",
      date ~ "2015-09-15",
      time ~ "21:30",
      datetime ~ "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_05_data <- dt_data_get(data = gt_tbl_h_05)
  tbl_h_05_stub <- dt_stub_df_get(data = gt_tbl_h_05)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_05_data), 9)
  expect_equal(tbl_h_05_stub$rownum_i, 1:9)
  expect_equal(tbl_h_05_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_h_05_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 5)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_05)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_h_06 <-
    gt_tbl_h |>
    rows_add(
      row ~ "row_9",
      group ~ "grp_c",
      num ~ 5.79,
      currency ~ 25.3,
      char ~ "elderberry",
      fctr ~ "nine",
      date ~ "2015-09-15",
      time ~ "21:30",
      datetime ~ "2018-09-09 21:37"
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_06_data <- dt_data_get(data = gt_tbl_h_06)
  tbl_h_06_stub <- dt_stub_df_get(data = gt_tbl_h_06)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_06_data), 9)
  expect_equal(tbl_h_06_stub$rownum_i, 1:9)
  expect_equal(tbl_h_06_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_h_06_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_c"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_06)

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_h_07 <-
    gt_tbl_h |>
    rows_add(
      row ~ c("row_4.5", "row_8.5"),
      group ~ c("grp_a", "grp_b"),
      num ~ c(5.79, 2.72),
      currency ~ c(25.3, 62.1),
      char ~ c("elderberry", "ilama"),
      fctr ~ c("vier", "acht"),
      date ~ c("2015-09-15", "2015-11-23"),
      time ~ c("21:30", "22:12"),
      datetime ~ c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_07_data <- dt_data_get(data = gt_tbl_h_07)
  tbl_h_07_stub <- dt_stub_df_get(data = gt_tbl_h_07)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_07_data), 10)
  expect_equal(tbl_h_07_stub$rownum_i, 1:10)
  expect_equal(tbl_h_07_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_h_07_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_07)

  # Use a mix of name-value pairs and formula expressions
  gt_tbl_h_08 <-
    gt_tbl_h |>
    rows_add(
      row = c("row_4.5", "row_8.5"),
      group ~ c("grp_a", "grp_b"),
      num = c(5.79, 2.72),
      currency ~ c(25.3, 62.1),
      char = c("elderberry", "ilama"),
      fctr ~ c("vier", "acht"),
      date = c("2015-09-15", "2015-11-23"),
      time ~ c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_08_data <- dt_data_get(data = gt_tbl_h_08)
  tbl_h_08_stub <- dt_stub_df_get(data = gt_tbl_h_08)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_08_data), 10)
  expect_equal(tbl_h_08_stub$rownum_i, 1:10)
  expect_equal(tbl_h_08_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_h_08_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_08)

  # Use Tidyselect-style expressions on the LHS
  gt_tbl_h_09 <-
    gt_tbl_h |>
    rows_add(
      one_of("row") ~ c("row_4.5", "row_8.5"),
      starts_with("gr") ~ c("grp_a", "grp_b"),
      matches("um") ~ c(5.79, 2.72),
      contains("ren") ~ c(25.3, 62.1),
      ends_with("ar") ~ c("elderberry", "ilama"),
      matches("^f?t?$") ~ c("vier", "acht"),
      all_of("date") ~ c("2015-09-15", "2015-11-23"),
      time ~ c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_09_data <- dt_data_get(data = gt_tbl_h_09)
  tbl_h_09_stub <- dt_stub_df_get(data = gt_tbl_h_09)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_09_data), 10)
  expect_equal(tbl_h_09_stub$rownum_i, 1:10)
  expect_equal(tbl_h_09_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_h_09_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_09)

  # Use mix of Tidyselect-style expressions and vectors on the LHS
  gt_tbl_h_10 <-
    gt_tbl_h |>
    rows_add(
      one_of("row") ~ c("row_4.5", "row_8.5"),
      starts_with("gr") ~ c("grp_a", "grp_b"),
      c(num, currency) ~ c(5.79, 2.72),
      c(char, fctr) ~ c("elderberry", "ilama"),
      all_of("date") ~ c("2015-09-15", "2015-11-23"),
      time ~ c("21:30", "22:12"),
      datetime = c("2018-09-09 21:37", NA)
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_h_10_data <- dt_data_get(data = gt_tbl_h_10)
  tbl_h_10_stub <- dt_stub_df_get(data = gt_tbl_h_10)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_h_10_data), 10)
  expect_equal(tbl_h_10_stub$rownum_i, 1:10)
  expect_equal(tbl_h_10_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_h_10_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))
  expect_equal(tbl_h_10_data$char[9], tbl_h_10_data$fctr[9])
  expect_equal(tbl_h_10_data$char[10], tbl_h_10_data$fctr[10])
  expect_equal(tbl_h_10_data$num[9], tbl_h_10_data$currency[9])
  expect_equal(tbl_h_10_data$num[10], tbl_h_10_data$currency[10])

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_10)

  # Use `everything()` to target all columns in a simple table
  gt_tbl_h_11 <-
    dplyr::tibble(
      a = 1:10,
      b = 21:30
    ) |>
    gt() |>
    rows_add(
      everything() ~ 99
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_h_11)

  # Expect an error if using a one-sided formula
  expect_error(
    dplyr::tibble(
      a = 1:10,
      b = 21:30
    ) |>
      gt() |>
      rows_add(
        ~ 99
      )
  )
})

test_that("adding rows can be done through the `.list` argument", {

  gt_tbl_i <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group")

  # Add a single row, using two values
  gt_tbl_i_01 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        num = 5.79,
        currency ~ 25.3
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_01_data <- dt_data_get(data = gt_tbl_i_01)
  tbl_i_01_stub <- dt_stub_df_get(data = gt_tbl_i_01)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_01_data), 9)
  expect_equal(tbl_i_01_stub$rownum_i, 1:9)
  expect_equal(tbl_i_01_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_i_01_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_01)

  # Add a single row, this time with more values
  gt_tbl_i_02 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        num ~ 5.79,
        currency ~ 25.3,
        char ~ "elderberry",
        fctr ~ "nine",
        date ~ "2015-09-15",
        time ~ "21:30",
        datetime ~ "2018-09-09 21:37"
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_02_data <- dt_data_get(data = gt_tbl_i_02)
  tbl_i_02_stub <- dt_stub_df_get(data = gt_tbl_i_02)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_02_data), 9)
  expect_equal(tbl_i_02_stub$rownum_i, 1:9)
  expect_equal(tbl_i_02_stub$row_id, c(paste0("row_", 1:8), NA))
  expect_equal(tbl_i_02_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_02)

  # Add three rows, include repeating values
  gt_tbl_i_03 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        num ~ 5.79,
        currency ~ 25.3,
        char ~ "elderberry",
        fctr ~ c("nine", "ten", "eleven"),
        date ~ "2015-09-15",
        time ~ c("21:30", "22:30", "00:30"),
        datetime ~ "2018-09-09 21:37"
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_03_data <- dt_data_get(data = gt_tbl_i_03)
  tbl_i_03_stub <- dt_stub_df_get(data = gt_tbl_i_03)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_03_data), 11)
  expect_equal(tbl_i_03_stub$rownum_i, 1:11)
  expect_equal(tbl_i_03_stub$row_id, c(paste0("row_", 1:8), rep(NA, 3)))
  expect_equal(tbl_i_03_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), rep(NA, 3)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_03)

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_i_04 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        row ~ "row_9",
        num ~ 5.79,
        currency ~ 25.3,
        char ~ "elderberry",
        fctr ~ "nine",
        date ~ "2015-09-15",
        time ~ "21:30",
        datetime ~ "2018-09-09 21:37"
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_04_data <- dt_data_get(data = gt_tbl_i_04)
  tbl_i_04_stub <- dt_stub_df_get(data = gt_tbl_i_04)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_04_data), 9)
  expect_equal(tbl_i_04_stub$rownum_i, 1:9)
  expect_equal(tbl_i_04_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_i_04_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), NA))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_04)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_i_05 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        row ~ "row_9",
        group ~ "grp_b",
        num ~ 5.79,
        currency ~ 25.3,
        char ~ "elderberry",
        fctr ~ "nine",
        date ~ "2015-09-15",
        time ~ "21:30",
        datetime ~ "2018-09-09 21:37"
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_05_data <- dt_data_get(data = gt_tbl_i_05)
  tbl_i_05_stub <- dt_stub_df_get(data = gt_tbl_i_05)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_05_data), 9)
  expect_equal(tbl_i_05_stub$rownum_i, 1:9)
  expect_equal(tbl_i_05_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_i_05_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 5)))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_05)

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_i_06 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        row ~ "row_9",
        group ~ "grp_c",
        num ~ 5.79,
        currency ~ 25.3,
        char ~ "elderberry",
        fctr ~ "nine",
        date ~ "2015-09-15",
        time ~ "21:30",
        datetime ~ "2018-09-09 21:37"
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_06_data <- dt_data_get(data = gt_tbl_i_06)
  tbl_i_06_stub <- dt_stub_df_get(data = gt_tbl_i_06)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_06_data), 9)
  expect_equal(tbl_i_06_stub$rownum_i, 1:9)
  expect_equal(tbl_i_06_stub$row_id, paste0("row_", 1:9))
  expect_equal(tbl_i_06_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_c"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_06)

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_i_07 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        row ~ c("row_4.5", "row_8.5"),
        group ~ c("grp_a", "grp_b"),
        num ~ c(5.79, 2.72),
        currency ~ c(25.3, 62.1),
        char ~ c("elderberry", "ilama"),
        fctr ~ c("vier", "acht"),
        date ~ c("2015-09-15", "2015-11-23"),
        time ~ c("21:30", "22:12"),
        datetime ~ c("2018-09-09 21:37", NA)
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_07_data <- dt_data_get(data = gt_tbl_i_07)
  tbl_i_07_stub <- dt_stub_df_get(data = gt_tbl_i_07)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_07_data), 10)
  expect_equal(tbl_i_07_stub$rownum_i, 1:10)
  expect_equal(tbl_i_07_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_i_07_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_07)

  # Use a mix of name-value pairs and formula expressions
  gt_tbl_i_08 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        row = c("row_4.5", "row_8.5"),
        group ~ c("grp_a", "grp_b"),
        num = c(5.79, 2.72),
        currency ~ c(25.3, 62.1),
        char = c("elderberry", "ilama"),
        fctr ~ c("vier", "acht"),
        date = c("2015-09-15", "2015-11-23"),
        time ~ c("21:30", "22:12"),
        datetime = c("2018-09-09 21:37", NA)
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_08_data <- dt_data_get(data = gt_tbl_i_08)
  tbl_i_08_stub <- dt_stub_df_get(data = gt_tbl_i_08)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_08_data), 10)
  expect_equal(tbl_i_08_stub$rownum_i, 1:10)
  expect_equal(tbl_i_08_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_i_08_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_08)

  # Use Tidyselect-style expressions on the LHS
  gt_tbl_i_09 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        one_of("row") ~ c("row_4.5", "row_8.5"),
        starts_with("gr") ~ c("grp_a", "grp_b"),
        matches("um") ~ c(5.79, 2.72),
        contains("ren") ~ c(25.3, 62.1),
        ends_with("ar") ~ c("elderberry", "ilama"),
        matches("^f?t?$") ~ c("vier", "acht"),
        all_of("date") ~ c("2015-09-15", "2015-11-23"),
        time ~ c("21:30", "22:12"),
        datetime = c("2018-09-09 21:37", NA)
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_09_data <- dt_data_get(data = gt_tbl_i_09)
  tbl_i_09_stub <- dt_stub_df_get(data = gt_tbl_i_09)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_09_data), 10)
  expect_equal(tbl_i_09_stub$rownum_i, 1:10)
  expect_equal(tbl_i_09_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_i_09_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_09)

  # Use mix of Tidyselect-style expressions and vectors on the LHS
  gt_tbl_i_10 <-
    gt_tbl_i |>
    rows_add(
      .list = list(
        one_of("row") ~ c("row_4.5", "row_8.5"),
        starts_with("gr") ~ c("grp_a", "grp_b"),
        c(num, currency) ~ c(5.79, 2.72),
        c(char, fctr) ~ c("elderberry", "ilama"),
        all_of("date") ~ c("2015-09-15", "2015-11-23"),
        time ~ c("21:30", "22:12"),
        datetime = c("2018-09-09 21:37", NA)
      )
    )

  # Get the internal data table and the `stub_df` tbl
  tbl_i_10_data <- dt_data_get(data = gt_tbl_i_10)
  tbl_i_10_stub <- dt_stub_df_get(data = gt_tbl_i_10)

  # Perform checks of both internal table objects
  expect_equal(nrow(tbl_i_10_data), 10)
  expect_equal(tbl_i_10_stub$rownum_i, 1:10)
  expect_equal(tbl_i_10_stub$row_id, c(paste0("row_", 1:8), "row_4.5", "row_8.5"))
  expect_equal(tbl_i_10_stub$group_id, c(rep("grp_a", 4), rep("grp_b", 4), "grp_a", "grp_b"))
  expect_equal(tbl_i_10_data$char[9], tbl_i_10_data$fctr[9])
  expect_equal(tbl_i_10_data$char[10], tbl_i_10_data$fctr[10])
  expect_equal(tbl_i_10_data$num[9], tbl_i_10_data$currency[9])
  expect_equal(tbl_i_10_data$num[10], tbl_i_10_data$currency[10])

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_10)

  # Use `everything()` to target all columns in a simple table
  gt_tbl_i_11 <-
    dplyr::tibble(
      a = 1:10,
      b = 21:30
    ) |>
    gt() |>
    rows_add(
      .list = list(
        everything() ~ 99
      )
    )

  # Perform snapshot test
  expect_snapshot_html(gt_tbl_i_11)
})

test_that("adding rows can only involve columns already present in the table", {

  gt_tbl <- gt(exibble)

  expect_no_error(gt_tbl |> rows_add())
  expect_no_error(gt_tbl |> rows_add(char = "elderberry"))
  expect_error(gt_tbl |> rows_add(char_none = "elderberry"))
  expect_error(gt_tbl |> rows_add(char = "elderberry", char_none = "watermelon"))

  gt_tbl_2 <- gt(exibble, rowname_col = "row")

  expect_no_error(gt_tbl_2 |> rows_add())
  expect_no_error(gt_tbl_2 |> rows_add(char = "elderberry"))
  expect_error(gt_tbl_2 |> rows_add(char_none = "elderberry"))
  expect_error(gt_tbl_2 |> rows_add(char = "elderberry", char_none = "watermelon"))

  gt_tbl_3 <- gt(exibble, rowname_col = "row", groupname_col = "group")

  expect_no_error(gt_tbl_3 |> rows_add())
  expect_no_error(gt_tbl_3 |> rows_add(char = "elderberry"))
  expect_error(gt_tbl_3 |> rows_add(char_none = "elderberry"))
  expect_error(gt_tbl_3 |> rows_add(char = "elderberry", char_none = "watermelon"))

  gt_tbl_4 <- gt(exibble, groupname_col = "group")

  expect_no_error(gt_tbl_4 |> rows_add())
  expect_no_error(gt_tbl_4 |> rows_add(char = "elderberry"))
  expect_error(gt_tbl_4 |> rows_add(char_none = "elderberry"))
  expect_error(gt_tbl_4 |> rows_add(char = "elderberry", char_none = "watermelon"))
})

test_that("adding rows can only be done with compatible data", {

  gt_tbl <- gt(exibble)

  expect_no_error(gt_tbl |> rows_add(char = "elderberry"))
  expect_error(gt_tbl |> rows_add(char = 2))
  expect_error(gt_tbl |> rows_add(char = list("two")))
  expect_error(gt_tbl |> rows_add(char = "elderberry", time = 600))
  expect_no_error(gt_tbl |> rows_add(fctr = "nine"))
  expect_no_error(gt_tbl |> rows_add(fctr = factor("nine")))
})

test_that("adding rows and styling the table has the intended behavior", {

  gt_tbl <- gt(exibble, rowname_col = "row")

  gt_tbl_style_01 <-
    gt_tbl |>
    rows_add(row = "row_9") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    )

  gt_tbl_style_02 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    ) |>
    rows_add(row = "row_9")

  gt_tbl_style_03 <-
    gt_tbl |>
    rows_add(row = "row_3.5", .after = 3) |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    )

  gt_tbl_style_04 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    ) |>
    rows_add(row = "row_3.5", .after = 3)

  gt_tbl_style_05 <-
    gt_tbl |>
    rows_add(row = "row_3.5", .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    )

  gt_tbl_style_06 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 1:8)
    ) |>
    rows_add(row = "row_3.5", .after = "row_3")

  gt_tbl_style_07 <-
    gt_tbl |>
    rows_add(row = "row_3.5", .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = matches("\\."))
    )

  gt_tbl_style_08 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = matches("\\."))
    ) |>
    rows_add(row = "row_3.5", .after = "row_3")

  gt_tbl_style_09 <-
    gt_tbl |>
    rows_add(row = "row_3.5", .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    )

  gt_tbl_style_10 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    ) |>
    rows_add(row = "row_3.5", .after = "row_3")

  gt_tbl_style_11 <-
    gt_tbl |>
    rows_add(row = "row_3.5", .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = 9)
    )

  gt_tbl_style_12 <-
    gt_tbl |>
    rows_add(row = "row_0", .before = 1) |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = "row_0")
    )

  gt_tbl_style_13 <-
    gt_tbl |>
    rows_add(num = 2343, .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    )

  gt_tbl_style_14 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    ) |>
    rows_add(num = 2343, .after = "row_3")

  gt_tbl_style_15 <-
    gt_tbl |>
    rows_add(num = 2343, .after = "row_3") |>
    data_color()

  gt_tbl_style_16 <-
    gt_tbl |>
    data_color() |>
    rows_add(num = 2343, .after = "row_3")

  gt_tbl_style_17 <-
    gt_tbl |>
    data_color() |>
    rows_add(num = 2343, .after = "row_3") |>
    data_color()

  gt_tbl_style_18 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    ) |>
    rows_add(num = 2343, .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body()
    )

  gt_tbl_style_19 <-
    gt_tbl |>
    rows_add(num = 2343, .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = !is.na(row))
    )

  gt_tbl_style_20 <-
    gt_tbl |>
    rows_add(num = 2343, .after = "row_3") |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = is.na(row))
    )

  gt_tbl_style_21 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = is.na(row))
    ) |>
    rows_add(num = 2343, .after = "row_3")

  gt_tbl_style_22 <-
    gt_tbl |>
    tab_style(
      style = cell_fill(),
      locations = cells_body(rows = !is.na(row))
    ) |>
    rows_add(num = 2343, .after = "row_3")

  # Perform several snapshot tests
  expect_snapshot_html(gt_tbl_style_01)
  expect_snapshot_html(gt_tbl_style_02)
  expect_snapshot_html(gt_tbl_style_03)
  expect_snapshot_html(gt_tbl_style_04)
  expect_snapshot_html(gt_tbl_style_05)
  expect_snapshot_html(gt_tbl_style_06)
  expect_snapshot_html(gt_tbl_style_07)
  expect_snapshot_html(gt_tbl_style_08)
  expect_snapshot_html(gt_tbl_style_09)
  expect_snapshot_html(gt_tbl_style_10)
  expect_snapshot_html(gt_tbl_style_11)
  expect_snapshot_html(gt_tbl_style_12)
  expect_snapshot_html(gt_tbl_style_13)
  expect_snapshot_html(gt_tbl_style_14)
  expect_snapshot_html(gt_tbl_style_15)
  expect_snapshot_html(gt_tbl_style_16)
  expect_snapshot_html(gt_tbl_style_17)
  expect_snapshot_html(gt_tbl_style_18)
  expect_snapshot_html(gt_tbl_style_19)
  expect_snapshot_html(gt_tbl_style_20)
  expect_snapshot_html(gt_tbl_style_21)
  expect_snapshot_html(gt_tbl_style_22)

  # Expect an error when trying to resolve indices that don't yet exist
  # (i.e., the order of `rows_add()` and `tab_style()` matters)
  expect_error(
    gt_tbl |>
      tab_style(
        style = cell_fill(),
        locations = cells_body(rows = 9)
      ) |>
      rows_add(row = "row_3.5", .after = "row_3")
  )

  expect_error(
    gt_tbl |>
      tab_style(
        style = cell_fill(),
        locations = cells_body(rows = "row_0")
      ) |>
      rows_add(row = "row_0", .before = 1)
  )
})
