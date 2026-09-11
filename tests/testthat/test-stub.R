# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("The stub can be formatted with `fmt_*()` functions", {

  check_suggests()

  # Create a tibble for testing the stub and row groups
  tbl_1 <-
    dplyr::tibble(
      row = c("*one*", "**two**", "three", "4", "5ive", "`six`"),
      group = c(rep("Group A", 3), rep("Group B", 3)),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels
  gt_tbl_1 <-
    gt(tbl_1, rowname_col = "row") |>
    fmt_markdown(columns = row)

  # Create a `tbl_html` object from the `gt_tbl_1` object
  tbl_html_1 <-
    gt_tbl_1 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements
  tbl_html_1 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two", "three", "4", "5ive", "six"))

  # Create a gt table with a stub that has row labels, and, row groups
  # that run wide
  gt_tbl_2 <-
    gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = row)

  # Create a `tbl_html` object from the `gt_tbl_2` object
  tbl_html_2 <-
    gt_tbl_2 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements (same as in `gt_tbl_1`)
  tbl_html_2 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two", "three", "4", "5ive", "six"))

  # Create a gt table with a stub that has row labels, row groups that
  # run wide, and one footnote
  gt_tbl_3 <-
    gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
    tab_footnote(footnote = "footnote", locations = cells_stub(rows = "**two**")) |>
    fmt_markdown(columns = row)

  # Create a `tbl_html` object from the `gt_tbl_2` object
  tbl_html_3 <-
    gt_tbl_3 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements and the footnote glyph `"1"` to
  # be present
  tbl_html_3 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two1", "three", "4", "5ive", "six"))

  # Expect the footnote text to be present
  tbl_html_3 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal("1 footnote")

  # Create a variation of the prior tibble that has row groups in
  # alternating order
  tbl_2 <-
    dplyr::tibble(
      row = c("*one*", "**two**", "three", "4", "5ive", "`six`"),
      group = rep(c("Group A", "Group B"), 3),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels, row groups that
  # run wide, and two footnotes
  gt_tbl_4 <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = row) |>
    tab_footnote(footnote = "footnote `three`", locations = cells_stub(rows = "three")) |>
    tab_footnote(footnote = "footnote `4`", locations = cells_stub(rows = "4"))

  # Create a `tbl_html` object from the `gt_tbl_4` object
  tbl_html_4 <-
    gt_tbl_4 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_4 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "three1", "5ive", "two", "42", "six"))

  # Expect values in the `vals` column to be in the correct order
  tbl_html_4 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(c("1", "3", "5", "2", "4", "6"))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_4 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `three`", "2 footnote `4`"))

  # Create a gt table with a stub that has row labels, row groups that
  # run long, and two footnotes
  gt_tbl_5 <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = row) |>
    tab_footnote(footnote = "footnote `three`", locations = cells_stub(rows = "three")) |>
    tab_footnote(footnote = "footnote `4`", locations = cells_stub(rows = "4")) |>
    tab_options(row_group.as_column = TRUE)

  # Create a `tbl_html` object from the `gt_tbl_5` object
  tbl_html_5 <-
    gt_tbl_5 |>
    render_as_html() |>
    xml2::read_html()

  # Expect the row group (as column) to be present with text in the correct order
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub_row_group']") |>
    expect_equal(c("Group A", "Group B"))

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "three1", "5ive", "two", "42", "six"))

  # Expect values in the `vals` column to be in the correct order
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(c("1", "3", "5", "2", "4", "6"))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_5 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `three`", "2 footnote `4`"))

  # Create a variation of a tibble with numeric values in the
  # `row` column
  tbl_3 <-
    dplyr::tibble(
      row = 1:6,
      group = c(rep("Group A", 3), rep("Group B", 3)),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels, row groups that
  # run long, and two footnotes
  gt_tbl_6 <-
    gt(tbl_3, rowname_col = "row", groupname_col = "group") |>
    fmt_roman(columns = row) |>
    tab_footnote(footnote = "footnote `III`", locations = cells_stub(rows = "3")) |>
    tab_footnote(footnote = "footnote `IV`", locations = cells_stub(rows = "4")) |>
    tab_options(row_group.as_column = TRUE)

  # Create a `tbl_html` object from the `gt_tbl_6` object
  tbl_html_6 <-
    gt_tbl_6 |>
    render_as_html() |>
    xml2::read_html()

  # Expect the row group (as column) to be present with text in the correct order
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub_row_group']") |>
    expect_equal(c("Group A", "Group B"))

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_right gt_stub']") |>
    expect_equal(
      c(
        "I", "II",
        paste0("1", "\U000A0", "III"),
        paste0("2", "\U000A0", "IV"),
        "V", "VI"
      )
    )

  # Expect values in the `vals` column to be in the correct order
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(as.character(1:6))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_6 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `III`", "2 footnote `IV`"))
})

