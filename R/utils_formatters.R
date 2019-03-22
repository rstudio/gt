#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param column The column from which the single value should be obtained.
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
#'
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
#'
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
  validate_locale(locale)

  # Get the correct `group_sep` value from the
  # `gt:::locales` lookup table
  sep_mark <-
    filter_table_to_value(locales, group_sep, base_locale_id == locale)

  # TODO: Modify `locales` table to replace `""` with
  # `" "` in `group_sep` column; once that is done, the
  # below statement can be safely removed
  if (sep_mark == "") sep_mark <- " "

  sep_mark
}

#' Get the `dec_mark` value based on a locale
#'
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
  validate_locale(locale)

  # Get the correct `dec_sep` value from the
  # `gt:::locales` lookup table
  filter_table_to_value(locales, dec_sep, base_locale_id == locale)
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

#' Apply a scaling factor to a vector of numeric values
#'
#' @param x A vector of numeric values.
#' @param scale_by A numeric scalar.
#' @noRd
scale_x_values <- function(x,
                           scale_by) {
  checkmate::assert_numeric(
    scale_by,
    finite = TRUE,
    any.missing = FALSE)

  len <- length(scale_by)

  # Stop function if the length of `scale_by`
  # is not 1 of the length of `x`
  if (!any(len == 1, len == length(x))) {
    stop("The length of the `scale_by` vector must be 1 or the length of `x`.",
         call. = FALSE)
  }

  x * scale_by
}

#' A `formatC()` call for `fmt_number()` and `fmt_percent()`
#'
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
#'
#' @inheritParams format_num_to_str
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
#'
#' @inheritParams format_num_to_str
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

#' Flexibly split a string into two pieces
#'
#' @param x The string to split into a character vector of length 2.
#' @param before,after Either an exact numeric position for where splitting will
#'   occur, or a regular expression to match on a range of characters. We can
#'   use either `before` or `after` (but not both) with this variable input to
#'   accurately define which side of the match is the split position.
#' @noRd
split_string_2 <- function(x,
                           before = NULL,
                           after = NULL) {

  # Stop function if `x` is not of class character
  if (!inherits(x, "character")) {
    stop("Internal error in `gt:::paste_within()`:\n",
         "* The `x` object must be of class character.",
         call. = FALSE)
  }

  # Stop function if the length of `x` is not 1
  if (length(x) != 1) {
    stop("Internal error in `gt:::paste_within()`:\n",
         "* The length of the `x` must be exactly 1.",
         call. = FALSE)
  }

  # Get the length of the string `x`
  x_length <- nchar(x)

  # If neither of `before` or `after` has a value,
  # stop the function
  if (is.null(before) && is.null(after)) {
    stop("Internal error in `gt:::split_string_2()`:\n",
         " * Both `before` and `after` cannot be `NULL`.",
         call. = FALSE)
  }

  # If both `before` and `after` have values, stop
  # the function
  if (!is.null(before) && !is.null(after)) {
    stop("Internal error in `gt:::split_string_2()`:\n",
         " * A value must be provided to either `before` or `after`, not both.",
         call. = FALSE)
  }

  # Collapse value for either `before` or `after`;
  # add a class to retain the direction-of-split
  # information
  if (!is.null(before)) {
    input <- before
    class(input) <- c("before", class(before))
  } else if (!is.null(after)) {
    input <- after
    class(input) <- c("after", class(after))
  }

  if (inherits(input, "character")) {

    # Use the pattern (`input`) with the input string
    # `x` with `regexpr()` to get the matching output
    regexpr_out <- regexpr(input, x)

    # If there is no match, return a character vector
    # of length 2 (original string, then empty string)
    if (as.numeric(regexpr_out) == -1) {
      return(c(x, ""))
    }

    # Define the start position for the matched characters
    split_start <-
      regexpr_out %>%
      as.numeric()

    # Define the stop position for the matched characters
    split_stop <-
      attr(regexpr_out, "match.length", exact = TRUE) + split_start - 1

  } else if (inherits(input, "numeric")) {

    # Stop function if the index position is not valid
    if (input > x_length) {
      stop("Internal error in `gt:::split_string_2()`:\n",
           "* The numeric value provided cannot be greater than ", x_length, ".",
           call. = FALSE)
    }

    # Define the start and stop positions as
    # the single `input` value
    split_start <- split_stop <- input %>% as.numeric()
  }

  # Perform the split either before the matched characters
  if (inherits(input, "before")) {

    x_2 <- c(substr(x, 0, split_start - 1), substr(x, split_start, x_length))

  } else if (inherits(input, "after")) {

    x_2 <- c(substr(x, 0, split_stop), substr(x, split_stop + 1, x_length))
  }

  x_2
}

