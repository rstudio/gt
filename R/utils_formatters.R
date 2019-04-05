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

#' Validate the user-supplied `currency` value
#'
#' @param currency The user-supplied `currency` value, found in the
#'   `fmt_currency()` function.
#' @noRd
validate_currency <- function(currency) {

  # Stop function if the `currency` provided
  # isn't a valid one
  if (!(
    as.character(currency) %in% currency_symbols$curr_symbol |
    as.character(currency) %in% currencies$curr_code |
    as.character(currency) %in% currencies$curr_number)) {
    stop("The supplied `currency` is not available in the list of supported currencies.\n",
         " * Use the `info_currencies()` function to see which currencies can be used.\n",
         " * See `?fmt_currency` to understand which input types are valid.",
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

#' @noRd
get_currency_decimals <- function(currency,
                                  decimals,
                                  use_subunits) {

  # Get the number of decimal places
  if (is.null(decimals) && use_subunits) {

    # Get decimal places using `get_currency_exponent()` fcn
    if (currency %in% currency_symbols$curr_symbol) {

      return(2)

    } else {

      return(get_currency_exponent(currency))
    }

  } else if (is.null(decimals) && !use_subunits) {

    return(0)

  } else {
    return(decimals)
  }
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
                                dec_mark,
                                drop_trailing_zeros = FALSE) {

  format_num_to_str(
    x,
    decimals,
    sep_mark,
    dec_mark,
    format = "f",
    drop_trailing_zeros)
}

#' Surround formatted values with `$`s for LaTeX
#'
#' @noRd
to_latex_math_mode <- function(x, context) {

  if (context != "latex") {
    return(x)
  } else {
    return(x %>% paste_between(x_2 = c("$", "$")))
  }
}

context_minus_mark <- function(context) {

  switch(context,
         html = "&minus;",
         "-")
}

context_parens_marks_number <- function(context) {

  switch(context,
         latex = c("(", ")"),
         c("(", ")"))
}

context_exp_marks <- function(context) {

  switch(context,
         html = c(" &times; 10<sup class='gt_super'>", "</sup>"),
         latex = c(" \\times 10^{", "}"),
         c(" x 10(", ")"))
}

context_percent_mark <- function(context) {

  switch(context,
         html = "&percnt;",
         latex = "\\%",
         "%")
}

context_currency_str <- function(context, currency) {

  switch(context,
         html = {
           get_currency_str(currency)
         },
         latex = {
           currency %>%
             get_currency_str(fallback_to_code = TRUE) %>%
             markdown_to_latex() %>%
             paste_between(x_2 = c("\\text{", "}"))
         },
         {
           currency %>%
             get_currency_str(fallback_to_code = TRUE)
         })
}

paste_symbol_str <- function(x,
                             symbol_str,
                             incl_space,
                             placement,
                             minus_mark) {

  vapply(FUN.VALUE = character(1), USE.NAMES = FALSE, x, function(x) {

    if (grepl("^-", x)) {

      x %>%
        tidy_gsub("^-", "") %>%
        paste_on_side(
          x_side = ifelse(incl_space, " ", ""),
          direction = placement
        ) %>%
        paste_on_side(
          x_side = symbol_str,
          direction = placement
        ) %>%
        paste_left(minus_mark)

    } else {

      x %>%
        paste_on_side(
          x_side = ifelse(incl_space, " ", ""),
          direction = placement
        ) %>%
        paste_on_side(
          x_side = symbol_str,
          direction = placement
        )
    }
  })
}

#' @noRd
format_in_accounting_style <- function(x_vals,
                                       x_str_vals,
                                       accounting,
                                       minus_mark,
                                       parens_marks) {

  # Return values unchanged if there are no negative values
  if (!any(x_vals < 0)) {
    return(x_str_vals)
  }

  # Handle replacement of the minus mark
  x_str_vals <-
    x_str_vals %>%
    tidy_gsub("-", minus_mark, fixed = TRUE)

  # Handle case where negative values are to be placed within parentheses
  if (accounting) {

    # Selectively remove minus sign and paste between parentheses
    x_str_vals[x_vals < 0] <-
      x_str_vals[x_vals < 0] %>%
      tidy_gsub(minus_mark, "", fixed = TRUE) %>%
      paste_between(x_2 = parens_marks)
  }

  x_str_vals
}

#' @noRd
num_formatter_factory <- function(context,
                                  type,
                                  decimals = NULL,
                                  suffix_labels = NULL,
                                  scale_by = NULL,
                                  sep_mark = NULL,
                                  dec_mark = NULL,
                                  currency = NULL,
                                  drop_trailing_zeros = NULL,
                                  accounting = NULL,
                                  incl_space = NULL,
                                  placement = NULL,
                                  pattern = NULL) {

  function(x) {

    # Define some initial values
    if (type == "percent") {
      scale_by <- 100
    }

    if (type != "currency") {
      accounting <- FALSE
    }

    # Define the marks by context
    minus_mark <- context_minus_mark(context)
    parens_marks <- context_parens_marks_number(context)
    exp_marks <- context_exp_marks(context)

    if (type == "currency") {
      symbol_str <- context_currency_str(context, currency)
      parens_marks <- context_parens_marks(context)
    }

    if (type == "percent") {
      symbol_str <- context_percent_mark(context)
    }

    # Determine which of `x` are not NA
    non_na_x <- !is.na(x)

    # Create a possibly shorter vector of non-NA `x` values
    x_vals <- x[non_na_x]

    # Large-number suffixing support
    if (type %in% c("number", "currency")) {

      # Create a tibble with scaled values for `x[non_na_x]`
      # and the suffix labels to use for character formatting
      suffix_df <-
        num_suffix(
          round(x_vals, decimals),
          suffixes = suffix_labels,
          scale_by = scale_by
        )

      # Scale the `x_vals` by the `scale_by` value
      x_vals <- scale_x_values(x_vals, scale_by = suffix_df$scale_by)

    } else {
      x_vals <- scale_x_values(x_vals, scale_by)
    }

    # Determine which values don't require the (x 10^n)
    # for scientific foramtting since their order would be zero
    if (type == "scientific") {
      small_pos <- has_order_zero(x_vals)
    }

    # Format all non-NA x values
    x_str_vals <-
      if (type %in% c("number", "percent")) {
        format_num_to_str(
          x_vals, decimals, sep_mark, dec_mark, drop_trailing_zeros
        )
      } else if (type == "scientific") {
        format_num_to_str_e(
          x_vals, decimals, sep_mark, dec_mark, drop_trailing_zeros
        )
      } else if (type == "currency") {
        format_num_to_str_c(x_vals, decimals, sep_mark, dec_mark)
      } else {
        stop("The formatter type (", type, ") is not supported.")
      }

    # Support for scientific formatting
    if (type == "scientific") {

      # For any numbers that shouldn't have an exponent, remove
      # that portion from the character version
      if (any(small_pos)) {

        x_str_vals[small_pos] <-
          split_scientific_notn(x_str_vals[small_pos])$num
      }

      # For any non-NA numbers that do have an exponent, format
      # those according to the output context
      if (any(!small_pos)) {

        sci_parts <- split_scientific_notn(x_str_vals[!small_pos])

        x_str_vals[!small_pos] <-
          paste0(
            sci_parts$num, exp_marks[1],
            sci_parts$exp, exp_marks[2]
          )
      }

      # Handle replacement of the minus mark in number
      # and exponent parts
      x_str_vals <-
        x_str_vals %>%
        tidy_gsub("-", minus_mark, fixed = TRUE)
    }

    # Large-number suffixing support
    if (type %in% c("number", "currency")) {

      # Paste vector of suffixes to the right of the `x_str_vals`
      x_str_vals <- paste_right(x_str_vals, suffix_df$suffix)
    }

    # A symbol string is a group of character bound to the value
    # and also takes on a negative sign
    if (type %in% c("percent", "currency")) {

      # Handle placement of the symbol
      x_str_vals <-
        x_str_vals %>%
        paste_symbol_str(symbol_str, incl_space, placement, minus_mark)
    }

    # Certain types of formatters can create accounting-type
    # formatting
    if (type %in% c("number", "currency")) {

      # Perform negative value formatting
      x_str_vals <-
        format_in_accounting_style(
          x_vals, x_str_vals, accounting,
          minus_mark, parens_marks
        )
    }

    # If in a LaTeX context, wrap values in math mode
    x_str_vals <- x_str_vals %>% to_latex_math_mode(context)

    # Handle formatting of pattern
    x_str_vals <- apply_pattern_fmt_x(pattern, x_str_vals)

    # Create `x_str` with the same length as `x`; place the
    # `x_str_vals` into `str` (at the non-NA indices)
    x_str <- rep(NA_character_, length(x))
    x_str[non_na_x] <- x_str_vals
    x_str
  }
}

