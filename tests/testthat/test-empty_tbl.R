empty_tbl <- dplyr::tibble()

empty_w_cols_tbl <-
  dplyr::tibble(char = character(0), num = double(0))

empty_w_rows_tbl <- dplyr::tibble(.rows = 5)

test_that("We can render empty gt tables with empty data frames", {

  # A completely empty table can be rendered in different output
  # formats without failing

  empty_tbl_html <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>% render_as_html()
    )

  empty_tbl_latex <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>% as_latex() %>% as.character()
    )

  empty_tbl_rtf <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>% as_rtf()
    )

  empty_tbl_word <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>% as_word()
    )

  # An empty table (having columns) can be rendered
  # in different output formats without failing

  empty_w_cols_tbl_html <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>% render_as_html()
    )

  empty_w_cols_tbl_latex <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>% as_latex() %>% as.character()
    )

  empty_w_cols_tbl_rtf <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>% as_rtf()
    )

  empty_w_cols_tbl_word <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>% as_word()
    )

  # An empty table (having some rows though) can be rendered
  # in different output formats without failing

  empty_w_rows_tbl_html <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>% render_as_html()
    )

  empty_w_rows_tbl_latex <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>% as_latex() %>% as.character()
    )

  empty_w_rows_tbl_rtf <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>% as_rtf()
    )

  empty_w_rows_tbl_word <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>% as_word()
    )
})

test_that("We can start from empty tables and sometimes add columns", {

  # Columns of arbitrary size can be added to a completely empty table
  empty_1_col <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        cols_add(a = 1:5)
    )

  empty_2_col <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        cols_add(a = 1:5, b = letters[1:5])
    )

  empty_2_col_no_row <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        cols_add(a = double(0), b = character(0))
    )

  # Columns of arbitrary size can be added to a zero-row, multicolumn table
  empty_2_col_add_1_more_col <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>%
        cols_add(a = 1:5)
    )

  empty_2_col_add_2_more_col <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>%
        cols_add(a = 1:5, b = letters[1:5])
    )

  # New zero-row columns can be added to a zero-row, multicolumn table
  empty_2_col_no_row_add_cols <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>%
        cols_add(a = double(0), b = character(0))
    )

  # Columns of arbitrary size can be added to a multirow, zero-column table
  # (same behavior as a completely empty table because gt will strip all
  # rows upon ingestion, leaving a zero-row/zero-column table)
  empty_w_rows_1_col <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        cols_add(a = 1:5)
    )

  empty_w_rows_2_col <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        cols_add(a = 1:5, b = letters[1:5])
    )

  empty_w_rows_2_col_no_row <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        cols_add(a = double(0), b = character(0))
    )
})

test_that("We can start from empty tables and sometimes add rows", {

  # Rows of arbitrary size can be added to a completely empty table
  empty_1_row <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        rows_add(a = 1, b = letters[2])
    )

  empty_2_row <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        rows_add(a = 1:2, b = letters[2])
    )

  empty_0_row <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        rows_add(a = double(0), b = character(0))
    )

  empty_2_empty_rows <-
    expect_error(
      regexp = NA,
      gt(empty_tbl) %>%
        rows_add(.n_empty = 2)
    )

  expect_equal(
    gt(empty_tbl),
    gt(empty_tbl) %>%
      rows_add(.n_empty = 2)
  )

  # Rows of arbitrary size can be added to a zero-row, multicolumn table
  empty_2_col_add_rows <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>%
        rows_add(char = letters[1:5], num = 3)
    )

  empty_2_col_add_empty_rows <-
    expect_error(
      regexp = NA,
      gt(empty_w_cols_tbl) %>%
        rows_add(.n_empty = 5)
    )

  # New empty rows cannot be added to a zero-row, multicolumn table
  expect_error(
    gt(empty_w_cols_tbl) %>%
      rows_add(a = double(0), b = character(0))
  )

  # Rows of arbitrary size can be added to a multirow, zero-column table
  # (same behavior as a completely empty table because gt will strip all
  # rows upon ingestion, leaving a zero-row/zero-column table)
  empty_w_rows_1_row <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        rows_add(a = 1, b = letters[2])
    )

  empty_w_rows_2_row <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        rows_add(a = 1:2, b = letters[2])
    )

  empty_w_rows_2_col_no_row <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        rows_add(a = double(0), b = character(0))
    )

  empty_w_rows_2_empty_rows <-
    expect_error(
      regexp = NA,
      gt(empty_w_rows_tbl) %>%
        rows_add(.n_empty = 2)
    )
})

