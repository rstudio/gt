# Create a table with four columns of values
tbl <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,
    767.6,  928.1,  382.0,  674.5,
    403.3,  461.5,   15.1,  242.8,
    686.4,   54.1,  282.7,   56.3,
    662.6,  148.8,  984.6,  928.1,
    198.5,   65.1,  127.4,  219.3,
    132.1,  118.1,   91.2,  874.3,
    349.7,  307.1,  566.7,  542.9,
    63.7,   504.3,  152.0,  724.5,
    105.4,  729.8,  962.4,  336.4,
    924.2,  424.6,  740.8,  104.2
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
  skip_if_not_installed("xml2")
}

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {
  selection <- paste0("[", key, "]")
  rvest::html_attr(rvest::html_nodes(html, selection), key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {
  rvest::html_text(rvest::html_nodes(html, selection))
}

test_that("The function `cols_label()` works correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and label all
  # of the columns
  tbl_html <-
    gt(tbl) %>%
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b",
      col_3 = "col_c",
      col_4 = "col_d"
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  tbl_html %>%
    .$`_boxh` %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Expect that the column labels are set
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Create a `tbl_html` object with `gt()` and label none
  # of the columns
  tbl_html <-
    gt(tbl) %>%
    cols_label()

  # Expect the original column names for `tbl` as values for
  # the column keys and for the column labels
  tbl_html %>%
    .$`_boxh` %>%
    .$var %>%
    unlist() %>%
    expect_equal(colnames(tbl))

  tbl_html %>%
    .$`_boxh` %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(colnames(tbl))

  # Expect that the column labels are set as the column names
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_1", "col_2", "col_3", "col_4"))

  # Create a `tbl_html` object with `gt()` and label all
  # of the columns using a named list passed to `.list`
  tbl_html <-
    gt(tbl) %>%
    cols_label(
      .list = list(
        col_1 = "col_a",
        col_2 = "col_b",
        col_3 = "col_c",
        col_4 = "col_d"
      )
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  tbl_html %>%
    .$`_boxh` %>%
    .$column_label %>%
    unlist() %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Expect that the column labels are set
  tbl_html %>%
    render_as_html() %>%
    xml2::read_html() %>%
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") %>%
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Expect an error if any names are missing
  expect_error(gt(tbl) %>% cols_label("col_a"))

  # Expect an error if any columns are not part of the original dataset
  expect_error(gt(tbl) %>% cols_label(col_a = "col_1"))

  # Expect no partial matching issues with column names and arguments
  expect_error(
    regexp = NA,
    dplyr::tribble(
      ~a , ~d,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        d = "label d"
      )
  )
  expect_error(
    regexp = NA,
    dplyr::tribble(
      ~a , ~dat,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        dat = "label dat"
      )
  )

  # Do expect an error in the unlikely case that a column
  # name is close enough to `.data`
  expect_error(
    dplyr::tribble(
      ~a , ~.dat,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_label(
        a = "label a",
        .dat = "label dat"
      )
  )
})
