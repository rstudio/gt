test_that("Various `is_*()` utility functions work properly", {

  empty_tbl <- dplyr::tibble()
  empty_df <- data.frame()

  empty_w_cols_tbl <- dplyr::tibble(a = character(0L), b = numeric(0L))
  empty_w_cols_df <- data.frame(a = character(0L), b = numeric(0L))

  empty_w_rows_tbl <- dplyr::tibble(.rows = 5)
  empty_w_rows_df <- as.data.frame(empty_w_rows_tbl)

  # Expect that `is_gt_tbl()` is TRUE with a `gt_tbl` and FALSE in other cases
  expect_true(is_gt_tbl(gt(exibble)))
  expect_true(is_gt_tbl(gt_preview(gtcars)))
  expect_false(is_gt_tbl(exibble))
  expect_false(is_gt_tbl(gt_group(gt(exibble), gt(exibble))))
  expect_false(is_gt_tbl(as_raw_html(gt(exibble))))

  # Expect that `is_gt_group()` is TRUE with a `gt_group` and FALSE in other cases
  expect_true(is_gt_group(gt_group(gt(exibble), gt(exibble))))
  expect_false(is_gt_group(gt(exibble)))
  expect_false(is_gt_group(gt_preview(gtcars)))
  expect_false(is_gt_group(exibble))
  expect_false(is_gt_group(as_raw_html(gt(exibble))))

  # Expect that `is_gt_tbl_or_group()` is TRUE with a `gt_group` or a
  # `gt_tbl` and FALSE in other cases
  expect_true(is_gt_tbl_or_group(gt_group(gt(exibble), gt(exibble))))
  expect_true(is_gt_tbl_or_group(gt(exibble)))
  expect_true(is_gt_tbl_or_group(gt_preview(gtcars)))
  expect_false(is_gt_tbl_or_group(exibble))
  expect_false(is_gt_tbl_or_group(as_raw_html(gt(exibble))))

  # Expect that a completely empty table *and* a table with rows but no
  # columns in a gt object yields TRUE via `is_gt_tbl_empty()`
  expect_true(is_gt_tbl_empty(gt(empty_tbl)))
  expect_true(is_gt_tbl_empty(gt(empty_df)))
  expect_false(is_gt_tbl_empty(gt(empty_w_cols_tbl)))
  expect_false(is_gt_tbl_empty(gt(empty_w_cols_df)))
  expect_true(is_gt_tbl_empty(gt(empty_w_rows_tbl)))
  expect_true(is_gt_tbl_empty(gt(empty_w_rows_df)))

  # Expect that a table with columns but no rows in a gt object yields
  # TRUE via `is_gt_tbl_empty_w_cols()`
  expect_true(is_gt_tbl_empty_w_cols(gt(empty_w_cols_tbl)))
  expect_true(is_gt_tbl_empty_w_cols(gt(empty_w_cols_df)))
  expect_false(is_gt_tbl_empty_w_cols(gt(empty_tbl)))
  expect_false(is_gt_tbl_empty_w_cols(gt(empty_df)))
  expect_false(is_gt_tbl_empty_w_cols(gt(empty_w_rows_tbl)))
  expect_false(is_gt_tbl_empty_w_cols(gt(empty_w_rows_df)))

  # Expect that `stop_if_not_gt_tbl()` yields an error for non-`gt_tbl` objects
  expect_no_error(stop_if_not_gt_tbl(gt(exibble)))
  expect_no_error(stop_if_not_gt_tbl(gt_preview(gtcars)))
  expect_error(stop_if_not_gt_tbl(exibble))
  expect_error(stop_if_not_gt_tbl(gt_group(gt(exibble), gt(exibble))))
  expect_error(stop_if_not_gt_tbl(gt(exibble) |> as_raw_html()))

  # Expect that `stop_if_not_gt_group()` yields an error for non-`gt_group` objects
  expect_no_error(stop_if_not_gt_group(gt_group(gt(exibble), gt(exibble))))
  expect_error(stop_if_not_gt_group(gt(exibble)))
  expect_error(stop_if_not_gt_group(gt_preview(gtcars)))
  expect_error(stop_if_not_gt_group(exibble))
  expect_error(stop_if_not_gt_group(gt(exibble) |> as_raw_html()))

  # Expect that `stop_if_not_gt_tbl_or_group()` yields an error if a `gt_tbl` or
  # `gt_group` object isn't provided to it
  expect_no_error(stop_if_not_gt_tbl_or_group(gt(exibble)))
  expect_no_error(stop_if_not_gt_tbl_or_group(gt_preview(gtcars)))
  expect_no_error(stop_if_not_gt_tbl_or_group(gt_group(gt(exibble), gt(exibble))))
  expect_error(stop_if_not_gt_tbl_or_group(exibble))
  expect_error(stop_if_not_gt_tbl_or_group(gt(exibble) |> as_raw_html()))

  skip_if_not_installed("shiny")

  # Expect that `is_html()` returns TRUE only for objects with the `html` class
  expect_true(is_html(html("This is <span>HTML</span>")))
  expect_true(is_html(shiny::HTML("This is <span>HTML</span>")))
  expect_true(is_html(htmltools::HTML("This is <span>HTML</span>")))
  expect_false(is_html("This is <span>HTML</span>"))

  # Expect that `is_html()` returns TRUE only for objects with the `rtf` class
  expect_true(is_rtf(rtf_raw("This is RTF text")))
  expect_false(is_rtf(shiny::HTML("This is RTF text")))
  expect_false(is_rtf(htmltools::HTML("This is RTF text")))
  expect_false(is_rtf("This is RTF text"))
})

