md_rtf <- function(md, rtf) {
  expect_identical(markdown_to_rtf(md), rtf_raw(rtf))
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
  md_rtf("test &amp; &#x21e8;&#x9034;", "test & \\u8680 \\u-28620 ")

  # softbreak
  md_rtf("test\ntest", "test\n test")

  # linebreak
  md_rtf("test  \ntest", "test\\line test")

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
  md_rtf("\\b{}", "\\'5c b\\'7b \\'7c ")
  md_rtf("&lt;&amp;", "<&")
})
