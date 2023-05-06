test_that("rows can be added to a table in a variety of ways", {

  gt_tbl_a <-
    exibble %>%
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
    gt_tbl_a %>%
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
  gt_tbl_a_01 %>% render_as_html() %>% expect_snapshot()

  # Add a single row, this time with more values
  gt_tbl_a_02 <-
    gt_tbl_a %>%
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
  gt_tbl_a_02 %>% render_as_html() %>% expect_snapshot()

  # Add three rows, include repeating values
  gt_tbl_a_03 <-
    gt_tbl_a %>%
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
  gt_tbl_a_03 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_a_04 <-
    gt_tbl_a %>%
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
  gt_tbl_a_04 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_a_05 <-
    gt_tbl_a %>%
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
  gt_tbl_a_05 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_a_06 <-
    gt_tbl_a %>%
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
  gt_tbl_a_06 %>% render_as_html() %>% expect_snapshot()

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_a_07 <-
    gt_tbl_a %>%
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
  gt_tbl_a_07 %>% render_as_html() %>% expect_snapshot()

  # Add two empty rows
  gt_tbl_a_08 <-
    gt_tbl_a %>%
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
  gt_tbl_a_08 %>% render_as_html() %>% expect_snapshot()

  # Add no rows by supplying nothing to `rows_add()`
  gt_tbl_a_09 <-
    gt_tbl_a %>%
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
  gt_tbl_a_09 %>% render_as_html() %>% expect_snapshot()

  # Add no rows by supplying `0` to `.n_empty`
  gt_tbl_a_10 <-
    gt_tbl_a %>%
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
  gt_tbl_a_10 %>% render_as_html() %>% expect_snapshot()

  # Add two empty rows with `.n_empty` while attempting to add
  # rows with name-value pairs (which have no effect)
  gt_tbl_a_11 <-
    gt_tbl_a %>%
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
  gt_tbl_a_11 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_b <-
    exibble %>%
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
    gt_tbl_b %>%
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
  gt_tbl_b_01 %>% render_as_html() %>% expect_snapshot()

  # Add a single row, this time with more values
  gt_tbl_b_02 <-
    gt_tbl_b %>%
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
  gt_tbl_b_02 %>% render_as_html() %>% expect_snapshot()

  # Add three rows, include repeating values
  gt_tbl_b_03 <-
    gt_tbl_b %>%
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
  gt_tbl_b_03 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_b_04 <-
    gt_tbl_b %>%
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
  gt_tbl_b_04 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_b_05 <-
    gt_tbl_b %>%
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
  gt_tbl_b_05 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_b_06 <-
    gt_tbl_b %>%
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
  gt_tbl_b_06 %>% render_as_html() %>% expect_snapshot()

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_b_07 <-
    gt_tbl_b %>%
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
  gt_tbl_b_07 %>% render_as_html() %>% expect_snapshot()

  # Add two empty rows
  gt_tbl_b_08 <-
    gt_tbl_b %>%
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
  gt_tbl_b_08 %>% render_as_html() %>% expect_snapshot()

  gt_tbl_c <-
    exibble %>%
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
    gt_tbl_c %>%
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
  gt_tbl_c_01 %>% render_as_html() %>% expect_snapshot()

  # Add a single row, this time with more values
  gt_tbl_c_02 <-
    gt_tbl_c %>%
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
  gt_tbl_c_02 %>% render_as_html() %>% expect_snapshot()

  # Add three rows, include repeating values
  gt_tbl_c_03 <-
    gt_tbl_c %>%
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
  gt_tbl_c_03 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row'
  gt_tbl_c_04 <-
    gt_tbl_c %>%
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
  gt_tbl_c_04 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group'
  gt_tbl_c_05 <-
    gt_tbl_c %>%
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
  gt_tbl_c_05 %>% render_as_html() %>% expect_snapshot()

  # Add one row, include a `rowname_col` value in 'row' and include
  # a 'groupname_col' value in 'group' (this time using a new group name)
  gt_tbl_c_06 <-
    gt_tbl_c %>%
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
  gt_tbl_c_06 %>% render_as_html() %>% expect_snapshot()

  # Add two rows, include two `rowname_col` values in 'row' and include
  # two different 'groupname_col' values in 'group'
  gt_tbl_c_07 <-
    gt_tbl_c %>%
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
  gt_tbl_c_07 %>% render_as_html() %>% expect_snapshot()

  # Add two empty rows
  gt_tbl_c_08 <-
    gt_tbl_c %>%
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
  gt_tbl_c_08 %>% render_as_html() %>% expect_snapshot()

  # Expect an error if non-valid values given to `.n_empty`
  expect_error(gt_tbl_c %>% rows_add(.n_empty = -1))
  expect_error(gt_tbl_c %>% rows_add(.n_empty = 3.2))
  expect_error(regexp = NA, gt_tbl_c %>% rows_add(.n_empty = 3.0))
})
