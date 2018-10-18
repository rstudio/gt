context("Ensuring that the `gt_preview()` function works as expected")

test_that("the `gt_preview()` function works correctly", {

  # Create a basic preview of the `mtcars` dataset
  gt_tbl <- gt_preview(mtcars)

  # Expect that the internal data frame (`data_df`) has
  # had rows removed
  expect_true(
    nrow(mtcars) > nrow(attr(gt_tbl, "data_df", exact = TRUE)))

  # Expect certain row names in `data_df`
  expect_equal(
    rownames(attr(gt_tbl, "data_df", exact = TRUE)),
    c("1", "2", "3", "4", "5", "6..31", "32"))

  # Expect empty strings in the ellipsis row (row `6` in this case)
  expect_equal(
    attr(gt_tbl, "data_df", exact = TRUE)[6, ] %>%
      unlist() %>%
      unname(),
    rep("", ncol(attr(gt_tbl, "data_df", exact = TRUE))))

  # Create a preview table with non-default `top_n` and `bottom_n` values
  gt_tbl <- gt_preview(mtcars, top_n = 10, bottom_n = 5)

  # Expect a preview of the `mtcars` dataset with different `top_n`
  # and `bottom_n` values will result in a different row names
  expect_equal(
    rownames(attr(gt_tbl, "data_df", exact = TRUE)),
    c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10",
      "11..27", "28", "29", "30", "31", "32"))

  # Expect empty strings in the ellipsis row (row `11` in this case)
  expect_equal(
    attr(gt_tbl, "data_df", exact = TRUE)[11, ] %>%
      unlist() %>%
      unname(),
    rep("", ncol(attr(gt_tbl, "data_df", exact = TRUE))))

  # Create a preview table with a 5-row version of `mtcars`
  gt_tbl <- gt_preview(mtcars[1:5, ])

  # Expect a preview of this shortened `mtcars` dataset won't
  # have an ellipsis row
  expect_equal(
    rownames(attr(gt_tbl, "data_df", exact = TRUE)),
    c("1", "2", "3", "4", "5"))

  # Expect no empty strings along the `mpg` column
  expect_equal(
    attr(gt_tbl, "data_df", exact = TRUE)$mpg,
    c(21.0, 21.0, 22.8, 21.4, 18.7))

  # Create a table that has `groupname` and `rowname` columns
  tbl <-
    dplyr::tribble(
      ~groupname, ~rowname, ~value,  ~value_2,
      "A",        "2",      184.3,   84.4,
      "A",        "3",      342.3,   126.3,
      "B",        "1",      190.9,   832.5,
      "B",        "2",      743.3,   281.2)

  # Create a preview table with the `tbl` table
  gt_tbl <- gt_preview(tbl)

  # Expect that columns named `rowname` or `groupname` will
  # gain a leading `.` to demote them from acting as magic columns
  expect_equal(
    colnames(attr(gt_tbl, "data_df", exact = TRUE)),
    c(".groupname", ".rowname", "value", "value_2"))

  # Create a preview table that doesn't include row numbers
  gt_tbl <- gt_preview(mtcars, incl_rownums = FALSE)

  # Expect a preview of the `mtcars` table won't have an ellipsis row
  expect_equal(
    rownames(attr(gt_tbl, "data_df", exact = TRUE)),
    c("1", "2", "3", "4", "5", "6..31", "32"))
})
