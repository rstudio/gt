test_that("A gt table contains the expected heading components", {

  # Create a `tbl_latex` object with `gt()`; this table contains a title
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_header(title = "test title")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    "\\caption*{\n{\\large test title}\n} \\\\ \n\\toprule",
    fixed = TRUE
  )

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a title and a subtitle
  tbl_latex <-
    gt(mtcars_short) %>%
    tab_header(title = "test title", subtitle = "test subtitle")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    paste0(
      ".*.large test title",
      ".*.small test subtitle",
      ".*"
    )
  )

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
