# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

# Validate individual `cells_*()` functions ------------------------------------
test_that("cells_title() works for title", {

  helper_cells_title <- cells_title(groups = "title")

  # Expect this has the `cells_title` and `location_cells` classes
  expect_s3_class(helper_cells_title, c("cells_title", "location_cells"))
  expect_length(helper_cells_title, 1)

  # Expect the list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_title[[1]], c("quosure", "formula"))
  expect_equal(rlang::eval_tidy(helper_cells_title[[1]]), "title")
})

test_that("cells_title() works for subtitle", {

  helper_cells_title <- cells_title(groups = "subtitle")

  # Expect this has the `cells_title` and `location_cells` classes
  expect_s3_class(helper_cells_title, c("cells_title", "location_cells"))
  expect_length(helper_cells_title, 1)

  # Expect the list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_title[[1]] , c("quosure", "formula"))
  expect_equal(rlang::eval_tidy(helper_cells_title[[1]]), "subtitle")
})

test_that("cells_title() errors if groups is invalid", {

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
  expect_error(cells_title(groups = character(0L)))
})

test_that("cells_column_labels() works correctly", {

  helper_cells_column_labels <-
    cells_column_labels(columns = c("col_1", "col_2"))

  # Expect this has the `cells_column_labels` and `location_cells` classes
  expect_s3_class(
    helper_cells_column_labels,
    c("cells_column_labels", "location_cells")
  )
  expect_length(helper_cells_column_labels, 1)
  expect_named(helper_cells_column_labels, "columns")

  # Expect the first list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_column_labels[[1]], c("quosure", "formula"))
  expect_equal(
    rlang::eval_tidy(helper_cells_column_labels[[1]]),
    c("col_1", "col_2")
  )
})

test_that("cells_column_spanner() works correctly", {

  helper_cells_column_spanners <-
    cells_column_spanners(spanners = c("group_1", "group_2"))

  # Expect this has the `cells_column_spanners` and `location_cells` classes
  expect_s3_class(
    helper_cells_column_spanners,
    c("cells_column_spanners", "location_cells")
  )

  # Expect the length of the object to be `1`
  expect_length(helper_cells_column_spanners, 1)
  expect_named(helper_cells_column_spanners, "spanners")

  # Expect the first list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_column_spanners[[1]], c("quosure", "formula"))

  # Expect the RHS to contain the vector provided
  expect_equal(
    rlang::eval_tidy(helper_cells_column_spanners[[1]]),
    c("group_1", "group_2")
  )
})

test_that("cells_row_groups() works correctly", {

  helper_cells_row_groups <- cells_row_groups(groups = c("group_1", "group_2"))

  # Expect this has the `cells_row_groups` and `location_cells` classes
  expect_s3_class(helper_cells_row_groups, c("cells_row_groups", "location_cells"))
  expect_length(helper_cells_row_groups, 1)
  expect_named(helper_cells_row_groups, "groups")

  # Expect the first list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_row_groups[[1]], c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  expect_equal(
    rlang::eval_tidy(helper_cells_row_groups[[1]]),
    c("group_1", "group_2")
  )
})

