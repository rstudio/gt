test_that("as_typst() renders tables with table or figure containers", {

  plain_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice(1:5) |>
    gt() |>
    as_typst()

  expect_match(plain_output, "table\\(")
  expect_no_match(plain_output, "#figure\\(")
  expect_match(plain_output, "table.header\\(")

  enriched_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice(1:5) |>
    gt() |>
    tab_header(
      title = md("Data listing from **gtcars**"),
      subtitle = md("`gtcars` is an R dataset")
    ) |>
    tab_caption(md("A **Typst** caption")) |>
    as_typst()

  expect_match(enriched_output, "^#figure\\(")
  expect_match(enriched_output, "kind: table")
  expect_match(enriched_output, "caption: \\[A \\*Typst\\* caption\\]")
  expect_match(enriched_output, "stack\\(dir: ttb, spacing: 0\\.35em")
})

test_that("as_typst() respects the container option", {

  gt_tbl <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    tab_caption("A Typst caption") |>
    tab_footnote(
      footnote = "Footnote",
      locations = cells_body(columns = num, rows = 1)
    ) |>
    tab_source_note("Source note")

  expect_warning(
    table_only <- as_typst(gt_tbl, container = "table"),
    "Auxiliary Typst table content is dropped when `container = \"table\"`."
  )
  expect_match(table_only, "table\\(")
  expect_no_match(table_only, "#figure\\(")
  expect_no_match(table_only, "Title|Subtitle|A Typst caption|Footnote|Source note")

  forced_figure <- as_typst(gt_tbl |> rm_caption(), container = "figure")
  expect_match(forced_figure, "^#figure\\(")
  expect_match(forced_figure, "kind: table")
})

test_that("as_typst() supports labels and breakable figures", {

  auto_labeled <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "demo_table") |>
    as_typst(label = TRUE)

  expect_match(auto_labeled, "<demo_table>$")
  expect_no_match(auto_labeled, "<TRUE>$")

  explicit_labeled <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    as_typst(label = "custom-label")

  expect_match(explicit_labeled, "<custom-label>$")
  expect_no_match(
    exibble[1:2, c("num", "char")] |> gt(id = "x") |> as_typst(label = FALSE),
    "<x>$"
  )

  breakable_output <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "long_demo") |>
    tab_caption("Captioned table") |>
    as_typst(breakable = TRUE)

  expect_match(breakable_output, "^#\\{")
  expect_match(
    breakable_output,
    "show figure\\.where\\(kind: table\\): set block\\(breakable: true\\)"
  )
  expect_match(breakable_output, "<long_demo>")
  expect_no_match(breakable_output, "<long_demo>$")

  skip_if(Sys.which("typst") == "")

  figure_labeled <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "demo_table") |>
    tab_caption("Caption") |>
    as_typst(label = TRUE)

  typ_path <- tempfile(fileext = ".typ")
  pdf_path <- sub("\\.typ$", ".pdf", typ_path)

  writeLines(
    c(
      "See @demo_table.",
      "",
      figure_labeled
    ),
    typ_path,
    useBytes = TRUE
  )

  compile_out <-
    system2(
      Sys.which("typst"),
      c("compile", typ_path, pdf_path),
      stdout = TRUE,
      stderr = TRUE
    )

  expect_null(attr(compile_out, "status"))
  expect_true(file.exists(pdf_path))
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

test_that("as_typst() renders a simple plain table", {

  gt_tbl <-
    exibble[1:2, c("num", "char")] |>
    gt()

  expect_snapshot_typst(gt_tbl)
})

test_that("as_typst() renders a styled figure table", {

  gt_tbl <-
    exibble[1:5, c("row", "group", "num", "currency", "char")] |>
    gt(rowname_col = "row", groupname_col = "group", id = "complex_typst") |>
    tab_header(
      title = md("Complex **Typst** table"),
      subtitle = md("Caption, notes, fills, borders, and summaries")
    ) |>
    tab_caption(md("A caption with `$`, `#`, and `<tbl-demo>`.") ) |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = list(list(label = "Average", fn = "mean"))
    ) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(list(label = "Grand total", fn = "sum"))
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "#1F3C88"),
        cell_text(color = "white", weight = "bold")
      ),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_fill(color = "#FFF8E1"),
      locations = cells_body(columns = c(num, currency))
    ) |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#616161", weight = px(1)),
      locations = cells_body(rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "red", weight = px(2)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    tab_style(
      style = cell_text(color = "#2E7D32", weight = "bold"),
      locations = cells_stub_grand_summary(rows = 1)
    ) |>
    tab_footnote(
      footnote = md("A **footnote** with `$100`."),
      locations = cells_body(columns = currency, rows = 2)
    ) |>
    tab_source_note(md("Source note with `code` and `<tbl-safe>`."))

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

test_that("gtsave() forwards Typst export options", {

  path <- tempfile(fileext = ".typ")

  gt_tbl <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_caption("Captioned")

  expect_warning(
    gt_tbl |> gtsave(path, container = "table"),
    "Auxiliary Typst table content is dropped when `container = \"table\"`."
  )

  out <- paste(readLines(path, warn = FALSE), collapse = "\n")

  expect_match(out, "table\\(")
  expect_no_match(out, "#figure\\(")
  expect_no_match(out, "Captioned")
})
test_that("gtsave() can write Typst output for gt_group", {

  path <- tempfile(fileext = ".typ")

  grp <-
    gt_group(
      exibble[1:2, c("num", "char")] |> gt(),
      exibble[3:4, c("num", "char")] |> gt()
    )

  expect_no_error(gtsave(grp, path))

  out <- paste(readLines(path, warn = FALSE), collapse = "\n")

  expect_match(out, "table\\(")
  expect_match(out, "#pagebreak\\(\\)")
})
