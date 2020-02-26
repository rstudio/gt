tbl_fruit <- dplyr::tribble( ~grpname, ~count, ~color,
                             'apple', 1, 'red',
                             'banana', 2, 'yellow',
                             'grape', 3, 'purple',
                             'pear', 4, 'green',
                             'orange', 5, 'orange',
                             'tomato', 6, 'red',
                             'kiwi', 7, 'brown')


tbl_gt <-
  gt(data = tbl_fruit) %>%
  cols_label(.list = list(grpname = 'Fruit',
                          count = 'Total',
                          color = 'Color')) %>%

  tab_style(style = cell_text(size = 'xx-small'),
            locations = cells_column_labels(columns = vars('grpname'))) %>%

  tab_style(style = cell_text(size = 'small'),
            locations = cells_column_labels(columns = vars('count'))) %>%

  tab_style(style = cell_text(size = 'large'),
            locations = cells_column_labels(columns = vars('color'))) %>%

  tab_style(
    style = cell_text(size = "xx-small"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'a')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "x-small"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'b')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "small"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'g')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "medium"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'p')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "large"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'o')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "x-large"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 't')
    )
  ) %>%
  tab_style(
    style = cell_text(size = "xx-large"),
    locations = cells_body(
      columns = everything(),
      rows = startsWith(grpname, 'k')
    )
  ) %>%
  as_latex() %>%
  as.character()

readr::write_file(tbl_gt, 'integration_table_tests/latex_style_preset_fontsizing.tex')