test_that("cells_stub() works correctly", {

  # Create a `cells_stub` object with names provided to `rows`
  helper_cells_stub <- cells_stub(rows = c("row_1", "row_2"))

  expect_s3_class(helper_cells_stub, c("cells_stub", "location_cells"))
  expect_length(helper_cells_stub, 1)
  expect_named(helper_cells_stub, "rows")

  expect_s3_class(helper_cells_stub[[1]] , c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain the vector provided
  expect_equal(
    rlang::eval_tidy(helper_cells_stub[[1]]),
    c("row_1", "row_2")
  )
})

test_that("cells_body() works correctly with names provided to columns", {

  helper_cells_body <- cells_body(columns = c("col_1", "col_2"))

  expect_s3_class(helper_cells_body, c("cells_body", "location_cells"))
  expect_length(helper_cells_body, 2)
  expect_named(helper_cells_body, c("columns", "rows"))

  # Expect the RHS of the first component formula to contain the vector provided
  expect_s3_class(helper_cells_body[[1]], c("quosure", "formula"))
  expect_equal(rlang::eval_tidy(helper_cells_body[[1]]), c("col_1", "col_2"))

})

test_that("cells_body() works with names provided to `columns` and `rows`", {

  helper_cells_body <-
    cells_body(
      columns = c("col_1", "col_2"),
      rows = c("row_1", "row_2")
    )

  expect_s3_class(helper_cells_body, c("cells_body", "location_cells"))
  expect_length(helper_cells_body, 2)
  expect_named(helper_cells_body, c("columns", "rows"))

  # Expect the first list component to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_body[[1]] , c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain columns
  expect_equal(rlang::eval_tidy(helper_cells_body[[1]]), c("col_1", "col_2"))

  # Expect the second list component to have the `quosure` and `formula` classes
  # and contain rows
  expect_s3_class(helper_cells_body[[2]], c("quosure", "formula"))
  expect_equal(rlang::eval_tidy(helper_cells_body[[2]]), c("row_1", "row_2"))
})

test_that("cells_summary() works correctly", {

  # Create a `cells_summary` object with names provided to `columns`
  helper_cells_summary <-
    cells_summary(groups = "group_a", columns = c("col_1", "col_2"))

  expect_s3_class(helper_cells_summary, c("cells_summary", "location_cells"))
  expect_length(helper_cells_summary, 3)
  expect_named(helper_cells_summary, c("groups", "columns", "rows"))

  # Expect components to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_summary[[1]], c("quosure", "formula"))
  expect_s3_class(helper_cells_summary[[2]], c("quosure", "formula"))
  expect_s3_class(helper_cells_summary[[3]], c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain groups
  expect_equal(eval_tidy(helper_cells_summary[[1]]), "group_a")

  # Expect the RHS of the second component formula to contain columns
  expect_equal(eval_tidy(helper_cells_summary[[2]]), c("col_1", "col_2"))

  # Create a `cells_summary` object with
  # columns in `c()` provided to `columns`'
  expect_no_error(cells_summary(groups = "group_a", columns = c(col_1, col_2)))
})

test_that("cells_grand_summary() works correctly", {

  helper_cells_grand_summary <-
    cells_grand_summary(columns = c("col_1", "col_2"))

  # Expect this has the `cells_summary` and `location_cells` classes
  expect_s3_class(helper_cells_grand_summary, c("cells_grand_summary", "location_cells"))
  expect_length(helper_cells_grand_summary, 2)
  expect_named(helper_cells_grand_summary, c("columns", "rows"))

  # Expect components to have the `quosure` and `formula` classes
  expect_s3_class(helper_cells_grand_summary[[1]], c("quosure", "formula"))
  expect_s3_class(helper_cells_grand_summary[[2]], c("quosure", "formula"))

  # Expect the RHS of the first component formula to contain
  # the vector provided
  expect_equal(
    rlang::eval_tidy(helper_cells_grand_summary[[1]]),
    c("col_1", "col_2")
  )

  # Create a `cells_grand_summary` object with
  # columns in `c()` provided to `columns`
  expect_no_error(cells_grand_summary(columns = c(col_1, col_2)))
})

test_that("cells_stubhead() works correctly", {
  expect_s3_class(cells_stubhead(), c("cells_stubhead", "location_cells"))
  expect_length(cells_stubhead(), 1)
  expect_named(cells_stubhead(), "groups")
  expect_equal(cells_stubhead()[[1]], "stubhead")
})

# Validate styling as a whole --------------------------------------------------

test_that("tab_style() works with cells_title()", {
  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )

  # Create a gt table with styling applied to the title
  gt_tbl_cells_title_1 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_header(title = "The Title", subtitle = "The Subtitle") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "title")
    )

  # Expect that the title has the style applied
  expect_match_html(
    gt_tbl_cells_title_1,
    paste0(
      "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">The Title</td>.*",
      "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style>The Subtitle</td>"
    )
  )

  # Create a gt table with styling applied to the subtitle
  gt_tbl_cells_title_2 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_header(title = "The Title", subtitle = "The Subtitle") |>
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "subtitle")
    )

  # Expect that the subtitle has the style applied
  expect_match_html(
    gt_tbl_cells_title_2,
    paste0(
      "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style>The Title</td>.*",
      "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Subtitle</td>"
    )
  )

  # Create a gt table with styling applied to the title and the subtitle
  gt_tbl_cells_title_3 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_header(title = "The Title", subtitle = "The Subtitle") |>
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "title")
    ) |>
    tab_header(title = "The Title", subtitle = "The Subtitle") |>
    tab_style(
      style = list(
        cell_text(size = px(10), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_title(groups = "subtitle")
    )

  # Expect that the title and the subtitle have styles applied
  expect_match_html(
    gt_tbl_cells_title_3,
    paste0(
      "<td colspan=\"4\" class=\"gt_heading gt_title gt_font_normal\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Title</td>.*",
      "<td colspan=\"4\" class=\"gt_heading gt_subtitle gt_font_normal gt_bottom_border\" style=\"color: #FFFFFF; font-size: 10px; background-color: #FFA500;\">The Subtitle</td>"
    )
  )
})

