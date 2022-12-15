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

# Helper function to compare a contiguous set of HTML fragments with raw html
html_fragment_within <- function(raw_html, ...) {
  grepl(paste0("\\Q", c(...), "\\E", "[\\n\\s]*?", collapse = ""), raw_html, perl = TRUE)
}

test_that("The `cols_width()` function stores values correctly", {

  #
  # Using `tbl_1` which is a simple table (no stub or row groups)
  #

  expect_equal(
    gt(tbl) %>%
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        col_4 ~ px(400)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = paste0("col_", 1:4),
      column_width = paste0((1:4 * 100), "px")
    )
  )

  expect_equal(
    gt(tbl) %>%
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        everything() ~ px(400)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = paste0("col_", 1:4),
      column_width = paste0((1:4 * 100), "px")
    )
  )

  expect_equal(
    gt(tbl) %>%
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_4 ~ px(400)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = paste0("col_", 1:4),
      column_width = c("100px", "200px", "", "400px")
    )
  )

  expect_equal(
    gt(tbl) %>%
      cols_width(
        starts_with("col") ~ px(100)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = paste0("col_", 1:4),
      column_width = "100px"
    )
  )

  expect_equal(
    gt(tbl) %>%
      cols_width(
        everything() ~ px(100)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = paste0("col_", 1:4),
      column_width = "100px"
    )
  )

  #
  # Using `tbl_2` which has a column for a stub and for row groups
  #

  expect_equal(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_3 ~ px(300),
        everything() ~ px(400)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(paste0((1:4 * 100), "px"), "400px", "")
    )
  )

  expect_equal(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        col_1 ~ px(100),
        col_2 ~ px(200),
        col_4 ~ px(400),
        row ~ px(50)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c("100px", "200px", "", "400px", "50px", "")
    )
  )

  expect_equal(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        everything() ~ px(100)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(rep("100px", 5), "")
    )
  )

  expect_equal(
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      ) %>%
      .$`_boxhead` %>%
      dplyr::select(var, column_width) %>%
      dplyr::mutate(column_width = unlist(column_width)),
    dplyr::tibble(
      var = c(paste0("col_", 1:4), "row", "group"),
      column_width = c(rep("100px", 5), "")
    )
  )

  # Don't expect an error or a warning if a `group` column
  # is included in a `cols_width()` call
  expect_error(
    regexp = NA,
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      )
  )
  expect_warning(
    regexp = NA,
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
      cols_width(
        group ~ px(50),
        everything() ~ px(100)
      )
  )

  # Expect an error if a column provided is not
  # in the dataset
  expect_error(
    gt(tbl) %>%
      cols_width(
        col_10 ~ px(150),
        everything() ~ px(75)
      )
  )

  # Expect an error if no expressions given to `...`
  expect_error(gt(tbl) %>% cols_width())

  # Expect an error if an incorrect unit is present
  # in any vector element of CSS length values
  expect_error(
    validate_css_lengths(c("", "3", "3em", "3rem", "3dem"))
  )
})

test_that("The function `cols_width()` works correctly with a simple table", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and size
  # all columns to `100px`
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      col_3 ~ px(100),
      col_4 ~ px(100)
    )

  # Expect that the all column widths are set to `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px` and the remaining columns
  # to `70px`
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      everything() ~ px(70)
    )

  # Expect that the first two column widths are
  # set to `100px`, and the rest are `70px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:70px;\"/>",
      "<col style=\"width:70px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and make
  # every column variable width
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ "",
      col_2 ~ "",
      col_3 ~ "",
      col_4 ~ ""
    )

  # Expect that the all column widths are unset
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>",
      "<col/>",
      "<col/>",
      "<col/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and a
  # combination of different, allowable length
  # dimensions
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(100),
      col_2 ~ 200,
      col_3 ~ pct(20),
      col_4 ~ ""
    )

  # Expect that the first three column widths are
  # all set and the fourth is not
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:200px;\"/>",
      "<col style=\"width:20%;\"/>",
      "<col/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px`; the unset columns
  # will be variable widths
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(150),
      col_2 ~ px(150)
    )

  # Expect that the first two column widths are
  # set to `150px`, and the rest are blank (variable width)
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col/>",
      "<col/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `everything()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      everything() ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `starts_with()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      starts_with("col") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first column using the
  # `ends_with()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      ends_with("1") ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first column width is set to
  # `150px`, and the rest are `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `contains()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      contains("_") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `matches()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      matches("col_[0-9]") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first two columns with the
  # `one_of()` column select helper
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      one_of(c("col_1", "col_2")) ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first two column widths are set to
  # `150px`, and the rest are `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:150px;\"/>",
      "<col style=\"width:100px;\"/>",
      "<col style=\"width:100px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `175px` and the remaining columns
  # to `75px`; this uses multiple formulas with the first
  # column in the RHS (the expectation is that the first
  # formula will give the resultant width value)
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(175),
      col_1 ~ px(150),
      col_1 ~ px(125),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `175px`, and the rest are `75px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:175px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `150px` and the remaining columns
  # to `75px` in one call to `cols_width()`, and, make
  # a second call to `cols_width()` that sets the
  # first column to `250px`
  tbl_html <-
    gt(tbl) %>%
    cols_width(
      col_1 ~ px(150),
      everything() ~ px(75)
    ) %>%
    cols_width(
      col_1 ~ px(250),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `250px`, and the rest are `75px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:250px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "<col style=\"width:75px;\"/>",
      "</colgroup>"
    ) %>%
    expect_true()

  # Expect no partial matching issues with column names and arguments
  expect_error(
    regexp = NA,
    dplyr::tribble(
      ~a , ~d,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_width(
        a ~ px(100),
        d ~ px(125)
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
      cols_width(
        a ~ px(100),
        dat ~ px(125)
      )
  )

  # Don't expect an error even in the unlikely case that a column
  # name is close enough to `.data` (this is due to the use of the
  # formula syntax)
  expect_error(
    regexp = NA,
    dplyr::tribble(
      ~a , ~.dat,
      1, 4,
      5, 8
    ) %>%
      gt() %>%
      cols_width(
        a ~ px(100),
        .dat ~ px(125)
      )
  )
})

