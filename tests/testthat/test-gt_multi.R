test_that("The `gt_group()` function can be used to contain gt tables", {

  # Create two different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars)

  # Create a `gt_group` object with `gt_group()`
  gt_tbls_1 <- gt_group(gt_tbl_1, gt_tbl_2)

  # Expect that the `gt_tbls` object produced by `gt_group()`
  # has the 'gt_group' class
  expect_s3_class(gt_tbls_1, "gt_group")
  expect_type(gt_tbls_1, "list")

  # Expect that `gt_group()` can be used with a list of gt tables
  gt_tbls_2 <- gt_group(.list = list(gt_tbl_1, gt_tbl_2))

  # Expect that the `gt_group` objects are the same in both cases
  expect_equal(gt_tbls_1, gt_tbls_2)

  # Setting the option `.use_parent_opts` means that the internal
  # component of similar naming is set to that logical value
  # Create a `gt_group` object with `gt_group()`
  gt_tbls_3 <- gt_group(gt_tbl_1, gt_tbl_2, .use_parent_opts = TRUE)
  expect_true(gt_tbls_3[["use_parent_opts"]])
  gt_tbls_4 <- gt_group(gt_tbl_1, gt_tbl_2, .use_parent_opts = FALSE)
  expect_false(gt_tbls_4[["use_parent_opts"]])

  # Not setting it means it will be FALSE by default
  gt_tbls_5 <- gt_group(gt_tbl_1, gt_tbl_2)
  expect_false(gt_tbls_5[["use_parent_opts"]])

  # Expect specific components inside of a 'gt_group' object
  expect_equal(
    names(gt_tbls_1),
    c("gt_tbls", "gt_tbl_options", "use_parent_opts")
  )

  # Expect that the 'gt_tbls' and `gt_tbl_options` objects inside of
  # 'gt_group' are both tibbles
  expect_s3_class(gt_tbls_1[["gt_tbls"]], "tbl_df")
  expect_s3_class(gt_tbls_1[["gt_tbl_options"]], "tbl_df")
})
