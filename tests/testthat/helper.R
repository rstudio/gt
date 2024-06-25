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


# Helper to ensure all patterns are matched
tidy_grepl <- function(x, pattern) {

  vapply(
    pattern,
    FUN = function(pattern) {
      grepl(pattern = pattern, x = x)
    },
    FUN.VALUE = logical(1L),
    USE.NAMES = FALSE
  )
}

# Create a shortened version of `mtcars`
mtcars_short <- datasets::mtcars[1:5, ]

# Create a shortened version of `iris`
iris_short <- datasets::iris[1:5, ]
