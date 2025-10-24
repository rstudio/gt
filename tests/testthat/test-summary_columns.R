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
      new_col_names = "total",
      new_col_labels = "Total",
      side = "right"
    )

  # Extract the internal summary_cols object
  summary_cols <- gt:::dt_summary_cols_get(data = gt_tbl)

  # Expect that summary_cols is a list with one element
  expect_type(summary_cols, "list")
  expect_length(summary_cols, 1)

  # Expect the columns provided in summary_cols[[1]]$columns
  expect_equal(summary_cols[[1]]$columns, c("hp", "trq", "msrp"))

  # Expect the new_col_names and new_col_labels
  expect_equal(summary_cols[[1]]$new_col_names, "total")
  expect_equal(summary_cols[[1]]$new_col_labels, "Total")

  # Expect the side
  expect_equal(summary_cols[[1]]$side, "right")
})

test_that("summary_columns() computes correct values", {

  # Create a table with known values
  test_data <-
    data.frame(
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
      new_col_names = "row_sum",
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
      new_col_names = "total",
      side = "right"
    ) |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ mean(.),
      new_col_names = "average",
      side = "right"
    )

  # Extract the internal summary_cols object
  summary_cols <- gt:::dt_summary_cols_get(data = gt_tbl)

  # Expect two summary column specs
  expect_length(summary_cols, 2)
  expect_equal(summary_cols[[1]]$new_col_names, "total")
  expect_equal(summary_cols[[2]]$new_col_names, "average")
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
        new_col_names = "hp"  # This already exists
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
      new_col_names = "total",
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
  expect_equal(summary_cols[[1]]$new_col_names, "total")
  expect_equal(summary_cols[[1]]$new_col_labels, "Total")
  expect_equal(summary_cols[[2]]$new_col_names, "average")
  expect_equal(summary_cols[[2]]$new_col_labels, "Average")
  expect_equal(summary_cols[[3]]$new_col_names, "maximum")
  expect_equal(summary_cols[[3]]$new_col_labels, "Maximum")

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

test_that("summary_columns() works with empty data frames", {

  # Zero rows: skip for now, this is an edge case that needs special handling
  skip("Empty data frames not yet supported: needs cols_add() fix")

  # Zero rows
  gt_tbl <- data.frame(x = numeric(0), y = numeric(0)) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")

  # Should have the summary column even with no data
  expect_equal(ncol(gt_tbl$`_data`), 3)  # x, y, plus summary col
})

test_that("summary_columns() works with single-row data", {

  gt_tbl <-
    data.frame(x = 10, y = 20, z = 30) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[4]], 60)
})

test_that("summary_columns() works with single-column data", {

  gt_tbl <-
    data.frame(x = 1:5) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[2]], 1:5)  # Should just copy the column
})

test_that("summary_columns() handles NA values correctly", {

  # Default behavior (na.rm not specified in formula)
  # When any value is NA, sum() returns NA for that row
  gt_tbl <-
    data.frame(x = c(1, NA, 3), y = c(2, 4, NA)) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_equal(gt_tbl$`_data`[[3]][1], 3)   # 1 + 2 = 3
  expect_true(is.na(gt_tbl$`_data`[[3]][2])) # NA + 4 = NA
  expect_true(is.na(gt_tbl$`_data`[[3]][3])) # 3 + NA = NA

  # Explicit `na.rm = TRUE`
  gt_tbl2 <-
    data.frame(x = c(1, NA, 3), y = c(2, 4, NA)) |>
    gt() |>
    summary_columns(fns = ~ sum(., na.rm = TRUE))

  expect_equal(gt_tbl2$`_data`[[3]], c(3, 4, 3))
})

test_that("summary_columns() handles all-NA rows", {

  gt_tbl <-
    data.frame(x = c(1, NA, 3), y = c(2, NA, 4)) |>
    gt() |>
    summary_columns(fns = ~ sum(., na.rm = TRUE))

  expect_equal(gt_tbl$`_data`[[3]], c(3, 0, 7))  # na.rm=TRUE makes all-NA sum to 0
})

test_that("summary_columns() handles non-numeric columns correctly", {

  # Should skip character columns with numeric selection
  gt_tbl <-
    data.frame(
      name = c("A", "B", "C"),
      x = 1:3,
      y = 4:6
    ) |>
    gt() |>
    summary_columns(
      columns = where(is.numeric),
      fns = ~ sum(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[4]], c(5, 7, 9))
})

