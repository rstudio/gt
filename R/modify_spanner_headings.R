#' Modify the `html_table` to incorporate spanner headings
#' @param html_tbl an HTML table object that is
#' created using the \code{gt()} function.
#' @importFrom dplyr filter mutate full_join select case_when bind_rows
#' @noRd
modify_spanner_headings <- function(html_tbl) {

  column_spanner_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart == "col_heading") %>%
    dplyr::mutate(row = -1L) %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, spanner_heading),
      by = "column_name") %>%
    dplyr::mutate(t_subpart = "spanner_heading") %>%
    dplyr::mutate(content = case_when(
      !is.na(spanner_heading) ~ spanner_heading,
      is.na(spanner_heading) ~ content)) %>%
    dplyr::select(-spanner_heading)

  column_heading_subpart <-
    html_tbl[["html_table"]] %>%
    dplyr::filter(t_subpart == "col_heading") %>%
    dplyr::full_join(
      html_tbl[["boxhead_panel"]] %>% dplyr::select(column_name, column_heading),
      by = "column_name") %>%
    dplyr::mutate(content = case_when(
      !is.na(column_heading) ~ column_heading,
      is.na(column_heading) ~ content)) %>%
    dplyr::select(-column_heading)

  html_tbl[["html_table"]] <-
    dplyr::bind_rows(
      column_spanner_subpart,
      column_heading_subpart,
      html_tbl[["html_table"]] %>%
        dplyr::filter(t_subpart != "col_heading" | is.na(t_subpart)))

  html_tbl
}
