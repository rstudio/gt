skip_on_cran()

test_that("the `sub_missing()` function works correctly", {

  # Create an input table with two columns, both numeric
  data_tbl <-
    dplyr::tibble(
      num_1 = c(NA, 74, NA, 93, NA, 76, NA),
      num_2 = c(34, 74, 23, 93, 35, 76, 57)
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect that the object has the correct classes
  expect_s3_class(tab, c("gt_tbl", "data.frame"))

  # Extract vectors from the table object for comparison
  # to the original dataset
  num_1 <- (tab %>% dt_data_get())[["num_1"]]
  num_2 <- (tab %>% dt_data_get())[["num_2"]]

  # Expect the extracted values to match those of the
  # original dataset
  expect_equal(data_tbl$num_1, num_1)
  expect_equal(data_tbl$num_2, num_2)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% sub_missing(columns = "num_3"))

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("---", "74", "---", "93", "---", "76", "---")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("\U02014", "74", "\U02014", "93", "\U02014", "76", "\U02014")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "74", "—", "93", "—", "76", "—")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("\\'97", "74", "\\'97", "93", "\\'97", "76", "\\'97")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("--", "74", "--", "93", "--", "76", "--")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("\U02013", "74", "\U02013", "93", "\U02013", "76", "\U02013")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("\U02013", "74", "\U02013", "93", "\U02013", "76", "\U02013")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "--") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("\\'96", "74", "\\'96", "93", "\\'96", "76", "\\'96")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_2") %>%
       render_formats_test(context = "default"))[["num_2"]],
    c("34", "74", "23", "93", "35", "76", "57")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "a") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("a", "74", "a", "93", "a", "76", "a")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = md("**a** *b*")) %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("**a** *b*", "74", "**a** *b*", "93", "**a** *b*", "76", "**a** *b*")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = md("**a** *b*")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "<strong>a</strong> <em>b</em>", "74", "<strong>a</strong> <em>b</em>",
      "93", "<strong>a</strong> <em>b</em>", "76", "<strong>a</strong> <em>b</em>"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = md("**a** *b*")) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c(
      "\\textbf{a} \\emph{b}", "74", "\\textbf{a} \\emph{b}", "93",
      "\\textbf{a} \\emph{b}", "76", "\\textbf{a} \\emph{b}"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = md("**a** *b*")) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c(
      "{\\b a} {\\i b}", "74", "{\\b a} {\\i b}", "93", "{\\b a} {\\i b}",
      "76", "{\\b a} {\\i b}"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "<a> & <b>") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "&lt;a&gt; &amp; &lt;b&gt;", "74", "&lt;a&gt; &amp; &lt;b&gt;",
      "93", "&lt;a&gt; &amp; &lt;b&gt;", "76", "&lt;a&gt; &amp; &lt;b&gt;"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = " ~$ {a} & {b} $~") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c(
      " \\textasciitilde{}\\$ \\{a\\} \\& \\{b\\} \\$\\textasciitilde{}",
      "74", " \\textasciitilde{}\\$ \\{a\\} \\& \\{b\\} \\$\\textasciitilde{}",
      "93", " \\textasciitilde{}\\$ \\{a\\} \\& \\{b\\} \\$\\textasciitilde{}",
      "76", " \\textasciitilde{}\\$ \\{a\\} \\& \\{b\\} \\$\\textasciitilde{}"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", missing_text = "\\emdash\\emdash\\emdash\\emdash") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c(
      "\\'5cemdash\\'5cemdash\\'5cemdash\\'5cemdash", "74",
      "\\'5cemdash\\'5cemdash\\'5cemdash\\'5cemdash",
      "93", "\\'5cemdash\\'5cemdash\\'5cemdash\\'5cemdash", "76",
      "\\'5cemdash\\'5cemdash\\'5cemdash\\'5cemdash"
    )
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = "num_1", rows = num_2 < 50) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("\U02014", "74", "\U02014", "93", "\U02014", "76", "NA")
  )

  # Format columns with `fmt_number()` then use
  # `sub_missing()` on all columns (the two functions
  # shouldn't wipe out formatting on cells)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       sub_missing(columns = everything()) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("\U02014", "74.000", "\U02014", "93.000", "\U02014", "76.000", "\U02014")
  )

  expect_equal(
    (tab %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       sub_missing(columns = everything()) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "$74.000$", "—", "$93.000$", "—", "$76.000$", "—")
  )

  expect_equal(
    (tab %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       sub_missing(columns = everything()) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("\\'97", "74.000", "\\'97", "93.000", "\\'97", "76.000", "\\'97")
  )

  # Reverse the ordering: use `sub_missing()` first
  # then `fmt_number()`; expect the same output as before
  expect_equal(
    (tab %>%
       sub_missing(columns = everything()) %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("\U02014", "74.000", "\U02014", "93.000", "\U02014", "76.000", "\U02014")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = everything()) %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("—", "$74.000$", "—", "$93.000$", "—", "$76.000$", "—")
  )

  expect_equal(
    (tab %>%
       sub_missing(columns = everything()) %>%
       fmt_number(
         columns = everything(),
         decimals = 3
       ) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("\\'97", "74.000", "\\'97", "93.000", "\\'97", "76.000", "\\'97")
  )
})