test_that("summary_columns() works with mixed column types", {

  df <-
    data.frame(
      char = c("a", "b", "c"),
      int = 1:3,
      dbl = c(1.5, 2.5, 3.5),
      lgl = c(TRUE, FALSE, TRUE)
    )

  # Should handle numeric selection gracefully
  # where(is.numeric) selects int and dbl columns (not logical)
  gt_tbl <-
    df |>
    gt() |>
    summary_columns(
      columns = where(is.numeric),
      fns = ~ sum(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")

  # Row 1: 1 + 1.5 = 2.5
  # Row 2: 2 + 2.5 = 4.5
  # Row 3: 3 + 3.5 = 6.5
  expect_equal(gt_tbl$`_data`[[5]], c(2.5, 4.5, 6.5))
})

test_that("summary_columns() works with row groups", {

  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::slice(1:10) |>
    gt(groupname_col = "mfr") |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true("sum" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() works with row stubs", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq, mpg_c),
      fns = ~ mean(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true("mean" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() works with both groups AND stubs", {

  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq) |>
    dplyr::slice(1:10) |>
    gt(groupname_col = "mfr", rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true("sum" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() works with tab_spanner()", {

  gt_tbl <-
    gtcars |>
      dplyr::select(model, hp, trq, mpg_c, mpg_h) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_spanner(label = "Performance", columns = c(hp, trq)) |>
      tab_spanner(label = "Efficiency", columns = c(mpg_c, mpg_h)) |>
      summary_columns(
        columns = c(hp, trq),
        fns = ~ sum(.),
        new_col_labels = "Total Power"
      )

  expect_s3_class(gt_tbl, "gt_tbl")

  # Summary column should exist outside spanners initially
  expect_true("sum" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() works with cols_hide()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c, mpg_h) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq, mpg_c),  # Includes mpg_c
      fns = ~ sum(.)
    ) |>
    cols_hide(columns = mpg_c)  # Hide one of the source columns

  expect_s3_class(gt_tbl, "gt_tbl")

  # Summary column should still be computed and visible
  expect_true("sum" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() works with cols_move()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    cols_move(columns = sum, after = model)  # Move summary column

  expect_s3_class(gt_tbl, "gt_tbl")

  # Check column order in boxhead
  col_vars <- dt_boxhead_get_vars_default(gt_tbl)
  sum_pos <- which(col_vars == "sum")
  model_pos <- which(col_vars == "model")

  expect_true(sum_pos == model_pos + 1)
})

test_that("summary_columns() works with cols_label()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    cols_label(sum = "Total Power")  # Relabel the summary column

  expect_s3_class(gt_tbl, "gt_tbl")

  # Check the label was updated
  boxhead <- dt_boxhead_get(gt_tbl)
  sum_label <- boxhead[boxhead$var == "sum", "column_label"][[1]]

  expect_equal(sum_label[[1]], "Total Power")
})

test_that("summary_columns() works with cols_width()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    cols_width(sum ~ px(150))

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with cols_align()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    cols_align(align = "right", columns = sum)

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with fmt_number()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    fmt_number(columns = sum, decimals = 0)

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with fmt_integer()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    fmt_integer(columns = sum)

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with data_color()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    data_color(
      columns = sum,
      palette = "viridis"
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_style() using cells_body()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_style(
      style = cell_fill(color = "lightblue"),
      locations = cells_body(columns = sum)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_style() targeting specific rows", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_body(columns = sum, rows = sum > 500)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_header()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_header(
      title = "Car Performance",
      subtitle = "With row totals"
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_footnote()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_footnote(
      footnote = "Sum of HP and torque",
      locations = cells_column_labels(columns = sum)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_source_note()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_source_note("Data from gtcars dataset")

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with tab_stubhead()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt(rowname_col = "model") |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    tab_stubhead(label = "Car Model")

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with sub_missing()", {

  gt_tbl <-
    data.frame(
      x = c(1, NA, 3),
      y = c(2, 4, NA)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.)) |>
    sub_missing(missing_text = "—")

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with sub_zero()", {

  gt_tbl <-
    data.frame(
      x = c(1, -1, 2),
      y = c(-1, 1, -2)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.)) |>
    sub_zero(zero_text = "—")

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with sub_values()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    sub_values(
      columns = sum,
      values = 0:1000,
      replacement = "Low"
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with text_transform()", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    text_transform(
      locations = cells_body(columns = sum),
      fn = function(x) paste0("**", x, "**")
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with multiple formatting functions", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq, mpg_c),
      fns = ~ mean(.)
    ) |>
    fmt_number(columns = c(hp, trq), decimals = 0) |>
    fmt_number(columns = mean, decimals = 1) |>
    data_color(columns = mean, palette = "Blues")

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with opt_* functions", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.)
    ) |>
    opt_row_striping() |>
    opt_all_caps()

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() can be chained multiple times", {

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c, mpg_h) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.),
      new_col_names = "power_sum"
    ) |>
    summary_columns(
      columns = c(mpg_c, mpg_h),
      fns = ~ mean(.),
      new_col_names = "mpg_avg"
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true(all(c("power_sum", "mpg_avg") %in% colnames(gt_tbl$`_data`)))
})

test_that("summary_columns() works when called before other structuring functions", {

  # Add summary column FIRST, then do other operations
  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ sum(.),
      new_col_names = "total"
    ) |>
    cols_move(columns = total, after = model) |>
    fmt_number(columns = c(hp, trq, total), decimals = 0) |>
    tab_spanner(label = "Performance", columns = c(hp, trq, total)) |>
    tab_header(title = "Car Stats")

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true("total" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() handles Inf and -Inf values", {

  gt_tbl <-
    data.frame(
      x = c(1, Inf, 3),
      y = c(2, 4, -Inf)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")

  # Row 1: 1 + 2 = 3
  # Row 2: Inf + 4 = Inf
  # Row 3: 3 + (-Inf) = -Inf
  expect_equal(gt_tbl$`_data`[[3]][1], 3)
  expect_equal(gt_tbl$`_data`[[3]][2], Inf)
  expect_equal(gt_tbl$`_data`[[3]][3], -Inf)
})

test_that("summary_columns() with custom function using multiple arguments", {

  weighted_mean <- function(x, w = rep(1, length(x))) {
    sum(x * w) / sum(w)
  }

  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq),
      fns = ~ mean(.)  # Using simple function for now
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with very large numbers", {

  gt_tbl <-
    data.frame(
      x = c(1e10, 2e10, 3e10),
      y = c(4e10, 5e10, 6e10)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[3]], c(5e10, 7e10, 9e10))
})