test_that("The function `cols_width()` works correctly with a complex table", {

  # Check that specific suggested packages are available
  check_suggests()

  # Create a `tbl_html` object with `gt()` and size
  # all columns to `100px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      everything() ~ px(100)
    )

  # Expect that the all column widths are set to `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px` and the remaining columns
  # to `70px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ px(100),
      col_2 ~ px(100),
      everything() ~ px(70)
    )

  # Expect that the first two column widths are
  # set to `100px`, and the rest are `70px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:70px;\"/>",  # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:70px;\"/>",  # `col_3`
      "<col style=\"width:70px;\"/>",  # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and make
  # every column variable width
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ "",
      col_2 ~ "",
      col_3 ~ "",
      col_4 ~ "",
      row ~ ""
    )

  # Expect that the all column widths are unset
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>", # stub column (`row`)
      "<col/>", # `col_1`
      "<col/>", # `col_2`
      "<col/>", # `col_3`
      "<col/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and a
  # combination of different, allowable length
  # dimensions
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ px(100),
      col_2 ~ 200,
      col_3 ~ pct(20),
      col_4 ~ "",
      row ~ "300px"
    )

  # Expect that the first three column widths are
  # all set and the fourth is not
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:300px;\"/>", # stub column (`row`)
      "<col style=\"width:100px;\"/>", # `col_1`
      "<col style=\"width:200px;\"/>", # `col_2`
      "<col style=\"width:20%;\"/>",   # `col_3`
      "<col/>",                        # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first two columns to `100px`; the unset columns
  # will be variable widths
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ px(150),
      col_2 ~ px(150)
    )

  # Expect that the first two column widths are
  # set to `150px`, and the rest are blank (variable width)
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col/>",                        # `col_3`
      "<col/>",                        # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()


  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all body columns with the
  # `starts_with()` column select helper; the `group`
  # column is targeted with an extremely large width
  # but, in the end, it's excluded from consideration
  # (with no error or warning)
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      starts_with("col") ~ px(150),
      group ~ px(5000)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first column using the
  # `ends_with()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      ends_with("1") ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first column width is set to
  # `150px`, and the rest are `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:100px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `contains()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      contains("_") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to all columns with the
  # `matches()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      matches("col_[0-9]") ~ px(150)
    )

  # Expect that the all column widths are set to `150px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col/>",                        # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:150px;\"/>", # `col_3`
      "<col style=\"width:150px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and assign
  # a width of `150px` to the first two columns with the
  # `one_of()` column select helper
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      one_of(c("col_1", "col_2")) ~ px(150),
      everything() ~ px(100)
    )

  # Expect that the first two column widths are set to
  # `150px`, and the rest are `100px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:100px;\"/>", # stub column (`row`)
      "<col style=\"width:150px;\"/>", # `col_1`
      "<col style=\"width:150px;\"/>", # `col_2`
      "<col style=\"width:100px;\"/>", # `col_3`
      "<col style=\"width:100px;\"/>", # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `175px` and the remaining columns
  # to `75px`; this uses multiple formulas with the first
  # column in the RHS (the expectation is that the first
  # formula will give the resultant width value)
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ px(175),
      col_1 ~ px(150),
      col_1 ~ px(125),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `175px`, and the rest are `75px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:75px;\"/>",  # stub column (`row`)
      "<col style=\"width:175px;\"/>", # `col_1`
      "<col style=\"width:75px;\"/>",  # `col_2`
      "<col style=\"width:75px;\"/>",  # `col_3`
      "<col style=\"width:75px;\"/>",  # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()

  # Create a `tbl_html` object with `gt()` and size the
  # first column to `150px` and the remaining columns
  # to `75px` in one call to `cols_width()`, and, make
  # a second call to `cols_width()` that sets the
  # first column to `250px`
  tbl_html <-
    gt(tbl_2, rowname_col = "row", groupname_col = "group") %>%
    cols_width(
      col_1 ~ px(150),
      everything() ~ px(75)
    ) %>%
    cols_width(
      col_1 ~ px(250),
      everything() ~ px(75)
    )

  # Expect that the first column width is set to
  # `250px`, and the rest are `75px`
  tbl_html %>% render_as_html() %>%
    html_fragment_within(
      "<colgroup>",
      "<col style=\"width:75px;\"/>",  # stub column (`row`)
      "<col style=\"width:250px;\"/>", # `col_1`
      "<col style=\"width:75px;\"/>",  # `col_2`
      "<col style=\"width:75px;\"/>",  # `col_3`
      "<col style=\"width:75px;\"/>",  # `col_4`
      "</colgroup>"
    ) %>%
    expect_true()
})
