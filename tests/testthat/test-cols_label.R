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
}

test_that("cols_label() correctly", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and label all
  # of the columns
  tbl_html <-
    gt(tbl) |>
    cols_label(
      col_1 = "col_a",
      col_2 = "col_b",
      col_3 = "col_c",
      col_4 = "col_d"
    )

  # Expect that the values for the column labels are set
  # correctly in `col_labels`
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Create a `tbl_html` object with `gt()` and label none
  # of the columns
  tbl_html <-
    gt(tbl) |>
    cols_label()

  # Expect the original column names for `tbl` as values for
  # the column keys and for the column labels
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    colnames(tbl)
  )

  expect_equal(
    unlist(tbl_html$`_boxhead`$var),
    colnames(tbl)
  )

  # Expect that the column labels are set as the column names
  expect_equal(
    tbl_html |>
      render_as_html() |>
      xml2::read_html() |>
      selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']"),
    c("col_1", "col_2", "col_3", "col_4")
  )

  # Create a `tbl_html` object with `gt()` and label all
  # of the columns using a named list passed to `.list`
  tbl_html <-
    gt(tbl) |>
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
  expect_equal(
    unlist(tbl_html$`_boxhead`$column_label),
    c("col_a", "col_b", "col_c", "col_d")
  )

  # Expect that the column labels are set
  tbl_html |>
    render_as_html() |>
    xml2::read_html() |>
    selection_text("[class='gt_col_heading gt_columns_bottom_border gt_right']") |>
    expect_equal(c("col_a", "col_b", "col_c", "col_d"))

  # Expect an error if any names are missing
  expect_error(gt(tbl) |> cols_label("col_a"))

  # Expect an error if any columns are not part of the original dataset
  expect_error(gt(tbl) |> cols_label(col_a = "col_1"))

  # Expect no partial matching issues with column names and arguments
  expect_no_error(
    dplyr::tribble(
      ~a , ~d,
      1, 4,
      5, 8
    ) |>
      gt() |>
      cols_label(
        a = "label a",
        d = "label d"
      )
  )
  expect_no_error(
    dplyr::tribble(
      ~a , ~dat,
      1, 4,
      5, 8
    ) |>
      gt() |>
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
    ) |>
      gt() |>
      cols_label(
        a = "label a",
        .dat = "label dat"
      )
  )
})

test_that("cols_label() works with md()", {

  tab <-
    gt(data.frame(x = 1, y = 2, z = 3)) |>
    cols_label(
      x = md("*x_1*"),
      y = md("Time Domain<br/>$\\small{f\\left( t \\right) = {\\mathcal{L}^{\\,\\, - 1}}\\left\\{ {F\\left( s \\right)} \\right\\}}$")
    )

  expect_equal(
    tab$`_boxhead`$column_label,
    list(
      structure("*x_1*", class = "from_markdown"),
      structure("Time Domain<br/>$\\small{f\\left( t \\right) = {\\mathcal{L}^{\\,\\, - 1}}\\left\\{ {F\\left( s \\right)} \\right\\}}$", class = "from_markdown"),
      "z"
    )
  )
})

test_that("check cols_label is applied gt_group", {

  # Create a `gt_group` object of two `gt_tbl`s
  # create gt group example
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply alignment to table and group
  label_gt_tbl <-
    gt_tbl |>
    cols_label(
      mpg = "Miles per gallon"
    )

  label_gt_group <-
    gt_group |>
    cols_label(
      mpg = "Miles per gallon"
    )

  # Expect identical if function applied before or after group is constructed
  expect_identical(label_gt_group, gt_group(label_gt_tbl, label_gt_tbl))
})
