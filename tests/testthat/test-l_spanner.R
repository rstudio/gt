# tab_spanner_delim() LaTeX ----------------------------------------------------
test_that("tab_spanner_delim() works correctly", {

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels
  tbl_latex <-
    gt(iris_short) %>%
    tab_spanner_delim(delim = ".")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\}.*multicolumn\\{2\\}\\{c\\}\\{Petal\\}",
      ".*cmidrule\\(lr\\)\\{1-2\\}.*cmidrule\\(lr\\)\\{3-4\\}",
      ".*Length & Width & Length & Width & Species.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_latex <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\} &  &  &  .*",
      ".cmidrule\\(lr\\)\\{1-2\\}.*",
      "Length & Width & Petal.Length & Petal.Width & Species.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width`
  # columns using `c()`
  tbl_latex <-
    gt(iris_short) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c(Sepal.Length, Sepal.Width)
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\} &  &  &  .*",
      ".cmidrule\\(lr\\)\\{1-2\\}.*",
      "Length & Width & Petal.Length & Petal.Width & Species.*"
    )
  )
})

test_that("A gt table contains the expected column spanner labels", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_latex <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")
    )

  # Expect that the spanner will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels (this time, using
  # `c()` to define the columns)
  tbl_latex <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c(peri, shape)
    )

  # Expect that the spanner will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Expect an error when using column labels that don't exist
  expect_error(
    gt(rock) %>%
      tab_spanner(
        label = "perimeter",
        columns = c(peris, shapes)
      )
  )

  # Create a `tbl_latex` object where the first column doesn't have a
  # spanner but the two pairs of columns after that have a spanner each
  tbl_latex <-
    dplyr::tribble(
      ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
      20.4, 36.1, 34.2, 21.6, 23.1,
      25.8, 14.3, 13.7, 12.9, 75.9,
      16.3, 34.3, 15.1, 93.2, 12.1
    ) %>%
    gt() %>%
    tab_spanner(
      label = "v_1_2",
      columns =  c("v_1", "v_2")
    ) %>%
    tab_spanner(
      label = "v_4_5",
      columns = c("v_4", "v_5")
    ) %>%
    cols_move_to_start(columns = "v_3")

  # Expect that the spanners will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Create a `tbl_latex` object that doesn't gather columns under their
  # respective spanner column labels; also, while the labels are all the same
  # the footnote (1) gets attached to the label in the first and third
  # positions
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B"), gather = FALSE) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect that the spanners will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Create a `tbl_latex` object with spanners with different IDs
  # but the same label; the spanner with ID `y` gathers columns beginning
  # with "A", and, that spanner gets a footnote as well
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = TRUE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B")) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect that the spanners will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Create a `tbl_latex` object that uses `tab_spanner_delim()`
  # on a subset of columns; the single spanner column label is
  # associated to the first two columns, all others have no spanners
  tbl_latex <-
    gt(iris[1, ]) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect that the spanners will be correctly produced
  tbl_latex %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()
})
