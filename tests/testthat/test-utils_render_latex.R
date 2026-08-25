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
