local_edition(3)
skip_on_cran()

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

test_that("a gt table contains the expected spanner column labels", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_html <-
    gt(rock) %>%
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
  # `c()` to define the columns)
  tbl_html <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c(peri, shape)) %>%
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
    gt(rock) %>%
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
    gt(rock) %>%
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
    gt(rock) %>%
      tab_spanner(
        label = "perimeter",
        columns = c(peris, shapes))
  )

  # Expect an error when using an ID twice
  expect_error(
    gt(exibble) %>%
      tab_spanner(label = "a", columns = num) %>%
      tab_spanner(label = "b", id = "a", columns = char)
  )
})

test_that("`tab_spanner()` exclusively uses IDs for arranging spanners", {

  tbl_html_1 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "A", id = "a", columns = ends_with("X"), gather = FALSE) %>%
    tab_spanner(label = "A", id = "b", columns = ends_with("Y"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "a")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are two spanners and both have the
  # label `"A"`, span 2 columns each, with one background
  # color set to green
  tbl_html_1 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("A", "A"))

  tbl_html_1 %>%
    selection_value("colspan") %>%
    expect_equal(c("2", "2", "1", "1", "1", "1"))

  tbl_html_1 %>%
    selection_value("style") %>%
    expect_equal("background-color: #00FF00;")

  tbl_html_2 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "Z", id = "a", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "Z", id = "b", columns = starts_with("B"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "a")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are four spanners (with two IDs, both
  # discontinguous) and both have the label `"Z"`, with one background
  # color set to green (in the odd cells)
  tbl_html_2 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("Z", "Z", "Z", "Z"))

  tbl_html_2 %>%
    selection_value("colspan") %>%
    expect_equal(rep("1", 8))

  tbl_html_2 %>%
    selection_value("style") %>%
    expect_equal(rep("background-color: #00FF00;", 2))

  tbl_html_3 <-
    dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4)) %>%
    gt() %>%
    tab_spanner(label = "Z", id = "a", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "Z", id = "b", columns = starts_with("B"), gather = FALSE) %>%
    tab_style(
      style = cell_fill("green"),
      locations = cells_column_spanners(spanners = "b")
    ) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that there are four spanners (with two IDs, both
  # discontinguous) and both have the label `"Z"`, with one background
  # color set to green (in the even cells)
  tbl_html_3 %>%
    selection_text("[class='gt_column_spanner']") %>%
    expect_equal(c("Z", "Z", "Z", "Z"))

  tbl_html_3 %>%
    selection_value("colspan") %>%
    expect_equal(rep("1", 8))

  tbl_html_3 %>%
    selection_value("style") %>%
    expect_equal(rep("background-color: #00FF00;", 2))
})

test_that("`tab_spanner()` doesn't adversely affect column alignment", {

  tbl_html <-
    gt(airquality) %>%
    cols_move_to_start(columns = c(Month, Day)) %>%
    cols_label(Solar.R = html("Solar<br>Radiation")) %>%
    tab_spanner(
      label = "Measurement Period",
      columns = c(Month, Day)
    ) %>%
    render_as_html()

  # Expect that all column labels (which are originally of the numeric
  # and integer classes) are aligned to the right (i.e., all have the
  # `gt_right` CSS class) even though a spanner is present above the
  # `Month` and `Day` columns
  tbl_html %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Ozone", "SolarRadiation", "Wind", "Temp", "Month", "Day"))
})

test_that("`tab_spanner()` works even when columns are forcibly moved", {

  # Create a table with column spanners, moving the `carb` value
  # to the beginning of the column sequence (splitting the `group_d`
  # column spanner into two parts)
  tbl_html <-
    gt(mtcars[1, ]) %>%
    tab_spanner(
      label = md("*group_a*"),
      columns = c(cyl, hp)
    ) %>%
    tab_spanner(
      label = md("*group_b*"),
      columns = c(drat, wt)
    ) %>%
    tab_spanner(
      label = md("*group_c*"),
      columns = c(qsec, vs, am)
    ) %>%
    tab_spanner(
      label = md("*group_d*"),
      columns = c(gear, carb)
    ) %>%
    tab_spanner(
      label = md("*never*"),
      columns = ends_with("nothing")
    ) %>%
    cols_move_to_start(columns = carb) %>%
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
