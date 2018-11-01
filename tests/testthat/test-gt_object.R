context("Ensuring that the `gt()` function works as expected")

test_that("a gt table object contains the correct components", {

  # Create a `gt_tbl` object with `gt()`
  tab <- gt(data = iris)

  expect_tab(tab, iris)

  expect_tab_colnames(
    tab, df = iris,
    rowname = "NA",
    groupname_is_na = TRUE)

})

test_that("a gt table can be made to use the rownames of a data frame", {

  # Create a `gt_tbl` object with `gt()` and use the
  # data frame's row names as row names in the stub
  tab <- gt(data = mtcars, rownames_to_stub = TRUE)

  expect_tab(tab, mtcars)

  expect_tab_colnames(
    tab, df = mtcars,
    rowname = "data_frame",
    groupname_is_na = TRUE)
})

test_that("a gt table can be made with the stub partially or fully populated", {

  # Create an input data frame with a `rowname` column
  # and a `value` column
  data_r <-
    data.frame(
      rowname = letters[1:10],
      value = 1:10,
      stringsAsFactors = FALSE)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_r` dataset
  tab <- gt(data = data_r)

  expect_tab(tab, data_r, has_rownames = TRUE)

  expect_tab_colnames(
    tab, df = data_r,
    rowname = "col",
    groupname_is_na = TRUE)

  # Create an input data frame with a `rowname` column,
  # a `groupname` column, and a `value` column
  data_rg <-
    data.frame(
      rowname = letters[1:10],
      groupname = c("A", "A", "A", "B", "B", "B", "C", "C", "D", "D"),
      value = 1:10,
      stringsAsFactors = FALSE)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_rg` dataset
  tab <- gt(data = data_rg)

  expect_tab(
    tab, data_rg, has_groupnames = TRUE, has_rownames = TRUE)

  expect_tab_colnames(
    tab, df = data_rg,
    rowname = "col",
    groupname_is_na = FALSE)
})
