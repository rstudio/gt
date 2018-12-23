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
    selection_text("[class='gt_heading gt_title gt_font_normal gt_center']") %>%
    expect_equal("test heading")

  # Expect that the `table_subtitle` content is an empty string
  tbl_html %>%
    selection_text("[class='gt_heading gt_subtitle gt_font_normal gt_center gt_bottom_border']") %>%
    expect_equal("")

  # Expect that the number of rows with `class='gt_row gt_right'` is `3`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(3)

  # Expect that the number of rows with `class='gt_row gt_right gt_striped'` is `2`
  (tbl_html %>%
      selection_text("[class='gt_row gt_right gt_striped']") %>%
      length()/ncol(mtcars_short)) %>%
    expect_equal(2)

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
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal gt_center']") %>%
    expect_equal("test title")

  # Expect that the `table_heading` content is 'test subtitle'
  tbl_html %>%
    selection_text("[class='gt_heading gt_subtitle gt_font_normal gt_center gt_bottom_border']") %>%
    expect_equal("test subtitle")
})

test_that("a gt table contains the expected stubhead label", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub and a stubhead label
  tbl_html <-
    gt(data = mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead_label(label = "the mtcars") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `the mtcars` content appears first in
  # the `data-type='column_heading'` series
  (tbl_html %>%
      selection_text("[class='gt_col_heading gt_left']"))[1] %>%
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
    expect_equal("perimeter")

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
    selection_text("[class='gt_col_heading gt_column_spanner gt_center']") %>%
    expect_equal("perimeter")

  # Create a `gt_tbl` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peris` and `shapes` column labels (which don't exist)
  tbl_html <-
    gt(data = rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = vars(peris, shapes)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content in the column headings only includes
  # the column labels
  tbl_html %>%
    selection_text("[class='gt_col_heading gt_right']") %>%
    expect_equal(c("area", "peri", "shape", "perm"))
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

  # Expect that the inner HTML content for the two stub groups
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
    gt(mtcars, rownames_to_stub = TRUE) %>%
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

  # Expect that the inner HTML content for the three stub groups
  # is in the prescribed order
  c(tbl_html %>%
      selection_text("[class='gt_empty_group_heading']"),
    tbl_html %>%
      selection_text("[class='gt_group_heading']")) %>%
    expect_equal(c("", "Mazda", "Mercs"))
})

test_that("a gt table contains custom styles at the correct locations", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    cols_move_to_start(columns = c("gear", "carb")) %>%
    tab_stubhead_label(label = "cars") %>%
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
    tab_style(
      style = cells_styles(bkgd_color = "lightgray"),
      locations = list(
        cells_column_labels(columns = TRUE),
        cells_stub(rows = TRUE))
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "steelblue", text_color = "white"),
      locations = cells_stub(rows = "Merc 240D")
    ) %>%
    tab_style(
      style = cells_styles(text_align = "left"),
      locations = cells_title(groups = "title")
    ) %>%
    tab_style(
      style = cells_styles(text_align = "left"),
      locations = cells_title(groups = "subtitle")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "green", text_color = "white"),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "lightgreen"),
      locations = cells_column_labels(groups = "gear_carb_cyl")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "turquoise"),
      locations = cells_column_labels(columns = "gear")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "pink"),
      locations = cells_column_labels(columns = "hp")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "lightgray", text_style = "italic"),
      locations = cells_data(columns = "hp", rows = "Datsun 710")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "yellow"),
      locations = cells_data(columns = "disp", rows = "Mazda RX4")
    ) %>%
    tab_style(
      style = cells_styles(bkgd_color = "red", text_color = "white"),
      locations = cells_group(groups = "Mazdas")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the data cell (`Mazda RX4`/`disp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:yellow;']") %>%
    rvest::html_text("[class='gt_row gt_center']") %>%
    expect_equal("160.0 — 3.90")

  # Expect that the data cell (`Datsun 710`/`hp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;font-style:italic;']") %>%
    rvest::html_text("[class='gt_row gt_center']") %>%
    expect_equal("93")

  # Expect that the summary cell (`Mercs`::`sum`/`hp`) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:green;color:white;']") %>%
    rvest::html_text("[class='gt_row gt_summary_row gt_center']") %>%
    expect_equal("943.00")

  # Expect that some column labels (e.g., `disp`, `wt`, etc.) are
  # styled with a lightgrey background
  (tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;']") %>%
    rvest::html_text())[1:6] %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb", "cyls"))

  # Expect that most stub cells are styled with a lightgrey background
  tbl_html %>%
    rvest::html_nodes("[class='gt_row gt_stub gt_left'][style='background-color:lightgray;']") %>%
    rvest::html_text() %>%
    length() %>%
    expect_equal(31)

  # Expect that the `hp` column label's cell ultimately has a pink background
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;background-color:pink;']") %>%
    rvest::html_text() %>%
    expect_equal("hp")

  # Expect that the `gear` column label's cell ultimately
  # has a turquoise background
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;background-color:turquoise;']") %>%
    rvest::html_text() %>%
    expect_equal("gear")

  # Expect that the row caption `Merc 240D` has a cell background that
  # is ultimately steelblue, and, the font the white
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;background-color:steelblue;color:white;']") %>%
    rvest::html_text() %>%
    expect_equal("Merc 240D")

  # Expect that the `gear_carb_cyl` column spanner's
  # cell has a lightgreen background
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgreen;']") %>%
    rvest::html_text() %>%
    expect_equal("gear_carb_cyl")

  # Expect that the table title is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_title gt_font_normal gt_center'][style='text-align:left;']") %>%
    rvest::html_text() %>%
    expect_equal("Title")

  # Expect that the table subtitle is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_subtitle gt_font_normal gt_center gt_bottom_border'][style='text-align:left;']") %>%
    rvest::html_text() %>%
    expect_equal("Subtitle")
})