test_that("is_nonempty_chr() works for detecting that a vector is non-empty", {

  expect_true(is_nonempty_chr("asdf"))
  expect_true(is_nonempty_chr(c("1", "2")))
  expect_false(is_nonempty_chr(c("", "")))
  expect_false(is_nonempty_chr(c("")))
  expect_false(is_nonempty_chr(""))
  expect_false(is_nonempty_chr(c()))
  expect_false(is_nonempty_chr(NULL))
  expect_true(is_nonempty_chr(c(1, 2)))
  expect_true(is_nonempty_chr(1))
})

test_that("get_date_format() works properly", {

  # Expect that integers (even in character form) work with `get_date_format()`
  # so long as the values are within range
  for (i in 1:41) {
    expect_no_error(get_date_format(date_style = i))
    expect_no_error(get_date_format(date_style = as.character(i)))
  }

  # Expect an error if going out of range or providing improper values
  expect_error(get_date_format(date_style = 42))
  expect_error(get_date_format(date_style = "42"))
  expect_error(get_date_format(date_style = 0))
  expect_error(get_date_format(date_style = "0"))
  expect_error(get_date_format(date_style = -5))
  expect_error(get_date_format(date_style = "-5"))
  expect_error(get_date_format(date_style = NA))
  expect_error(get_date_format(date_style = NULL))
  expect_error(get_date_format(date_style = c(1, 2)))

  # Expect that character-based keywords work with `get_date_format()` so long
  # as the values are from the defined set
  for (format_name in date_formats()[["format_name"]]) {
    expect_no_error(get_date_format(date_style = format_name))
  }

  # Expect an error if providing an improper value
  expect_error(get_date_format(date_style = "daym"))

  # Expect that date formats 1-17 are not flexible
  for (i in 1:17) {
    date_fmt_i <- get_date_format(date_style = i)
    expect_false(inherits(date_fmt_i, "flex_d"))
    expect_false(inherits(date_fmt_i, "date_time_pattern"))
  }

  # Expect that date formats 18-41 are flexible
  for (i in 18:41) {
    date_fmt_i <- get_date_format(date_style = i)
    expect_s3_class(date_fmt_i, "flex_d")
    expect_s3_class(date_fmt_i, "date_time_pattern")
  }
})

test_that("get_time_format() works properly", {

  # Expect that integers (even in character form) work with `get_time_format()`
  # so long as the values are within range
  for (i in 1:25) {
    expect_no_error(get_time_format(time_style = i))
    expect_no_error(get_time_format(time_style = as.character(i)))
  }

  # Expect an error if going out of range or providing improper values
  expect_error(get_time_format(time_style = 26))
  expect_error(get_time_format(time_style = "26"))
  expect_error(get_time_format(time_style = 0))
  expect_error(get_time_format(time_style = "0"))
  expect_error(get_time_format(time_style = -5))
  expect_error(get_time_format(time_style = "-5"))
  expect_error(get_time_format(time_style = NA))
  expect_error(get_time_format(time_style = NULL))
  expect_error(get_time_format(time_style = c(1, 2)))

  # Expect that character-based keywords work with `get_time_format()` so long
  # as the values are from the defined set
  for (format_name in time_formats()[["format_name"]]) {
    expect_no_error(get_time_format(time_style = format_name))
  }

  # Expect an error if providing an improper value
  expect_error(get_time_format(time_style = "Hmsa"))

  # Expect that time formats 1-5 are not flexible
  for (i in 1:5) {
    time_fmt_i <- get_time_format(time_style = i)
    expect_false(inherits(time_fmt_i, "date_time_pattern"))
  }

  # Expect that time formats 6-12 are flexible 24-hour times
  for (i in 6:12) {
    time_fmt_i <- get_time_format(time_style = i)
    expect_s3_class(time_fmt_i, "flex_t24")
    expect_s3_class(time_fmt_i, "date_time_pattern")
  }

  # Expect that although time format 25 is not really 12- or 24-hour time (but
  # floating, with no hours in format), it is still classed as `flex_t24`
  expect_equal(as.character(get_time_format(time_style = 25)), "ms")
  expect_s3_class(get_time_format(time_style = 25), "flex_t24")
  expect_s3_class(get_time_format(time_style = 25), "date_time_pattern")
})

