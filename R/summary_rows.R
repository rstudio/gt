#' Add summary rows using aggregation functions
#'
#' Add summary rows to one or more row groups by using the input data already
#' provided in the [gt()] function alongside any suitable
#' aggregation functions. Should we need to obtain the summary data for external
#' purposes, the [extract_summary()] can be used with a
#' `gt_tbl` object where summary rows were added via `summary_rows()`.
#' @param data a table object that is created using the `gt()` function.
#' @param groups the row groups labels that identify which summary rows will be
#'   added.
#' @param columns the columns for which the summaries should be calculated. If
#'   nothing is provided, then the supplied aggregation functions will be
#'   applied to all columns.
#' @param fns functions used for aggregations. This can include base functions
#'   like `mean`, `min`, `max`, `median`, `sd`, or
#'   `sum` or any other user-defined aggregation function. The function(s)
#'   should be supplied within a `list()`. Within that list, we can specify
#'   the functions by use of function names (e.g., `"sum"`), the functions
#'   themselves (e.g., `sum`), or one-sided R formulas by prefacing with a
#'   `~` where `.` serves as the data to be summarized (e.g.,
#'   `sum(., na.rm = TRUE)`). By using named arguments, the names will
#'   serve as row labels for the corresponding summary rows (otherwise the
#'   labels will be derived from the function names).
#' @param missing_text the text to be used in place of `NA` values in
#'   summary cells with no data outputs.
#' @param formatter a formatter function name. These can be any of the
#'   `fmt_*()`functions available in the package (e.g.,
#'   [fmt_number()], \code{link{fmt_percent}()}, etc.), or a custom
#'   function using [fmt()]. The default function is
#'   [fmt_number()] and its options can be accessed through
#'   `...`.
#' @param ... values passed to the `formatter` function, where the provided
#'   values are to be in the form of named vectors. For example, when using the
#'   default `formatter` function, [fmt_number()], options such
#'   as `decimals`, `use_seps`, and `locale` can be used.
#' @return an object of class `gt_tbl`.
#' @examples
#' # Use `sp500` to create a gt table with
#' # row groups; create summary rows (`min`,
#' # `max`, `avg`) by row group, where each
#' # each row group is a week number
#' tab_1 <-
#'   sp500 %>%
#'   dplyr::filter(
#'     date >= "2015-01-05" &
#'       date <="2015-01-16"
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
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_summary_rows_1.svg}{options: width=100\%}}
#'
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

  columns <- enquo(columns)

  columns <- resolve_vars(var_expr = !!columns, data = data)

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
