
prep_data <- function(gt) {
  gt <- build_data(data = gt, context = "html")
  gt <- add_css_styles(data = gt)
}

has_class <- function(layout, class) {
  vapply(layout$classes, `%in%`, x = class, logical(1))
}

# Layout tests ------------------------------------------------------------

test_that("create_caption_component_g() creates captions", {

  df <- data.frame(x = 1:2, y = 3:4)

  gt <- gt(df)

  test <- create_caption_component_g(prep_data(gt))

  expect_null(test)

  gt <- gt |> tab_caption("foobar")

  test <- create_caption_component_g(prep_data(gt))

  expect_equal(dim(test), c(1, 8))
  expect_equal(test$right, 2)
  expect_equal(test$label, "foobar")
  expect_length(test$classes[[1]], 2)
})

test_that("create_heading_component_g() creates headings", {

  df <- data.frame(x = 1:2, y = 3:4)

  gt <- gt(df)

  test <- create_heading_component_g(prep_data(gt))

  expect_null(test)

  test <- create_heading_component_g(prep_data(tab_header(gt, title = "Foo")))

  expect_equal(dim(test), c(1, 8))
  expect_equal(test$right, 2)
  expect_equal(test$label, "Foo")
  expect_contains(test$classes[[1]], "gt_title")

  test <- create_heading_component_g(prep_data(tab_header(gt, "Foo", "Bar")))

  expect_equal(dim(test), c(2, 8))
  expect_equal(test$top, c(1, 2))
  expect_equal(test$label, c("Foo", "Bar"))
  expect_contains(test$classes[[2]], "gt_subtitle")

  gt <-
    gt |> tab_header("Foo", "Bar") |>
    tab_footnote("x", cells_title("title")) |>
    tab_footnote("y", cells_title("subtitle"))

  test <- create_heading_component_g(prep_data(gt))

  expect_equal(dim(test), c(2, 8))
  expect_match(test$label, "gt_footnote_marks")
})

test_that("create_columns_component_g() creates columns and spanners", {

  df <- data.frame(A = 1:2, B = 3:4, C = 5:6)
  gt <- gt(df)

  test <- create_columns_component_g(prep_data(gt))

  expect_equal(test$right, 1:3)
  expect_equal(test$top, rep(1, 3))

  expect_equal(
    has_class(test, "gt_col_heading"),
    c(TRUE, TRUE, TRUE)
  )

  test <-
    gt |>
    tab_spanner("BC", c("B", "C")) |>
    prep_data() |>
    create_columns_component_g()

  expect_equal(test$left, c(2, 1, 2, 3))
  expect_equal(test$right, c(3, 1, 2, 3))
  expect_equal(test$label, c("BC", "A", "B", "C"))

  expect_equal(
    has_class(test, "gt_col_heading"),
    c(FALSE, TRUE, TRUE, TRUE)
  )

  expect_equal(
    has_class(test, "gt_column_spanner"),
    c(TRUE, FALSE, FALSE, FALSE)
  )

  test <-
    gt |>
    tab_spanner("BC", c("B", "C")) |>
    tab_spanner("AB", c("A", "B")) |>
    prep_data() |>
    create_columns_component_g()

  expect_equal(test$left,  c(1, 2, 1, 2, 3))
  expect_equal(test$right, c(2, 3, 1, 2, 3))
  expect_equal(test$top,   c(1, 2, 3, 3, 3))
  expect_equal(test$label, c("AB", "BC", "A", "B", "C"))

  expect_equal(
    has_class(test, "gt_columns_spanner_outer"),
    c(TRUE, FALSE, FALSE, FALSE, FALSE)
  )

  test <-
    gt |>
    tab_spanner("AB", c("A", "B")) |>
    tab_spanner("BC", c("B", "C")) |>
    tab_row_group("X", 1:2) |>
    tab_options(row_group.as_column = TRUE) |>
    tab_stubhead("S") |>
    prep_data() |>
    create_columns_component_g()

  expect_snapshot(test)
})

