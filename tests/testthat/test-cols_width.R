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
      63.7,  504.3,  152.0,  724.5,
     105.4,  729.8,  962.4,  336.4,
     924.2,  424.6,  740.8,  104.2,
  )

# Create a second table with four columns of values and
# columns for row identifiers and row groupings
tbl_2 <-
  dplyr::tribble(
    ~col_1, ~col_2, ~col_3, ~col_4,    ~row,       ~group,
     767.6,  928.1,  382.0,  674.5,   "one", "first_five",
     403.3,  461.5,   15.1,  242.8,   "two", "first_five",
     686.4,   54.1,  282.7,   56.3, "three", "first_five",
     662.6,  148.8,  984.6,  928.1,  "four", "first_five",
     198.5,   65.1,  127.4,  219.3,  "five", "first_five",
     132.1,  118.1,   91.2,  874.3,   "six", "2nd_five",
     349.7,  307.1,  566.7,  542.9, "seven", "2nd_five",
      63.7,  504.3,  152.0,  724.5, "eight", "2nd_five",
     105.4,  729.8,  962.4,  336.4,  "nine", "2nd_five",
     924.2,  424.6,  740.8,  104.2,   "ten", "2nd_five"
  )

# Function to skip tests if Suggested packages not available on system
check_suggests <- function() {
  skip_if_not_installed("rvest")
}

