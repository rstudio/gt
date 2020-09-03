md_rtf <- function(md, rtf) {
  expect_equal(unclass(markdown_to_rtf(md)), unclass(rtf_raw(rtf)))
}

rtf_with <- function(open, text, close = paste0(open, "0")) {
  paste0("\\", open, " ", text, "\\", close, " ")
}

test_that("basic markdown_to_rtf works", {

  # block_quote

  # list
  md_rtf(
    "1. First item\n2. Second item\n3. Third item",
    paste0(
        "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 1.\\tx360\\tab First item}",
        "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 2.\\tx360\\tab Second item}",
        "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 3.\\tx360\\tab Third item\\sa180}"
    )
  )
  md_rtf(
    "- First item\n- Second item\n- Third item",
    paste0(
      "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab First item}",
      "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Second item}",
      "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Third item\\sa180}"
    )
  )

  # md_rtf(
  #   "1. First item\n2. Second item\n3. Third item\n    - indented item",
  #   paste0(
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab First item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Second item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Third item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li720 \\fi-360 \\endash \\tx360\\tab indented item\\sa180\\sa180}"
  #   )
  # )
  #
  # md_rtf(
  #   "1. First item\n2. Second item\n3. Third item\n    - indented item\n        - indented item",
  #   paste0(
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab First item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Second item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li360 \\fi-360 \\bullet \\tx360\\tab Third item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li720 \\fi-360 \\endash \\tx360\\tab indented item}",
  #     "{\\line \\ql \\f0 \\sa0 \\li1080 \\fi-360 \\bullet \\tx360\\tab indented item\\sa180\\sa180\\sa180}"
  #   )
  # )

  # item
  md_rtf("test &amp; &#x21e8;&#x9034;", "test & \\u8680 \\u-28620 ")

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
  md_rtf("***", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf("---", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf("___", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf(" ___", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf("  ___", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf("   ___", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")
  md_rtf("   ___________________", "{\\pard \\qc \\f0 \\sa180 \\li0 \\fi0 \\emdash\\emdash\\emdash\\emdash\\emdash\\par}")

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
  md_rtf("[link](google.com)", "{\\field{\\*\\fldinst{HYPERLINK \"google.com\"}}{\\fldrslt{\\ul link}}}")
  md_rtf("[](google.com)", "{\\field{\\*\\fldinst{HYPERLINK \"google.com\"}}{\\fldrslt{\\ul google.com}}}")
  md_rtf("[link](google.com \"A search engine.\")", "{\\field{\\*\\fldinst{HYPERLINK \"google.com\"}}{\\fldrslt{\\ul link}}}")
  md_rtf("[](google.com \"A search engine.\")", "{\\field{\\*\\fldinst{HYPERLINK \"google.com\"}}{\\fldrslt{\\ul google.com}}}")

  # image

  #
  ## Combined tests
  #

  # Multiple
  md_rtf("**_this &amp; that_**", "{\\b {\\i this & that}}")
  md_rtf("***this &amp; that***", "{\\i {\\b this & that}}")
  md_rtf("_**this &amp; that**_", "{\\i {\\b this & that}}")
  md_rtf("___this &amp; that___", "{\\i {\\b this & that}}")

  # Overlapping
  md_rtf("**_this &amp;** that_", "{\\b _this &} that_")
})

test_that("markdown_to_rtf escaping", {
  md_rtf("\\b{}", "\\'5c b\\'7b \\'7c ")
  md_rtf("&lt;&amp;", "<&")
})
