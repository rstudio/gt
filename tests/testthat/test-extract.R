test_that("Extraction of table cells works well", {

  # Create a simple gt table using the exibble dataset
  gt_tbl <- gt(exibble)

  # Extract every cell from the table; expect the order of cell
  # extraction to occur from the top to bottom of column, left to
  # right columns
  expect_equal(
    gt_tbl %>% extract_cells(columns = everything(), output = "plain"),
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
    gt_tbl %>%
      cols_move_to_end(columns = num) %>%
      extract_cells(columns = everything(), output = "plain"),
    gt_tbl %>%
      extract_cells(columns = everything(), output = "plain")
  )

  # Expect that a single column of cells can be extracted
  expect_equal(
    gt_tbl %>% extract_cells(columns = char, output = "plain"),
    c(
      "apricot", "banana", "coconut", "durian", NA,
      "fig", "grapefruit", "honeydew"
    )
  )

  # Expect that `rows` works to get a subset of cells
  # from one or more columns
  expect_equal(
    gt_tbl %>% extract_cells(columns = char, rows = c(1, 3), output = "plain"),
    c("apricot", "coconut")
  )
  expect_equal(
    gt_tbl %>% extract_cells(columns = c(char, fctr), rows = c(1, 3), output = "plain"),
    c("apricot", "coconut", "one", "three")
  )
  expect_equal(
    gt_tbl %>% extract_cells(columns = everything(), rows = 1, output = "plain"),
    c(
      "1.111e-01", "apricot", "one", "2015-01-15", "13:35",
      "2018-01-01 02:22", "49.950", "row_1", "grp_a"
    )
  )

  # Format values and expect the formatted values to be extracted
  expect_equal(
    gt_tbl %>%
      fmt_number(columns = num, decimals = 5) %>%
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110","33.33000")
  )
  expect_equal(
    gt_tbl %>%
      fmt_number(columns = num, rows = 1, decimals = 5) %>%
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110","3.333e+01")
  )
  expect_equal(
    gt_tbl %>%
      fmt_number(columns = num, decimals = 5) %>%
      fmt_number(columns = num, decimals = 4, rows = 1:2) %>%
      fmt_number(columns = num, decimals = 3, rows = 3) %>%
      fmt_number(columns = currency, decimals = 10) %>%
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.1111","33.330")
  )

  # Expect that footnotes won't appear in the output vector
  expect_equal(
    gt_tbl %>%
      fmt_number(columns = num, decimals = 5) %>%
      tab_footnote(footnote = "Footnote", locations = cells_body(columns = num)) %>%
      extract_cells(columns = num, rows = c(1, 3), output = "plain"),
    c("0.11110","33.33000")
  )

  # Expect that the correct rendering context will be used
  gt_tbl_2 <-
    dplyr::tibble(a = c(0.1, 0.3, 0.9, -1.3, -2.233)) %>%
    gt()

  expect_equal(
    gt_tbl_2 %>%
      fmt_fraction(columns = a, layout = "diagonal") %>%
      extract_cells(columns = a, output = "plain"),
    c("1/9", "2/7", "8/9", "-1 2/7", "-2 2/9")
  )
  expect_equal(
    gt_tbl_2 %>%
      fmt_fraction(columns = a, layout = "diagonal") %>%
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
    gt_tbl_2 %>%
      fmt_fraction(columns = a, layout = "diagonal") %>%
      extract_cells(columns = a, output = "latex"),
    c(
      "\\textsuperscript{1}\\!/\\textsubscript{9}", "\\textsuperscript{2}\\!/\\textsubscript{7}",
      "\\textsuperscript{8}\\!/\\textsubscript{9}", "-1\\textsuperscript{2}\\!/\\textsubscript{7}",
      "-2\\textsuperscript{2}\\!/\\textsubscript{9}"
    )
  )
  expect_equal(
    gt_tbl_2 %>%
      fmt_fraction(columns = a, layout = "diagonal") %>%
      extract_cells(columns = a, output = "rtf"),
    c(
      "{\\super 1}/{\\sub 9}", "{\\super 2}/{\\sub 7}", "{\\super 8}/{\\sub 9}",
      "-1{\\super 2}/{\\sub 7}", "-2{\\super 2}/{\\sub 9}"
    )
  )
  expect_equal(
    gt_tbl_2 %>%
      fmt_fraction(columns = a, layout = "diagonal") %>%
      extract_cells(columns = a, output = "word"),
    c("1/9", "2/7", "8/9", "-1 2/7", "-2 2/9")
  )

  # Create a gt table with row groups and row labels using exibble
  gt_tbl_3 <- gt(exibble, rowname_col = "row", groupname_col = "group")

  # Format values and expect the formatted values to be extracted
  expect_equal(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      extract_cells(columns = num, rows = c("row_1", "row_3"), output = "plain"),
    c("0.11110", "33.33000")
  )
  expect_equal(
    gt_tbl_3 %>%
      extract_cells(columns = row, rows = c("row_1", "row_3"), output = "plain"),
    c("row_1", "row_3")
  )
  expect_null(
    gt_tbl_3 %>%
      extract_cells(columns = group, rows = c("row_1", "row_3"), output = "plain")
  )
  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) %>%
      gt(rowname_col = "a") %>%
      fmt_markdown(columns = a) %>%
      extract_cells(columns = a, output = "plain"),
    c("hey", "there")
  )
  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) %>%
      gt(rowname_col = "a") %>%
      fmt_markdown(columns = stub()) %>%
      extract_cells(columns = stub(), output = "plain"),
    c("hey", "there")
  )
  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) %>%
      gt(rowname_col = "a") %>%
      fmt_markdown(columns = a) %>%
      extract_cells(columns = a, output = "html"),
    c(
      "<span class='gt_from_md'><em>hey</em></span>",
      "<span class='gt_from_md'><strong>there</strong></span>"
    )
  )
  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) %>%
      gt(rowname_col = "a") %>%
      fmt_markdown(columns = a) %>%
      extract_cells(columns = a, output = "rtf"),
    c("{\\i hey}", "{\\b there}")
  )
  expect_equal(
    dplyr::tibble(a = c("*hey*", "**there**"), b = 1:2) %>%
      gt(rowname_col = "a") %>%
      fmt_markdown(columns = a) %>%
      extract_cells(columns = a, output = "word"),
    c(
      "<md_container><w:p><w:pPr></w:pPr><w:r>\n  <w:rPr>\n    <w:i/>\n  </w:rPr>\n  <w:t xml:space=\"preserve\">hey</w:t>\n</w:r></w:p></md_container>",
      "<md_container><w:p><w:pPr></w:pPr><w:r>\n  <w:rPr>\n    <w:b w:val=\"true\"/>\n  </w:rPr>\n  <w:t xml:space=\"preserve\">there</w:t>\n</w:r></w:p></md_container>"
    )
  )

  # Expect that text transforms are incorporated in the extracted vectors
  expect_equal(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      text_transform(
        locations = cells_body(columns = num),
        fn = function(x) paste0(x, "!")
      ) %>%
      extract_cells(columns = num, output = "plain"),
    c(
      "0.11110!", "2.22200!", "33.33000!", "444.40000!", "5,550.00000!",
      "NA!", "777,000.00000!", "8,880,000.00000!"
    )
  )

  # Expect that cells from hidden columns can be extracted
  expect_equal(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      cols_hide(columns = num) %>%
      extract_cells(columns = num, rows = c("row_1", "row_3"), output = "plain"),
    c("0.11110", "33.33000")
  )

  # Expect an error when attempting to obtain cells that don't exist
  expect_error(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      extract_cells(columns = num, rows = "row_50", output = "plain")
  )
  expect_error(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      extract_cells(columns = num, rows = c("row_2", "row_50"), output = "plain")
  )
  expect_error(
    gt_tbl_3 %>%
      fmt_number(columns = num, decimals = 5) %>%
      extract_cells(columns = 10, output = "plain")
  )
})