test_that("tab_style() works with cells_column_spanners()", {

  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )
  # Create a gt table with styling applied to the column spanner label
  gt_tbl_cells_column_spanners <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    cols_move_to_end(columns = value_1) |>
    tab_spanner(label = "spanner", columns = c(value_1, value_3)) |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_column_spanners(spanners = "spanner")
    )

  # Expect that the styling was applied to the correct column labels
  expect_match_html(
    gt_tbl_cells_column_spanners,
    paste0(
      "<th class=\"gt_center gt_columns_top_border gt_column_spanner_outer\" ",
      "rowspan=\"1\" colspan=\"2\" style=\"color: #FFFFFF; font-size: 20px; ",
      "background-color: #FFA500;\" scope=\"colgroup\" id=\"spanner\">.*?<div class=\"gt_column_spanner\">",
      "spanner</div>"
    )
  )
})

test_that("tab_style() works with cells_column_spanners(), level argument", {

    tbl <- data.frame(
      group = c("A", "B"),
      row = c("1", "2"),
      value_1 = c(361.1, 344.7),
      value_2 = c(260.1, 281.2),
      value_3 = c(3.8, 2.4),
      stringsAsFactors = FALSE
    )

    # gt with only one spanner level coloured
    gt_tbl_cells_column_spanners <-
      tbl |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_move_to_end(columns = value_1) |>
      tab_spanner(label = "spanner", columns = c(value_1, value_3)) |>
      tab_style(
        style = list(
          cell_text(size = px(20), color = "white"),
          cell_fill(color = "#FFA500")
        ),
        locations = cells_column_spanners(spanners = "spanner")
      )

    # gt with both spanner levels coloured
    gt_tbl_cells_column_spanners2 <- tbl |>
      gt(rowname_col = "row", groupname_col = "group") |>
      tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
      tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
      tab_style(
        style = list(
          cell_text(size = px(20), color = "white"),
          cell_fill(color = "#FFA500")
        ),
        locations = cells_column_spanners(spanners = c("spanner_small", "spanner_big"))
      )

    # selecting a level should work for spanners (all levels)
    expect_equal(
      gt_tbl_cells_column_spanners2,
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c(1, 2))
        )
    )

    expect_equal(
      gt_tbl_cells_column_spanners2,
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c())
        )
    )

    expect_equal(
      gt_tbl_cells_column_spanners2,
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = NULL)
        )
    )

    # selecting a level should work for spanners (one level)
    gt_tbl_cells_column_spanners <- tbl |>
      gt(rowname_col = "row", groupname_col = "group") |>
      tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
      tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
      tab_style(
        style = list(
          cell_text(size = px(20), color = "white"),
          cell_fill(color = "#FFA500")
        ),
        locations = cells_column_spanners(spanners = "spanner_big")
      )

    expect_equal(
      gt_tbl_cells_column_spanners,
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c(2))
        )
    )

    # selecting non existing levels -> error
    expect_warning(
      label = "selecting non existing levels -> error",
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c(5))
        )
    )

    expect_warning(
      label = "selecting non existing levels -> error",
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c(0))
        )
    )

    # selecting nun numeric spanner levels -> error
    expect_warning(
      label = "selecting nun numeric spanner levels -> error",
      tbl |>
        gt(rowname_col = "row", groupname_col = "group") |>
        tab_spanner(label = "spanner_small", columns = c(value_1, value_3)) |>
        tab_spanner(label = "spanner_big", columns = c(value_1, value_2, value_3)) |>
        tab_style(
          style = list(
            cell_text(size = px(20), color = "white"),
            cell_fill(color = "#FFA500")
          ),
          locations = cells_column_spanners(spanners = tidyselect::contains("spanner"), levels = c("a"))
        )
    )
  }
)

