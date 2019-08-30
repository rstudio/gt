context("Ensuring that the `gt()` function works as expected")

test_that("a gt table object contains the correct components", {

  # Create a `gt_tbl` object with `gt()`
  tab <- gt(data = iris)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, iris)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = iris,
    rowname = "NA",
    groupname_is_na = TRUE
  )

  # Create a `gt_tbl` object with `gt()` and a
  # grouped version of the `iris` dataset
  tab <- gt(data = iris %>% dplyr::group_by(Species))

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, df = iris %>% dplyr::group_by(Species))
})

test_that("a gt table can be made to use the rownames of a data frame", {

  # Create a `gt_tbl` object with `gt()` and use the
  # data frame's row names as row names in the stub
  tab <- gt(data = mtcars, rownames_to_stub = TRUE)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, mtcars)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = mtcars,
    rowname = "tibble",
    groupname_is_na = TRUE
  )
})

test_that("a gt table can be made with the stub partially or fully populated", {

  # Create an input data frame with a `rowname` column
  # and a `value` column
  data_r <-
    data.frame(
      rowname = letters[1:10],
      value = 1:10,
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_r` dataset
  tab <- gt(data = data_r)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  # expect_tab(tab, data_r, has_rownames = TRUE)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = data_r,
    rowname = "col",
    groupname_is_na = TRUE
  )

  # Create an input data frame with a `rowname` column,
  # a `groupname` column, and a `value` column
  data_rg <-
    data.frame(
      rowname = letters[1:10],
      groupname = c("A", "A", "A", "B", "B", "B", "C", "C", "D", "D"),
      value = 1:10,
      stringsAsFactors = FALSE
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_rg` dataset
  tab <- gt(data = data_rg)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, data_rg, has_groupnames = TRUE, has_rownames = TRUE)

  # Expect that the `stub_df` data frame is correctly
  # formed given the input rownames and groupnames
  expect_tab_colnames(
    tab, df = data_rg,
    rowname = "col",
    groupname_is_na = FALSE
  )
})

test_that("a gt table can be made from a table with no rows", {

  # Create an input data frame based on the exibble
  # dataset, except with no rows
  data_e <- exibble %>% head(0)

  # Create a `gt_tbl` object with `gt()` and the
  # `data_e` dataset
  tab <- gt(data = data_e)

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, data_e)

  # Expect that the `stub_df` data frame is empty
  attr(tab, "stub_df") %>%
    nrow() %>%
    expect_equal(0)

  # Create a `gt_tbl` object with `gt()` and a
  # grouped version of the `data_e` dataset
  tab <- gt(data = data_e %>% dplyr::group_by(group))

  # Expect that the `gt_tbl` object has all of the
  # usual components and that they have all of the
  # expected dimensions and features
  #expect_tab(tab, df = data_e %>% dplyr::group_by(group))
})
