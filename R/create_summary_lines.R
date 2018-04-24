#' Create lines with summarized data
#' @param html_tbl an HTML table object that
#' is created using the \code{gt()} function.
#' @param groups the groups to use when summarizing.
#' @param columns the columns to summarize.
#' @param fcn the name of a function to apply per
#' group per column.
#' @param summary_labels the labels to use in the stub
#' for the created summary rows.
#' @importFrom dplyr group_by summarize_at arrange bind_cols bind_rows
#' @importFrom dplyr tibble distinct mutate select row_number everything
#' @importFrom dplyr rename case_when
#' @importFrom rlang sym UQ
#' @export
create_summary_lines <- function(html_tbl,
                                 groups = NULL,
                                 columns,
                                 fcn,
                                 summary_labels) {

  if (!is.null(groups)) {

    summary_lines <-
      html_tbl$modified_tbl %>%
      dplyr::group_by(rlang::UQ(rlang::sym(groups))) %>%
      dplyr::summarize_at(.vars = columns, .funs = fcn)

    # Arrange data such that the grouped data
    # is contigious
    html_tbl$modified_tbl <-
      html_tbl$modified_tbl %>%
      dplyr::arrange(rlang::UQ(rlang::sym(groups)))

  } else {

    summary_lines <-
      html_tbl$modified_tbl %>%
      dplyr::group_by() %>%
      dplyr::summarize_at(.vars = columns, .funs = fcn)
  }

  summary_lines <-
    dplyr::bind_cols(
      dplyr::tibble(
        `::groups::` = rep(paste(groups, collapse = "::"), nrow(summary_lines)),
        `::summary_label::` = summary_labels),
      summary_lines)

  if (is.null(html_tbl$summary_tbl)) {
    html_tbl$summary_tbl <- summary_lines
  } else {
    html_tbl$summary_tbl <-
      dplyr::bind_rows(
        html_tbl$summary_tbl,
        summary_lines)
  }

  # Use `distinct()` on `html_tbl$summary_tbl` to
  # ensure that there are no exact duplicate rows
  html_tbl$summary_tbl <-
    html_tbl$summary_tbl %>%
    dplyr::distinct() %>%
    dplyr::mutate(index = row_number() + 10000) %>%
    dplyr::select(index, everything())

  html_tbl$modified_tbl <-
    bind_rows(
      html_tbl$summary_tbl,
      html_tbl$modified_tbl %>%
        dplyr::mutate(index = row_number()) %>%
        dplyr::select(index, everything())) %>%
    dplyr::arrange(rlang::UQ(rlang::sym(groups)), index) %>%
    dplyr::select(-`::groups::`, -index) %>%
    dplyr::rename(rowname = `::summary_label::`) %>%
    dplyr::mutate(rowname = case_when(
      is.na(rowname) ~ "",
      !is.na(rowname) ~ rowname))

  html_tbl
}
