test_that("cols_width() works correctly in LaTeX output tables", {

  # Create a `tbl_latex` object with `gt()`:
  # The `mpg` and `cyl` columns with one width, and the `cyl` and `hp`
  # columns with another width.
  tbl <-
    mtcars_short |>
    gt() |>
    cols_hide(c("drat", "wt", "qsec", "vs", "am", "gear", "carb")) |>
    cols_width(
      c("mpg", "disp") ~ px(150),
      c("cyl", "hp") ~ px(100)
    )

  tbl_latex_tabul <-
    tbl |>
    as_latex() |>
    as.character()

  tbl_latex_lt <-
    tbl |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern depending whether longtable or tabular is used.
  expect_length(tbl_latex_lt, 1)

  expect_match(tbl_latex_lt, "\\\\begin\\{longtable\\}\\{>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 75.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 75.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  expect_length(tbl_latex_tabul, 1)

  expect_match(tbl_latex_tabul, "\\\\begin\\{tabular\\*\\}\\{\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 75.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 75.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  # Create a `tbl_latex` object with `gt()`:
  # The `mpg` and `cyl` columns are merged having one width,
  # and the `cyl` and `hp` columns are merged having another width.

  tbl <-
    gt(mtcars_short) |>
    cols_hide(c("drat", "wt", "qsec", "vs", "am", "gear", "carb")) |>
    cols_merge(
      columns = c("mpg", "cyl"),
      pattern = "{1}-{2}"
    ) |>
    cols_merge(
      columns = c("disp", "hp"),
      pattern = "{1}-{2}"
    ) |>
    cols_width(
      "mpg" ~ px(150),
      "disp" ~ px(200)
    )

  tbl_latex_tabul <-
    tbl |>
    as_latex() |>
    as.character()

  tbl_latex_lt <-
    tbl |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern depending whether longtable or tabular is used.
  expect_length(tbl_latex_lt, 1)

  expect_match(tbl_latex_lt, "\\\\begin\\{longtable\\}\\{>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  expect_length(tbl_latex_tabul, 1)

  expect_match(tbl_latex_tabul, "\\\\begin\\{tabular\\*\\}\\{\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  # Create a `tbl_latex` object with `gt()`:
  # `carb` is used a stub with a specific width.
  # The `mpg` and `cyl` columns are merged having one width,
  # and the `cyl` and `hp` columns are merged having another width.

  tbl <-
    mtcars_short |>
    gt(rowname_col = "carb") |>
    cols_hide(c("drat", "wt", "qsec", "vs", "am", "gear")) |>
    tab_stubhead(label = "carb") |>
    cols_merge(
      columns = c("mpg", "cyl"),
      pattern = "{1}-{2}"
    ) |>
    cols_merge(
      columns = c("disp", "hp"),
      pattern = "{1}-{2}"
    ) |>
    cols_width(
      "mpg" ~ px(150),
      "disp" ~ px(200),
      "carb" ~ px(75)
    )

  tbl_latex_tabul <-
    tbl |>
    as_latex() |>
    as.character()

  tbl_latex_lt <-
    tbl |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern depending whether longtable or tabular is used.
  expect_length(tbl_latex_lt, 1)

  expect_match(tbl_latex_lt, "\\\\begin\\{longtable\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  expect_length(tbl_latex_tabul, 1)

  expect_match(tbl_latex_tabul, "\\\\begin\\{tabular\\*\\}\\{\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  # Create a `tbl_latex` object with `gt()`:
  # `carb` is used a stub with a specific width, and `carb_group` is used as row_groups.
  # The `mpg` and `cyl` columns are merged having one width,
  # and the `cyl` and `hp` columns are merged having another width.
  # We set the width of the row_groups here to check that the table isn't
  # affected since `row_group_as_column` is FALSE.

  tbl <-
    mtcars_short |>
    dplyr::mutate(carb_grp = ifelse(carb <= 2, "<=2", ">2")) |>
    gt(rowname_col = "carb", groupname_col = "carb_grp") |>
    cols_hide(c("drat", "wt", "qsec", "vs", "am", "gear")) |>
    tab_stubhead(label = "carb") |>
    cols_merge(
      columns = c("mpg", "cyl"),
      pattern = "{1}-{2}"
    ) |>
    cols_merge(
      columns = c("disp", "hp"),
      pattern = "{1}-{2}"
    ) |>
    cols_width(
      "mpg" ~ px(150),
      "disp" ~ px(200),
      "carb" ~ px(75),
      "carb_grp"~ px(1000)
    )

  tbl_latex_tabul <-
    tbl |>
    as_latex() |>
    as.character()

  tbl_latex_lt <-
    tbl |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern depending whether longtable or tabular is used.
  expect_length(tbl_latex_lt, 1)

  expect_match(tbl_latex_lt, "\\\\begin\\{longtable\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  expect_length(tbl_latex_tabul, 1)

  expect_match(tbl_latex_tabul, "\\\\begin\\{tabular\\*\\}\\{\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  # Create a `tbl_latex` object with `gt()`:
  # `carb` is used a stub with a specific width, and `carb_group` is used as row_groups
  # getting its own column with its own width.
  # The `mpg` and `cyl` columns are merged having one width,
  # and the `cyl` and `hp` columns are merged having another width.
  tbl <-
    mtcars_short |>
    dplyr::mutate(carb_grp = ifelse(carb <= 2, "<=2", ">2")) |>
    gt(rowname_col = "carb",
       groupname_col = "carb_grp",
       row_group_as_column = TRUE
    ) |>
    cols_hide(c("drat", "wt", "qsec", "vs", "am", "gear")) |>
    tab_stubhead(label = "carb") |>
    cols_merge(
      columns = c("mpg", "cyl"),
      pattern = "{1}-{2}"
    ) |>
    cols_merge(
      columns = c("disp", "hp"),
      pattern = "{1}-{2}"
    ) |>
    cols_width(
      "mpg" ~ px(150),
      "disp" ~ px(200),
      "carb" ~ px(75),
      "carb_grp"~ px(50)
    )

  tbl_latex_tabul <-
    tbl |>
    as_latex() |>
    as.character()

  tbl_latex_lt <-
    tbl |>
    tab_options(latex.use_longtable = TRUE) |>
    as_latex() |>
    as.character()

  # Expect a characteristic pattern depending whether longtable or tabular is used.
  expect_length(tbl_latex_lt, 1)

  expect_match(tbl_latex_lt, "\\\\begin\\{longtable\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 37.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")

  expect_length(tbl_latex_tabul, 1)

  expect_match(tbl_latex_tabul, "\\\\begin\\{tabular\\*\\}\\{\\\\linewidth\\}\\{@\\{\\\\extracolsep\\{\\\\fill\\}\\}>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 37.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedright\\\\arraybackslash\\}p\\{\\\\dimexpr 56.25pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}|>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 112.50pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}>\\{\\\\raggedleft\\\\arraybackslash\\}p\\{\\\\dimexpr 150.00pt -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}\\}")
})


test_that("cols_width() works correctly in LaTeX output tables when row_group_as_column is TRUE or FALSE", {

  tbl <-
    dplyr::tibble(
      row = 1:6,
      group = c(rep("Group A<br>test", 3), rep("Group B", 3)),
      vals = 1:6
    )

  tbl_rgac <- tbl |>
    gt(
      rowname_col = "row",
      groupname_col = "group",
      row_group_as_column = TRUE,
      process_md = TRUE
    ) |>
    fmt_markdown() |>
    cols_width(
      row_group() ~ px(200),
      stub() ~ px(100),
      vals ~ px(50)
    ) |>
    tab_style(style = list(cell_text(align = "right")), cells_stub()) |>
    as_latex() |>
    as.character()

  expect_length(tbl_rgac, 1)

  ## rowgroup column
  expect_match(tbl_rgac, "\\\\multirow\\[t\\]\\{3\\}\\{=\\}\\{\\\\shortstack\\[l\\]\\{\\\\parbox\\{\\\\linewidth\\}\\{Group A \\\\\\\\test\\}\\}\\}")
  expect_match(tbl_rgac, "\\\\multirow\\[t\\]\\{3\\}\\{=\\}\\{Group B\\}")

  ## styling stub
  expect_match(tbl_rgac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {1}}}", fixed = TRUE)



  tbl_rgnac <- tbl |>
    gt(
      rowname_col = "row",
      groupname_col = "group",
      row_group_as_column = FALSE,
      process_md = TRUE
    ) |>
    fmt_roman(columns = stub()) |>
    fmt_markdown() |>
    cols_width(
      row_group() ~ px(200),
      stub() ~ px(100),
      vals ~ px(50)
    ) |>
    tab_style(style = list(cell_text(align = "right")), cells_stub()) |>
    as_latex() |>
    as.character()

  expect_length(tbl_rgnac, 1)

  ## rowgroup column
  expect_match(tbl_rgnac, "\\\\multicolumn\\{2\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}m\\{262.5pt\\}\\}\\{\\\\shortstack\\[l\\]\\{\\\\parbox\\{\\\\linewidth\\}\\{Group A \\\\\\\\test\\}\\}\\}")
  expect_match(tbl_rgnac, "\\\\multicolumn\\{2\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}m\\{262.5pt\\}\\}\\{\\\\parbox\\{\\\\linewidth\\}\\{Group B\\}\\}")

  ## styling stub
  expect_match(tbl_rgnac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {1}}}", fixed = TRUE)

})


test_that("cols_width() works correctly in LaTeX output tables when row_group_as_column is TRUE or FALSE, multistub", {

  tbl <-
    dplyr::tibble(
      row1 = 1:6,
      row2 = LETTERS[1:6],
      group = c(rep("Group A<br>test", 3), rep("Group B", 3)),
      vals = 1:6
    )

  tbl_rgac <- tbl |>
    gt(
      rowname_col = c("row1","row2"),
      groupname_col = "group",
      row_group_as_column = TRUE,
      process_md = TRUE
    ) |>
    fmt_markdown() |>
    cols_width(
      row_group() ~ px(200),
      stub() ~ px(100),
      vals ~ px(50)
    ) |>
    tab_style(style = list(cell_text(align = "right")), cells_stub()) |>
    as_latex() |>
    as.character()

  expect_length(tbl_rgac, 1)

  ## rowgroup column
  expect_match(tbl_rgac, "\\\\multirow\\[t\\]\\{3\\}\\{=\\}\\{\\\\shortstack\\[l\\]\\{\\\\parbox\\{\\\\linewidth\\}\\{Group A \\\\\\\\test\\}\\}\\}")
  expect_match(tbl_rgac, "\\\\multirow\\[t\\]\\{3\\}\\{=\\}\\{Group B\\}")

  ## styling stub
  expect_match(tbl_rgac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {1}}}", fixed = TRUE)
  expect_match(tbl_rgac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {A}}}", fixed = TRUE)



  tbl_rgnac <- tbl |>
    gt(
      rowname_col = c("row1","row2"),
      groupname_col = "group",
      row_group_as_column = FALSE,
      process_md = TRUE
    ) |>
    fmt_roman(columns = stub()) |>
    fmt_markdown() |>
    cols_width(
      row_group() ~ px(200),
      stub() ~ px(100),
      vals ~ px(50)
    ) |>
    tab_style(style = list(cell_text(align = "right")), cells_stub()) |>
    as_latex() |>
    as.character()

  expect_length(tbl_rgnac, 1)

  ## rowgroup column
  expect_match(tbl_rgnac, "\\\\multicolumn\\{3\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}m\\{337.5pt\\}\\}\\{\\\\shortstack\\[l\\]\\{\\\\parbox\\{\\\\linewidth\\}\\{Group A \\\\\\\\test\\}\\}\\}")
  expect_match(tbl_rgnac, "\\\\multicolumn\\{3\\}\\{>\\{\\\\raggedright\\\\arraybackslash\\}m\\{337.5pt\\}\\}\\{\\\\parbox\\{\\\\linewidth\\}\\{Group B\\}\\}")

  ## styling stub
  expect_match(tbl_rgnac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {1}}}", fixed = TRUE)
  expect_match(tbl_rgnac, "\\multicolumn{1}{>{\\raggedleft\\arraybackslash}m{\\dimexpr 75.00pt -2\\tabcolsep-1.5\\arrayrulewidth}}{\\parbox{\\linewidth}{\\raggedleft {A}}}", fixed = TRUE)

})
