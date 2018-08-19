#' Extract a summary table from a gt table object
#'
#' Get a summary row data frame from a \code{gt_tbl} object where summary rows
#' were added via the \code{summary_rows()} function. The output data frame
#' contains the \code{groupname} and \code{rowname} columns, where
#' \code{rowname} contains descriptive stub labels for the summary rows.
#' The remaining columns are a subset of the original dataset, where only those
#' columns that had aggregation functions applied are retained. The output data
#' frame format is suitable for generating a summary table using the
#' \code{\link{gt}()} function.
#' @param data a table object that is created using the \code{\link{gt}()}
#' function.
#' @return a data frame containing summary data.
#' @family table export functions
#' @export
extract_summary <- function(data) {

  # Extract all attributes from the data object into `data_attr`
  data_attr <- attributes(data)

  if (is.null(data_attr$summary)) {
    stop("There is no summary data frame to extract.", call. = FALSE)
  }

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

  # Integrate any summary lines available
  data_attr <- integrate_summary_lines(data_attr)

  data_attr$summary_df
}

