
test_that("A gt table contains the expected stubhead label", {

  # Create a `tbl_latex` object with `gt()`; this table
  # contains a stub and a stubhead caption
  tbl_latex <-
    gt(mtcars_short, rownames_to_stub = TRUE) %>%
    tab_stubhead(label = "the mtcars")

  # Expect a characteristic pattern
  expect_match(
    as_latex(tbl_latex) %>% as.character(),
    paste0(
      ".*the mtcars & mpg & cyl & disp & hp & drat & wt & qsec & vs & am & gear & carb",
      ".*"
    )
  )
})
