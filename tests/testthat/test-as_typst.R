test_that("as_typst() uses native table and figure semantics", {

  plain_output <-
    gtcars |>
    dplyr::select(mfr, model, msrp) |>
    dplyr::slice(1:5) |>
    gt() |>
    as_typst()

  expect_match(plain_output, "^#table\\(")
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

test_that("as_typst() container semantics stay explicit", {

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
  expect_match(table_only, "^#table\\(")
  expect_no_match(table_only, "#figure\\(")
  expect_no_match(table_only, "Title|Subtitle|A Typst caption|Footnote|Source note")

  forced_figure <- as_typst(gt_tbl |> rm_caption(), container = "figure")
  expect_match(forced_figure, "^#figure\\(")
  expect_match(forced_figure, "kind: table")
})

test_that("as_typst() supports automatic labels, explicit labels, and breakable figures", {

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

  expect_match(breakable_output, "^#context \\{")
  expect_match(
    breakable_output,
    "show figure\\.where\\(kind: table\\): set block\\(breakable: true\\)"
  )
  expect_match(breakable_output, "<long_demo>$")
})

test_that("as_typst() preserves markdown, notes, headings, and block-region styling", {

  typst_output <-
    exibble[1:3, c("num", "char", "time")] |>
    gt() |>
    cols_label(
      num = md("**Number**"),
      char = md("`Character`")
    ) |>
    fmt_markdown(columns = char) |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    tab_footnote(
      footnote = md("A **footnote**"),
      locations = cells_body(columns = time, rows = 2)
    ) |>
    tab_source_note(source_note = md("A _source_ note.")) |>
    tab_style(
      style = list(
        cell_fill(color = "#DDDDEE"),
        cell_text(color = "blue", weight = "bold")
      ),
      locations = cells_title(groups = "title")
    ) |>
    tab_style(
      style = cell_text(color = "red"),
      locations = cells_source_notes()
    ) |>
    as_typst()

  expect_match(typst_output, "\\*Number\\*")
  expect_match(typst_output, "`Character`")
  expect_match(typst_output, "#super\\[_1_\\]")
  expect_match(typst_output, "\\[1\\] A \\*footnote\\*")
  expect_match(typst_output, "A _source_ note\\.")
  expect_match(
    typst_output,
    "stack\\(dir: ttb, spacing: 0\\.35em, block\\(fill: rgb\\(\"#DDDDEE\"\\), inset: 6pt\\)"
  )
  expect_match(typst_output, "#text\\(fill: rgb\\(\"#FF0000\"\\)\\)\\[A _source_ note\\.\\]")
})

test_that("as_typst() handles fill, data_color, typography, and note whitespace in one styled export", {

  typst_output <-
    dplyr::tibble(
      label = c("nowrap", "pre", "pre-wrap"),
      text = c("Alpha Beta", "A  B", "A  B"),
      amount = c(10, 20, 30)
    ) |>
    gt() |>
    tab_style(
      style = list(
        cell_fill(color = "#1F3C88"),
        cell_text(color = "white", weight = "bold")
      ),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_text(whitespace = "nowrap"),
      locations = cells_body(columns = text, rows = 1)
    ) |>
    tab_style(
      style = cell_text(whitespace = "pre"),
      locations = cells_body(columns = text, rows = 2)
    ) |>
    tab_style(
      style = cell_text(
        whitespace = "pre-wrap",
        color = "#0D47A1",
        size = px(18),
        font = "Arial",
        stretch = "semi-expanded",
        weight = "bold",
        style = "italic",
        decorate = "underline overline"
      ),
      locations = cells_body(columns = text, rows = 3)
    ) |>
    data_color(
      columns = amount,
      palette = c("#F7FBFF", "#6BAED6", "#08306B")
    ) |>
    tab_source_note("note with  two spaces") |>
    tab_style(
      style = cell_text(whitespace = "pre-wrap", align = "right", indent = px(8)),
      locations = cells_source_notes()
    ) |>
    as_typst()

  expect_match(
    typst_output,
    "fill: \\(x, y\\) => if y == 0 \\{ rgb\\(\"#1F3C88\"\\) \\} else \\{ none \\}"
  )
  expect_match(
    typst_output,
    "#text\\(fill: rgb\\(\"#FFFFFF\"\\), weight: \"bold\"\\)"
  )
  expect_match(typst_output, "table\\.cell\\(fill: rgb\\(\"#08306B\"\\)\\)")
  expect_match(typst_output, "\\[Alpha~Beta\\]")
  expect_match(typst_output, "\\[A~~B\\]")
  expect_match(
    typst_output,
    "#text\\(fill: rgb\\(\"#0D47A1\"\\), size:\\s*13\\.5pt, font: \"Arial\", stretch: 112\\.5%, weight: \"bold\"\\)\\[#emph\\[#overline\\[#underline\\[A ~B\\]\\]\\]\\]"
  )
  expect_match(
    typst_output,
    "#align\\(right\\)\\[#pad\\(left: 6pt\\)\\[note with ~two spaces\\]\\]"
  )
})

test_that("as_typst() supports alignment, borders, numeric weights, and stretch mappings", {

  typst_output <-
    gtcars |>
    dplyr::select(mfr, model) |>
    dplyr::slice(1:2) |>
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
    tab_style(
      style = cell_text(weight = 500, v_align = "top"),
      locations = cells_body(columns = mfr, rows = 1)
    ) |>
    tab_style(
      style = cell_text(stretch = "ultra-condensed"),
      locations = cells_body(columns = model, rows = 2)
    ) |>
    as_typst()

  expect_match(typst_output, "if x == 1 \\{ rgb\\(\"#FFEEAA\"\\) \\}")
  expect_match(typst_output, "table\\.cell\\(align: horizon \\+ center, stroke:")
  expect_match(typst_output, "paint: red")
  expect_match(typst_output, "thickness: 1\\.5pt")
  expect_match(
    typst_output,
    "#text\\(size: 1\\.2em, font: \\(\"Fira Sans\", \"Arial\"\\)\\)"
  )
  expect_match(typst_output, "#underline\\[")
  expect_match(typst_output, "table\\.cell\\(align: top\\)")
  expect_match(typst_output, "#text\\(weight: \"medium\"\\)")
  expect_match(typst_output, "#text\\(stretch: 50%\\)")
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

  expect_match(typst_output, "stroke: \\(")
  expect_match(typst_output, "paint: rgb\\(\"#444444\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#444444\"\\)"
  )
})

test_that("as_typst() lifts exact header row stroke patterns", {

  typst_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "all", color = "#1565C0", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if y == 0 \\{")
  expect_match(typst_output, "paint: rgb\\(\"#1565C0\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#1565C0\"\\)"
  )
})

test_that("as_typst() lifts exact summary row stroke patterns", {

  typst_output <-
    exibble[1:5, c("row", "group", "num", "currency")] |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = list(list(label = "Total", fn = "sum"))
    ) |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#8E24AA", weight = px(1)),
      locations = cells_summary(groups = "grp_a", columns = c(num, currency), rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#8E24AA", weight = px(1)),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if y == [0-9]+ \\{")
  expect_match(typst_output, "paint: rgb\\(\"#8E24AA\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(top: \\(paint: rgb\\(\"#8E24AA\"\\)"
  )
})

test_that("as_typst() lifts exact column stroke patterns", {

  typst_output <-
    exibble[1:3, c("num", "char", "currency")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "#00897B", weight = px(1)),
      locations = cells_column_labels(columns = char)
    ) |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "#00897B", weight = px(1)),
      locations = cells_body(columns = char)
    ) |>
    as_typst()

  expect_match(typst_output, "stroke: \\(x, y\\) => if x == 1 \\{")
  expect_match(typst_output, "paint: rgb\\(\"#00897B\"\\)")
  expect_no_match(
    typst_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: rgb\\(\"#00897B\"\\)"
  )
})

test_that("as_typst() preserves duplicated edges and residual local stroke exceptions", {

  duplicated_edges <-
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

  expect_match(duplicated_edges, "right: \\(paint: red, thickness: 1\\.5pt\\)")
  expect_match(duplicated_edges, "left: \\(paint: blue, thickness: 2\\.25pt\\)")

  residual_row_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = c("top", "bottom"), color = "#616161", weight = px(1)),
      locations = cells_body(rows = 1)
    ) |>
    tab_style(
      style = cell_borders(sides = c("left", "right"), color = "red", weight = px(2)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(residual_row_output, "stroke: \\(x, y\\) => if y == 1 \\{")
  expect_match(
    residual_row_output,
    "table\\.cell\\(stroke: \\(left: \\(paint: red, thickness: 1\\.5pt\\), right: \\(paint: red, thickness: 1\\.5pt\\)\\)\\)"
  )
  expect_no_match(
    residual_row_output,
    "table\\.cell\\(stroke: \\(top: \\(paint: rgb\\(\"#616161\"\\)"
  )

  residual_default_output <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_style(
      style = cell_borders(sides = "top", color = "#455A64", weight = px(1)),
      locations = cells_column_labels()
    ) |>
    tab_style(
      style = cell_borders(sides = "top", color = "#455A64", weight = px(1)),
      locations = cells_body()
    ) |>
    tab_style(
      style = cell_borders(sides = "right", color = "#D32F2F", weight = px(2)),
      locations = cells_body(columns = char, rows = 1)
    ) |>
    as_typst()

  expect_match(residual_default_output, "stroke: \\(top: \\(paint: rgb\\(\"#455A64\"\\)")
  expect_match(
    residual_default_output,
    "table\\.cell\\(stroke: \\(right: \\(paint: rgb\\(\"#D32F2F\"\\), thickness: 1\\.5pt\\)\\)\\)"
  )
})

test_that("as_typst() styles summary, stub summary, and grand summary cells", {

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

test_that("as_typst() escapes Typst-sensitive plain text across table regions", {

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
  expect_true(grepl("[\\$100]", typst_output, fixed = TRUE))
  expect_true(grepl("[\\#tag]", typst_output, fixed = TRUE))
  expect_true(grepl("source uses \\`code\\`", typst_output, fixed = TRUE))
})

test_that("as_typst() handles known multiline-label and markdown-wrapper issue repros", {

  multiline_output <-
    dplyr::tibble(
      "Long name with words" = c(1, 2, 3),
      "Another long name" = c(4, 5, 6),
      other = 1:3,
      other2 = 2:4,
      other3 = 3:5,
      other4 = 4:6,
      other5 = 6:8
    ) |>
    gt() |>
    as_typst()

  expect_match(
    multiline_output,
    "table\\.header\\(\\[#set par\\(justify: false\\)\nLong name with words\\]"
  )

  unwrapped_output <-
    dplyr::tibble(
      block = "<div>plain block</div>",
      inline = "mix <span>inline text</span> end"
    ) |>
    gt() |>
    fmt_markdown(columns = everything()) |>
    as_typst()

  expect_match(unwrapped_output, "\\[plain block\\]")
  expect_match(unwrapped_output, "\\[mix inline text end\\]")
  expect_no_match(unwrapped_output, "\\<div\\>")
  expect_no_match(unwrapped_output, "\\<span\\>")

  attributed_wrapper_output <-
    dplyr::tibble(
      html = "<div class=\"note\">styled block</div>"
    ) |>
    gt() |>
    fmt_markdown(columns = everything()) |>
    as_typst()

  expect_true(
    grepl(
      "[\\<div class=\"note\"\\>styled block\\</div\\>]",
      attributed_wrapper_output,
      fixed = TRUE
    )
  )
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

test_that("as_typst() renders a complex styled figure table", {

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
