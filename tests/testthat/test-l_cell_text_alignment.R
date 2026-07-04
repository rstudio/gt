test_that("latex cell alignment works - basic table", {

  test_data <- data.frame(
    estimate = c(
      "123 <br>(0.1234) this is super wide. like super wide. such a wide column",
      "val"
    ),
    col2 = c("testA", "test1"),
    col3 = c("testB", "test2"),
    col4 = c("testC", "test3")
  )

  # Create a `tbl_latex` object with `gt()`;
  # Apply a variety of types of content needing a mix of different alignments
  tbl_latex <- test_data |>
    gt() |>
    fmt_markdown() |>
    tab_footnote(footnote = md("FOOTNOTE <br> test this")) |>
    tab_footnote(footnote = md("FOOTNOTE2<br> this"), locations = cells_body(1,1)) |>
    tab_footnote(footnote = md("FOOTNOTE3")) |>
    cols_label(
      estimate = md("Name and estimate")
    ) |>
    tab_row_group(
      label = "Grouping Value 2",
      rows = 2
    ) |>
    tab_row_group(
      label = "Grouping Value",
      rows = 1
    )  |>
    tab_spanner(
      id = "level1_spanner_span1",
      label = md("level 1 <br>span 1"),
      level = 1,
      columns = c(1,2)
    ) |>
    tab_spanner(
      id = "level1_spanner_span2",
      label = md("level 1 <br>span 2"),
      level = 1,
      columns = c(3,4)
    ) |>
    tab_spanner(
      label = md("level 2 <br>span"),
      level = 2,
      columns = c(2,3,4)
    ) |>
    tab_spanner(
      label = md("level 3 <br>span"),
      level = 3,
      columns = c(1)
    )|>
    tab_style(cell_text(align = "right"),locations = cells_column_spanners(levels = 1, spanners = "level1_spanner_span1")) |>
    tab_style(cell_text(align = "left"),locations = cells_column_spanners(levels = 2)) |>
    tab_style(style = cell_text(align = "center"), locations = cells_body()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_footnotes()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_column_labels()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_row_groups("Grouping Value 2")) |>
    as_latex() |>
    as.character()


  # Expect a character vector
  expect_length(tbl_latex, 1)

  ### Spans ----

  # confirm level 3 span is centered, is in a shortstack due to the <br>, multicolumn is a column width of 1 and left aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{1}{c}{{\\shortstack[c]{level 3  \\\\span}}}", fixed = TRUE)

  # confirm level 2 span is left aligned,is in a shortstack due to the <br>, multicolumn is a column width of 3 and left aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{3}{l}{{\\shortstack[c]{level 2  \\\\span}}}", fixed = TRUE)


  # confirm level 1 spans

  # First is is right aligned,is in a shortstack due to the <br>, multicolumn is a column width of 2 and right aligned
  # and shortstack is r
  expect_match(tbl_latex, "\\multicolumn{2}{r}{{\\shortstack[r]{level 1  \\\\span 1}}}", fixed = TRUE)

  # second is is right aligned,is in a shortstack due to the <br>, multicolumn is a column width of 2 and right aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{2}{c}{{\\shortstack[c]{level 1  \\\\span 2}}}", fixed = TRUE)

  ### Column Labels ----

  # All are right aligned column with, multicolumn is a column width of 1
  expect_match(tbl_latex, "\\multicolumn{1}{r}{{Name and estimate}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{r}{{col2}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{r}{{col3}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{r}{{col4}}", fixed = TRUE)


  ### Body ----

  # First row first column value is a multi-row that is centered
  expect_match(tbl_latex, "\\multicolumn{1}{c}{{\\shortstack[c]{123  \\\\(0.1234) this is super wide. like super wide. such a wide column\\textsuperscript{\\textit{1}} }}}", fixed = TRUE)

  # The rest are centered
  # like the first row, second column
  expect_match(tbl_latex, "\\multicolumn{1}{c}{{testA}}", fixed = TRUE)
  # like the second row, first column
  expect_match(tbl_latex, "\\multicolumn{1}{c}{{val}}", fixed = TRUE)

  ### Grouping Values ----

  # first Grouping value is left aligned (default), but 4 columns wide
  expect_match(tbl_latex, "\\multicolumn{4}{l}{Grouping Value}", fixed = TRUE)

  # second grouping value is right alined, also 4 columns wide
  expect_match(tbl_latex, "\\multicolumn{4}{r}{{Grouping Value 2}}", fixed = TRUE)

  ### Footnotes ----

  # right aligned with a line break
  # First footnote is w new minipage, so used parbox, raggedleft pushes all content to the right, shortstack is right aligned due to <br>
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {\\shortstack[r]{FOOTNOTE  \\\\ test this}}}", fixed = TRUE)

  # second footnote just uses parbox and raggedleft
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {FOOTNOTE3}}", fixed = TRUE)

  # Third listed footnote includes reference, so listed last even though its second footnote
  # used parbox, raggedleft pushes all content to the right, reference is listed before the shortstack, shortstack is right aligned due to <br>,
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {\\shortstack[r]{\\textsuperscript{\\textit{1}}FOOTNOTE2 \\\\ this}}}", fixed = TRUE)


})

