context("Ensuring that the `gt()` function works as expected")

expect_tab_colnames <- function(tab,
                                df,
                                rowname = "NA",
                                groupname_is_na = TRUE) {

  if (rowname == "NA") {

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(attr(tab, "stub_df")[["rowname"]])))

  } else if (rowname == "col"){

    # Expect that the `rowname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_equal(
      attr(tab, "stub_df")[["rowname"]],
      df$rowname)

  } else if (rowname == "data_frame") {

    expect_equal(
      attr(tab, "stub_df")[["rowname"]],
      row.names(df))
  }

  if (groupname_is_na) {

    # Expect that the `groupname` column of the `stub_df`
    # object is entirely filled with NAs
    expect_true(
      all(is.na(attr(tab, "stub_df")[["groupname"]])))

  } else {

    # Expect that the values from the `groupname` column in
    # the original dataset populate the `groupname` column
    # of the `stub_df` object
    expect_equal(
      attr(tab, "stub_df")[["groupname"]],
      df[["groupname"]])
  }
}

expect_tab <- function(tab,
                       df,
                       has_rownames = FALSE,
                       has_groupnames = FALSE) {

  # Expect that the object has 14 attributes
  expect_equal(
    length(attributes(tab)), 14)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  expect_true(
    all(
      names(attributes(tab)) %in%
        c("names", "class", "row.names",
          "boxh_df", "stub_df", "footnotes_df", "styles_df",
          "rows_df", "cols_df", "arrange_groups", "data_df",
          "opts_df", "formats", "transforms")))

  # Expect that the attribute obejcts are of certain classes
  expect_is(attr(tab, "boxh_df"), "data.frame")
  expect_is(attr(tab, "stub_df"), "data.frame")
  expect_is(attr(tab, "footnotes_df"), "data.frame")
  expect_is(attr(tab, "styles_df"), "data.frame")
  expect_is(attr(tab, "rows_df"), "data.frame")
  expect_is(attr(tab, "cols_df"), "data.frame")
  expect_is(attr(tab, "opts_df"), "data.frame")
  expect_is(attr(tab, "arrange_groups"), "list")
  expect_is(attr(tab, "formats"), "list")

  # Expect that the attribute objects are of the
  # correct dimensions

  final_df <- df

  if (has_rownames) {
    final_df$rowname <- NULL
  }

  if (has_groupnames) {
    final_df$groupname <- NULL
  }

  expect_equal(dim(attr(tab, "boxh_df")), c(3, ncol(final_df)))
  expect_equal(dim(attr(tab, "stub_df")), c(nrow(df), 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(nrow(df), 1))
  expect_equal(dim(attr(tab, "cols_df")), c(ncol(final_df), 1))
  expect_equal(ncol(attr(tab, "opts_df")), 4)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has the same column
  # names as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    colnames(final_df))

  # Expect that extracted df has the same column
  # classes as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    final_df %>% as.data.frame() %>% sapply(class) %>% as.character())

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(df))

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that the column names of the `boxh_df` object
  # are the same as those of the original dataset
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    colnames(final_df))
}

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
