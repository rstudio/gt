#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param ... The arguments passed to `dplyr::filter()`
#' @import rlang
#' @importFrom dplyr filter
#' @noRd
filter_table_to_row <- function(table, ...) {

  filter_args_enquos <- rlang::enquos(...)
  filtered_tbl <- dplyr::filter(table, !!!filter_args_enquos)

  if (nrow(filtered_tbl) != 1) {
    stop("Internal error in `gt:::filter_table_to_row()`:\n",
         " * The filtered table doesn't result in a table of exactly one row.",
         call. = FALSE)
  }

  filtered_tbl
}

#' Pull a single value from a table with a single row
#'
#' @param table The single-row table.
#' @param column The column from which the single value should be obtained.
#' @import rlang
#' @import rlang
#' @importFrom dplyr pull
#' @noRd
pull_table_value_from_column <- function(table, column) {

  if (nrow(table) != 1) {
    stop("Internal error in `gt:::pull_table_value_from_column()`:\n",
         " * The `table` must contain exactly one row.",
         call. = FALSE)
  }

  column_enquo <- rlang::enquo(column)

  table %>%
    dplyr::pull(!!column_enquo)
}

#' Get the `sep_mark` value based on a locale
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @param default The default value for the `sep_mark`.
#' @param use_seps A logical value for whether to use separators at all.
#' @importFrom dplyr filter pull
#' @noRd
get_locale_sep_mark <- function(locale = NULL,
                                default,
                                use_seps) {

  # If `use_seps` is FALSE, then force
  # `sep_mark` to be an empty string
  if (!use_seps) {
    return("")
  }

  # If `locale` is NULL then return the
  # default `sep_mark`
  if (is.null(locale)) {
    return(default)
  }

  # Stop function if the `locale` provided
  # isn't a valid one
  if (!(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not available in the list of supported locales.\n",
         " * Use the `info_locales()` function to see which locales can be used.",
         call. = FALSE)
  }

  # If the locale is supplied and valid, get
  # the correct `group_sep` value from the
  # `gt:::locales` lookup table
  if (locale %in% locales$base_locale_id) {

    sep_mark <-
      filter_table_to_row(gt:::locales, base_locale_id == locale) %>%
      pull_table_value_from_column(column = group_sep)

    return(sep_mark)
  }
}