test_that("latex cell alignment works - set width columns table means parbox is needed", {

  test_data <- data.frame(
    estimate = c(
      "123 <br>(0.1234) this is super wide. like super wide. such a wide column",
      "val"
    ),
    col2 = c("testA", "test1"),
    col3 = c("testB", "test2"),
    col4 = c("testC", "test3")
  )

  # Create a `tbl_latex` object with `gt()`;
  # Apply a variety of types of content needing a mix of different alignments
  tbl_latex <- test_data |>
    gt() |>
    fmt_markdown() |>
    tab_footnote(footnote = md("FOOTNOTE <br> test this")) |>
    tab_footnote(footnote = md("FOOTNOTE2<br> this"), locations = cells_body(1,1)) |>
    tab_footnote(footnote = md("FOOTNOTE3")) |>
    cols_label(
      estimate = md("Name and estimate")
    ) |>
    tab_row_group(
      label = "Grouping Value 2",
      rows = 2
    ) |>
    tab_row_group(
      label = "Grouping Value",
      rows = 1
    )  |>
    tab_spanner(
      id = "level1_spanner_span1",
      label = md("level 1 <br>span 1"),
      level = 1,
      columns = c(1,2)
    ) |>
    tab_spanner(
      id = "level1_spanner_span2",
      label = md("level 1 <br>span 2"),
      level = 1,
      columns = c(3,4)
    ) |>
    tab_spanner(
      label = md("level 2 <br>span"),
      level = 2,
      columns = c(2,3,4)
    ) |>
    tab_spanner(
      label = md("level 3 <br>span"),
      level = 3,
      columns = c(1)
    )|>
    tab_style(cell_text(align = "right"),locations = cells_column_spanners(levels = 1, spanners = "level1_spanner_span1")) |>
    tab_style(cell_text(align = "left"),locations = cells_column_spanners(levels = 2)) |>
    tab_style(style = cell_text(align = "center"), locations = cells_body()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_footnotes()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_column_labels()) |>
    tab_style(style = cell_text(align = "right"), locations = cells_row_groups("Grouping Value 2")) |>
    cols_width(
      estimate ~ pct(40),
      col2 ~ pct(20),
      col3 ~ pct(20),
      col4 ~ pct(20)
    ) |>
    as_latex() |>
    as.character()


  # Expect a character vector
  expect_length(tbl_latex, 1)

  ### Spans ----

  # confirm level 3 span is centered, is in a shortstack due to the <br>, multicolumn is a column width of 1 and left aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\centering\\arraybackslash}m{\\dimexpr 0.40\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{{\\shortstack[c]{\\parbox{\\linewidth}{\\centering level 3  \\\\span}}}}", fixed = TRUE)
  # confirm level 2 span is left aligned,is in a shortstack due to the <br>, multicolumn is a column width of 3 and left aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{3}{>{\\raggedright\\arraybackslash}m{\\dimexpr 0.60\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{{\\shortstack[l]{\\parbox{\\linewidth}{\\raggedright level 2  \\\\span}}}}", fixed = TRUE)


  # confirm level 1 spans

  # First is is right aligned,is in a shortstack due to the <br>, multicolumn is a column width of 2 and right aligned
  # and shortstack is r
  expect_match(tbl_latex, "\\multicolumn{2}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 0.60\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{{\\shortstack[r]{\\parbox{\\linewidth}{\\raggedleft level 1  \\\\span 1}}}}", fixed = TRUE)

  # second is is right aligned,is in a shortstack due to the <br>, multicolumn is a column width of 2 and right aligned
  # and shortstack is c
  expect_match(tbl_latex, "\\multicolumn{2}{>{\\centering\\arraybackslash}m{\\dimexpr 0.40\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{{\\shortstack[c]{\\parbox{\\linewidth}{\\centering level 1  \\\\span 2}}}}", fixed = TRUE)

  ### Column Labels ----

  # All are right aligned column with, multicolumn is a column width of 1
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 0.40\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {Name and estimate}}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {col2}}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {col3}}}", fixed = TRUE)
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {col4}}}", fixed = TRUE)


  ### Body ----

  # First row first column value is a multi-row that is centered
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\centering\\arraybackslash}m{\\dimexpr 0.40\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{{\\shortstack[c]{\\parbox{\\linewidth}{\\centering 123  \\\\(0.1234) this is super wide. like super wide. such a wide column\\textsuperscript{\\textit{1}} }}}} ", fixed = TRUE)

  # The rest are centered
  # like the first row, second column
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\centering\\arraybackslash}m{\\dimexpr 0.20\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\centering {testA}}}", fixed = TRUE)
  # like the second row, first column
  expect_match(tbl_latex, "\\multicolumn{1}{>{\\centering\\arraybackslash}m{\\dimexpr 0.40\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\centering {val}}}", fixed = TRUE)

  ### Grouping Values ----

  # first Grouping value is left aligned (default), but 4 columns wide
  expect_match(tbl_latex, "\\multicolumn{4}{>{\\raggedright\\arraybackslash}m{1\\linewidth}}{\\parbox{\\linewidth}{Grouping Value}}", fixed = TRUE)

  # second grouping value is right alined, also 4 columns wide
  expect_match(tbl_latex, "\\multicolumn{4}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 1.00\\linewidth -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {Grouping Value 2}}}", fixed = TRUE)

  ### Footnotes ----

  # right aligned with a line break
  # First footnote is w new minipage, so used parbox, raggedleft pushes all content to the right, shortstack is right aligned due to <br>
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {\\shortstack[r]{FOOTNOTE  \\\\ test this}}}", fixed = TRUE)

  # second footnote just uses parbox and raggedleft
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {FOOTNOTE3}}", fixed = TRUE)

  # Third listed footnote includes reference, so listed last even though its second footnote
  # used parbox, raggedleft pushes all content to the right, reference is listed before the shortstack, shortstack is right aligned due to <br>,
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {\\shortstack[r]{\\textsuperscript{\\textit{1}}FOOTNOTE2 \\\\ this}}}", fixed = TRUE)


})

