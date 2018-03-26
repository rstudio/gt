context("test-quick_table.R")

test_that("the creation of a quick table works", {

  # Quickly create an html table using the
  # `quick_table()` with the iris dataset
  html <- quick_table(iris)

  # Expect that the object returned has the
  # `knit_asis` class
  expect_is(html, "knit_asis")

  # Expect that the object returned is the
  # type of `character`
  expect_type(html, "character")
})
