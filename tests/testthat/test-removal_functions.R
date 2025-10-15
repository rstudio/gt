test_that("The different removal functions work correctly", {

  # Generate a table that will be used to check the effect of removals
  gt_tbl <-
    exibble |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = c("min", "max"),
      fmt = ~ fmt_number(., decimals = 2)
    ) |>
    grand_summary_rows(
      columns = currency,
      fns = total ~ sum(., na.rm = TRUE),
      fmt = ~ fmt_integer(.)
    ) |>
    tab_footnote(
      footnote = "This is a footnote.",
      locations = cells_body(columns = 1, rows = 1)
    ) |>
    tab_footnote(
      footnote = "This is a second footnote.",
      locations = cells_body(columns = 1, rows = 2)
    ) |>
    tab_source_note(source_note = "This is a source note.") |>
    tab_source_note(source_note = "This is a second source note.") |>
    tab_header(
      title = "The title of the table",
      subtitle = "The table's subtitle"
    ) |>
    tab_caption(caption = "This is a caption") |>
    tab_spanner(label = "Date and Time", columns = c(date, time, datetime)) |>
    tab_spanner(label = "Numbers", columns = c(num, currency), gather = FALSE) |>
    tab_spanner(label = "Words", columns = c(char, fctr)) |>
    tab_spanner(label = "Grand Spanner", columns = everything()) |>
    tab_stubhead(label = "A Stubhead Label")

  #
  # Use `rm_header()` to remove the table header
  #

  gt_tbl_2 <- gt_tbl |> rm_header()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_2 |> render_as_html())
  expect_snapshot_html(gt_tbl_2)

  #
  # Use `rm_stubhead()` to remove the stubhead label
  #

  gt_tbl_3 <- gt_tbl |> rm_stubhead()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_3 |> render_as_html())
  expect_snapshot_html(gt_tbl_3)

  #
  # Use `rm_spanners()` to remove the different spanners
  #

  gt_tbl_4a <- gt_tbl |> rm_spanners()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4a |> render_as_html())
  expect_snapshot_html(gt_tbl_4a)

  gt_tbl_4b <- gt_tbl |> rm_spanners(spanners = "Date and Time")
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4b |> render_as_html())
  expect_snapshot_html(gt_tbl_4b)

  gt_tbl_4c <- gt_tbl |> rm_spanners(spanners = "Numbers")
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4c |> render_as_html())
  expect_snapshot_html(gt_tbl_4c)

  gt_tbl_4d <- gt_tbl |> rm_spanners(spanners = "Words")
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4d |> render_as_html())
  expect_snapshot_html(gt_tbl_4d)

  gt_tbl_4e <- gt_tbl |> rm_spanners(spanners = "Grand Spanner")
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4e |> render_as_html())
  expect_snapshot_html(gt_tbl_4e)

  gt_tbl_4f <- gt_tbl |> rm_spanners(spanners = c("Date and Time", "Numbers", "Words"))
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4f |> render_as_html())
  expect_snapshot_html(gt_tbl_4f)

  gt_tbl_4g <- gt_tbl |> rm_spanners(levels = 1)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4g |> render_as_html())
  expect_snapshot_html(gt_tbl_4g)

  gt_tbl_4h <- gt_tbl |> rm_spanners(levels = 2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4h |> render_as_html())
  expect_snapshot_html(gt_tbl_4h)

  gt_tbl_4i <- gt_tbl |> rm_spanners(levels = 1:2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_4i |> render_as_html())
  expect_snapshot_html(gt_tbl_4i)

  #
  # Use `rm_footnotes()` to remove the different footnotes
  #

  gt_tbl_5a <- gt_tbl |> rm_footnotes()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_5a |> render_as_html())
  expect_snapshot_html(gt_tbl_5a)

  gt_tbl_5b <- gt_tbl |> rm_footnotes(footnotes = 2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_5b |> render_as_html())
  expect_snapshot_html(gt_tbl_5b)

  gt_tbl_5c <- gt_tbl |> rm_footnotes(footnotes = 1)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_5c |> render_as_html())
  expect_snapshot_html(gt_tbl_5c)

  gt_tbl_5d <- gt_tbl |> rm_footnotes(footnotes = 1:2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_5d |> render_as_html())
  expect_snapshot_html(gt_tbl_5d)

  #
  # Use `rm_source_notes()` to remove the different source notes
  #

  gt_tbl_6a <- gt_tbl |> rm_source_notes()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_6a |> render_as_html())
  expect_snapshot_html(gt_tbl_6a)

  gt_tbl_6b <- gt_tbl |> rm_source_notes(source_notes = 2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_6b |> render_as_html())
  expect_snapshot_html(gt_tbl_6b)

  gt_tbl_6c <- gt_tbl |> rm_source_notes(source_notes = 1)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_6c |> render_as_html())
  expect_snapshot_html(gt_tbl_6c)

  gt_tbl_6d <- gt_tbl |> rm_source_notes(source_notes = 1:2)
  expect_true(gt_tbl |> render_as_html() != gt_tbl_6d |> render_as_html())
  expect_snapshot_html(gt_tbl_6d)

  #
  # Use `rm_caption()` to remove the table caption
  #

  gt_tbl_7 <- gt_tbl |> rm_caption()
  expect_true(gt_tbl |> render_as_html() != gt_tbl_7 |> render_as_html())
  expect_snapshot_html(gt_tbl_7)
})
