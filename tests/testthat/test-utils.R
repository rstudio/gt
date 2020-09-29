md_rtf <- function(md, rtf) {
  expect_equal(markdown_to_rtf(md), unclass(rtf_raw(rtf)))
}

rtf_with <- function(open, text, close = paste0(open, "0")) {
  paste0("\\", open, " ", text, "\\", close, " ")
}

test_that("basic markdown_to_rtf works", {

  # list
  md_rtf(
    "1. First item\n2. Second item\n3. Third item",
    "\\pard\\intbl\\itap1\\li300\\fi-300 \\ls1\\ilvl0\\cf0 \n{\\listtext\t}First item\\\n{\\listtext\t}Second item\\\n{\\listtext\t}Third item\\\n"
  )
  md_rtf(
    "- First item\n- Second item\n- Third item",
    "\\pard\\intbl\\itap1\\li300\\fi-300 \\ls1\\ilvl0\\cf0 \n{\\listtext\t}\\u8226  First item\\\n{\\listtext\t}\\u8226  Second item\\\n{\\listtext\t}\\u8226  Third item\\\n"
  )

  # item
  md_rtf("test &amp; &#x21e8;&#x9034;", "test & \\u8680 \\u-28620 ")

  # code_block
  md_rtf("    aaa\nbbb\n", "{\\f1 aaa\n}{bbb}")
  md_rtf("        foo\n    bar\n", "{\\f1     foo\nbar\n}")
  md_rtf("```\n<\n >\n```\n", "{\\f1 <\n >\n}")
  md_rtf("```\naaa\n~~~\n```\n", "{\\f1 aaa\n~~~\n}")
  md_rtf("```r\nSys.Date()\n```\n", "{\\f1 Sys.Date()\n}")

  # html_block
  # custom_block

  # paragraph
  md_rtf("aaa\n\nbbb\n", "{aaa}{bbb}")
  md_rtf("   aaa\nbbb\n", "aaa\n bbb")
  md_rtf("aaa\nbbb\n\nccc\nddd\n", "{aaa\n bbb}{ccc\n ddd}")
  md_rtf(
    "aaa\n             bbb\n                                       ccc\n",
    "aaa\n bbb\n ccc"
  )

  # heading
  md_rtf("# test", "{\\ql \\f0 \\sa180 \\b \\fs36 test}")
  md_rtf("## test", "{\\ql \\f0 \\sa180 \\b \\fs32 test}")
  md_rtf("### test", "{\\ql \\f0 \\sa180 \\b \\fs28 test}")
  md_rtf("#### test", "{\\ql \\f0 \\sa180 \\b \\fs24 test}")
  md_rtf("##### test", "{\\ql \\f0 \\sa180 \\b \\fs20 test}")
  md_rtf("###### test", "{\\ql \\f0 \\sa180 \\b \\fs16 test}")
  md_rtf("# te*s*t", "{\\ql \\f0 \\sa180 \\b \\fs36 te{\\i s}t}")

  # thematic_break
  md_rtf("***", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("---", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("___", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf(" ___", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("  ___", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("   ___", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("   ___________________", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("- - - -    \n", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")
  md_rtf("*\t*\t*\t\n", "{\\qc \\f0 \\sa180 \\emdash\\emdash\\emdash\\emdash\\emdash}")

  # text
  md_rtf("test &amp; &#x21e8;&#x9034;", "test & \\u8680 \\u-28620 ")

  # softbreak
  md_rtf("test\ntest", "test\n test")

  # linebreak
  md_rtf("test  \ntest", "test\\line test")

  # code
  md_rtf("`test`", "{\\f1 test}")
  md_rtf("`te**s**t`", "{\\f1 te**s**t}")
  md_rtf("`test \\`", "{\\f1 test \\'5c}")

  # html_inline
  md_rtf("Line 1.<br>Line 2.", "Line 1.\\line Line 2.")
  md_rtf("R<sup>2</sup>", "R{\\super 2}")
  md_rtf("C<sub>6</sub>H<sub>6</sub>", "C{\\sub 6}H{\\sub 6}")
  md_rtf("Text can get <strong>bolder</strong>", "Text can get {\\b bolder}")
  md_rtf("Text can get <b>bolder</b>", "Text can get {\\b bolder}")
  md_rtf("Use <em>emphasis</em> occasionally", "Use {\\i emphasis} occasionally")
  md_rtf("Use <i>emphasis</i> occasionally", "Use {\\i emphasis} occasionally")
  md_rtf("It's <em><strong>important</strong></em>.", "It's {\\i {\\b important}}.")
  md_rtf("This is <code>code</code>.", "This is {\\f1 code}.")
  md_rtf("Line 1.<br>Line 2.", "Line 1.\\line Line 2.")
  md_rtf("Line 1.<br />Line 2.", "Line 1.\\line Line 2.")
  md_rtf("Line 1.<br/>Line 2.", "Line 1.\\line Line 2.")
  md_rtf("It's *<strong>important</strong>*.", "It's {\\i {\\b important}}.")
  md_rtf("It's _<strong>important</strong>_.", "It's {\\i {\\b important}}.")
  md_rtf("It's <em>**important**</em>.", "It's {\\i {\\b important}}.")
  md_rtf("It's <em>__important__</em>.", "It's {\\i {\\b important}}.")
  md_rtf(
    "&nbsp; &amp; &copy; &AElig; &Dcaron;\n&frac34; &HilbertSpace; &DifferentialD;\n&ClockwiseContourIntegral; &ngE;",
    "\\u160  & \\u169  \\u198  \\u270 \n \\u190  \\u8459  \\u8518 \n \\u8754  \\u8807 \\u824 "
  )
  # TODO: <pre>, <blockquote>

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
  md_rtf("<http://example.com?find=\\*>", "{\\field{\\*\\fldinst{HYPERLINK \"http://example.com?find=\\*\"}}{\\fldrslt{\\ul http://example.com?find=\\'5c*}}}")

  # image

  #
  ## Combined tests
  #

  # Multiple
  md_rtf("**_this &amp; that_**", "{\\b {\\i this & that}}")
  md_rtf("***this &amp; that***", "{\\i {\\b this & that}}")
  md_rtf("_**this &amp; that**_", "{\\i {\\b this & that}}")
  md_rtf("___this &amp; that___", "{\\i {\\b this & that}}")
  md_rtf("\\\\*emphasis*", "\\'5c{\\i emphasis}")
  md_rtf("Foo\nbar\n\\---\nbaz\n", "Foo\n bar\n ---\n baz")

  # Backslash escapes
  md_rtf("`` \\[\\` ``", "{\\f1 \\'5c[\\'5c`}")
  md_rtf("foo\\\nbar\n", "foo\\line bar")
  md_rtf("\\\\*emphasis*", "\\'5c{\\i emphasis}")
  md_rtf(
    "\\!\\\"\\#\\$\\%\\&\\'\\(\\)\\*\\+\\,\\-\\.\\/\\:\\;\\<\\=\\>\\?\\@\\[\\\\\\]\\^\\_\\`\\{\\|\\}\\~\n",
    "!\"#$%&'()*+,-./:;<=>?@[\\'5c]^_`\\'7b|\\'7d~"
  )
  md_rtf(
    "\\*not emphasized*\n\\<br/> not a tag\n\\[not a link](/foo)\n\\`not code`\n1\\. not a list\n\\* not a list\n\\# not a heading\n\\[foo]: /url \"not a reference\"\n\\&ouml; not a character entity",
    "*not emphasized*\n <br/> not a tag\n [not a link](/foo)\n `not code`\n 1. not a list\n * not a list\n # not a heading\n [foo]: /url \"not a reference\"\n &ouml; not a character entity"
  )

  # Overlapping
  md_rtf("**_this &amp;** that_", "{\\b _this &} that_")
})

test_that("markdown_to_rtf escaping", {
  md_rtf("\\b{}", "\\'5cb\\'7b\\'7d")
  md_rtf("&lt;&amp;", "<&")
})
