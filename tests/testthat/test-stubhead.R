# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("A gt table contains the expected stubhead label", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()`; this table
  # contains a stub and a stubhead label
  tbl_html <-
    gt(mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead(label = "the mtcars") %>%
    render_as_html() %>%
    xml2::read_html()

  # Expect that the `the mtcars` content appears first in
  # the `data-type='column_heading'` series
  (tbl_html %>%
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_left']")) %>%
    expect_equal("the mtcars")
})

test_that("Stubhead labels can be removed using `rm_stubhead()`", {

  # Perform a snapshot test where an HTML table contains a stub
  # and a corresponding stubhead label
  exibble %>%
    gt(rowname_col = "row") %>%
    tab_stubhead(label = "Stubhead Label") %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that we can remove the stubhead label with `rm_stubhead()`
  exibble %>%
    gt(rowname_col = "row") %>%
    tab_stubhead(label = "Stubhead Label") %>%
    rm_stubhead() %>%
    render_as_html() %>%
    expect_snapshot()

  # Expect that removing the stubhead label creates a table no different than
  # one never having the label in the table object
  expect_equal(
    exibble %>%
      gt(rowname_col = "row") %>%
      tab_stubhead(label = "Stubhead Label") %>%
      rm_stubhead() %>%
      render_as_html(),
    exibble %>%
      gt(rowname_col = "row") %>%
      render_as_html()
  )

  # Expect that removing a non-existent stubhead label isn't different that
  # never having one in the table object
  expect_equal(
    exibble %>% gt(rowname_col = "row") %>% render_as_html(),
    exibble %>% gt(rowname_col = "row") %>% rm_stubhead() %>% render_as_html()
  )

  # If there isn't a stubhead label or even a stub in the input table
  # the function should return the data without any error
  expect_no_error(
    exibble %>% gt(rowname_col = "row") %>% rm_stubhead()
  )
  expect_no_error(
    exibble %>% gt() %>% rm_stubhead()
  )
})
