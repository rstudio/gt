test_that("tab_footnote produces helpful error messages (#475).", {
  # Create a table with footnotes in various cell types
  tbl <-
    dplyr::tribble(
      ~date,        ~rowname,  ~value_1,  ~value_2,
      "2018-02-10", "1",       20.4,      361.1,
      "2018-02-10", "2",       10.9,      743.3,
      "2018-02-10", "3",       34.6,      344.7,
      "2018-02-10", "4",        8.3,      342.3,
      "2018-02-11", "5",       28.3,      234.9,
      "2018-02-11", "6",       75.5,      190.9,
      "2018-02-11", "7",       63.1,        2.3,
      "2018-02-11", "8",       25.8,      184.3,
      "2018-02-11", "9",        5.2,      197.2,
      "2018-02-11", "10",      55.3,      284.6
    )

  start_gt <- gt(data = tbl, groupname_col = "date") %>%
    tab_spanner(
      label = "values",
      columns = starts_with("value")
    )

  expect_snapshot(
    error = TRUE, {
     start_gt %>%
        tab_footnote(
          footnote = "First data cell.",
          locations = cells_body(columns = "valuer", rows = 1)
        )
      start_gt %>%
        tab_footnote(
          footnote = "First data cell.",
          locations = cells_column_labels(columns = "valuer")
        )
      start_gt %>%
        tab_footnote(
          footnote = "First data cell.",
          locations = cells_column_spanners("valuer")
        )
      start_gt %>%
        tab_footnote(
          footnote = "First data cell.",
          locations = cells_column_spanners(3)
        )
    }
  )
})
