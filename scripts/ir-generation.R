# Example 01: Simple table
exibble %>%
  gt() %>%
  render_to_ir() %>% cat()


# Example z: All locations with styling and several options
exibble %>%
  gt(rowname_col = "row", groupname_col = "group") %>%
  tab_header("title", "subtitle") %>%
  summary_rows(
    columns = num,
    fns = list(
      min = ~min(., na.rm = TRUE),
      max = ~max(., na.rm = TRUE),
      avg = ~mean(., na.rm = TRUE)
    )
  ) %>%
  summary_rows(
    groups = "grp_a",
    columns = currency,
    fns = list(
      min = ~min(., na.rm = TRUE),
      max = ~max(., na.rm = TRUE)
    )
  ) %>%
  tab_stubhead("stubhead label") %>%
  tab_source_note("source_note 1") %>%
  tab_source_note("source_note 2") %>%
  tab_footnote("footnote 1", locations = cells_body(1, 1)) %>%
  tab_footnote("footnote 1b", locations = cells_body(1, 1)) %>%
  tab_footnote("The third footnote.", locations = cells_body(1, 2)) %>%
  tab_spanner("spanner", c(num, char)) %>%
  tab_style(cell_text("blue"), locations = cells_title("title")) %>%
  tab_style(cell_text("red"), locations = cells_title("subtitle")) %>%
  tab_style(cell_text("green"), locations = cells_column_spanners("spanner")) %>%
  tab_style(cell_text("purple"), locations = cells_column_labels(columns = char)) %>%
  tab_style(cell_text("crimson"), locations = cells_stubhead()) %>%
  tab_style(cell_text("orange"), locations = cells_body(columns = num)) %>%
  tab_style(cell_text("brown"), locations = cells_row_groups()) %>%
  tab_style(cell_text("gray50"), locations = cells_stub()) %>%
  tab_style(cell_text("steelblue"), locations = cells_grand_summary(columns = num)) %>%
  tab_style(cell_text("forestgreen"), locations = cells_stub_grand_summary()) %>%
  tab_style(cell_text("orange"), locations = cells_summary(groups = "grp_a", columns = currency)) %>%
  tab_style(cell_text("orange"), locations = cells_stub_summary(groups = "grp_a")) %>%
  tab_style(cell_fill("lightgreen"), locations = cells_footnotes()) %>%
  tab_style(list(cell_fill("rebeccapurple"), cell_text("white")), locations = cells_source_notes()) %>%
  tab_options(
    footnotes.sep = "<br />",
    row.striping.include_stub = TRUE,
    row.striping.include_table_body = TRUE
  ) %>%
  render_to_ir() %>% cat()
