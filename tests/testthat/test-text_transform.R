context("Ensuring that the `text_transform()` function works as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

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

test_that("the `text_transform()` function works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column
  tbl_html <- gt(mtcars_short) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) paste0(x, " mpg"))

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    expect_match(".*mpg$")

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column with a slightly more
  # complex function
  tbl_html <- gt(mtcars_short) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) {
        paste0(x, " ", ifelse(x >= 20, "(good)", "(bad)"))
      })

  # Expect that all data values in the `mpg` column
  # have either '(good)' or '(bad)' at the end
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    expect_match(".*(\\(good\\)|\\(bad\\))$")

  # Create a `tbl_html` object with `gt()` and transform
  # all values in the `mpg` column with a function that
  # returns a single numeric value
  tbl_html <- gt(mtcars_short) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) {
        ifelse(x >= 20, 25, 15)
      })

  # Expect that all data values in the `mpg` column
  # are either '15' or '25'
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    unique() %>%
    expect_equal(c("25", "15"))

  # Create a `tbl_html` object with `gt()`, format `mpg` values
  # with `fmt_number()` (using a pattern) and further transform
  # all values in the `mpg` column; this shows that `text_transform()`
  # takes `x` that has gone through all formatting functions first
  tbl_html <- gt(mtcars_short) %>%
    fmt_number(
      columns = vars(mpg),
      decimals = 4,
      pattern = "{x} miles") %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) {
        paste(x, "per gallon")
      })

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    expect_match(".*miles per gallon$")

  # Call two `text_transform()`s and expect them to be later
  # executed in the correct order
  tbl_html <- gt(mtcars_short) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) {
        paste(x, "miles")
      }) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = function(x) {
        paste(x, "per gallon")
      })

  # Expect that all data values in the `mpg` column have 'mpg'
  # at the end
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    expect_match(".*miles per gallon$")

  # Extract the internal `transforms` attr
  transforms <- attr(tbl_html, "transforms", exact = TRUE)

  # Expect two components to be held within `transforms`
  transforms %>%
    length() %>%
    expect_equal(2)

  # Expect that each component of `transforms` has the names
  # `resolved` and `fn`
  transforms[[1]] %>%
    names() %>%
    expect_equal(c("resolved", "fn"))

  transforms[[2]] %>%
    names() %>%
    expect_equal(c("resolved", "fn"))

  # Expect that `resolved` subcomponent of `transforms` has the names
  # `columns` and `rows`
  transforms[[1]]$resolved %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  transforms[[2]]$resolved %>%
    names() %>%
    expect_equal(c("columns", "rows"))

  # Expect that `resolved` subcomponent of `transforms` has the class
  # names and `resolved`, `cells_data`, `location_cells`
  transforms[[1]]$resolved %>%
    expect_is(c("resolved", "cells_data", "location_cells"))

  transforms[[2]]$resolved %>%
    expect_is(c("resolved", "cells_data", "location_cells"))

  # Expect that `fn` subcomponent of `transforms` is a function
  transforms[[1]]$fn %>%
    expect_is("function")

  transforms[[2]]$fn %>%
    expect_is("function")

  # Define a function that converts vector of `x` to numeric
  # and rounds values to a specific multiple
  round_mult <- function(x, multiple = 0.25) {
    x <- as.numeric(x)
    format(multiple * round(x / multiple))
  }

  # Call `text_transform()` with the custom function `round_mult()`
  # as input to `fn`
  tbl_html <- gt(mtcars_short) %>%
    text_transform(
      locations = cells_data(columns = vars(mpg)),
      fn = round_mult)

  # Expect values rounded to the default `0.25` interval
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("tr td:first-child") %>%
    expect_match(".*\\.(00|25|50|75)$")
})