test_that("group_headings_g() creates appropriate group headings", {

  df <- data.frame(x = 1:3, y = 4:6)

  gt <-
    gt(df) |>
    tab_row_group("B", rows = 3)

  test <-
    gt |>
    prep_data() |>
    group_headings_g()

  expect_equal(vctrs::list_sizes(test), c(1, 1))

  test <- vctrs::vec_c(test[[1]][[1]], test[[2]][[1]])

  expect_equal(test$label, c("B", ""))
  expect_equal(test$classes[[1]], c("gt_group_heading", "gt_group_heading_row"))
  expect_equal(test$classes[[2]], c("gt_empty_group_heading", "gt_group_heading_row"))

  test <-
    gt |>
    tab_row_group("A", rows = 1:2) |>
    prep_data() |>
    group_headings_g()

  expect_equal(vctrs::list_sizes(test), c(1, 1))

  test <- vctrs::vec_c(test[[1]][[1]], test[[2]][[1]])

  expect_equal(test$label, c("A", "B"))

  expect_equal(
    has_class(test, "gt_empty_group_heading"),
    c(FALSE, FALSE)
  )

  test <-
    gt |>
    tab_options(row_group.as_column = TRUE) |>
    prep_data() |>
    group_headings_g()

  expect_null(test)
})

test_that("body_cells_g() creates appropriate cells", {

  df <- data.frame(x = 1:3, y = 4:6, row = c("A", "B", "C"))

  gt <-
    gt(df, rowname_col = "row") |>
    tab_row_group("X", rows = 1:2) |>
    tab_row_group("Y", rows = 3) |>
    row_group_order(c("X", "Y"))

  test <-
    gt |>
    tab_options(
      row.striping.include_table_body = TRUE,
      row.striping.include_stub = TRUE
    ) |>
    prep_data() |>
    body_cells_g()

  expect_equal(vctrs::list_sizes(test), c(3, 3, 3))

  test <- vctrs::vec_c(!!!test)

  # FIXME with row.striping.include_stub = TRUE,
  expect_equal(
    has_class(test, "gt_striped"),
    rep(c(FALSE, TRUE, FALSE), each = 3)
  )

  # Has the correct class, but is not striped?
  expect_contains(
    unlist(test[test$label == "B", ]$classes),
    c("gt_stub", "gt_striped")
  )

  expect_equal(
    has_class(test, "gt_stub"),
    rep(c(TRUE, FALSE, FALSE), 3)
  )

  expect_equal(test$label, c("A", 1, 4, "B", 2, 5, "C", 3, 6))

  test <-
    gt |>
    tab_options(
      row_group.as_column = TRUE
    ) |>
    prep_data() |>
    body_cells_g()

  expect_equal(vctrs::list_sizes(test), c(4, 3, 4))

  test <- vctrs::vec_c(!!!test)

  expect_equal(test$label, c("X", "A", 1, 4, "B", 2, 5, "Y", "C", 3, 6))

  expect_equal(
    has_class(test, "gt_stub_row_group"),
    rep(c(TRUE, FALSE, TRUE, FALSE), c(1, 6, 1, 3))
  )
})

test_that("summary_rows_g() creates appropriate cells for group summaries", {

  df <- data.frame(x = 1:3, y = 4:6)

  gt <-
    gt(df) |>
    tab_row_group("X", rows = 1:2) |>
    tab_row_group("Y", rows = 3) |>
    row_group_order(c("X", "Y"))

  # No row summaries
  test <-
    gt |>
    prep_data() |>
    summary_rows_g(group_id = c("X", "Y"))

  expect_null(test)

  test <-
    gt |>
    summary_rows(
      fns = list("min", "max")
    ) |>
    prep_data() |>
    summary_rows_g(group_id = c("X", "Y"))

  expect_length(test, 2)

  test <- unlist(test, recursive = FALSE)

  expect_equal(vctrs::list_sizes(test), c(3, 3, 3, 3))

  test <- vctrs::vec_c(!!!test)

  expect_equal(test$label, c("min", 1, 4, "max", 2, 5, "min", 3, 6, "max", 3, 6))

  expect_equal(
    has_class(test, "gt_last_summary_row"),
    rep(c(FALSE, TRUE, FALSE, TRUE), each = 3)
  )
})

test_that("summary_rows_g() creates appropriate cells for grand summaries", {

  df <- data.frame(x = 1:3, y = 4:6)

  # No grand summary
  test <-
    gt(df) |>
    prep_data() |>
    summary_rows_g(group_id = grand_summary_col)

  expect_null(test)

  test <-
    gt(df) |>
    grand_summary_rows(fns = list("min", "max")) |>
    prep_data() |>
    summary_rows_g(group_id = grand_summary_col)

  expect_equal(vctrs::list_sizes(test[[1]]), c(3, 3))

  test <- vctrs::vec_c(!!!test[[1]])

  expect_equal(test$label, c("min", 1, 4, "max", 3, 6))

  expect_equal(
    has_class(test, "gt_first_grand_summary_row"),
    rep(c(TRUE, FALSE), each = 3)
  )

  expect_equal(
    has_class(test, "gt_last_summary_row"),
    rep(c(FALSE, TRUE), each = 3)
  )
})