test_that("cols_width() stores values correctly", {

  #
  # Using `tbl_1` which is a simple table (no stub or row groups)
  #

  expect_equal(
    (
      gt(tbl) |>
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        col_4 ~ px(400)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = paste0("col_", 1:4),
      column_width = paste0((1:4 * 100), "px")
    )
  )

  expect_equal(
    (
      gt(tbl) |>
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        everything() ~ px(400)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = paste0("col_", 1:4),
      column_width = paste0((1:4 * 100), "px")
    )
  )

  expect_equal(
    (
      gt(tbl) |>
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_4 ~ px(400)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = paste0("col_", 1:4),
      column_width = c("100px", "200px", "", "400px")
    )
  )

  expect_equal(
    (
      gt(tbl) |>
      cols_width(
        starts_with("col") ~ px(100)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = paste0("col_", 1:4),
      column_width = "100px"
    )
  )

  expect_equal(
    (
      gt(tbl) |>
      cols_width(
        everything() ~ px(100)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = paste0("col_", 1:4),
      column_width = "100px"
    )
  )

  #
  # Using `tbl_2` which has a column for a stub and for row groups
  #

  expect_equal(
    (
      gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        everything() ~ px(400)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(paste0((1:4 * 100), "px"), "400px", "400px")
    )
  )

  expect_equal(
    (
      gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_4 ~ px(400),
        row ~ px(50)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c("100px", "200px", "", "400px", "50px", "")
    )
  )

  expect_equal(
    (
      gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        everything() ~ px(100)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = rep("100px", 6)
    )
  )

  expect_equal(
    (
      gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(rep("100px", 5), "50px")
    )
  )

  expect_equal(
    (
      gt(
        tbl_2,
        rowname_col = "row",
        groupname_col = "group",
        row_group_as_column = TRUE
      ) |>
      cols_width(
        group ~ px(20),
        everything() ~ px(100)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(rep("100px", 5), "20px")
    )
  )

  expect_equal(
    (
      gt(
        tbl_2,
        groupname_col = "group",
        row_group_as_column = TRUE
      ) |>
      cols_width(
        group ~ px(10),
        row ~ px(30)
      )
    )$`_boxhead` |>
      dplyr::select(var, column_width) |>
      dplyr::mutate(column_width = unlist(column_width)),
    vctrs::data_frame(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(rep("", 4), "30px", "10px")
    )
  )

  # Don't expect an error or a warning if a `group` column
  # is included in a `cols_width()` call
  expect_no_error(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      )
  )
  expect_no_warning(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      )
  )

  # Expect an error if a column provided is not in the dataset
  expect_error(
    gt(tbl) |>
      cols_width(
        col_10 ~ px(150),
        everything() ~ px(75)
      )
  )

  # Expect an error if no expressions given to `...`
  expect_error(gt(tbl) |> cols_width())

  # Expect an error if an incorrect unit is present
  # in any vector element of CSS length values
  expect_error(
    validate_css_lengths(c("", "3", "3em", "3rem", "3dem"))
  )
})

test_that("cols_width() works correctly with a simple table", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and size
  # all columns to `100px`
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      col_3 ~ px(100),
      col_4 ~ px(100)
    )

  # Expect that the all column widths are set to `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px` and the remaining columns
  # to `70px`
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      everything() ~ px(70)
    )

  # Expect that the first two column widths are
  # set to `100px`, and the rest are `70px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:70px;\"/>",
      "<col style=\"width:70px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and make
  # every column variable width
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ "",
      col_2 ~ "",
      col_3 ~ "",
      col_4 ~ ""
    )

  # Expect that the all column widths are unset
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>",
      "<col/>",
      "<col/>",
      "<col/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and a
  # combination of different, allowable length
  # dimensions
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(100),
      col_2 ~ 200,
      col_3 ~ pct(20),
      col_4 ~ ""
    )

  # Expect that the first three column widths are
  # all set and the fourth is not
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:200px;\"/>",
      "<col style=\"width:20%;\"/>",
      "<col/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px`; the unset columns
  # will be variable widths
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(150),
      col_2 ~ px(150)
    )

  # Expect that the first two column widths are
  # set to `150px`, and the rest are blank (variable width)
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col/>",
      "<col/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `everything()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      everything() ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `starts_with()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      starts_with("col") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first column using the
  # `ends_with()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      ends_with("1") ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first column width is set to
  # `150px`, and the rest are `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `contains()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      contains("_") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `matches()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      matches("col_[0-9]") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first two columns with the
  # `one_of()` column select helper
  tbl_html <-
    gt(tbl) |>
    cols_width(
      one_of(c("col_1", "col_2")) ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first two column widths are set to
  # `150px`, and the rest are `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `175px` and the remaining columns
  # to `75px`; this uses multiple formulas with the first
  # column in the RHS (the expectation is that the first
  # formula will give the resultant width value)
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(175),
      col_1 ~ px(150),
      col_1 ~ px(125),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `175px`, and the rest are `75px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:175px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `150px` and the remaining columns
  # to `75px` in one call to `cols_width()`, and, make
  # a second call to `cols_width()` that sets the
  # first column to `250px`
  tbl_html <-
    gt(tbl) |>
    cols_width(
      col_1 ~ px(150),
      everything() ~ px(75)
    ) |>
    cols_width(
      col_1 ~ px(250),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `250px`, and the rest are `75px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:250px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "</colgroup>"
    ) |>
    expect_true()

  # Expect no partial matching issues with column names and arguments
  expect_no_error(
    dplyr::tribble(
      ~a , ~d,
      1, 4,
      5, 8
    ) |>
      gt() |>
      cols_width(
        a ~ px(100),
        d ~ px(125)
      )
  )
  expect_no_error(
    dplyr::tribble(
      ~a , ~dat,
      1, 4,
      5, 8
    ) |>
      gt() |>
      cols_width(
        a ~ px(100),
        dat ~ px(125)
      )
  )

  # Don't expect an error even in the unlikely case that a column
  # name is close enough to `.data` (this is due to the use of the
  # formula syntax)
  expect_no_error(
    dplyr::tribble(
      ~a , ~.dat,
      1, 4,
      5, 8
    ) |>
      gt() |>
      cols_width(
        a ~ px(100),
        .dat ~ px(125)
      )
  )
})