test_that("the `sub_zero()` function works correctly", {

  # Create an input data frame with two columns: one numeric, one character
  data_tbl <-
    dplyr::tibble(
      num_1 = c(NA, 74, NA, 0, NA, 0.0001, NA),
      lett = LETTERS[1:7]
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% sub_zero(columns = "num_3"))

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1") %>%
       render_formats_test(context = "default"))[["num_1"]],
    c("NA", "74.0000", "NA", "nil", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("NA", "74.0000", "NA", "nil", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("NA", "74.0000", "NA", "nil", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("NA", "74.0000", "NA", "nil", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1", zero_text = md("*nil*")) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("NA", "74.0000", "NA", "<em>nil</em>", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1", zero_text = md("*nil*")) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("NA", "74.0000", "NA", "\\emph{nil}", "NA", "0.0001", "NA")
  )

  expect_equal(
    (tab %>%
       sub_zero(columns = "num_1", zero_text = md("*nil*")) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("NA", "74.0000", "NA", "{\\i nil}", "NA", "0.0001", "NA")
  )

  expect_equal(
    tab %>% sub_zero(columns = "lett") %>% render_as_html(),
    tab %>% render_as_html()
  )

  # Format columns with `fmt_number()` then use
  # `sub_zero()` on all columns (the two functions
  # shouldn't wipe out formatting on cells)
  expect_equal(
    (tab %>%
       fmt_number(
         columns = num_1,
         decimals = 3
       ) %>%
       sub_zero(columns = everything()) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("NA", "74.000", "NA", "nil", "NA", "0.000", "NA")
  )

  # Reverse the ordering: use `sub_zero()` first
  # then `fmt_number()`; expect the same output as before
  expect_equal(
    (tab %>%
       sub_zero(columns = everything()) %>%
       fmt_number(
         columns = num_1,
         decimals = 3
       ) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("NA", "74.000", "NA", "nil", "NA", "0.000", "NA")
  )
})

test_that("the `sub_small_vals()` function works correctly", {

  # Create an input table with three columns
  data_tbl <-
    dplyr::tibble(
      num_1 = c(-0.0001, 74, NA, 0, 5e12, 0.0001, 84.34),
      int_1 = c(1L, -900L, 800L, 5L, NA, 0L, -32L),
      lett = LETTERS[1:7]
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% sub_small_vals(columns = "num_3"))

  expect_equal(
    (tab %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("-1.000e-04", "7.400e+01", "NA", "0.000e+00", "5.000e+12", "&lt;0.01", "8.434e+01")
  )

  expect_equal(
    (tab %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("-1.000e-04", "7.400e+01", "NA", "0.000e+00", "5.000e+12", "<0.01", "8.434e+01")
  )

  expect_equal(
    (tab %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("-1.000e-04", "7.400e+01", "NA", "0.000e+00", "5.000e+12", "<0.01", "8.434e+01")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", "5,000,000,000,000.00", "&lt;0.01", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$0.00$", "$74.00$", "NA", "$0.00$", "$5,000,000,000,000.00$", "<0.01", "$84.34$")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", "5,000,000,000,000.00", "<0.01", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("0.00", "&lt;100", "NA", "0.00", "5,000,000,000,000.00", "&lt;100", "&lt;100")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$0.00$", "<100", "NA", "$0.00$", "$5,000,000,000,000.00$", "<100", "<100")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("0.00", "<100", "NA", "0.00", "5,000,000,000,000.00", "<100", "<100")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", sign = "-") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "&lt;<em>abs</em>(-0.01)", "74.00", "NA", "0.00",
      "5,000,000,000,000.00", "0.00", "84.34"
    )
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", sign = "-") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c(
      "\\textless{}\\emph{abs}(-0.01)", "$74.00$", "NA", "$0.00$",
      "$5,000,000,000,000.00$", "$0.00$", "$84.34$"
    )
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", sign = "-") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c(
      "<{\\i abs}(-0.01)", "74.00", "NA", "0.00", "5,000,000,000,000.00",
      "0.00", "84.34"
    )
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "smol", sign = "-") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("smol", "74.00", "NA", "0.00", "5,000,000,000,000.00", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "smol", sign = "-") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("smol", "$74.00$", "NA", "$0.00$", "$5,000,000,000,000.00$", "$0.00$", "$84.34$")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "smol", sign = "-") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("smol", "74.00", "NA", "0.00", "5,000,000,000,000.00", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "<<{x}>>", sign = "-") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c(
      "&lt;&lt;0.01&gt;&gt;", "74.00", "NA", "0.00",
      "5,000,000,000,000.00", "0.00", "84.34"
    )
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "{{{x}}}", sign = "-") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c(
      "\\{\\{0.01\\}\\}", "$74.00$", "NA", "$0.00$", "$5,000,000,000,000.00$",
      "$0.00$", "$84.34$"
    )
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_small_vals(columns = "num_1", small_pattern = "\\d{x}\\d", sign = "-") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c(
      "\\'5cd0.01\\'5cd", "74.00", "NA", "0.00", "5,000,000,000,000.00",
      "0.00", "84.34"
    )
  )

  # Expect that the sign of the `threshold` value doesn't affect anything
  expect_equal(
    tab %>%
      sub_small_vals(columns = "num_1", threshold = 3, sign = "-") %>%
      render_as_html(),
    tab %>%
      sub_small_vals(columns = "num_1", threshold = -3, sign = "-") %>%
      render_as_html()
  )

  expect_equal(
    tab %>%
      sub_small_vals(columns = "num_1", threshold = 10, sign = "+") %>%
      render_as_html(),
    tab %>%
      sub_small_vals(columns = "num_1", threshold = -10, sign = "+") %>%
      render_as_html()
  )

  expect_equal(
    tab %>% sub_small_vals(columns = "lett") %>% render_as_html(),
    tab %>% render_as_html()
  )

  # Expect an error if an invalid `sign` is used
  expect_error(tab %>% sub_small_vals(columns = "num_1", sign = "?"))
})

