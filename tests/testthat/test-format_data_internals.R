library(gt)

test_that("gcd() computes the greatest common divisor correctly", {

  expect_equal(gcd(12, 8), 4)
  expect_equal(gcd(100, 25), 25)
  expect_equal(gcd(7, 1), 1)
  expect_equal(gcd(9, 9), 9)
  expect_equal(gcd(48, 18), 6)
})

test_that("round_gt() rounds using the round-half-up algorithm", {

  # Standard cases
  expect_equal(round_gt(2.5), 3)
  expect_equal(round_gt(3.5), 4)
  expect_equal(round_gt(1.5), 2)
  expect_equal(round_gt(2.4), 2)
  expect_equal(round_gt(2.6), 3)

  # With digits
  expect_equal(round_gt(1.235, digits = 2), 1.24)
  expect_equal(round_gt(1.225, digits = 2), 1.23)

  # Negative values
  expect_equal(round_gt(-2.5), -3)
  expect_equal(round_gt(-1.5), -2)

  # Vectorized
  expect_equal(round_gt(c(0.5, 1.5, 2.5)), c(1, 2, 3))
})

test_that("make_frac() generates fraction strings from numeric values", {

  # Simple fractions
  result <- make_frac(0.5, 2)
  expect_equal(result, "1/2")

  result <- make_frac(0.25, 4)
  expect_equal(result, "1/4")

  result <- make_frac(0.75, 4)
  expect_equal(result, "3/4")

  # Fractional part rounds up to equal denominator -> "1"
  result <- make_frac(0.99, 4)
  expect_equal(result, "1")

  # Zero fractional part -> "0"
  result <- make_frac(0.0, 4)
  expect_equal(result, "0")

  # Without simplification
  result <- make_frac(0.5, 4, simplify = FALSE)
  expect_equal(result, "2/4")
})

test_that("index_repeat() repeats marks from a set", {

  set <- c("a", "b", "c")
  # First cycle
  expect_equal(index_repeat(1, set), "a")
  expect_equal(index_repeat(2, set), "b")
  expect_equal(index_repeat(3, set), "c")

  # Second cycle - repeat marks
  expect_equal(index_repeat(4, set), "aa")
  expect_equal(index_repeat(5, set), "bb")
  expect_equal(index_repeat(6, set), "cc")
})

test_that("get_letters_from_div() converts integer position to Excel-style letters", {

  set <- LETTERS
  expect_equal(get_letters_from_div(1, set), "A")
  expect_equal(get_letters_from_div(26, set), "Z")
  expect_equal(get_letters_from_div(27, set), "AA")
  expect_equal(get_letters_from_div(28, set), "AB")
  expect_equal(get_letters_from_div(702, set), "ZZ")

  # NA input returns NA
  expect_equal(get_letters_from_div(NA_real_, set), NA_character_)
})

test_that("index_excel() converts numeric positions to Excel-style letter strings", {

  set <- LETTERS
  result <- index_excel(c(1, 26, 27, 28), set)
  expect_equal(result, c("A", "Z", "AA", "AB"))

  # NA in input gives NA in output
  result_na <- index_excel(c(1, NA_real_, 3), set)
  expect_equal(result_na, c("A", NA_character_, "C"))
})

test_that("convert_to_px() converts various CSS units to pixels", {

  expect_equal(convert_to_px("100px"), 100)
  expect_equal(convert_to_px("72pt"), 96)    # 72pt * 4/3 = 96px
  expect_equal(convert_to_px("1in"), 96)
  # EM approximation: 1em = 16px per the conversion table
  expect_equal(convert_to_px("1em"), 16)

  # Unknown unit triggers error
  expect_error(convert_to_px("100vw"), class = "rlang_error")
})

test_that("convert_to_pt() converts to points (pt = 0.75 * px)", {

  expect_equal(convert_to_pt("100px"), 75)
  expect_equal(convert_to_pt("1in"), 72)  # 1in = 96px * 0.75 = 72pt
})

test_that("convert_to_twips() converts to twips (15 twips per pixel)", {

  expect_equal(convert_to_twips("100px"), 1500)
  expect_equal(convert_to_twips("1in"), 1440)  # 96px * 15 = 1440
})


