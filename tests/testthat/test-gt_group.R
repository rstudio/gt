test_that("gt_group() can be used to contain gt tables", {

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
  expect_named(
    gt_tbls_1,
    c("gt_tbls", "gt_tbl_options", "use_grp_opts")
  )

  # Expect that the 'gt_tbls' and `gt_tbl_options` objects inside of
  # 'gt_group' are both tibbles
  expect_s3_class(gt_tbls_1[["gt_tbls"]], "tbl_df")
  expect_s3_class(gt_tbls_1[["gt_tbl_options"]], "tbl_df")
})

test_that("grp_pull() can be used to extract a table from a group", {

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
    gt_tbls_2 |>
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

test_that("grp_add() can be used to add a table to a group", {

  # Create three different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars)
  gt_tbl_3 <- gt(towny)
  gt_tbl_4 <- gt(metro)

  # Create an empty table group
  gt_tbls_1 <- gt_group()

  # Verify that the table group has no gt tables
  expect_equal(nrow(gt_tbls_1[["gt_tbls"]]), 0)

  # Expect that adding nothing via `grp_add()` doesn't error but also
  # it doesn't change the `gt_tbls_1` object
  expect_no_error(gt_tbls_1 |> grp_add())
  expect_equal(gt_tbls_1, gt_tbls_1 |> grp_add())

  # Add a table to the empty table group; expect that the table group
  # contains a single gt table
  gt_tbls_1 <-
    gt_tbls_1 |>
    grp_add(gt_tbl_1)

  expect_equal(nrow(gt_tbls_1[["gt_tbls"]]), 1)

  # Pull the table (based on `exibble`) from the group object and
  # expect that the table pulled matches the table added to the group
  gt_tbl_1_pulled <- grp_pull(gt_tbls_1, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)
  expect_equal(nrow(gt_tbls_1[["gt_tbls"]]), 1)
  expect_s3_class(gt_tbls_1[["gt_tbls"]][["gt_tbl"]][[1]], "gt_tbl")

  # Add a second table to the table group; expect that the table group now
  # contains two gt tables
  gt_tbls_2 <-
    gt_tbls_1 |>
    grp_add(gt_tbl_2)

  expect_equal(nrow(gt_tbls_2[["gt_tbls"]]), 2)
  expect_s3_class(gt_tbls_2[["gt_tbls"]][["gt_tbl"]][[1]], "gt_tbl")
  expect_s3_class(gt_tbls_2[["gt_tbls"]][["gt_tbl"]][[2]], "gt_tbl")

  # Pull both tables (first is based on `exibble`, the second on `gtcars`)
  # from the group object and expect that second table added was added to the
  # end of the table series
  gt_tbl_1_pulled <- grp_pull(gt_tbls_2, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_2, which = 2)
  expect_equal(gt_tbl_2, gt_tbl_2_pulled)

  # Add a third table to the table group, but use the `.before` argument to
  # insert it at the beginning; expect that the table group now contains
  # three gt tables
  gt_tbls_3 <-
    gt_tbls_2 |>
    grp_add(gt_tbl_3, .before = 1)

  expect_equal(nrow(gt_tbls_3[["gt_tbls"]]), 3)
  expect_s3_class(gt_tbls_3[["gt_tbls"]][["gt_tbl"]][[1]], "gt_tbl")
  expect_s3_class(gt_tbls_3[["gt_tbls"]][["gt_tbl"]][[2]], "gt_tbl")
  expect_s3_class(gt_tbls_3[["gt_tbls"]][["gt_tbl"]][[3]], "gt_tbl")

  # Pull all three tables, this is the expected ordering:
  # 1. based on `towny` (`gt_tbl_3`)
  # 2. based on `exibble` (`gt_tbl_1`)
  # 3. based on `gtcars` (`gt_tbl_2`)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_3, which = 1)
  expect_equal(gt_tbl_3, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_3, which = 2)
  expect_equal(gt_tbl_1, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_3, which = 3)
  expect_equal(gt_tbl_2, gt_tbl_3_pulled)

  # Add a fourth table to the table group, but use the `.after` argument to
  # insert it at second position; expect that the table group now contains
  # four gt tables
  gt_tbls_4 <-
    gt_tbls_3 |>
    grp_add(gt_tbl_4, .after = 1)

  expect_equal(nrow(gt_tbls_4[["gt_tbls"]]), 4)
  expect_s3_class(gt_tbls_4[["gt_tbls"]][["gt_tbl"]][[1]], "gt_tbl")
  expect_s3_class(gt_tbls_4[["gt_tbls"]][["gt_tbl"]][[2]], "gt_tbl")
  expect_s3_class(gt_tbls_4[["gt_tbls"]][["gt_tbl"]][[3]], "gt_tbl")
  expect_s3_class(gt_tbls_4[["gt_tbls"]][["gt_tbl"]][[4]], "gt_tbl")

  # Pull all four tables, this is the expected ordering:
  # 1. based on `towny` (`gt_tbl_3`)
  # 2. based on `metro` (`gt_tbl_4`)
  # 3. based on `exibble` (`gt_tbl_1`)
  # 4. based on `gtcars` (`gt_tbl_2`)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_4, which = 1)
  expect_equal(gt_tbl_3, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_4, which = 2)
  expect_equal(gt_tbl_4, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_4, which = 3)
  expect_equal(gt_tbl_1, gt_tbl_3_pulled)

  gt_tbl_4_pulled <- grp_pull(gt_tbls_4, which = 4)
  expect_equal(gt_tbl_2, gt_tbl_4_pulled)

  # Expect the `grp_add()` to stop if both the `.before`
  # and `.after` arguments contain an index
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 2, .before = 3))

  # Expect the `grp_add()` to stop if either the `.before`
  # or `.after` values are not valid indices
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 0))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 1))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 2))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 3))
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 4))
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = -1))

  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 0))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 1))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 2))
  expect_no_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 3))
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 4))
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = -1))

  # Expect the `grp_add()` to stop if either the `.before`
  # or `.after` values are not integer-like
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .after = 2.01))
  expect_error(gt_tbls_3 |> grp_add(gt_tbl_4, .before = 2.99))
})

