md_rtf <- function(md, rtf) {
  expect_identical(unclass(markdown_to_rtf(md)), rtf)
}

rtf_with <- function(open, text, close = paste0(open, "0")) {
  paste0("\\", open, " ", text, " \\", close)
}

test_that("basic markdown_to_rtf works", {

  # block_quote
  # list
  # item
  # code_block
  # html_block
  # custom_block
  # paragraph
  # heading
  # thematic_break
  # text
  # softbreak
  # linebreak
  # code
  # html_inline
  # custom_inline

  # emph
  md_rtf("_test_", rtf_with("i", "test"))

  # strong
  md_rtf("**test**", rtf_with("b", "test"))

  # link
  # image

  # Multiple
  md_rtf("**_this &amp; that_**", rtf_with("b", rtf_with("i", "this & that")))
})

test_that("markdown_to_rtf escaping", {
  md_rtf("\\b", "\\\\b")
  md_rtf("&lt;&amp;", "<&")
})
