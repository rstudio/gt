test_that("summary_columns() can create a basic summary column", {

  # Create a simple table with summary column
  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq, msrp) |>
    dplyr::slice_head(n = 5) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq, msrp),
      fns = ~ sum(.),
      new_col_name = "total",
      new_col_label = "Total",
      side = "right"
    )

  # Extract the internal summary_cols object
  summary_cols <- gt:::dt_summary_cols_get(data = gt_tbl)

  # Expect that summary_cols is a list with one element
  expect_type(summary_cols, "list")
  expect_length(summary_cols, 1)

  # Expect the columns provided in summary_cols[[1]]$columns
  expect_equal(summary_cols[[1]]$columns, c("hp", "trq", "msrp"))

  # Expect the new_col_name and new_col_label
  expect_equal(summary_cols[[1]]$new_col_name, "total")
  expect_equal(summary_cols[[1]]$new_col_label, "Total")

  # Expect the side
  expect_equal(summary_cols[[1]]$side, "right")
})

test_that("summary_columns() computes correct values", {

  # Create a table with known values
  test_data <- data.frame(
    id = c("A", "B", "C"),
    x = c(10, 20, 30),
    y = c(5, 10, 15),
    z = c(2, 4, 6)
  )

  gt_tbl <-
    test_data |>
    gt(rowname_col = "id") |>
    summary_columns(
      columns = c(x, y, z),
      fns = ~ sum(.),
      new_col_name = "row_sum",
      side = "right"
    )

  # Build the table to compute the summary column
  built_tbl <- gt:::build_data(gt_tbl, context = "html")

  # Get the data
  result_data <- gt:::dt_data_get(built_tbl)

  # Check that the summary column exists
  expect_true("row_sum" %in% colnames(result_data))

  # Check the computed values
  # Row A: 10 + 5 + 2 = 17
  # Row B: 20 + 10 + 4 = 34
  # Row C: 30 + 15 + 6 = 51
  expect_equal(result_data$row_sum, c(17, 34, 51))
})

test_that("summary_columns() can create multiple summary columns", {

  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::slice_head(n = 5) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.),
      new_col_name = "total",
      side = "right"
    ) |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ mean(.),
      new_col_name = "average",
      side = "right"
    )

  # Extract the internal summary_cols object
  summary_cols <- gt:::dt_summary_cols_get(data = gt_tbl)

  # Expect two summary column specs
  expect_length(summary_cols, 2)
  expect_equal(summary_cols[[1]]$new_col_name, "total")
  expect_equal(summary_cols[[2]]$new_col_name, "average")
})

test_that("summary_columns() errors with duplicate column name", {

  expect_error(
    gtcars |>
      dplyr::select(mfr, model, hp, trq) |>
      dplyr::slice_head(n = 5) |>
      gt() |>
      summary_columns(
        columns = c(hp, trq),
        fns = ~ sum(.),
        new_col_name = "hp"  # This already exists
      ),
    "already exists"
  )
})

test_that("summary_columns() errors with no fns", {

  expect_error(
    gtcars |>
      dplyr::select(mfr, model, hp, trq) |>
      dplyr::slice_head(n = 5) |>
      gt() |>
      summary_columns(
        columns = c(hp, trq)
        # No fns provided
      ),
    "aggregation function must be provided"
  )
})

test_that("summary_columns() handles character function names", {

  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::slice_head(n = 3) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq),
      fns = "sum",
      new_col_name = "total",
      side = "right"
    )

  # Build and check
  built_tbl <- gt:::build_data(gt_tbl, context = "html")
  result_data <- gt:::dt_data_get(built_tbl)

  # Verify column exists
  expect_true("total" %in% colnames(result_data))
})

test_that("summary_columns() can create multiple columns with list of functions", {

  # Test adding multiple columns at once
  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq, msrp) |>
    dplyr::slice_head(n = 5) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq, msrp),
      fns = list(~ sum(.), ~ mean(.), ~ max(.)),
      new_col_names = c("total", "average", "maximum"),
      new_col_labels = c("Total", "Average", "Maximum"),
      side = "right"
    )

  # Check that all columns were created
  expect_true("total" %in% colnames(gt_tbl$`_data`))
  expect_true("average" %in% colnames(gt_tbl$`_data`))
  expect_true("maximum" %in% colnames(gt_tbl$`_data`))

  # Extract the internal summary_cols object
  summary_cols <- gt:::dt_summary_cols_get(data = gt_tbl)

  # Expect that summary_cols is a list with three elements
  expect_type(summary_cols, "list")
  expect_length(summary_cols, 3)

  # Check metadata for each column
  expect_equal(summary_cols[[1]]$new_col_name, "total")
  expect_equal(summary_cols[[1]]$new_col_label, "Total")
  expect_equal(summary_cols[[2]]$new_col_name, "average")
  expect_equal(summary_cols[[2]]$new_col_label, "Average")
  expect_equal(summary_cols[[3]]$new_col_name, "maximum")
  expect_equal(summary_cols[[3]]$new_col_label, "Maximum")

  # Verify first row values (911 Turbo S: hp=647, trq=550, msrp=447000)
  data_tbl <- gt_tbl$`_data`
  first_row <- c(647, 550, 447000)
  expect_equal(data_tbl$total[1], sum(first_row))
  expect_equal(data_tbl$average[1], mean(first_row))
  expect_equal(data_tbl$maximum[1], max(first_row))
})

test_that("summary_columns() generates names from functions when new_col_names is NULL", {

  # Test auto-generated names
  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::slice_head(n = 3) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq),
      fns = list(~ sum(.), ~ mean(.), ~ sd(.)),
      side = "right"
    )

  # Check that columns were created with auto-generated names
  expect_true("sum" %in% colnames(gt_tbl$`_data`))
  expect_true("mean" %in% colnames(gt_tbl$`_data`))
  expect_true("sd" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() errors with mismatched fns and new_col_names length", {

  expect_error(
    gtcars |>
      dplyr::select(mfr, model, hp, trq) |>
      dplyr::slice_head(n = 3) |>
      gt(rowname_col = "model") |>
      summary_columns(
        columns = c(hp, trq),
        fns = list(~ sum(.), ~ mean(.)),
        new_col_names = c("total")  # Only 1 name for 2 functions
      ),
    regexp = "must match the number of functions"
  )
})
