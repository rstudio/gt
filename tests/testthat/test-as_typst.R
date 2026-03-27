test_that("as_typst() renders a bare Typst table by default for plain tables", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice(1:5) |>
    gt() |>
    as_typst()

  expect_match(typst_output, "^#table\\(")
  expect_no_match(typst_output, "#figure\\(")
  expect_no_match(typst_output, "#block\\[")
  expect_match(typst_output, "table.header\\(\\[mfr\\], \\[model\\], \\[msrp\\]\\)")
})

test_that("as_typst() uses figure for enriched tables in auto mode", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice(1:5) |>
    gt() |>
    tab_header(
      title = md("Data listing from **gtcars**"),
      subtitle = md("`gtcars` is an R dataset")
    ) |>
    as_typst()

  expect_match(typst_output, "^#figure\\(")
  expect_match(typst_output, "#table\\(")
  expect_match(typst_output, "\\[")
  expect_no_match(typst_output, "block\\[")
  expect_no_match(typst_output, "#align\\(center\\)\\[")
  expect_match(typst_output, "Data listing from \\*gtcars\\*")
  expect_match(typst_output, "`gtcars` is an R dataset")
  expect_no_match(typst_output, "\\[Data listing from \\*gtcars\\*\\]")
  expect_no_match(typst_output, "\\[`gtcars` is an R dataset\\]")
  expect_no_match(typst_output, "#strong\\[Data listing from")
  expect_no_match(typst_output, "#emph\\[`gtcars` is an R dataset\\]")
  expect_no_match(typst_output, "#linebreak\\(")
  expect_no_match(typst_output, "#parbreak\\(")
  expect_match(typst_output, "table.header\\(\\[mfr\\], \\[model\\], \\[msrp\\]\\)")
})

test_that("as_typst() uses figure for captions in auto mode", {

  typst_output <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    tab_caption(md("A **Typst** caption")) |>
    as_typst()

  expect_match(typst_output, "^#figure\\(")
  expect_match(typst_output, "kind: table")
  expect_match(typst_output, "caption: \\[A \\*Typst\\* caption\\]")
})

test_that("as_typst() container argument controls top-level structure", {

  gt_tbl <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    tab_caption("A Typst caption")

  expect_no_match(as_typst(gt_tbl, container = "table"), "#figure\\(")
  expect_match(
    as_typst(gt_tbl, container = "table"),
    "A Typst caption"
  )

  forced_figure <- as_typst(gt_tbl |> rm_caption(), container = "figure")
  expect_match(forced_figure, "^#figure\\(")
  expect_match(forced_figure, "kind: table")
})

test_that("as_typst() preserves notes and markdown-rich content", {

  typst_output <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    cols_label(
      num = md("**Number**"),
      char = md("`Character`")
    ) |>
    fmt_markdown(columns = char) |>
    tab_footnote(
      footnote = md("A **footnote**"),
      locations = cells_body(columns = time, rows = 2)
    ) |>
    tab_source_note(source_note = md("A _source_ note.")) |>
    as_typst()

  expect_match(typst_output, "\\[\\*Number\\*\\]")
  expect_match(typst_output, "\\[`Character`\\]")
  expect_match(typst_output, "#super\\[_1_\\]")
  expect_match(typst_output, "\\[1\\] A \\*footnote\\*")
  expect_match(typst_output, "A _source_ note\\.")
})

test_that("as_typst() escapes Typst-sensitive plain text in table content", {

  typst_output <-
    dplyr::tibble(
      item = c("cash", "@mention", "<tbl-x>"),
      value = c("$100", "#tag", "[x] * y")
    ) |>
    gt() |>
    cols_label(
      item = "item @ref",
      value = "value <tbl-y>"
    ) |>
    tab_header(
      title = "costs $100",
      subtitle = "@subtitle <tbl-z>"
    ) |>
    tab_caption("caption #1") |>
    tab_source_note("source uses `code`") |>
    as_typst()

  expect_true(grepl("costs \\$100", typst_output, fixed = TRUE))
  expect_true(grepl("\\@subtitle \\<tbl-z\\>", typst_output, fixed = TRUE))
  expect_true(grepl("caption \\#1", typst_output, fixed = TRUE))
  expect_true(grepl("[item \\@ref]", typst_output, fixed = TRUE))
  expect_true(grepl("[value \\<tbl-y\\>]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\$100]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\@mention]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\<tbl-x\\>]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\#tag]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\[x\\] \\* y]", typst_output, fixed = TRUE))
  expect_true(grepl("source uses \\`code\\`", typst_output, fixed = TRUE))
})

test_that("as_typst() renders spanners, row groups, and summaries", {

  gt_tbl <-
    exibble[1:5, c(1:3, 5:9)] |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_stubhead(label = "stubhead") |>
    tab_spanner(
      label = "heading",
      id = "a1",
      columns = 1:3
    ) |>
    summary_rows(
      fns = list(list(label = "Total", fn = "sum")),
      columns = c("num", "currency"),
      groups = "grp_a",
      fmt = ~ fmt_number(., use_seps = TRUE)
    ) |>
    grand_summary_rows(
      fns = list(list(label = "Grand total", fn = "sum")),
      columns = c("num", "currency"),
      fmt = ~ fmt_number(., use_seps = TRUE)
    )

  expect_snapshot_typst(gt_tbl)
})

test_that("gtsave() can write Typst output", {

  path <- tempfile(fileext = ".typ")

  gt_tbl <-
    exibble[1:2, c("num", "char")] |>
    gt()

  expect_no_error(gt_tbl |> gtsave(path))
  expect_match(paste(readLines(path, warn = FALSE), collapse = "\n"), "table\\(")
})
