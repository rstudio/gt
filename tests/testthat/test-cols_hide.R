# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_hide() and cols_unhide() do not error when no columns selected", {
  # when no columns selected, gt table return unaltered
  expect_no_error(gt(exibble) %>% cols_hide())
  expect_equal(
    gt(sp500),
    gt(sp500) %>% cols_hide(columns = starts_with("xxxxxxxxxxxx"))
  )

  expect_equal(
    gt(exibble),
    gt(exibble) %>% cols_unhide(columns = starts_with("xxxxxxxxxxxx"))
  )
  expect_snapshot(
    error = TRUE,
    gt(exibble) %>% cols_hide(problem)
  )
})

test_that("Columns can be hidden and then made visible", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `gt_tbl` object with the `gtcars` dataset
  gt_tbl <- gt(gtcars)

  # Expect all column names from the original dataset
  # to be present
  gt_tbl %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("mfr", "model", "trim", "bdy_style", "drivetrain", "trsmn", "ctry_origin"))

  # Hide the `mfr` and `drivetrain` columns from the
  # table with `cols_hide()`
  gt_tbl <-
    gt_tbl %>%
    cols_hide(c(mfr, drivetrain))

  # Expect the two hidden columns to not appear in the rendered table
  gt_tbl %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("model", "trim", "bdy_style", "trsmn", "ctry_origin"))

  # Make the `mfr` column visible again with `cols_unhide()`
  gt_tbl <-
    gt_tbl %>%
    cols_unhide(mfr)

  # Expect that only `drivetrain` is hidden now
  gt_tbl %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("mfr", "model", "trim", "bdy_style", "trsmn", "ctry_origin"))

  # Move the drivetrain column to the beginning of the column
  # series and unhide it
  gt_tbl <-
    gt_tbl %>%
    cols_move_to_start(drivetrain) %>%
    cols_unhide(drivetrain)

  # Expect all column names from the original dataset
  # to be present in the revised order
  gt_tbl %>%
    render_as_html() %>%
    xml2::read_html() %>%
    rvest::html_nodes("[class='gt_col_heading gt_columns_bottom_border gt_left']") %>%
    rvest::html_text() %>%
    expect_equal(c("drivetrain", "mfr", "model", "trim", "bdy_style", "trsmn", "ctry_origin"))
})