test_that("date_format and time_format are all single strings", {

  # Ensure that all format codes work with `check_format_code()`
  for (format_name in c(date_formats()[["format_name"]], time_formats()[["format_name"]])) {
    expect_no_error(check_string(format_name))
  }
})

test_that("unescape_html() works properly", {

  # Expect that 'unescaping' certain escaped HTML tags is possible with `unescape_html()`
  expect_equal(unescape_html("&lt;span&gt;Text&lt;/span&gt;"), "<span>Text</span>")
  expect_equal(unescape_html("&lt;span&gt;T&amp;T&lt;/span&gt;"), "<span>T&T</span>")
})

test_that("process_footnote_marks() works properly", {

  # With various types of `marks`, we expect correctly formatted marks
  expect_equal(
    process_footnote_marks(1:5, marks = "numbers"),
    c("1", "2", "3", "4", "5")
  )

  expect_equal(
    process_footnote_marks(1:5, marks = "letters"),
    c("a", "b", "c", "d", "e")
  )

  expect_equal(
    process_footnote_marks(1:5, marks = "letters"),
    process_footnote_marks(1:5, marks = letters)
  )

  expect_equal(
    process_footnote_marks(1:5, marks = "LETTERS"),
    c("A", "B", "C", "D", "E")
  )

  expect_equal(
    process_footnote_marks(1:5, marks = "LETTERS"),
    process_footnote_marks(1:5, marks = LETTERS)
  )

  expect_equal(
    process_footnote_marks(1:5, marks = "standard"),
    c("\U0002A", "\U02020", "\U02021", "\U000A7", "\U0002A\U0002A")
  )

  expect_equal(
    process_footnote_marks(1:6, marks = "extended"),
    c("\U0002A", "\U02020", "\U02021", "\U000A7", "\U02016", "\U000B6")
  )

  expect_equal(
    process_footnote_marks(1:12, marks = "extended"),
    c(
      "\U0002A", "\U02020", "\U02021", "\U000A7", "\U02016", "\U000B6",
      "\U0002A\U0002A", "\U02020\U02020", "\U02021\U02021",
      "\U000A7\U000A7", "\U02016\U02016", "\U000B6\U000B6"
    )
  )

  expect_equal(
    process_footnote_marks(1:4, marks = c("one", "two", "three", "four")),
    c("one", "two", "three", "four")
  )

  expect_equal(
    process_footnote_marks(4:1, marks = c("one", "two", "three", "four")),
    c("four", "three", "two", "one")
  )

  expect_equal(
    process_footnote_marks(1:4, marks = 10:13), c("10", "11", "12", "13")
  )

  # Expect spurious outputs for improper values of `x`
  expect_equal(process_footnote_marks(c(0, -1), marks = "letters"), c("", ""))
  expect_equal(process_footnote_marks(c(1.6, 2.9), marks = "letters"), c("a", "b"))
  expect_equal(process_footnote_marks(numeric(0L), marks = "letters"), list())

  # Expect an error if providing an improper inputs
  expect_error(process_footnote_marks(as.character(1:12), marks = "extended"))
  expect_error(process_footnote_marks(list(1, 2), marks = "letters"))
  expect_error(process_footnote_marks(Inf, marks = "letters"))
})

test_that("resolve_border_side() works properly", {

  expect_equal(resolve_border_side("l"), "left")
  expect_equal(resolve_border_side("left"), "left")
  expect_equal(resolve_border_side("r"), "right")
  expect_equal(resolve_border_side("right"), "right")
  expect_equal(resolve_border_side("t"), "top")
  expect_equal(resolve_border_side("top"), "top")
  expect_equal(resolve_border_side("b"), "bottom")
  expect_equal(resolve_border_side("bottom"), "bottom")
  expect_equal(resolve_border_side("a"), "all")
  expect_equal(resolve_border_side("everything"), "all")
  expect_equal(resolve_border_side("all"), "all")
})

