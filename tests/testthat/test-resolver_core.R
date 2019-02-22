context("Ensuring that the core resolver functions work as expected")

test_that("the `resolve_vars_idx()` function works correctly", {

  # Create a `tab` object with `gt()`
  tab <-
    exibble %>%
    gt()

  # Expect that passing in a single column name as a
  # string will return the correct column index position
  expect_equal(
    resolve_vars_idx(
      var_expr = "date",
      data = tab), 4)

  # Expect that passing in multiple column names as
  # strings will return the correct column index positions
  expect_equal(
    resolve_vars_idx(
      var_expr = c("fctr", "date", "row", "group"),
      data = tab), c(3, 4, 8, 9))

  # Expect that duplicate column names are disregarded
  # and that the column indices are always sorted
  expect_equal(
    resolve_vars_idx(
      var_expr = c("group", "row", "fctr", "date", "group", "date"),
      data = tab), c(3, 4, 8, 9))

  # Expect that using any column names that don't exist
  # in `data` will result in an error
  expect_error(
    resolve_vars_idx(
      var_expr = c("nums", "chars"),
      data = tab))

  # Expect that passing in a single column index as a
  # number will return the correct column index position
  expect_equal(
    resolve_vars_idx(
      var_expr = 2,
      data = tab), 2)

  # Expect that passing in a multiple column indices
  # as a numeric vector will return the correct
  # column index positions
  expect_equal(
    resolve_vars_idx(
      var_expr = c(1, 3, 4, 6),
      data = tab), c(1, 3, 4, 6))

  # Expect that duplicate column indices are disregarded
  # and that the column indices are always sorted
  expect_equal(
    resolve_vars_idx(
      var_expr = c(1, 6, 3, 4, 6, 1),
      data = tab), c(1, 3, 4, 6))

  # Expect that using any column indices that don't
  # exist in `data` will result in an error
  expect_error(
    resolve_vars_idx(
      var_expr = c(1, 3, 20),
      data = tab))

  # Expect that passing in `TRUE` will return
  # all of the column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = TRUE,
      data = tab), 1:9)

  # Expect that passing in `NULL` will return
  # all of the column indices (same effect as
  # providing `TRUE`)
  expect_equal(
    resolve_vars_idx(
      var_expr = NULL,
      data = tab), 1:9)

  # Expect that passing in `FALSE` will return
  # `integer(0)`
  expect_equal(
    resolve_vars_idx(
      var_expr = FALSE,
      data = tab), integer(0))

  # Expect that passing in a set of logical
  # values (equal in length to the number of
  # columns) will return those columns that
  # match on `TRUE`
  expect_equal(
    resolve_vars_idx(
      var_expr = c(
        TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, FALSE, FALSE),
      data = tab), c(1, 2, 3, 6, 7))

  # Expect that passing in a set of logical
  # values where the length is not one nor
  # equal in length to the number of
  # columns will result in an error
  expect_error(
    resolve_vars_idx(
      var_expr = c(
        TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE),
      data = tab))

  # Expect that passing in a single column name
  # in `vars()` will return the correct column index position
  expect_equal(
    resolve_vars_idx(
      var_expr = vars(date),
      data = tab), 4)

  # Expect that passing in multiple column names
  # inside `vars()` will return the correct column
  # index positions
  expect_equal(
    resolve_vars_idx(
      var_expr = vars(fctr, date, row, group),
      data = tab), c(3, 4, 8, 9))

  # Expect that duplicate column names inside `vars()`
  # are disregarded and that the column indices are
  # always sorted
  expect_equal(
    resolve_vars_idx(
      var_expr = vars(group, row, fctr, date, group, date),
      data = tab), c(3, 4, 8, 9))

  # Expect that using any column names within `vars()`
  # that don't exist in `data` will result in an error
  expect_error(
    resolve_vars_idx(
      var_expr = vars(nums, chars),
      data = tab))

  # Expect that the select helper `starts_with()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = starts_with("n"),
      data = tab), 1)

  # Expect that the select helper `ends_with()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = ends_with("e"),
      data = tab), c(4, 5, 6))

  # Expect that the select helper `contains()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = contains("t"),
      data = tab), c(3, 4, 5, 6))

  # Expect that the select helper `matches()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = matches("et"),
      data = tab), 6)

  # Expect that the select helper `one_of()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = one_of(c("date", "time")),
      data = tab), c(4, 5))

  # Expect that the select helper `everything()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = everything(),
      data = tab), 1:9)

  # Expect that the select helper `last_col()`
  # returns the expected column indices
  expect_equal(
    resolve_vars_idx(
      var_expr = last_col(offset = 1),
      data = tab), 8)
})

