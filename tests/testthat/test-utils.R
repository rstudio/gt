md_rtf <- function(md, rtf) {
  expect_equal(unclass(markdown_to_rtf(md)), unclass(rtf_raw(rtf)))
}

rtf_with <- function(open, text, close = paste0(open, "0")) {
  paste0("\\", open, " ", text, "\\", close, " ")
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
  md_rtf("# test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs36 test \\par}")
  md_rtf("## test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs32 test \\par}")
  md_rtf("### test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs28 test \\par}")
  md_rtf("#### test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs24 test \\par}")
  md_rtf("##### test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs20 test \\par}")
  md_rtf("###### test", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs16 test \\par}")

  md_rtf("# te*s*t", "{\\pard \\ql \\f0 \\sa180 \\li0 \\fi0 \\b \\fs36 te{\\i s}t \\par}")

  # thematic_break
  # text
  md_rtf("test &amp; &#x21e8;&#x9034;", "test & \\u8680 \\u-28620 ")

  # softbreak
  md_rtf("test\ntest", "test\n test")

  # linebreak
  md_rtf("test  \ntest", "test\\line test")

  # code
  md_rtf("`test`", "{\\f1 test}")
  md_rtf("`te**s**t`", "{\\f1 te**s**t}")
  md_rtf("`test \\`", "{\\f1 test \\'5c }")

  # html_inline
  # custom_inline

  # emph
  md_rtf("_test_", "{\\i test}")

  # strong
  md_rtf("**test**", "{\\b test}")

  # link
  # image

  # Multiple
  md_rtf("**_this &amp; that_**", "{\\b {\\i this & that}}")

  # Overlapping
  md_rtf("**_this &amp;** that_", "{\\b _this &} that_")
})

test_that("markdown_to_rtf escaping", {
  md_rtf("\\b{}", "\\'5c b\\'7b \\'7c ")
  md_rtf("&lt;&amp;", "<&")
})