test_that("validate_length_one() works for vectors", {

  expect_no_error(validate_length_one("1", "vector"))
  expect_no_error(validate_length_one(1, "vector"))
  expect_no_error(validate_length_one(list(1), "vector"))
  expect_error(validate_length_one(c(), "vector"))
  expect_error(validate_length_one(c(1, 2), "vector"))
  expect_error(validate_length_one(list(), "vector"))
})

test_that("Tables with labeled columns work with certain utility functions", {

  df_df <- data.frame(a = 1:3, b = 6:8, d = c(TRUE, FALSE, TRUE), e = 10:12)
  tbl_df <- dplyr::tibble(a = 1:3, b = 6:8, d = c(TRUE, FALSE, TRUE), e = 10:12)

  attr(df_df$a, "label") <- attr(tbl_df$a, "label") <- "One to three"
  attr(df_df$b, "label") <- attr(tbl_df$b, "label") <- "Six to Eight"
  attr(df_df$d, "label") <- attr(tbl_df$d, "label") <- "True or False"

  expect_true(gt(df_df) |> any_labeled_columns_in_data_tbl())
  expect_true(gt(tbl_df) |> any_labeled_columns_in_data_tbl())
  expect_false(gt(exibble) |> any_labeled_columns_in_data_tbl())
  expect_false(gt(dplyr::tibble()) |> any_labeled_columns_in_data_tbl())
  expect_false(gt(data.frame()) |> any_labeled_columns_in_data_tbl())

  expect_equal(
    gt(df_df) |> get_columns_labels_from_attrs(),
    c("One to three", "Six to Eight", "True or False", "e")
  )

  expect_equal(
    gt(tbl_df) |> get_columns_labels_from_attrs(),
    c("One to three", "Six to Eight", "True or False", "e")
  )

  expect_equal(
    gt(dplyr::tibble()) |> get_columns_labels_from_attrs(),
    character(0L)
  )

  expect_equal(
    gt(exibble) |> get_columns_labels_from_attrs(),
    c(
      "num", "char", "fctr", "date", "time", "datetime",
      "currency", "row", "group"
    )
  )
})

test_that("markdown_to_rtf() works", {

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

test_that("Escaping is working when using `markdown_to_rtf()`", {

  md_rtf("\\b{}", "\\'5cb\\'7b\\'7d")
  md_rtf("&lt;&amp;", "<&")
})

test_that("str_substitute() works well", {
  expect_equal(
    str_substitute(c("223", "223"), c(1, 2), 2),
    c("22", "2")
  )
  expect_snapshot(error = TRUE, {
    str_substitute(c("223", "223", "224"), c(1, 2), 2)
    str_substitute(c("223", "223", "224"), c(1), c(2, 3))
    str_substitute(c("223", "223", "224", "225"), c(1, 2, 3, 4), c(2, 3))
  })
})

test_that("apply_to_grp works", {

  # create gt group example
  gt_tbl <- exibble |> gt()
  gt_group <- gt_group(gt_tbl, gt_tbl)

  # create arguments - invalid function
  arg_list <- list("fake_function", data = "gt_group(gt_tbl, gt_tbl)", align = c("center"))
  expect_error(apply_to_grp(gt_group, arg_list), '"fake_function" is not an exported gt function')

  # create arguments - cols_align function
  arg_list <- list("cols_align", data = "gt_group(gt_tbl, gt_tbl)", align = c("center"))

  # aligned gt_tbl
  aligned_tbl <-
    gt_tbl |>
    cols_align(
      align = "center"
    )

  # aligned group 2 ways: one via apply_to_group one via individual aligned tables
  aligned_group <- apply_to_grp(gt_group, arg_list)

  expect_identical(aligned_group, gt_group(aligned_tbl, aligned_tbl))

  # error in table 2
  gt_tbl2 <-
    exibble |>
    dplyr::select(-num) |>
    gt()

  gt_group_error <- gt_group(gt_tbl, gt_tbl2)

  arg_list <-
    list(
      "cols_align",
      data = "gt_group(gt_tbl, gt_tbl)",
      align = c("center"),
      columns = "num"
    )

  # captures error of individual table and table number
  expect_snapshot(apply_to_grp(gt_group_error, arg_list), error=TRUE)
})