test_that("cols_width() works correctly with a complex table", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and size
  # all columns to `100px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      everything() ~ px(100)
    )

  # Expect that the all column widths are set to `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px` and the remaining columns
  # to `70px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      everything() ~ px(70)
    )

  # Expect that the first two column widths are
  # set to `100px`, and the rest are `70px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:70px;\"/>",  # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:70px;\"/>",  # `col_3`
      "<col style=\"width:70px;\"/>",  # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and make
  # every column variable width
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ "",
      col_2 ~ "",
      col_3 ~ "",
      col_4 ~ "",
      row ~ ""
    )

  # Expect that the all column widths are unset
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>", # stub column (`row`)
      "<col/>", # `col_1`
      "<col/>", # `col_2`
      "<col/>", # `col_3`
      "<col/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and a
  # combination of different, allowable length
  # dimensions
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ px(100),
      col_2 ~ 200,
      col_3 ~ pct(20),
      col_4 ~ "",
      row ~ "300px"
    )

  # Expect that the first three column widths are
  # all set and the fourth is not
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:300px;\"/>", # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:200px;\"/>", # `col_2`
      "<col style=\"width:20%;\"/>",   # `col_3`
      "<col/>",                        # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px`; the unset columns
  # will be variable widths
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ px(150),
      col_2 ~ px(150)
    )

  # Expect that the first two column widths are
  # set to `150px`, and the rest are blank (variable width)
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col/>",                        # `col_3`
      "<col/>",                        # `col_4`
      "</colgroup>"
    ) |>
    expect_true()


  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all body columns with the
  # `starts_with()` column select helper; the `group`
  # column is targeted with an extremely large width
  # but, in the end, it's excluded from consideration
  # (with no error or warning)
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      starts_with("col") ~ px(150),
      group ~ px(5000)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first column using the
  # `ends_with()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      ends_with("1") ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first column width is set to
  # `150px`, and the rest are `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `contains()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      contains("_") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `matches()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      matches("col_[0-9]") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first two columns with the
  # `one_of()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      one_of(c("col_1", "col_2")) ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first two column widths are set to
  # `150px`, and the rest are `100px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `175px` and the remaining columns
  # to `75px`; this uses multiple formulas with the first
  # column in the RHS (the expectation is that the first
  # formula will give the resultant width value)
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ px(175),
      col_1 ~ px(150),
      col_1 ~ px(125),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `175px`, and the rest are `75px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:75px;\"/>",  # stub column (`row`)
      "<col style=\"width:175px;\"/>", # `col_1`
      "<col style=\"width:75px;\"/>",  # `col_2`
      "<col style=\"width:75px;\"/>",  # `col_3`
      "<col style=\"width:75px;\"/>",  # `col_4`
      "</colgroup>"
    ) |>
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `150px` and the remaining columns
  # to `75px` in one call to `cols_width()`, and, make
  # a second call to `cols_width()` that sets the
  # first column to `250px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") |>
    cols_width(
      col_1 ~ px(150),
      everything() ~ px(75)
    ) |>
    cols_width(
      col_1 ~ px(250),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `250px`, and the rest are `75px`
  tbl_html |>
    render_as_html() |>
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:75px;\"/>",  # stub column (`row`)
      "<col style=\"width:250px;\"/>", # `col_1`
      "<col style=\"width:75px;\"/>",  # `col_2`
      "<col style=\"width:75px;\"/>",  # `col_3`
      "<col style=\"width:75px;\"/>",  # `col_4`
      "</colgroup>"
    ) |>
    expect_true()
})