test_that("create_body_component_g() places group summaries correctly", {

  df <- data.frame(x = 1:3, y = 4:6)

  gt <-
    gt(df) |>
    tab_row_group("X", rows = 1:2) |>
    tab_row_group("Y", rows = 3) |>
    row_group_order(c("X", "Y"))

  test <-
    gt |>
    summary_rows(fns = "mean", side = "bottom") |>
    prep_data() |>
    create_body_component_g()

  # Test headings have correct vertical position and span cells
  heading <- vapply(test$classes, `%in%`, logical(1), x = "gt_group_heading")

  expect_equal(test$bottom[heading], c(1, 5))
  expect_equal((test$right - test$left)[heading], c(2, 2))
  expect_equal(unique((test$right - test$left)[!heading]), 0)

  # Summary is at bottom
  summary <- has_class(test, "gt_summary_row")

  expect_equal(test$bottom[summary], rep(c(4, 7), each = 3))

  test <-
    gt |>
    summary_rows(fns = "mean", side = "top") |>
    prep_data() |>
    create_body_component_g()

  # Summary is at top
  summary <- has_class(test, "gt_summary_row")

  expect_equal(test$bottom[summary], rep(c(2, 6), each = 3))
})

test_that("create_body_component_g() places grand summaries correctly", {

  df <- data.frame(x = 1:3, y = 4:6)

  test <-
    gt(df) |>
    grand_summary_rows(fns = "mean", side = "top") |>
    prep_data() |>
    create_body_component_g()

  # Summary is at top
  summary <- has_class(test, "gt_grand_summary_row")

  expect_equal(test$bottom[summary], rep(1, each = 3))

  test <-
    gt(df) |>
    grand_summary_rows(fns = "mean", side = "bottom") |>
    prep_data() |>
    create_body_component_g()

  # Summary is at bottom
  summary <- has_class(test, "gt_grand_summary_row")

  expect_equal(test$bottom[summary], rep(4, each = 3))
})

test_that("create_source_notes_component_g() creates source notes", {

  gt <-
    data.frame(x = 1:3, y = 4:6) |>
    gt() |>
    tab_source_note(source_note = "Multi") |>
    tab_source_note(source_note = "line")

  test <-
    gt |>
    tab_options(source_notes.multiline = TRUE) |>
    prep_data() |>
    create_source_notes_component_g()

  expect_equal(test$label, "Multi\nline")
  expect_equal(test$classes, list(c("gt_sourcenotes", "gt_sourcenote")))

  test <-
    gt |>
    tab_options(source_notes.multiline = FALSE) |>
    prep_data() |>
    create_source_notes_component_g()

  expect_equal(test$label, "Multi line")
})

test_that("create_footnotes_component_g() creates footnotes", {

  gt <-
    data.frame(x = 1:3, y = 4:6) |>
    gt() |>
    tab_footnote("Multi") |>
    tab_footnote("line")

  test <-
    gt |>
    tab_options(footnotes.multiline = TRUE) |>
    prep_data() |>
    create_footnotes_component_g()

  expect_equal(test$label, "Multi\nline")
  expect_equal(test$classes, list(c("gt_footnotes", "gt_footnote")))

  test <-
    gt |>
    tab_options(footnotes.multiline = FALSE) |>
    prep_data() |>
    create_footnotes_component_g()

  expect_equal(test$label, "Multi line")
})

# Style test --------------------------------------------------------------

