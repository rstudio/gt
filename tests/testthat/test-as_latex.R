test_that("Table width correctly output in LaTeX", {

  gt_latex_width_1 <-
    gt(exibble) %>%
    tab_options(table.width = pct(90)) %>%
    as_latex()

  start_pt <- regexpr("begin\\{longtable", gt_latex_width_1)

  expect_gt(start_pt, 0)  # Verifies the long table command appears in the text

  end_pt <- regexpr("end\\{longtable", gt_latex_width_1)

  expect_gt(end_pt, 0)

  # Verify that the holdLTleft and holdLTright variables are defined and set
  latex_prefix <- substr(gt_latex_width_1, 1L, start_pt)

  expect_match(latex_prefix, "\\\\newlength\\\\holdLTleft")

  expect_match(latex_prefix, "\\\\newlength\\\\holdLTright")

  expect_match(latex_prefix, "\\\\setlength\\\\holdLTleft\\{\\\\LTleft\\}\\\\relax")

  expect_match(latex_prefix, "\\\\setlength\\\\holdLTright\\{\\\\LTright\\}\\\\relax")

  # Verify that LTleft and LTright are correctly specified
  expect_match(latex_prefix, "\\\\setlength\\\\LTleft\\{0.05\\\\linewidth\\}")

  expect_match(latex_prefix, "\\\\setlength\\\\LTright\\{0.05\\\\linewidth\\}")

  # Verify that after the longtable environment, the LTleft and LT right are
  # changed back to their previous values
  latex_suffix <- substr(gt_latex_width_1, end_pt, nchar(gt_latex_width_1))

  expect_match(latex_suffix, "\\\\setlength\\\\LTleft\\{\\\\holdLTleft\\}")

  expect_match(latex_suffix, "\\\\setlength\\\\LTright\\{\\\\holdLTright\\}")

  # Test specification of a table width in pixels
  gt_latex_width_2 <-
    gt(exibble) %>%
    tab_options(table.width = '600px') %>%
    as_latex()

  expect_match(gt_latex_width_2, "\\\\setlength\\\\LTleft\\{\\\\dimexpr\\(0.5\\\\linewidth - 225pt\\)\\}")

  expect_match(gt_latex_width_2, "\\\\setlength\\\\LTright\\{\\\\dimexpr\\(0.5\\\\linewidth - 225pt\\)\\}")

})
