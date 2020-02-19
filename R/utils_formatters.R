#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param column The column from which the single value should be obtained.
#' @param ... The arguments passed to `dplyr::filter()`.
#' @import rlang
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

  filtered_tbl %>% dplyr::pull(!!column_enquo)
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

  # If `currency` isn't a custom currency object
  # (`gt_currency`), then validate the supplied symbol
  if (inherits(currency, "gt_currency")) {
    return()
  }

  currency_char <- as.character(currency)

  # Stop function if the `currency` provided isn't a valid one
  if (!(
    currency_char %in% currency_symbols$curr_symbol |
    currency_char %in% currencies$curr_code |
    currency_char %in% currencies$curr_number)) {
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

  # Stop function if using the `currency()` helper function
  # without providing a value for `decimals`
  if (inherits(currency, "gt_currency")) {

    if (is.null(decimals) && use_subunits) {

      # This default value is a reasonable assumption given
      # that most currencies present two decimal places
      return(2)

    } else if (!use_subunits) {

      return(0)

    } else {
      return(decimals)
    }
  }

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
#' @param context The output context.
#' @param decimals The number of decimal places (`digits`).
#' @param sep_mark The separator for number groups (`big.mark`).
#' @param dec_mark The decimal separator mark (`decimal.mark`).
#' @param drop_trailing_zeros Option to exclude trailing decimal zeros.
#' @param format The numeric format for `formatC()`.
#' @param replace_minus_mark An option for whether the minus sign should be
#'   replaced with the minus mark.
#' @noRd
format_num_to_str <- function(x,
                              context,
                              decimals,
                              sep_mark,
                              dec_mark,
                              drop_trailing_zeros,
                              format = "f",
                              replace_minus_mark = TRUE) {

  x_str <-
    formatC(
      x = x,
      digits = decimals,
      mode = "double",
      big.mark = sep_mark,
      decimal.mark = dec_mark,
      format = format,
      drop0trailing = drop_trailing_zeros
    )

  if (replace_minus_mark) {
    x_str <- format_minus(x_str = x_str, x = x, context = context)
  }

  x_str
}

#' A `formatC()` call for `fmt_currency()`
#'
#' @inheritParams format_num_to_str
#' @noRd
format_num_to_str_c <- function(x,
                                context,
                                decimals,
                                sep_mark,
                                dec_mark,
                                drop_trailing_zeros = FALSE) {

  format_num_to_str(
    x = x,
    context = context,
    decimals = decimals,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    drop_trailing_zeros = drop_trailing_zeros,
    format = "f"
  )
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
context_missing_text <- function(missing_text,
                                 context) {

  missing_text <- process_text(missing_text, context)

  switch(context,
         html =
           {
             if (!inherits(missing_text, "AsIs") && missing_text == "---") {
               "&mdash;"
             } else if (!inherits(missing_text, "AsIs") && missing_text == "--") {
               "&ndash;"
             } else {
               missing_text
             }
           },
         latex =
           {
             if (!inherits(missing_text, "AsIs") && missing_text == "---") {
               "\u2014"
             } else if (!inherits(missing_text, "AsIs") && missing_text == "--") {
               "\u2013"
             } else {
               missing_text
             }
           })
}
context_dash_mark <- context_missing_text

#' Obtain the contextually correct plus or minus mark
#'
#' @param context The output context.
#' @noRd
context_plusminus_mark <- function(plusminus_mark,
                                   context) {

  switch(context,
         html =
           {
             if (!inherits(plusminus_mark, "AsIs") &&
                 plusminus_mark == " +/- ") {
               " &plusmn; "
             } else {
               plusminus_mark
             }
           },
         latex =
         {
           if (!inherits(plusminus_mark, "AsIs") &&
               plusminus_mark == " +/- ") {
             " \u00B1 "
           } else {
             plusminus_mark
           }
         })
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

#' Obtain the contextually correct pair of parentheses and spacers
#'
#' @param context The output context.
#' @noRd
context_parens_marks <- function(context) {

  switch(context,
         latex = c("(", ")"),
         c("(", ")"))
}

context_pre_parens_spacer <- function(context) {
  
  switch(context,
         latex = "\\hphantom{(}",
         "<span style=\"visibility: hidden;\">(</span>")
}

context_post_parens_spacer <- function(context) {
  
  switch(context,
         latex = "\\hphantom{)}",
         "<span style=\"visibility: hidden;\">)</span>")
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
#'   a currency symbol, or a `gt_currency` object.
#' @noRd
context_symbol_str <- function(context,
                               symbol) {

  # If we supply `NULL` as `symbol`, then
  # return an empty string
  if (is.null(symbol)) {
    return("")
  }

  if (inherits(symbol, "gt_currency")) {

    symbol <-
      symbol[[context]] %||%
      symbol[["default"]] %||%
      stop("The `", context, "` output context isn't available in the ",
           "`currency()` object (and there isn't a `default` context either).",
           call. = FALSE)
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
#' @param x_abs_str Absolute numeric values in `character` form.
#' @param x Numeric values in `numeric` form.
#' @param context The output context.
#' @param symbol The symbol.
#' @param incl_space A logical value indicating whether a single space character
#'   should separate the symbols and the formatted values.
#' @param placement Either `left` or `right` (this is the placement of the
#'   symbol string relative to the formatted, numeric values).
#' @noRd
format_symbol_str <- function(x_abs_str,
                              x,
                              context,
                              symbol,
                              incl_space,
                              placement) {


  symbol_str <- context_symbol_str(context, symbol)

  if (symbol_str == "") {
    return(x_abs_str)
  }

  vapply(FUN.VALUE = character(1), USE.NAMES = FALSE, seq_along(x), function(i) {

    # Using absolute value format, the minus mark will
    # be added later
    x_i <- x[i]
    x_str_i <- x_abs_str[i]

    # Place possible space and symbol on correct side of value
    x_str_i <-
      x_str_i %>%
      paste_on_side(
        x_side = ifelse(incl_space, " ", ""),
        direction = placement
      ) %>%
      paste_on_side(
        x_side = symbol_str,
        direction = placement
      )

    # Create the minus mark for the context
    minus_mark <- context_minus_mark(context)

    # Place the `minus_mark` onto the formatted strings
    if (x_i < 0) {
      x_str_i <-
        x_str_i %>%
        paste_left(minus_mark)
    }

    x_str_i
  })
}

#' Transform currency values to accounting style
#'
#' @param x_str Numeric values in `character` form.
#' @param x Numeric values in `numeric` form.
#' @param context The output context.
#' @noRd
format_minus <- function(x_str,
                         x,
                         context) {

  # Store logical vector of `x_vals` < 0
  x_lt0 <- x < 0

  # Return values unchanged if there are no negative values
  if (!any(x_lt0)) {
    return(x_str)
  }

  # Create the minus mark for the context
  minus_mark <- context_minus_mark(context)

  # Handle replacement of the minus mark
  x_str %>% tidy_gsub("-", minus_mark, fixed = TRUE)
}

#' Transform currency values to accounting style
#'
#' @param x_str Numeric values in `character` form.
#' @param x Numeric values in `numeric` form.
#' @param context The output context.
#' @param accounting A logical value that indicates whether accounting style
#'   should be used.
#' @noRd
format_as_accounting <- function(x_str,
                                 x,
                                 context,
                                 accounting) {

  # TODO: Handle using `x_abs_str` instead

  # Store logical vector of `x` < 0
  x_lt0 <- x < 0
  
  # Store logical vector `x` >= 0
  x_gte0 <- x >= 0

  # Return values unchanged if there are no negative values
  if (!any(x_lt0)) {
    return(x_str)
  }

  # Handle case where negative values are to be placed within parentheses
  if (accounting) {

    # Create the minus and parens marks or placeholders for the context
    minus_mark <- context_minus_mark(context)
    parens_marks <- context_parens_marks(context)
    pre_parens_spacer <- context_pre_parens_spacer(context)
    post_parens_spacer <- context_post_parens_spacer(context)

    # Selectively remove minus sign and paste between parentheses
    x_str[x_lt0] <-
      x_str[x_lt0] %>%
      tidy_gsub(minus_mark, "", fixed = TRUE) %>%
      paste_between(x_2 = parens_marks)
    
    x_str[x_gte0] <-
      x_str[x_gte0] %>%
      paste_between(x_2 = c(pre_parens_spacer, post_parens_spacer))
  }

  x_str
}

#' Provide a nicer format for numbers in scientific notation
#'
#' @param x Numeric values in `character` form.
#' @param context The output context.
#' @param small_pos A logical vector the length of `x` that indicates whether
#'   values should be decorated.
#' @param exp_marks A character vector (length of two) that encloses the
#'   exponential power value.
#' @noRd
prettify_scientific_notation <- function(x,
                                         context,
                                         small_pos,
                                         exp_marks) {

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

  # Create the minus mark for the context
  minus_mark <- context_minus_mark(context)

  # Handle replacement of the minus mark in number
  # and exponent parts
  x %>%
    tidy_gsub("-", minus_mark, fixed = TRUE)
}

#' Create the data frame with suffixes and scaling values
#'
#' @param x Numeric values in `numeric` form.
#' @param decimals The exact number of decimal places to be used in the
#'   formatted numeric value.
#' @param suffix_labels The vector of suffix labels to use.
#' @param scale_by A value to scale the input.
#' @noRd
create_suffix_df <- function(x,
                             decimals,
                             suffix_labels,
                             scale_by) {

  # Create a tibble with scaled values for `x` and the
  # suffix labels to use for character formatting
  num_suffix(
    round(x, decimals),
    suffixes = suffix_labels,
    scale_by = scale_by
  )
}

#' Create a list of function calls for all numeric `fmt_*()` functions
#'
#' @param pattern The user-defined formatting pattern that allows for decoration
#'   of the formatted value.
#' @param format_fn A function for formatting the numeric values.
#' @noRd
num_fmt_factory_multi <- function(pattern,
                                  format_fn) {

  # Generate a named list of factory functions, with one
  # component per context
  all_contexts %>%
    magrittr::set_names(all_contexts) %>%
    lapply(function(x) {
      num_fmt_factory(context = x, pattern = pattern, format_fn = format_fn)
    })
}

#' A factory function used for all numeric `fmt_*()` functions
#'
#' @param context The output context.
#' @param pattern The user-defined formatting pattern that allows for decoration
#'   of the formatted value.
#' @param format_fn A function for formatting the numeric values.
#' @noRd
num_fmt_factory <- function(context,
                            pattern,
                            format_fn) {

  # Force all arguments
  force(context)
  force(pattern)
  force(format_fn)

  function(x) {

    # Determine which of `x` are not NA
    non_na_x <- !is.na(x)

    # Create a possibly shorter vector of non-NA `x` values
    x_vals <- x[non_na_x]

    if (length(x_vals) == 0) {
      return(character(0))
    }

    # Apply a series of transformations to `x_str_vals`
    x_str_vals <-
      x_vals %>%
      # Format all non-NA x values with a formatting function
      format_fn(context) %>%
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
