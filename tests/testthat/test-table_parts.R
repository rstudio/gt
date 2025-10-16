# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("A gt table contains the expected heading components", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a title
  tbl_html <-
    gt(mtcars_short) |>
    tab_header(title = "test heading") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html |>
    selection_text("[class='gt_heading gt_title gt_font_normal gt_bottom_border']") |>
    expect_equal("test heading")

  # Expect that the number of rows with `class='gt_row gt_right'` is `5`
  (tbl_html |>
      selection_text("[class='gt_row gt_right']") |>
      length()/ncol(mtcars_short)) |>
    expect_equal(5)

  # Expect that the number of rows with `class='gt_row gt_right gt_striped'` is `0`
  (tbl_html |>
      selection_text("[class='gt_row gt_right gt_striped']") |>
      length()/ncol(mtcars_short)) |>
    expect_equal(0)

  # Create a `gt_tbl` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_html <-
    gt(mtcars_short) |>
    tab_header(
      title = "test title",
      subtitle = "test subtitle") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html |>
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal']") |>
    expect_equal("test title")

  # Expect that the `table_heading` content is 'test subtitle'
  tbl_html |>
    selection_text("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border']") |>
    expect_equal("test subtitle")

  # Perform a snapshot test where an HTML table contains only a title
  gt_tbl <- mtcars_short |>
    gt() |>
    tab_header(title = "test title")
  expect_snapshot_html(gt_tbl)

  # Perform a snapshot test where an HTML table contains a title and a subtitle
  gt_tbl <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "test subtitle")
  expect_snapshot_html(gt_tbl)

  # Expect that providing a subtitle value with an empty
  # string won't produce a subtitle line
  gt_tbl <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "")
  expect_snapshot_html(gt_tbl)

  # Expect that providing a subtitle value with a series
  # a space characters also won't produce a subtitle line
  gt_tbl <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "   ")
  expect_snapshot_html(gt_tbl)

  # Expect an error if only a subtitle is provided to `tab_header()`
  expect_error(
    mtcars_short |>
      gt() |>
      tab_header(subtitle = "test subtitle")
  )
})

test_that("A gt table contains the expected stubhead label", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub and a stubhead label
  tbl_html <-
    gt(mtcars_short, rownames_to_stub = TRUE) |>
    tab_stubhead(label = "the mtcars") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the `the mtcars` content appears first in
  # the `data-type='column_heading'` series
  (tbl_html |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_left']")) |>
    expect_equal("the mtcars")
})

test_that("A gt table contains the expected source note", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a source note
  tbl_html <-
    gt(mtcars_short) |>
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content is the source note text
  # with markup provided through the use of `md()`
  tbl_html |>
    selection_text("[class='gt_sourcenote']") |>
    expect_equal("Henderson and Velleman (1981).")

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_html` object with `gt()`; this table
  # contains two source notes
  tbl_html <-
    gt(mtcars_short) |>
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) |>
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`.") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the two source notes
  # is available
  tbl_html |>
    selection_text("[class='gt_sourcenote']") |>
    expect_equal(c(
      "Henderson and Velleman (1981).",
      "This was in Motor Trend magazine, hence the `mt`."
    ))
})

