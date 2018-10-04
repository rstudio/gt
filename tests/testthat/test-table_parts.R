context("Ensuring that the creation of tab components is correct")

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

# Gets the HTML attr value from a single `data-` key
data_selection_value <- function(html, data_key) {

  selection_value(html, key = paste0("data-", data_key))
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_text()
}

# Gets the inner HTML text from a single `data-` key
data_selection_text <- function(html, data_key, selection) {

  selection_text(html, paste0("[data-", data_key, "='", selection, "']"))
}

# Gets the inner HTML text from a single `data-type` value
type_selection_text <- function(html, selection) {

  data_selection_text(html, data_key = "type", selection = selection)
}

test_that("a gt table contains the expected heading components", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a title
  tbl_html <-
    gt(data = mtcars_short) %>%
    tab_heading(title = "test heading") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal gt_center']") %>%
    expect_equal("test heading")

  # Expect that the `table_headnote` content is an empty string
  tbl_html %>%
    selection_text("[class='gt_heading gt_headnote gt_font_normal gt_center gt_bottom_border']") %>%
    expect_equal("")

  # Expect that the maximum number of rows is `5`
  tbl_html %>%
    data_selection_value(data_key = "row") %>%
    as.integer() %>% max() %>%
    expect_equal(5)

  # Expect that the maximum number of columns is `11`
  tbl_html %>%
    data_selection_value(data_key = "column") %>%
    as.integer() %>% max() %>%
    expect_equal(11)

  # Create a `gt_tbl` object with `gt()`; this table
  # contains a title and a headnote
  tbl_html <-
    gt(data = mtcars_short) %>%
    tab_heading(
      title = "test heading",
      headnote = "test headnote") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `table_heading` content is 'test heading'
  tbl_html %>%
    selection_text(selection = "[class='gt_heading gt_title gt_font_normal gt_center']") %>%
    expect_equal("test heading")

  # Expect that the `table_heading` content is 'test headnote'
  tbl_html %>%
    selection_text("[class='gt_heading gt_headnote gt_font_normal gt_center gt_bottom_border']") %>%
    expect_equal("test headnote")
})

test_that("a gt table contains the expected stubhead caption", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub and a stubhead caption
  tbl_html <-
    gt(data = mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead_caption("the mtcars") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `the mtcars` content appears first in
  # the `data-type='column_heading'` series
  tbl_html %>%
    selection_text("[class='gt_col_heading gt_right']") %>%
    expect_equal("the mtcars")
})