test_that("the `sub_large_vals()` function works correctly", {

  # Create an input table with three columns
  data_tbl <-
    dplyr::tibble(
      num_1 = c(-0.0001, 74, NA, 0, 5e12, 0.0001, 84.34),
      int_1 = c(1L, -100000L, 800L, 5L, NA, 0L, -32L),
      lett = LETTERS[1:7]
    )

  # Create a `gt_tbl` object with `gt()` and the
  # `data_tbl` dataset
  tab <- gt(data_tbl)

  # Expect an error when attempting to format a column
  # that does not exist
  expect_error(tab %>% sub_large_vals(columns = "num_3"))

  expect_equal(
    (tab %>%
       sub_large_vals(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("-0.0001", "74.0000", "NA", "0.0000", "≥1e+12", "0.0001",
      "84.3400")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1") %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", "≥1e+12", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1") %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$0.00$", "$74.00$", "NA", "$0.00$", "$\\geq$1e+12", "$0.00$", "$84.34$")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1") %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", ">=1e+12", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "html"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", "≥100", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "latex"))[["num_1"]],
    c("$0.00$", "$74.00$", "NA", "$0.00$", "$\\geq$100", "$0.00$", "$84.34$")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "num_1", threshold = 100) %>%
       render_formats_test(context = "rtf"))[["num_1"]],
    c("0.00", "74.00", "NA", "0.00", ">=100", "0.00", "84.34")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 500, sign = "-") %>%
       render_formats_test(context = "html"))[["int_1"]],
    c("1", "≤-500", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 500, sign = "-") %>%
       render_formats_test(context = "latex"))[["int_1"]],
    c("1", "$\\leq$-500", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 500, sign = "-") %>%
       render_formats_test(context = "rtf"))[["int_1"]],
    c("1", "<=-500", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 400, large_pattern = "big", sign = "-") %>%
       render_formats_test(context = "html"))[["int_1"]],
    c("1", "big", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 400, large_pattern = "big", sign = "-") %>%
       render_formats_test(context = "latex"))[["int_1"]],
    c("1", "big", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 400, large_pattern = "big", sign = "-") %>%
       render_formats_test(context = "rtf"))[["int_1"]],
    c("1", "big", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 300, large_pattern = "<<{x}>>", sign = "-") %>%
       render_formats_test(context = "html"))[["int_1"]],
    c("1", "&lt;&lt;300&gt;&gt;", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 300, large_pattern = "{{{x}}}", sign = "-") %>%
       render_formats_test(context = "latex"))[["int_1"]],
    c("1", "\\{\\{300\\}\\}", "800", "5", "NA", "0", "-32")
  )

  expect_equal(
    (tab %>%
       fmt_number(columns = num_1) %>%
       sub_large_vals(columns = "int_1", threshold = 300, large_pattern = "\\d{x}\\d", sign = "-") %>%
       render_formats_test(context = "rtf"))[["int_1"]],
    c("1", "\\'5cd300\\'5cd", "800", "5", "NA", "0", "-32")
  )

  # Expect that the order of `fmt_*()` and `sub_*()` functions shouldn't
  # make a different in the final outputs
  expect_equal(
    tab %>%
      fmt_integer(columns = "int_1") %>%
      sub_large_vals(columns = "int_1", threshold = 3, sign = "-") %>%
      render_as_html(),
    tab %>%
      sub_large_vals(columns = "int_1", threshold = -3, sign = "-") %>%
      fmt_integer(columns = "int_1") %>%
      render_as_html()
  )

  # Expect that the sign of the `threshold` value doesn't affect anything
  expect_equal(
    tab %>%
      sub_large_vals(columns = "int_1", threshold = 3, sign = "-") %>%
      render_as_html(),
    tab %>%
      sub_large_vals(columns = "int_1", threshold = -3, sign = "-") %>%
      render_as_html()
  )

  expect_equal(
    tab %>%
      sub_large_vals(columns = "num_1", threshold = 10, sign = "+") %>%
      render_as_html(),
    tab %>%
      sub_large_vals(columns = "num_1", threshold = -10, sign = "+") %>%
      render_as_html()
  )

  expect_equal(
    tab %>% sub_large_vals(columns = "lett") %>% render_as_html(),
    tab %>% render_as_html()
  )

  # Expect an error if an invalid `sign` is used
  expect_error(tab %>% sub_large_vals(columns = "num_1", sign = "?"))
})
