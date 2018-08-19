#' Extract a summary table from a gt table object
#'
#' Take a \code{gt_tbl} table object and transform it to an HTML table.
#' @param data a table object that is created using the \code{gt()} function.
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

