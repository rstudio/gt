#' Extract a summary list from a gt object
#'
#' Get a list of summary row data frames from a \code{gt_tbl} object where
#' summary rows were added via the \code{\link{summary_rows}()} function. The
#' output data frames contain the \code{groupname} and \code{rowname} columns,
#' whereby \code{rowname} contains descriptive stub labels for the summary rows.
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @return a list of data frames containing summary data.
#' @examples
#' # Use `sp500` to create a gt table with
#' # row groups; create summary rows by row
#' # group (`min`, `max`, `avg`) and then
#' # extract the summary rows as a list
#' # object
#' summary_extracted <-
#'   sp500 %>%
#'   dplyr::filter(
#'     date >= "2015-01-05" &
#'       date <="2015-01-30"
#'   ) %>%
#'   dplyr::arrange(date) %>%
#'   dplyr::mutate(
#'     week = paste0(
#'       "W", strftime(date, format = "%V"))
#'   ) %>%
#'   dplyr::select(-adj_close, -volume) %>%
#'   gt(
#'     rowname_col = "date",
#'     groupname_col = "week"
#'   ) %>%
#'   summary_rows(
#'     groups = TRUE,
#'     columns = vars(open, high, low, close),
#'     fns = list(
#'       min = ~min(.),
#'       max = ~max(.),
#'       avg = ~mean(.)),
#'     formatter = fmt_number,
#'     use_seps = FALSE
#'   ) %>%
#'   extract_summary()
#'
#' # Use the summary list to make a new
#' # gt table; the key thing is to use
#' # `dplyr::bind_rows()` and then pass the
#' # tibble to `gt()` (the `groupname` and
#' # `rowname` magic column names create
#' # row groups and a stub)
#' tab_1 <-
#'   summary_extracted %>%
#'   dplyr::bind_rows() %>%
#'   gt()
#'
#' @section Figures:
#' \if{html}{\figure{man_extract_summary_1.svg}{options: width=100\%}}
#'
#' @family table export functions
#' @export
extract_summary <- function(data) {

  # Extract all attributes from the data object into `data_attr`
  data_attr <- attributes(data)

  if (is.null(data_attr$summary)) {
    stop("There is no summary data frame to extract.", call. = FALSE)
  }

  # Move original data frame to `data_df`
  data_df <- as.data.frame(data)

  # Get the `boxh_df` data frame
  boxh_df <- data_attr$boxh_df

  # Get the `stub_df` data frame
  stub_df <- data_attr$stub_df

  # Get the `rows_df` data frame
  rows_df <- data_attr$rows_df

  # Get the `cols_df` data frame
  cols_df <- data_attr$cols_df

  # Get the `formats` list
  formats <- data_attr$formats

  # Get the `arrange_groups` vector
  arrange_groups <- data_attr$arrange_groups

  # Get the `others_group` vector
  others_group <- data_attr$others_group[[1]] %||% NA_character_

  # Get the `col_merge` object
  col_merge <- data_attr$col_merge

  # Get the `summary_list` object
  summary_list <- data_attr$summary

  # Initialize `output_df`
  output_df <- initialize_output_df(data_df)

  # Create `output_df` with rendered values
  output_df <- render_formats(output_df, data_df, formats, context = "html")

  # Move input data cells to `output_df` that didn't have
  #   any rendering applied during `render_formats()`
  output_df <- migrate_unformatted_to_output(data_df, output_df, context = "html")

  # Get the reordering df (`rows_df`) for the data rows
  rows_df <- get_row_reorder_df(arrange_groups, stub_df)

  # Get the `columns_df` data frame for the data columns
  columns_df <- get_column_reorder_df(cols_df, boxh_df)

  # Reassemble the rows and columns of `data_df` in the correct order
  output_df <- reassemble_output_df(output_df, rows_df, columns_df)

  # Get the `groups_df` data frame, which is a rearranged representation
  # of the stub `groupname` and `rowname` columns
  groups_df <- get_groupnames_rownames_df(stub_df, rows_df)

  # Replace NA values in the `groupname` column if there is a reserved
  #   label for the unlabeled group
  groups_df[is.na(groups_df[, "groupname"]), "groupname"] <- others_group

  # Create the `groups_rows_df` data frame, which provides information
  #   on which rows the group rows should appear above
  groups_rows_df <- get_groups_rows_df(arrange_groups, groups_df)

  # Perform any necessary column merge operations
  col_merge_output <-
    perform_col_merge(col_merge, data_df, output_df, boxh_df, columns_df)

  # Rewrite `output_df`, `boxh_df`, and `columns_df` as a result of merging
  output_df <- col_merge_output$output_df
  boxh_df <- col_merge_output$boxh_df
  columns_df <- col_merge_output$columns_df

  # Create the `list_of_summaries` list of lists
  list_of_summaries <-
    create_summary_dfs(summary_list, data_df, stub_df, output_df)

  list_of_summaries$summary_df_data_list
}
