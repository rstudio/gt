# Create a shortened version of `iris`
iris_short <- iris[1:5, ]

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the `tab_spanner_delim()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(delim = ".")

  # Expect a particular ordering of column labels in `_boxh`
  tbl_html %>%
    dt_boxhead_get() %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("Length", "Width", "Length", "Width", "Species"))

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("Petal", "Sepal"))

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    grepl("Sepal|Petal", .) %>%
    all() %>%
    expect_true()

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(c("Species", "Length", "Width", "Length", "Width"))

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal("Sepal")

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    grepl("Sepal", .) %>%
    expect_true()

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(c("Petal.Length", "Petal.Width", "Species", "Length", "Width"))

  # Create a `tbl_html` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width`
  # columns using the `vars()` helper
  tbl_html <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = vars(Sepal.Length, Sepal.Width)
    )

  # Expect a particular ordering of spanner labels in `_spanners`
  tbl_html %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal("Sepal")

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='2']") %>%
    rvest::html_text() %>%
    grepl("Sepal", .) %>%
    expect_true()

  # Expect that the columns with a colspan of `2` have the same
  # ordering in the rendered table
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[colspan='1']") %>%
    rvest::html_text() %>%
    expect_equal(
      c("Petal.Length", "Petal.Width", "Species", "Length", "Width"))
})

test_that("`tab_spanner_delim()` gathers columns as necessary", {

  tbl_a <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)

  tbl_b <- dplyr::tibble(A_X = 1, B_X = 2, A_Y = 3, B_Y = 4, Z = 5)

  tbl_c <- dplyr::tibble(Z = 0.5, A_X = 1, B_X = 2, A_Y = 3, B_Y = 4)

  tbl_html_1 <-
    gt(tbl_a) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_1 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_1 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("X", "Y", "X", "Y"))

  tbl_html_2 <-
    gt(tbl_a) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_2 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_2 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("X", "X", "Y", "Y"))

  tbl_html_3 <-
    gt(tbl_b) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_3 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "Y", "X", "Y"))

  tbl_html_3 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("1", "3", "2", "4", "5"))

  tbl_html_4 <-
    gt(tbl_b) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_4 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_4 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("1", "2", "3", "4", "5"))

  tbl_html_5 <-
    gt(tbl_c) %>%
    tab_spanner_delim(
      delim = "_",
      gather = TRUE
    )

  tbl_html_5 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "Y", "X", "Y"))

  tbl_html_5 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("0.5", "1", "3", "2", "4"))

  tbl_html_6 <-
    gt(tbl_c) %>%
    tab_spanner_delim(
      delim = "_",
      gather = FALSE
    )

  tbl_html_6 %>%
    dt_spanners_get() %>%
    .$spanner_label %>%
    unlist() %>%
    expect_equal(c("A", "B"))

  tbl_html_6 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_column_spanner']") %>%
    rvest::html_text() %>%
    expect_equal(c("A", "B", "A", "B"))

  tbl_html_6 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("Z", "X", "X", "Y", "Y"))

  tbl_html_6 %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_row gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(c("0.5", "1", "2", "3", "4"))
})
