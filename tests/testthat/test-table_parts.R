context("Ensuring that the creation of tab components works as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {

  selection <- paste0("[", key, "]")

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_attr(key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

test_that("a gt table contains the expected heading components", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a title
  tbl_html <-
    gt(data = mtcars_short) %>%
    tab_header(title = "test heading") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text("[class='gt_heading gt_title gt_font_normal']") %>%
    expect_equal("test heading")

  # Expect that the number of rows with `class='gt_row gt_right'` is `5`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(5)

  # Expect that the number of rows with `class='gt_row gt_right gt_striped'` is `0`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right gt_striped']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(0)

  # Create a `gt_tbl` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_html <-
    gt(data = mtcars_short) %>%
    tab_header(
      title = "test title",
      subtitle = "test subtitle") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal']") %>%
    expect_equal("test title")

  # Expect that the `table_heading` content is 'test subtitle'
  tbl_html %>%
    selection_text("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border']") %>%
    expect_equal("test subtitle")
})

test_that("a gt table contains the expected stubhead label", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub and a stubhead label
  tbl_html <-
    gt(data = mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead(label = "the mtcars") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `the mtcars` content appears first in
  # the `data-type='column_heading'` series
  (tbl_html %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_left']")) %>%
    expect_equal("the mtcars")
})

test_that("a gt table contains the expected spanner column labels", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_html <-
    gt(data = rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content is the column heading spanning 2 columns
  # is `perimeter`
  tbl_html %>%
    selection_text("[colspan='2']") %>%
    grepl("perimeter", .) %>%
    expect_true()

  # Create a `gt_tbl` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels (this time, using
  # the `vars()` helper to define the columns)
  tbl_html <-
    gt(data = rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = vars(peri, shape)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content is the column heading spanning 2 columns
  # is `perimeter`
  tbl_html %>%
    selection_text("[class='gt_center gt_columns_top_border gt_column_spanner_outer']") %>%
    grepl("perimeter", .) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` that is formatted
  # with Markdown via `md()`
  tbl_html <-
    gt(data = rock) %>%
    tab_spanner(
      label = md("*perimeter*"),
      columns = c("peri", "shape")) %>%
    render_as_html()

  # Expect that the `perimeter` word is wrapped in `<em>` tags
  expect_true(
    grepl("<em>perimeter</em>", tbl_html)
  )

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` that is formatted
  # with HTML via `html()`
  tbl_html <-
    gt(data = rock) %>%
    tab_spanner(
      label = html("<em>perimeter</em>"),
      columns = c("peri", "shape")) %>%
    render_as_html()

  # Expect that the `perimeter` word is wrapped in `<em>` tags
  expect_true(
    grepl("<em>perimeter</em>", tbl_html)
  )

  # Expect an error when using column labels
  # that don't exist
  expect_error(
    gt(data = rock) %>%
      tab_spanner(
        label = "perimeter",
        columns = vars(peris, shapes))
  )
})

test_that("`tab_spanner()` works even when columns are forcibly moved", {

  # Create a table with column spanners, moving the `carb` value
  # to the beginning of the column sequence (splitting the `group_d`
  # column spanner into two parts)
  tbl_html <-
    gt(mtcars[1, ]) %>%
    tab_spanner(
      label = md("*group_a*"),
      columns = vars(cyl, hp)
    ) %>%
    tab_spanner(
      label = md("*group_b*"),
      columns = vars(drat, wt)
    ) %>%
    tab_spanner(
      label = md("*group_c*"),
      columns = vars(qsec, vs, am)
    ) %>%
    tab_spanner(
      label = md("*group_d*"),
      columns = vars(gear, carb)
    ) %>%
    tab_spanner(
      label = md("*never*"),
      columns = ends_with("nothing")
    ) %>%
    cols_move_to_start(columns = vars(carb)) %>%
    render_as_html()


  # Expect the sequence of `colspan` values across both
  # <tr>s in <thead> is correct
  tbl_html %>%
    xml2::read_html() %>%
    selection_value("colspan") %>%
    expect_equal(
      c("1", "1", "2", "1", "2", "3", "1",           # first <tr>
        "1", "1", "1", "1", "1", "1", "1", "1", "1"  # second <tr>
       )
    )
})

test_that("a gt table contains the expected source note", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a source note
  tbl_html <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content is the source note text
  # with markup provided through the use of `md()`
  tbl_html %>%
    selection_text("[class='gt_sourcenote']") %>%
    expect_equal("Henderson and Velleman (1981).")

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_html` object with `gt()`; this table
  # contains two source notes
  tbl_html <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) %>%
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`.") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the two source notes
  # is available
  tbl_html %>%
    selection_text("[class='gt_sourcenote']") %>%
    expect_equal(
      c("Henderson and Velleman (1981).",
        "This was in Motor Trend magazine, hence the `mt`."))
})

test_that("a gt table contains the correct placement of row groups", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row groups in a specified order
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_row_group(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the two row groups
  # is 'Mazda' and an empty string
  c(tbl_html %>%
      selection_text("[class='gt_group_heading']"),
    tbl_html %>%
      selection_text("[class='gt_empty_group_heading']")) %>%
    expect_equal(c("Mazda", ""))

  # Create a `tbl_html` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_html <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    tab_row_group(
      group = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    row_group_order(groups = c(NA, "Mazda", "Mercs")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the inner HTML content for the three row groups
  # is in the prescribed order
  c(tbl_html %>%
      selection_text("[class='gt_empty_group_heading']"),
    tbl_html %>%
      selection_text("[class='gt_group_heading']")) %>%
    expect_equal(c("", "Mazda", "Mercs"))
})

test_that("a gt table's row group labels are HTML escaped", {

  # Create a `tbl_html` object with `gt()`; this table
  # contains a row group with characters that require
  # escaping for HTML
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) %>%
    gt(groupname_col = "group") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the row group label is `x > 30` (and not
  # `x`, which would result from not escaping the inner HTML)
  expect_equal(
    tbl_html %>%
      selection_text("[class='gt_group_heading']"),
    "x > 30")

  # Create a `tbl_html` object with `gt()`; this table
  # has the row group label (with necessity to HTML-escape)
  # but, this time, there is a footnote mark attached to
  # that label (which shouldn't be escaped)
  tbl_html <-
    data.frame(group = "x > 30", value = seq(1, 5)) %>%
    gt(groupname_col = "group") %>%
    tab_footnote(
      footnote = "footnote",
      locations = cells_row_groups(groups = "x > 30")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the row group label is `x > 30` +
  # the text for the footnote mark: `1`
  expect_equal(
    tbl_html %>%
      selection_text("[class='gt_group_heading']"),
    "x > 301")
})

test_that("a gt table contains custom styles at the correct locations", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`
  tbl_html <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    cols_move_to_start(columns = c("gear", "carb")) %>%
    tab_stubhead(label = "cars") %>%
    cols_hide(columns = "mpg") %>%
    cols_hide(columns = "vs") %>%
    tab_row_group(
      group = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      group = "Mazdas",
      rows = contains("Mazda")
    ) %>%
    tab_spanner(
      label = "gear_carb_cyl",
      columns = vars(gear, carb, cyl)
    ) %>%
    row_group_order(groups = c("Mazdas", "Mercs")) %>%
    cols_merge_range(
      col_begin = "disp",
      col_end = "drat"
    ) %>%
    tab_header(
      title = "Title",
      subtitle = "Subtitle"
    ) %>%
    tab_source_note(source_note = "this is a source note") %>%
    cols_label(cyl = md("*cyls*")) %>%
    summary_rows(
      groups = c("Mazdas", "Mercs"),
      columns = vars(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE))
    ) %>%
    summary_rows(
      columns = vars(hp, wt, qsec),
      fns = list(
        ~mean(., na.rm = TRUE),
        ~sum(., na.rm = TRUE))
    ) %>%
    tab_style(
      style = cell_fill(color = "lightgray"),
      locations = list(
        cells_column_labels(columns = TRUE),
        cells_stub(rows = TRUE))
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "steelblue"),
        cell_text(color = "white")
      ),
      locations = cells_stub(rows = "Merc 240D")
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "title")
    ) %>%
    tab_style(
      style = cell_text(align = "left"),
      locations = cells_title(groups = "subtitle")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "green"),
        cell_text(color = "white")
      ),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "purple"),
        cell_text(color = "white")
      ),
      locations = cells_grand_summary(columns = "hp", rows = 2)
    ) %>%
    tab_style(
      style = cell_fill(color = "lightgreen"),
      locations = cells_column_spanners(spanners = "gear_carb_cyl")
    ) %>%
    tab_style(
      style = cell_fill(color = "turquoise"),
      locations = cells_column_labels(columns = "gear")
    ) %>%
    tab_style(
      style = cell_fill(color = "pink"),
      locations = cells_column_labels(columns = "hp")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "lightgray"),
        cell_text(style = "italic")
      ),
      locations = cells_body(columns = "hp", rows = "Datsun 710")
    ) %>%
    tab_style(
      style = cell_fill(color = "yellow"),
      locations = cells_body(columns = "disp", rows = "Mazda RX4")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "red"),
        cell_text(color = "white")
      ),
      locations = cells_row_groups(groups = "Mazdas")
    ) %>%
    tab_style(
      style = list(
        cell_fill(color = "blue"),
        cell_text(color = "white")
      ),
      locations = cells_stubhead()
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the stubhead label is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #0000FF; color: white;']") %>%
    rvest::html_text("[class='gt_col_heading gt_columns_bottom_border gt_columns_top_border gt_left]") %>%
    expect_equal("cars")

  # Expect that the data cell (`Mazda RX4`/`disp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #FFFF00;']") %>%
    rvest::html_text("[class='gt_row gt_right']") %>%
    expect_equal("160.0–3.90")

  # Expect that the data cell (`Datsun 710`/`hp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #D3D3D3; font-style: italic;']") %>%
    rvest::html_text("[class='gt_row gt_center']") %>%
    expect_equal("93")

  # Expect that the summary cell (`Mercs`::`sum`/`hp`) is styled
  # TODO: this summary cell value is not correct (shows `885.00` instead of `943.00`)
  # tbl_html %>%
  #   rvest::html_nodes("[style='background-color: #00FF00FF; color: white;']") %>%
  #   rvest::html_text("[class='gt_row gt_summary_row gt_center']") %>%
  #   expect_equal("943.00")

  # Expect that the grand summary cell (`sum`/`hp`) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #A020F0; color: white;']") %>%
    rvest::html_text("[class='gt_row gt_grand_summary_row gt_center']") %>%
    expect_equal("4,694.00")

  # Expect that some column labels (e.g., `disp`, `wt`, etc.) are
  # styled with a lightgrey background
  (tbl_html %>%
    rvest::html_nodes("[style='background-color: #D3D3D3;']") %>%
    rvest::html_text())[1:5] %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb"))

  # Expect that most stub cells are styled with a lightgray background
  (tbl_html %>%
    rvest::html_nodes("[style='background-color: #D3D3D3;']") %>%
    rvest::html_text())[1:6] %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb", "cyls"))

  # Expect that most stub cells are styled with a lightgray background
  tbl_html %>%
    rvest::html_nodes("[class='gt_row gt_left gt_stub'][style='background-color: #D3D3D3;']") %>%
    rvest::html_text() %>%
    length() %>%
    expect_equal(31)

  # Expect that the `hp` column label's cell has a pink background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #FFC0CB;']") %>%
    rvest::html_text() %>%
    expect_equal("hp")

  # Expect that the `gear` column label's cell has a turquoise background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #40E0D0;']") %>%
    rvest::html_text() %>%
    expect_equal("gear")

  # Expect that the row caption `Merc 240D` has a cell background that
  # is ultimately steelblue, and, the font the white
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #4682B4; color: white;']") %>%
    rvest::html_text() %>%
    expect_equal("Merc 240D")

  # Expect that the `gear_carb_cyl` column spanner's
  # cell has a lightgreen background
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #90EE90;']") %>%
    rvest::html_text() %>%
    grepl("gear_carb_cyl", .) %>%
    expect_true()

  # Expect that the `Mazdas` row group label
  # cell has a red background and white text
  tbl_html %>%
    rvest::html_nodes("[style='background-color: #FF0000; color: white;']") %>%
    rvest::html_text() %>%
    expect_equal("Mazdas")

  # Expect that the table title is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_title gt_font_normal'][style='text-align: left;']") %>%
    rvest::html_text() %>%
    expect_equal("Title")

  # Expect that the table subtitle is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_subtitle gt_font_normal gt_bottom_border'][style='text-align: left;']") %>%
    rvest::html_text() %>%
    expect_equal("Subtitle")
})