test_that("a gt table contains the expected boxhead panel headings", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_html <-
    gt(data = rock) %>%
    tab_boxhead_panel(
      group = "perimeter",
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
    tab_boxhead_panel(
      group = "perimeter",
      columns = vars(peri, shape)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content is the column heading spanning 2 columns
  # is `perimeter`
  tbl_html %>%
    selection_text("[colspan='2']") %>%
    expect_equal("perimeter")

  # Create a `gt_tbl` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peris` and `shapes` column labels (which don't exist)
  tbl_html <-
    gt(data = rock) %>%
    tab_boxhead_panel(
      group = "perimeter",
      columns = vars(peris, shapes)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the content in the column headings only includes
  # the column labels
  tbl_html %>%
    selection_text("[class='gt_col_heading gt_center']") %>%
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

test_that("a gt table contains the correct placement of stub blocks", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub blocks in a specified order
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_stub_block(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")) %>%
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
  # contains a three stub blocks and the use of `blocks_arrange()`
  # will specify a particular ordering
  tbl_html <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_stub_block(
      group = "Mercs",
      rows = contains("Merc")) %>%
    tab_stub_block(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")) %>%
    blocks_arrange(groups = c(NA, "Mazda", "Mercs")) %>%
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
    tab_stubhead_caption("cars") %>%
    cols_hide(columns = "mpg") %>%
    cols_hide(columns = "vs") %>%
    tab_stub_block(group = "Mercs", rows = contains("Merc")) %>%
    tab_stub_block(group = "Mazdas", rows = contains("Mazda")) %>%
    tab_boxhead_panel(group = "gear_carb_cyl", columns = vars(gear, carb, cyl)) %>%
    blocks_arrange(groups = c("Mazdas", "Mercs")) %>%
    cols_merge_range(col_begin = "disp", col_end = "drat") %>%
    tab_heading(title = "Title", headnote = "Headnote") %>%
    tab_source_note(source_note = "this is a source note") %>%
    cols_label(labels = col_labels(cyl = md("*cyls*"))) %>%
    summary_rows(
      groups = c("Mazdas", "Mercs"),
      columns = vars(hp, wt, qsec),
      funs = funs(
        mean(., na.rm = TRUE),
        sum(., na.rm = TRUE))) %>%
    tab_style(
      style = apply_styles(bkgd_color = "lightgray"),
      locations = list(
        cells_boxhead(columns = TRUE),
        cells_stub(rows = TRUE))) %>%
    tab_style(
      style = apply_styles(bkgd_color = "steelblue", text_color = "white"),
      locations = cells_stub(rows = "Merc 240D")) %>%
    tab_style(
      style = apply_styles(text_align = "left"),
      locations = cells_title(groups = "title")) %>%
    tab_style(
      style = apply_styles(text_align = "left"),
      locations = cells_title(groups = "headnote")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "green", text_color = "white"),
      locations = cells_summary(
        groups = "Mercs", columns = "hp", rows = 2)) %>%
    tab_style(
      style = apply_styles(bkgd_color = "lightgreen"),
      locations = cells_boxhead(groups = "gear_carb_cyl")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "turquoise"),
      locations = cells_boxhead(columns = "gear")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "pink"),
      locations = cells_boxhead(columns = "hp")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "lightgray", text_style = "italic"),
      locations = cells_data(columns = "hp", rows = "Datsun 710")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "yellow"),
      locations = cells_data(columns = "disp", rows = "Mazda RX4")) %>%
    tab_style(
      style = apply_styles(bkgd_color = "red", text_color = "white"),
      locations = cells_group(groups = "Mazdas")) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the data cell (`Mazda RX4`/`disp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:yellow;']") %>%
    rvest::html_attr(name = "data-row") %>%
    expect_equal("1")

  tbl_html %>%
    rvest::html_nodes("[style='background-color:yellow;']") %>%
    rvest::html_attr(name = "data-column") %>%
    expect_equal("4")

  # Expect that the data cell (`Datsun 710`/`hp`) -> (1, 4) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;font-style:italic;']") %>%
    rvest::html_attr(name = "data-row") %>%
    expect_equal("10")

  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;font-style:italic;']") %>%
    rvest::html_attr(name = "data-column") %>%
    expect_equal("5")

  # Expect that the summary cell (`Mercs`::`sum`/`hp`) is styled
  tbl_html %>%
    rvest::html_nodes("[style='background-color:green;color:white;']") %>%
    rvest::html_text() %>%
    expect_equal("943.00")

  # Expect that some boxhead cells (e.g., `disp`, `wt`, etc.) are
  # styled with a lightgrey background
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_center'][style='background-color:lightgray;']") %>%
    rvest::html_text() %>%
    expect_equal(c("disp", "wt", "qsec", "am", "carb", "cyls"))

  # Expect that most stub cells are styled with a lightgrey background
  tbl_html %>%
    rvest::html_nodes("[style='background-color:lightgray;'][data-type='data'][data-column='0']") %>%
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

  # Expect that the table headnote is formatted to the left
  tbl_html %>%
    rvest::html_nodes("[class='gt_heading gt_headnote gt_font_normal gt_center gt_bottom_border'][style='text-align:left;']") %>%
    rvest::html_text() %>%
    expect_equal("Headnote")
})
