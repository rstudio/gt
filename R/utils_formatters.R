#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param column The column from which the single value should be obtained.
#' @param ... The arguments passed to `dplyr::filter()`.
#' @import rlang
#' @importFrom dplyr filter
#' @noRd
filter_table_to_value <- function(table,
                                  column,
                                  ...) {

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
  if (!is.null(locale) && !(locale %in% locales$base_locale_id)) {
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
#' @noRd
get_locale_dec_mark <- function(locale = NULL,
                                default) {

  # If `locale` is NULL then return the
  # default `dec_mark`
  if (is.null(locale)) {
    return(default)
  }

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

#' Get the correct number of decimal places for a specified currency
#'
#' @param currency The currency to use for the numeric value.
#' @param decimals The request number of decimal places.
#' @param use_subunits An option for whether the subunits portion of a currency
#'   value should be displayed.
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
#' @param drop_trailing_zeros Option to exclude trailing decimal zeros.
#' @param format The numeric format for `formatC()`.
#' @noRd
format_num_to_str <- function(x,
                              decimals = NULL,
                              sep_mark = NULL,
                              dec_mark = NULL,
                              drop_trailing_zeros = NULL,
                              small_pos = NULL,
                              exp_marks = NULL,
                              minus_mark = NULL,
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
                                decimals = NULL,
                                sep_mark = NULL,
                                dec_mark = NULL,
                                drop_trailing_zeros = NULL,
                                small_pos = NULL,
                                exp_marks = NULL,
                                minus_mark = NULL) {

  format_num_to_str(
    x,
    decimals,
    sep_mark,
    dec_mark,
    format = "e",
    drop_trailing_zeros) %>%
    prettify_scientific_notation(small_pos, exp_marks, minus_mark)


}

#' A `formatC()` call for `fmt_currency()`
#'
#' @inheritParams format_num_to_str
#' @noRd
format_num_to_str_c <- function(x,
                                decimals = NULL,
                                sep_mark = NULL,
                                dec_mark = NULL,
                                drop_trailing_zeros = FALSE,
                                small_pos = NULL,
                                exp_marks = NULL,
                                minus_mark = NULL) {

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
#' @param x Numeric values in `character` form.
#' @param context The output context.
#' @noRd
to_latex_math_mode <- function(x,
                               context) {

  if (context != "latex") {
    return(x)
  } else {
    return(x %>% paste_between(x_2 = c("$", "$")))
  }
}

#' Obtain the contextually correct minus mark
#'
#' @param context The output context.
#' @noRd
context_minus_mark <- function(context) {

  switch(context,
         html = "&minus;",
         "-")
}

#' Obtain the contextually correct percent mark
#'
#' @param context The output context.
#' @noRd
context_percent_mark <- function(context) {

  switch(context,
         html = "&percnt;",
         latex = "\\%",
         "%")
}

#' Obtain the contextually correct pair of parentheses
#'
#' @param context The output context.
#' @noRd
context_parens_marks_number <- function(context) {

  switch(context,
         latex = c("(", ")"),
         c("(", ")"))
}

#' Obtain the contextually correct pair of opening/closing exponential strings
#'
#' @param context The output context.
#' @noRd
context_exp_marks <- function(context) {

  switch(context,
         html = c(" &times; 10<sup class='gt_super'>", "</sup>"),
         latex = c(" \\times 10^{", "}"),
         c(" x 10(", ")"))
}


#' Obtain the contextually correct symbol string
#'
#' @param context The output context.
#' @param symbol A symbol, which could be empty (NULL), a percent sign (`%`), or
#'   a currency symbol.
#' @noRd
context_symbol_str <- function(context,
                               symbol) {

  # If we supply `NULL` as `symbol`, then
  # return an empty string
  if (is.null(symbol)) {
    return("")
  }

  # If we supply a percent sign as `symbol`,
  # get the contextually correct percent mark
  if (symbol == "%") {
    return(context_percent_mark(context))
  }

  # Get the contextually correct currency string
  switch(context,
         html = {
           symbol %>%
             get_currency_str()
         },
         latex = {
           symbol %>%
             get_currency_str(fallback_to_code = TRUE) %>%
             markdown_to_latex() %>%
             paste_between(x_2 = c("\\text{", "}"))
         },
         {
           symbol %>%
             get_currency_str(fallback_to_code = TRUE)
         })
}

#' Paste a symbol string to a formatted number
#'
#' @param x Numeric values in `character` form.
#' @param symbol_str The string that represents the symbol. It can be placed to
#'   the left or to the right of the numeric values. If on the left, it can take
#'   on a negative value.
#' @param incl_space A logical value indicating whether a single space character
#'   should separate the symbols and the formatted values.
#' @param placement Either `left` or `right` (this is the placement of the
#'   symbol string relative to the formatted, numeric values).
#' @param minus_mark The contextually correct minus mark.
#' @noRd
paste_symbol_str <- function(x,
                             symbol_str,
                             incl_space,
                             placement,
                             minus_mark) {

  if (symbol_str == "") {
    return(x)
  }

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

#' Transform currency values to accounting style
#'
#' @param x Numeric values in `character` form.
#' @param x_vals Numeric values in `numeric` form.
#' @param minus_mark The contextually correct minus mark.
#' @param parens_marks The contextually correct pair of parentheses.
#' @noRd
format_as_accounting <- function(x,
                                 x_vals,
                                 accounting,
                                 minus_mark,
                                 parens_marks) {

  # Store logical vector of `x_vals` < 0
  x_vals_lt0 <- x_vals < 0

  # Return values unchanged if there are no negative values
  if (!any(x_vals_lt0)) {
    return(x)
  }

  # Handle replacement of the minus mark
  x <-
    x %>%
    tidy_gsub("-", minus_mark, fixed = TRUE)

  # Handle case where negative values are to be placed within parentheses
  if (accounting) {

    # Selectively remove minus sign and paste between parentheses
    x[x_vals_lt0] <-
      x[x_vals_lt0] %>%
      tidy_gsub(minus_mark, "", fixed = TRUE) %>%
      paste_between(x_2 = parens_marks)
  }

  x
}

#' Provide a nicer format for numbers in scientific notation
#'
#' @param x Numeric values in `character` form.
#' @param small_pos A logical vector the length of `x` that indicates whether
#'   values should be decorated.
#' @param exp_marks A character vector (length of two) that encloses the
#'   exponential power value.
#' @param minus_mark The contextually correct minus mark.
#' @noRd
prettify_scientific_notation <- function(x,
                                         small_pos,
                                         exp_marks,
                                         minus_mark) {

  if (!any(grepl("e|E", x))) {
    return(x)
  }

  # For any numbers that shouldn't have an exponent, remove
  # that portion from the character version
  x[small_pos] <-
    split_scientific_notn(x[small_pos])$num

  # For any non-NA numbers that do have an exponent, format
  # those according to the output context
  sci_parts <- split_scientific_notn(x[!small_pos])

  x[!small_pos] <-
    paste0(
      sci_parts$num, exp_marks[1],
      sci_parts$exp, exp_marks[2]
    )

  # Handle replacement of the minus mark in number
  # and exponent parts
  x %>%
    tidy_gsub("-", minus_mark, fixed = TRUE)
}

#' Create a list of variables to pass to `num_fmt_factory()`
#'
#' @param decimals The number of decimal places (`digits`).
#' @param suffix_labels Normalized output from the `suffixing` input; either
#'   provides a character vector of suffix labels, or NULL (the case where the
#'   `suffixing` input is FALSE).
#' @param scale_by A numeric scalar.
#' @param sep_mark The separator for number groups (`big.mark`).
#' @param dec_mark The decimal separator mark (`decimal.mark`).
#' @param use_seps An option to use digit group separators.
#' @param symbol A symbol, which could be empty (NULL), a percent sign (`%`), or
#'   a currency symbol.
#' @param drop_trailing_zeros An option to exclude trailing decimal zeros.
#' @param accounting An option to use accounting style for currency values.
#' @param incl_space A logical value indicating whether a single space character
#'   should separate the symbols and the formatted values.
#' @param placement Either `left` or `right` (this is the placement of the
#'   symbol string relative to the formatted, numeric values).
#' @param pattern A formatting pattern that allows for decoration of the
#'   formatted value.
#' @param locale An optional locale ID that can be used for formatting the value
#'   according the locale's rules.
#' @noRd
create_var_list <- function(decimals,
                            suffix_labels,
                            scale_by,
                            sep_mark,
                            dec_mark,
                            use_seps,
                            symbol,
                            drop_trailing_zeros,
                            accounting,
                            incl_space,
                            placement,
                            pattern,
                            locale) {

  list(
    decimals = decimals, suffix_labels = suffix_labels,
    scale_by = scale_by, sep_mark = sep_mark, dec_mark = dec_mark,
    use_seps = use_seps, symbol = symbol,
    drop_trailing_zeros = drop_trailing_zeros,
    accounting = accounting, incl_space = incl_space,
    placement = placement, pattern = pattern, locale = locale
  )
}

#' A factory function used for all numeric `fmt_*()` functions
#'
#' @param context The output context.
#' @param var_list A variable list as returned by `create_var_list()`.
#' @param format_fn A function for formatting the numeric values.
#' @noRd
num_fmt_factory <- function(context,
                            var_list,
                            format_fn) {

  # Extract variables from `var_list`
  decimals <- var_list$decimals
  suffix_labels <- var_list$suffix_labels
  scale_by <- var_list$scale_by
  sep_mark <- var_list$sep_mark
  dec_mark <- var_list$dec_mark
  use_seps <- var_list$use_seps
  symbol <- var_list$symbol
  drop_trailing_zeros <- var_list$drop_trailing_zeros
  accounting <- var_list$accounting
  incl_space <- var_list$incl_space
  placement <- var_list$placement
  pattern <- var_list$pattern
  locale <- var_list$locale

  function(x) {

    # Use locale-based marks if a locale ID is provided
    sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
    dec_mark <- get_locale_dec_mark(locale, dec_mark)

    # Define the marks by context
    minus_mark <- context_minus_mark(context)
    parens_marks <- context_parens_marks_number(context)
    exp_marks <- context_exp_marks(context)
    symbol_str <- context_symbol_str(context, symbol)

    # Determine which of `x` are not NA
    non_na_x <- !is.na(x)

    # Create a possibly shorter vector of non-NA `x` values
    x_vals <- x[non_na_x]

    # Create a tibble with scaled values for `x[non_na_x]`
    # and the suffix labels to use for character formatting
    suffix_df <-
      num_suffix(
        round(x_vals, decimals),
        suffixes = suffix_labels,
        scale_by = scale_by
      )

    # Scale the `x_vals` by the `scale_by` value
    x_vals <-
      x_vals %>%
      scale_x_values(suffix_df$scale_by)

    # Determine which values don't require the (x 10^n)
    # for scientific foramtting since their order would be zero
    small_pos <- has_order_zero(x_vals)

    # Apply a series of transformations to `x_str_vals`
    x_str_vals <-
      x_vals %>%
      # Format all non-NA x values with a formatting function
      format_fn(
        decimals, sep_mark, dec_mark, drop_trailing_zeros,
        small_pos, exp_marks, minus_mark
      ) %>%
      # With large-number suffixing support, we paste the
      # vector of suffixes to the right of the `x_str_vals`
      paste_right(suffix_df$suffix) %>%
      # A symbol string is a group of characters bound to the value
      # and also takes on a negative sign
      paste_symbol_str(symbol_str, incl_space, placement, minus_mark) %>%
      # Format values in accounting style
      format_as_accounting(x_vals, accounting, minus_mark, parens_marks) %>%
      # If in a LaTeX context, wrap values in math mode
      to_latex_math_mode(context) %>%
      # Handle formatting of pattern
      apply_pattern_fmt_x(pattern)

    # Create `x_str` with the same length as `x`; place the
    # `x_str_vals` into `str` (at the non-NA indices)
    x_str <- rep(NA_character_, length(x))
    x_str[non_na_x] <- x_str_vals
    x_str
  }
}
