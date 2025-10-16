test_that("Table width correctly output in LaTeX using longtable", {

  gt_latex_width_1 <-
    gt(exibble) |>
    tab_options(table.width = pct(90), latex.use_longtable = TRUE) |>
    as_latex()

  expect_match(gt_latex_width_1, "begin\\{longtable")
  expect_match(gt_latex_width_1, "end\\{longtable")

  start_pt <- regexpr("begin\\{longtable", gt_latex_width_1)
  latex_prefix <- substr(gt_latex_width_1, 1L, start_pt)

  # Verify that LTleft and LTright are correctly specified
  expect_match(latex_prefix, "\\\\setlength\\\\LTleft\\{0.05\\\\linewidth\\}")

  expect_match(latex_prefix, "\\\\setlength\\\\LTright\\{0.05\\\\linewidth\\}")

  # Test specification of a table width in pixels
  gt_latex_width_2 <-
    gt(exibble) |>
    tab_options(table.width = "600px", latex.use_longtable = TRUE) |>
    as_latex()

  expect_match(
    gt_latex_width_2,
    "\\\\setlength\\\\LTleft\\{\\\\dimexpr\\(0.5\\\\linewidth - 225pt\\)\\}"
  )

  expect_match(
    gt_latex_width_2,
    "\\\\setlength\\\\LTright\\{\\\\dimexpr\\(0.5\\\\linewidth - 225pt\\)\\}"
  )
})

test_that("Table width correctly output in LaTeX using tabular*", {

  gt_latex_width_1 <-
    gt(exibble) |>
    tab_options(table.width = pct(90), latex.use_longtable = FALSE) |>
    as_latex()

  expect_match(
    gt_latex_width_1,
    "\\\\begin\\{tabular\\*\\}\\{0.9\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}"
  )

  # Test specification of a table width in pixels
  gt_latex_width_2 <-
    gt(exibble) |>
    tab_options(table.width = "600px", latex.use_longtable = FALSE) |>
    as_latex()

  expect_match(
    gt_latex_width_2,
    "\\\\begin\\{tabular\\*\\}\\{450pt\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}"
  )
})

test_that("Table position is correctly applied in LaTeX if used*", {

  gt_latex_width_1 <-
    gt(exibble) |>
    tab_options(
      table.width = pct(90),
      latex.use_longtable = FALSE,
      latex.tbl.pos = "!tb"
    ) |>
    as_latex()

  expect_match(gt_latex_width_1, "\\\\begin\\{table\\}\\[!tb\\]")
})

test_that("Table styles correctly applied for longtable", {

  gt_latex_styled <-
    gt(
      exibble[1:5, c(1:3, 5:9)],
      rowname_col = "row",
      groupname_col = "group"
    ) |>
    tab_stubhead(label = "stubhead") |>
    tab_stub_indent(
      rows = everything(),
      indent = "increase"
    ) |>
    tab_spanner(
      label = "heading",
      id = "a1",
      columns = 1:3
    ) |>
    tab_spanner(
      label = "heading",
      id = "b2",
      columns = 5:6
    ) |>
    summary_rows(
      fns = list(
        list(label = "Total", fn = "sum"),
        list(label = "Avg", fn = "mean")
        ),
        columns = c("num", "currency"),
        groups = "grp_a",
        fmt = ~ fmt_number(., use_seps = TRUE)
    ) |>
    grand_summary_rows(
      fns = list(list(label = "grand total", fn = "sum")),
      columns = c("num", "currency"),
      fmt = ~ fmt_number(., use_seps = TRUE)
    ) |>
    tab_footnote(
      footnote = "This is a footnote. With a second line.",
      locations = cells_body(columns = "time", rows = 3L)
    ) |>
    tab_footnote(
      footnote = "This is a footnote in the column labels.",
      locations = cells_column_labels(columns = "fctr")
    ) |>
    tab_source_note(source_note = "NOTES:  A mtcars example.") |>
    # Table formatting with tab_style
    tab_style(
      style = cell_text(decorate = "overline"),
      locations = cells_stubhead()
    ) |>
    tab_style(
      style = cell_text(transform = "uppercase"),
      locations = cells_column_labels(columns = c("num", "fctr", "datetime"))
    ) |>
    tab_style(
      style = gt::cell_text(style = "italic"),
      locations = cells_column_spanners(spanners = "a1")
    ) |>
    # Body styles
    tab_style(
      style = cell_text(
        size = 20,
        decorate = "underline",
        color = "red"
      ),
      locations = cells_body(columns = "time", rows = c(3:4))
    ) |>
    tab_style(
      style = cell_text(indent = px(20), weight = "bold"),
      locations = cells_body(columns = "char", rows = c(2L, 4L, 5L))
    ) |>
    tab_style(
      style = cell_text(indent = px(15), style = "oblique"),
      locations = cells_stub(rows = c(2L, 4L, 5L))
    ) |>
    tab_style(
      style = cell_text(size = 20L, color = "#0000FF"),
      locations = cells_body(columns = "fctr")
    ) |>
    tab_style(
      style = list(
        cell_text(weight = "bold"),
        cell_fill(color = "#CCCCFF")
      ),
      locations = cells_row_groups(groups = "grp_b")
    ) |>
    tab_style(
      style = cell_text(size = "x-small"),
      locations = cells_body(columns = "datetime")
    ) |>
    tab_style(
      style = list(
        cell_text(color = "#FFFFFF"),
        cell_fill(color = "#AA0000")
      ),
      locations = cells_stub()
    ) |>
    # Footnote and source note styles
    tab_style(
      style = cell_text(size = 8, style = "italic"),
      locations = cells_source_notes()
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_footnotes()
    ) |>
    # Summary styles
    tab_style(
      style = cell_fill(color = "#00FF00"),
      locations = cells_summary(
        groups = "grp_a",
        columns = c("num", "currency"),
        rows = 2L
      )
    ) |>
    tab_style(
      style = cell_text(color = "#00FF00"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1L)
    ) |>
    # Grand summary styles
    tab_style(
      style = cell_text(transform = "capitalize", weight = "bold"),
      locations = cells_stub_grand_summary()
    ) |>
    tab_style(
      style = cell_fill(color = "#AAAAAA"),
      locations = cells_grand_summary()
    ) |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex()

  expect_snapshot(gt_latex_styled)
})

