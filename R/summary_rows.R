#' Add summary rows based on simple aggregations
#'
#' Add a summary rows to one or more stub blocks by using the input data
#' already provided in the \code{gt()} function.
#' @param data a table object that is created using the \code{gt()} function.
#' @param groups the stub block groups heading names for which summary rows
#' will be added.
#' @param columns the columns for which the summaries should be calculated.
#' @param funs functions used for aggregations. This can include any of
#' these: \code{mean}, \code{min}, \code{max}, \code{median}, \code{sd},
#' \code{sum} or \code{n}.
#' @param labels a vector of stub labels for the summary rows. The vector length
#' should match the number of \code{funs} provided. If this is not provided then
#' the labels will be generated from the function names.
#' @param decimals an option to specify the exact number of decimal places to
#' use. The default number of decimal places is \code{2}.
#' @param sep_mark the mark to use as a separator between groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   tab_stub_block(
#'     group = "Mercs",
#'     rows = rownames_with("Merc")) %>%
#'   summary_rows(
#'     funs = dplyr::funs(mean))
#' @family row addition functions
#' @export
summary_rows <- function(data,
                         groups = NULL,
                         columns = NULL,
                         funs,
                         labels = NULL,
                         decimals = 2,
                         sep_mark = ",",
                         dec_mark = ".") {

  # If using the `vars()` helper, get the groups as a character vector
  if (!is.null(groups) && inherits(groups, "quosures")) {
    groups <- groups %>% lapply(`[[`, 2) %>% as.character()
  }

  # If using the `vars()` helper, get the columns as a character vector
  if (!is.null(columns) && inherits(columns, "quosures")) {
    columns <- columns %>% lapply(`[[`, 2) %>% as.character()
  }

  # Create labels from the function names if no labels are provided
  if (is.null(labels)) {
    labels <- funs %>% lapply(`[[`, 2) %>% as.character() %>% tidy_gsub("\\(\\.\\)", "")
  } else {
    labels <- labels[seq(funs)]
  }

  if ("summary" %in% names(attributes(data))) {

    attr(data, "summary") <-
      c(
        attr(data, "summary"),
        list(
          list(
            groups = groups,
            columns = columns,
            funs = funs,
            labels = labels,
            decimals = decimals,
            sep_mark = sep_mark,
            dec_mark = dec_mark)))

    data

  } else {

    attr(data, "summary") <-
      list(
        list(
          groups = groups,
          columns = columns,
          funs = funs,
          labels = labels,
          decimals = decimals,
          sep_mark = sep_mark,
          dec_mark = dec_mark))
  }

  data
}
