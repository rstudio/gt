#' Add summary rows using aggregation functions
#'
#' Add summary rows to one or more stub blocks by using the input data
#' already provided in the \code{gt()} function alongside any suitable
#' aggregation functions. Should we need to obtain the summary data for
#' external purposes, the \code{\link{extract_summary}()} can be used with
#' a \code{gt_tbl} object where summary rows were added via
#' \code{summary_rows()}.
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups the stub block groups heading names for which summary rows
#' will be added.
#' @param columns the columns for which the summaries should be calculated. If
#' nothing is provided, then the supplied aggregation functions will be applied
#' to all columns.
#' @param funs functions used for aggregations. This can include any of
#' \code{mean}, \code{min}, \code{max}, \code{median}, \code{sd}, or \code{sum}.
#' The functions should be supplied using the \code{\link{funs}()} helper
#' function. With \code{funs()}, we can specify the functions by use of function
#' names (e.g., \code{"sum"}), the functions themselves (e.g., \code{sum}), or
#' calls to functions with \code{.} as a dummy argument (e.g.,
#' \code{sum(., na.rm = TRUE)}).
#' @param labels a vector of stub labels for the summary rows. The vector length
#' should match the number of \code{funs} provided. If this is not provided then
#' the labels will be generated from the input given to \code{funs}.
#' @param formatter a formatter function name. These can be functions available
#' in the package (e.g., \code{\link{fmt_number}}, \code{link{fmt_percent}},
#' etc.), or a custom function using \code{\link{fmt}()}. The default function
#' is \code{\link{fmt_number}()} and its options can be accessed through
#' \code{...}.
#' @param ... values passed to the \code{formatter} function, where the provided
#' values are to be in the form of named vectors. For example, when using the
#' default \code{formatter} function, \code{\link{fmt_number}}, options such as
#' \code{decimals}, \code{use_seps}, and \code{locale} can be used.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' library(tidyverse)
#'
#' # Create a table that creates a stub and
#' # stub blocks based on a naming convention
#' tbl <-
#'   dplyr::tribble(
#'     ~groupname, ~rowname, ~value,  ~value_2,
#'     "A",        "1",      NA,      260.1,
#'     "A",        "2",      184.3,   84.4,
#'     "A",        "3",      342.3,   126.3,
#'     "A",        "4",      234.9,   NA,
#'     "B",        "1",      190.9,   832.5,
#'     "B",        "2",      743.3,   281.2,
#'     "B",        "3",      252.3,   732.5,
#'     "B",        "4",      344.7,   NA,
#'     "C",        "1",      197.2,   818.0,
#'     "C",        "2",      284.3,   394.4)
#'
#' # Create a table with summary rows for the
#' # `A` and `C` groups; the 3 summary rows
#' # for these groups represent the mean, sum,
#' # and standard deviation of `value`
#' gt(tbl) %>%
#'   summary_rows(
#'     groups = vars(A, C),
#'     columns = vars(value),
#'     funs = funs(
#'       mean(., na.rm = TRUE),
#'       sum(., na.rm = TRUE),
#'       sd(., na.rm = TRUE)),
#'     labels = c("mean", "sum", "sd"))
#' @family row addition functionsd
#' @export
summary_rows <- function(data,
                         groups = NULL,
                         columns = NULL,
                         funs,
                         # labels,
                         formatter = fmt_number,
                         ...) {

  # Collect all provided formatter options in a list
  formatter_options <- list(...)

  if (is.null(groups)) {
    groups <- TRUE
  }

  if (is.null(columns)) {
    columns <- TRUE
  } else if (!is.null(columns) && inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # # If using the `vars()` helper, get the groups as a character vector
  # if (!is.null(groups) && inherits(groups, "quosures")) {
  #   groups <- groups %>% lapply(`[[`, 2) %>% as.character()
  # }

  # # If using the `vars()` helper, get the columns as a character vector
  # if (!is.null(columns) && inherits(columns, "quosures")) {
  #   columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  # }

  # Create labels from the function names if no labels are provided
  # if (missing(labels)) {
  #   labels <- names(funs)
  # } else if (is.null(labels)) {
  #   labels <- rep("", length(funs))
  # } else {
  #   labels <- labels[seq(funs)]
  # }

  if ("summary" %in% names(attributes(data))) {

    attr(data, "summary") <-
      c(
        attr(data, "summary"),
        list(
          list(
            groups = groups,
            columns = columns,
            funs = funs,
            # labels = labels,
            formatter = formatter,
            formatter_options = formatter_options)))

  } else {

    attr(data, "summary") <-
      list(
        list(
          groups = groups,
          columns = columns,
          funs = funs,
          # labels = labels,
          formatter = formatter,
          formatter_options = formatter_options))
  }

  data
}
