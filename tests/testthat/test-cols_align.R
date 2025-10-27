# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_align() works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; the `mpg`,
  # `cyl`, and `drat` columns are aligned left
  tbl_html <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = c(mpg, cyl, drat)) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # are those columns that were aligned left
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    c("mpg", "cyl", "drat")
  )

  # Expect that all other columns are center-aligned
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "drat"))
  )

  # Create a `tbl_html` object with `gt()`; columns `1` (`mpg`),
  # `2` (`cyl`), and `3` (`disp`) are aligned left
  tbl_html <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = 1:3) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the columns with class `gt_col_heading gt_left`
  # are those columns that were aligned left
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    c("mpg", "cyl", "disp")
  )

  # Expect that all other columns are right-aligned
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    base::setdiff(colnames(mtcars_short), c("mpg", "cyl", "disp"))
  )

  # Expect that supplying an `align` value that is not `left`, `center`,
  # or `right` will result in an error
  expect_error(
    gt(mtcars_short) |>
      cols_align(align = "righter", columns = c(mpg, cyl, drat))
  )

  # Expect that supplying a column name that doesn't exist in the
  # table columns will result in an error
  expect_error(
    gt(mtcars_short) |>
      cols_align(align = "right", columns = car)
  )

  # Expect that supplying any column index that doesn't exist in the
  # table will result in an error
  expect_error(
    gt(mtcars_short) |>
      cols_align(align = "right", columns = c(1, 20))
  )

  # Create a `tbl_html` object with `gt()`; align all
  # columns to the left
  tbl_html <-
    gt(mtcars_short) |>
    cols_align(align = "left") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # includes all columns in `mtcars_short`
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    colnames(mtcars_short)
  )

  # Create a `tbl_html` object with `gt()`; align all
  # columns (using `columns = everything()`) to the left
  tbl_html <-
    gt(mtcars_short) |>
    cols_align(align = "left", columns = everything()) |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the columns with class `col_heading left`
  # includes all columns in `mtcars_short`
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    colnames(mtcars_short)
  )

  # Create a data frame based on the internal `sp500.csv`
  sp500 <-
    read.csv(
      system.file("extdata", "sp500.csv", package = "gt"),
      stringsAsFactors = FALSE
    )

  # Create a `tbl_html` object with the `sp500` data
  # frame and `auto`-align all columns
  tbl_html <-
    gt(sp500) |>
    cols_align(align = "auto") |>
    render_as_html() |>
    xml2::read_html()

  # Expect that the `Date` column is left-formatted because
  # the column is of the `character` class
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    c("Date", "Open", "High", "Low", "Close", "Volume")
  )
})

test_that("The stub gets its alignment set properly with `cols_align()`", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a new tibble for testing
  tbl <-
    dplyr::tibble(
      stub = c("*one*", "**two**", "three"),
      vals = 3:1
    )

  # Create a `tbl_html` object with `gt()`; don't align any columns
  # with `cols_align()`
  tbl_html <-
    gt(tbl, rowname_col = "stub") |>
    tab_stubhead(label = "stub") |>
    render_as_html() |>
    xml2::read_html()

  # Expect the stub is left aligned (because of the text content) and that the
  # other column is right aligned (because of the numerical content
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_row gt_left gt_stub']") |>
      rvest::html_text(),
    c("*one*", "**two**", "three")
  )

  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
      rvest::html_text(),
    "vals"
  )

  # Create a `tbl_html` object with `gt()`; center align all columns
  tbl_html <-
    gt(tbl, rowname_col = "stub") |>
    tab_stubhead(label = "stub") |>
    cols_align(align = "center") |>
    render_as_html() |>
    xml2::read_html()

  # Expect both columns are center aligned
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_row gt_center gt_stub']") |>
      rvest::html_text(),
    c("*one*", "**two**", "three")
  )

  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_center']") |>
      rvest::html_text(),
    "vals"
  )

  # Create a `tbl_html` object with `gt()`; center align the stub column and
  # left align the `vals` column
  tbl_html <-
    gt(tbl, rowname_col = "stub") |>
    tab_stubhead(label = "stub") |>
    cols_align(align = "center", columns = stub) |>
    cols_align(align = "left", columns = vals) |>
    render_as_html() |>
    xml2::read_html()

  # Expect the correct alignment for each column
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_row gt_center gt_stub']") |>
      rvest::html_text(),
    c("*one*", "**two**", "three")
  )

  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    c("stub", "vals")
  )

  # Expect that the use of `stub()` produces the same result as providing the
  # stub column name
  tbl_html <-
    gt(tbl, rowname_col = "stub") |>
    tab_stubhead(label = "stub") |>
    cols_align(align = "center", columns = stub()) |>
    cols_align(align = "left", columns = vals) |>
    render_as_html() |>
    xml2::read_html()

  # Expect the correct alignment for each column
  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_row gt_center gt_stub']") |>
      rvest::html_text(),
      c("*one*", "**two**", "three")
  )

  expect_equal(
    tbl_html |>
      rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") |>
      rvest::html_text(),
    c("stub", "vals")
  )

  # When using `stub()` on a table with no stub, it should not error
  # (consistent with tidyselect behavior where selecting nothing is valid)
  expect_no_error(
    gt(tbl) |>
    cols_align(align = "center", columns = stub())
  )
})

test_that("check cols_align is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply alignment to table and group
  aligned_gt_tbl <-
    gt_tbl |>
    cols_align(align = "left", columns = c(mpg, cyl, drat))

  aligned_gt_group <-
    gt_group |>
    cols_align(align = "left", columns = c(mpg, cyl, drat))

  # Expect identical if function applied before or after group is constructed
  expect_identical(aligned_gt_group, gt_group(aligned_gt_tbl, aligned_gt_tbl))
})