test_that("tab_style() works with cells_column_labels()", {

    tbl <- data.frame(
      group = c("A", "B"),
      row = c("1", "2"),
      value_1 = c(361.1, 344.7),
      value_2 = c(260.1, 281.2),
      value_3 = c(3.8, 2.4),
      stringsAsFactors = FALSE
    )

    # Create a gt table with styling applied to two column labels
    gt_tbl_cells_column_labels <-
      tbl |>
      gt(rowname_col = "row", groupname_col = "group") |>
      cols_move_to_end(columns = "value_1") |>
      tab_style(
        style = list(
          cell_text(size = px(20), color = "white"),
          cell_fill(color = "#FFA500")
        ),
        locations = cells_column_labels(
          columns = c("value_1", "value_3"))
      )

    # Expect that the styling was applied to the correct column labels
    expect_match_html(
      gt_tbl_cells_column_labels,
      paste0(
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_left\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"a::stub\"></th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" scope=\"col\" id=\"value_2\">value_2</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"col\" id=\"value_3\">value_3</th>.*",
        "<th class=\"gt_col_heading gt_columns_bottom_border gt_right\" rowspan=\"1\" colspan=\"1\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"col\" id=\"value_1\">value_1</th>"
      )
    )
})

test_that("tab_style() works with cells_row_groups()", {

  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )

  # Create a gt table with styling applied to first row group
  gt_tbl_cells_row_group_1 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups(groups = "A")
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_row_group_1,
    paste0(
      "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"A\">A</th>.*",
      "<th colspan=\"4\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"B\">B</th>"
    )
  )

  # Create a gt table with styling applied to second row group
  gt_tbl_cells_row_group_2 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups(groups = "B")
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_row_group_2,
    paste0(
      "<th colspan=\"4\" class=\"gt_group_heading\" scope=\"colgroup\" id=\"A\">A</th>.*",
      "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"B\">B</th>"
    )
  )

  # Create a gt table with styling applied to all row groups (with `TRUE`)
  gt_tbl_cells_row_group_3 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_row_groups()
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_row_group_3,
    paste0(
      "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"A\">A</th>.*",
      "<th colspan=\"4\" class=\"gt_group_heading\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\" scope=\"colgroup\" id=\"B\">B</th>"
    )
  )
})

