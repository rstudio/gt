skip_on_cran()

with_typst_knit_context <- function(code) {
  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
  local_mocked_bindings(
    check_quarto = function() TRUE,
    knitr_is_typst_output = function() TRUE
  )
  old_to <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  withr::defer(knitr::opts_knit$set(rmarkdown.pandoc.to = old_to))
  knitr::opts_knit$set(rmarkdown.pandoc.to = "typst")
  force(code)
}

test_that("Rendering in Quarto doesn't error with empty string (#1769)", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))

  tbl <- mtcars_short |> dplyr::select(mpg, cyl) |> gt()

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
    dplyr::select(mpg, cyl) |>
    gt() |>
    tab_spanner(md("markdown"), c(mpg, cyl))

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

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))

  tab <-
    exibble |>
    dplyr::select(num, char, fctr) |>
    dplyr::mutate(x = "- 1") |>
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

test_that("Quarto Typst knit_print uses a raw figure path for unlabeled captioned tables", {

  with_typst_knit_context({
    tab <-
      exibble[1:2, c("num", "char")] |>
      gt() |>
      tab_header(title = "A title") |>
      tab_caption("A caption")

    out_chr <- as.character(knit_print.gt_tbl(tab))

    expect_match(out_chr, "```\\{=typst\\}")
    expect_match(out_chr, "kind: \"quarto-float-tbl\"", fixed = TRUE)
    expect_match(out_chr, "caption: figure.caption(", fixed = TRUE)
    expect_no_match(out_chr, "^:::", perl = TRUE)
  })
})

test_that("Quarto Typst knit_print lets Quarto own chunk-labeled table floats", {

  with_typst_knit_context({
    old_label <- knitr::opts_current$get("label")
    old_tbl_cap <- knitr::opts_current$get("tbl-cap")
    withr::defer(knitr::opts_current$set(label = old_label))
    withr::defer(knitr::opts_current$set(`tbl-cap` = old_tbl_cap))
    knitr::opts_current$set(label = "tbl-demo-table")
    knitr::opts_current$set(`tbl-cap` = "Chunk caption")

    tab <-
      exibble[1:2, c("num", "char")] |>
      gt() |>
      tab_header(title = "A title", subtitle = "A subtitle") |>
      tab_footnote("A footnote", locations = cells_body(columns = num, rows = 1)) |>
      tab_source_note("A source note") |>
      tab_caption("caption #1 @x <tbl-y>")

    out_chr <- as.character(knit_print.gt_tbl(tab))

    expect_match(out_chr, "```\\{=typst\\}")
    expect_no_match(out_chr, "kind: \"quarto-float-tbl\"", fixed = TRUE)
    expect_no_match(out_chr, "caption: figure.caption(", fixed = TRUE)
    expect_match(out_chr, "A title")
    expect_match(out_chr, "A subtitle")
    expect_match(out_chr, "A footnote")
    expect_match(out_chr, "A source note")
  })
})

test_that("Quarto Typst knit_print preserves Typst-safe escaping and styling constructs", {

  with_typst_knit_context({
    tab <-
      dplyr::tibble(
        item = "cash",
        value = "$100"
      ) |>
      gt() |>
      tab_header(title = "@heading <tbl-x>") |>
      tab_style(
        style = list(
          cell_fill(color = "#1F3C88"),
          cell_text(color = "white", weight = "bold")
        ),
        locations = cells_column_labels()
      ) |>
      tab_caption("caption #1 $100")

    out_chr <- as.character(knit_print.gt_tbl(tab))

    expect_true(grepl("\\@heading \\<tbl-x\\>", out_chr, fixed = TRUE))
    expect_true(grepl("[\\$100]", out_chr, fixed = TRUE))
    expect_true(grepl("caption \\#1 \\$100", out_chr, fixed = TRUE))
    expect_match(out_chr, "fill: \\(x, y\\) => if y == 0 \\{")
    expect_match(out_chr, "#text\\(fill: rgb\\(\"#FFFFFF\"\\), weight: \"bold\"\\)")
  })
})

test_that("Quarto Typst render smoke test covers styling, crossrefs, and plain-text caption escaping", {

  skip_if(Sys.which("quarto") == "")

  withr::local_envvar(c("QUARTO_BIN_PATH" = dirname(Sys.which("quarto"))))

  qmd_path <- tempfile(fileext = ".qmd")
  typ_path <- sub("\\.qmd$", ".typ", qmd_path)
  repo_path <- normalizePath(".", winslash = "/", mustWork = TRUE)

  qmd_lines <- c(
    "---",
    "title: \"Typst Smoke Test\"",
    "format:",
    "  typst:",
    "    keep-typ: true",
    "---",
    "",
    "See @tbl-demo-smoke.",
    "",
    "```{r}",
    "#| label: tbl-demo-smoke",
    "#| tbl-cap: Chunk caption for the smoke test.",
    sprintf("devtools::load_all(%s, quiet = TRUE)", dQuote(repo_path)),
    "library(gt)",
    "library(dplyr)",
    "",
    "exibble[1:3, c(\"num\", \"char\", \"currency\")] |>",
    "  gt() |>",
    "  tab_header(title = \"Styled\") |>",
    "  tab_style(",
    "    style = list(",
    "      cell_fill(color = \"#1F3C88\"),",
    "      cell_text(color = \"white\", weight = \"bold\")",
    "    ),",
    "    locations = cells_column_labels()",
    "  ) |>",
    "  tab_style(",
    "    style = cell_fill(color = \"#E3F2FD\"),",
    "    locations = cells_body(columns = char)",
    "  ) |>",
    "  tab_style(",
    "    style = cell_borders(sides = c(\"right\", \"left\"), color = \"red\", weight = px(2)),",
    "    locations = cells_body(columns = c(num, char), rows = 1)",
    "  )",
    "```"
  )

  writeLines(qmd_lines, qmd_path, useBytes = TRUE)

  render_out <-
    system2(
      Sys.which("quarto"),
      c("render", qmd_path, "--to", "typst"),
      stdout = TRUE,
      stderr = TRUE
    )

  expect_false(any(grepl("Unable to resolve crossref", render_out, fixed = TRUE)))
  expect_true(file.exists(typ_path))

  typ_out <- paste(readLines(typ_path, warn = FALSE), collapse = "\n")
  expect_match(typ_out, "See #ref\\(<tbl-demo-smoke>, supplement: \\[Table\\]\\)\\.")
  expect_match(typ_out, "Chunk caption for the smoke test\\.")
  expect_match(typ_out, "kind: \"quarto-float-tbl\"", fixed = TRUE)
  expect_match(typ_out, "fill: ", fixed = TRUE)
  expect_match(typ_out, "paint: red", fixed = TRUE)
  expect_no_match(typ_out, "#figure\\(\\[\\s*#figure\\(", perl = TRUE)
})
