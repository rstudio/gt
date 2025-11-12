# no stub with spanner
no_stub <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10) %>%
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
single_stub <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10) %>%
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
multi_stub <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10) %>%
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
group_and_stub <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10) %>%
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

group_in_stub <- gtcars %>%
  dplyr::select(model, year, trim, mfr) %>%
  dplyr::slice(1:10) %>%
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

})
