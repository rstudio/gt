context("Ensuring that the `opt_*()` functions work properly")

test_that("The `opt_footnote_marks()` function sets the correct options", {

  set_marks <- c("*", "+", "~", "<", ">")

  exibble %>%
    gt() %>%
    dt_options_get_value("footnotes_marks") %>%
    expect_equal("numbers")

  exibble %>%
    gt() %>%
    opt_footnote_marks(marks = set_marks) %>%
    dt_options_get_value("footnotes_marks") %>%
    expect_equal(c("*", "+", "~", "<", ">"))

  exibble %>%
    gt() %>%
    opt_footnote_marks(marks = LETTERS) %>%
    dt_options_get_value("footnotes_marks") %>%
    expect_equal(LETTERS)

  expect_error(exibble %>% gt() %>% opt_footnote_marks(NULL))
  expect_error(exibble %>% gt() %>% opt_footnote_marks("set_1"))
  expect_error(exibble %>% gt() %>% opt_footnote_marks(1:5))
  expect_error(exibble %>% gt() %>% opt_footnote_marks(character(0)))
})

test_that("The `opt_row_striping()` function sets the correct options", {

  exibble %>%
    gt() %>%
    dt_options_get_value("row_striping_include_table_body") %>%
    expect_false()

  exibble %>%
    gt() %>%
    opt_row_striping() %>%
    dt_options_get_value("row_striping_include_table_body") %>%
    expect_true()

  exibble %>%
    gt() %>%
    opt_row_striping() %>%
    opt_row_striping(row_striping = FALSE) %>%
    dt_options_get_value("row_striping_include_table_body") %>%
    expect_false()
})

test_that("The `opt_align_table_header()` function sets the correct options", {

  exibble %>%
    gt() %>%
    dt_options_get_value("heading_align") %>%
    expect_equal("center")

  exibble %>%
    gt() %>%
    opt_align_table_header() %>%
    dt_options_get_value("heading_align") %>%
    expect_equal("left")

  exibble %>%
    gt() %>%
    opt_align_table_header("left") %>%
    dt_options_get_value("heading_align") %>%
    expect_equal("left")

  exibble %>%
    gt() %>%
    opt_align_table_header("center") %>%
    dt_options_get_value("heading_align") %>%
    expect_equal("center")

  exibble %>%
    gt() %>%
    opt_align_table_header("right") %>%
    dt_options_get_value("heading_align") %>%
    expect_equal("right")

  expect_error(exibble %>% gt() %>% opt_align_table_header(1))
  expect_error(exibble %>% gt() %>% opt_align_table_header(c("left", "right")))
  expect_error(exibble %>% gt() %>% opt_align_table_header(c("justify")))
})