test_that("We can use a combination of row/column adding on empty tables", {

  #
  # Completely empty table
  #

  # Adding rows to an empty table, then columns
  empty_a <-
    gt(empty_tbl) %>%
    rows_add(a = 1, b = letters[2]) %>%
    cols_add(char = "row") %>%
    cols_add(c = a * 5)

  empty_b <-
    gt(empty_tbl) %>%
    rows_add(a = 1:5, b = letters[1:5]) %>%
    cols_add(char = paste0(b, "Q")) %>%
    cols_add(c = a * 5)

  empty_c <-
    gt(empty_tbl) %>%
    rows_add(a = double(0), b = character(0)) %>%
    cols_add(char = character(0)) %>%
    rows_add(char = "a") %>%
    rows_add(a = 8) %>%
    rows_add(b = "c")

  # Adding columns to an empty table, then rows
  empty_d <-
    gt(empty_tbl) %>%
    cols_add(char = letters[1:5]) %>%
    rows_add(char = letters[6:10]) %>%
    rows_add(char = letters[11:15])

  empty_e <-
    gt(empty_tbl) %>%
    cols_add(char = letters[1:5], num = 1:5) %>%
    rows_add(char = letters[6:10], num = 6:10)

  expect_equal(
    gt(empty_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5),
    gt(empty_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(char = character(0), num = integer(0))
  )

  empty_f <-
    gt(empty_tbl) %>%
    cols_add(char = letters[1:5], num = 1:5) %>%
    rows_add(.n_empty = 5)

  #
  # An empty table (having columns)
  #

  # Adding rows to an empty table, then columns
  empty_w_cols_a <-
    gt(empty_w_cols_tbl) %>%
    rows_add(num = 1, char = letters[2]) %>%
    rows_add(char = "row") %>%
    cols_add(c = num * 5)

  empty_w_cols_b <-
    gt(empty_w_cols_tbl) %>%
    rows_add(num = 1:5, char = letters[1:5]) %>%
    cols_add(char_2 = paste0(char, "Q")) %>%
    cols_add(num_2 = num * 5)

  empty_w_cols_c <-
    gt(empty_w_cols_tbl) %>%
    rows_add(num = double(0), char = character(0)) %>%
    cols_add(char_2 = character(0)) %>%
    rows_add(num = 1, char = "a", char_2 = "b") %>%
    cols_add(char_3 = paste0(num, "Q")) %>%
    cols_add(d = num)

  # Adding columns to an empty table, then rows
  empty_w_cols_d <-
    gt(empty_w_cols_tbl) %>%
    cols_add(char_2 = letters[1:5], char_3 = LETTERS[1:5]) %>%
    rows_add(char = letters[6:10]) %>%
    rows_add(char = letters[11:15])

  empty_w_cols_e <-
    gt(empty_w_cols_tbl) %>%
    cols_add(char = letters[1:5], num = 1:5) %>%
    rows_add(char = letters[6:10], num = 6:10)

  expect_equal(
    gt(empty_w_cols_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5),
    gt(empty_w_cols_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(char = character(0), num = integer(0))
  )

  empty_w_cols_f <-
    gt(empty_w_cols_tbl) %>%
    cols_add(char = letters[1:5], num = 1:5) %>%
    rows_add(.n_empty = 5)

  #
  # An empty table (having rows)
  #

  # Adding rows to an empty table, then columns
  expect_equal(
    gt(empty_tbl) %>%
      rows_add(a = 1, b = letters[2]) %>%
      cols_add(char = "row") %>%
      cols_add(c = a * 5),
    gt(empty_w_rows_tbl) %>%
      rows_add(a = 1, b = letters[2]) %>%
      cols_add(char = "row") %>%
      cols_add(c = a * 5)
  )

  expect_equal(
    gt(empty_tbl) %>%
      rows_add(a = 1:5, b = letters[1:5]) %>%
      cols_add(char = paste0(b, "Q")) %>%
      cols_add(c = a * 5),
    gt(empty_w_rows_tbl) %>%
      rows_add(a = 1:5, b = letters[1:5]) %>%
      cols_add(char = paste0(b, "Q")) %>%
      cols_add(c = a * 5)
  )

  # Adding columns to an empty table, then rows

  expect_equal(
    gt(empty_tbl) %>%
      cols_add(char = letters[1:5]) %>%
      rows_add(char = letters[6:10]) %>%
      rows_add(char = letters[11:15]),
    gt(empty_w_rows_tbl) %>%
      cols_add(char = letters[1:5]) %>%
      rows_add(char = letters[6:10]) %>%
      rows_add(char = letters[11:15])
  )

  expect_equal(
    gt(empty_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(char = letters[6:10], num = 6:10),
    gt(empty_w_rows_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(char = letters[6:10], num = 6:10)
  )

  expect_equal(
    gt(empty_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(.n_empty = 5),
    gt(empty_w_rows_tbl) %>%
      cols_add(char = letters[1:5], num = 1:5) %>%
      rows_add(.n_empty = 5)
  )
})

test_that("Empty tables when rendered are locale aware", {

  # Expect that the 'Table has no data' text is rendered in
  # different languages according to locale
  expect_match(
    gt(empty_tbl) %>%
      render_as_html(),
    "Table has no data"
  )
  expect_match(
    gt(empty_tbl, locale = "en") %>%
      render_as_html(),
    "Table has no data"
  )
  expect_match(
    gt(empty_w_rows_tbl) %>%
      render_as_html(),
    "Table has no data"
  )
  expect_match(
    gt(empty_tbl, locale = "ak") %>%
      render_as_html(),
    "Table nya data"
  )
  expect_match(
    gt(empty_tbl, locale = "et") %>%
      render_as_html(),
    "Tabelis pole andmeid"
  )
  expect_match(
    gt(empty_tbl, locale = "rn") %>%
      render_as_html(),
    "Teyiburu ntibaho"
  )
  expect_match(
    gt(empty_tbl, locale = "su") %>%
      render_as_html(),
    "Tabel henteu na data"
  )
})
