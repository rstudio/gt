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

# Create a table with a summary to test HTML output in summary locations
tbl_summary <-
  gt(
    exibble,
    rowname_col = "row",
    groupname_col = "group"
  ) %>%
  summary_rows(
    groups = "grp_a",
    columns = num,
    fns = list(
      min = ~min(.),
      max = ~max(.),
      avg = ~mean(.)
    ),
    fmt = list(~ fmt_number(., use_seps = FALSE))
  ) %>%
  grand_summary_rows(
    columns = currency,
    fns = list(
      min = ~min(., na.rm = TRUE),
      max = ~max(., na.rm = TRUE)
    ),
    fmt = list(~ fmt_number(.))
  )

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {
  selection <- paste0("[", key, "]")
  rvest::html_attr(rvest::html_nodes(html, selection), key)
}

test_that("The `cells_title()` function works correctly", {

  # Create a `cells_title` object with the `title` option
  helper_cells_title <- cells_title(groups = "title")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_s3_class(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'title'
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("title")

  # Create a `cells_title` object with the `subtitle` option
  helper_cells_title <- cells_title(groups = "subtitle")

  # Expect this has the `cells_title` and `location_cells` classes
  helper_cells_title %>%
    expect_s3_class(c("cells_title", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_title %>%
    length() %>%
    expect_equal(1)

  # Expect the list component to have the `quosure` and `formula` classes
  helper_cells_title[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the formula to be 'subtitle'
  helper_cells_title[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal("subtitle")

  # Expect an error if the input to `cells_title()` is invalid
  expect_error(cells_title(groups = NULL))
  expect_error(cells_title(groups = 1:2))
  expect_error(cells_title(groups = vars(title)))
  expect_error(cells_title(groups = "titles"))
  expect_error(cells_title(groups = c("title", "stubtitle")))
  expect_error(cells_title(groups = c("title", "subtitle", "title")))
  expect_error(cells_title(groups = c("title", "subtitle", "subtitle")))
  expect_error(cells_title(groups = c("title", "title")))
  expect_error(cells_title(groups = c("subtitle", "subtitle")))
  expect_error(cells_title(groups = rep("title", 3)))
  expect_error(cells_title(groups = ""))
  expect_error(cells_title(groups = character(0)))
})

test_that("The `cells_column_labels()` function works correctly", {

  # Create a `cells_column_labels` object with names provided to `columns`
  helper_cells_column_labels <-
    cells_column_labels(columns = c("col_1", "col_2"))

  # Expect this has the `cells_column_labels` and `location_cells` classes
  helper_cells_column_labels %>%
    expect_s3_class(c("cells_column_labels", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_labels %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `columns`
  helper_cells_column_labels %>%
    names() %>%
    expect_equal("columns")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_labels[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the formula to contain the vector provided
  helper_cells_column_labels[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_column_labels` object with names provided to `groups`
  helper_cells_column_spanners <-
    cells_column_spanners(spanners = c("group_1", "group_2"))

  # Expect this has the `cells_column_spanners` and `location_cells` classes
  helper_cells_column_spanners %>%
    expect_s3_class(c("cells_column_spanners", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_column_spanners %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the name `spanners`
  helper_cells_column_spanners %>%
    names() %>%
    expect_equal("spanners")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_column_spanners[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the first list component to be not be NULL
  is.null(helper_cells_column_spanners[[1]]) %>% expect_false()

  # Expect the RHS to contain the vector provided
  helper_cells_column_spanners[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("The `cells_row_groups()` function works correctly", {

  # Create a `cells_row_groups` object with names provided to `groups`
  helper_cells_row_groups <- cells_row_groups(groups = c("group_1", "group_2"))

  # Expect this has the `cells_row_groups` and `location_cells` classes
  helper_cells_row_groups %>%
    expect_s3_class(c("cells_row_groups", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_row_groups %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `groups`
  helper_cells_row_groups %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_row_groups[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_row_groups[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("group_1", "group_2"))
})

test_that("The `cells_stub()` function works correctly", {

  # Create a `cells_stub` object with names provided to `rows`
  helper_cells_stub <- cells_stub(rows = c("row_1", "row_2"))

  # Expect this has the `cells_stub` and `location_cells` classes
  helper_cells_stub %>%
    expect_s3_class(c("cells_stub", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stub %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has within it the name `rows`
  helper_cells_stub %>%
    names() %>%
    expect_equal("rows")

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_stub[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  helper_cells_stub[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("row_1", "row_2"))
})

test_that("The `cells_body()` function works correctly", {

  # Create a `cells_body` object with names provided to `columns`
  helper_cells_body <- cells_body(columns = c("col_1", "col_2"))

  # Expect this has the `cells_body` and `location_cells` classes
  helper_cells_body %>%
    expect_s3_class(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_s3_class(c("quosure", "formula"))

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
    expect_s3_class(c("cells_body", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_body %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_body %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_body[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_body[[2]] %>% expect_s3_class(c("quosure", "formula"))

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

test_that("The `cells_summary()` function works correctly", {

  # Create a `cells_summary` object with names provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = c("col_1", "col_2")
    )

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_summary %>%
    expect_s3_class(c("cells_summary", "location_cells"))

  # Expect the length of the object to be `3`
  helper_cells_summary %>%
    length() %>%
    expect_equal(3)

  # Expect that the object has the names `groups`, `columns`, and `rows`
  helper_cells_summary %>%
    names() %>%
    expect_equal(c("groups", "columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_summary[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_summary[[2]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the third list component to have the `quosure` and `formula` classes
  helper_cells_summary[[3]] %>% expect_s3_class(c("quosure", "formula"))

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
  # columns in `c()` provided to `columns`
  helper_cells_summary <-
    cells_summary(
      groups = "group_a",
      columns = c(col_1, col_2)
    )
})

test_that("The `cells_grand_summary()` function works correctly", {

  # Create a `cells_grand_summary` object with names provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = c("col_1", "col_2")
    )

  # Expect this has the `cells_summary` and `location_cells` classes
  helper_cells_grand_summary %>%
    expect_s3_class(c("cells_grand_summary", "location_cells"))

  # Expect the length of the object to be `2`
  helper_cells_grand_summary %>%
    length() %>%
    expect_equal(2)

  # Expect that the object has the names `columns` and `rows`
  helper_cells_grand_summary %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[1]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the second list component to have the `quosure` and `formula` classes
  helper_cells_grand_summary[[2]] %>% expect_s3_class(c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  helper_cells_grand_summary[[1]] %>%
    rlang::eval_tidy() %>%
    expect_equal(c("col_1", "col_2"))

  # Create a `cells_grand_summary` object with
  # columns in `c()` provided to `columns`
  helper_cells_grand_summary <-
    cells_grand_summary(
      columns = c(col_1, col_2)
    )
})

test_that("The `cells_stubhead()` function works correctly", {

  # Create a `cells_stubhead` object
  helper_cells_stubhead <- cells_stubhead()

  # Expect this has the `cells_stubhead` and `location_cells` classes
  helper_cells_stubhead %>%
    expect_s3_class(c("cells_stubhead", "location_cells"))

  # Expect the length of the object to be `1`
  helper_cells_stubhead %>%
    length() %>%
    expect_equal(1)

  # Expect that the object has the single name `groups`
  helper_cells_stubhead %>%
    names() %>%
    expect_equal("groups")

  # Expect the first list component to have the `character` type
  helper_cells_stubhead[[1]] %>% expect_type("character")

  # Expect a specific value for the single list component
  helper_cells_stubhead[[1]] %>%
    expect_equal("stubhead")
})

test_that("Styles are correctly applied to HTML output with location functions", {

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
        "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">The Title</td>.*",
        "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style>The Subtitle</td>"
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
        "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style>The Title</td>.*",
        "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Subtitle</td>"
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
        "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Title</td>.*",
        "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Subtitle</td>"
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
    cols_move_to_end(columns = value_1) %>%
    tab_spanner(label = "spanner", columns = c(value_1, value_3)) %>%
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
        "rowspan=\"1\" colspan=\"2\" style=\"color: #FFFFFF; font-size: 20px; ",
        "background-color: #FFA500;\" scope=\"colgroup\" id=\"spanner\">.*?<span class=\"gt_column_spanner\">",
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
    cols_move_to_end(columns = "value_1") %>%
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_column_labels(
        columns = c("value_1", "value_3"))
    )

  # Expect that the styling was applied to the correct column labels
  gt_tbl_cells_column_labels %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"\"></th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"value_2\">value_2</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"col\" id=\"value_3\">value_3</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"col\" id=\"value_1\">value_1</th>"
      )
    ) %>%
    expect_true()

  #
  # cells_row_groups()
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
        "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"A\">A</th>.*",
        "<th colspan=\"4\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"B\">B</th>"
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
        "<th colspan=\"4\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"A\">A</th>.*",
        "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"B\">B</th>"
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
      locations = cells_row_groups()
    )

  # Expect that the styling was applied to the correct row group
  gt_tbl_cells_row_group_3 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"A\">A</th>.*",
        "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"B\">B</th>"
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
        "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
        "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2</th>"
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
        "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
        "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2</th>"
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
        "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1</th>.*",
        "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
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
        "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1</th>.*",
        "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
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
        "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
        "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
      )
    ) %>%
    expect_true()

  #
  # cells_body()
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
      locations = cells_body(columns = everything(), rows = everything())
    ) %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_value("style") %>%
    expect_equal(
      rep("color: #FFFFFF; font-size: 20px; background-color: #FFA500;", 6)
    )

  #
  # cells_summary()
  #

  gt_tbl_cells_summary_1 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_summary(groups = "grp_a", rows = 1, columns = 1)
    )

  gt_tbl_cells_summary_1 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<td headers=\"grp_a summary_stub_grp_a_1 num\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">0.11</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 char\" class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">\U02014</td>"
      )
    ) %>%
    expect_true()

  gt_tbl_cells_summary_2 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_summary(groups = "grp_a", rows = 1)
    )

  gt_tbl_cells_summary_2 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
        "<th id=\"summary_stub_grp_a_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\">min</th>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 num\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">0.11</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 char\" class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 fctr\" class=\"gt_row gt_center gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 date\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 time\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 datetime\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>.*",
        "<td headers=\"grp_a summary_stub_grp_a_1 currency\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">\U02014</td>"
      )
    ) %>%
    expect_true()

  #
  # cells_stub_summary()
  #

  gt_tbl_cells_stub_summary_1 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    )

  gt_tbl_cells_stub_summary_1 %>%
    render_as_html() %>%
    tidy_grepl(
      "<th id=\"summary_stub_grp_a_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">min</th>"
    ) %>%
    expect_true()

  gt_tbl_cells_stub_summary_2 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_summary(groups = "grp_a", rows = "min")
    )

  gt_tbl_cells_stub_summary_2 %>%
    render_as_html() %>%
    tidy_grepl(
      "<th id=\"summary_stub_grp_a_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">min</th>"
    ) %>%
    expect_true()

  #
  # cells_grand_summary()
  #

  gt_tbl_cells_grand_summary_1 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_grand_summary(rows = 1, columns = currency)
    )

  gt_tbl_cells_grand_summary_1 %>%
    render_as_html() %>%
    tidy_grepl(
      "<td headers=\"grand_summary_stub_1 currency\" class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">0.44</td>"
    ) %>%
    expect_true()

  gt_tbl_cells_grand_summary_2 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_grand_summary(rows = "max")
    )

  gt_tbl_cells_grand_summary_2 %>%
    render_as_html() %>%
    tidy_grepl(
      paste0(
          "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\">max</th>.*",
          "<td headers=\"grand_summary_stub_2 num\" class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 char\" class=\"gt_row gt_left gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 fctr\" class=\"gt_row gt_center gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 date\" class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 time\" class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 datetime\" class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">\U02014</td>.*",
          "<td headers=\"grand_summary_stub_2 currency\" class=\"gt_row gt_right gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">65,100.00</td>"
      )
    ) %>%
    expect_true()

  #
  # cells_stub_grand_summary()
  #

  gt_tbl_cells_stub_grand_summary_1 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_grand_summary(rows = 1)
    )

  gt_tbl_cells_stub_grand_summary_1 %>%
    render_as_html() %>%
    tidy_grepl(
      "<th id=\"grand_summary_stub_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</th>"
    ) %>%
    expect_true()

  gt_tbl_cells_stub_grand_summary_2 <-
    tbl_summary %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_grand_summary(rows = "max")
    )

  gt_tbl_cells_stub_grand_summary_2 %>%
    render_as_html() %>%
    tidy_grepl(
      "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">max</th>"
    ) %>%
    expect_true()

  #
  # cells_footnotes()
  #

  gt_tbl_cells_footnotes_1 <-
    tbl %>%
    gt() %>%
    tab_footnote("This is a footnote", locations = cells_body(1, 1)) %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_footnotes()
    )

  gt_tbl_cells_footnotes_1 %>%
    render_as_html() %>%
    tidy_grepl(
      "<td class=\"gt_footnote\" style=\"background-color: #FF0000;\""
    ) %>%
    expect_true()

  # Expect an error if applying footnotes to the footnotes location
  expect_error(
    tbl %>%
      gt() %>%
      tab_footnote(
        footnote = "This is a footnote",
        locations = cells_body(1, 1)
      ) %>%
      tab_footnote(
        footnote = "Illegal footnote",
        locations = cells_footnotes()
      )
  )

  #
  # cells_source_notes()
  #

  gt_tbl_cells_source_notes_1 <-
    tbl %>%
    gt() %>%
    tab_source_note(source_note = "This is a source note") %>%
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_source_notes()
    )

  gt_tbl_cells_source_notes_1 %>%
    render_as_html() %>%
    tidy_grepl(
      "<td class=\"gt_sourcenote\" style=\"background-color: #FF0000;\" colspan=\"5\">This is a source note</td>"
    ) %>%
    expect_true()

  # Expect an error if applying footnotes to the source notes location
  expect_error(
    tbl %>%
      gt() %>%
      tab_source_note(source_note = "This is a source note") %>%
      tab_footnote(
        footnote = "Illegal footnote",
        locations = cells_source_notes()
      )
  )
})