test_that("parse_md_urls() extracts href and label from markdown links", {

  # Markdown link present
  result <- parse_md_urls("[GT Package](https://gt.rstudio.com)")
  expect_equal(result$href, "https://gt.rstudio.com")
  expect_equal(result$label, "GT Package")

  # Plain text (no markdown link)
  result_plain <- parse_md_urls("https://gt.rstudio.com")
  expect_equal(result_plain$href, "https://gt.rstudio.com")
  expect_equal(result_plain$label, "https://gt.rstudio.com")

  # Mixed vector
  texts <- c("[Click here](https://example.com)", "plain text")
  result_mixed <- parse_md_urls(texts)
  expect_equal(result_mixed$href, c("https://example.com", "plain text"))
  expect_equal(result_mixed$label, c("Click here", "plain text"))
})


test_that("make_span_with_color() wraps text in a colored span", {

  result <- make_span_with_color("hello", color = "red")
  expect_equal(result, "<span style=\"color:red;\">hello</span>")

  # NULL color returns text as-is
  result_null <- make_span_with_color("hello", color = NULL)
  expect_equal(result_null, "hello")

  # NA color returns text as-is
  result_na <- make_span_with_color("hello", color = NA)
  expect_equal(result_na, "hello")

  # NULL text returns NULL
  result_null_text <- make_span_with_color(NULL, color = "red")
  expect_null(result_null_text)
})


test_that("generate_email_links() produces mailto anchor HTML", {

  result <- generate_email_links(
    "user@example.com",
    anchor_attr = "",
    label_str = "Email Me"
  )
  expect_true(grepl("mailto:user@example.com", result))
  expect_true(grepl("Email Me", result))
  expect_true(grepl("<a", result))
  expect_true(grepl("</a>", result))
  expect_true(grepl("white-space: pre", result))
})


test_that("validate_duration_input_units() accepts valid units and errors on invalid", {

  expect_null(validate_duration_input_units(NULL))
  expect_equal(validate_duration_input_units("hours"), "hours")
  expect_equal(validate_duration_input_units("secs"), "secs")
  expect_equal(validate_duration_input_units("minutes"), "minutes")
  expect_error(validate_duration_input_units("milliseconds"))
  expect_error(validate_duration_input_units("months"))
})

test_that("normalize_duration_input_units() maps aliases to canonical names", {

  expect_equal(normalize_duration_input_units("secs"), "seconds")
  expect_equal(normalize_duration_input_units("mins"), "minutes")
  expect_equal(normalize_duration_input_units("hours"), "hours")
  expect_equal(normalize_duration_input_units("days"), "days")
})

test_that("normalize_duration_output_units() deduplicates and orders from large to small", {

  result <- normalize_duration_output_units(c("seconds", "hours", "minutes"))
  expect_equal(result, c("hours", "minutes", "seconds"))

  # Aliases are normalized too
  result2 <- normalize_duration_output_units(c("secs", "mins"))
  expect_equal(result2, c("minutes", "seconds"))

  # Duplicates are removed
  result3 <- normalize_duration_output_units(c("hours", "hours", "minutes"))
  expect_equal(result3, c("hours", "minutes"))
})


test_that("get_si_labels() returns correct prefix lists for engineering and decimal modes", {

  eng <- get_si_labels("engineering")
  expect_type(eng, "list")
  expect_named(eng, c("exponents", "symbols"))
  expect_true(3 %in% eng$exponents)
  expect_false(-1 %in% eng$exponents)   # engineering only uses powers of 1000
  expect_true("k" %in% eng$symbols)
  expect_true("M" %in% eng$symbols)

  dec <- get_si_labels("decimal")
  expect_type(dec, "list")
  expect_true(-1 %in% dec$exponents)   # decimal includes d (deci)
  expect_true("d" %in% dec$symbols)
})


test_that("format_tf_by_context() maps TRUE/FALSE/NA to label strings", {

  x <- c(TRUE, FALSE, NA)

  result_plain <- format_tf_by_context(
    x, true_val = "Yes", false_val = "No", na_val = "—",
    colors = NULL, pattern = "{x}", context = "plain"
  )
  expect_equal(result_plain, c("Yes", "No", "—"))

  # NA val NULL → NA in output
  result_null_na <- format_tf_by_context(
    c(TRUE, NA), true_val = "Yes", false_val = "No", na_val = NULL,
    colors = NULL, pattern = "{x}", context = "plain"
  )
  expect_true(is.na(result_null_na[2]))
})

test_that("format_tf_by_context() applies color spans in html context", {

  x <- c(TRUE, FALSE)

  result_html <- format_tf_by_context(
    x, true_val = "Yes", false_val = "No", na_val = NULL,
    colors = c("green", "red", NA), pattern = "{x}", context = "html"
  )
  expect_true(grepl("color:green", result_html[1]))
  expect_true(grepl("color:red", result_html[2]))
})
