test_that("opt_footnote_marks() sets the correct options", {

  set_marks <- c("*", "+", "~", "<", ">")

  gt_tbl <- gt(exibble)
  tbl_opts <- dt_options_get_values(gt_tbl)

  expect_equal(tbl_opts$footnotes_marks, "numbers")

  gt_tbl_2 <- opt_footnote_marks(gt_tbl, marks = set_marks)
  tbl_opts_2 <- dt_options_get_values(gt_tbl_2)
  expect_equal(tbl_opts_2$footnotes_marks, set_marks)

  gt_tbl_3 <- opt_footnote_marks(gt_tbl, marks = LETTERS)
  tbl_opts_3 <- dt_options_get_values(gt_tbl_3)
  expect_equal(tbl_opts_3$footnotes_marks, LETTERS)

  expect_error(gt_tbl |> opt_footnote_marks(NULL))
  expect_error(gt_tbl |> opt_footnote_marks("set_1"))
  expect_error(gt_tbl |> opt_footnote_marks(1:5))
  expect_error(gt_tbl |> opt_footnote_marks(character(0L)))
})

test_that("opt_row_striping() sets the correct options", {

  exibble |>
    gt() |>
    dt_options_get_value("row_striping_include_table_body") |>
    expect_false()

  exibble |>
    gt() |>
    opt_row_striping() |>
    dt_options_get_value("row_striping_include_table_body") |>
    expect_true()

  exibble |>
    gt() |>
    opt_row_striping() |>
    opt_row_striping(row_striping = FALSE) |>
    dt_options_get_value("row_striping_include_table_body") |>
    expect_false()
})

test_that("opt_align_table_header() sets the correct options", {

  exibble |>
    gt() |>
    dt_options_get_value("heading_align") |>
    expect_equal("center")

  exibble |>
    gt() |>
    opt_align_table_header() |>
    dt_options_get_value("heading_align") |>
    expect_equal("left")

  exibble |>
    gt() |>
    opt_align_table_header("left") |>
    dt_options_get_value("heading_align") |>
    expect_equal("left")

  exibble |>
    gt() |>
    opt_align_table_header("center") |>
    dt_options_get_value("heading_align") |>
    expect_equal("center")

  exibble |>
    gt() |>
    opt_align_table_header("right") |>
    dt_options_get_value("heading_align") |>
    expect_equal("right")

  expect_error(exibble |> gt() |> opt_align_table_header(1))
  expect_error(exibble |> gt() |> opt_align_table_header(c("left", "right")))
  expect_error(exibble |> gt() |> opt_align_table_header(c("justify")))
})