test_that("grp_replace() can be used to add a table to a group", {

  # Create four different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars)
  gt_tbl_3 <- gt(towny)
  gt_tbl_4 <- gt(metro)

  # Create a table group with the first three tables within it
  gt_tbls_1 <- gt_group(gt_tbl_1, gt_tbl_2, gt_tbl_3)

  # Expect that the three tables are in the expected order
  gt_tbl_1_pulled <- grp_pull(gt_tbls_1, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_1, which = 2)
  expect_equal(gt_tbl_2, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_1, which = 3)
  expect_equal(gt_tbl_3, gt_tbl_3_pulled)

  # Replace the first table with `gt_tbl_4`
  gt_tbls_2 <-
    gt_tbls_1 |>
    grp_replace(gt_tbl_4, .which = 1)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_2, which = 1)
  expect_equal(gt_tbl_4, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_2, which = 2)
  expect_equal(gt_tbl_2, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_2, which = 3)
  expect_equal(gt_tbl_3, gt_tbl_3_pulled)

  # Replace the second table with `gt_tbl_4`
  gt_tbls_3 <-
    gt_tbls_2 |>
    grp_replace(gt_tbl_4, .which = 2)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_3, which = 1)
  expect_equal(gt_tbl_4, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_3, which = 2)
  expect_equal(gt_tbl_4, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_3, which = 3)
  expect_equal(gt_tbl_3, gt_tbl_3_pulled)

  # Replace the third table with `gt_tbl_4`
  gt_tbls_4 <-
    gt_tbls_3 |>
    grp_replace(gt_tbl_4, .which = 3)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_4, which = 1)
  expect_equal(gt_tbl_4, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_4, which = 2)
  expect_equal(gt_tbl_4, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_4, which = 3)
  expect_equal(gt_tbl_4, gt_tbl_3_pulled)

  # Replace the all tables with `gt_tbl_1`
  gt_tbls_5 <-
    gt_tbls_4 |>
    grp_replace(gt_tbl_1, gt_tbl_1, gt_tbl_1, .which = 1:3)

  gt_tbl_1_pulled <- grp_pull(gt_tbls_5, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_5, which = 2)
  expect_equal(gt_tbl_1, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_5, which = 3)
  expect_equal(gt_tbl_1, gt_tbl_3_pulled)

  # Expect function to stop if no data is supplied
  expect_error(gt_tbls_5 |> grp_replace())

  # Expect function to stop if an invalid index is supplied
  expect_error(gt_tbls_5 |> grp_replace(gt_tbl_1, .which = 4))

  # Expect function to stop if number of indices doesn't match the
  # number of tables to replace
  expect_error(gt_tbls_5 |> grp_replace(gt_tbl_2, .which = 1:2))
  expect_error(gt_tbls_5 |> grp_replace(gt_tbl_3, .which = 2:3))
  expect_error(gt_tbls_5 |> grp_replace(gt_tbl_1, gt_tbl_2, .which = 1))
  expect_error(gt_tbls_5 |> grp_replace(gt_tbl_1, gt_tbl_1, .which = 1:3))
})

