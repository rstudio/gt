#' Apply the content values in \code{content_tbl} to
#' the \code{html_table}.
#' @param html_tbl the internal table called
#' \code{html_table}.
#' @param content_tbl the internal table called
#' \code{content_tbl}.
#' @importFrom dplyr bind_rows filter inner_join select rename arrange
#' @noRd
use_html_content <- function(html_tbl, content_tbl) {

  dplyr::bind_rows(
    html_tbl %>%
      dplyr::filter(t_part %in% c("boxhead", "stub")),
    dplyr::inner_join(
      html_tbl %>%
        dplyr::filter(t_part != "boxhead") %>%
        dplyr::select(-content),
      content_tbl %>%
        dplyr::select(row, column_name, content_formatted) %>%
        dplyr::rename(content = content_formatted),
      by = c("row", "column_name"))) %>%
    dplyr::arrange(row, column)
}
