#' Merge columns according to transform directives
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @importFrom dplyr filter bind_rows arrange mutate pull select arrange
#' @importFrom rlang UQ
#' @export
merge_columns <- function(html_tbl) {

  if ("fmt_uncertainty" %in% html_tbl[["transforms"]]$transform_type) {

    add_uncert_transforms <-
      html_tbl[["transforms"]] %>%
      dplyr::filter(transform_type == "fmt_uncertainty")

    value_column <- add_uncert_transforms$transform_v1
    uncert_column <- add_uncert_transforms$transform_v2

    for (i in seq(value_column)) {

      html_tbl[["html_table"]] <-
        dplyr::bind_rows(
          html_tbl[["html_table"]] %>%
            dplyr::filter(
              column_name == rlang::UQ(value_column[i]) &
                t_part == "field") %>%
            dplyr::arrange(row) %>%
            dplyr::mutate(
              content_2 =
                html_tbl[["html_table"]] %>%
                dplyr::filter(
                  column_name == rlang::UQ(uncert_column[i]) &
                    t_part == "field") %>%
                dplyr::pull(content)) %>%
            dplyr::mutate(content = paste(content, "&#177;", content_2)) %>%
            dplyr::select(-content_2),
          html_tbl[["html_table"]] %>%
            dplyr::filter(
              column_name == rlang::UQ(value_column[i]) &
                t_part != "field"),
          html_tbl[["html_table"]] %>%
            dplyr::filter(
              column_name != rlang::UQ(value_column[i]) &
                column_name != rlang::UQ(uncert_column[i]))) %>%
        dplyr::arrange(row, column)
    }
  }

  html_tbl
}

