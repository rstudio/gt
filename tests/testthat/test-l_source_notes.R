test_that("A gt table contains the expected source note", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a source note
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    )

  # Expect that the source note will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_latex` object with `gt()`; this table
  # contains two source notes
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    ) %>%
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`."
    )

  # Expect that both source notes will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()
})
