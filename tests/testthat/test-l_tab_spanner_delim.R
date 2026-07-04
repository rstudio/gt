test_that("tab_spanner_delim() works correctly for LaTeX output tables", {

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels
  tbl_latex <-
    gt(iris_short) |>
    tab_spanner_delim(delim = ".")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{\\{Sepal\\}\\}.*multicolumn\\{2\\}\\{c\\}\\{\\{Petal\\}\\}",
      ".*cmidrule\\(lr\\)\\{1-2\\}.*cmidrule\\(lr\\)\\{3-4\\}",
      ".*Length & Width & Length & Width & Species.*"
      )
  )

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_latex <-
    gt(iris_short) |>
    tab_spanner_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width")
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{\\{Sepal\\}\\} &  &  &  .*",
      ".cmidrule\\(lr\\)\\{1-2\\}.*",
      "Length & Width & Petal.Length & Petal.Width & Species.*"
    )
  )

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width`
  # columns using `c()`
  tbl_latex <-
    gt(iris_short) |>
    tab_spanner_delim(
      delim = ".",
      columns = c(Sepal.Length, Sepal.Width)
    )

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) |> as.character(),
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{\\{Sepal\\}\\} &  &  &  .*",
      ".cmidrule\\(lr\\)\\{1-2\\}.*",
      "Length & Width & Petal.Length & Petal.Width & Species.*"
    )
  )
})