test_that("tab_style() works with cells_stub()", {

  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )

  # Create a gt table with styling applied to first stub row
  gt_tbl_cells_stub_1 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = 1)
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_stub_1,
    paste0(
      "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
      "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2</th>"
    )
  )

  # Create a gt table with styling applied to first stub row (using the row name)
  gt_tbl_cells_stub_1b <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = "1")
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_stub_1b,
    paste0(
      "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
      "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\">2</th>"
    )
  )

  # Create a gt table with styling applied to second stub row
  gt_tbl_cells_stub_2 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = 2)
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_stub_2,
    paste0(
      "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1</th>.*",
      "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
    )
  )

  # Create a gt table with styling applied to second stub row (using the row name)
  gt_tbl_cells_stub_2b <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = "2")
    )

  # Expect that the styling was applied to the correct row group
  expect_match_html(
    gt_tbl_cells_stub_2b,
    paste0(
      "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\">1</th>.*",
      "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
    )
  )

  # Create a gt table with styling applied to all stub rows
  gt_tbl_cells_stub_3 <-
    tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_stub(rows = TRUE)
    )

  # Expect that the styling was applied to both row groups
  expect_match_html(
    gt_tbl_cells_stub_3,
    paste0(
      "<th id=\"stub_1_1\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">1</th>.*",
      "<th id=\"stub_1_2\" scope=\"row\" class=\"gt_row gt_right gt_stub\" style=\"color: #FFFFFF; font-size: 20px; background-color: #FFA500;\">2</th>"
    )
  )
})

test_that("tab_style() works with cells_body()", {

  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )

  check_suggests()

  # Expect that styling to all cells is performed
  # by default with `cells_body()`
  styling <- tbl |>
    gt(rowname_col = "row", groupname_col = "group") |>
    tab_style(
      style = list(
        cell_text(size = px(20), color = "white"),
        cell_fill(color = "#FFA500")
      ),
      locations = cells_body(columns = everything(), rows = everything())
    ) |>
    render_as_html() |>
    xml2::read_html() |>
    selection_value("style")

    expect_equal(
      styling,
      rep("color: #FFFFFF; font-size: 20px; background-color: #FFA500;", 6)
    )
})

