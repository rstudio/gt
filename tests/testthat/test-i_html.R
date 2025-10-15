test_that("HTML tables have a specific class", {

  tbl_gt_i <- gt(exibble) |> opt_interactive()

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_i), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt_i))

  tbl_gt <- gt(exibble)

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt))

  tbl_gt_not_interactive <- gt(exibble) |> opt_interactive(active = FALSE)

  capture_output(expect_s3_class(testthat::testthat_print(tbl_gt_not_interactive), "shiny.tag"))
  capture_output(expect_no_error(tbl_gt_not_interactive))
})

test_that("Interactive tables won't fail when using different options", {

  tbl_gt_i_01 <- gt(exibble) |> opt_interactive(use_pagination = FALSE)

  tbl_gt_i_02 <- gt(exibble) |> opt_interactive(use_pagination_info = FALSE)

  tbl_gt_i_03 <- gt(exibble) |> opt_interactive(use_sorting = FALSE)

  tbl_gt_i_04 <- gt(exibble) |> opt_interactive(use_search = TRUE)

  tbl_gt_i_05 <- gt(exibble) |> opt_interactive(use_filters = TRUE)

  tbl_gt_i_06 <- gt(exibble) |> opt_interactive(use_resizers = TRUE)

  tbl_gt_i_07 <- gt(exibble) |> opt_interactive(use_highlight = TRUE)

  tbl_gt_i_08 <- gt(exibble) |> opt_interactive(use_compact_mode = TRUE)

  tbl_gt_i_09 <- gt(exibble) |> opt_interactive(use_text_wrapping = FALSE)

  tbl_gt_i_10 <- gt(exibble) |> opt_interactive(use_page_size_select = TRUE)

  tbl_gt_i_11 <- gt(exibble) |> opt_interactive(page_size_default = 20)

  tbl_gt_i_12 <- gt(exibble) |> opt_interactive(page_size_values = c(5, 15, 30))

  tbl_gt_i_13 <- gt(exibble) |> opt_interactive(pagination_type = "jump")

  tbl_gt_i_14 <- gt(exibble) |> opt_interactive(pagination_type = "simple")

  tbl_gt_i_15 <- gt(exibble, locale = "de") |> opt_interactive()

  tbl_gt_i_16 <- gt(exibble) |> cols_width(everything() ~ px(200)) |> opt_interactive()

  tbl_gt_i_17 <-
    gt(exibble) |>
    tab_style(style = cell_fill(), locations = cells_body()) |>
    opt_interactive()

  tbl_gt_i_18 <-
    gt(exibble) |>
    tab_header(title = "Title") |>
    opt_interactive()

  tbl_gt_i_19 <-
    gt(exibble) |>
    tab_header(title = "Title", subtitle = "Subtitle") |>
    opt_interactive()

  tbl_gt_i_20 <-
    gt(exibble) |>
    tab_source_note(source_note = "Source Note.") |>
    opt_interactive()

  tbl_gt_i_21 <-
    gt(exibble) |>
    tab_footnote(footnote = "Footnote.") |>
    opt_interactive()

  tbl_gt_i_22 <-
    gt(exibble) |>
    tab_source_note(source_note = "Source Note.") |>
    tab_footnote(footnote = "Footnote.") |>
    opt_interactive()

  # #1702
  tbl_gt_i_23 <-
    gt(exibble, rownames_to_stub = TRUE) |>
    opt_interactive()

  tbl_gt_i_24 <-
    gt(mtcars_short, rowname_col = "vs") |>
    opt_interactive()

  # #1705
  # FIXME the number of rows at the bottom is incorrect.
  tbl_gt_i_25 <-
    gt(mtcars_short, groupname_col = "vs") |>
    opt_interactive()

  # #1758 tab_stubhead() respected (shown on top of group)
  tbl_gt_i_26 <-
    gt(mtcars_short, groupname_col = "vs", rownames_to_stub = TRUE) |>
    tab_stubhead("stub label on top of vs") |>
    opt_interactive()

  # #1758 NA rows show correctly + stubhead shows on top of row
  tbl_gt_i_27 <-
    gt(exibble, rowname_col = "char") |>
    tab_stubhead("stub label on top of rowname") |>
    opt_interactive()

  # #1785 cols_merge works
  tbl_gt_i_28 <- sp500 |>
    dplyr::slice(50:55) |>
    dplyr::select(-volume, -adj_close) |>
    gt() |>
    cols_merge(columns = c(open, close), pattern = "{1}&mdash;{2}") |>
    cols_merge(columns = c(low, high), pattern = "{1}&mdash;{2}") |>
    cols_label(open = "open/close", low = "low/high") |>
    opt_interactive()

  # #1759 sub_ works
  tbl_gt_i_29 <- exibble |>
    gt() |>
    sub_missing(rows = 1:7) |>
    opt_interactive()

  # Styling with `cells_stubhead()` works
  tbl_gt_i_30 <- exibble |>
    gt::gt(rowname_col = "row", groupname_col = "group", row_group_as_column = TRUE) |>
    tab_spanner("spanners", c(char, num)) |>
    tab_stubhead("Stub row") |>
    tab_style(
      style = list(cell_fill("#f0f0f0"), cell_text(weight = "bold")),
      cells_stubhead()
    ) |> opt_interactive()

  # footnote with cells_stubhead() works
  tbl_gt_i_31 <- exibble |>
    gt(groupname_col = "group", row_group_as_column = TRUE) |>
    tab_stubhead(
      "stubhead label"
    ) |>
    tab_footnote(
      footnote = "Stubhead foot",
      locations = cells_stubhead()
    ) |>
    opt_interactive()

  # footnote with `cells_stubhead()` works
  tbl_gt_i_32 <- exibble |>
    gt(rownames_to_stub = TRUE) |>
    tab_stubhead(
      "stubhead label"
    ) |>
    tab_footnote(
      footnote = "Stubhead foot",
      locations = cells_stubhead()
    ) |>
    opt_interactive()

  capture_output(expect_no_error(tbl_gt_i_01))
  capture_output(expect_no_error(tbl_gt_i_02))
  capture_output(expect_no_error(tbl_gt_i_03))
  capture_output(expect_no_error(tbl_gt_i_04))
  capture_output(expect_no_error(tbl_gt_i_05))
  capture_output(expect_no_error(tbl_gt_i_06))
  capture_output(expect_no_error(tbl_gt_i_07))
  capture_output(expect_no_error(tbl_gt_i_08))
  capture_output(expect_no_error(tbl_gt_i_09))
  capture_output(expect_no_error(tbl_gt_i_10))
  capture_output(expect_no_error(tbl_gt_i_11))
  capture_output(expect_no_error(tbl_gt_i_12))
  capture_output(expect_no_error(tbl_gt_i_13))
  capture_output(expect_no_error(tbl_gt_i_14))
  capture_output(expect_no_error(tbl_gt_i_15))
  capture_output(expect_no_error(tbl_gt_i_16))
  capture_output(expect_no_error(tbl_gt_i_17))
  capture_output(expect_no_error(tbl_gt_i_18))
  capture_output(expect_no_error(tbl_gt_i_19))
  capture_output(expect_no_error(tbl_gt_i_20))
  capture_output(expect_no_error(tbl_gt_i_21))
  capture_output(expect_no_error(tbl_gt_i_22))
  capture_output(expect_no_error(tbl_gt_i_23))
  capture_output(expect_no_error(tbl_gt_i_24))
  capture_output(expect_no_error(tbl_gt_i_25))
  capture_output(expect_no_error(tbl_gt_i_26))
  capture_output(expect_no_error(tbl_gt_i_27))
  capture_output(expect_no_error(tbl_gt_i_28))
  capture_output(expect_no_error(tbl_gt_i_29))
  capture_output(expect_no_error(tbl_gt_i_30))
  capture_output(expect_no_error(tbl_gt_i_31))
  capture_output(expect_no_error(tbl_gt_i_32))
})