test_that("latex cell alignment works - basic table with footnotes", {

  test_data <- data.frame(
    estimate = c(
      "123 <br>(0.1234) this is super wide. like super wide. such a wide column",
      "val"
    ),
    col2 = c("testA", "test1"),
    col3 = c("testB", "test2"),
    col4 = c("testC", "test3")
  )

  # Create a `tbl_latex` object with `gt()`;
  # Apply a variety of types of content needing a mix of different alignments
  gt_tbl <- test_data |>
    gt() |>
    fmt_markdown() |>
    tab_footnote(footnote = md("FOOTNOTE<br> this"), locations = cells_body(1,1)) |>
    tab_footnote(footnote = md("FOOTNOTE2<br> this"), locations = cells_body(1,1), placement = "left") |>
    tab_footnote(footnote = md("FOOTNOTE3<br> this"), locations = cells_body(1,2), placement = "left") |>
    tab_style(style = cell_text(align = "right"), locations = cells_footnotes()) %>%
    cols_width(
      estimate ~ pct(40),
      col2 ~ pct(20),
      col3 ~ pct(20),
      col4 ~ pct(20)
    )

  tbl_latex <- gt_tbl |>
    as_latex() |>
    as.character()


  # Expect a character vector
  expect_length(tbl_latex, 1)

  ## Footnotes on col 1, row 1
  expect_match(tbl_latex, "\\shortstack[l]{\\parbox{\\linewidth}{123  \\\\(0.1234) this is super wide. like super wide. such a wide column\\textsuperscript{\\textit{1,2}} }} ", fixed = TRUE)

  ## Footnotes on col 1, row 2
  expect_match(tbl_latex, "\\textsuperscript{\\textit{3}}", fixed = TRUE)

  ## footnote is located within shortstack
  expect_match(tbl_latex, "\\parbox{\\linewidth}{\\raggedleft {\\shortstack[r]{\\textsuperscript{\\textit{1}}FOOTNOTE \\\\ this}}}", fixed = TRUE)


})
