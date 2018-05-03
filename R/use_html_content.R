#' Apply the content values in \code{content_tbl} to
#' the \code{html_table}.
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @importFrom dplyr bind_rows filter right_join select rename arrange distinct
#' @noRd
use_html_content <- function(html_tbl) {

  html_table <- html_tbl[["html_table"]]
  content_table <- html_tbl[["content_tbl"]]

  html_table_2 <-
    dplyr::bind_rows(
      html_table %>%
        dplyr::filter(t_part == "stub"),
      html_table %>%
        dplyr::filter(!(row %in% (content_table$row %>% unique()))),
      dplyr::right_join(
        html_table %>%
          dplyr::filter(row %in% (content_table$row %>% unique())) %>%
          dplyr::filter(column %in% (content_table$col %>% unique())) %>%
          dplyr::select(-content),
        content_table %>%
          dplyr::select(row, column_name, content_formatted) %>%
          dplyr::rename(content = content_formatted),
        by = c("row", "column_name"))) %>%
    dplyr::distinct() %>%
    dplyr::arrange(row, column) %>%
    dplyr::filter(!is.na(t_part))

  html_tbl[["html_table"]] <- html_table_2
  html_tbl
}


