# as_typst() snapshot for basic table

    Code
      cat(as_typst(gt(head(exibble))))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (right, left, center, right, right, right, right, left, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [num], [char], [fctr], [date], [time], [datetime], [currency], [row], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [0.1111], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950], [row\_1], [grp\_a],
        [2.2220], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950], [row\_2], [grp\_a],
        [33.3300], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390], [row\_3], [grp\_a],
        [444.4000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000], [row\_4], [grp\_a],
        [5550.0000], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810], [row\_5], [grp\_b],
        [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255], [row\_6], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with heading

    Code
      cat(as_typst(tab_header(gt(head(exibble)), title = "Title Here", subtitle = "Subtitle Here")))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (right, left, center, right, right, right, right, left, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
        table.cell(colspan: 9, align: center, inset: (x: 3.75pt, y: 3.0pt))[#text(size: 1.25em, weight: "bold")[Title Here] \ #text(size: 0.85em)[Subtitle Here]],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [num], [char], [fctr], [date], [time], [datetime], [currency], [row], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [0.1111], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950], [row\_1], [grp\_a],
        [2.2220], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950], [row\_2], [grp\_a],
        [33.3300], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390], [row\_3], [grp\_a],
        [444.4000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000], [row\_4], [grp\_a],
        [5550.0000], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810], [row\_5], [grp\_b],
        [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255], [row\_6], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with stub

    Code
      cat(as_typst(gt(head(exibble), rowname_col = "row")))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (left, right, left, center, right, right, right, right, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.vline(x: 1, stroke: 1.5pt + rgb("#D3D3D3")),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [], [num], [char], [fctr], [date], [time], [datetime], [currency], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [row\_1], [0.1111], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950], [grp\_a],
        [row\_2], [2.2220], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950], [grp\_a],
        [row\_3], [33.3300], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390], [grp\_a],
        [row\_4], [444.4000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000], [grp\_a],
        [row\_5], [5550.0000], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810], [grp\_b],
        [row\_6], [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with row groups

    Code
      cat(as_typst(gt(exibble, rowname_col = "row", groupname_col = "group")))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 8,
        align: (left, right, left, center, right, right, right, right),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.vline(x: 1, stroke: 1.5pt + rgb("#D3D3D3")),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [], [num], [char], [fctr], [date], [time], [datetime], [currency],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        table.cell(colspan: 8, inset: (x: 3.75pt, y: 6.0pt))[#text(weight: "bold")[grp\_a]],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        [row\_1], [1.111e-01], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950],
        [row\_2], [2.222e+00], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950],
        [row\_3], [3.333e+01], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390],
        [row\_4], [4.444e+02], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        table.cell(colspan: 8, inset: (x: 3.75pt, y: 6.0pt))[#text(weight: "bold")[grp\_b]],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        [row\_5], [5.550e+03], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810],
        [row\_6], [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255],
        [row\_7], [7.770e+05], [grapefruit], [seven], [NA], [19:10], [2018-07-07 05:22], [NA],
        [row\_8], [8.880e+06], [honeydew], [eight], [2015-08-15], [20:20], [NA], [0.440],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with spanners

    Code
      cat(as_typst(tab_spanner(tab_spanner(gt(head(exibble)), label = "Text Cols",
      columns = c(char, fctr)), label = "Num Cols", columns = c(num, currency))))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (right, right, left, center, right, right, right, left, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          table.cell(colspan: 2, align: center)[Num Cols], table.cell(colspan: 2, align: center)[Text Cols], [], [], [], [], [],
          table.hline(start: 0, end: 2, stroke: 0.75pt + rgb("#D3D3D3")), table.hline(start: 2, end: 4, stroke: 0.75pt + rgb("#D3D3D3")),
          [num], [currency], [char], [fctr], [date], [time], [datetime], [row], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [0.1111], [49.950], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [row\_1], [grp\_a],
        [2.2220], [17.950], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [row\_2], [grp\_a],
        [33.3300], [1.390], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [row\_3], [grp\_a],
        [444.4000], [65100.000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [row\_4], [grp\_a],
        [5550.0000], [1325.810], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [row\_5], [grp\_b],
        [NA], [13.255], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [row\_6], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with source note

    Code
      cat(as_typst(tab_source_note(gt(head(exibble)), "Source: example dataset")))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (right, left, center, right, right, right, right, left, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [num], [char], [fctr], [date], [time], [datetime], [currency], [row], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [0.1111], [apricot], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950], [row\_1], [grp\_a],
        [2.2220], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950], [row\_2], [grp\_a],
        [33.3300], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390], [row\_3], [grp\_a],
        [444.4000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000], [row\_4], [grp\_a],
        [5550.0000], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810], [row\_5], [grp\_b],
        [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255], [row\_6], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        table.cell(colspan: 9, align: left, fill: rgb("#FFFFFF"), inset: (x: 3.75pt, y: 3.0pt))[#text(size: 0.90em)[Source: example dataset]],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

# as_typst() snapshot for table with footnotes

    Code
      cat(as_typst(tab_footnote(tab_footnote(gt(head(exibble)), footnote = "First footnote",
      locations = cells_column_labels(columns = num)), footnote = "Second footnote",
      locations = cells_body(columns = char, rows = 1))))
    Output
      #set text(font: ("Segoe UI", "Roboto", "Helvetica", "Arial", "sans-serif"))
      #set text(fill: rgb("#333333"))
      #table(
        columns: 9,
        align: (right, left, center, right, right, right, right, left, left),
        stroke: (x: none, y: 0.75pt + rgb("#D3D3D3")),
        inset: (x: 3.75pt, y: 6.0pt),
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
        table.header(
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
          [num#super[1]], [char], [fctr], [date], [time], [datetime], [currency], [row], [group],
          table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        ),
        [0.1111], [apricot\#super\[2\]], [one], [2015-01-15], [13:35], [2018-01-01 02:22], [49.950], [row\_1], [grp\_a],
        [2.2220], [banana], [two], [2015-02-15], [14:40], [2018-02-02 14:33], [17.950], [row\_2], [grp\_a],
        [33.3300], [coconut], [three], [2015-03-15], [15:45], [2018-03-03 03:44], [1.390], [row\_3], [grp\_a],
        [444.4000], [durian], [four], [2015-04-15], [16:50], [2018-04-04 15:55], [65100.000], [row\_4], [grp\_a],
        [5550.0000], [NA], [five], [2015-05-15], [17:55], [2018-05-05 04:00], [1325.810], [row\_5], [grp\_b],
        [NA], [fig], [six], [2015-06-15], [NA], [2018-06-06 16:11], [13.255], [row\_6], [grp\_b],
        table.hline(stroke: 1.5pt + rgb("#D3D3D3")),
        table.cell(colspan: 9, align: left, fill: rgb("#FFFFFF"), inset: (x: 3.75pt, y: 3.0pt))[#text(size: 0.90em)[#super[1] First footnote] \ #text(size: 0.90em)[#super[2] Second footnote]],
        table.hline(stroke: 1.5pt + rgb("#A8A8A8")),
      )

