test_data <-
  gtcars |>
  dplyr::select(model, year, trim, mfr) |>
  dplyr::slice(1:10)

# no stub with spanner
no_stub <-
  test_data |>
  gt() |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# single rowname stub with spanner
single_stub <-
  test_data |>
  gt(rowname_col = "mfr") |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# multiple rowname stubs with spanner
multi_stub <-
  test_data |>
  gt(rowname_col = c("mfr", "model")) |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# group and multiple rowname stubs
group_and_stub <-
  test_data |>
  dplyr::mutate(group = "group") |>
  gt(groupname_col = "group", rowname_col = c("mfr", "model")) |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# hidden columns
hidden_columns <-
  test_data |>
  gt() |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  cols_hide(columns = "year") |>
  tab_spanner(
    label = "a spanner",
    columns = c(model, trim)
  )

# hidden stub columns
hidden_stub <-
  test_data |>
  gt(rowname_col = c("mfr", "year")) |>
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) |>
  cols_hide(columns = "year") |>
  tab_spanner(
    label = "a spanner",
    columns = c(model, trim)
  )

test_that("spanner widths are calculated correctly",{

  # All spanner widths should be year + trim = 22
  pattern <- "\\{\\\\dimexpr\\s*0\\.22.*?\\}\\{\\\\centering \\{a spanner\\}"

  # No stub with spanner
  expect_match_latex(no_stub, pattern)

  # Single rowname stub with spanner
  expect_match_latex(single_stub, pattern)

  # Multiple rowname stubs with spanner
  expect_match_latex(multi_stub, pattern)

  # Group and multiple rowname stubs
  expect_match_latex(group_and_stub, pattern)

  # Hidden columns should add to model + trim = 30
  pattern_2 <- "\\{\\\\dimexpr\\s*0\\.30.*?\\}\\{\\\\centering \\{a spanner\\}"

  # Hidden columns
  expect_match_latex(hidden_columns, pattern_2)

  # Hidden stub columns
  expect_match_latex(hidden_stub, pattern_2)
})

test_that("md() with <br> in column label does not produce \\linewidth in LaTeX output", {

  gt_tbl <-
    countrypops |>
    head(5) |>
    gt() |>
    cols_label(country_code_2 ~ md("country<br>code"))

  latex_out <- as.character(as_latex(gt_tbl))

  # The header should use \shortstack for line breaking, but NOT \parbox{\linewidth}
  expect_false(grepl("\\parbox{\\linewidth}", latex_out, fixed = TRUE))
  expect_true(grepl("\\shortstack", latex_out, fixed = TRUE))
})

test_that("Empty table shows no-data message in LaTeX output (#1881)", {

  empty_tbl <- dplyr::tibble(x = character(), y = numeric()) |> gt()

  latex_out <- as.character(as_latex(empty_tbl))

  # Default locale message is rendered in a \multicolumn cell
  expect_true(grepl("multicolumn", latex_out, fixed = TRUE))
  expect_true(grepl("Table has no data", latex_out))

  # Custom message
  custom_out <- dplyr::tibble(x = character()) |>
    gt() |>
    tab_options(table.no_data_message = "No results found") |>
    as_latex() |>
    as.character()
  expect_true(grepl("No results found", custom_out, fixed = TRUE))

  # Suppressed (empty string disables the message)
  suppressed_out <- dplyr::tibble(x = character()) |>
    gt() |>
    tab_options(table.no_data_message = "") |>
    as_latex() |>
    as.character()
  expect_false(grepl("multicolumn", suppressed_out, fixed = TRUE))
})

# LaTeX utility unit tests ----------------------------------------------------

test_that("latex_group() wraps content in LaTeX braces", {

  expect_equal(latex_group("\\textbf{Hello}"), "{\\textbf{Hello}}")
  expect_equal(latex_group("a", "b", "c"), "{abc}")
  expect_equal(latex_group(""), "{}")
})

test_that("sprintf_unless_na() applies sprintf only to non-NA values", {

  expect_equal(sprintf_unless_na("(%s)", "abc"), "(abc)")
  expect_equal(sprintf_unless_na("(%s)", NA_character_), NA_character_)

  # Vectorized
  result <- sprintf_unless_na("\\textbf{%s}", c("A", NA, "B"))
  expect_equal(result, c("\\textbf{A}", NA_character_, "\\textbf{B}"))
})

test_that("latex_body_row() formats a row for LaTeX tabular output", {

  result_row <- latex_body_row(c("A", "B", "C"), type = "row")
  expect_true(grepl("A & B & C", result_row))
  expect_true(grepl("\\\\", result_row))

  result_group <- latex_body_row(c("X", "Y"), type = "group")
  expect_true(grepl("X & Y", result_group))
})

test_that("latex_heading_row() formats a heading row with midrule", {

  result <- latex_heading_row(c("Col1", "Col2"))
  expect_true(grepl("Col1 & Col2", result))
  expect_true(grepl("\\\\midrule", result))
  expect_false(grepl("\\\\endhead", result))

  result_repeat <- latex_heading_row(c("Col1", "Col2"), header_repeat = TRUE)
  expect_true(grepl("\\\\endhead", result_repeat))
})

test_that("convert_font_size_l() maps keyword sizes to LaTeX commands", {

  expect_equal(convert_font_size_l("small"), "\\small ")
  expect_equal(convert_font_size_l("large"), "\\large ")
  expect_equal(convert_font_size_l("xx-small"), "\\tiny ")
  expect_equal(convert_font_size_l("xxx-large"), "\\huge ")
  expect_equal(convert_font_size_l("default"), "")
  # Unknown string returns NULL
  expect_null(convert_font_size_l("unknown-size"))
})