test_that("The stub can be formatted with `fmt_*()` functions and `stub()", {
  check_suggests()

  # Create a tibble for testing the stub and row groups
  tbl_1 <-
    dplyr::tibble(
      row = c("*one*", "**two**", "three", "4", "5ive", "`six`"),
      group = c(rep("Group A", 3), rep("Group B", 3)),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels
  gt_tbl_1 <-
    gt(tbl_1, rowname_col = "row") |>
    fmt_markdown(columns = stub())

  # Create a `tbl_html` object from the `gt_tbl_1` object
  tbl_html_1 <-
    gt_tbl_1 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements
  tbl_html_1 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two", "three", "4", "5ive", "six"))

  # Create a gt table with a stub that has row labels, and, row groups
  # that run wide
  gt_tbl_2 <-
    gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = stub())

  # Create a `tbl_html` object from the `gt_tbl_2` object
  tbl_html_2 <-
    gt_tbl_2 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements (same as in `gt_tbl_1`)
  tbl_html_2 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two", "three", "4", "5ive", "six"))

  # Create a gt table with a stub that has row labels, row groups that
  # run wide, and one footnote
  gt_tbl_3 <-
    gt(tbl_1, rowname_col = "row", groupname_col = "group") |>
    tab_footnote(footnote = "footnote", locations = cells_stub(rows = "**two**")) |>
    fmt_markdown(columns = stub())

  # Create a `tbl_html` object from the `gt_tbl_2` object
  tbl_html_3 <-
    gt_tbl_3 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements and the footnote glyph `"1"` to
  # be present
  tbl_html_3 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "two1", "three", "4", "5ive", "six"))

  # Expect the footnote text to be present
  tbl_html_3 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal("1 footnote")

  # Create a variation of the prior tibble that has row groups in
  # alternating order
  tbl_2 <-
    dplyr::tibble(
      row = c("*one*", "**two**", "three", "4", "5ive", "`six`"),
      group = rep(c("Group A", "Group B"), 3),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels, row groups that
  # run wide, and two footnotes
  gt_tbl_4 <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = stub()) |>
    tab_footnote(footnote = "footnote `three`", locations = cells_stub(rows = "three")) |>
    tab_footnote(footnote = "footnote `4`", locations = cells_stub(rows = "4"))

  # Create a `tbl_html` object from the `gt_tbl_4` object
  tbl_html_4 <-
    gt_tbl_4 |>
    render_as_html() |>
    xml2::read_html()

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_4 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "three1", "5ive", "two", "42", "six"))

  # Expect values in the `vals` column to be in the correct order
  tbl_html_4 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(c("1", "3", "5", "2", "4", "6"))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_4 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `three`", "2 footnote `4`"))

  # Create a gt table with a stub that has row labels, row groups that
  # run long, and two footnotes
  gt_tbl_5 <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    fmt_markdown(columns = stub()) |>
    tab_footnote(footnote = "footnote `three`", locations = cells_stub(rows = "three")) |>
    tab_footnote(footnote = "footnote `4`", locations = cells_stub(rows = "4")) |>
    tab_options(row_group.as_column = TRUE)

  # Create a `tbl_html` object from the `gt_tbl_5` object
  tbl_html_5 <-
    gt_tbl_5 |>
    render_as_html() |>
    xml2::read_html()

  # Expect the row group (as column) to be present with text in the correct order
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub_row_group']") |>
    expect_equal(c("Group A", "Group B"))

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub']") |>
    expect_equal(c("one", "three1", "5ive", "two", "42", "six"))

  # Expect values in the `vals` column to be in the correct order
  tbl_html_5 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(c("1", "3", "5", "2", "4", "6"))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_5 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `three`", "2 footnote `4`"))

  # Create a variation of a tibble with numeric values in the
  # `row` column
  tbl_3 <-
    dplyr::tibble(
      row = 1:6,
      group = c(rep("Group A", 3), rep("Group B", 3)),
      vals = 1:6
    )

  # Create a gt table with a stub that has row labels, row groups that
  # run long, and two footnotes
  gt_tbl_6 <-
    gt(tbl_3, rowname_col = "row", groupname_col = "group") |>
    fmt_roman(columns = stub()) |>
    tab_footnote(footnote = "footnote `III`", locations = cells_stub(rows = "3")) |>
    tab_footnote(footnote = "footnote `IV`", locations = cells_stub(rows = "4")) |>
    tab_options(row_group.as_column = TRUE)

  # Create a `tbl_html` object from the `gt_tbl_6` object
  tbl_html_6 <-
    gt_tbl_6 |>
    render_as_html() |>
    xml2::read_html()

  # Expect the row group (as column) to be present with text in the correct order
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub_row_group']") |>
    expect_equal(c("Group A", "Group B"))

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_right gt_stub']") |>
    expect_equal(
      c(
        "I", "II",
        paste0("1", "\U000A0", "III"),
        paste0("2", "\U000A0", "IV"),
        "V", "VI"
      )
    )

  # Expect values in the `vals` column to be in the correct order
  tbl_html_6 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(as.character(1:6))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_6 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `III`", "2 footnote `IV`"))

  # Create a gt table with a stub that has row labels, row groups that
  # run long, and two footnotes
  gt_tbl_7 <-
    gt(tbl_3, rowname_col = "row", groupname_col = "group") |>
    fmt_number(columns = stub(), decimals = 3) |>
    tab_footnote(footnote = "footnote `3`", locations = cells_stub(rows = "3")) |>
    tab_footnote(footnote = "footnote `4`", locations = cells_stub(rows = "4")) |>
    tab_options(row_group.as_column = TRUE)

  # Create a `tbl_html` object from the `gt_tbl_7` object
  tbl_html_7 <-
    gt_tbl_7 |>
    render_as_html() |>
    xml2::read_html()

  # Expect the row group (as column) to be present with text in the correct order
  tbl_html_7 |>
    selection_text(selection = "[class='gt_row gt_left gt_stub_row_group']") |>
    expect_equal(c("Group A", "Group B"))

  # Expect certain stub text elements and the footnote glyphs to be present
  tbl_html_7 |>
    selection_text(selection = "[class='gt_row gt_right gt_stub']") |>
    expect_equal(
      c(
        "1.000", "2.000",
        paste0("1", "\U000A0", "3.000"),
        paste0("2", "\U000A0", "4.000"),
        "5.000", "6.000"
      )
    )

  # Expect values in the `vals` column to be in the correct order
  tbl_html_7 |>
    selection_text(selection = "[class='gt_row gt_right']") |>
    expect_equal(as.character(1:6))

  # Expect the footnote text to be present (two footnotes)
  tbl_html_7 |>
    selection_text(selection = "[class='gt_footnote']") |>
    expect_equal(c("1 footnote `3`", "2 footnote `4`"))
})

