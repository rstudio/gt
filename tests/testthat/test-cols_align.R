context("Ensuring that the `cols_align*()` work as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the function `cols_align()` works as expected", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns are aligned left
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = vars(mpg, cyl, drat)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # are those columns that were aligned left
  tbl_html %>%
    rvest::html_nodes("[class='col_heading left']") %>%
    rvest::html_text() %>%
    expect_equal(c("mpg", "cyl", "drat"))

  # Expect that all other columns are center-aligned
  tbl_html %>%
    rvest::html_nodes("[class='col_heading center']") %>%
    rvest::html_text() %>%
    expect_equal(base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "drat")))

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns are aligned right
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_align(align = "right", columns = vars(mpg, cyl, drat)) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the columns with class `col_heading right`
  # are those columns that were aligned right
  tbl_html %>%
    rvest::html_nodes("[class='col_heading right']") %>%
    rvest::html_text() %>%
    expect_equal(c("mpg", "cyl", "drat"))

  # Expect that all other columns are center-aligned
  tbl_html %>%
    rvest::html_nodes("[class='col_heading center']") %>%
    rvest::html_text() %>%
    expect_equal(base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "drat")))

  # Expect that supplying an `align` value that is not `left`, `center`,
  # or `right` will result in an error
  expect_error(
    gt(data = mtcars_short) %>%
      cols_align(align = "right", columns = vars(mpg, cyl, drat)))

  # Expect that supplying a column name that doesn't exist in the
  # table boxhead will result in an error
  expect_error(
    gt(data = mtcars_short) %>%
      cols_align(align = "right", columns = vars(car)))
})
