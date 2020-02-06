tbl_colored <- dplyr::tribble( ~grpname, ~count, ~color,
                               'apple', 1, 'red',
                               'banana', 2, 'yellow',
                               'grape', 3, 'purple',
                               'pear', 4, 'green',
                               'orange', 5, 'orange')
tbl_gt <-
  gt(data = tbl_colored) %>%
  tab_style(
    style = cell_fill(color = "#ffcccb"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'a')
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#ffffed"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'b')
    )
  ) %>%
  tab_style(
    style = cell_fill(color = "#b19cd9"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'g')
    )
  ) %>%
  tab_style(
        style = cell_fill(color = "#90ee90"),
        locations = cells_body(
          columns = everything(),
          rows = startsWith(grpname, 'p')
        )
   ) %>%
  tab_style(
    style = cell_fill(color = "#fed8b1"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'o')
    )
  ) %>%
  cols_label(.list = list(grpname = 'Fruit',
                          count = 'Total',
                          color = 'Color')) %>%
  tab_source_note(c('Source code: /integration_table_tests/latex_style_cell_color.R',
                    'Source code: /integration_table_tests/latex_style_cell_color.tex')) %>%
  as_latex() %>%
  as.character()

readr::write_file(tbl_gt, 'integration_table_tests/latex_style_cell_color.tex')
