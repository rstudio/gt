# Loaded with load_all()
# For test-utils.R
md_rtf <- function(md, rtf) {
  expect_equal(markdown_to_rtf(md), unclass(rtf_raw(rtf)))
}

rtf_with <- function(open, text, close = paste0(open, "0")) {
  paste0("\\", open, " ", text, "\\", close, " ")
}

# for tab functions

# Gets the HTML attr value from a single key
selection_value <- function(html, key) {
  selection <- paste0("[", key, "]")
  rvest::html_attr(rvest::html_nodes(html, selection), key)
}

# Gets the inner HTML text from a single value
selection_text <- function(html, selection) {
  rvest::html_text(rvest::html_nodes(html, selection))
}

expect_selection_text_from_gt <- function(gt_tbl, selection, expected, ...) {
  html <- xml2::read_html(render_as_html(gt_tbl))
  expect_equal(
    selection_text(html, selection),
    expected,
    ...
  )
}

expect_equal_gt <- function(gt_tbl1, gt_tbl2, f = render_as_html, ignore_id = FALSE, ...) {
  gt_tbl1 <- f(gt_tbl1)
  gt_tbl2 <- f(gt_tbl2)
  if (ignore_id) {
    gt_tbl1 <- gsub("id=\"[a-z]*?\"", "", gt_tbl1)
    gt_tbl2 <- gsub("id=\"[a-z]*?\"", "", gt_tbl2)
  }
  expect_equal(
    gt_tbl1,
    gt_tbl2
  )
}


# Helper function to compare a contiguous set of HTML fragments with raw html
html_fragment_within <- function(raw_html, ...) {
  grepl(paste0("\\Q", c(...), "\\E", "[\\n\\s]*?", collapse = ""), raw_html, perl = TRUE)
}

# shortcut for expect_match(render_as_html(object), regexp)
expect_match_html <- function(object,
                              regexp,
                              perl = FALSE,
                              fixed = FALSE,
                              ...,
                              all = TRUE,
                              info = NULL,
                              label = NULL) {
  rendered <- render_as_html(object)
  for (i in seq_along(regexp)) {
    testthat::expect_match(
      object = rendered,
      regexp = regexp[i],
      perl = perl,
      fixed = fixed,
      ...,
      all = all,
      info = info,
      label = label
    )
  }
}


# shortcut for expect_match(render_as_html(object), regexp)
expect_no_match_html <- function(object,
                              regexp,
                              perl = FALSE,
                              fixed = FALSE,
                              ...,
                              all = TRUE,
                              info = NULL,
                              label = NULL) {
  rendered <- render_as_html(object)
  for (i in seq_along(regexp)) {
    testthat::expect_no_match(
      object = rendered,
      regexp = regexp[i],
      perl = perl,
      fixed = fixed,
      ...,
      all = all,
      info = info,
      label = label
    )
  }
}

expect_merge_locale_sep <- function(locale = NULL, global_locale = NULL, sep = NULL, expected_sep) {
  tbl <- data.frame(
    col_1 = 1,
    col_2 = 2,
    col_3 = 3,
    col_4 = 4
  )
  gt_tbl <- gt(tbl, locale = global_locale)
  merged_gt <- cols_merge_range(gt_tbl, col_begin = "col_1", col_end = "col_2", locale = locale, sep = sep)
  actual_merge_sep <- dt_col_merge_get(merged_gt)[[1]]$sep
  expect_equal(actual_merge_sep, expected_sep, label = paste0("locale = ", locale))
}

# Gets the text from a row group label
get_row_group_text <- function(tbl_html) {
  gsub(
    "\n\\s+",
    "",
    selection_text(tbl_html, "[class='gt_group_heading_row']")
  )
}

generate_html_units <- function(input) {
  render_units(
    define_units(input),
    context = "html"
  )
}

# Create a shortened version of `mtcars`
mtcars_short <- datasets::mtcars[1:5, ]

