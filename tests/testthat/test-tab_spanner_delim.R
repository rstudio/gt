context("Ensuring that the `tab_spanner_delim()` function works as expected")

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
