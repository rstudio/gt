test_that("The footer section formatting and options work well across all output formats", {

  exibble_footer <-
    gt(exibble[1, ]) |>
    tab_source_note("Source note **bold** (#1, no `md()`)") |>
    tab_source_note(md("Source note **bold** (#2, uses `md()`)")) |>
    tab_footnote("footnote **bold** (#1, no `md()`)", cells_column_labels(num)) |>
    tab_footnote(md("footnote **bold** (#2, uses `md()`)"), cells_column_labels(char))

  # 1: Footer as multiline blocks
  exibble_multiline <-
    exibble_footer |>
    tab_options(
      footnotes.multiline = TRUE, # default
      footnotes.sep = "  ",
      source_notes.multiline = TRUE, # default
      source_notes.sep = "  ",
      latex.use_longtable = TRUE
    )

  # Take snapshots of `exibble_multiline`
  expect_snapshot_html(exibble_multiline)

  expect_snapshot_latex(exibble_multiline)

  expect_snapshot_rtf(exibble_multiline)

  # 2: Footer as single-line paragraphs with `sep` setting
  exibble_oneline <-
    exibble_footer |>
    tab_options(
      footnotes.multiline = FALSE,
      footnotes.sep = "  ",
      source_notes.multiline = FALSE,
      source_notes.sep = "  ",
      latex.use_longtable = TRUE
    )

  # Take snapshots of `exibble_oneline`
  expect_snapshot_html(exibble_oneline)

  expect_snapshot_latex(exibble_oneline)

  expect_snapshot_rtf(exibble_oneline)

  # 3: Preservation of raw `sep` value in HTML output
  exibble_sep_html <-
    exibble_footer |>
    tab_options(
      footnotes.multiline = FALSE,
      footnotes.sep = " <em>|</em> ",
      source_notes.multiline = FALSE,
      source_notes.sep = " <em>|</em> "
    )

  # Take snapshot of `exibble_sep_html`
  expect_snapshot_html(exibble_sep_html)

  # 4: Preservation of raw `sep` value in LaTeX output
  exibble_sep_latex <-
    exibble_footer |>
    tab_options(
      footnotes.multiline = FALSE,
      footnotes.sep = " \\textit{|} ",
      source_notes.multiline = FALSE,
      source_notes.sep = " \\textit{|} ",
      latex.use_longtable = TRUE
    )

  # Take snapshot of `exibble_sep_latex`
  expect_snapshot_latex(exibble_sep_latex)

  # 5: Preservation of raw `sep` value in RTF output
  exibble_sep_rtf <-
    exibble_footer |>
    tab_options(
      footnotes.multiline = FALSE,
      footnotes.sep = " \\line ",
      source_notes.multiline = FALSE,
      source_notes.sep = " \\line "
    )

  # Take snapshot of `exibble_sep_rtf`
  expect_snapshot_rtf(exibble_sep_rtf)
})
