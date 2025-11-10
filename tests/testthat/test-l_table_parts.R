test_that("A gt table contains the expected caption component", {

  # Create a `tbl_latex` object with `gt()`; this table contains a caption
  tbl_latex <-
    gt(mtcars_short) |>
    tab_caption("test caption") |>
    tab_options(latex.use_longtable = TRUE)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    "\\caption{test caption} \\\\ \n",
    fixed = TRUE
  )

  # Perform a snapshot test where a LaTeX table
  # contains only a caption
  expect_snapshot_latex(tbl_latex)
})

test_that("A gt table contains the expected heading components", {

  # Create a `tbl_latex` object with `gt()`; this table contains a title
  tbl_latex <-
    gt(mtcars_short) |>
    tab_header(title = "test title") |>
    tab_options(
      heading.title.font.size = "large",
      heading.subtitle.font.size = "small"
    )

  # Expect a characteristic pattern
  expect_match(
     as_latex(tbl_latex) |> as.character(),
    "\\caption*{\n{\\large  test title\\fontsize{12}{15}\\selectfont }\n} \n\\fontsize",
    fixed = TRUE
  )

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_latex <-
    gt(mtcars_short) |>
    tab_header(title = "test title", subtitle = "test subtitle") |>
    tab_options(
      heading.title.font.size = "large",
      heading.subtitle.font.size = "small"
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*.large  test title",
      ".*.small  test subtitle",
      ".*"
    )
  )

  # Perform a snapshot test where a LaTeX table
  # contains only a title
  gt_tbl_1 <- mtcars_short |>
    gt() |>
    tab_header(title = "test title") |>
    tab_options(latex.use_longtable = TRUE)

  expect_snapshot_latex(gt_tbl_1)

  # Perform a snapshot test where a LaTeX table
  # contains a title and a subtitle
  gt_tbl_2 <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "test subtitle") |>
    tab_options(latex.use_longtable = TRUE)

  expect_snapshot_latex(gt_tbl_2)

  # Expect that providing a subtitle value with an empty
  # string won't produce a subtitle line
  gt_tbl_3 <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "") |>
    tab_options(latex.use_longtable = TRUE)
  expect_snapshot_latex(gt_tbl_3)

  # Expect that providing a subtitle value with a series
  # a space characters also won't produce a subtitle line
  gt_tbl_4 <- mtcars_short |>
    gt() |>
    tab_header(title = "test title", subtitle = "   ") |>
    tab_options(latex.use_longtable = TRUE)

  expect_snapshot_latex(gt_tbl_4)
})

test_that("A gt table contains the expected stubhead label", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a stub and a stubhead caption
  tbl_latex <-
    gt(mtcars_short, rownames_to_stub = TRUE) |>
    tab_stubhead(label = "the mtcars") |>
    tab_options(latex.use_longtable = TRUE)

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*the mtcars & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*"
      )
  )
})

test_that("A gt table contains the expected column spanner labels", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_latex <-
    gt(rock) |>
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanner will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels (this time, using
  # `c()` to define the columns)
  tbl_latex <-
    gt(rock) |>
    tab_spanner(
      label = "perimeter",
      columns = c(peri, shape)
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanner will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Expect an error when using column labels that don't exist
  expect_error(
    gt(rock) |>
      tab_spanner(
        label = "perimeter",
        columns = c(peris, shapes)
      ) |>
      tab_options(latex.use_longtable = TRUE)
  )

  # Create a `tbl_latex` object where the first column doesn't have a
  # spanner but the two pairs of columns after that have a spanner each
  tbl_latex <-
    dplyr::tribble(
      ~v_1, ~v_2, ~v_3, ~v_4, ~v_5,
      20.4, 36.1, 34.2, 21.6, 23.1,
      25.8, 14.3, 13.7, 12.9, 75.9,
      16.3, 34.3, 15.1, 93.2, 12.1
    ) |>
    gt() |>
    tab_spanner(
      label = "v_1_2",
      columns =  c("v_1", "v_2")
    ) |>
    tab_spanner(
      label = "v_4_5",
      columns = c("v_4", "v_5")
    ) |>
    cols_move_to_start(columns = "v_3") |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanners will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Create a `tbl_latex` object that doesn't gather columns under their
  # respective spanner column labels; also, while the labels are all the same
  # the footnote (1) gets attached to the label in the first and third
  # positions
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) |>
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = FALSE) |>
    tab_spanner(label = "A", id = "z", columns = starts_with("B"), gather = FALSE) |>
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))  |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanners will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Create a `tbl_latex` object with spanners with different IDs
  # but the same label; the spanner with ID `y` gathers columns beginning
  # with "A", and, that spanner gets a footnote as well
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) |>
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = TRUE) |>
    tab_spanner(label = "A", id = "z", columns = starts_with("B")) |>
    tab_footnote(footnote = "note", locations = cells_column_spanners("y")) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanners will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Create a `tbl_latex` object that uses `tab_spanner_delim()`
  # on a subset of columns; the single spanner column label is
  # associated to the first two columns, all others have no spanners
  tbl_latex <-
    gt(iris[1, ]) |>
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the spanners will be correctly produced
  expect_snapshot_latex(tbl_latex)
})

test_that("A gt table contains the expected source note", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a source note
  tbl_latex <-
    gt(mtcars_short) |>
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the source note will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_latex` object with `gt()`; this table
  # contains two source notes
  tbl_latex <-
    gt(mtcars_short) |>
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    ) |>
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`."
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that both source notes will be correctly produced
  expect_snapshot_latex(tbl_latex)
})

test_that("A gt table contains the correct placement of row groups", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a row groups in a specified order
  tbl_latex <-
    mtcars |>
    gt(rownames_to_stub = TRUE) |>
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the row groups will be correctly produced
  expect_snapshot_latex(tbl_latex)

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_latex <-
    gt(mtcars, rownames_to_stub = TRUE) |>
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) |>
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) |>
    row_group_order(groups = c(NA, "Mazda", "Mercs")) |>
    tab_options(latex.use_longtable = TRUE)

  # Expect that the row groups will be correctly produced
  expect_snapshot_latex(tbl_latex)
})