test_that("Table styles correctly applied for tabular*", {

  gt_latex_styled <-
    gt(
      exibble[1:5, c(1:3, 5:9)],
      rowname_col = "row",
      groupname_col = "group"
    ) |>
    tab_stubhead(label = "stubhead") |>
    tab_stub_indent(rows = everything(), indent = "increase") |>
    tab_spanner(
      label = "heading",
      id = "a1",
      columns = 1:3
    ) |>
    tab_spanner(
      label = "heading",
      id = "b2",
      columns = 5:6
    ) |>
    summary_rows(
      fns = list(
        list(label = "Total", fn = "sum"),
        list(label = "Avg", fn = "mean")
      ),
      columns = c("num", "currency"),
      groups = "grp_a",
      fmt = ~ fmt_number(., use_seps = TRUE)
    ) |>
    grand_summary_rows(
      fns = list(list(label = "grand total", fn = "sum")),
      columns = c("num", "currency"),
      fmt = ~ fmt_number(., use_seps = TRUE)
    ) |>
    tab_footnote(
      footnote = "This is a footnote. With a second line.",
      locations = cells_body(columns = "time", rows = 3L)
    ) |>
    tab_footnote(
      footnote = "This is a footnote in the column labels.",
      locations = cells_column_labels(columns = "fctr")
    ) |>
    tab_source_note(source_note = "NOTES:  A mtcars example.") |>
    # Table formatting with tab_style
    tab_style(
      style = cell_text(decorate = "overline"),
      locations = cells_stubhead()
    ) |>
    tab_style(
      style = cell_text(transform = "uppercase"),
      locations = cells_column_labels(columns = c("num", "fctr", "datetime"))
    ) |>
    tab_style(
      style = gt::cell_text(style = "italic"),
      locations = cells_column_spanners(spanners = "a1")
    ) |>
    # Body styles
    tab_style(
      style = cell_text(
        size = 20,
        decorate = "underline",
        color = "red"
      ),
      locations = cells_body(columns = "time", rows = c(3:4))
    ) |>
    tab_style(
      style = cell_text(indent = px(20), weight = "bold"),
      locations = cells_body(columns = "char", rows = c(2L, 4L, 5L))
    ) |>
    tab_style(
      style = cell_text(indent = px(15), style = "oblique"),
      locations = cells_stub(rows = c(2L, 4L, 5L))
    ) |>
    tab_style(
      style = cell_text(size = 20L, color = "#0000FF"),
      locations = cells_body(columns = "fctr")
    ) |>
    tab_style(
      style = list(
        cell_text(weight = "bold"),
        cell_fill(color = "#CCCCFF")
      ),
      locations = cells_row_groups(groups = "grp_b")
    ) |>
    tab_style(
      style = cell_text(size = "x-small"),
      locations = cells_body(columns = "datetime")
    ) |>
    tab_style(
      style = list(
        cell_text(color = "#FFFFFF"),
        cell_fill(color = "#AA0000")
      ),
      locations = cells_stub()
    ) |>
    # Footnote and source note styles
    tab_style(
      style = cell_text(size = 8, style = "italic"),
      locations = cells_source_notes()
    ) |>
    tab_style(
      style = cell_text(weight = "bold"),
      locations = cells_footnotes()
    ) |>
    # Summary styles
    tab_style(
      style = cell_fill(color = "#00FF00"),
      locations = cells_summary(
        groups = "grp_a",
        columns = c("num", "currency"),
        rows = 2L
      )
    ) |>
    tab_style(
      style = cell_text(color = "#00FF00"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1L)
    ) |>
    # Grand summary styles
    tab_style(
      style = cell_text(transform = "capitalize", weight = "bold"),
      locations = cells_stub_grand_summary()
    ) |>
    tab_style(
      style = cell_fill(color = "#AAAAAA"),
      locations = cells_grand_summary()
    ) |>
    tab_options(latex.use_longtable = FALSE) |>
    as_latex()

  expect_snapshot(gt_latex_styled)
})

