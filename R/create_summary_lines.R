#' Create lines with summarized data
#' @param html_tbl an HTML table object that is
#' created using the \code{tab_create()} function.
#' @param group the group to use when summarizing.
#' @param columns the columns to summarize.
#' @param fcns the names of functions to apply per
#' group per column.
#' @param summary_labels the labels to use in the stub
#' for the created summary rows.
#' @importFrom tibble add_row
#' @export
create_summary_lines <- function(html_tbl,
                                 group = NULL,
                                 columns,
                                 fcns,
                                 summary_labels) {

  # Assign NA to `group` if values are
  # not provided
  if (is.null(group)) {
    group <- NA_character_
  }

  # Collapse the vector of column names as a
  # string with names separated by `::`
  columns <- paste(columns, collapse = "::")

  # Collapse the vector of `fcns` as a
  # string with labels separated by `::`
  fcns <- paste(fcns, collapse = "::")

  # Collapse the vector of `summary_labels` as a
  # string with labels separated by `::`
  summary_labels <- paste(paste0("~", summary_labels), collapse = "::")

  # Obtain the next index value for the
  # `transforms` table
  index <- get_next_index(tbl = html_tbl[["transforms"]])

  # Add to `transforms` tbl
  html_tbl[["transforms"]] <-
    html_tbl[["transforms"]] %>%
    tibble::add_row(
      index = index %>% as.integer(),
      transform_type = "create_summary_lines",
      transform_v1 = group,
      transform_v2 = columns,
      transform_v3 = fcns,
      transform_v4 = summary_labels)

  # Perform all `source_tbl` transform steps
  html_tbl <-
    all_tbl_transform_steps(
      html_tbl = html_tbl)

  html_tbl
}
