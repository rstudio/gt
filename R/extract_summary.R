#' Extract a summary list from a \pkg{gt} object
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

  # Extract all attributes from the `data`
  # object into `data_attr`
  data_attr <- attributes(data)

  # Stop function if there are no
  # directives to create summary rows
  if (is.null(data_attr$summary)) {
    stop("There is no summary list to extract.\n",
         "Use the `summary_rows()` function to generate summaries.",
         call. = FALSE)
  }

  # Build the `data` using the standard
  # pipeline with the `html` context
  built_data <- build_data(data = data, context = "html")

  # Extract the list of summary data frames
  # that contains tidy, unformatted data
  built_data$list_of_summaries$summary_df_data_list
}