test_that("grp_rm() can be used to remove a table from a group", {

  # Create three different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars)
  gt_tbl_3 <- gt(towny)

  # Create a table group with all these tables within it
  gt_tbls_1 <- gt_group(gt_tbl_1, gt_tbl_2, gt_tbl_3)

  # Expect that the three tables are in the expected order
  gt_tbl_1_pulled <- grp_pull(gt_tbls_1, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_1, which = 2)
  expect_equal(gt_tbl_2, gt_tbl_2_pulled)

  gt_tbl_3_pulled <- grp_pull(gt_tbls_1, which = 3)
  expect_equal(gt_tbl_3, gt_tbl_3_pulled)

  # Remove the second table from the group with `grp_rm()`; expect that the
  # table group now contains two gt tables
  gt_tbls_2 <-
    gt_tbls_1 |>
    grp_rm(which = 2)

  expect_equal(nrow(gt_tbls_2[["gt_tbls"]]), 2)

  # Expect that the indices have been reset (these are in the `i` column
  # of the `gt_tbls` list component)
  expect_equal(gt_tbls_2$gt_tbls$i, 1:2)

  # Expect that the two tables left are the previous first and last tables
  gt_tbl_1_pulled <- grp_pull(gt_tbls_2, which = 1)
  expect_equal(gt_tbl_1, gt_tbl_1_pulled)

  gt_tbl_2_pulled <- grp_pull(gt_tbls_2, which = 2)
  expect_equal(gt_tbl_3, gt_tbl_2_pulled)

  # Remove the first table from the group with `grp_rm()`; expect that the
  # table group now contains a single gt table
  gt_tbls_3 <-
    gt_tbls_2 |>
    grp_rm(which = 1)

  expect_equal(nrow(gt_tbls_3[["gt_tbls"]]), 1)

  # Expect that the indices have been reset (these are in the `i` column
  # of the `gt_tbls` list component)
  expect_equal(gt_tbls_3$gt_tbls$i, 1)

  # Expect that the remaining table is the previous last table
  gt_tbl_1_pulled <- grp_pull(gt_tbls_3, which = 1)
  expect_equal(gt_tbl_3, gt_tbl_1_pulled)
})

test_that("grp_options() can be used to set options for a group", {

  # Create two different `gt_tbl` table objects
  gt_tbl_1 <- gt(exibble)
  gt_tbl_2 <- gt(gtcars[1:8, ])

  # Create a `gt_group` object with `gt_group()`; ensure that this group
  # utilizes the options
  gt_tbls_1 <- gt_group(gt_tbl_1, gt_tbl_2, .use_grp_opts = TRUE)

  # Set several group options that apply to the tables
  gt_tbls_2 <-
    gt_tbls_1 |>
    grp_options(
      table.width = px(1100),
      table.background.color = "gray95", table.font.color = "gray10"
    )

  # Expect the default text and background colors for the input gt tables
  expect_match_raw_html(
    gt_tbl_1, "<table .* color: #333333;.*?bgcolor=\"#FFFFFF\">",
  )

  expect_match_raw_html(
    gt_tbl_2, "<table .* color: #333333;.*?bgcolor=\"#FFFFFF\">",
  )

  # Pull out the individual tables
  gt_tbl_1_alt <- gt_tbls_2 |> grp_pull(which = 1)
  gt_tbl_2_alt <- gt_tbls_2 |> grp_pull(which = 2)

  # Expect the changed text and background colors for the input gt tables
  # that were pulled from the group that had group options applied (and
  # activated via `.use_grp_opts = TRUE`)
  expect_match_raw_html(
    gt_tbl_1_alt, "<table .* color: #1A1A1A;.*?bgcolor=\"#F2F2F2\">"
  )
  expect_match_raw_html(
    gt_tbl_2_alt, "<table .* color: #1A1A1A;.*?bgcolor=\"#F2F2F2\">"
  )
})
