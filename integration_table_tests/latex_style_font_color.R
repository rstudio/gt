library('tidyverse')
library('mrggt')
tbl_colored <- dplyr::tribble( ~grpname, ~count, ~color,
                               'apple', 1, 'red',
                               'banana', 2, 'yellow',
                               'grape', 3, 'purple',
                               'pear', 4, 'green',
                               'orange', 5, 'orange')
tbl_gt <-
  gt(data = tbl_colored) %>%
  tab_style(
    style = cell_text(color = "#ffcccb"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'a')
    )
  ) %>%
  tab_style(
    style = cell_text(color = "#ffffed"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'b')
    )
  ) %>%
  tab_style(
    style = cell_text(color = "#b19cd9"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'g')
    )
  ) %>%
  tab_style(
    style = cell_text(color = "#90ee90"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'p')
    )
  ) %>%
  tab_style(
    style = cell_text(color = "#fed8b1"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'o')
    )
  ) %>%
  cols_label(.list = list(grpname = 'Fruit',
                          count = 'Total',
                          color = 'Color')) %>%
  tab_source_note(c('Source code: /integration_table_tests/latex_style_font_color.R',
                    'Source code: /integration_table_tests/latex_style_font_color.tex')) %>%
  as_latex() %>%
  as.character()

readr::write_file(tbl_gt, 'integration_table_tests/latex_style_font_color.tex')