test_that("cols_width() correctly specifies LaTeX table when column widths are specified by user as percentages", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_latex` object with `gt()` and size
  # all columns in percentages
  tbl_latex <-
    gt(tbl) |>
    cols_width(
      col_1 ~ pct(50),
      col_2 ~ pct(30),
      col_3 ~ pct(20),
      col_4 ~ pct(10)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  pct_string <- function(x, unit = '\\\\linewidth') {

    prefix <- '>\\{\\\\(raggedright|raggedleft|centering)\\\\arraybackslash\\}'

    sprintf(
      '%sp\\{\\\\dimexpr %.2f%s -2\\\\tabcolsep-1.5\\\\arrayrulewidth\\}',
      prefix,
      x,
      #format(x, scientific = FALSE, trim = TRUE),
      unit
    )

  }

  build_longtable_regex <- function(...) {

    paste0(
      c(
        "\\\\begin\\{longtable\\}\\{",
        "(@\\{\\\\extracolsep\\{\\\\fill\\}\\})*",
        c(...),
        "\\}\\n"
      ),
      collapse = ""
    )

  }

  latex_col_regex <-
    paste0(
      c(
        "\\\\begin\\{longtable\\}\\{",
        "(@\\{\\\\extracolsep\\{\\\\fill\\}\\})*",
        # '>\\{\\\\ragged[[:alpha:]]+\\\\arraybackslash'
       sprintf(">\\{\\\\(raggedright|raggedleft|centering)\\\\arraybackslash\\}p\\{\\\\dimexpr 0\\.%d\\\\linewidth -2\\\\tabcolsep-1.5\\\\arrayrulewidth}",
               c(50L, 30L, 20L, 10L)),
        "\\}\\n"
      ),
      collapse = ""
    )

  # Expect that all column widths are expressed as percentage of \linewidth
  longtable_s <- build_longtable_regex(
    pct_string(c(0.5, 0.3, 0.2, 0.1))
  )
  expect_match(as_latex(tbl_latex), longtable_s)


  # Check that LaTeX is correctly generated when only some
  # column widths are specified as percentages
  tbl_latex_partial <-
    gt(tbl) |>
    cols_width(
      col_1 ~ pct(30),
      col_3 ~ pct(20)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  c(
    pct_string(0.3),
    'r',
    pct_string(0.2),
    'r'
  ) |>
    build_longtable_regex() |>
    grepl(as_latex(tbl_latex_partial)) |>
    expect_true()

  # Check that LaTeX longtable command is correctly generated
  # when table_width is specified by the user as a percentage
  tbl_latex_tw_pct <-
    tbl_latex |>
    tab_options(table.width = pct(70))

  (0.7 * c(0.5, 0.3, 0.2, 0.1)) |>
    pct_string() |>
    build_longtable_regex() |>
    grepl(as_latex(tbl_latex_tw_pct)) |>
    expect_true()

  # Check that LaTeX longtable command is correctly generated
  # when table width is specified by user in pixels
  tbl_latex_tw_px <-
    tbl_latex |>
    tab_options(table.width = "400px")

  (400 * 0.75 * c(0.5, 0.3, 0.2, 0.1)) |>
    pct_string(unit = "pt") |>
    build_longtable_regex() |>
    grepl(as_latex(tbl_latex_tw_px))


})

test_that("column widths are accurately reflected in Latex multicolumn statements", {

  set.seed(1234)

  tbl_random1 <-
    data.frame(
      x = c("a", "b", "c", "d", "e"),
      y = runif(5),
      z = runif(5),
      m = runif(5),
      n = runif(5),
      w = runif(5)
    )

  gt_tbl <-
    gt(
      tbl_random1,
      rowname_col = "x",
      row_group_as_column = FALSE
    ) |>
    fmt_number(decimals = 3) |>
    tab_row_group(
      label = "Only row group label",
      rows = 1:2
    ) |>
    cols_width(everything() ~ "2cm") |>
    tab_spanner(
      label = "Spanner with a long title that should be wrapped",
      columns = c("y", "z")
    ) |>
    tab_spanner(
      label = "Spanner2",
      columns = c("n", "w")
    ) |>
    tab_spanner(
      label = "Another long spanner that needs to wrap even more than the other",
      columns = c("z", "m")
    ) |>
    summary_rows(fns = list("mean"))

  expect_snapshot(as_latex(gt_tbl))
})

test_that("check cols_width is applied gt_group", {

  # Create a `gt_group` object with two `gt_tbl` objects
  gt_tbl <- gt(mtcars_short)
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # apply width to table and group
  width_gt_tbl <-
    gt_tbl |>
    cols_width(mpg ~ px(150))

  width_gt_group <-
    gt_group |>
    cols_width(mpg ~ px(150))

  # Expect identical if function applied before or after group is constructed
  expect_identical(width_gt_group, gt_group(width_gt_tbl, width_gt_tbl))
})
