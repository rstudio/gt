#' Add summary rows using aggregation functions
#'
#' Add summary rows to one or more row groups by using the input data already
#' provided in the \code{\link{gt}()} function alongside any suitable
#' aggregation functions. Should we need to obtain the summary data for external
#' purposes, the \code{\link{extract_summary}()} can be used with a
#' \code{gt_tbl} object where summary rows were added via \code{summary_rows()}.
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups the row groups labels that identify which summary rows will be
#'   added.
#' @param columns the columns for which the summaries should be calculated. If
#'   nothing is provided, then the supplied aggregation functions will be
#'   applied to all columns.
#' @param fns functions used for aggregations. This can include base functions
#'   like \code{mean}, \code{min}, \code{max}, \code{median}, \code{sd}, or
#'   \code{sum} or any other user-defined aggregation function. The function(s)
#'   should be supplied within a \code{list()}. Within that list, we can specify
#'   the functions by use of function names (e.g., \code{"sum"}), the functions
#'   themselves (e.g., \code{sum}), or one-sided R formulas by prefacing with a
#'   \code{~} where \code{.} serves as the data to be summarized (e.g.,
#'   \code{sum(., na.rm = TRUE)}). By using named arguments, the names will
#'   serve as row labels for the corresponding summary rows (otherwise the
#'   labels will be derived from the function names).
#' @param missing_text the text to be used in place of \code{NA} values in
#'   summary cells with no data outputs.
#' @param formatter a formatter function name. These can be any of the
#'   \code{fmt_*()}functions available in the package (e.g.,
#'   \code{\link{fmt_number}()}, \code{link{fmt_percent}()}, etc.), or a custom
#'   function using \code{\link{fmt}()}. The default function is
#'   \code{\link{fmt_number}()} and its options can be accessed through
#'   \code{...}.
#' @param ... values passed to the \code{formatter} function, where the provided
#'   values are to be in the form of named vectors. For example, when using the
#'   default \code{formatter} function, \code{\link{fmt_number}()}, options such
#'   as \code{decimals}, \code{use_seps}, and \code{locale} can be used.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table that creates a stub and
#' # row groups based on the presence of the
#' # magic column names `groupname` & `rowname`
#' tbl <-
#'   dplyr::tribble(
#'     ~groupname, ~rowname, ~value_1, ~value_2,
#'     "A",        "1",      NA,       260.1,
#'     "A",        "2",      184.3,    84.4,
#'     "A",        "3",      342.3,    126.3,
#'     "A",        "4",      234.9,    NA,
#'     "B",        "1",      190.9,    832.5,
#'     "B",        "2",      743.3,    281.2,
#'     "B",        "3",      252.3,    732.5,
#'     "B",        "4",      344.7,    NA,
#'     "C",        "1",      197.2,    818.0,
#'     "C",        "2",      284.3,    394.4)
#'
#' # Create a table with summary rows for the
#' # `A` and `C` groups; the 3 summary rows
#' # for these groups represent the mean, sum,
#' # and standard deviation of `value`
#' gt_tbl <-
#'   gt(tbl) %>%
#'     summary_rows(
#'       groups = c("A", "C"),
#'       columns = vars(value_1),
#'       fns = list(
#'         average = ~mean(., na.rm = TRUE),
#'         total = ~sum(., na.rm = TRUE),
#'         `std dev` = ~sd(., na.rm = TRUE)))
#' @family row addition functions
#' @export
summary_rows <- function(data,
                         groups = NULL,
                         columns = NULL,
                         fns,
                         missing_text = "---",
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

  if ("summary" %in% names(attributes(data))) {

    attr(data, "summary") <-
      c(
        attr(data, "summary"),
        list(
          list(
            groups = groups,
            columns = columns,
            fns = fns,
            missing_text = missing_text,
            formatter = formatter,
            formatter_options = formatter_options)))

  } else {

    attr(data, "summary") <-
      list(
        list(
          groups = groups,
          columns = columns,
          fns = fns,
          missing_text = missing_text,
          formatter = formatter,
          formatter_options = formatter_options))
  }

  data
}
