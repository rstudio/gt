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
  expect_match(typst_output, "table\\(")
  expect_match(typst_output, "stack\\(dir: ttb, spacing: 0\\.9em")
  expect_match(typst_output, "stack\\(dir: ttb, spacing: 0\\.35em, block\\[Data listing from \\*gtcars\\*\\], block\\[`gtcars` is an R dataset\\]\\)")
  expect_no_match(typst_output, "#align\\(center\\)\\[")
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

  expect_warning(
    table_only <- as_typst(gt_tbl, container = "table"),
    "Auxiliary Typst table content is dropped when `container = \"table\"`."
  )
  expect_no_match(table_only, "#figure\\(")
  expect_no_match(table_only, "A Typst caption")

  forced_figure <- as_typst(gt_tbl |> rm_caption(), container = "figure")
  expect_match(forced_figure, "^#figure\\(")
  expect_match(forced_figure, "kind: table")
})

test_that("as_typst() emits automatic and explicit Typst labels", {

  auto_labeled <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "demo_table") |>
    as_typst()

  expect_match(auto_labeled, "<demo_table>$")

  explicit_labeled <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    as_typst(label = "custom-label")

  expect_match(explicit_labeled, "<custom-label>$")
  expect_no_match(exibble[1:2, c("num", "char")] |> gt(id = "x") |> as_typst(label = FALSE), "<x>$")
})

test_that("as_typst() can make figure-wrapped output breakable", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "long_demo") |>
    tab_caption("Captioned table") |>
    as_typst(breakable = TRUE)

  expect_match(typst_output, "^#context \\{")
  expect_match(typst_output, "show figure\\.where\\(kind: table\\): set block\\(breakable: true\\)")
  expect_match(typst_output, "<long_demo>$")
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

test_that("as_typst() lifts uniform header fill and text styling", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model, hp) |>
    dplyr::slice(1:3) |>
    gt() |>
    tab_style(
      style = list(
        cell_fill(color = "#1F3C88"),
        cell_text(color = "white", weight = "bold")
      ),
      locations = cells_column_labels()
    ) |>
    as_typst()

  expect_match(typst_output, "fill: \\(x, y\\) => if y == 0 \\{ rgb\\(\"#1F3C88\"\\) \\} else \\{ none \\}")
  expect_match(typst_output, "#text\\(fill: rgb\\(\"#FFFFFF\"\\)\\)")
  expect_match(typst_output, "#text\\(weight: \"bold\"\\)")
  expect_no_match(typst_output, "table\\.cell\\(fill: rgb\\(\"#1F3C88\"\\)\\)")
})

test_that("as_typst() emits per-cell fill and text color for irregular styles", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp, hp) |>
    dplyr::slice(1:4) |>
    gt() |>
    fmt_currency(columns = msrp, decimals = 0) |>
    data_color(
      columns = c(msrp, hp),
      palette = c("#F7FBFF", "#6BAED6", "#08306B")
    ) |>
    as_typst()

  expect_match(typst_output, "table\\.cell\\(fill: rgb\\(\"#08306B\"\\)\\)")
  expect_match(typst_output, "table\\.cell\\(fill: rgb\\(\"#AED0E9\"\\)\\)")
  expect_match(typst_output, "#text\\(fill: rgb\\(\"#FFFFFF\"\\)\\)")
  expect_match(typst_output, "#text\\(fill: rgb\\(\"#000000\"\\)\\)")
})

test_that("as_typst() styles notes with local Typst text wrappers", {

  typst_output <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    tab_source_note("source note") |>
    tab_style(
      style = cell_text(color = "red"),
      locations = cells_source_notes()
    ) |>
    as_typst()

  expect_match(typst_output, "block\\[#text\\(fill: rgb\\(\"#FF0000\"\\)\\)\\[source note\\]\\]")
})

test_that("as_typst() renders heading and footer regions as explicit Typst blocks", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    tab_source_note("Source note") |>
    as_typst()

  expect_match(
    typst_output,
    "stack\\(dir: ttb, spacing: 0\\.35em, block\\[Title\\], block\\[Subtitle\\]\\)"
  )
  expect_match(
    typst_output,
    "stack\\(dir: ttb, spacing: 0\\.45em, block\\[Source note\\]\\)"
  )
})