test_that("The `opt_all_caps()` function sets the correct options", {

  tbl <- exibble %>% gt()

  tbl %>% dt_options_get_value("column_labels_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("column_labels_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("column_labels_font_weight") %>% expect_equal("normal")
  tbl %>% dt_options_get_value("stub_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("stub_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("stub_font_weight") %>% expect_equal("initial")
  tbl %>% dt_options_get_value("row_group_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("row_group_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("row_group_font_weight") %>% expect_equal("initial")

  tbl <- exibble %>% gt() %>% opt_all_caps()

  tbl %>% dt_options_get_value("column_labels_text_transform") %>% expect_equal("uppercase")
  tbl %>% dt_options_get_value("column_labels_font_size") %>% expect_equal("80%")
  tbl %>% dt_options_get_value("column_labels_font_weight") %>% expect_equal("bolder")
  tbl %>% dt_options_get_value("stub_text_transform") %>% expect_equal("uppercase")
  tbl %>% dt_options_get_value("stub_font_size") %>% expect_equal("80%")
  tbl %>% dt_options_get_value("stub_font_weight") %>% expect_equal("bolder")
  tbl %>% dt_options_get_value("row_group_text_transform") %>% expect_equal("uppercase")
  tbl %>% dt_options_get_value("row_group_font_size") %>% expect_equal("80%")
  tbl %>% dt_options_get_value("row_group_font_weight") %>% expect_equal("bolder")

  tbl <- exibble %>% gt(rowname_col = "row") %>% opt_all_caps(locations = c("column_labels", "stub"))

  tbl %>% dt_options_get_value("column_labels_text_transform") %>% expect_equal("uppercase")
  tbl %>% dt_options_get_value("column_labels_font_size") %>% expect_equal("80%")
  tbl %>% dt_options_get_value("column_labels_font_weight") %>% expect_equal("bolder")
  tbl %>% dt_options_get_value("stub_text_transform") %>% expect_equal("uppercase")
  tbl %>% dt_options_get_value("stub_font_size") %>% expect_equal("80%")
  tbl %>% dt_options_get_value("stub_font_weight") %>% expect_equal("bolder")
  tbl %>% dt_options_get_value("row_group_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("row_group_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("row_group_font_weight") %>% expect_equal("initial")

  tbl <- exibble %>% gt(rowname_col = "row") %>% opt_all_caps() %>% opt_all_caps(all_caps = FALSE)

  tbl %>% dt_options_get_value("column_labels_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("column_labels_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("column_labels_font_weight") %>% expect_equal("normal")
  tbl %>% dt_options_get_value("stub_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("stub_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("stub_font_weight") %>% expect_equal("initial")
  tbl %>% dt_options_get_value("row_group_text_transform") %>% expect_equal("inherit")
  tbl %>% dt_options_get_value("row_group_font_size") %>% expect_equal("100%")
  tbl %>% dt_options_get_value("row_group_font_weight") %>% expect_equal("initial")

  expect_error(exibble %>% gt() %>% opt_all_caps(locations = c("column_labels", "footer")))
})

test_that("The `opt_table_lines()` function sets the correct options", {

  tbl <- exibble %>% gt()

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("heading_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("heading_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_vlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("stub_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_hlines_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_vlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("summary_row_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("footnotes_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("footnotes_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("source_notes_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("solid")

  tbl <- exibble %>% gt() %>% opt_table_lines()

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("heading_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("heading_border_lr_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_vlines_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_lr_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_left_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_right_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("stub_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_hlines_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_vlines_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("summary_row_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("footnotes_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("footnotes_border_lr_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("source_notes_border_lr_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("solid")

  tbl <- exibble %>% gt() %>% opt_table_lines(extent = "none")

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("heading_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_vlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("stub_border_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_body_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_body_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_body_hlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("summary_row_border_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("grand_summary_row_border_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("footnotes_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("source_notes_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("none")

  tbl <- exibble %>% gt() %>% opt_table_lines() %>% opt_table_lines(extent = "default")

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("heading_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("heading_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_vlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("column_labels_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("column_labels_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("row_group_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("row_group_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("stub_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_hlines_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_body_vlines_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("summary_row_border_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("footnotes_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("footnotes_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("source_notes_border_lr_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("solid")
})

test_that("The `opt_table_outline()` function sets the correct options", {

  tbl <- exibble %>% gt()

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_top_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_top_color") %>% expect_equal("#A8A8A8")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_bottom_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_bottom_color") %>% expect_equal("#A8A8A8")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_left_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_left_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_right_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_right_color") %>% expect_equal("#D3D3D3")

  tbl <- exibble %>% gt(rowname_col = "row") %>% opt_table_outline(style = "none")

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_top_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_top_color") %>% expect_equal("#A8A8A8")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_bottom_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_bottom_color") %>% expect_equal("#A8A8A8")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_left_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_left_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_right_width") %>% expect_equal("2px")
  tbl %>% dt_options_get_value("table_border_right_color") %>% expect_equal("#D3D3D3")

  tbl <-
    exibble %>%
    gt(rowname_col = "row") %>%
    opt_table_outline(style = "solid", width = px(5), color = "#D3D3D3")

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_top_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_top_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_bottom_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_bottom_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_left_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_left_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("solid")
  tbl %>% dt_options_get_value("table_border_right_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_right_color") %>% expect_equal("#D3D3D3")

  tbl <-
    exibble %>%
    gt(rowname_col = "row") %>%
    opt_table_outline(style = "solid", width = px(5), color = "#D3D3D3") %>%
    opt_table_outline(style = "none", width = px(3))

  tbl %>% dt_options_get_value("table_border_top_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_top_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_top_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_bottom_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_bottom_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_bottom_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_left_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_left_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_left_color") %>% expect_equal("#D3D3D3")
  tbl %>% dt_options_get_value("table_border_right_style") %>% expect_equal("none")
  tbl %>% dt_options_get_value("table_border_right_width") %>% expect_equal("5px")
  tbl %>% dt_options_get_value("table_border_right_color") %>% expect_equal("#D3D3D3")
})