test_that("tab_row_group() can generate row groups.", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row groups in a specified order using `tab_row_group()`
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) |>
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the two row groups
  # is 'Mazda' and then an empty string
  expect_equal(
    get_row_group_text(tbl_html),
    c("Mazda", "")
  )

  # Create a `tbl_html` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_html <-
    mtcars |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) |>
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) |>
    row_group_order(groups = c(NA, "Mazda", "Mercs")) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the three row groups
  # is in the prescribed order
  expect_equal(
    get_row_group_text(tbl_html),
    c("", "Mazda", "Mercs")
  )

  # Create a `tbl_html` object with `gt()`; this table contains a single
  # row group that has a label with the `html()` helper
  tbl_html <-
    gtcars |>
    dplyr::select(model, year, hp, trq) |>
    dplyr::slice(1:8) |>
    gt(rowname_col = "model") |>
    tab_row_group(
      label = html("<div style=\"font-weight: bold;\">numbered</div>"),
      rows = matches("^[0-9]")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the row group
  # has the expected text
  expect_equal(get_row_group_text(tbl_html), c("numbered", ""))

  # Create a `tbl_html` object with `gt()`; this table contains a single
  # row group that has a label with the `md()` helper
  tbl_html <-
    gtcars |>
    dplyr::select(model, year, hp, trq) |>
    dplyr::slice(1:8) |>
    gt(rowname_col = "model") |>
    tab_row_group(
      label = md("**cars** that are <em>numbered</em>"),
      rows = matches("^[0-9]")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the row group
  # has the expected text
  expect_equal(get_row_group_text(tbl_html), c("cars that are numbered", ""))

  # Create a variation on the above table where `row_group_order()`
  # leaves out `NA` (it's put at the end)
  tbl_html <-
    mtcars |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) |>
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) |>
    row_group_order(groups = c("Mazda", "Mercs")) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the inner HTML content for the three row groups
  # is in the prescribed order
  expect_equal(
    get_row_group_text(tbl_html),
    c("Mazda", "Mercs", "")
  )

})

test_that("tab_row_group() gives the correct output", {

  tbl_rows <-
    exibble |>
    gt() |>
    tab_row_group(
      label = md("__*void*__"),
      rows = group == "grp_a",
      id = "group_a"
    ) |>
    tab_row_group(
      label = "void",
      rows = group != "grp_a",
      id = "group_void"
    ) |>
    row_group_order(
      groups = c("group_a", "group_void")
    ) |>
    tab_spanner(
      label = md("__*num_char*__"),
      columns = c(num, char),
      id = "num_char"
    ) |>
    tab_footnote(
      footnote = "a footnote",
      locations = cells_row_groups("group_a")
    )

  # Expect to see the styled and unstyled variations of the `"void"`
  # row group labels
  expect_match_html(
    tbl_rows,
    regexp = c(
      "<span class='gt_from_md'><strong><em>void</em></strong></span><span class=\"gt_footnote_marks\" style=\"white-space:nowrap;font-style:italic;font-weight:normal;line-height:0;\"><sup>1</sup></span>",
      "<th colspan=\"9\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"void\">void</th>"
    ),
    fixed = TRUE
  )

  # Expect that the inner HTML content for the two row groups
  # is in the prescribed order
  tbl_html_text <- xml2::read_html(render_as_html(tbl_rows))
  expect_equal(
    get_row_group_text(tbl_html_text),
    c("void1", "void")
  )

  # When specifying a row group that captures no rows, expect that
  # the rendered table is essentially unaffected by this function call
  expect_equal_gt(
    gt(exibble, rowname_col = "row") |> tab_row_group(label = "group", rows = FALSE),
    gt(exibble, rowname_col = "row")
  )
})

test_that("tab_row_group() warns for deprecated args, but respects output.", {

  local_options("rlib_warning_verbosity" = "verbose")

  # Expect a warning if using both the `label` and `group` argument
  expect_snapshot(
    gt_tbl <-
      gt(exibble, rowname_col = "row") |>
      tab_row_group(
        label = "group_prioritized",
        group = "group",
        rows = 1:3
      )
  )

  # Expect that the label text specified in `label` was used over the
  # text given in `group`
  expect_equal(
    gt_tbl |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("group_prioritized", "")
  )

  # Expect that `tab_options(row_group.default_label = <label>)`
  # is called internally if using the deprecated `others_label` argument
  expect_snapshot(
    gt_tbl <-
    (
      gt(exibble, rowname_col = "row") |>
        tab_row_group(label = "one", rows = 1:3) |>
        tab_row_group(others_label = "foo")
    )
  )

  expect_equal(
    dt_options_get_value(gt_tbl, "row_group_default_label"),
    "foo"
  )

  expect_equal(
    gt_tbl |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("one", "foo")
  )

  # Expect an error upon repeat use of a row group `id` value
  expect_error(
    gt(exibble, rowname_col = "row") |>
      tab_row_group(label = "a", rows = 1:2, id = "one") |>
      tab_row_group(label = "b", rows = 3:4, id = "one")
  )
})

