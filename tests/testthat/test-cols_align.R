context("Ensuring that the `cols_align*()` functions work as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

# Create a data frame based on the internal `sp500.csv`
sp500 <-
  read.csv(
    system.file("extdata", "sp500.csv", package = "gt"),
    stringsAsFactors = FALSE)

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

test_that("the `cols_align()` function works correctly", {

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
    rvest::html_nodes("[class='gt_col_heading gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("mpg", "cyl", "drat"))

  # Expect that all other columns are right-aligned
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "drat")))

  # Create a `tbl_html` object with `gt()`; columns `1` (`mpg`),
  # `2` (`cyl`), and `3` (`disp`) are aligned right
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = 1:3) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the columns with class `gt_col_heading gt_left`
  # are those columns that were aligned left
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("mpg", "cyl", "disp"))

  # Expect that all other columns are right-aligned
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_right']") %>%
    rvest::html_text() %>%
    expect_equal(base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "disp")))

  # Expect that supplying an `align` value that is not `left`, `center`,
  # or `right` will result in an error
  expect_error(
    gt(data = mtcars_short) %>%
      cols_align(align = "righter", columns = vars(mpg, cyl, drat)))

  # Expect that supplying a column name that doesn't exist in the
  # table columns will result in an error
  expect_error(
    gt(data = mtcars_short) %>%
      cols_align(align = "right", columns = vars(car)))

  # Expect that supplying any column index that doesn't exist in the
  # table will result in an error
  expect_error(
    gt(data = mtcars_short) %>%
      cols_align(align = "right", columns = c(1, 20)))

  # Create a `tbl_html` object with `gt()`; align all
  # columns to the left
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # includes all columns in `mtcars_short`
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(colnames(mtcars_short))

  # Create a `tbl_html` object with `gt()`; align all
  # columns (using `columns = TRUE`) to the left
  tbl_html <-
    gt(data = mtcars_short) %>%
    cols_align(align = "left", columns = TRUE) %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # includes all columns in `mtcars_short`
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(colnames(mtcars_short))

  # Create a `tbl_html` object with the `sp500` data
  # frame and `auto`-align all columns
  tbl_html <-
    gt(data = sp500) %>%
    cols_align(align = "auto") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `Date` column is left-formatted because
  # the column is of the `character` class
  tbl_html %>%
    rvest::html_nodes("[class='gt_col_heading gt_left']") %>%
    rvest::html_text() %>%
    expect_equal("Date")
})
