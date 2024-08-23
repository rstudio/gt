test_that("The footer section formatting and options work well across all output formats", {

  exibble_footer <-
    exibble[1, ] %>%
    gt() %>%
    tab_source_note("Source note **bold** (#1, no `md()`)") %>%
    tab_source_note(md("Source note **bold** (#2, uses `md()`)")) %>%
    tab_footnote("footnote **bold** (#1, no `md()`)", cells_column_labels(num)) %>%
    tab_footnote(md("footnote **bold** (#2, uses `md()`)"), cells_column_labels(char))

  # 1: Footer as multiline blocks
  exibble_multiline <-
    exibble_footer %>%
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
    exibble_footer %>%
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
    exibble_footer %>%
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
    exibble_footer %>%
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
    exibble_footer %>%
    tab_options(
      footnotes.multiline = FALSE,
      footnotes.sep = " \\line ",
      source_notes.multiline = FALSE,
      source_notes.sep = " \\line "
    )

  # Take snapshot of `exibble_sep_rtf`
  expect_snapshot_rtf(exibble_sep_rtf)
})

test_that("place_footnote() is correct.", {
  place_footnote_on_left(

  )
})

test_that("correctly normalized", {
  # correct html
  "<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>&nbsp;<span class='gt_from_md'><em>Adding footnote</em></span>"
  og_str <- "<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>&nbsp;<div data-qmd-base64=\"X0FkZGluZyBmb290bm90ZV8=\"><div class='gt_from_md'><p><em>Adding footnote</em></p>\n</div></div>"

  expect_equal(
    post_process_footnotes_string(og_str),
  # "<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>&nbsp;<div data-qmd-base64=\"X0FkZGluZyBmb290bm90ZV8=\"><div class='gt_from_md'><p><em>Adding footnote</em></p>\n</div></div>"

  # "<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>&nbsp;<div data-qmd-base64=\"X0FkZGluZyBmb290bm90ZV8=\"><div class='gt_from_md'><em>Adding footnote</em></div></div>",
  "<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>&nbsp;<span data-qmd-base64=\"X0FkZGluZyBmb290bm90ZV8=\"><span class='gt_from_md'><em>Adding footnote</em></span></span>"

  )

})