# Create a shortened version of `iris`
iris_short <- datasets::iris[1:5, ]

exibble_test <- function(
    row_group_as_column = FALSE,
    use_row_groups = FALSE,
    use_row_labels = FALSE,
    add_group_summaries = FALSE,
    add_grand_summary = FALSE,
    add_styles = FALSE,
    add_footnotes = FALSE
) {

  if (add_group_summaries) use_row_groups <- TRUE

  tbl <-
    exibble %>%
    gt(
      rowname_col = if (use_row_labels) "row" else NULL,
      groupname_col = if (use_row_groups) "group" else NULL,
      row_group_as_column = row_group_as_column
    ) %>%
    tab_header(
      title = md("Data listing from **exibble**"),
      subtitle = md("`exibble` is an R dataset")
    ) %>%
    tab_stubhead("S.L.") %>%
    tab_spanner(label = "timing", columns = c(date, time, datetime)) %>%
    tab_source_note("Source note #1") %>%
    tab_source_note("Source note #2")

  if (add_group_summaries) {

    tbl <-
      tbl %>%
      summary_rows(
        groups = everything(),
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  if (add_grand_summary) {

    tbl <-
      tbl %>%
      grand_summary_rows(
        columns = c(num, currency),
        fns = list(
          min = ~min(., na.rm = TRUE),
          max = ~max(., na.rm = TRUE),
          avg = ~mean(., na.rm = TRUE)
        ),
        fmt = list(~ fmt_number(., use_seps = FALSE))
      )
  }

  if (add_styles) {

    tbl <-
      tbl %>%
      tab_style(style = cell_fill("lightblue"), cells_title("title")) %>%
      tab_style(style = cell_fill("aqua"), cells_title("subtitle")) %>%
      tab_style(style = cell_fill("aquamarine"), cells_column_labels()) %>%
      tab_style(style = cell_fill("gainsboro"), cells_stubhead()) %>%
      tab_style(style = cell_fill("gray85"), cells_body(columns = num)) %>%
      tab_style(style = cell_fill("gray80"), cells_body(columns = char)) %>%
      tab_style(style = cell_fill("gray75"), cells_body(columns = fctr)) %>%
      tab_style(style = cell_fill("gray70"), cells_body(columns = date)) %>%
      tab_style(style = cell_fill("gray65"), cells_body(columns = time)) %>%
      tab_style(style = cell_fill("gray60"), cells_body(columns = datetime)) %>%
      tab_style(style = cell_fill("gray55"), cells_body(columns = currency)) %>%
      tab_style(style = cell_fill("peachpuff"), cells_stub()) %>%
      tab_style(style = cell_fill("wheat"), cells_source_notes()) %>%
      tab_style(style = cell_fill("yellow"), cells_column_spanners(spanners = "timing"))

    if (!use_row_labels) {
      tbl <- tab_style(tbl, style = cell_fill("gray50"), cells_body(columns = row))
    }

    if (use_row_groups) {
      tbl <- tab_style(tbl, style = cell_fill("lightcyan"), cells_row_groups())
    } else {
      tbl <- tab_style(tbl, style = cell_fill("gray45"), cells_body(columns = group))
    }

    if (add_group_summaries) {
      tbl <-
        tbl %>%
        tab_style(
          style = cell_fill("darkseagreen"),
          locations = list(
            cells_summary(columns = "num"),
            cells_summary(columns = "currency")
          )
        ) %>%
        tab_style(
          style = cell_fill("orange"),
          locations = cells_stub_summary()
        )
    }

    if (add_grand_summary) {
      tbl <-
        tbl %>%
        tab_style(
          style = cell_fill(),
          locations = list(
            cells_grand_summary(columns = "num"),
            cells_grand_summary(columns = "currency")
          )
        ) %>%
        tab_style(
          style = cell_fill("red"),
          locations = cells_stub_grand_summary()
        )
    }
  }

  tbl
}
