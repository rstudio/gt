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
  expect_match(
    typst_output,
    "#text\\(fill: rgb\\(\"#FF0000\"\\)\\)\\[A _source_ note\\.\\]"
  )
})

test_that("as_typst() handles fill, data_color, typography, note whitespace, and summary styling in one styled export", {

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
    grand_summary_rows(
      columns = amount,
      fns = list(list(label = "Total", fn = "sum"))
    ) |>
    tab_source_note("note with  two spaces") |>
    tab_style(
      style = cell_text(whitespace = "pre-wrap", align = "right", indent = px(8)),
      locations = cells_source_notes()
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "#FFF8E1"),
        cell_text(color = "#B26A00", weight = "bold")
      ),
      locations = cells_grand_summary(columns = amount, rows = 1)
    ) |>
    as_typst()

  expect_match(typst_output, "fill: \\(x, y\\) =>")
  expect_match(typst_output, "rgb\\(\"#1F3C88\"\\)")
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
  expect_match(typst_output, "rgb\\(\"#FFF8E1\"\\)")
  expect_match(typst_output, "rgb\\(\"#B26A00\"\\)")
  expect_match(typst_output, "Total")
})

test_that("as_typst() styles stub summary and grand summary cells", {

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

  expect_match(typst_output, "rgb\\(\"#1565C0\"\\)")
  expect_match(typst_output, "rgb\\(\"#2E7D32\"\\)")
  expect_match(typst_output, "Total")
  expect_match(typst_output, "Grand total")
})

test_that("as_typst() renders widths and table-level layout options", {

  typst_output <-
    dplyr::tibble(
      item = c("Alpha", "Beta"),
      value = c(10, 20)
    ) |>
    gt() |>
    cols_width(
      item ~ px(120),
      value ~ pct(40)
    ) |>
    tab_options(
      table.width = pct(80),
      table.font.size = px(20),
      data_row.padding = px(30)
    ) |>
    as_typst()

  expect_match(typst_output, "^#context \\{")
  expect_match(typst_output, "set text\\(size:\\s*15pt\\)")
  expect_match(typst_output, "set table\\.cell\\(inset: 22\\.5pt\\)")
  expect_match(typst_output, "block\\(width: 80%\\)")
  expect_match(typst_output, "columns: \\(90pt, 40%\\)")
})

test_that("as_typst() resolves summary styles by summary row position", {

  typst_output <-
    exibble[1:5, c("row", "group", "num", "currency")] |>
    gt(rowname_col = "row", groupname_col = "group") |>
    summary_rows(
      groups = "grp_a",
      columns = c(num, currency),
      fns = list(
        list(label = "Total", fn = "sum"),
        list(label = "Avg", fn = "mean")
      )
    ) |>
    tab_style(
      style = cell_text(color = "#1565C0", weight = "bold"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    ) |>
    tab_style(
      style = cell_text(color = "#C62828", weight = "bold"),
      locations = cells_summary(groups = "grp_a", columns = num, rows = 2)
    ) |>
    as_typst()

  expect_match(
    typst_output,
    "#text\\(fill: rgb\\(\"#1565C0\"\\), weight: \"bold\"\\)\\[Total\\]"
  )
  expect_match(
    typst_output,
    "#text\\(fill: rgb\\(\"#C62828\"\\), weight: \"bold\"\\)\\[120\\.0158\\]"
  )
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

  withr::local_options(list(gt.html_tag_check = FALSE))

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
    "table\\.header\\(\\[#set par\\(justify: false\\)\n\\s*Long name with words\\]"
  )

  unwrapped_output <-
    dplyr::tibble(
      block = "<div>plain block</div>",
      inline = "mix <span>inline text</span> end"
    ) |>
    gt() |>
    fmt_markdown(columns = everything()) |>
    as_typst()

  expect_match(unwrapped_output, "\\[\\]")
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

  expect_match(attributed_wrapper_output, "\\[\\]")
  expect_no_match(attributed_wrapper_output, "\\<div class=\"note\"\\>")
})