test_that("as_typst() drops all auxiliary content for forced bare tables", {

  gt_tbl <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    tab_caption("Caption") |>
    tab_footnote(
      footnote = "Footnote",
      locations = cells_body(columns = num, rows = 1)
    ) |>
    tab_source_note("Source note")

  expect_warning(
    typst_output <- as_typst(gt_tbl, container = "table"),
    "Auxiliary Typst table content is dropped when `container = \"table\"`."
  )

  expect_match(typst_output, "^#table\\(")
  expect_no_match(typst_output, "#figure\\(")
  expect_no_match(typst_output, "Title")
  expect_no_match(typst_output, "Subtitle")
  expect_no_match(typst_output, "Caption")
  expect_no_match(typst_output, "Footnote")
  expect_no_match(typst_output, "Source note")
})

test_that("as_typst() maps whitespace controls conservatively in cells and notes", {

  typst_output <-
    dplyr::tibble(
      label = c("nowrap", "pre", "pre-wrap"),
      text = c("Alpha Beta", "A  B", "A  B")
    ) |>
    gt() |>
    tab_style(
      style = cell_text(whitespace = "nowrap"),
      locations = cells_body(columns = text, rows = 1)
    ) |>
    tab_style(
      style = cell_text(whitespace = "pre"),
      locations = cells_body(columns = text, rows = 2)
    ) |>
    tab_style(
      style = cell_text(whitespace = "pre-wrap"),
      locations = cells_body(columns = text, rows = 3)
    ) |>
    tab_source_note("note with  two spaces") |>
    tab_style(
      style = cell_text(whitespace = "pre-wrap", align = "right", indent = px(8)),
      locations = cells_source_notes()
    ) |>
    as_typst()

  expect_match(typst_output, "\\[Alpha~Beta\\]")
  expect_match(typst_output, "\\[A~~B\\]")
  expect_match(typst_output, "\\[A ~B\\]")
  expect_match(typst_output, "#align\\(right\\)\\[#pad\\(left: 6pt\\)\\[note with ~two spaces\\]\\]")
})

test_that("as_typst() styles heading blocks with fill and text color", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model) |>
    dplyr::slice(1:1) |>
    gt() |>
    tab_header(title = "Title") |>
    tab_style(
      style = list(
        cell_fill(color = "#DDDDEE"),
        cell_text(color = "blue", weight = "bold")
      ),
      locations = cells_title(groups = "title")
    ) |>
    as_typst()

  expect_match(typst_output, "block\\(fill: rgb\\(\"#DDDDEE\"\\), inset: 6pt\\)")
  expect_match(typst_output, "#text\\(fill: rgb\\(\"#0000FF\"\\)\\)")
})

test_that("as_typst() supports text alignment, decoration, size, font, and borders", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model) |>
    dplyr::slice(1:1) |>
    gt() |>
    tab_style(
      style = list(
        cell_text(
          decorate = "underline",
          size = "large",
          align = "center",
          v_align = "middle",
          font = c("Fira Sans", "Arial")
        ),
        cell_fill(color = "#FFEEAA"),
        cell_borders(sides = "all", color = "red", weight = px(2))
      ),
      locations = cells_body(columns = model, rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "if x == 1 \\{ rgb\\(\"#FFEEAA\"\\) \\}")
  expect_match(typst_output, "table\\.cell\\(align: horizon \\+ center, stroke:")
  expect_match(typst_output, "paint: red")
  expect_match(typst_output, "thickness: 1\\.5pt")
  expect_match(typst_output, "#text\\(size: 1\\.2em\\)")
  expect_match(typst_output, "#text\\(font: \\(\"Fira Sans\", \"Arial\"\\)\\)")
  expect_match(typst_output, "#underline\\[")
})

test_that("as_typst() lifts exact whole-table stroke patterns", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "all", color = "#444444", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_borders(sides = "all", color = "#444444", weight = px(1)),
      locations = cells_body()
    ) |>
    as_typst()

  expect_match(
    typst_output,
    "stroke: \\(left: \\(paint: rgb\\(\"#444444\"\\), thickness: 0\\.75pt\\), right: \\(paint: rgb\\(\"#444444\"\\), thickness: 0\\.75pt\\), top: \\(paint: rgb\\(\"#444444\"\\), thickness: 0\\.75pt\\), bottom: \\(paint: rgb\\(\"#444444\"\\), thickness: 0\\.75pt\\)\\),"
  )
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#444444\"\\)"
  )
})

