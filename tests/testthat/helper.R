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

# Create a shortened version of `mtcars`
mtcars_short <- datasets::mtcars[1:5, ]

# Create a shortened version of `iris`
iris_short <- datasets::iris[1:5, ]
