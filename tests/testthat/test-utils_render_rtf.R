test_that("No error is created with gtsave() to rtf (#1233)", {

  rtf_file <- withr::local_tempfile(fileext = ".rtf")

  df <- data.frame(
    group = c("a", "a", "b", "b"),
    val = c(1, 2, 3, 4),
    char = c("AAA", "AAA", "BBB", "BBB")
  )

  a_gt <-
    df |>
    gt(groupname_col = "group") |>
    cols_label(
      val = "Value"
    ) |>
    summary_rows(
      columns = val,
      fns = "mean"
    ) |>
    grand_summary_rows(
      columns = val,
      fns = "mean"
    )

  expect_no_error(gtsave(a_gt, rtf_file))
})