test_that("opt_all_caps() sets the correct options", {

  tbl <- exibble |> gt()
  tbl_opts <- dt_options_get_values(tbl)


  expect_equal(tbl_opts$column_labels_text_transform, "inherit")
  expect_equal(tbl_opts$column_labels_font_size, "100%")
  expect_equal(tbl_opts$column_labels_font_weight, "normal")
  expect_equal(tbl_opts$stub_text_transform, "inherit")
  expect_equal(tbl_opts$stub_font_size, "100%")
  expect_equal(tbl_opts$stub_font_weight, "initial")
  expect_equal(tbl_opts$row_group_text_transform, "inherit")
  expect_equal(tbl_opts$row_group_font_size, "100%")
  expect_equal(tbl_opts$row_group_font_weight, "initial")

  tbl <- exibble |> gt() |> opt_all_caps()

  tbl |> dt_options_get_value("column_labels_text_transform") |> expect_equal("uppercase")
  tbl |> dt_options_get_value("column_labels_font_size") |> expect_equal("80%")
  tbl |> dt_options_get_value("column_labels_font_weight") |> expect_equal("bolder")
  tbl |> dt_options_get_value("stub_text_transform") |> expect_equal("uppercase")
  tbl |> dt_options_get_value("stub_font_size") |> expect_equal("80%")
  tbl |> dt_options_get_value("stub_font_weight") |> expect_equal("bolder")
  tbl |> dt_options_get_value("row_group_text_transform") |> expect_equal("uppercase")
  tbl |> dt_options_get_value("row_group_font_size") |> expect_equal("80%")
  tbl |> dt_options_get_value("row_group_font_weight") |> expect_equal("bolder")

  tbl <- exibble |> gt(rowname_col = "row") |> opt_all_caps(locations = c("column_labels", "stub"))

  tbl |> dt_options_get_value("column_labels_text_transform") |> expect_equal("uppercase")
  tbl |> dt_options_get_value("column_labels_font_size") |> expect_equal("80%")
  tbl |> dt_options_get_value("column_labels_font_weight") |> expect_equal("bolder")
  tbl |> dt_options_get_value("stub_text_transform") |> expect_equal("uppercase")
  tbl |> dt_options_get_value("stub_font_size") |> expect_equal("80%")
  tbl |> dt_options_get_value("stub_font_weight") |> expect_equal("bolder")
  tbl |> dt_options_get_value("row_group_text_transform") |> expect_equal("inherit")
  tbl |> dt_options_get_value("row_group_font_size") |> expect_equal("100%")
  tbl |> dt_options_get_value("row_group_font_weight") |> expect_equal("initial")

  tbl <- exibble |> gt(rowname_col = "row") |> opt_all_caps() |> opt_all_caps(all_caps = FALSE)

  tbl |> dt_options_get_value("column_labels_text_transform") |> expect_equal("inherit")
  tbl |> dt_options_get_value("column_labels_font_size") |> expect_equal("100%")
  tbl |> dt_options_get_value("column_labels_font_weight") |> expect_equal("normal")
  tbl |> dt_options_get_value("stub_text_transform") |> expect_equal("inherit")
  tbl |> dt_options_get_value("stub_font_size") |> expect_equal("100%")
  tbl |> dt_options_get_value("stub_font_weight") |> expect_equal("initial")
  tbl |> dt_options_get_value("row_group_text_transform") |> expect_equal("inherit")
  tbl |> dt_options_get_value("row_group_font_size") |> expect_equal("100%")
  tbl |> dt_options_get_value("row_group_font_weight") |> expect_equal("initial")

  expect_error(exibble |> gt() |> opt_all_caps(locations = c("column_labels", "footer")))
})

