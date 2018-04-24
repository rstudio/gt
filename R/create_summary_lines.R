#' Create lines with summarized data
#' @param html_tbl an HTML table object that
#' is created using the \code{gt()} function.
#' @param groups the groups to use when summarizing.
#' @param columns the columns to summarize.
#' @param fcn the name of a function to apply per
#' group per column.
#' @param summary_labels the labels to use in the stub
#' for the created summary rows.
#' @importFrom tibble add_row
#' @export
create_summary_lines <- function(html_tbl,
                                 groups = NULL,
                                 columns,
                                 fcn,
                                 summary_labels) {

  # Assign NA to `groups` if values are
  # not provided
  if (is.null(groups)) {
    groups <- NA_character_
  }

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Collapse the vector of `summary_labels` as a
  # string with labels separated by `::`
  summary_labels <- paste(summary_labels, collapse = "::")

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "create_summary_lines",
      transform_v1 = groups,
      transform_v2 = columns,
      transform_v3 = fcn,
      transform_v4 = summary_labels)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}