#' Flexibly split a string into two pieces
#'
#' @param x_2 A character vector of length 2.
#' @param paste_between A character vector that is to be pasted between the
#'   first and second elements of `x_2`.
#' @noRd
paste_between <- function(x_2,
                          x_between) {

  # Stop function if `x_2` is not of class character
  if (!inherits(x_2, "character")) {
    stop("Internal error in `gt:::paste_between()`:\n",
         "* The `x_2` object must be of class character.",
         call. = FALSE)
  }

  # Stop function if the length of `x_2` is not 2
  if (length(x_2) != 2) {
    stop("Internal error in `gt:::paste_between()`:\n",
         "* The length of the `x_2` must be exactly 2.",
         call. = FALSE)
  }

  # Stop function if `x_between` is not of class character
  if (!inherits(x_between, "character")) {
    stop("Internal error in `gt:::paste_between()`:\n",
         "* The `x_between` object must be of class character.",
         call. = FALSE)
  }

  paste0(x_2[1], x_between, x_2[2])
}

#' Paste a string either onto the left or the right of another string
#'
#' @param x A character vector of length equal to that of `x_side`.
#' @param x_side Another character vector, with a length equal to that of `x`.
#'   It will be pasted either to the left or to the right of `x` depending on
#'   the `direction`.
#' @param direction The side that `x_side` will be relative to `x`. This can
#'   be `left` or `right`.
#' @noRd
paste_on_side <- function(x,
                          x_side,
                          direction) {

  # Stop function if `direction` is not valid
  if (!(direction %in% c("left", "right"))) {
    stop("Internal error in `gt:::paste_on_side()`:\n",
         "* The `direction` must be either `left` or `right`.",
         call. = FALSE)
  }

  # Stop function if `x` and `x_side` are not both of class character
  if (any(!inherits(x, "character"), !inherits(x_side, "character"))) {
    stop("Internal error in `gt:::paste_on_side()`:\n",
         "* The `x` and `x_side` objects must be of class character.",
         call. = FALSE)
  }

  len <- length(x_side)

  # Stop function if the length of `x_side` is not 1 of the length of `x`
  if (!any(len == 1, len == length(x))) {
    stop("The length of the `x_side` vector must be 1 or the length of `x`.",
         call. = FALSE)
  }

  if (direction == "left") {

    return(paste0(x_side, x))

  } else if (direction == "right") {

    return(paste0(x, x_side))
  }
}

#' Paste a string onto left side of another string
#'
#' @inheritParams paste_on_side
#' @param x_left Another character vector of length 1 that is to be pasted to
#'   the left of `x`.
#' @noRd
paste_left <- function(x, x_left) {
  paste_on_side(x, x_side = x_left, direction = "left")
}

#' Paste a string onto right side of another string
#'
#' @inheritParams paste_on_side
#' @param x_right Another character vector of length 1 that is to be pasted to
#'   the right of `x`.
#' @noRd
paste_right <- function(x, x_right) {
  paste_on_side(x, x_side = x_right, direction = "right")
}
