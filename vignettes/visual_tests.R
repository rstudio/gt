# Visual tests for cross-platform for gt. --------------------------------------
# They will be rendered as LaTeX, Interactive html, html and grid
# They should all assign to a gt table named `tab`
#
## ----background-color -------------------------------
tab <- exibble |>
  gt() |>
  tab_options(
    column_labels.background.color = "gray"
  ) |>
  tab_spanner(c(num, char), label = "A spanner") |>
  tab_header(title = "background color")

## ----complete-output ----------------------------------


tab <- pizzaplace %>%
  dplyr::filter(type %in% c("classic", "veggie")) %>%
  dplyr::group_by(type, size) %>%
  dplyr::summarize(
    sold = dplyr::n(),
    income = sum(price),
    .groups = "drop"
  ) %>%
  gt(rowname_col = "size", groupname_col = "type") %>%
  tab_header(title = "Complete output") %>%
  fmt_integer(columns = sold) %>%
  fmt_currency(columns = income) %>%
  summary_rows(
    fns = list(label = "All Sizes", fn = "sum"),
    side = c("top"),
    fmt = list(
      ~ fmt_integer(., columns = sold),
      ~ fmt_currency(., columns = income)
    )
  ) %>%
  tab_options(
    summary_row.background.color = "gray95",
    row_group.as_column = TRUE
  ) %>%
  tab_stub_indent(
    rows = everything(),
    indent = 2
  ) %>%
  grand_summary_rows(
    columns = c("sold", "income"),
    fns = list(Sum ~ sum(.)),
    fmt = ~ fmt_number(.)
  ) %>%
  tab_caption("Here be caption text") %>%
  tab_spanner(
    label = "Spanner",
    columns = c("sold", "income")
  ) %>%
  tab_stubhead("Stubhead label") %>%
  tab_source_note("Source: the pizzaria") %>%
  tab_footnote("Pineapples not included")