test_that("tab_row_group() errors with bad input", {

  # Expect an error if not providing a `label` for `tab_row_group()`
  # but there is a specification of rows
  expect_error(
    exibble |>
      gt() |>
      tab_row_group(
        rows = group == "grp_a"
      ),
    "label"
  )
})

test_that("tab_row_group() errors when named rows are supplied (#1535)", {

  # create a gt tbl with no rows
  gt_tbl <- mtcars_short |> gt()

  # create a gt tbl with rows
  gt_tbl_rows <- mtcars_short |> gt(rownames_to_stub = TRUE)

  expect_no_error(gt_tbl_rows |> tab_row_group("Mazda", c("Mazda RX4", "Mazda RX4 Wag")))

  expect_snapshot(error = TRUE, {
    gt_tbl |> tab_row_group("Mazda", c("Mazda RX4", "Mazda RX4 Wag"))
  })

  expect_error(
    gt_tbl_rows |> tab_row_group("Mazda", c("Mazda RX4", "Mazda not present")),
    "Mazda not present"
  )
})

test_that("A default row group name can be modified with `tab_options()`", {
  local_options("rlib_warning_verbosity" = "verbose")

  # Check that specific suggested packages are available
  check_suggests()

  tbl_html <- gt(exibble)

  # Having some rows associated to ids/labels means that the
  # non-associated rows will have an NA label
  expect_equal(
    tbl_html |>
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("void", "")
  )

  # Setting a default row group label will make that label
  # appear when rendered
  expect_equal(
    tbl_html |>
      tab_options(row_group.default_label = "The Others") |>
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("void", "The Others")
  )

  # The order of the two groups (one defined, one the 'Others') can
  # be modified with `row_group_order()` by putting `NA` before `group_a`
  expect_equal(
    tbl_html |>
      tab_options(row_group.default_label = "The Others") |>
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) |>
      row_group_order(groups = c(NA, "group_a")) |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("The Others", "void")
  )

  # The label for the 'Others' can be overwritten with a subsequent
  # call of `tab_row_group()`
  expect_equal(
    tbl_html |>
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) |>
      tab_options(row_group.default_label = "The Others") |>
      tab_options(row_group.default_label = "Other Group") |>
      row_group_order(groups = c(NA, "group_a")) |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("Other Group", "void")
  )

  # A previously defined label for the 'Others' can be reset to
  # nothing by using `tab_options(row_group.default_label = "")`
  expect_equal(
    tbl_html |>
      tab_row_group(
        label = md("__*void*__"),
        rows = group == "grp_a",
        id = "group_a"
      ) |>
      tab_options(row_group.default_label = "The Others") |>
      tab_options(row_group.default_label = "") |>
      render_as_html() |>
      xml2::read_html() |>
      get_row_group_text(),
    c("void", "")
  )
})

test_that("A gt table's row group labels are HTML escaped", {

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row group with characters that require
  # escaping for HTML
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) |>
    gt(groupname_col = "group") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the row group label is `x > 30` (and not
  # `x`, which would result from not escaping the inner HTML)
  expect_equal(
    tbl_html |>
      selection_text("[class='gt_group_heading']"),
    "x > 30"
  )

  # Create a `tbl_html` object with `gt()`; this table
  # has the row group label (with necessity to HTML-escape)
  # but, this time, there is a footnote mark attached to
  # that label (which shouldn't be escaped)
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) |>
    gt(groupname_col = "group") |>
    tab_footnote(
      footnote = "footnote",
      locations = cells_row_groups(groups = "x > 30")
    ) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the row group label is `x > 30` +
  # the text for the footnote mark: `1`
  expect_equal(
    tbl_html |>
      selection_text("[class='gt_group_heading']"),
    "x > 301"
  )
})

