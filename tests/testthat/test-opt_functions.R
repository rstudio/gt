context("Ensuring that the `opt_*()` functions work properly")

# Helper function to compare a contiguous set of HTML fragments with raw html
html_fragment_within <- function(raw_html, ...) {
  grepl(paste0("\\Q", c(...), "\\E", "[\\n\\s]*?", collapse = ""), raw_html, perl = TRUE)
}

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

test_that("The `opt_table_font()` function sets the correct options", {

  # Prepare a common gt table for all tests
  tbl <- exibble %>% dplyr::select(char, time) %>% gt()

  # Expect that a desired system font is placed at the
  # head of the `font-family` font listing
  tbl %>% opt_table_font(font = "Courier") %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      ".gt_table {", "font-family: Courier, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  # Expect a replacement of the table's default
  # `font-family` values when `add = FALSE`
  tbl %>% opt_table_font(font = "Courier", add = FALSE) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      ".gt_table {", "font-family: Courier;", "}"
    ) %>% expect_true()

  # Expect that `weight` and `style` options are passed as CSS values
  tbl %>% opt_table_font(font = "Courier", weight = "bold", style = "italic") %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "font-weight: bold;",
      "font-style: italic;"
    ) %>% expect_true()

  # Expect that adding a font from the Google Fonts service
  # is possible with the `google_font()` function
  tbl %>% opt_table_font(font = google_font(name = "Dancing Script")) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  # Expect that equally valid inputs include wrapping in a list or `c()`
  expect_equivalent(
    tbl %>% opt_table_font(font = google_font(name = "Dancing Script")) %>% compile_scss(),
    tbl %>% opt_table_font(font = list(google_font(name = "Dancing Script"))) %>% compile_scss(),
    tbl %>% opt_table_font(font = c(google_font(name = "Dancing Script"))) %>% compile_scss()
  )

  # Expect `google_font()` with system fonts inside of
  # a list or `c()`
  tbl %>% opt_table_font(font = list(google_font(name = "Dancing Script"), "serif")) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', serif, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  tbl %>% opt_table_font(font = c(google_font(name = "Dancing Script"), "serif")) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', serif, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  # Expect any combination of vectors and `google_font()` calls inside
  # of a list or `c()`
  tbl %>% opt_table_font(font = list("serif", google_font(name = "Dancing Script"), "Courier", google_font(name = "Exo 2"))) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      "@import url(\"https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: serif, 'Dancing Script', Courier, 'Exo 2', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  tbl %>% opt_table_font(font = c("serif", google_font(name = "Dancing Script"), "Courier", google_font(name = "Exo 2"))) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      "@import url(\"https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: serif, 'Dancing Script', Courier, 'Exo 2', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;", "}"
    ) %>% expect_true()

  # Expect that font names are de-duplicated
  tbl %>% opt_table_font(font = list(google_font(name = "Dancing Script"), "Courier", "Oxygen", "Courier")) %>%
    compile_scss() %>% as.character() %>%
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {",
      "font-family: 'Dancing Script', Courier, Oxygen, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Ubuntu, Cantarell, 'Helvetica Neue', 'Fira Sans', 'Droid Sans', Arial, sans-serif;",
      "}"
    ) %>% expect_true()

  # Expect that weights given as numbers or strings create the
  # same outputs (e.g., 500 and "500")
  expect_equivalent(
    tbl %>% opt_table_font(font = google_font(name = "Dancing Script"), weight = 500) %>% compile_scss(),
    tbl %>% opt_table_font(font = google_font(name = "Dancing Script"), weight = "500") %>% compile_scss()
  )

  # Expect an error if input to `font` is not a character vector
  # or a list (but no errors otherwise)
  expect_error(tbl %>% opt_table_font(font = c(TRUE, FALSE)))
  expect_error(tbl %>% opt_table_font(font = 1:3))
  expect_error(regexp = NA, tbl %>% opt_table_font(font = c("Courier", "Comic Sans MS")))
  expect_error(regexp = NA, tbl %>% opt_table_font(font = list("Courier", "Comic Sans MS")))
  expect_error(regexp = NA, tbl %>% opt_table_font(font = LETTERS))
})