test_that("opt_table_lines() sets the correct options", {

  tbl <- exibble |> gt()

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("heading_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("heading_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_vlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("stub_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_hlines_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_vlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("summary_row_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("footnotes_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("footnotes_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("source_notes_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("solid")

  tbl <- exibble |> gt() |> opt_table_lines()

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("heading_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("heading_border_lr_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_vlines_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_lr_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_left_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_right_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("stub_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_hlines_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_vlines_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("summary_row_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("footnotes_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("footnotes_border_lr_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("source_notes_border_lr_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("solid")

  tbl <- exibble |> gt() |> opt_table_lines(extent = "none")

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("heading_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_vlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("stub_border_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_body_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_body_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_body_hlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("summary_row_border_style") |> expect_equal("none")
  tbl |> dt_options_get_value("grand_summary_row_border_style") |> expect_equal("none")
  tbl |> dt_options_get_value("footnotes_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("source_notes_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("none")

  # doesn't set font.style
  expect_false(dt_options_get_value(tbl, "table_font_style") == "none")

  tbl <- exibble |> gt() |> opt_table_lines() |> opt_table_lines(extent = "default")

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("heading_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("heading_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_vlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("column_labels_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("column_labels_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("row_group_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("row_group_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("stub_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_hlines_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_body_vlines_style") |> expect_equal("none")
  tbl |> dt_options_get_value("summary_row_border_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("footnotes_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("footnotes_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("source_notes_border_lr_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("solid")
})

test_that("opt_table_outline() function sets the correct options", {

  tbl <- exibble |> gt()

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_top_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_top_color") |> expect_equal("#A8A8A8")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_bottom_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_bottom_color") |> expect_equal("#A8A8A8")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_left_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_left_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_right_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_right_color") |> expect_equal("#D3D3D3")

  tbl <- exibble |> gt(rowname_col = "row") |> opt_table_outline(style = "none")

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_top_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_top_color") |> expect_equal("#A8A8A8")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_bottom_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_bottom_color") |> expect_equal("#A8A8A8")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_left_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_left_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_right_width") |> expect_equal("2px")
  tbl |> dt_options_get_value("table_border_right_color") |> expect_equal("#D3D3D3")

  tbl <-
    exibble |>
    gt(rowname_col = "row") |>
    opt_table_outline(style = "solid", width = px(5), color = "#D3D3D3")

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_top_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_top_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_bottom_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_bottom_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_left_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_left_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("solid")
  tbl |> dt_options_get_value("table_border_right_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_right_color") |> expect_equal("#D3D3D3")

  tbl <-
    exibble |>
    gt(rowname_col = "row") |>
    opt_table_outline(style = "solid", width = px(5), color = "#D3D3D3") |>
    opt_table_outline(style = "none", width = px(3))

  tbl |> dt_options_get_value("table_border_top_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_top_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_top_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_bottom_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_bottom_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_bottom_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_left_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_left_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_left_color") |> expect_equal("#D3D3D3")
  tbl |> dt_options_get_value("table_border_right_style") |> expect_equal("none")
  tbl |> dt_options_get_value("table_border_right_width") |> expect_equal("5px")
  tbl |> dt_options_get_value("table_border_right_color") |> expect_equal("#D3D3D3")
})

test_that("opt_table_font() sets the correct options", {

  # Prepare a common gt table for all tests
  tbl <- exibble |> dplyr::select(char, time) |> gt()

  # Expect that a desired system font is placed at the
  # head of the `font-family` font listing
  tbl |>
    opt_table_font(font = "Courier") |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "table {", "font-family: Courier, system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |> expect_true()

  # Expect a replacement of the table's default
  # `font-family` values when `add = FALSE`
  tbl |>
    opt_table_font(font = "Courier", add = FALSE) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      ".gt_table {", "font-family: Courier;"
    ) |>
    expect_true()

  # Expect that `weight` and `style` options are passed as CSS values
  tbl |>
    opt_table_font(font = "Courier", weight = "bold", style = "italic") |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "font-weight: bold;",
      "font-style: italic;"
    ) |> expect_true()

  # Expect that the `size` option is passed as a CSS value
  tbl |>
    opt_table_font(size = px(32)) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within("font-size: 32px;") |>
    expect_true()

  # Expect that the `color` option is passed as a CSS value
  tbl |>
    opt_table_font(color = "#228B23") |>
    compile_scss() |>
    as.character() |>
    html_fragment_within("color: #228B23;") |>
    expect_true()

  # Expect that adding a font from the Google Fonts service
  # is possible with the `google_font()` function
  tbl |>
    opt_table_font(font = google_font(name = "Dancing Script")) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  # Expect that equally valid inputs include wrapping in a list or `c()`
  expect_equal(
    opt_table_font(tbl, font = google_font(name = "Dancing Script")) |> compile_scss(),
    opt_table_font(tbl, font = list(google_font(name = "Dancing Script"))) |> compile_scss(),
    ignore_attr = TRUE
  )

  expect_equal(
    opt_table_font(tbl, font = google_font(name = "Dancing Script")) |> compile_scss(),
    opt_table_font(tbl, font = c(google_font(name = "Dancing Script"))) |> compile_scss(),
    ignore_attr = TRUE
  )

  # Expect `google_font()` with system fonts inside of a list or `c()`
  tbl |>
    opt_table_font(font = list(google_font(name = "Dancing Script"), "serif")) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', serif, system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  tbl |>
    opt_table_font(font = c(google_font(name = "Dancing Script"), "serif")) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: 'Dancing Script', serif, system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  # Expect any combination of vectors and `google_font()` calls inside
  # of a list or `c()`
  tbl |> opt_table_font(font = list("serif", google_font(name = "Dancing Script"), "Courier", google_font(name = "Exo 2"))) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      "@import url(\"https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: serif, 'Dancing Script', Courier, 'Exo 2', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  tbl |>
    opt_table_font(font = c("serif", google_font(name = "Dancing Script"), "Courier", google_font(name = "Exo 2"))) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      "@import url(\"https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {", "font-family: serif, 'Dancing Script', Courier, 'Exo 2', system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  # Expect that font names are de-duplicated
  tbl |>
    opt_table_font(font = list(google_font(name = "Dancing Script"), "Courier", "Oxygen", "Courier")) |>
    compile_scss() |>
    as.character() |>
    html_fragment_within(
      "@import url(\"https://fonts.googleapis.com/css2?family=Dancing+Script:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap\");",
      ".gt_table {",
      "font-family: 'Dancing Script', Courier, Oxygen, system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';"
    ) |>
    expect_true()

  # Expect that weights given as numbers or strings create the
  # same outputs (e.g., 500 and "500")
  expect_equal(
    opt_table_font(tbl, font = google_font(name = "Dancing Script"), weight = 500) |> compile_scss(),
    opt_table_font(tbl, font = google_font(name = "Dancing Script"), weight = "500") |> compile_scss(),
    ignore_attr = TRUE
  )

  # Expect an error if input to `font` is not a character vector
  # or a list (but no errors otherwise)
  expect_error(opt_table_font(tbl, font = c(TRUE, FALSE)))
  expect_error(opt_table_font(tbl, font = 1:3))
  expect_no_error(opt_table_font(tbl, font = c("Courier", "Comic Sans MS")))
  expect_no_error(opt_table_font(tbl, font = list("Courier", "Comic Sans MS")))
  expect_no_error(opt_table_font(tbl, font = LETTERS))
})

test_that("opt_footnote_order() sets the correct order", {

  df <- data.frame(x = 1:2, y = 3:4)
  gt_tbl <- gt(df) |>
    tab_footnote("1 - unmarked")  |>
    tab_footnote("2- marked",locations = cells_column_labels(columns=y)) |>
    tab_footnote("3 - unmarked") |>
    tab_footnote("4 - marked",locations = cells_column_labels(columns=x))

  #default
  tbl_opts <- dt_options_get_values(gt_tbl)
  expect_equal(tbl_opts$footnotes_order, "marks_last")

  gt_tbl_2 <- opt_footnote_order(gt_tbl, order = "marks_first")
  tbl_opts_2 <- dt_options_get_values(gt_tbl_2)
  expect_equal(tbl_opts_2$footnotes_order, "marks_first")

  gt_tbl_3 <- opt_footnote_order(gt_tbl, order = "preserve_order")
  tbl_opts_3 <- dt_options_get_values(gt_tbl_3)
  expect_equal(tbl_opts_3$footnotes_order, "preserve_order")

  # invalid values
  expect_error(gt_tbl |> opt_footnote_order(NULL))
  expect_error(gt_tbl |> opt_footnote_order("set_1"))
  expect_error(gt_tbl |> opt_footnote_order(c("set_1","set_2")))
  expect_error(gt_tbl |> opt_footnote_order(1:5))
  expect_error(gt_tbl |> opt_footnote_order(character(0L)))

  # check footnote order is rearranged

  #default - marks last
  default_ord <- gt_tbl |>
    render_as_html() |>
    stringr::str_extract_all("\\d+\\s*-\\s*(unmarked|marked)")

  # marked last, x footnote before y
  expect_equal(unlist(default_ord),c("1 - unmarked","3 - unmarked","4 - marked","2- marked"))

  #marks first
  marks_first <- gt_tbl_2 |>
    render_as_html() |>
    stringr::str_extract_all("\\d+\\s*-\\s*(unmarked|marked)")

  # marked first, x footnote before y
  expect_equal(unlist(marks_first),c("4 - marked","2- marked","1 - unmarked","3 - unmarked"))

  # preserve order
  preserve_order <- gt_tbl_3 |>
    render_as_html() |>
    stringr::str_extract_all("\\d+\\s*-\\s*(unmarked|marked)")

  #1,2,3,4
  expect_equal(unlist(preserve_order),c("1 - unmarked","2- marked","3 - unmarked","4 - marked"))
})
