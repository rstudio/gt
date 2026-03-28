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

test_that("Quarto Typst knit_print emits Quarto-flavored table figures", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
  old_to <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  withr::defer(knitr::opts_knit$set(rmarkdown.pandoc.to = old_to))
  knitr::opts_knit$set(rmarkdown.pandoc.to = "typst")

  tab <-
    exibble[1:2, c("num", "char")] |>
    gt() |>
    tab_header(title = "A title") |>
    tab_caption("A caption")

  out <- knit_print.gt_tbl(tab)
  out_chr <- as.character(out)

  expect_match(out_chr, "```\\{=typst\\}")
  expect_match(out_chr, "kind: \"quarto-float-tbl\"", fixed = TRUE)
  expect_match(out_chr, "supplement: \"Table\"", fixed = TRUE)
  expect_match(out_chr, "caption: figure.caption(", fixed = TRUE)
  expect_match(out_chr, "\\[\n\\s*#stack\\(", perl = TRUE)
  expect_no_match(out_chr, "^:::", perl = TRUE)
})

test_that("Quarto Typst knit_print prefixes automatic labels with tbl-", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
  old_to <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  withr::defer(knitr::opts_knit$set(rmarkdown.pandoc.to = old_to))
  knitr::opts_knit$set(rmarkdown.pandoc.to = "typst")

  tab <-
    exibble[1:2, c("num", "char")] |>
    gt(id = "demo-table") |>
    tab_caption("A caption")

  out_chr <- as.character(knit_print.gt_tbl(tab))

  expect_match(out_chr, "::: {#tbl-demo-table}", fixed = TRUE)
})

test_that("Quarto Typst knit_print escapes Typst-sensitive plain text", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
  old_to <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  withr::defer(knitr::opts_knit$set(rmarkdown.pandoc.to = old_to))
  knitr::opts_knit$set(rmarkdown.pandoc.to = "typst")

  tab <-
    dplyr::tibble(
      item = "cash",
      value = "$100"
    ) |>
    gt() |>
    tab_header(title = "@heading <tbl-x>") |>
    tab_caption("caption #1")

  out_chr <- as.character(knit_print.gt_tbl(tab))

  expect_true(grepl("\\@heading \\<tbl-x\\>", out_chr, fixed = TRUE))
  expect_true(grepl("[\\$100]", out_chr, fixed = TRUE))
  expect_match(out_chr, "```\\{=typst\\}")
  expect_match(out_chr, "caption \\\\#1")
})

test_that("Quarto Typst knit_print preserves Typst styling constructs", {

  withr::local_envvar(c("QUARTO_BIN_PATH" = "path"))
  old_to <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  withr::defer(knitr::opts_knit$set(rmarkdown.pandoc.to = old_to))
  knitr::opts_knit$set(rmarkdown.pandoc.to = "typst")

  tab <-
    gtcars |>
    dplyr::select(mfr, model, hp) |>
    dplyr::slice(1:3) |>
    gt() |>
    tab_style(
      style = list(
        cell_fill(color = "#1F3C88"),
        cell_text(color = "white", weight = "bold")
      ),
      locations = cells_column_labels()
    )

  out_chr <- as.character(knit_print.gt_tbl(tab))

  expect_match(out_chr, "fill: \\(x, y\\) => if y == 0 \\{")
  expect_match(out_chr, "rgb\\(\"#1F3C88\"\\)")
  expect_match(out_chr, "#text\\(fill: rgb\\(\"#FFFFFF\"\\), weight: \"bold\"\\)")
})

test_that("Quarto Typst knit_print renders styled fills and explicit borders", {

  skip_if(Sys.which("quarto") == "")

  withr::local_envvar(c("QUARTO_BIN_PATH" = dirname(Sys.which("quarto"))))

  qmd_path <- tempfile(fileext = ".qmd")
  typ_path <- sub("\\.qmd$", ".typ", qmd_path)
  repo_path <- normalizePath(".", winslash = "/", mustWork = TRUE)

  qmd_lines <- c(
    "---",
    "title: \"Typst Styling Smoke Test\"",
    "format:",
    "  typst:",
    "    keep-typ: true",
    "---",
    "",
    "```{r}",
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

  expect_no_error(
    system2(
      Sys.which("quarto"),
      c("render", qmd_path, "--to", "typst"),
      stdout = TRUE,
      stderr = TRUE
    )
  )

  expect_true(file.exists(typ_path))

  typ_out <- paste(readLines(typ_path, warn = FALSE), collapse = "\n")
  expect_match(typ_out, "kind: table", fixed = TRUE)
  expect_match(typ_out, "fill: ", fixed = TRUE)
  expect_match(typ_out, "paint: red", fixed = TRUE)
})

test_that("Quarto Typst knit_print supports @tbl references through crossref divs", {

  skip_if(Sys.which("quarto") == "")

  withr::local_envvar(c("QUARTO_BIN_PATH" = dirname(Sys.which("quarto"))))

  qmd_path <- tempfile(fileext = ".qmd")
  typ_path <- sub("\\.qmd$", ".typ", qmd_path)
  repo_path <- normalizePath(".", winslash = "/", mustWork = TRUE)

  qmd_lines <- c(
    "---",
    "title: \"Typst Crossref Smoke Test\"",
    "format:",
    "  typst:",
    "    keep-typ: true",
    "---",
    "",
    "See @tbl-demo-crossref.",
    "",
    "```{r}",
    sprintf("devtools::load_all(%s, quiet = TRUE)", dQuote(repo_path)),
    "library(gt)",
    "",
    "exibble[1:2, c(\"num\", \"char\")] |>",
    "  gt(id = \"demo-crossref\") |>",
    "  tab_caption(\"Crossref caption\")",
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
  expect_match(typ_out, "See #ref\\(<tbl-demo-crossref>, supplement: \\[Table\\]\\)\\.")
  expect_match(typ_out, "kind: \"quarto-float-tbl\"", fixed = TRUE)
  expect_match(typ_out, "<tbl-demo-crossref>", fixed = TRUE)
})
