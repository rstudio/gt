context("test-gt_object.R")

test_that("an gt table object contains the correct components", {

  # Create an `gt_tbl` object with `gt()`
  tab <- gt(data = iris)

  # Expect that the object has 8 attributes
  expect_equal(
    length(attributes(tab)), 8)

  # Expect that the object has the correct classes
  expect_is(tab, c("gt_tbl", "data.frame"))

  # Expect certain named attributes
  expect_true(
    all(
      names(attributes(tab)) %in%
        c("names", "class", "row.names",
          "boxh_df", "stub_df",
          "fmts_df", "foot_df", "formats")))

  # Expect that the attribute obejcts are of certain classes
  expect_is(attr(tab, "boxh_df"), "data.frame")
  expect_is(attr(tab, "stub_df"), "data.frame")
  expect_is(attr(tab, "fmts_df"), "data.frame")
  expect_is(attr(tab, "foot_df"), "data.frame")
  expect_is(attr(tab, "formats"), "list")

  # Expect that the attribute objects are of the
  # correct dimensions
  expect_equal(dim(attr(tab, "boxh_df")), c(3, 5))
  expect_equal(dim(attr(tab, "stub_df")), c(150, 2))
  expect_equal(dim(attr(tab, "fmts_df")), c(150, 5))
  expect_equal(dim(attr(tab, "foot_df")), c(150, 5))
  expect_equal(length(attr(tab, "formats")), 0)

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
})
