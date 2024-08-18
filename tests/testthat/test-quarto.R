skip_on_cran()
test_that("Rendering in Quarto doesn't error with empty string (#1769)", {
  local_mocked_bindings(check_quarto = function() TRUE)
  tbl <-  mtcars_short %>%
    dplyr::select(mpg, cyl) %>% gt()
  # note that these don't produce the same output.
  # render_as_html(tbl %>% cols_label(mpg = "")),
  # render_as_html(tbl %>% cols_label(mpg = md("")))
  expect_no_match_html(
    tbl %>% cols_label(mpg = gt::md("")),
    ">mpg</th>", fixed = TRUE
    )
  expect_match_html(
    tbl %>% cols_label(mpg = gt::md("")),
    ">cyl</th>", fixed = TRUE
  )
})

test_that("Rendering in Quarto produces valid html (#1839)", {
  local_mocked_bindings(check_quarto = function() TRUE)
  tbl <-  mtcars_short %>%
    dplyr::select(mpg, cyl) %>% gt() %>% tab_spanner(md("markdown"), c(mpg, cyl))
  # note that these don't produce the same output.
  # render_as_html(tbl %>% cols_label(mpg = "")),
  # render_as_html(tbl %>% cols_label(mpg = md("")))
  expect_no_match_html(
    tbl %>% cols_label(mpg = gt::md("")),
    "&gt;&lt;", fixed = TRUE
  )
  expect_match_html(
    tbl %>% cols_label(mpg = gt::md("")),
    ">cyl</th>", fixed = TRUE
  )
})
