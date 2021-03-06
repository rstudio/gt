context("LaTeX -- Ensuring that the creation of tab components works as expected")

testthat::local_edition(3)

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

test_that("a gt table contains the expected heading components", {

  # Create a `tbl_latex` object with `gt()`; this table contains a title
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_header(title = "test title")

  # Expect a characteristic pattern
  grepl(
    "\\caption*{\n{\\large test title}\n} \\\\ \n\\toprule",
    tbl_latex %>% as_latex() %>% as.character(),
    fixed = TRUE
  ) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_header(title = "test title", subtitle = "test subtitle")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.large test title",
      ".*.small test subtitle",
      ".*"
    ),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Perform a snapshot test where a LaTeX table
  # contains only a title
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title") %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Perform a snapshot test where a LaTeX table
  # contains a title and a subtitle
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "test subtitle") %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Expect that providing a subtitle value with an empty
  # string won't produce a subtitle line
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "") %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()

  # Expect that providing a subtitle value with a series
  # a space characters also won't produce a subtitle line
  mtcars_short %>%
    gt() %>%
    tab_header(title = "test title", subtitle = "   ") %>%
    as_latex() %>%
    as.character() %>%
    expect_snapshot()
})

test_that("a gt table contains the expected stubhead label", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a stub and a stubhead caption
  tbl_latex <-
    gt(mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead(label = "the mtcars")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*the mtcars & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()
})

test_that("a gt table contains the expected column spanner labels", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_latex <-
    gt(rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*& .multicolumn\\{2\\}\\{c\\}\\{perimeter\\} & ",
      ".* .cmidrule\\(lr\\)\\{2-3\\}",
      ".*area & peri & shape & perm ",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

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

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*& .multicolumn\\{2\\}\\{c\\}\\{perimeter\\} & ",
      ".* .cmidrule\\(lr\\)\\{2-3\\}",
      ".*area & peri & shape & perm ",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Expect an error when using column labels
  # that don't exist
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

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*& .multicolumn\\{2\\}\\{c\\}\\{v._1._2\\} & .multicolumn\\{2\\}\\{c\\}\\{v._4._5\\}.*",
      ".cmidrule\\(lr\\)\\{2-3\\} .cmidrule\\(lr\\)\\{4-5\\}.*",
      "v._3 & v._1 & v._2 & v._4 & v._5.*"
    ),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_latex` object that doesn't gather columns under their
  # respective spanner column labels; also, while the labels are all the same
  # the footnote (1) gets attached to the label in the first and third
  # positions
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = FALSE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B"), gather = FALSE) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      "A.textsuperscript\\{1\\} & A & A.textsuperscript\\{1\\} & A.*",
      ".cmidrule\\(lr\\)\\{1-1\\} .cmidrule\\(lr\\)\\{2-2\\}.*",
      ".cmidrule\\(lr\\)\\{3-3\\} .cmidrule\\(lr\\)\\{4-4\\}.*",
      "A\\\\_X & B\\\\_X & A\\\\_Y & B\\\\_Y.*",
      "1 & 2 & 3 & 4.*"
    ),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_latex` object with spanners with different IDs
  # but the same label; the spanner with ID `y` gathers columns beginning
  # with "A", and, that spanner gets a footnote as well
  tbl_latex <-
    gt(dplyr::tibble(A_X = c(1), B_X = c(2), A_Y = c(3), B_Y = c(4))) %>%
    tab_spanner(label = "A", id = "y", columns = starts_with("A"), gather = TRUE) %>%
    tab_spanner(label = "A", id = "z", columns = starts_with("B")) %>%
    tab_footnote(footnote = "note", locations = cells_column_spanners("y"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".multicolumn\\{2\\}\\{c\\}\\{A.textsuperscript\\{1\\}\\} &.*",
      ".multicolumn\\{2\\}\\{c\\}\\{A}.*",
      ".cmidrule\\(lr\\)\\{1-2\\} .cmidrule\\(lr\\)\\{3-4\\}.*",
      "A\\\\_X & A\\\\_Y & B\\\\_X & B\\\\_Y.*",
      "1 & 3 & 2 & 4.*"
    ),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_latex` object that uses `tab_spanner_delim()`
  # on a subset of columns; the single spanner column label is
  # associated to the first two columns, all others have no spanners
  tbl_latex <-
    gt(iris[1, ]) %>%
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".multicolumn\\{2\\}\\{c\\}\\{Sepal\\}.*",
      ".cmidrule\\(lr\\)\\{1-2\\}.*",
      "Length & Width & Petal.Length & Petal.Width & Species.*"
    ),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()
})

# test_that("a gt table contains the expected source note", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a source note
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*begin\\{minipage\\}",
      ".*emph\\{Henderson and Velleman\\} \\(1981\\)\\.",
      ".*end\\{minipage\\}",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_latex` object with `gt()`; this table
  # contains two source notes
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")
    ) %>%
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`."
    )

  # Expect a characteristic pattern
  # grepl(
  #   paste0(
  #     ".*begin\\{minipage\\}",
  #     ".*emph\\{Henderson and Velleman\\} \\(1981\\)\\.",
  #     ".*This was in Motor Trend magazine, hence the `mt`.",
  #     ".*end\\{minipage\\}",
  #     ".*"),
  #   tbl_latex %>% as_latex() %>% as.character()
  # ) %>%
  #   expect_true()
# })

test_that("a gt table contains the correct placement of row groups", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a row groups in a specified order
  tbl_latex <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.toprule",
      ".*& mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*.midrule",
      ".*.multicolumn\\{1\\}\\{l\\}\\{Mazda\\}",
      ".*.midrule",
      ".*Mazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4",
      ".*Mazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4",
      ".*.midrule",
      ".*.multicolumn\\{1\\}\\{l\\}\\{.vspace\\*\\{-5mm\\}\\}",
      ".*.midrule",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_latex <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_row_group(
      label = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      label = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    row_group_order(groups = c(NA, "Mazda", "Mercs"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.toprule",
      ".*& mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*.midrule",
      ".*.multicolumn\\{1\\}\\{l\\}\\{.vspace\\*\\{-5mm\\}\\}",
      ".*.midrule",
      ".*.multicolumn\\{1\\}\\{l\\}\\{Mazda\\}",
      ".*.midrule",
      ".*.midrule",
      ".*.multicolumn\\{1\\}\\{l\\}\\{Mercs\\}",
      ".*.midrule",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()
})