test_that("Styles end up in the correct cells", {

  final_layout <- function(data) {

    caption_component <-
      create_caption_component_g(data = data)

    heading_component <-
      create_heading_component_g(data = data)

    columns_component <-
      create_columns_component_g(data = data)

    body_component <-
      create_body_component_g(data = data)

    source_notes_component <-
      create_source_notes_component_g(data = data)

    footnotes_component <-
      create_footnotes_component_g(data = data)

    layout <-
      combine_components(
        caption   = caption_component,
        heading   = heading_component,
        columns   = columns_component,
        body      = body_component,
        source    = source_notes_component,
        footnotes = footnotes_component
      )
  }

  gt <-
    data.frame(
      x = 1:7, y = 10:16, z = letters[1:7],
      grp = rep(c("X", "Y"), c(4, 3))
    ) |>
    gt(groupname_col = "grp") |>
    summary_rows(columns = c("x", "y"), fns = "mean") |>
    grand_summary_rows(columns = c("x", "y"), fns = "sum") |>
    tab_stubhead("stub") |>
    tab_spanner("XY", c("x", "y")) |>
    tab_spanner("YZ", c("y", "z")) |>
    tab_header("Title", "Subtitle") |>
    tab_footnote("Footnote") |>
    tab_source_note("Source note")

  # Test no style applied
  test <-
    gt |>
    prep_data() |>
    final_layout() |>
    dplyr::filter(nzchar(label))

  expect_equal(test$style, rep(NA_character_, nrow(test)))

  # Apply styles everywhere
  test <-
    gt |>
    tab_style(
      style = cell_fill("red"),
      locations = cells_body("y", 3)
    ) |>
    tab_style(
      style = cell_fill("blue"),
      locations = cells_column_labels("z")
    ) |>
    tab_style(
      style = cell_fill("green"),
      locations = cells_summary("X", columns = "x")
    ) |>
    tab_style(
      style = cell_fill("yellow"),
      locations = cells_row_groups("Y")
    ) |>
    tab_style(
      style = cell_fill("purple"),
      locations = cells_grand_summary("y")
    ) |>
    tab_style(
      style = cell_fill("orange"),
      locations = cells_stub_grand_summary()
    ) |>
    tab_style(
      style = cell_fill("cyan"),
      locations = cells_stub_summary("Y")
    ) |>
    tab_style(
      style = cell_fill("magenta"),
      locations = cells_stub(4)
    ) |>
    tab_style(
      style = cell_fill("grey"),
      locations = cells_footnotes()
    ) |>
    tab_style(
      style = cell_fill("maroon"),
      locations = cells_source_notes()
    ) |>
    tab_style(
      style = cell_fill("limegreen"),
      locations = cells_column_spanners("XY")
    ) |>
    tab_style(
      style = cell_fill("dodgerblue"),
      locations = cells_stubhead()
    ) |>
    tab_style(
      style = cell_fill("gold"),
      locations = cells_title("subtitle")
    ) |>
    tab_style(
      style = cell_fill("hotpink"),
      locations = cells_title("title")
    ) |>
    prep_data() |>
    final_layout() |>
    dplyr::filter(!is.na(style))

  expect_snapshot(test)
})

test_that("Classes and styles are parsed correctly", {

  gt <-
    data.frame(x = 1, y = "A") |>
    gt() |>
    tab_options(
      table_body.vlines.color = "red",
      table_body.vlines.width = "2px",
      table_body.vlines.style = "solid",
      table_body.hlines.style = "dotted",
      table_body.hlines.width = "4px",
      table.font.style = "italic",
      table.font.size = 24,
      table.font.names = "Times New Roman",
      table.font.color = "green"
    ) |>
    tab_style(
      style = cell_fill("blue"),
      locations = cells_body("y")
    )

  test <- prep_data(gt)

  rows <- create_body_component_g(test)

  style <- grid_resolve_style(layout = rows, data = test)

  expect_equal(
    style[[1]]$text_gp,
    grid::gpar(
      fontfamily = "Times New Roman", fontsize = 18.0675,
      col = "#00FF00", fontface = "italic"
    )
  )

  expect_equal(
    style[[1]]$border_gp,
    grid::gpar(
      lwd = c(2.26, 1.13, 1.13),
      lty = c(3, 1, 1),
      col = c("#D3D3D3", "#FF0000", "#FF0000"),
      lineend = "butt"
    ),
    tolerance = 1e-2
  )

  expect_equal(
    style[[1]][c("vjust", "hjust", "margin", "cell_gp")],
    list(
      vjust = 0.5,
      hjust = 1,
      margin = grid::unit(c(6, 3.7, 6, 3.7), "pt"),
      cell_gp = grid::gpar(fill = "#FFFFFF", col = NA)
    ),
    tolerance = 1e-2
  )

  expect_equal(style[[2]]$cell_gp$fill, "#0000FF")
  expect_equal(style[[2]]$hjust, 0)
})

# Feature tests -----------------------------------------------------------

test_that("as_gtable() renders svg entries", {

  skip_if_not_installed("rsvg")

  df <- data.frame(
    x = 1,
    y = I("<svg width=\"100\" height=\"100\" xmlns=\"http://www.w3.org/2000/svg\"><circle cx=\"50\" cy=\"50\" r=\"50\"/></svg> ")
  )

  test <- as_gtable(gt(df))
  test <- test$grobs[test$layout$t == 2 & test$layout$l == 3][[1]]

  raster <- test$children[[2]]

  expect_equal(dim(raster$raster), c(312, 312))
  expect_equal(as.numeric(raster$width),  75)
  expect_equal(as.numeric(raster$height), 75)
})
