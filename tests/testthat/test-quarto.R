skip_on_cran()

test_that("Rendering in Quarto doesn't error with empty string (#1769)", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))

  tbl <- mtcars_short |> dplyr::select(mpg, cyl) |> gt()

  # note that these don't produce the same output.
  # render_as_html(tbl |> cols_label(mpg = "")),
  # render_as_html(tbl |> cols_label(mpg = md("")))
  expect_no_match_html(
    tbl |> cols_label(mpg = gt::md("")),
    ">mpg</th>", fixed = TRUE
    )

  expect_match_html(
    tbl |> cols_label(mpg = gt::md("")),
    ">cyl</th>", fixed = TRUE
  )

  expect_equal(
    vec_fmt_markdown("**x**", output = "html"),
    "<strong>x</strong></span>"
  )
})

test_that("Rendering in Quarto produces valid html (#1839)", {

  local_mocked_bindings(check_quarto = function() TRUE)

  tbl <-
    mtcars_short |>
    dplyr::select(mpg, cyl) |> gt() |> tab_spanner(md("markdown"), c(mpg, cyl))

  # note that these don't produce the same output.
  # render_as_html(tbl |> cols_label(mpg = "")),
  # render_as_html(tbl |> cols_label(mpg = md("")))
  expect_no_match_html(
    tbl |> cols_label(mpg = gt::md("")),
    "&gt;&lt;", fixed = TRUE
  )

  expect_match_html(
    tbl |> cols_label(mpg = gt::md("")),
    ">cyl</th>", fixed = TRUE
  )
})

test_that("Quarto produces the valid output", {

  # Currently, some parts are invalid
  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))

  tab <-
    exibble |>
    dplyr::select(num, char, fctr) |>
    dplyr::mutate(x = "- 1") |> # create bullet list
    dplyr::slice_head(n  = 5) |>
    gt() |>
    fmt_markdown(num) |>
    tab_footnote(
      md("Problem because num row 1 is `fmt_markdown()` + also the footnote is wrapped in md."),
      locations = cells_body("num", 1)
    ) |>
    tab_footnote(
      "A problem because fctr is labelled with md",
      locations = cells_column_labels("fctr")
    ) |>
    tab_footnote(
      "Not a problem",
      locations = cells_column_labels("char")
    ) |>
    cols_label(fctr = md("Factor")) |>
    tab_header(md("[gog](https://google.com)")) |>
    tab_spanner(md("problem"), c(2, 3))

  expect_snapshot_html(tab)
  expect_snapshot_latex(tab)
})
