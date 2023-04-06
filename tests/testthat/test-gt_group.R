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

  # Setting the option `.use_grp_opts` means that the internal
  # component of similar naming is set to that logical value
  # Create a `gt_group` object with `gt_group()`
  gt_tbls_3 <- gt_group(gt_tbl_1, gt_tbl_2, .use_grp_opts = TRUE)
  expect_true(gt_tbls_3[["use_grp_opts"]])
  gt_tbls_4 <- gt_group(gt_tbl_1, gt_tbl_2, .use_grp_opts = FALSE)
  expect_false(gt_tbls_4[["use_grp_opts"]])

  # Not setting it means it will be FALSE by default
  gt_tbls_5 <- gt_group(gt_tbl_1, gt_tbl_2)
  expect_false(gt_tbls_5[["use_grp_opts"]])

  # Expect specific components inside of a 'gt_group' object
  expect_equal(
    names(gt_tbls_1),
    c("gt_tbls", "gt_tbl_options", "use_grp_opts")
  )

  # Expect that the 'gt_tbls' and `gt_tbl_options` objects inside of
  # 'gt_group' are both tibbles
  expect_s3_class(gt_tbls_1[["gt_tbls"]], "tbl_df")
  expect_s3_class(gt_tbls_1[["gt_tbl_options"]], "tbl_df")
})

test_that("The `gt_pull()` function can be used extact a table from a group", {

  # Create two different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars)

  # Create a `gt_group` object with `gt_group()`
  gt_tbls_1 <- gt_group(gt_tbl_1, gt_tbl_2)

  # Expect that the `gt_tbls` object produced by `gt_group()`
  # has the 'gt_group' class
  expect_s3_class(gt_tbls_1, "gt_group")
  expect_type(gt_tbls_1, "list")

  # Pull the first table (based on `exibble`) from the group object
  # expect that the table pulled matches the first table added to the group
  gt_tbl_1_pulled <- grp_pull(gt_tbls_1, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  # Pull the second table (based on `gtcars`) from the group object
  # expect that the table pulled matches the second table added to the group
  gt_tbl_2_pulled <- grp_pull(gt_tbls_1, which = 2)
  expect_equal(gt_tbl_2, gt_tbl_2_pulled)


  # Create another `gt_group` object with `gt_group()`
  gt_tbls_2 <- gt_group(gt_tbl_1, gt_tbl_2, .use_grp_opts = TRUE)

  # Set some group options on the entire grouping of tables
  gt_tbls_2 <-
    gt_tbls_2 %>%
    grp_options(table.background.color = "lightgreen")

  # Pull the first table (based on `exibble`) from the group object and
  # expect that the table pulled has a background color of `"lightgreen"`;
  # this mirrors the `grp_options()` setting
  # Note that this value is the first in the `_options` table because any
  # modified (non-default) options are placed at the top of that table
  gt_tbl_1_pulled_2 <- grp_pull(gt_tbls_2, which = 1)
  expect_equal(gt_tbl_1_pulled_2[["_options"]][["value"]][[1]], "lightgreen")
  expect_equal(gt_tbl_1[["_options"]][["value"]][[7]], "#FFFFFF")

  # Pull the second table (based on `gtcars`) from the group object and
  # expect that the table pulled has the same background color
  gt_tbl_2_pulled_2 <- grp_pull(gt_tbls_2, which = 2)
  expect_equal(gt_tbl_2_pulled_2[["_options"]][["value"]][[1]], "lightgreen")
  expect_equal(gt_tbl_2[["_options"]][["value"]][[7]], "#FFFFFF")
})
