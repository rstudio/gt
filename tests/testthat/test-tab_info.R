exibble_minitest <- function(
    row_group_column = FALSE,
    use_row_groups = FALSE,
    use_row_labels = FALSE,
    add_group_summaries = FALSE,
    add_grand_summary = FALSE,
    add_styles = FALSE,
    add_footnotes = FALSE
) {

  if (add_group_summaries) use_row_groups <- TRUE

  tbl <-
    exibble %>%
    gt(
      rowname_col = if (use_row_labels) "row" else NULL,
      groupname_col = if (use_row_groups) "group" else NULL
    ) %>%
    tab_options(row_group.as_column = row_group_column) %>%
    tab_header(
      title = md("Data listing from **exibble**"),
      subtitle = md("`exibble` is an R dataset")
    ) %>%
    tab_stubhead("S.L.") %>%
    tab_spanner(label = "timing", columns = c(date, time, datetime)) %>%
    tab_source_note("Source note #1") %>%
    tab_source_note("Source note #2")

  if (add_group_summaries) {

    tbl <-
      tbl %>%
      summary_rows(
        groups = everything(),
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  if (add_grand_summary) {

    tbl <-
      tbl %>%
      grand_summary_rows(
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  tbl
}

test_that("The `tab_info()` function generates a gt table from a gt table", {

  expect_true(
    exibble_minitest() %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(row_group_column = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(use_row_groups = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(use_row_labels = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(add_group_summaries = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(add_grand_summary = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(add_styles = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(add_footnotes = TRUE) %>% tab_info() %>% is_gt_tbl()
  )
  expect_true(
    exibble_minitest(
      row_group_column = TRUE,
      use_row_groups = TRUE,
      use_row_labels = TRUE
    ) %>%
      tab_info() %>%
      is_gt_tbl()
  )
  expect_true(
    exibble_minitest(
      add_group_summaries = TRUE,
      add_grand_summary = TRUE
    ) %>%
      tab_info() %>%
      is_gt_tbl()
  )

  expect_true(
    dplyr::tibble(
      a = 1:5,
      b = c("one", "__**two**__", "three", "_four_", "five"),
      c = c("*A*", "**A**", "B", "B", "A")
    ) %>%
      gt(rowname_col = "b", groupname_col = "c", process_md = TRUE) %>%
      tab_info() %>%
      is_gt_tbl()
  )
})