test_that("Table heading allows for repeating", {

  gt_latex_repeat_header <-
    gt(exibble) |>
    tab_options(latex.header_repeat = TRUE) |>
    as_latex()

  expect_snapshot(gt_latex_repeat_header)
})

test_that("Table can remove top and bottom rules", {

  gt_latex_no_top_rule <-
    gt(exibble) |>
    tab_options(latex.toprule = FALSE) |>
    as_latex()

  expect_snapshot(gt_latex_no_top_rule)

  gt_latex_no_bottom_rule <-
    gt(exibble) |>
    tab_options(latex.bottomrule = FALSE) |>
    as_latex()

  expect_snapshot(gt_latex_no_bottom_rule)

  gt_latex_no_top_or_bottom_rule <-
    gt(exibble) |>
    tab_options(
      latex.toprule = FALSE,
      latex.bottomrule = FALSE
    ) |>
    as_latex()

  expect_snapshot(gt_latex_no_top_or_bottom_rule)
})

test_that("Latex table allows for line breaks in title and cells", {

  gt_tbl_linebreaks <-
    data.frame(x = c("x<br>y")) |>
    gt() |>
    fmt_markdown() |>
    tab_header(
      title = md("TABLE <br> TITLE"),
      subtitle = md("table <br> subtitle")
    ) |>
    as_latex()

  expect_snapshot(gt_tbl_linebreaks)
})

test_that("Latex() function lets users pass their own latex to titles", {

  gt_tbl_inline_latex <-
    data.frame(x = c("\\textbf{x}","\\textbf{y}")) |>
    gt() |>
    fmt(columns = 1, rows = 1, fns = ~latex(.x)) |>
    tab_header(
      title = latex("\\textbf{TABLE TITLE}"),
      subtitle = "\\textbf{TABLE SUBTITLE}"
    ) |>
    as_latex()

  ##  1st row should and title should also be as-is
  ## 2nd row and subtitle should be escaped
  expect_snapshot(as.character(gt_tbl_inline_latex))
})

test_that("Table can apply font sizes", {

  gt_latex_font_size_10 <-
    gt(exibble[1, ]) |>
    tab_options(
      table.font.size = "10pt",
      heading.title.font.size = "10pt",
      heading.subtitle.font.size = "10pt"
    ) |>
    tab_header(
      title = "My title",
      subtitle = "My subtitle"
    ) |>
    as_latex() |>
    as.character()

  expect_snapshot(gt_latex_font_size_10)

  gt_latex_font_size_10_title_20 <-
    gt(exibble[1, ]) |>
    tab_options(
      table.font.size = "10pt",
      heading.title.font.size = "20pt",
      heading.subtitle.font.size = "10pt"
    ) |>
    tab_header(
      title = "My title",
      subtitle = "My subtitle"
    ) |>
    as_latex() |>
    as.character()

  expect_snapshot(gt_latex_font_size_10_title_20)

  gt_latex_font_size_10_subtitle_20 <-
    gt(exibble[1, ]) |>
    tab_options(
      table.font.size = "10pt",
      heading.title.font.size = "10pt",
      heading.subtitle.font.size = "20pt"
    ) |>
    tab_header(
      title = "My title",
      subtitle = "My subtitle"
    ) |>
    as_latex() |>
    as.character()

  expect_snapshot(gt_latex_font_size_10_subtitle_20)
})

test_that("Tables with unicode characters were acceptable and updated to latex compliant code", {

  testthat::skip_if(getRversion() <= package_version("4.1.3"))

  gt_tbl_unicode <- data.frame( unicode = c("ɑβΔ")) |>
    gt() |>
    tab_header(
      title = "≥ unicode text",
      subtitle = "≠ not equal"
    ) |>
    tab_options(latex.unicode_conversion = TRUE) |>
    as_latex()

  ## title should be \\ensuremath{\\geq} unicode text
  expect_match(
    gt_tbl_unicode |> as.character(),
    "{\\ensuremath{\\geq}} unicode text",
    fixed = TRUE
  )

  ## subtitle should be \\ensuremath{\\neq} not equal
  expect_match(
    gt_tbl_unicode |> as.character(),
    "{\\ensuremath{\\neq}} not equal",
    fixed = TRUE
  )

  ## content should be \\\ensuremath{\\alpha}\\ensuremath{\\beta}\\ensuremath{\\Delta}
  expect_match(
    gt_tbl_unicode |> as.character(),
    "\n{\\ensuremath{\\alpha}}{\\ensuremath{\\beta}}{\\ensuremath{\\Delta}} \\\\",
    fixed = TRUE
  )
})
