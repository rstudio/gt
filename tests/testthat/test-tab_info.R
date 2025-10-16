test_that("tab_info() generates a gt table from a gt table", {

  expect_s3_class(
    exibble_minitest() |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(row_group_column = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(use_row_groups = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(use_row_labels = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(add_group_summaries = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(add_grand_summary = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(add_styles = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(add_footnotes = TRUE) |> tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(
      row_group_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE
    ) |>
      tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    exibble_minitest(
      add_group_summaries = TRUE,
      add_grand_summary = TRUE
    ) |>
      tab_info(),
    "gt_tbl"
  )

  expect_s3_class(
    dplyr::tibble(
      a = 1:5,
      b = c("one", "__**two**__", "three", "_four_", "five"),
      c = c("*A*", "**A**", "B", "B", "A")
    ) |>
      gt(rowname_col = "b", groupname_col = "c", process_md = TRUE) |>
      tab_info(),
    "gt_tbl"
  )
})
