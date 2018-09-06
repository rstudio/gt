#' Extract a summary table from a gt table object
#'
#' Get a summary row data frame from a \code{gt_tbl} object where summary rows
#'   were added via the \code{summary_rows()} function. The output data frame
#'   contains the \code{groupname} and \code{rowname} columns, where
#'   \code{rowname} contains descriptive stub labels for the summary rows.
#'   The remaining columns are a subset of the original dataset, where only
#'   those columns that had aggregation functions applied are retained. The
#'   output data frame format is suitable for generating a summary table using
#'   the \code{\link{gt}()} function.
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @return a data frame containing summary data.
#' @family table export functions
#' @import rlang
#' @importFrom dplyr filter arrange pull
#' @export
extract_summary <- function(data) {

  # Extract all attributes from the data object into `data_attr`
  data_attr <- attributes(data)

  if (is.null(data_attr$summary)) {
    stop("There is no summary data frame to extract.", call. = FALSE)
  }

  data_attr <- attributes(data)

  # Create `output_df` with rendered values
  data_attr$output_df <- render_formats(data, context = "html")

  # Move input data cells to `output_df` that didn't have
  #   any rendering applied during `render_formats()`
  data_attr$output_df <-
    migrate_unformatted_to_output(
      data = data,
      output_df = data_attr$output_df)

  # Move original data frame to `data_attr$data_df`
  data_attr$data_df <- as.data.frame(data)

  # Get the reordering df for the data rows
  data_attr$rows_df <- get_row_reorder_df(data_attr)

  # Get the reordering df for the data columns
  data_attr$columns_df <- get_column_reorder_df(data_attr)

  # Reassemble the rows and columns of
  # `data_df` in the correct order
  data_attr$output_df <-
    data_attr$output_df[
      data_attr$rows_df$rownum_final,
      data_attr$columns_df %>%
        dplyr::filter(!is.na(colnum_final)) %>%
        dplyr::arrange(colnum_final) %>%
        dplyr::pull(column_names)]

  # Get a `groups_df` data frame, which is a rearranged representation
  # of the stub `groupname` and `rowname` columns
  data_attr$groups_df <- get_groupnames_rownames_df(data_attr)

  # Get a `boxhead_spanners` vector, which has the unique, non-NA
  # boxhead spanner labels
  data_attr$boxhead_spanners <- get_boxhead_spanners_vec(data_attr)

  # Replace NA values in the `groupname` column if there is a reserved
  #   label for the unlabeled group
  data_attr$groups_df[
    which(is.na(data_attr$groups_df[, "groupname"])), "groupname"] <-
    data_attr$others_group[[1]] %||% NA_character_

  # Create the `groups_rows` data frame, which provides information
  #   on which rows the group rows should appear above
  groups_rows_df <- get_groups_rows_df(data_attr)

  # Perform any necessary column merge operations
  data_attr <- perform_col_merge(data_attr)

  # Create summary data frames
  data_attr <- create_summary_dfs(data_attr)

  data_attr$summary_df_data_list
}