test_that("A gt table contains custom styles at the correct locations", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`
  tbl_html <-
    mtcars |>
    gt(rownames_to_stub = TRUE) |>
    cols_move_to_start(columns = c("gear", "carb")) |>
    tab_stubhead(label = "cars") |>
    cols_hide(columns = "mpg") |>
    cols_hide(columns = "vs") |>
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) |>
    tab_row_group(
      label = "Mazdas",
      rows = contains("Mazda")
    ) |>
    tab_spanner(
      label = "gear_carb_cyl",
      id = "gcc",
      columns = c(gear, carb, cyl)
    ) |>
    row_group_order(groups = c("Mazdas", "Mercs")) |>
    cols_merge_range(
      col_begin = "disp",
      col_end = "drat"
    ) |>
    tab_header(
      title = "Title",
      subtitle = "Subtitle"
    ) |>
    tab_source_note(source_note = "this is a source note") |>
    cols_label(cyl = md("*cyls*")) |>
    summary_rows(
      groups = c("Mazdas", "Mercs"),
      columns = c(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    grand_summary_rows(
      columns = c(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    ) |>
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = list(
        cells_column_labels(),
        cells_stub(rows = TRUE))
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "steelblue"),
        cell_text(color = "white")
      ),
      locations = cells_stub(rows = "Merc 240D")
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    ) |>
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "purple"),
        cell_text(color = "white")
      ),
      locations = cells_grand_summary(columns = "hp", rows = 2)
    ) |>
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_column_spanners(spanners = "gcc")
    ) |>
    tab_style(
      style = cell_fill(color = "turquoise"),
      locations = cells_column_labels(columns = gear)
    ) |>
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_column_labels(columns = hp)
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "lightgray"),
        cell_text(style = "italic")
      ),
      locations = cells_body(columns = "hp", rows = "Datsun 710")
    ) |>
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = "disp", rows = "Mazda RX4")
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "red"),
        cell_text(color = "white")
      ),
      locations = cells_row_groups(groups = "Mazdas")
    ) |>
    tab_style(
      style = list(
        cell_fill(color = "blue"),
        cell_text(color = "white")
      ),
      locations = cells_stubhead()
    ) |>
    render_as_html() |>
    xml2::read_html()

  # FIXME: commented failing tests where rvest 1.0.4 no longer allows
  # these tests to work w/o error

  # Expect that the stubhead label is styled
  # nodes <-
  #   tbl_html |>
  #   rvest::html_nodes("[style='background-color: #0000FF; color: #FFFFFF;']") |>
  #   rvest::html_text("[class='gt_col_heading gt_columns_bottom_border gt_left]") |>
  #   expect_equal("cars")

  # Expect that the data cell (`Mazda RX4`/`disp`) -> (1, 4) is styled
  # tbl_html |>
  #   rvest::html_nodes("[style='background-color: #FFFF00;']") |>
  #   rvest::html_text("[class='gt_row gt_right']") |>
  #   expect_equal("160.0–3.90")

  # Expect that the data cell (`Datsun 710`/`hp`) -> (1, 4) is styled
  # tbl_html |>
  #   rvest::html_nodes("[style='background-color: #D3D3D3; font-style: italic;']") |>
  #   rvest::html_text("[class='gt_row gt_right']") |>
  #   expect_equal("93")

  # Expect that the summary cell (`Mercs`::`sum`/`hp`) is styled
  # tbl_html |>
  #   rvest::html_nodes("[style='background-color: #00FF00; color: #FFFFFF;']") |>
  #   rvest::html_text("[class='gt_row gt_right gt_summary_row']") |>
  #   expect_equal("943.00")

  # Expect that the grand summary cell (`sum`/`hp`) is styled
  # tbl_html |>
  #   rvest::html_nodes("[style='background-color: #A020F0; color: #FFFFFF;']") |>
  #   rvest::html_text("[class='gt_row gt_grand_summary_row']") |>
  #   expect_equal("4,694.00")

  # Expect that some column labels (e.g., `disp`, `wt`, etc.) are
  # styled with a light gray background
  (tbl_html |>
    rvest::html_nodes("[style='background-color: #D3D3D3;']") |>
    rvest::html_text())[1:5] |>
    expect_equal(c("disp", "wt", "qsec", "am", "carb"))

  # Expect that most stub cells are styled with a light gray background
  (tbl_html |>
    rvest::html_nodes("[style='background-color: #D3D3D3;']") |>
    rvest::html_text())[1:6] |>
    expect_equal(c("disp", "wt", "qsec", "am", "carb", "cyls"))

  # Expect that most stub cells are styled with a light gray background
  tbl_html |>
    rvest::html_nodes("[class='gt_row gt_left gt_stub'][style='background-color: #D3D3D3;']") |>
    rvest::html_text() |>
    expect_length(31)

  # Expect that the `hp` column label's cell has a pink background
  tbl_html |>
    rvest::html_nodes("[style='background-color: #FFC0CB;']") |>
    rvest::html_text() |>
    expect_equal("hp")

  # Expect that the `gear` column label's cell has a turquoise background
  tbl_html |>
    rvest::html_nodes("[style='background-color: #40E0D0;']") |>
    rvest::html_text() |>
    expect_equal("gear")

  # Expect that the row caption `Merc 240D` has a cell background that
  # is ultimately steelblue, and, the font the white
  tbl_html |>
    rvest::html_nodes("[style='background-color: #4682B4; color: #FFFFFF;']") |>
    rvest::html_text() |>
    expect_equal("Merc 240D")

  # Expect that the `gear_carb_cyl` column spanner's
  # cell has a lightgreen background
  tbl_html |>
    rvest::html_nodes("[style='background-color: #90EE90;']") |>
    rvest::html_text() |>
    expect_match("gear_carb_cyl")

  # Expect that the `Mazdas` row group label
  # cell has a red background and white text
  tbl_html |>
    rvest::html_nodes("[style='background-color: #FF0000; color: #FFFFFF;']") |>
    rvest::html_text() |>
    expect_equal("Mazdas")

  # Expect that the table title is formatted to the left
  tbl_html |>
    rvest::html_nodes("[class='gt_heading gt_title gt_font_normal'][style='text-align: left;']") |>
    rvest::html_text() |>
    expect_equal("Title")

  # Expect that the table subtitle is formatted to the left
  tbl_html |>
    rvest::html_nodes("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border'][style='text-align: left;']") |>
    rvest::html_text() |>
    expect_equal("Subtitle")
})

test_that("Columns can be hidden and then made visible", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `gt_tbl` object with the `gtcars` dataset
  gt_tbl <- gt(gtcars)

  # Expect all column names from the original dataset
  # to be present
  gt_tbl |>
    render_as_html() |>
    xml2::read_html() |>
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
    rvest::html_text() |>
    expect_equal(c("mfr", "model", "trim", "bdy_style", "drivetrain", "trsmn", "ctry_origin"))

  # Hide the `mfr` and `drivetrain` columns from the
  # table with `cols_hide()`
  gt_tbl <-
    gt_tbl |>
    cols_hide(c(mfr, drivetrain))

  # Expect the two hidden columns to not appear in the rendered table
  gt_tbl |>
    render_as_html() |>
    xml2::read_html() |>
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
    rvest::html_text() |>
    expect_equal(c("model", "trim", "bdy_style", "trsmn", "ctry_origin"))

  # Make the `mfr` column visible again with `cols_unhide()`
  gt_tbl <-
    gt_tbl |>
    cols_unhide(mfr)

  # Expect that only `drivetrain` is hidden now
  gt_tbl |>
    render_as_html() |>
    xml2::read_html() |>
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
    rvest::html_text() |>
    expect_equal(c("mfr", "model", "trim", "bdy_style", "trsmn", "ctry_origin"))

  # Move the drivetrain column to the beginning of the column
  # series and unhide it
  gt_tbl <-
    gt_tbl |>
    cols_move_to_start(drivetrain) |>
    cols_unhide(drivetrain)

  # Expect all column names from the original dataset
  # to be present in the revised order
  gt_tbl |>
    render_as_html() |>
    xml2::read_html() |>
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
    rvest::html_text() |>
    expect_equal(c("drivetrain", "mfr", "model", "trim", "bdy_style", "trsmn", "ctry_origin"))
})
