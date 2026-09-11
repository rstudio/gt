expect_caption_eq <- function(caption, expected) {

  result <- create_caption_component_h(gt(exibble, caption = caption))

  expect_identical(
    result,
    htmltools::HTML(paste0(
      "<!--/html_preserve--><caption class='gt_caption'>",
      expected,
      "</caption><!--html_preserve-->"
    ))
  )
}

test_that("captioning processes text correctly", {

  # No caption if not specified
  expect_null(create_caption_component_h(exibble |> gt()))

  expect_caption_eq("**hello & goodbye**", "**hello &amp; goodbye**")
  expect_caption_eq(md("**hello & goodbye**"), "<span class='gt_from_md'><strong>hello &amp; goodbye</strong></span>")
  expect_caption_eq(I("**hello & goodbye**"), "**hello & goodbye**")
  expect_caption_eq(htmltools::strong("hello & goodbye"), "<strong>hello &amp; goodbye</strong>")
  expect_caption_eq(htmltools::HTML("<strong>hello &amp; goodbye</strong>"), "<strong>hello &amp; goodbye</strong>")
  expect_caption_eq(I("<strong>hello &amp; goodbye</strong>"), "<strong>hello &amp; goodbye</strong>")
  expect_caption_eq("", "")
})

test_that("bookdown-style crossrefs are added when appropriate", {

  op <- options(knitr.in.progress = TRUE)

  on.exit(options(op), add = TRUE)

  stopifnot(is.null(knitr::opts_current$get("label")))

  stopifnot(is.null(knitr::opts_knit$get("bookdown.internal.label")))

  on.exit({
    knitr::opts_current$set(label = NULL)
    knitr::opts_knit$set(bookdown.internal.label = NULL)
  }, add = TRUE)

  knitr::opts_current$set(label = "foo")

  # If bookdown, then ref is generated
  knitr::opts_knit$set(bookdown.internal.label = TRUE)

  expect_caption_eq("test", "(#tab:foo)test")

  expect_null(create_caption_component_h(exibble |> gt()))

  # If bookdown.internal.label is unset, ref is not generated
  knitr::opts_knit$set(bookdown.internal.label = NULL)

  expect_caption_eq("test", "test")
})

test_that("Higher-level column spanner is displayed correctly when multi-column stub is present", {
  gt_tab <- gtcars[1:2, 1:5] |>
    gt(rowname_col = c("mfr", "model")) |>
    tab_spanner(label = "spanner1", columns = 3:5) |>
    tab_spanner(label = "spanner2", columns = 3:5)

  tbl_html <- gt_tab |> gt::as_raw_html()

  doc <- xml2::read_html(tbl_html)

  # The first <th> in the first header row is the empty top-left corner cell
  top_left_th <- xml2::xml_find_first(doc, "(//thead/tr)[1]/th[1]")

  # The stub occupies 2 columns here (row-group label + row label), so the
  # corner cell must colspan across both -- not just 1.
  expect_identical(xml2::xml_attr(top_left_th, "colspan"), "2")
})

# Helper: extract all id and headers attributes from HTML and verify that every
# token in a headers attribute matches an existing id in the document.
expect_headers_match_ids <- function(html) {
  doc <- xml2::read_html(html)
  all_ids <- xml2::xml_attr(
    xml2::xml_find_all(doc, "//*[@id]"), "id"
  )
  headers_vals <- xml2::xml_attr(
    xml2::xml_find_all(doc, "//*[@headers]"), "headers"
  )
  header_refs <- unique(unlist(strsplit(headers_vals, "\\s+")))
  missing <- setdiff(header_refs, all_ids)
  expect_length(missing, 0L)
}

test_that("Column names with spaces produce valid id/headers references (#2085)", {

  df <- data.frame(
    `married_low income` = c(30, 2),
    `married_high income` = c(30, 4),
    `single_low income` = c(20, 1),
    `single_high income` = c(20, 2),
    col = c("age", "hsize"),
    check.names = FALSE
  )

  gt_tbl <- gt(df, rowname_col = "col") |> tab_spanner_delim(delim = "_")
  html <- gt_tbl |> as_raw_html(inline_css = FALSE)

  expect_headers_match_ids(html)

  # Verify that the column id attributes contain no spaces
  doc <- xml2::read_html(html)
  col_th_ids <- xml2::xml_attr(
    xml2::xml_find_all(doc, "//thead//th[@id]"), "id"
  )
  has_space <- grepl(" ", col_th_ids)
  expect_false(any(has_space))
})

test_that("Spanner labels with spaces get valid HTML ids", {

  gt_tbl <- exibble |>
    gt() |>
    tab_spanner(label = "Date and Time", columns = c(date, time, datetime))

  html <- gt_tbl |> as_raw_html(inline_css = FALSE)

  doc <- xml2::read_html(html)
  spanner_id <- xml2::xml_attr(
    xml2::xml_find_first(doc, "//th[contains(@class, 'gt_column_spanner_outer')]"),
    "id"
  )
  expect_identical(spanner_id, "Date-and-Time")
})

test_that("Group names with spaces produce consistent id/headers references", {

  df <- data.frame(
    group = c("Group A", "Group A", "Group B", "Group B"),
    x = 1:4,
    y = 5:8
  )

  gt_tbl <- gt(df, groupname_col = "group")
  html <- gt_tbl |> as_raw_html(inline_css = FALSE)

  expect_headers_match_ids(html)
})
