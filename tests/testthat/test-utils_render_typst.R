# Unit tests for Typst rendering utilities

# -- escape_typst() -----------------------------------------------------------

test_that("escape_typst() escapes all Typst special characters", {

  # Each of these characters needs a backslash in Typst markup mode
  expect_equal(escape_typst("a # b"), "a \\# b")
  expect_equal(escape_typst("a $ b"), "a \\$ b")
  expect_equal(escape_typst("a @ b"), "a \\@ b")
  expect_equal(escape_typst("a < b"), "a \\< b")
  expect_equal(escape_typst("a > b"), "a \\> b")
  expect_equal(escape_typst("a * b"), "a \\* b")
  expect_equal(escape_typst("a _ b"), "a \\_ b")
  expect_equal(escape_typst("a ~ b"), "a \\~ b")
  expect_equal(escape_typst("a [ b"), "a \\[ b")
  expect_equal(escape_typst("a ] b"), "a \\] b")
  expect_equal(escape_typst("a \\ b"), "a \\\\ b")
})

test_that("escape_typst() escapes multiple special chars in one string", {
  expect_equal(
    escape_typst("price is $10 & *bold*"),
    "price is \\$10 & \\*bold\\*"
  )
})

test_that("escape_typst() handles empty and NA input", {
  expect_equal(escape_typst(""), "")
  expect_equal(escape_typst(character(0)), character(0))
  expect_equal(escape_typst(NA_character_), NA_character_)
})

test_that("escape_typst() handles vector input", {
  result <- escape_typst(c("a # b", "c $ d", NA_character_))
  expect_equal(result, c("a \\# b", "c \\$ d", NA_character_))
})

test_that("escape_typst() leaves safe text unchanged", {
  expect_equal(escape_typst("hello world"), "hello world")
  expect_equal(escape_typst("123.45"), "123.45")
})

# -- markdown_to_typst() ------------------------------------------------------

test_that("markdown_to_typst() converts bold", {
  expect_equal(markdown_to_typst("**bold**"), "*bold*")
  expect_equal(markdown_to_typst("__bold__"), "*bold*")
})

test_that("markdown_to_typst() converts italic", {
  expect_equal(markdown_to_typst("*italic*"), "_italic_")
  expect_equal(markdown_to_typst("_italic_"), "_italic_")
})

test_that("markdown_to_typst() converts bold italic", {
  expect_equal(markdown_to_typst("***bold italic***"), "*_bold italic_*")
})

test_that("markdown_to_typst() converts strikethrough", {
  expect_equal(markdown_to_typst("~~struck~~"), "#strike[struck]")
})

test_that("markdown_to_typst() converts links", {
  expect_equal(
    markdown_to_typst("[text](https://example.com)"),
    "#link(\"https://example.com\")[text]"
  )
})

test_that("markdown_to_typst() preserves inline code", {
  expect_equal(markdown_to_typst("`code`"), "`code`")
})

test_that("markdown_to_typst() handles plain text (no markdown)", {
  expect_equal(markdown_to_typst("plain text"), "plain text")
})

# -- css_color_to_typst() -----------------------------------------------------

test_that("css_color_to_typst() converts hex colors", {
  expect_equal(css_color_to_typst("#FF0000"), "rgb(\"#FF0000\")")
  expect_equal(css_color_to_typst("#00ff00"), "rgb(\"#00ff00\")")
})

test_that("css_color_to_typst() converts 3-digit hex", {
  result <- css_color_to_typst("#F00")
  expect_match(result, "rgb\\(")
})

test_that("css_color_to_typst() handles rgba", {
  result <- css_color_to_typst("rgba(255, 0, 0, 0.5)")
  expect_match(result, "rgb\\(")
})

test_that("css_color_to_typst() handles named colors", {
  result <- css_color_to_typst("red")
  # Should convert to hex to avoid Typst/CSS named color mismatches
  expect_match(result, "rgb\\(")
})

# -- css_length_to_typst() ----------------------------------------------------

test_that("css_length_to_typst() converts px to pt", {
  expect_equal(css_length_to_typst("100px"), "75.0pt")
  expect_equal(css_length_to_typst("10px"), "7.5pt")
})

test_that("css_length_to_typst() passes through pt", {
  expect_equal(css_length_to_typst("12pt"), "12pt")
})

test_that("css_length_to_typst() passes through other units", {
  expect_equal(css_length_to_typst("2cm"), "2cm")
  expect_equal(css_length_to_typst("25mm"), "25mm")
  expect_equal(css_length_to_typst("1in"), "1in")
  expect_equal(css_length_to_typst("1.5em"), "1.5em")
})

test_that("css_length_to_typst() handles percentages", {
  expect_equal(css_length_to_typst("50%"), "50%")
})