test_that("Styles are correctly applied to tables with summary functions", {

  # Create a table with a summary to test HTML output in summary locations
  tbl_summary <-
    gt(
      exibble,
      rowname_col = "row",
      groupname_col = "group"
    ) |>
    summary_rows(
      groups = "grp_a",
      columns = num,
      fns = list(
        min = ~min(.),
        max = ~max(.),
        avg = ~mean(.)
      ),
      fmt = list(~ fmt_number(., use_seps = FALSE))
    ) |>
    grand_summary_rows(
      columns = currency,
      fns = list(
        min = ~min(., na.rm = TRUE),
        max = ~max(., na.rm = TRUE)
      ),
      fmt = list(~ fmt_number(.))
    )

  ## cells_summary() ------------------------------------------------------------

  gt_tbl_cells_summary_1 <-
    tab_style(
      tbl_summary,
      style = cell_fill(color = "red"),
      locations = cells_summary(groups = "grp_a", rows = 1, columns = 1)
    )

  expect_match_html(
    gt_tbl_cells_summary_1,
    paste0(
      "<td headers=\"grp_a summary_stub_grp_a_1 num\" class=\"gt_row gt_right gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">0.11</td>.*",
      "<td headers=\"grp_a summary_stub_grp_a_1 char\" class=\"gt_row gt_left gt_summary_row gt_first_summary_row thick\">\U02014</td>"
      )
    )

  gt_tbl_cells_summary_2 <-
    tab_style(
      tbl_summary,
      style = cell_fill(color = "red"),
      locations = cells_summary(groups = "grp_a", rows = 1)
    )

  expect_match_html(
    gt_tbl_cells_summary_2,
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
  )

  ## cells_stub_summary() ------------------------------------------------------

  gt_tbl_cells_stub_summary_1 <-
    tab_style(
      tbl_summary,
      style = cell_fill(color = "red"),
      locations = cells_stub_summary(groups = "grp_a", rows = 1)
    )

  expect_match_html(
    gt_tbl_cells_stub_summary_1,
    "<th id=\"summary_stub_grp_a_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">min</th>"
  )

  gt_tbl_cells_stub_summary_2 <-
    tab_style(
      tbl_summary,
      style = cell_fill(color = "red"),
      locations = cells_stub_summary(groups = "grp_a", rows = "min")
    )

  expect_match_html(
    gt_tbl_cells_stub_summary_2,
    "<th id=\"summary_stub_grp_a_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_summary_row gt_first_summary_row thick\" style=\"background-color: #FF0000;\">min</th>"
  )

  ## cells_grand_summary() ----------------------------------------------------

  gt_tbl_cells_grand_summary_1 <-
    tab_style(
      tbl_summary,
      style = cell_fill(color = "red"),
      locations = cells_grand_summary(rows = 1, columns = currency)
    )

  expect_match_html(
    gt_tbl_cells_grand_summary_1,
    "<td headers=\"grand_summary_stub_1 currency\" class=\"gt_row gt_right gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">0.44</td>"
  )

  gt_tbl_cells_grand_summary_2 <-
    tbl_summary |>
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_grand_summary(rows = "max")
    )

  expect_match_html(
    gt_tbl_cells_grand_summary_2,
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
  )

  ## cells_stub_grand_summary() ------------------------------------------------

  gt_tbl_cells_stub_grand_summary_1 <-
    tbl_summary |>
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_grand_summary(rows = 1)
    )

  expect_match_html(
    gt_tbl_cells_stub_grand_summary_1,
    "<th id=\"grand_summary_stub_1\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_first_grand_summary_row\" style=\"background-color: #FF0000;\">min</th>"
  )

  gt_tbl_cells_stub_grand_summary_2 <-
    tbl_summary |>
    tab_style(
      style = cell_fill(color = "red"),
      locations = cells_stub_grand_summary(rows = "max")
    )

  expect_match_html(
    gt_tbl_cells_stub_grand_summary_2,
    "<th id=\"grand_summary_stub_2\" scope=\"row\" class=\"gt_row gt_left gt_stub gt_grand_summary_row gt_last_summary_row\" style=\"background-color: #FF0000;\">max</th>"
  )
})

test_that("tab_style() works with cells_source_notes() and cells_footnotes()", {

  tbl <- data.frame(
    group = c("A", "B"),
    row = c("1", "2"),
    value_1 = c(361.1, 344.7),
    value_2 = c(260.1, 281.2),
    value_3 = c(3.8, 2.4),
    stringsAsFactors = FALSE
  )

  style <- cell_fill(color = "red")

  gt_tbl_cells_footnotes_1 <-
    gt(tbl) |>
    tab_footnote("This is a footnote", locations = cells_body(1, 1)) |>
    tab_style(style, cells_footnotes())

  expect_match_html(
    gt_tbl_cells_footnotes_1,
    "<td class=\"gt_footnote\" style=\"background-color: #FF0000;\""
  )

  gt_tbl_cells_source_notes_1 <-
    gt(tbl) |>
    tab_source_note(source_note = "This is a source note") |>
    tab_style(style, cells_source_notes())

  expect_match_html(
    gt_tbl_cells_source_notes_1,
    "<td class=\"gt_sourcenote\" style=\"background-color: #FF0000;\" colspan=\"5\">This is a source note</td>"
  )
})

test_that("tab_footnote() errors if `locations = cells_source_notes()`", {

  expect_snapshot(error = TRUE, {
    gt(mtcars_short) |>
      tab_source_note(source_note = "This is a source note") |>
      tab_footnote(
        footnote = "Illegal footnote",
        locations = cells_source_notes()
      )
  })
})

test_that("tab_footnote() errors if `locations = cells_footnotes()`", {

  expect_snapshot(error = TRUE, {
    gt(mtcars_short) |>
      tab_source_note(source_note = "This is a source note") |>
      tab_footnote(
        footnote = "Illegal footnote",
        locations = cells_footnotes()
      )
  })
})
