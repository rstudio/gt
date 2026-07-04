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
  expect_true(grepl(pattern, as.character(no_stub %>% as_latex())))

  # Single rowname stub with spanner
  expect_true(grepl(pattern, as.character(single_stub %>% as_latex())))

  # Multiple rowname stubs with spanner
  expect_true(grepl(pattern, as.character(multi_stub %>% as_latex())))

  # Group and multiple rowname stubs
  expect_true(grepl(pattern, as.character(group_and_stub %>% as_latex())))

  # Hidden columns should add to model + trim = 30
  pattern_2 <- "\\{\\\\dimexpr\\s*0\\.30.*?\\}\\{\\\\centering \\{a spanner\\}"

  # Hidden columns
  expect_true(grepl(pattern_2, as.character(hidden_columns %>% as_latex())))

  # Hidden stub columns
  expect_true(grepl(pattern_2, as.character(hidden_stub %>% as_latex())))
})
