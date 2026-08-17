test_that("Splitting a table into multiple works", {

  tbl_group_01 <-
    gtcars |>
    dplyr::slice_head(n = 10) |>
    dplyr::select(mfr, model, year, msrp) |>
    gt() |>
    fmt_currency(columns = msrp) |>
    cols_width(
      year ~ px(80),
      everything() ~ px(150)
    ) |>
    gt_split(row_every_n = 5)

  expect_s3_class(tbl_group_01, "gt_group")
  expect_equal(tbl_group_01$gt_tbls$i, 1:2)
  expect_s3_class(tbl_group_01$gt_tbls$gt_tbl[[1]], "gt_tbl")
  expect_s3_class(tbl_group_01$gt_tbls$gt_tbl[[2]], "gt_tbl")
  expect_equal(tbl_group_01$gt_tbls$column_names[[1]], tbl_group_01$gt_tbls$column_names[[2]])
  expect_equal(tbl_group_01$gt_tbls$n_columns_total, c(4, 4))
  expect_equal(tbl_group_01$gt_tbls$n_columns_total[[1]], tbl_group_01$gt_tbls$n_columns_total[[2]])
  expect_equal(tbl_group_01$gt_tbls$n_columns_data, c(4, 4))
  expect_equal(tbl_group_01$gt_tbls$n_columns_data[[1]], tbl_group_01$gt_tbls$n_columns_data[[2]])
  expect_equal(tbl_group_01$gt_tbls$n_columns_stub, c(0, 0))
  expect_equal(tbl_group_01$gt_tbls$n_columns_stub[[1]], tbl_group_01$gt_tbls$n_columns_stub[[2]])
  expect_equal(tbl_group_01$gt_tbls$n_rows_data, c(5, 5))
  expect_equal(tbl_group_01$gt_tbls$n_summary_rows_total, c(0, 0))
  expect_equal(tbl_group_01$gt_tbls$n_summary_rows_group, c(0, 0))
  expect_equal(tbl_group_01$gt_tbls$n_summary_rows_grand, c(0, 0))

  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_01), "shiny.tag.list"))
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_01), "list"))

  tbl_group_02 <-
    gtcars |>
    dplyr::slice_head(n = 10) |>
    dplyr::select(mfr, model, year, msrp) |>
    gt() |>
    fmt_currency(columns = msrp) |>
    cols_width(
      year ~ px(80),
      everything() ~ px(150)
    ) |>
    gt_split(col_slice_at = "model")

  expect_s3_class(tbl_group_02, "gt_group")
  expect_equal(tbl_group_02$gt_tbls$i, 1:2)
  expect_s3_class(tbl_group_02$gt_tbls$gt_tbl[[1]], "gt_tbl")
  expect_s3_class(tbl_group_02$gt_tbls$gt_tbl[[2]], "gt_tbl")
  expect_equal(tbl_group_02$gt_tbls$column_names[[1]], c("mfr", "model"))
  expect_equal(tbl_group_02$gt_tbls$column_names[[2]], c("year", "msrp"))
  expect_equal(tbl_group_02$gt_tbls$n_columns_total, c(2, 2))
  expect_equal(tbl_group_02$gt_tbls$n_columns_total[[1]], tbl_group_02$gt_tbls$n_columns_total[[2]])
  expect_equal(tbl_group_02$gt_tbls$n_columns_data, c(2, 2))
  expect_equal(tbl_group_02$gt_tbls$n_columns_data[[1]], tbl_group_02$gt_tbls$n_columns_data[[2]])
  expect_equal(tbl_group_02$gt_tbls$n_columns_stub, c(0, 0))
  expect_equal(tbl_group_02$gt_tbls$n_columns_stub[[1]], tbl_group_02$gt_tbls$n_columns_stub[[2]])
  expect_equal(tbl_group_02$gt_tbls$n_rows_data, c(10, 10))
  expect_equal(tbl_group_02$gt_tbls$n_summary_rows_total, c(0, 0))
  expect_equal(tbl_group_02$gt_tbls$n_summary_rows_group, c(0, 0))
  expect_equal(tbl_group_02$gt_tbls$n_summary_rows_grand, c(0, 0))

  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_02), "shiny.tag.list"))
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_02), "list"))

  tbl_group_03 <-
    gtcars |>
    dplyr::slice_head(n = 10) |>
    dplyr::select(mfr, model, year, msrp) |>
    gt() |>
    fmt_currency(columns = msrp) |>
    cols_width(
      year ~ px(80),
      everything() ~ px(150)
    ) |>
    gt_split(row_every_n = 5, col_slice_at = "model")

  expect_s3_class(tbl_group_03, "gt_group")
  expect_equal(tbl_group_03$gt_tbls$i, 1:4)
  expect_s3_class(tbl_group_03$gt_tbls$gt_tbl[[1]], "gt_tbl")
  expect_s3_class(tbl_group_03$gt_tbls$gt_tbl[[2]], "gt_tbl")
  expect_s3_class(tbl_group_03$gt_tbls$gt_tbl[[3]], "gt_tbl")
  expect_s3_class(tbl_group_03$gt_tbls$gt_tbl[[4]], "gt_tbl")
  expect_equal(tbl_group_03$gt_tbls$column_names[[1]], c("mfr", "model"))
  expect_equal(tbl_group_03$gt_tbls$column_names[[2]], c("year", "msrp"))
  expect_equal(tbl_group_03$gt_tbls$column_names[[3]], c("mfr", "model"))
  expect_equal(tbl_group_03$gt_tbls$column_names[[4]], c("year", "msrp"))
  expect_equal(tbl_group_03$gt_tbls$n_columns_total, c(2, 2, 2, 2))
  expect_equal(tbl_group_03$gt_tbls$n_columns_total[[1]], tbl_group_03$gt_tbls$n_columns_total[[2]])
  expect_equal(tbl_group_03$gt_tbls$n_columns_total[[3]], tbl_group_03$gt_tbls$n_columns_total[[4]])
  expect_equal(tbl_group_03$gt_tbls$n_columns_data, c(2, 2, 2, 2))
  expect_equal(tbl_group_03$gt_tbls$n_columns_data[[1]], tbl_group_03$gt_tbls$n_columns_data[[2]])
  expect_equal(tbl_group_03$gt_tbls$n_columns_data[[3]], tbl_group_03$gt_tbls$n_columns_data[[4]])
  expect_equal(tbl_group_03$gt_tbls$n_columns_stub, c(0, 0, 0, 0))
  expect_equal(tbl_group_03$gt_tbls$n_columns_stub[[1]], tbl_group_03$gt_tbls$n_columns_stub[[2]])
  expect_equal(tbl_group_03$gt_tbls$n_columns_stub[[3]], tbl_group_03$gt_tbls$n_columns_stub[[4]])
  expect_equal(tbl_group_03$gt_tbls$n_rows_data, c(5, 5, 5, 5))
  expect_equal(tbl_group_03$gt_tbls$n_summary_rows_total, c(0, 0, 0, 0))
  expect_equal(tbl_group_03$gt_tbls$n_summary_rows_group, c(0, 0, 0, 0))
  expect_equal(tbl_group_03$gt_tbls$n_summary_rows_grand, c(0, 0, 0, 0))

  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_03), "shiny.tag.list"))
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_03), "list"))

  tbl_group_04 <-
    gtcars |>
    dplyr::slice_head(n = 10) |>
    dplyr::select(mfr, model, year, msrp) |>
    gt() |>
    fmt_currency(columns = msrp) |>
    cols_width(
      year ~ px(80),
      everything() ~ px(150)
    ) |>
    gt_split(row_slice_i = c(2, 8))

  expect_s3_class(tbl_group_04, "gt_group")
  expect_equal(tbl_group_04$gt_tbls$i, 1:3)
  expect_s3_class(tbl_group_04$gt_tbls$gt_tbl[[1]], "gt_tbl")
  expect_s3_class(tbl_group_04$gt_tbls$gt_tbl[[2]], "gt_tbl")
  expect_s3_class(tbl_group_04$gt_tbls$gt_tbl[[3]], "gt_tbl")
  expect_equal(tbl_group_04$gt_tbls$column_names[[1]], c("mfr", "model", "year", "msrp"))
  expect_equal(tbl_group_04$gt_tbls$column_names[[2]], c("mfr", "model", "year", "msrp"))
  expect_equal(tbl_group_04$gt_tbls$column_names[[3]], c("mfr", "model", "year", "msrp"))
  expect_equal(tbl_group_04$gt_tbls$n_columns_total, c(4, 4, 4))
  expect_equal(tbl_group_04$gt_tbls$n_columns_total[[1]], tbl_group_04$gt_tbls$n_columns_total[[2]])
  expect_equal(tbl_group_04$gt_tbls$n_columns_total[[1]], tbl_group_04$gt_tbls$n_columns_total[[3]])
  expect_equal(tbl_group_04$gt_tbls$n_columns_data, c(4, 4, 4))
  expect_equal(tbl_group_04$gt_tbls$n_columns_data[[1]], tbl_group_04$gt_tbls$n_columns_data[[2]])
  expect_equal(tbl_group_04$gt_tbls$n_columns_data[[1]], tbl_group_04$gt_tbls$n_columns_data[[3]])
  expect_equal(tbl_group_04$gt_tbls$n_columns_stub, c(0, 0, 0))
  expect_equal(tbl_group_04$gt_tbls$n_columns_stub[[1]], tbl_group_04$gt_tbls$n_columns_stub[[2]])
  expect_equal(tbl_group_04$gt_tbls$n_columns_stub[[1]], tbl_group_04$gt_tbls$n_columns_stub[[3]])
  expect_equal(tbl_group_04$gt_tbls$n_rows_data, c(2, 6, 2))
  expect_equal(tbl_group_04$gt_tbls$n_summary_rows_total, c(0, 0, 0))
  expect_equal(tbl_group_04$gt_tbls$n_summary_rows_group, c(0, 0, 0))
  expect_equal(tbl_group_04$gt_tbls$n_summary_rows_grand, c(0, 0, 0))

  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_04), "shiny.tag.list"))
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_04), "list"))
})

