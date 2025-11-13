test_data <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10)

# no stub with spanner
no_stub <- test_data %>%
  gt() %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# single rowname stub with spanner
single_stub <- test_data %>%
  gt(rowname_col = "mfr") %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# multiple rowname stubs with spanner
multi_stub <- test_data %>%
  gt(rowname_col = c("mfr", "model")) %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# group and multiple rowname stubs
group_and_stub <- test_data %>%
  dplyr::mutate(group = "group") %>%
  gt(groupname_col = "group", rowname_col = c("mfr", "model")) %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# group as column and multiple rowname stubs

group_in_stub <- test_data %>%
  dplyr::mutate(group = "group") %>%
  gt(groupname_col = "group", rowname_col = c("mfr", "model"), row_group_as_column = TRUE) %>%
  cols_width(
    group ~ pct(20),
    mfr ~ pct(43),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  tab_spanner(
    label = "a spanner",
    columns = c(year, trim)
  )

# hidden columns
hidden_columns <- test_data %>%
  gt() %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  cols_hide(columns = "year") %>%
  tab_spanner(
    label = "a spanner",
    columns = c(model, trim)
  )


# hidden stub columns
hidden_stub <- test_data %>%
  gt(rowname_col = c("mfr", "year")) %>%
  cols_width(
    mfr ~ pct(63),
    model ~ pct(15),
    year ~ pct(7),
    trim ~ pct(15)
  ) %>%
  cols_hide(columns = "year") %>%
  tab_spanner(
    label = "a spanner",
    columns = c(model, trim)
  )

test_that("spanner widths are calculated correctly",{
  # all spanner widths should be year + trim = 22
  pattern <- "\\{\\\\dimexpr\\s*0\\.22.*?\\}\\{a spanner\\}"
  # no stub with spanner
  expect_true(grepl(pattern, as.character(no_stub %>% as_latex())))
  # single rowname stub with spanner
  expect_true(grepl(pattern, as.character(single_stub %>% as_latex())))
  # multiple rowname stubs with spanner
  expect_true(grepl(pattern, as.character(multi_stub %>% as_latex())))
  # group and multiple rowname stubs
  expect_true(grepl(pattern, as.character(group_and_stub %>% as_latex())))
  # group as column and multiple rowname stubs
  expect_true(grepl(pattern, as.character(group_in_stub %>% as_latex())))

  # hidden columns should add to model + trim = 30
  pattern2 <- "\\{\\\\dimexpr\\s*0\\.30.*?\\}\\{a spanner\\}"
  # hidden columns
  expect_true(grepl(pattern2, as.character(hidden_columns %>% as_latex())))
  # hidden stub columns
  expect_true(grepl(pattern2, as.character(hidden_stub %>% as_latex())))


})
