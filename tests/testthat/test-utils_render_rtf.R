library(gt)

# RTF utility unit tests ------------------------------------------------------

test_that("rtf_raw() produces rtf_text-classed string", {

  result <- rtf_raw("\\bold hello")
  expect_s3_class(result, "rtf_text")
  expect_equal(as.character(result), "\\bold hello")
})

test_that("rtf_key() produces correct RTF control words", {

  expect_equal(as.character(rtf_key("b")), "\\b")
  expect_equal(as.character(rtf_key("f", 0)), "\\f0")
  expect_equal(as.character(rtf_key("b", space = TRUE)), "\\b ")
})

test_that("escape_rtf() escapes RTF special characters", {

  # Backslash
  expect_equal(as.character(escape_rtf("\\")), "\\'5c")

  # Braces
  expect_equal(as.character(escape_rtf("{")), "\\'7b")
  expect_equal(as.character(escape_rtf("}")), "\\'7d")

  # Plain text is unchanged
  result_plain <- escape_rtf("hello world")
  expect_equal(as.character(result_plain), "hello world")

  # NA passthrough
  result_na <- escape_rtf(NA_character_)
  expect_true(is.na(result_na))

  # Empty input passthrough
  result_empty <- escape_rtf(character(0))
  expect_length(result_empty, 0)
})

test_that("escape_rtf_unicode() encodes non-ASCII characters", {

  # ASCII is unchanged
  expect_equal(escape_rtf_unicode("hello"), "hello")

  # Non-ASCII gets RTF unicode escaping
  result <- escape_rtf_unicode("é")  # é
  expect_true(grepl("\\\\u", result))
})

test_that("rtf_color() builds RTF color entries from hex or named colors", {

  result_hex <- rtf_color(color = "#FF0000")
  expect_s3_class(result_hex, "rtf_color")
  expect_true(grepl("\\red255", unlist(result_hex), fixed = TRUE))
  expect_true(grepl("\\green0", unlist(result_hex), fixed = TRUE))
  expect_true(grepl("\\blue0", unlist(result_hex), fixed = TRUE))

  result_rgb <- rtf_color(rgb = c(0L, 128L, 255L))
  expect_s3_class(result_rgb, "rtf_color")
  expect_true(grepl("\\red0", unlist(result_rgb), fixed = TRUE))
  expect_true(grepl("\\blue255", unlist(result_rgb), fixed = TRUE))
})

test_that("parse_length_str() parses CSS-style length strings", {

  result <- parse_length_str("120px")
  expect_equal(result$value, 120)
  expect_equal(result$unit, "px")

  result2 <- parse_length_str("1.5in")
  expect_equal(result2$value, 1.5)
  expect_equal(result2$unit, "in")

  # Multiple values
  result3 <- parse_length_str(c("100px", "2in"))
  expect_equal(nrow(result3), 2)

  # Unparseable input errors
  expect_error(parse_length_str("bad_value"), class = "rlang_error")

  # Negative values are not allowed by default
  expect_error(parse_length_str("-10px"), class = "rlang_error")

  # But allowed when allow_negative = TRUE
  result4 <- parse_length_str("-10px", allow_negative = TRUE)
  expect_equal(result4$value, -10)
})

test_that("abs_len_to_twips() converts length data frames to twips", {

  input <- dplyr::tibble(value = c(100, 1), unit = c("px", "in"))
  result <- abs_len_to_twips(input)
  expect_equal(result$unit, c("tw", "tw"))
  expect_equal(result$value[1], 100 * 15)  # 100px = 1500tw
  expect_equal(result$value[2], 1440)       # 1in = 1440tw
})

test_that("No error is created with gtsave() to rtf (#1233)", {

  rtf_file <- withr::local_tempfile(fileext = ".rtf")

  df <- data.frame(
    group = c("a", "a", "b", "b"),
    val = c(1, 2, 3, 4),
    char = c("AAA", "AAA", "BBB", "BBB")
  )

  a_gt <-
    df |>
    gt(groupname_col = "group") |>
    cols_label(
      val = "Value"
    ) |>
    summary_rows(
      columns = val,
      fns = "mean"
    ) |>
    grand_summary_rows(
      columns = val,
      fns = "mean"
    )

  expect_no_error(gtsave(a_gt, rtf_file))
})
