context("LaTeX -- Ensuring that the creation of tab components works as expected")

# Create a shorter version of `mtcars`
mtcars_short <- mtcars[1:5, ]

test_that("a gt table contains the expected heading components", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a title
  tbl_latex <-
    gt(data = mtcars_short) %>%
    tab_header(title = "test title")

  # Expect a characteristic pattern
  # grepl(
  #   "\\caption*{\n\\large test title\\\\ \n} \\\\ \n\\toprule",
  #   tbl_latex %>% as_latex() %>% as.character(),
  #   fixed = TRUE
  # ) %>%
  #   expect_true()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_latex <-
    gt(data = mtcars_short) %>%
    tab_header(title = "test title", subtitle = "test subtitle")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.large .*.centering test title",
      ".*.small test subtitle",
      ".*"),
    tbl_latex %>% as_latex() %>% as.character()
  ) %>%
    expect_true()
})

test_that("a gt table contains the expected stubhead label", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a stub and a stubhead caption
  tbl_latex <-
    gt(data = mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead(label = "the mtcars")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*the mtcars & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})

test_that("a gt table contains the expected column spanner labels", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels
  tbl_latex <-
    gt(data = rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = c("peri", "shape"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*& .multicolumn\\{2\\}\\{c\\}\\{perimeter\\} & ",
      ".* .cmidrule\\(lr\\)\\{2-3\\}",
      ".*area & peri & shape & perm ",
      ".*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains the spanner heading `perimeter` over the
  # `peri` and `shape` column labels (this time, using
  # the `vars()` helper to define the columns)
  tbl_latex <-
    gt(data = rock) %>%
    tab_spanner(
      label = "perimeter",
      columns = vars(peri, shape))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*& .multicolumn\\{2\\}\\{c\\}\\{perimeter\\} & ",
      ".* .cmidrule\\(lr\\)\\{2-3\\}",
      ".*area & peri & shape & perm ",
      ".*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Expect an error when using column labels
  # that don't exist
  expect_error(
    gt(data = rock) %>%
      tab_spanner(
        label = "perimeter",
        columns = vars(peris, shapes))
  )
})

# test_that("a gt table contains the expected source note", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a source note
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981)."))

  # Expect a characteristic pattern
  # grepl(
  #   paste0(
  #     ".*begin\\{minipage\\}",
  #     ".*emph\\{Henderson and Velleman\\} \\(1981\\)\\.",
  #     ".*end\\{minipage\\}",
  #     ".*"),
  #   tbl_latex %>%
  #     as_latex() %>% as.character()) %>%
  #   expect_true()

  # Add another source note to the `gt_tbl` object
  # Create a `tbl_latex` object with `gt()`; this table
  # contains two source notes
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_source_note(
      source_note = md("*Henderson and Velleman* (1981).")) %>%
    tab_source_note(
      source_note = "This was in Motor Trend magazine, hence the `mt`.")

  # Expect a characteristic pattern
  # grepl(
  #   paste0(
  #     ".*begin\\{minipage\\}",
  #     ".*emph\\{Henderson and Velleman\\} \\(1981\\)\\.",
  #     ".*This was in Motor Trend magazine, hence the `mt`.",
  #     ".*end\\{minipage\\}",
  #     ".*"),
  #   tbl_latex %>%
  #     as_latex() %>% as.character()) %>%
  #   expect_true()
# })

test_that("a gt table contains the correct placement of row groups", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a row groups in a specified order
  tbl_latex <-
    mtcars %>%
    gt(rownames_to_stub = TRUE) %>%
    tab_row_group(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    )

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.toprule",
      ".*& mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*.midrule",
      ".*.multicolumn\\{12\\}\\{l\\}\\{Mazda\\}",
      ".*.midrule",
      ".*Mazda RX4 & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.620 & 16.46 & 0 & 1 & 4 & 4",
      ".*Mazda RX4 Wag & 21.0 & 6 & 160.0 & 110 & 3.90 & 2.875 & 17.02 & 0 & 1 & 4 & 4",
      ".*.midrule",
      ".*.multicolumn\\{12\\}\\{l\\}\\{.vspace\\*\\{-5mm\\}\\}",
      ".*.midrule",
      ".*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a three row groups and the use of `row_group_order()`
  # will specify a particular ordering
  tbl_latex <-
    gt(mtcars, rownames_to_stub = TRUE) %>%
    tab_row_group(
      group = "Mercs",
      rows = contains("Merc")
    ) %>%
    tab_row_group(
      group = "Mazda",
      rows = c("Mazda RX4", "Mazda RX4 Wag")
    ) %>%
    row_group_order(groups = c(NA, "Mazda", "Mercs"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*.toprule",
      ".*& mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*.midrule",
      ".*.multicolumn\\{12\\}\\{l\\}\\{.vspace\\*\\{-5mm\\}\\}",
      ".*.midrule",
      ".*.multicolumn\\{12\\}\\{l\\}\\{Mazda\\}",
      ".*.midrule",
      ".*.midrule",
      ".*.multicolumn\\{12\\}\\{l\\}\\{Mercs\\}",
      ".*.midrule",
      ".*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})
