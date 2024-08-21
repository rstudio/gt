skip_on_cran()
test_that("Rendering in Quarto doesn't error with empty string (#1769)", {
  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
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
  expect_equal(
    vec_fmt_markdown("**x**", output = "html"),
    "<strong>x</strong></span>"
  )
})
