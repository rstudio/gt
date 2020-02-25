context("Ensuring that the `cells_*()` functions work as expected")

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Create a minimal `tbl` for testing HTML output
tbl <-
  dplyr::tribble(
    ~group, ~row, ~value_1, ~value_2, ~value_3,
    "A",    "1",  361.1,    260.1,     3.8,
    "B",    "2",  344.7,    281.2,     2.4
  )

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {

  selection <- paste0("[", key, "]")

  html %>%
    rvest::html_nodes(selection) %>%
    rvest::html_attr(key)
}

test_that("the `cells_title()` function works correctly", {

  # Create a `cells_title` object with the `title` option
  helper_cells_title <- cells_title(groups = "title")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_is(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'title'
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("title")

  # Create a `cells_title` object with the `subtitle` option
  helper_cells_title <- cells_title(groups = "subtitle")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_is(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'subtitle'
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("subtitle")
})

test_that("the `cells_column_labels()` function works correctly", {

  # Create a `cells_column_labels` object with names provided to `columns`
  helper_cells_column_labels <-
    cells_column_labels(columns = c("col_1", "col_2"))

  # Expect this has the `cells_column_labels` and `location_cells` classes
  helper_cells_column_labels %>%
    expect_is(c("cells_column_labels", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_labels %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `columns`
  helper_cells_column_labels %>%
    names() %>%
    expect_equal("columns")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_labels[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the formula to contain the vector provided
  helper_cells_column_labels[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_column_labels` object with names provided to `groups`
  helper_cells_column_spanners <-
    cells_column_spanners(spanners = c("group_1", "group_2"))

  # Expect this has the `cells_column_spanners` and `location_cells` classes
  helper_cells_column_spanners %>%
    expect_is(c("cells_column_spanners", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_spanners %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `spanners`
  helper_cells_column_spanners %>%
    names() %>%
    expect_equal("spanners")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_spanners[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the first list component to be not be NULL
  is.null(helper_cells_column_spanners[[1]]) %>% expect_false()

  # Expect the RHS to contain the vector provided
  helper_cells_column_spanners[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("the `cells_row_groups()` function works correctly", {

  # Create a `cells_row_groups` object with names provided to `groups`
  helper_cells_row_groups <- cells_row_groups(groups = c("group_1", "group_2"))

  # Expect this has the `cells_row_groups` and `location_cells` classes
  helper_cells_row_groups %>%
    expect_is(c("cells_row_groups", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_row_groups %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `groups`
  helper_cells_row_groups %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_row_groups[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_row_groups[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("the `cells_stub()` function works correctly", {

  # Create a `cells_stub` object with names provided to `rows`
  helper_cells_stub <- cells_stub(rows = c("row_1", "row_2"))

  # Expect this has the `cells_stub` and `location_cells` classes
  helper_cells_stub %>%
    expect_is(c("cells_stub", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stub %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `rows`
  helper_cells_stub %>%
    names() %>%
    expect_equal("rows")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_stub[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_stub[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("row_1", "row_2"))
})

test_that("the `cells_body()` function works correctly", {

  # Create a `cells_body` object with names provided to `columns`
  helper_cells_body <- cells_body(columns = c("col_1", "col_2"))

  # Expect this has the `cells_body` and `location_cells` classes
  helper_cells_body %>%
    expect_is(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_body[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_body` object with names provided to `columns` and `rows`
  helper_cells_body <-
    cells_body(
      columns = c("col_1", "col_2"),
      rows = c("row_1", "row_2")
    )

  # Expect this has the `cells_body` and `location_cells` classes
  helper_cells_body %>%
    expect_is(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_body[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_body[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_body[[2]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("row_1", "row_2"))
})

test_that("the `cells_summary()` function works correctly", {

  # Create a `cells_summary` object with names provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = c("col_1", "col_2")
    )

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_summary %>%
    expect_is(c("cells_summary", "location_cells"))

  # Expect the length of the object to be `3`
  helper_cells_summary %>%
    length() %>%
    expect_equal(3)

  # Expect that the object has the names `groups`, `columns`, and `rows`
  helper_cells_summary %>%
    names() %>%
    expect_equal(c("groups", "columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_summary[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_summary[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the third list component to have the `quosure` and `formula` classes
  helper_cells_summary[[3]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_summary[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("group_a")

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_summary[[2]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_summary` object with
  # columns in `vars()` provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = vars(col_1, col_2)
    )

  # Expect the RHS of the second component formula to contain
  # the vector provided
  helper_cells_summary[[2]] %>%
    rlang::eval_tidy() %>%
    vapply(rlang::as_name, USE.NAMES = FALSE, character(1)) %>%
    expect_equal(c("col_1", "col_2"))
})

test_that("the `cells_grand_summary()` function works correctly", {

  # Create a `cells_grand_summary` object with names provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = c("col_1", "col_2")
    )

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_grand_summary %>%
    expect_is(c("cells_grand_summary", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_grand_summary %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_grand_summary %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[1]] %>% expect_is(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[2]] %>% expect_is(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_grand_summary[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_grand_summary` object with
  # columns in `vars()` provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = vars(col_1, col_2)
    )

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_grand_summary[[1]] %>%
    rlang::eval_tidy() %>%
    vapply(rlang::as_name, USE.NAMES = FALSE, character(1)) %>%
    expect_equal(c("col_1", "col_2"))
})

test_that("the `cells_stubhead()` function works correctly", {

  # Create a `cells_stubhead` object
  helper_cells_stubhead <- cells_stubhead()

  # Expect this has the `cells_stubhead` and `location_cells` classes
  helper_cells_stubhead %>%
    expect_is(c("cells_stubhead", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stubhead %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the single name `groups`
  helper_cells_stubhead %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `character`
  helper_cells_stubhead[[1]] %>% expect_is("character")

  # Expect a specific value for the single list component
  helper_cells_stubhead[[1]] %>%
    expect_equal("stubhead")
})

test_that("styles are correctly applied to HTML output with location functions", {

  check_suggests()

  #
  # cells_title()
  #

  # Create a gt table with styling applied to the title
  gt_tbl_cells_title_1 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_header(title = "The Title", subtitle = "The Subtitle") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "title")
    )

  # Expect that the title has the style applied
  gt_tbl_cells_title_1 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">The Title</th>.*",
        "<th colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style>The Subtitle</th>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to the subtitle
  gt_tbl_cells_title_2 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_header(title = "The Title", subtitle = "The Subtitle") %>%
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "subtitle")
    )

  # Expect that the subtitle has the style applied
  gt_tbl_cells_title_2 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style>The Title</th>.*",
        "<th colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: white; font-size: 10px; background-color: #FFA500;\">The Subtitle</th>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to the title and the subtitle
  gt_tbl_cells_title_3 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_header(title = "The Title", subtitle = "The Subtitle") %>%
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "title")
    ) %>%
    tab_header(title = "The Title", subtitle = "The Subtitle") %>%
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "subtitle")
    )

  # Expect that the title and the subtitle have styles applied
  gt_tbl_cells_title_3 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: white; font-size: 10px; background-color: #FFA500;\">The Title</th>.*",
        "<th colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: white; font-size: 10px; background-color: #FFA500;\">The Subtitle</th>"
      )
    ) %>%
    expect_true()

  #
  # cells_column_spanners()
  #

  # Create a gt table with styling applied to the column spanner label
  gt_tbl_cells_column_spanners <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    cols_move_to_end(columns = vars(value_1)) %>%
    tab_spanner(label = "spanner", columns = vars(value_1, value_3)) %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_column_spanners(spanners = "spanner")
    )

  # Expect that the styling was applied to the correct column labels
  gt_tbl_cells_column_spanners %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" ",
        "rowspan=\"1\" colspan=\"2\" style=\"color: white; font-size: 20px; ",
        "background-color: #FFA500;\">.*?<span class=\"gt_column_spanner\">",
        "spanner</span>"
        )
      ) %>%
    expect_true()

  #
  # cells_column_labels()
  #

  # Create a gt table with styling applied to two column labels
  gt_tbl_cells_column_labels <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    cols_move_to_end(columns = vars(value_1)) %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_column_labels(
        columns = vars(value_1, value_3))
    )

  # Expect that the styling was applied to the correct column labels
  gt_tbl_cells_column_labels %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\"></th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\">value_2</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">value_3</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">value_1</th>"
      )
    ) %>%
    expect_true()

  #
  # cells_group()
  #

  # Create a gt table with styling applied to first row group
  gt_tbl_cells_row_group_1 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups(groups = "A")
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_row_group_1 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td colspan=\"4\" class=\"gt_group_heading\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">A</td>.*",
        "<td colspan=\"4\" class=\"gt_group_heading\">B</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to second row group
  gt_tbl_cells_row_group_2 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups(groups = "B")
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_row_group_2 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td colspan=\"4\" class=\"gt_group_heading\">A</td>.*",
        "<td colspan=\"4\" class=\"gt_group_heading\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">B</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to all row groups (with `TRUE`)
  gt_tbl_cells_row_group_3 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups(groups = TRUE)
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_row_group_3 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td colspan=\"4\" class=\"gt_group_heading\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">A</td>.*",
        "<td colspan=\"4\" class=\"gt_group_heading\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">B</td>"
      )
    ) %>%
    expect_true()

  #
  # cells_stub()
  #

  # Create a gt table with styling applied to first stub row
  gt_tbl_cells_stub_1 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = 1)
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_stub_1 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">1</td>.*",
        "<td class=\"gt_row gt_left gt_stub\">2</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to first stub row (using the row name)
  gt_tbl_cells_stub_1b <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = "1")
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_stub_1b %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">1</td>.*",
        "<td class=\"gt_row gt_left gt_stub\">2</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to second stub row
  gt_tbl_cells_stub_2 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = 2)
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_stub_2 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td class=\"gt_row gt_left gt_stub\">1</td>.*",
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">2</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to second stub row (using the row name)
  gt_tbl_cells_stub_2b <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = "2")
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_stub_2b %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td class=\"gt_row gt_left gt_stub\">1</td>.*",
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">2</td>"
      )
    ) %>%
    expect_true()

  # Create a gt table with styling applied to all stub rows
  gt_tbl_cells_stub_3 <-
    tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = TRUE)
    )

  # Expect that the styling was applied to both row groups
  gt_tbl_cells_stub_3 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">1</td>.*",
        "<td class=\"gt_row gt_left gt_stub\" style=\"color: white; font-size: 20px; background-color: #FFA500;\">2</td>"
      )
    ) %>%
    expect_true()

  #
  # cells_group()
  #

  # Expect that styling to all cells is performed
  # by default with `cells_body()`
  tbl %>%
    gt(rowname_col = "row", groupname_col = "group") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_body()
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    expect_equal(
      rep("color: white; font-size: 20px; background-color: #FFA500;", 6)
    )
})
