#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param ... The arguments passed to `dplyr::filter()`
#' @import rlang
#' @importFrom dplyr filter
#' @noRd
filter_table_to_value <- function(table, column, ...) {

  filter_args_enquos <- rlang::enquos(...)
  column_enquo <- rlang::enquo(column)

  filtered_tbl <- dplyr::filter(table, !!!filter_args_enquos)

  if (nrow(filtered_tbl) != 1) {
    stop("Internal error in `gt:::filter_table_to_row()`:\n",
         " * The filtered table doesn't result in a table of exactly one row. ",
         "Found ", nrow(filtered_tbl), " rows.",
         call. = FALSE)
  }

  filtered_tbl %>%
    dplyr::pull(!!column_enquo)
}

#' Validate the user-supplied `locale` value
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
validate_locale <- function(locale) {

  # Stop function if the `locale` provided
  # isn't a valid one
  if (!(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not available in the list of supported locales.\n",
         " * Use the `info_locales()` function to see which locales can be used.",
         call. = FALSE)
  }
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

    if (sep_mark == "") sep_mark <- " "

    return(sep_mark)
  }
}

#' Get the `dec_mark` value based on a locale
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @param default The default value for the `dec_mark`.
#' @importFrom dplyr filter pull
#' @noRd
get_locale_dec_mark <- function(locale = NULL,
                                default) {

  # If `locale` is NULL then return the
  # default `dec_mark`
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
  # the correct `dec_sep` value from the
  # `gt:::locales` lookup table
  if (locale %in% locales$base_locale_id) {

    dec_mark <-
      filter_table_to_row(gt:::locales, base_locale_id == locale) %>%
      pull_table_value_from_column(column = dec_sep)

    return(dec_mark)
  }
}

#' Determine which numbers in scientific notation would be zero order
#'
#' @param x A vector of numeric values, including `NA` values
#' @noRd
has_order_zero <- function(x) {

  (
    (x >= 1 & x < 10) | (x <= -1 & x > -10) | x == 0
  ) & !is.na(x)
}

#' @param x A vector of numeric values.
#' @param scale_by A numeric scalar.
#' @noRd
scale_x_values <- function(x,
                           scale_by) {

  # Stop function if `scale_by` isn't numeric
  if (!inherits(scale_by, "numeric")) {
    stop("The scaling value given as `scale_by` must be numeric.",
         call. = FALSE)
  }

  # Stop function if the length of `scale_by`
  # is not 1 of the length of `x`
  if (!any(length(scale_by) == 1 || length(scale_by) == length(x))) {
    stop("The length of the `scale_by` vector must be 1 or the length of `x`.",
         call. = FALSE)
  }

  # Stop function if `scale_by` is an NA value
  if (any(is.na(scale_by))) {
    stop("The scaling value given as `scale_by` cannot be an `NA` value.",
         call. = FALSE)
  }

  # Stop function if `scale_by` is infinite
  if (any(is.infinite(scale_by))) {
    stop("The scaling value given as `scale_by` cannot be infinite.",
         call. = FALSE)
  }

  x * scale_by
}

#' A `formatC()` call for `fmt_number()` and `fmt_percent()`
#' @param x A vector of numeric values.
#' @param decimals The number of decimal places (`digits`).
#' @param sep_mark The separator for number groups (`big.mark`).
#' @param dec_mark The decimal separator mark (`decimal.mark`).
#' @param format The numeric format for `formatC()`.
#' @param drop_trailing_zeros Option to exclude trailing decimal zeros.
#' @noRd
format_num_to_str <- function(x,
                              decimals,
                              sep_mark,
                              dec_mark,
                              drop_trailing_zeros,
                              format = "f") {

  formatC(
    x = x,
    digits = decimals,
    mode = "double",
    big.mark = sep_mark,
    decimal.mark = dec_mark,
    format = format,
    drop0trailing = drop_trailing_zeros
  )
}

#' A `formatC()` call for `fmt_scientific()`
#' @param x A vector of numeric values.
#' @param decimals The number of decimal places (`digits`).
#' @param sep_mark The separator for number groups (`big.mark`).
#' @param dec_mark The decimal separator mark (`decimal.mark`).
#' @param drop_trailing_zeros Option to exclude trailing decimal zeros.
#' @noRd
format_num_to_str_e <- function(x,
                                decimals,
                                sep_mark,
                                dec_mark,
                                drop_trailing_zeros) {

  format_num_to_str(
    x,
    decimals,
    sep_mark,
    dec_mark,
    format = "e",
    drop_trailing_zeros)
}

#' A `formatC()` call for `fmt_currency()`
#' @param x A vector of numeric values.
#' @param decimals The number of decimal places (`digits`).
#' @param sep_mark The separator for number groups (`big.mark`).
#' @param dec_mark The decimal separator mark (`decimal.mark`).
#' @noRd
format_num_to_str_c <- function(x,
                                decimals,
                                sep_mark,
                                dec_mark) {

  format_num_to_str(
    x,
    decimals,
    sep_mark,
    dec_mark,
    format = "e",
    drop_trailing_zeros = FALSE)
}

