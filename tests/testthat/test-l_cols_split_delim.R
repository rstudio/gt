context("LaTeX -- Ensuring that the `cols_split_delim()` function works as expected")

# Create a shortened version of `iris`
iris_short <- iris[1:5, ]

test_that("the `cols_split_delim()` function works correctly", {

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels
  tbl_latex <-
    gt(iris_short) %>%
    cols_split_delim(delim = ".")

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\}.*multicolumn\\{2\\}\\{c\\}\\{Petal\\}",
      ".*cmidrule\\(lr\\)\\{1-2\\}.*cmidrule\\(lr\\)\\{3-4\\}",
      ".*Length & Width & Length & Width & Species.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width` columns
  tbl_latex <-
    gt(iris_short) %>%
    cols_split_delim(
      delim = ".",
      columns = c("Sepal.Length", "Sepal.Width"))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\} & & &",
      ".*cmidrule\\(lr\\)\\{1-2\\}",
      ".*Length & Width & Petal.Length & Petal.Width & Species.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()

  # Create a `tbl_latex` object with `gt()`; split the column
  # names into spanner headings and column labels but constrain
  # the splitting only to the `Sepal.Length` and `Sepal.Width`
  # columns using the `vars()` helper
  tbl_latex <-
    gt(iris_short) %>%
    cols_split_delim(
      delim = ".",
      columns = vars(Sepal.Length, Sepal.Width))

  # Expect a characteristic pattern
  grepl(
    paste0(
      ".*multicolumn\\{2\\}\\{c\\}\\{Sepal\\} & & &",
      ".*cmidrule\\(lr\\)\\{1-2\\}",
      ".*Length & Width & Petal.Length & Petal.Width & Species.*"),
    tbl_latex %>%
      as_latex() %>% as.character()) %>%
    expect_true()
})