test_that("gt(row_group_as_column = TRUE) works with multiple `groupname_col`", {
  many_grps <- gt(
    utils::head(gtcars, n = 8),
    groupname_col = c("ctry_origin", "mfr"),
    row_group_as_column = TRUE
  )
  stub_look <- xml2::read_xml(render_as_html(many_grps))
  row_groups <- stub_look |>
    selection_text(
      "[class='gt_row_group_first']"
    )
  # we expect 2 groups here
  expect_match(
    row_groups[1],
    "United States.+Ford"
  )
  expect_match(
    row_groups[2],
    "Italy.+Ferrari"
  )
})

test_that("summary_rows(side = 'top') with row_group.as_column = TRUE aligns correctly", {

  tbl_data <-
    data.frame(
      x = 1:7, y = 10:16, z = letters[1:7],
      grp = rep(c("X", "Y"), c(4, 3))
    )

  # Without rowname column
  gt_tbl <-
    tbl_data |>
    gt(groupname_col = "grp") |>
    summary_rows(columns = c("x", "y"), fns = "mean", side = "top") |>
    tab_options(row_group.as_column = TRUE)

  tbl_html <-
    gt_tbl |>
    render_as_html() |>
    xml2::read_html()

  body_rows <- xml2::xml_find_all(tbl_html, "//tbody/tr")

  # The summary row (row 1) should have 4 cells matching the 4 header columns:
  # summary label in stub, then x, y, z values
  summary_cells_1 <- xml2::xml_find_all(body_rows[[1]], ".//td|.//th")
  expect_equal(length(summary_cells_1), 4L)

  # The first body row (row 2) should have 4 cells: the group label cell

  # (with rowspan spanning all body rows) plus x, y, z
  body_cells_1 <- xml2::xml_find_all(body_rows[[2]], ".//td|.//th")
  expect_equal(length(body_cells_1), 4L)

  group_cell <- body_cells_1[[1]]
  expect_equal(xml2::xml_attr(group_cell, "rowspan"), "4")
  expect_equal(xml2::xml_text(group_cell), "X")

  # Remaining body rows should have 3 cells (covered by rowspan)
  for (i in 3:5) {
    cells <- xml2::xml_find_all(body_rows[[i]], ".//td|.//th")
    expect_equal(length(cells), 3L)
  }

  # Second group summary row
  summary_cells_2 <- xml2::xml_find_all(body_rows[[6]], ".//td|.//th")
  expect_equal(length(summary_cells_2), 4L)

  body_cells_2 <- xml2::xml_find_all(body_rows[[7]], ".//td|.//th")
  expect_equal(length(body_cells_2), 4L)
  expect_equal(xml2::xml_attr(body_cells_2[[1]], "rowspan"), "3")
  expect_equal(xml2::xml_text(body_cells_2[[1]]), "Y")

  # With rowname column: group cell should be on the summary row with
  # rowspan covering both summary and body rows
  gt_tbl_rn <-
    data.frame(
      x = 1:7, y = 10:16, z = letters[1:7],
      grp = rep(c("X", "Y"), c(4, 3)),
      rn = paste0("row", 1:7)
    ) |>
    gt(groupname_col = "grp", rowname_col = "rn") |>
    summary_rows(columns = c("x", "y"), fns = "mean", side = "top") |>
    tab_options(row_group.as_column = TRUE)

  tbl_html_rn <- gt_tbl_rn |>
    render_as_html() |>
    xml2::read_html()

  body_rows_rn <- xml2::xml_find_all(tbl_html_rn, "//tbody/tr")

  # Summary row should have 5 cells: group (rowspan), label, x, y, z
  summary_cells_rn <- xml2::xml_find_all(body_rows_rn[[1]], ".//td|.//th")
  expect_equal(length(summary_cells_rn), 5L)
  expect_equal(xml2::xml_attr(summary_cells_rn[[1]], "rowspan"), "5")
  expect_equal(xml2::xml_text(summary_cells_rn[[1]]), "X")

  # Body rows should have 4 cells (covered by group rowspan)
  for (i in 2:5) {
    cells <- xml2::xml_find_all(body_rows_rn[[i]], ".//td|.//th")
    expect_equal(length(cells), 4L)
  }
})
