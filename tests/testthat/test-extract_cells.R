test_that("Extraction of table cells works well", {

  # Create a simple gt table using the exibble dataset
  gt_tbl <- gt(exibble)

  # Extract every cell from the table; expect the order of cell
  # extraction to occur from the top to bottom of column, left to
  # right columns
  expect_equal(
    gt_tbl |> extract_cells(columns = everything(), output = "plain"),
    c(
      "1.111e-01", "2.222e+00", "3.333e+01", "4.444e+02", "5.550e+03",
      "NA", "7.770e+05", "8.880e+06", "apricot", "banana", "coconut",
      "durian", NA, "fig", "grapefruit", "honeydew", "one", "two",
      "three", "four", "five", "six", "seven", "eight", "2015-01-15",
      "2015-02-15", "2015-03-15", "2015-04-15", "2015-05-15", "2015-06-15",
      NA, "2015-08-15", "13:35", "14:40", "15:45", "16:50", "17:55",
      NA, "19:10", "20:20", "2018-01-01 02:22", "2018-02-02 14:33",
      "2018-03-03 03:44", "2018-04-04 15:55", "2018-05-05 04:00", "2018-06-06 16:11",
      "2018-07-07 05:22", NA, "49.950", "17.950", "1.390", "65100.000",
      "1325.810", "13.255", "NA", "0.440", "row_1", "row_2", "row_3",
      "row_4", "row_5", "row_6", "row_7", "row_8", "grp_a", "grp_a",
      "grp_a", "grp_a", "grp_b", "grp_b", "grp_b", "grp_b"
    )
  )

  # Expect that moving columns with `cols_move*()` fns don't affect the
  # ordering of the vector containing all extracted cells
  expect_equal(
    gt_tbl |>
      cols_move_to_end(columns = num) |>
      extract_cells(columns = everything(), output = "plain"),
    gt_tbl |>
      extract_cells(columns = everything(), output = "plain")
  )

  # Expect that a single column of cells can be extracted
  expect_equal(
    gt_tbl |> extract_cells(columns = char, output = "plain"),
    c(
      "apricot", "banana", "coconut", "durian", NA,
      "fig", "grapefruit", "honeydew"
    )
  )

  # Expect that `rows` works to get a subset of cells
  # from one or more columns
  expect_equal(
    gt_tbl |> extract_cells(columns = char, rows = c(1, 3), output = "plain"),
    c("apricot", "coconut")
  )

  expect_equal(
    gt_tbl |> extract_cells(columns = c(char, fctr), rows = c(1, 3), output = "plain"),
    c("apricot", "coconut", "one", "three")
  )

  expect_equal(
    gt_tbl |> extract_cells(columns = everything(), rows = 1, output = "plain"),
    c(
      "1.111e-01", "apricot", "one", "2015-01-15", "13:35",
      "2018-01-01 02:22", "49.950", "row_1", "grp_a"
    )
  )

  # Format values and expect the formatted values to be extracted
  expect_equal(
    gt_tbl |>
      fmt_number(columns = num, decimals = 5) |>
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110","33.33000")
  )

  expect_equal(
    gt_tbl |>
      fmt_number(columns = num, rows = 1, decimals = 5) |>
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110","3.333e+01")
  )

  expect_equal(
    gt_tbl |>
      fmt_number(columns = num, decimals = 5) |>
      fmt_number(columns = num, decimals = 4, rows = 1:2) |>
      fmt_number(columns = num, decimals = 3, rows = 3) |>
      fmt_number(columns = currency, decimals = 10) |>
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.1111","33.330")
  )

  # Expect that footnotes won't appear in the output vector
  expect_equal(
    gt_tbl |>
      fmt_number(columns = num, decimals = 5) |>
      tab_footnote(footnote = "Footnote", locations = cells_body(columns = num)) |>
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110", "33.33000")
  )

  # Expect that the correct rendering context will be used
  gt_tbl_2 <- gt(dplyr::tibble(a = c(0.1, 0.3, 0.9, -1.3, -2.233)))

  expect_equal(
    gt_tbl_2 |>
      fmt_fraction(columns = a, layout = "diagonal") |>
      extract_cells(columns = a, output = "plain"),
    c("1/9", "2/7", "8/9", "-1 2/7", "-2 2/9")
  )

  expect_equal(
    gt_tbl_2 |>
      fmt_fraction(columns = a, layout = "diagonal") |>
      extract_cells(columns = a, output = "html"),
    c(
      "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">1</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">⁄</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>",
      "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">⁄</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">7</span>",
      "<span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">8</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">⁄</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>",
      "−1 <span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">⁄</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">7</span>",
      "−2 <span style=\"font-size:0.6em;line-height:0.6em;vertical-align:0.45em;\">2</span><span style=\"font-size:0.7em;line-height:0.7em;vertical-align:0.15em;\">⁄</span><span style=\"font-size:0.6em;line-height:0.6em;vertical-align:-0.05em;\">9</span>"
    )
  )

  expect_equal(
    gt_tbl_2 |>
      fmt_fraction(columns = a, layout = "diagonal") |>
      extract_cells(columns = a, output = "latex"),
    c(
      "\\textsuperscript{1}\\!/\\textsubscript{9}", "\\textsuperscript{2}\\!/\\textsubscript{7}",
      "\\textsuperscript{8}\\!/\\textsubscript{9}", "-1\\textsuperscript{2}\\!/\\textsubscript{7}",
      "-2\\textsuperscript{2}\\!/\\textsubscript{9}"
    )
  )

  expect_equal(
    gt_tbl_2 |>
      fmt_fraction(columns = a, layout = "diagonal") |>
      extract_cells(columns = a, output = "rtf"),
    c(
      "{\\super 1}/{\\sub 9}", "{\\super 2}/{\\sub 7}", "{\\super 8}/{\\sub 9}",
      "-1{\\super 2}/{\\sub 7}", "-2{\\super 2}/{\\sub 9}"
    )
  )

  expect_equal(
    gt_tbl_2 |>
      fmt_fraction(columns = a, layout = "diagonal") |>
      extract_cells(columns = a, output = "word"),
    c("1/9", "2/7", "8/9", "-1 2/7", "-2 2/9")
  )

  # Create a gt table with row groups and row labels using exibble
  gt_tbl_3 <- gt(exibble, rowname_col = "row", groupname_col = "group")

  # Format values and expect the formatted values to be extracted
  expect_equal(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      extract_cells(columns = num, rows = c("row_1", "row_3"), output = "plain"),
    c("0.11110", "33.33000")
  )

  expect_equal(
    gt_tbl_3 |>
      extract_cells(columns = row, rows = c("row_1", "row_3"), output = "plain"),
    c("row_1", "row_3")
  )

  expect_null(
    gt_tbl_3 |>
      extract_cells(columns = group, rows = c("row_1", "row_3"), output = "plain")
  )

  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) |>
      gt(rowname_col = "a") |>
      fmt_markdown(columns = a) |>
      extract_cells(columns = a, output = "plain"),
    c("hey", "there")
  )

  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) |>
      gt(rowname_col = "a") |>
      fmt_markdown(columns = stub()) |>
      extract_cells(columns = stub(), output = "plain"),
    c("hey", "there")
  )

  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) |>
      gt(rowname_col = "a") |>
      fmt_markdown(columns = a) |>
      extract_cells(columns = a, output = "html"),
    c(
      "<span class='gt_from_md'><em>hey</em></span>",
      "<span class='gt_from_md'><strong>there</strong></span>"
    )
  )

  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) |>
      gt(rowname_col = "a") |>
      fmt_markdown(columns = a) |>
      extract_cells(columns = a, output = "rtf"),
    c("{\\i hey}", "{\\b there}")
  )

  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) |>
      gt(rowname_col = "a") |>
      fmt_markdown(columns = a) |>
      extract_cells(columns = a, output = "word"),
    c(
      "<md_container><w:p><w:pPr></w:pPr><w:r>\n  <w:rPr>\n    <w:i/>\n  </w:rPr>\n  <w:t xml:space=\"preserve\">hey</w:t>\n</w:r></w:p></md_container>",
      "<md_container><w:p><w:pPr></w:pPr><w:r>\n  <w:rPr>\n    <w:b w:val=\"true\"/>\n  </w:rPr>\n  <w:t xml:space=\"preserve\">there</w:t>\n</w:r></w:p></md_container>"
    )
  )

  # Expect that text transforms are incorporated in the extracted vectors
  expect_equal(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      text_transform(
        locations = cells_body(columns = num),
        fn = function(x) paste0(x, "!")
      ) |>
      extract_cells(columns = num, output = "plain"),
    c(
      "0.11110!", "2.22200!", "33.33000!", "444.40000!", "5,550.00000!",
      "NA!", "777,000.00000!", "8,880,000.00000!"
    )
  )

  # Expect that cells from hidden columns can be extracted
  expect_equal(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      cols_hide(columns = num) |>
      extract_cells(columns = num, rows = c("row_1", "row_3"), output = "plain"),
    c("0.11110", "33.33000")
  )

  # Expect an error when attempting to obtain cells that don't exist
  expect_error(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      extract_cells(columns = num, rows = "row_50", output = "plain")
  )

  expect_error(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      extract_cells(columns = num, rows = c("row_2", "row_50"), output = "plain")
  )

  expect_error(
    gt_tbl_3 |>
      fmt_number(columns = num, decimals = 5) |>
      extract_cells(columns = 10, output = "plain")
  )
})