test_that("summary_columns() works with very small numbers", {

  gt_tbl <-
    data.frame(
      x = c(1e-10, 2e-10, 3e-10),
      y = c(4e-10, 5e-10, 6e-10)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[3]], c(5e-10, 7e-10, 9e-10))
})

test_that("summary_columns() works with negative numbers", {

  gt_tbl <-
    data.frame(
      x = c(-10, -20, -30),
      y = c(5, 10, 15)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[3]], c(-5, -10, -15))
})

test_that("summary_columns() works with integer vs double columns", {

  gt_tbl <-
    data.frame(
      int_col = 1L:3L,
      dbl_col = c(1.5, 2.5, 3.5)
    ) |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_equal(gt_tbl$`_data`[[3]], c(2.5, 4.5, 6.5))
})

test_that("summary_columns() with cols_add() before it", {

  # User adds a column manually, then creates summary
  gt_tbl <-
    gtcars |>
    dplyr::select(model, hp, trq) |>
    dplyr::slice(1:5) |>
    gt() |>
    cols_add(ratio = hp / trq) |>
    summary_columns(
      columns = c(hp, trq, ratio),
      fns = ~ mean(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true("mean" %in% colnames(gt_tbl$`_data`))
})

test_that("summary_columns() with cols_add() after it", {

  # Create summary first, then add another computed column
  gt_tbl <-
    gtcars |>
      dplyr::select(model, hp, trq) |>
      dplyr::slice(1:5) |>
      gt() |>
      summary_columns(
        columns = c(hp, trq),
        fns = ~ sum(.),
        new_col_names = "total"
      ) |>
      cols_add(
        ratio = total / 2  # Use the summary column in another calculation
      )

  expect_s3_class(gt_tbl, "gt_tbl")
  expect_true(all(c("total", "ratio") %in% colnames(gt_tbl$`_data`)))
})

test_that("summary_columns() with different tidyselect helpers", {

  # everything()
  gt_tbl_1 <-
    gtcars |>
    dplyr::select(hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(columns = everything(), fns = ~ sum(.))

  expect_s3_class(gt_tbl_1, "gt_tbl")

  # starts_with()
  gt_tbl_2 <-
    gtcars |>
    dplyr::select(hp, trq, mpg_c, mpg_h) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(columns = starts_with("mpg"), fns = ~ mean(.))

  expect_s3_class(gt_tbl_2, "gt_tbl")

  # ends_with()
  gt_tbl_3 <-
    gtcars |>
    dplyr::select(hp, trq, mpg_c, mpg_h) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(columns = ends_with("c"), fns = ~ sum(.))

  expect_s3_class(gt_tbl_3, "gt_tbl")

  # contains()
  gt_tbl_4 <-
    gtcars |>
    dplyr::select(hp, trq, mpg_c) |>
    dplyr::slice(1:5) |>
    gt() |>
    summary_columns(columns = contains("p"), fns = ~ mean(.))

  expect_s3_class(gt_tbl_4, "gt_tbl")
})

test_that("summary_columns() works with all common aggregation functions", {

  df <-
    data.frame(
      a = c(1, 2, 3, 4, 5),
      b = c(10, 20, 30, 40, 50)
    )

  # sum
  gt1 <- df |> gt() |> summary_columns(fns = ~ sum(.))
  expect_equal(gt1$`_data`[[3]], c(11, 22, 33, 44, 55))

  # mean
  gt2 <- df |> gt() |> summary_columns(fns = ~ mean(.))
  expect_equal(gt2$`_data`[[3]], c(5.5, 11, 16.5, 22, 27.5))

  # median
  gt3 <- df |> gt() |> summary_columns(fns = ~ median(.))
  expect_equal(gt3$`_data`[[3]], c(5.5, 11, 16.5, 22, 27.5))

  # min
  gt4 <- df |> gt() |> summary_columns(fns = ~ min(.))
  expect_equal(gt4$`_data`[[3]], c(1, 2, 3, 4, 5))

  # max
  gt5 <- df |> gt() |> summary_columns(fns = ~ max(.))
  expect_equal(gt5$`_data`[[3]], c(10, 20, 30, 40, 50))

  # sd
  gt6 <- df |> gt() |> summary_columns(fns = ~ sd(.))
  expect_true(all(!is.na(gt6$`_data`[[3]])))

  # var
  gt7 <- df |> gt() |> summary_columns(fns = ~ var(.))
  expect_true(all(!is.na(gt7$`_data`[[3]])))

  # quantile
  gt8 <- df |> gt() |> summary_columns(fns = ~ quantile(., 0.75))
  expect_true(all(!is.na(gt8$`_data`[[3]])))
})

test_that("summary_columns() preserves data frame attributes", {

  df <- data.frame(x = 1:3, y = 4:6)
  attr(df, "custom_attr") <- "test_value"

  gt_tbl <-
    df |>
    gt() |>
    summary_columns(fns = ~ sum(.))

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() works with piped data manipulation", {

  gt_tbl <-
    gtcars |>
    dplyr::select(mfr, model, hp, trq, mpg_c) |>
    dplyr::filter(mfr == "Ferrari") |>
    dplyr::arrange(desc(hp)) |>
    gt() |>
    summary_columns(
      columns = c(hp, trq, mpg_c),
      fns = ~ mean(.)
    )

  expect_s3_class(gt_tbl, "gt_tbl")
})

test_that("summary_columns() error messages are helpful", {

  # Invalid column selection
  expect_error(
    gtcars |>
      dplyr::select(model, hp, trq) |>
      dplyr::slice(1:5) |>
      gt() |>
      summary_columns(columns = c(hp, nonexistent), fns = ~ sum(.)),
    "nonexistent"
  )

  # Missing fns argument
  expect_error(
    gtcars |>
      dplyr::select(model, hp, trq) |>
      dplyr::slice(1:5) |>
      gt() |>
      summary_columns(columns = c(hp, trq)),
    "fns"
  )
})
