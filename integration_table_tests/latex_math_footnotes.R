summary_single_table <- tribble( ~grpname, ~ NOAE, ~g_1, ~g_2, ~g_3, ~ g_4, ~g_5,
                                 '!@ something_{<something>} CHECKMARK', 39, 5, 7, 1, 1, 1,
                                 '!@ VENUS_{<something>} | VENUS_{<something>} ', 9, 3, 0, 2, 0, 0,
                                 'PLUTO', 38, 0, 6, 0, 1, 2,
                                 'NEP', 11, 0, 3, 1, 0, 0)



percents_table <-
  summary_single_table %>%
  select(-'grpname') %>%
  apply(1, function(.) {
    round(. / sum(.), 2)
  }) %>%
  t()

dimnames(percents_table)[[2]] <- purrr::map_chr(dimnames(percents_table)[[2]], function(.){paste0(., '_p')})
summary_single_table$N <- rowSums(summary_single_table %>% select(-'grpname'))

df <- cbind(summary_single_table, percents_table)

rename_col <- function(){
  to_rename <- summary_single_table %>% select(-'grpname')
  col_nm <- names(to_rename)
  v <- list('No AE', '!@1_{<rad>}', '2', '3', '4', '5', 'N')
  names(v) <- col_nm
  v
}

latex_tab.options(sourcenotes.align = 'c')
gt_table <- df  %>%
  gt(rowname_col = 'grpname') %>%
  tab_stubhead(label = "TESTING") %>%
  cols_move_to_start(
    columns = vars(N)
  ) %>%
  cols_merge(
    columns = starts_with('g_1'),
    pattern = '{1} ({2})'
  ) %>%
  cols_merge(
    columns = starts_with('g_2'),
    pattern = '{1} ({2})'
  ) %>%
  cols_merge(
    columns = starts_with('g_3'),
    pattern = '{1} ({2})'
  ) %>%
  cols_merge(
    columns = starts_with('g_4'),
    pattern = '{1} ({2})'
  ) %>%
  cols_merge(
    columns = starts_with('g_5'),
    pattern = '{1} ({2})'
  ) %>%
  cols_merge(
    columns = starts_with('NOAE'),
    pattern = '{1} ({2})'
  ) %>%
  tab_spanner(
    label = 'Distance',
    columns = starts_with('g_')
  ) %>%
  tab_spanner(
    label = '',
    columns = vars(N, NOAE)
  ) %>%
  tab_footnote(
    footnote = "Color indicates height of sun.",
    locations = cells_column_labels(
      columns = starts_with('g_'))
  ) %>%
  cols_label(.list = rename_col()) %>%
  tab_source_note(c('Source code: /file...', 'Source code: /file...'))

latex_table <- gt_table %>% as_latex() %>% as.character()


readr::write_file(latex_table, 'integration_table_tests/latex_math_footnotes.tex')