test_that("Extraction of the table body works well", {

  # Create a simple table
  tbl <-
    dplyr::tibble(
      labels = LETTERS[1:7],
      num_1 = c(-0.01, 74, NA, 0, 500, 0.001, 84.3),
      num_2 = c(2, 5, 2, 6, 2.6, 923, -23),
      int_1 = c(1L, -100000L, 800L, 5L, NA, 1L, -3202334L),
      int_2 = c(6, NA, NA, 2, 123, 23, -600252),
      sci_1 = c(1.62e-9, 23.2e-7, 9.2e-12, 7.252e-10, 2.5e-13, NA, NA),
      sci_2 = c(5.2e13, 1.4e7, NA, NA, 3.2e3, 6.26e9, NA),
      ltr_1 = letters[1:7],
      ltr_2 = letters[1:7],
      ltr_3 = letters[1:7],
      group = c("one", "one", "two", "two", "one", "two", "one")
    )

  # Create a gt table, applying functions that modify the table body
  gt_tbl_1 <-
    tbl %>%
    gt() %>%
    fmt_integer(columns = num_1, pattern = "int:{x}") %>%
    sub_values(
      columns = num_1,
      fn = function(x) x > 400,
      replacement = "big"
    ) %>%
    sub_missing(columns = sci_1, missing_text = "missing") %>%
    text_transform(
      fn = function(x) paste(x, "_84"),
      locations = cells_body(columns = num_1, rows = 7)
    ) %>%
    fmt_scientific(columns = starts_with("sci")) %>%
    fmt_number(columns = starts_with("int"), rows = 1:3) %>%
    cols_merge(columns = starts_with("ltr"), rows = 4:7) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = int_1, rows = 1),
      placement = "right"
    ) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = labels, rows = 2)
    ) %>%
    tab_footnote(
      footnote = "B",
      locations = cells_body(columns = num_2, rows = 3),
      placement = "right"
    ) %>%
    cols_move_to_end(columns = sci_1)

  # Extract the table body at every stage of an HTML output build and
  # test each of the vectors within each extracted table body
  tbl_body_1_1 <- gt_tbl_1 %>% extract_body(build_stage = "init")
  expect_true(all(is.na(tbl_body_1_1 %>% unlist() %>% unname())))
  expect_equal(
    colnames(tbl_body_1_1),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_2 <- gt_tbl_1 %>% extract_body(build_stage = "fmt_applied")
  expect_true(all(is.na(tbl_body_1_2[["labels"]])))
  expect_true(all(is.na(tbl_body_1_2[["num_2"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_1_2[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_1_2[["group"]])))
  expect_equal(
    tbl_body_1_2[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "int:500", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_2[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_2[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_2[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      NA, NA
    )
  )
  expect_equal(
    tbl_body_1_2[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )
  expect_equal(
    colnames(tbl_body_1_2),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_3 <- gt_tbl_1 %>% extract_body(build_stage = "sub_applied")
  expect_true(all(is.na(tbl_body_1_3[["labels"]])))
  expect_true(all(is.na(tbl_body_1_3[["num_2"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_1_3[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_1_3[["group"]])))
  expect_equal(
    tbl_body_1_3[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_3[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_3[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_1_3[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_3[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )
  expect_equal(
    colnames(tbl_body_1_3),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_4 <- gt_tbl_1 %>% extract_body(build_stage = "unfmt_included")
  expect_equal(tbl_body_1_4[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_4[["ltr_1"]], tbl[["ltr_1"]])
  expect_equal(tbl_body_1_4[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_4[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_4[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_4[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_4[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_4[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_4[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_4[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    colnames(tbl_body_1_4),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_5 <- gt_tbl_1 %>% extract_body(build_stage = "cols_merged")
  expect_equal(tbl_body_1_5[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_5[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_5[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_5[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_5[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_5[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_5[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_5[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_5[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_5[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_1_5),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_6 <- gt_tbl_1 %>% extract_body(build_stage = "body_reassembled")
  expect_equal(tbl_body_1_6[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_6[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_6[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_6[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_1_6[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_6[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_6[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_6[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_6[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_6[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_1_6),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_7 <- gt_tbl_1 %>% extract_body(build_stage = "text_transformed")
  expect_equal(tbl_body_1_7[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_1_7[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_7[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_7[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )
  expect_equal(
    tbl_body_1_7[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_1_7[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_1_7[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_7[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_7[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_7[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_1_7),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_8 <- gt_tbl_1 %>% extract_body(build_stage = "footnotes_attached")
  expect_equal(
    tbl_body_1_8[["labels"]],
    c(
      "A",
      "B<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "C", "D", "E", "F", "G"
    )
  )
  expect_equal(tbl_body_1_8[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_8[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_8[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )
  expect_equal(
    tbl_body_1_8[["num_2"]],
    c(
      "2.0", "5.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>2</sup></span>",
      "6.0", "2.6", "923.0", "-23.0"
    )
  )
  expect_equal(
    tbl_body_1_8[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "−100,000.00", "800.00", "5", "NA", "1", "-3202334"
    )
  )
  expect_equal(
    tbl_body_1_8[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_8[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_8[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_8[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_1_8),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_1_8_b <- gt_tbl_1 %>% extract_body()
  expect_equal(
    tbl_body_1_8_b[["labels"]],
    c(
      "A",
      "B<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "C", "D", "E", "F", "G"
    )
  )
  expect_equal(tbl_body_1_8_b[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_1_8_b[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_1_8_b[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84 _84")
  )
  expect_equal(
    tbl_body_1_8_b[["num_2"]],
    c(
      "2.0", "5.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>2</sup></span>",
      "6.0", "2.6", "923.0", "-23.0"
    )
  )
  expect_equal(
    tbl_body_1_8_b[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "−100,000.00", "800.00", "5", "NA", "1", "-3202334"
    )
  )
  expect_equal(
    tbl_body_1_8_b[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_1_8_b[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_1_8_b[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_1_8_b[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_1_8_b),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  # Create a similar gt table to the first, this time using row groups
  # and a stub
  gt_tbl_2 <-
    tbl %>%
    gt(rowname_col = "labels", groupname_col = "group") %>%
    fmt_integer(columns = num_1, pattern = "int:{x}") %>%
    sub_values(
      columns = num_1,
      fn = function(x) x > 400,
      replacement = "big"
    ) %>%
    sub_missing(columns = sci_1, missing_text = "missing") %>%
    text_transform(
      fn = function(x) paste(x, "_84"),
      locations = cells_body(columns = num_1, rows = 7)
    ) %>%
    fmt_scientific(columns = starts_with("sci")) %>%
    fmt_number(columns = starts_with("int"), rows = 1:3) %>%
    cols_merge(columns = starts_with("ltr"), rows = 4:7) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = int_1, rows = 1),
      placement = "right"
    ) %>%
    tab_footnote(
      footnote = "A",
      locations = cells_body(columns = labels, rows = 2)
    ) %>%
    tab_footnote(
      footnote = "B",
      locations = cells_body(columns = num_2, rows = 3),
      placement = "right"
    ) %>%
    cols_move_to_end(columns = sci_1)

  # Extract the table body at every stage of an HTML output build and
  # test each of the vectors within each extracted table body
  tbl_body_2_1 <- gt_tbl_2 %>% extract_body(build_stage = "init")
  expect_true(all(is.na(tbl_body_2_1 %>% unlist() %>% unname())))
  expect_equal(
    colnames(tbl_body_2_1),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_2 <- gt_tbl_2 %>% extract_body(build_stage = "fmt_applied")
  expect_true(all(is.na(tbl_body_2_2[["labels"]])))
  expect_true(all(is.na(tbl_body_2_2[["num_2"]])))
  expect_true(all(is.na(tbl_body_2_2[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_2_2[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_2_2[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_2_2[["group"]])))
  expect_equal(
    tbl_body_2_2[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "int:500", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_2_2[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_2_2[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_2_2[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      NA, NA
    )
  )
  expect_equal(
    tbl_body_2_2[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )
  expect_equal(
    colnames(tbl_body_2_2),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_3 <- gt_tbl_2 %>% extract_body(build_stage = "sub_applied")
  expect_true(all(is.na(tbl_body_2_3[["labels"]])))
  expect_true(all(is.na(tbl_body_2_3[["num_2"]])))
  expect_true(all(is.na(tbl_body_2_3[["ltr_1"]])))
  expect_true(all(is.na(tbl_body_2_3[["ltr_2"]])))
  expect_true(all(is.na(tbl_body_2_3[["ltr_3"]])))
  expect_true(all(is.na(tbl_body_2_3[["group"]])))
  expect_equal(
    tbl_body_2_3[["num_1"]],
    c("int:0", "int:74", NA, "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_2_3[["int_1"]],
    c("1.00", "−100,000.00", "800.00", NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_2_3[["int_2"]],
    c("6.00", NA, NA, NA, NA, NA, NA)
  )
  expect_equal(
    tbl_body_2_3[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_3[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      NA, NA,
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      NA
    )
  )
  expect_equal(
    colnames(tbl_body_2_3),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_4 <- gt_tbl_2 %>% extract_body(build_stage = "unfmt_included")
  expect_equal(tbl_body_2_4[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_2_4[["ltr_1"]], tbl[["ltr_1"]])
  expect_equal(tbl_body_2_4[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_2_4[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_2_4[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_2_4[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_2_4[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_2_4[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_2_4[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_4[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    colnames(tbl_body_2_4),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_5 <- gt_tbl_2 %>% extract_body(build_stage = "cols_merged")
  expect_equal(tbl_body_2_5[["labels"]], tbl[["labels"]])
  expect_equal(tbl_body_2_5[["ltr_2"]], tbl[["ltr_2"]])
  expect_equal(tbl_body_2_5[["ltr_3"]], tbl[["ltr_3"]])
  expect_equal(
    tbl_body_2_5[["num_1"]],
    c("int:0", "int:74", "NA", "int:0", "big", "int:0", "int:84")
  )
  expect_equal(
    tbl_body_2_5[["num_2"]],
    c("2.0", "5.0", "2.0", "6.0", "2.6", "923.0", "-23.0")
  )
  expect_equal(
    tbl_body_2_5[["int_1"]],
    c("1.00", "−100,000.00", "800.00", "5", "NA", "1", "-3202334")
  )
  expect_equal(
    tbl_body_2_5[["int_2"]],
    c("6.00", "NA", "NA", "2", "123", "23", "-600252")
  )
  expect_equal(
    tbl_body_2_5[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_5[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "NA", "NA",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>",
      "NA"
    )
  )
  expect_equal(
    tbl_body_2_5[["ltr_1"]],
    c("a", "b", "c", "d d d", "e e e", "f f f", "g g g")
  )
  expect_equal(
    colnames(tbl_body_2_5),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_6 <- gt_tbl_2 %>% extract_body(build_stage = "body_reassembled")
  expect_equal(
    tbl_body_2_6[["labels"]],
    c("A", "B", "E", "G", "C", "D", "F")
  )
  expect_equal(
    tbl_body_2_6[["ltr_2"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_6[["ltr_3"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_6[["num_1"]],
    c("int:0", "int:74", "big", "int:84", "NA", "int:0", "int:0")
  )
  expect_equal(
    tbl_body_2_6[["num_2"]],
    c("2.0", "5.0", "2.6", "-23.0", "2.0", "6.0", "923.0")
  )
  expect_equal(
    tbl_body_2_6[["int_1"]],
    c("1.00", "−100,000.00", "NA", "-3202334", "800.00", "5", "1")
  )
  expect_equal(
    tbl_body_2_6[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )
  expect_equal(
    tbl_body_2_6[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_6[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )
  expect_equal(
    tbl_body_2_6[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )
  expect_equal(
    colnames(tbl_body_2_6),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_7 <- gt_tbl_2 %>% extract_body(build_stage = "text_transformed")
  expect_equal(
    tbl_body_2_7[["labels"]],
    c("A", "B", "E", "G", "C", "D", "F")
  )
  expect_equal(
    tbl_body_2_7[["ltr_2"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_7[["ltr_3"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_7[["num_1"]],
    c("int:0", "int:74", "big", "int:84 _84", "NA", "int:0", "int:0")
  )
  expect_equal(
    tbl_body_2_7[["num_2"]],
    c("2.0", "5.0", "2.6", "-23.0", "2.0", "6.0", "923.0")
  )
  expect_equal(
    tbl_body_2_7[["int_1"]],
    c("1.00", "−100,000.00", "NA", "-3202334", "800.00", "5", "1")
  )
  expect_equal(
    tbl_body_2_7[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )
  expect_equal(
    tbl_body_2_7[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_7[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )
  expect_equal(
    tbl_body_2_7[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )
  expect_equal(
    colnames(tbl_body_2_7),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )

  tbl_body_2_8 <- gt_tbl_2 %>% extract_body(build_stage = "footnotes_attached")
  expect_equal(
    tbl_body_2_8[["labels"]],
    c("A", "B", "E", "G", "C", "D", "F")
  )
  expect_equal(
    tbl_body_2_8[["ltr_2"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_8[["ltr_3"]],
    c("a", "b", "e", "g", "c", "d", "f")
  )
  expect_equal(
    tbl_body_2_8[["num_1"]],
    c("int:0", "int:74", "big", "int:84 _84", "NA", "int:0", "int:0")
  )
  expect_equal(
    tbl_body_2_8[["num_2"]],
    c(
      "2.0", "5.0", "2.6", "-23.0",
      "2.0<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>2</sup></span>",
      "6.0", "923.0"
    )
  )
  expect_equal(
    tbl_body_2_8[["int_1"]],
    c(
      "1.00<span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height: 0;\"><sup>1</sup></span>",
      "−100,000.00", "NA", "-3202334", "800.00", "5", "1"
    )
  )
  expect_equal(
    tbl_body_2_8[["int_2"]],
    c("6.00", "NA", "123", "-600252", "NA", "2", "23")
  )
  expect_equal(
    tbl_body_2_8[["sci_1"]],
    c(
      "1.62&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−9</sup>",
      "2.32&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−6</sup>",
      "2.50&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−13</sup>",
      "missing",
      "9.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−12</sup>",
      "7.25&nbsp;×&nbsp;10<sup style='font-size: 65%;'>−10</sup>",
      "missing"
    )
  )
  expect_equal(
    tbl_body_2_8[["sci_2"]],
    c(
      "5.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>13</sup>",
      "1.40&nbsp;×&nbsp;10<sup style='font-size: 65%;'>7</sup>",
      "3.20&nbsp;×&nbsp;10<sup style='font-size: 65%;'>3</sup>",
      "NA", "NA",
      "NA", "6.26&nbsp;×&nbsp;10<sup style='font-size: 65%;'>9</sup>"
    )
  )
  expect_equal(
    tbl_body_2_8[["ltr_1"]],
    c("a", "b", "e e e", "g g g", "c", "d d d", "f f f")
  )
  expect_equal(
    colnames(tbl_body_2_8),
    c("labels", "num_1", "num_2", "int_1", "int_2", "sci_2", "ltr_1",
      "ltr_2", "ltr_3", "group", "sci_1")
  )
})


test_that("Extracting a summary from a gt table is possible", {
  # Create a table based on `sp500`, with group names, rownames,
  # and four columns of values
  tbl <-
    sp500 %>%
    dplyr::filter(
      date >= "2015-01-05" &
        date <= "2015-01-16"
    ) %>%
    dplyr::arrange(date) %>%
    dplyr::mutate(
      week = paste0(
        "W", strftime(date, format = "%V"))
    ) %>%
    dplyr::select(-adj_close, -volume) %>%
    gt(
      rowname_col = "date",
      groupname_col = "week"
    )

  # Create a table with summary rows for
  # the `W02` and `W03` groups; the 3 summary
  # rows represent the mean, sum, and standard
  # deviation of all numeric columns; extract
  # the internal summary with `extract_summary()`
  gt_tbl_summary_groupwise <-
    tbl %>%
    summary_rows(
      groups = c("W02", "W03"),
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) %>%
    extract_summary()

  # Expect that the summary object is a list
  expect_type(gt_tbl_summary_groupwise, "list")

  # Expect that the length of the list is `1`
  expect_length(gt_tbl_summary_groupwise, 1)

  # Expect specific names for the list components
  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list,
    c("W02", "W03")
  )

  # Expect that each component of the list inherits
  # from `tbl_df`
  expect_s3_class(gt_tbl_summary_groupwise$summary_df_data_list[[1]], "data.frame")
  expect_s3_class(gt_tbl_summary_groupwise$summary_df_data_list[[2]], "data.frame")

  # Expect specific column names for each of the
  # tibbles in `gt_tbl_summary_groupwise`
  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  expect_named(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  # Expect specific values in each of the tibbles
  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$open,
    c(2035.23998, 10176.19990, 23.65756), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$high,
    c(2048.56198, 10242.80990, 17.47612), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$low,
    c(2016.8540, 10084.2699, 18.5372), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[1]]$close,
    c(2031.2080, 10156.0400, 22.9171), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$open,
    c(2020.42200, 10102.11000, 20.17218), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$high,
    c(2033.28798, 10166.43990, 18.33064), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$low,
    c(1999.77198, 9998.85990, 15.20847), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_groupwise$summary_df_data_list[[2]]$close,
    c(2014.9300, 10074.6500, 13.8957), tolerance = .002
  )

  # Create a table with a grand summary; the 3
  # summary rows represent the mean, sum, and
  # standard deviation of all numeric columns;
  # extract the internal summary with `extract_summary()`
  gt_tbl_summary_grand <-
    tbl %>%
    grand_summary_rows(
      columns = c(open, high, low, close),
      fns = list(
        average = ~mean(., na.rm = TRUE),
        total = ~sum(., na.rm = TRUE),
        `std dev` = ~sd(., na.rm = TRUE)
      )
    ) %>%
    extract_summary()

  # Expect that the summary object is a list
  expect_type(gt_tbl_summary_grand, "list")

  # Expect that the length of the list is `1`
  expect_length(gt_tbl_summary_grand, 1)

  # Expect a specific name for the one list component
  expect_named(gt_tbl_summary_grand, "summary_df_data_list")

  # Expect that the single component of the list inherits
  # from `list`
  expect_type(gt_tbl_summary_grand[[1]], "list")

  # Expect specific column names for the tibble in `gt_tbl_summary_grand`
  expect_named(
    gt_tbl_summary_grand$summary_df_data_list[[1]],
    c("group_id", "row_id", "rowname", "date", "open", "high", "low", "close", "week")
  )

  # Expect specific values in the tibble
  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$open,
    c(2027.83099, 20278.30990, 22.14929), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$high,
    c(2040.92498, 20409.24980, 18.70516), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$low,
    c(2008.31298, 20083.12980, 18.34602), tolerance = .002
  )

  expect_equal(
    gt_tbl_summary_grand$summary_df_data_list[[1]]$close,
    c(2023.06900, 20230.69000, 19.82022), tolerance = .002
  )
})