test_that("gt_split() works correctly with grouped data.frames", {

  grouped_tbl <-
    dplyr::tibble(
      group = c("A", "A", "B", "B", "C", "C"),
      x = 1:6,
      y = letters[1:6]
    ) |>
    gt(groupname_col = "group")

  tbl_group_05 <- gt_split(grouped_tbl, row_every_n = 2)

  # Expect three splits (2 rows each)
  expect_equal(length(tbl_group_05$gt_tbls$i), 3)
  expect_equal(tbl_group_05$gt_tbls$n_rows_data, c(2, 2, 2))

  # Each split should only contain the row groups present in its rows
  split_1 <- tbl_group_05$gt_tbls$gt_tbl[[1]]
  split_2 <- tbl_group_05$gt_tbls$gt_tbl[[2]]
  split_3 <- tbl_group_05$gt_tbls$gt_tbl[[3]]

  expect_equal(split_1[["_row_groups"]], "A")
  expect_equal(split_2[["_row_groups"]], "B")
  expect_equal(split_3[["_row_groups"]], "C")

  # Splitting across group boundaries should retain only relevant groups
  tbl_group_06 <- gt_split(grouped_tbl, row_every_n = 3)

  expect_equal(length(tbl_group_06$gt_tbls$i), 2)

  split_4 <- tbl_group_06$gt_tbls$gt_tbl[[1]]
  split_5 <- tbl_group_06$gt_tbls$gt_tbl[[2]]

  expect_equal(split_4[["_row_groups"]], c("A", "B"))
  expect_equal(split_5[["_row_groups"]], c("B", "C"))

  # Each split should render without error
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_05), "shiny.tag.list"))
  capture_output(expect_s3_class(testthat::testthat_print(tbl_group_06), "shiny.tag.list"))
})
