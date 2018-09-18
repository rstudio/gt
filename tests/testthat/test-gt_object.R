context("test-gt_object.R")

test_that("a gt table object contains the correct components", {

  # Create a `gt_tbl` object with `gt()`
  tab <- gt(data = iris)

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
  expect_equal(dim(attr(tab, "boxh_df")), c(3, 5))
  expect_equal(dim(attr(tab, "stub_df")), c(150, 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(150, 1))
  expect_equal(dim(attr(tab, "cols_df")), c(5, 1))
  expect_equal(ncol(attr(tab, "opts_df")), 3)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has the same column
  # names as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    colnames(iris))

  # Expect that extracted df has the same column
  # classes as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    iris %>% as.data.frame() %>% sapply(class) %>% as.character())

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(iris))

  # Expect that the `rowname` column of the `stub_df`
  # object is entirely filled with NAs
  expect_true(
    all(is.na(attr(tab, "stub_df")[["rowname"]])))

  # Expect that the `groupname` column of the `stub_df`
  # object is entirely filled with NAs
  expect_true(
    all(is.na(attr(tab, "stub_df")[["groupname"]])))

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that the column names of the `boxh_df` object
  # are the same as those of the original dataset
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    colnames(iris))
})

test_that("a gt table can be made to use the rownames of a data frame", {

  # Create a `gt_tbl` object with `gt()` and use the
  # data frame's row names as row names in the stub
  tab <- gt(data = mtcars, rownames_to_stub = TRUE)

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
  expect_equal(dim(attr(tab, "boxh_df")), c(3, 11))
  expect_equal(dim(attr(tab, "stub_df")), c(32, 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(32, 1))
  expect_equal(dim(attr(tab, "cols_df")), c(11, 1))
  expect_equal(ncol(attr(tab, "opts_df")), 3)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has the same column
  # names as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    colnames(mtcars))

  # Expect that extracted df has the same column
  # classes as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    mtcars %>% as.data.frame() %>% sapply(class) %>% as.character())

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(mtcars))

  # Expect that the row names from the original dataset
  # populate the `rowname` column of the `stub_df` object
  expect_equal(
    attr(tab, "stub_df")[["rowname"]],
    rownames(mtcars))

  # Expect that the `groupname` column of the `stub_df`
  # object is entirely filled with NAs
  expect_true(
    all(is.na(attr(tab, "stub_df")[["groupname"]])))

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that the column names of the `boxh_df` object
  # are the same as those of the original dataset
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    colnames(mtcars))
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
  expect_equal(dim(attr(tab, "boxh_df")), c(3, 1))
  expect_equal(dim(attr(tab, "stub_df")), c(10, 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(10, 1))
  expect_equal(dim(attr(tab, "cols_df")), c(1, 1))
  expect_equal(ncol(attr(tab, "opts_df")), 3)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has one of the column
  # names in the original dataset (and doesn't
  # contain `rowname`)
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    "value")

  # Expect that extracted df has the same column
  # class in the one column remaining
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    "integer")

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(data_r))

  # Expect that the values from the `rowname` column in
  # the original dataset populate the `rowname` column
  # of the `stub_df` object
  expect_equal(
    attr(tab, "stub_df")[["rowname"]],
    data_r[["rowname"]])

  # Expect that the `groupname` column of the `stub_df`
  # object is entirely filled with NAs
  expect_true(
    all(is.na(attr(tab, "stub_df")[["groupname"]])))

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that `boxh_df` has one of the column
  # names in the original dataset (and doesn't
  # contain `rowname`)
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    "value")

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
  expect_equal(dim(attr(tab, "boxh_df")), c(3, 1))
  expect_equal(dim(attr(tab, "stub_df")), c(10, 2))
  expect_equal(dim(attr(tab, "footnotes_df")), c(0, 6))
  expect_equal(dim(attr(tab, "styles_df")), c(0, 6))
  expect_equal(dim(attr(tab, "rows_df")), c(10, 1))
  expect_equal(dim(attr(tab, "cols_df")), c(1, 1))
  expect_equal(ncol(attr(tab, "opts_df")), 3)
  expect_equal(length(attr(tab, "formats")), 0)
  expect_equal(length(attr(tab, "arrange_groups")), 1)

  # Expect that extracted df has one of the column
  # names in the original dataset (and doesn't
  # contain `rowname`)
  expect_equal(
    tab %>% as.data.frame() %>% colnames(),
    "value")

  # Expect that extracted df has the same column
  # class in the one column remaining
  expect_equal(
    tab %>% as.data.frame() %>% sapply(class) %>% as.character(),
    "integer")

  # Expect that extracted df has the same number of
  # rows as the original dataset
  expect_equal(
    tab %>% as.data.frame() %>% nrow(),
    nrow(data_rg))

  # Expect that the values from the `rowname` column in
  # the original dataset populate the `rowname` column
  # of the `stub_df` object
  expect_equal(
    attr(tab, "stub_df")[["rowname"]],
    data_rg[["rowname"]])

  # Expect that the values from the `groupname` column in
  # the original dataset populate the `groupname` column
  # of the `stub_df` object
  expect_equal(
    attr(tab, "stub_df")[["groupname"]],
    data_rg[["groupname"]])

  # Expect that the column names of the `stub_df` object
  # are `groupname` and `rowname`
  expect_equal(
    colnames(attr(tab, "stub_df")),
    c("groupname", "rowname"))

  # Expect that `boxh_df` has one of the column
  # names in the original dataset (and doesn't
  # contain `rowname` or `groupname`)
  expect_equal(
    colnames(attr(tab, "boxh_df")),
    "value")
})
