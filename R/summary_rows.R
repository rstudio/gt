#' Add summary rows using aggregation functions
#'
#' Add summary rows to one or more row groups by using the input data already
#' provided in the \code{\link{gt}()} function alongside any suitable
#' aggregation functions. Should we need to obtain the summary data for external
#' purposes, the \code{\link{extract_summary}()} can be used with a
#' \code{gt_tbl} object where summary rows were added via \code{summary_rows()}.
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups the groups to consider for generation of groupwise summary
#'   rows. By default this is set to \code{NULL}, which results in the formation
#'   of grand summary rows (a grand summary operates on all table data).
#'   Providing the names of row groups in \code{c()} will create a groupwise
#'   summary and generate summary rows for the specified groups. Setting this to
#'   \code{TRUE} indicates that all available groups will receive groupwise
#'   summary rows.
#' @param columns the columns for which the summaries should be calculated.
#' @param fns functions used for aggregations. This can include base functions
#'   like \code{mean}, \code{min}, \code{max}, \code{median}, \code{sd}, or
#'   \code{sum} or any other user-defined aggregation function. The function(s)
#'   should be supplied within a \code{list()}. Within that list, we can specify
#'   the functions by use of function names in quotes (e.g., \code{"sum"}), as
#'   bare functions (e.g., \code{sum}), or as one-sided R formulas using a
#'   leading \code{~}. In the formula representation, a \code{.} serves as the
#'   data to be summarized (e.g., \code{sum(., na.rm = TRUE)}). The use of named
#'   arguments is recommended as the names will serve as summary row labels for
#'   the corresponding summary rows data (the labels can derived from the
#'   function names but only when not providing bare function names).
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
                         columns = TRUE,
                         fns,
                         missing_text = "---",
                         formatter = fmt_number,
                         ...) {

  # Collect all provided formatter options in a list
  formatter_options <- list(...)

  # If `groups` is FALSE, then do nothing; just
  # return the `data` unchanged; having `groups`
  # as `NULL` signifies a grand summary, `TRUE`
  # is used for groupwise summaries across all
  # groups
  if (!is.null(groups) && is.logical(groups) && groups == FALSE) {
    return(data)
  }

  # Get the `stub_df` object from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # If there isn't a stub available, create an
  # 'empty' stub (populated with empty strings);
  # the stub is necessary for summary row labels
  if (!is_stub_available(stub_df) && is.null(groups)) {

    # Place the `rowname` values into `stub_df$rowname`
    stub_df[["rowname"]] <- rep("", nrow(stub_df))

    attr(data, "stub_df") <- stub_df
  }

  # Get a character vector of column names to
  # which `fns` applies
  # TODO: replace with improved resolver functions
  # once that is merged to master
  if (is.null(columns)) {
    columns <- TRUE
  } else if (!is.null(columns) && inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # Append list of summary inputs to the
  # `summary` attribute
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
          formatter_options = formatter_options
        )
      )
    )

  data
}