test_that("the `resolve_data_vals_idx()` function works correctly", {

  # Create a `tab` object with `gt()`
  tab <-
    exibble %>%
    gt(
      groupname_col = "group",
      rowname_col = "row"
    )

  # Get the rownames from the `tab` gt object
  tab_rownames <- attr(tab, "stub_df", exact = TRUE)$rowname

  # Expect that passing in a single row name as a
  # string will return the correct row index position
  expect_equal(
    resolve_data_vals_idx(
      var_expr = "row_4",
      data = tab,
      vals = tab_rownames), 4)

  # Expect that passing in multiple row names in a
  # vector will return the correct row index positions
  expect_equal(
    resolve_data_vals_idx(
      var_expr = c("row_4", "row_5", "row_6"),
      data = tab,
      vals = tab_rownames), c(4, 5, 6))

  # Expect that duplicate row names are disregarded
  # and that the row indices are always sorted
  expect_equal(
    resolve_data_vals_idx(
      var_expr = c("row_6", "row_4", "row_5", "row_4", "row_4"),
      data = tab,
      vals = tab_rownames), c(4, 5, 6))

  # Expect that using any row names that don't exist
  # in `data` will result in an error
  expect_error(
    resolve_data_vals_idx(
      var_expr = c("row_5", "row_6", "row_20"),
      data = tab,
      vals = tab_rownames))

  # Expect that passing in a single row index as a
  # number will return the correct row index position
  expect_equal(
    resolve_data_vals_idx(
      var_expr = 8,
      data = tab,
      vals = tab_rownames), 8)

  # Expect that passing in a multiple row indices
  # as a numeric vector will return the correct
  # row index positions
  expect_equal(
    resolve_data_vals_idx(
      var_expr = c(1, 3, 4, 6),
      data = tab,
      vals = tab_rownames), c(1, 3, 4, 6))


  # Expect that duplicate row indices are disregarded
  # and that the row indices are always sorted
  expect_equal(
    resolve_data_vals_idx(
      var_expr = c(1, 6, 3, 4, 6, 1),
      data = tab,
      vals = tab_rownames), c(1, 3, 4, 6))

  # Expect that using any row indices that don't
  # exist in `data` will result in an error
  expect_error(
    resolve_data_vals_idx(
      var_expr = c(1, 3, 20),
      data = tab,
      vals = tab_rownames))

  # Expect that passing in `TRUE` will return
  # all of the row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = TRUE,
      data = tab,
      vals = tab_rownames), 1:8)

  # Expect that passing in `NULL` will return
  # all of the row indices (same effect as
  # providing `TRUE`)
  expect_equal(
    resolve_data_vals_idx(
      var_expr = NULL,
      data = tab,
      vals = tab_rownames), 1:8)

  # Expect that passing in `FALSE` will return
  # `integer(0)`
  expect_equal(
    resolve_data_vals_idx(
      var_expr = FALSE,
      data = tab,
      vals = tab_rownames), integer(0))

  # Expect that passing in a set of logical
  # values (equal in length to the number of
  # rows) will return those rows that
  # match on `TRUE`
  expect_equal(
    resolve_data_vals_idx(
      var_expr = c(
        TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, FALSE),
      data = tab,
      vals = tab_rownames), c(1, 2, 3, 6, 7))

  # Expect that passing in a set of logical
  # values where the length is not one nor
  # equal in length to the number of
  # rows will result in an error
  expect_error(
    resolve_data_vals_idx(
      var_expr = c(
        TRUE, TRUE, TRUE, FALSE, FALSE,
        TRUE, TRUE, FALSE, FALSE),
      data = tab,
      vals = tab_rownames))

  # Expect that passing in a single row name
  # in `vars()` will return the correct row index position
  expect_equal(
    resolve_data_vals_idx(
      var_expr = vars(row_2),
      data = tab,
      vals = tab_rownames), 2)

  # Expect that passing in multiple row names
  # inside `vars()` will return the correct row
  # index positions
  expect_equal(
    resolve_data_vals_idx(
      var_expr = vars(row_1, row_3, row_5),
      data = tab,
      vals = tab_rownames), c(1, 3, 5))

  # Expect that duplicate row names inside `vars()`
  # are disregarded and that the row indices are
  # always sorted
  expect_equal(
    resolve_data_vals_idx(
      var_expr = vars(row_6, row_1, row_3, row_3),
      data = tab,
      vals = tab_rownames), c(1, 3, 6))

  # Expect that using any row names within `vars()`
  # that don't exist in `data` will result in an error
  expect_error(
    resolve_data_vals_idx(
      var_expr = vars(row_1, row_20),
      data = tab,
      vals = tab_rownames))

  # Expect that the select helper `starts_with()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = starts_with("r"),
      data = tab,
      vals = tab_rownames), 1:8)

  # Expect that the select helper `ends_with()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = ends_with("5"),
      data = tab,
      vals = tab_rownames), 5)

  # Expect that the select helper `contains()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = contains("ow"),
      data = tab,
      vals = tab_rownames), 1:8)

  # Expect that the select helper `matches()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = matches(".*ow.[1-5]"),
      data = tab,
      vals = tab_rownames), 1:5)

  # Expect that the select helper `one_of()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = one_of(c("row_3", "row_5")),
      data = tab,
      vals = tab_rownames), c(3, 5))

  # Expect that the select helper `everything()`
  # returns the expected row indices
  expect_equal(
    resolve_data_vals_idx(
      var_expr = everything(),
      data = tab,
      vals = tab_rownames), 1:8)

  # Expect that the select helper `last_col()`
  # returns the expected row index
  expect_equal(
    resolve_data_vals_idx(
      var_expr = last_col(offset = 1),
      data = tab,
      vals = tab_rownames), 7)
})