test_that("as_typst() supports additional decoration and block-region alignment/indent", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    tab_source_note("Source note") |>
    tab_style(
      style = cell_text(
        align = "right",
        indent = px(12),
        decorate = "underline overline",
        font = "IBM Plex Sans"
      ),
      locations = cells_title(groups = "title")
    ) |>
    tab_style(
      style = cell_text(
        align = "center",
        indent = px(8),
        weight = 700
      ),
      locations = cells_source_notes()
    ) |>
    as_typst()

  expect_match(typst_output, "align\\(right\\)\\[#pad\\(left: 9pt\\)")
  expect_match(typst_output, "#overline\\[#underline\\[")
  expect_match(typst_output, "#text\\(font: \"IBM Plex Sans\"\\)")
  expect_match(typst_output, "align\\(center\\)\\[#pad\\(left: 6pt\\)")
  expect_match(typst_output, "#text\\(weight: \"bold\"\\)\\[Source note\\]")
})

test_that("as_typst() maps numeric weights and vertical alignment conservatively", {

  typst_output <-
    exibble[1:1, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_text(weight = 500, v_align = "top"),
      locations = cells_body(columns = num, rows = 1)
    ) |>
    tab_style(
      style = cell_text(weight = 900, v_align = "bottom"),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "table\\.cell\\(align: top\\)")
  expect_match(typst_output, "table\\.cell\\(align: bottom\\)")
  expect_match(typst_output, "#text\\(weight: \"medium\"\\)")
  expect_match(typst_output, "#text\\(weight: \"black\"\\)")
})

test_that("as_typst() lifts exact column and default body fills", {

  column_fill_output <-
    exibble[1:3, c("num", "char", "currency")] |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#E3F2FD"),
      locations = cells_body(columns = char)
    ) |>
    as_typst()

  expect_match(column_fill_output, "if x == 1 \\{ rgb\\(\"#E3F2FD\"\\) \\}")
  expect_no_match(column_fill_output, "table\\.cell\\(fill: rgb\\(\"#E3F2FD\"\\)")

  default_fill_output <-
    exibble[1:3, c("num", "char", "currency")] |>
    gt() |>
    tab_style(
      style = cell_fill(color = "#FAFAFA"),
      locations = cells_body()
    ) |>
    as_typst()

  expect_match(default_fill_output, "fill: rgb\\(\"#FAFAFA\"\\)")
  expect_no_match(default_fill_output, "table\\.cell\\(fill: rgb\\(\"#FAFAFA\"\\)")
})

test_that("as_typst() preserves intentionally duplicated shared edges", {

  typst_output <-
    exibble[1:1, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "right", color = "red", weight = px(2)),
      locations = cells_body(columns = num, rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = "left", color = "blue", weight = px(3)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "right: \\(paint: red, thickness: 1\\.5pt\\)")
  expect_match(typst_output, "left: \\(paint: blue, thickness: 2\\.25pt\\)")
})

test_that("as_typst() styles summary and stub summary cells", {

  typst_output <-
    exibble[1:5, c("row", "group", "num", "currency")] |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = list(list(label = "Total", fn = "sum")),
      fmt = ~ fmt_number(., decimals = 1)
    ) |>
    grand_summary_rows(
      columns = c(num, currency),
      fns = list(list(label = "Grand total", fn = "sum")),
      fmt = ~ fmt_number(., decimals = 1)
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "#FFF8E1"),
        cell_text(color = "#B26A00", weight = "bold")
      ),
      locations = cells_summary(groups = "grp_a", columns = c(num, currency), rows = 1)
    ) |>
    tab_style(
      style = cell_text(color = "#1565C0", weight = "bold"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    ) |>
    tab_style(
      style = cell_text(color = "#2E7D32", weight = "bold"),
      locations = cells_stub_grand_summary(rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "rgb\\(\"#FFF8E1\"\\)")
  expect_match(typst_output, "rgb\\(\"#B26A00\"\\)")
  expect_match(typst_output, "rgb\\(\"#1565C0\"\\)")
  expect_match(typst_output, "rgb\\(\"#2E7D32\"\\)")
  expect_match(typst_output, "Total")
  expect_match(typst_output, "Grand total")
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
