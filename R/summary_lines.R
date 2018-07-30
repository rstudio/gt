#' Add summary rows based on simple aggregations
#'
#' Add a summary rows to one or more stub blocks by using the input data
#' already provided in the \code{gt()} function.
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups the stub block groups heading names for which summary rows
#' will be added.
#' @param columns the columns for which the summaries should be calculated.
#' @param agg a vector of aggregate function names. This can include any of
#' these: \code{mean}, \code{min}, \code{max}, \code{median}, \code{sd},
#' \code{sum} or \code{n}.
#' @param decimals an option to specify the exact number of decimal places to
#' use. The default number of decimal places is \code{2}.
#' @param sep_mark the mark to use as a separator between groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param tint an optional tinting color to apply to the summary rows created.
#' The available tinting colors are: \code{yellow}, \code{blue}, \code{pink},
#' \code{green}, and \code{sand}. By default, no tinting is applied.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stub_block(
#'     group = "Mercs",
#'     rows = rownames_with("Merc")) %>%
#'   summary_rows(
#'     agg = "mean")
#' @family row addition functions
#' @export
summary_rows <- function(data,
                         groups = NULL,
                         columns = NULL,
                         agg,
                         decimals = 2,
                         sep_mark = "",
                         dec_mark = ".",
                         tint = NULL) {

  # If using the `vars()` helper, get the groups as a character vector
  if (!is.null(groups) && inherits(groups, "quosures")) {
    groups <- groups %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get the columns as a character vector
  if (!is.null(columns) && inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }


  if ("summary_auto" %in% names(attributes(data))) {

    attr(data, "summary_auto") <-
      c(
        attr(data, "summary_auto"),
        list(
          list(
            groups = groups,
            columns = columns,
            agg = agg,
            decimals = decimals,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            tint = tint)))

    data

  } else {

    attr(data, "summary_auto") <-
      list(
        list(
          groups = groups,
          columns = columns,
          agg = agg,
          decimals = decimals,
          sep_mark = sep_mark,
          dec_mark = dec_mark,
          tint = tint))
  }

  data
}
