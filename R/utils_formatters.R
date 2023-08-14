#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2023 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Filter an internal table to a single row with filtering expressions
#'
#' @param table The table to filter down to one row.
#' @param column The column from which the single value should be obtained.
#' @param ... The arguments passed to `dplyr::filter()`.
#' @import rlang
#' @noRd
filter_table_to_value <- function(
    table,
    column,
    ...
) {

  filter_args_enquos <- rlang::enquos(...)
  column_enquo <- rlang::enquo(column)

  filtered_tbl <- dplyr::filter(table, !!!filter_args_enquos)

  if (nrow(filtered_tbl) != 1) {

    cli::cli_abort(c(
      "Internal error in `gt:::filter_table_to_row()`.",
      "*" = "The filtered table doesn't result in a table of exactly one row.",
      "*" = "Found {nrow(filtered_tbl)} rows."
    ))
  }

  dplyr::pull(filtered_tbl, !!column_enquo)
}

normalize_locale <- function(locale = NULL) {

  # Return NULL if the locale isn't specified
  if (is.null(locale)) {
    return(NULL)
  }

  # Normalize any underscores to hyphens
  locale <- gsub("_", "-", locale)

  # Resolve any default locales into their base names (e.g., 'en-US' -> 'en')
  if (locale %in% default_locales$default_locale) {
    locale <- default_locales[default_locales$default_locale == locale, ][["base_locale"]]
  }

  locale
}

#' Validate the user-supplied `locale` value
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
validate_locale <- function(locale) {

  # Stop function if the `locale` provided
  # isn't a valid one
  if (
    !is.null(locale) &&
    !(gsub("_", "-", locale) %in% locales[["locale"]]) &&
    !(gsub("_", "-", locale) %in% default_locales[["default_locale"]])
  ) {

    cli::cli_abort(c(
      "The supplied `locale` is not available in the list of supported locales.",
      "*" = "Use the `info_locales()` function to see which locales can be used."
    ))
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
  if (
    !(
      currency_char %in% currency_symbols$curr_symbol |
      currency_char %in% currencies$curr_code |
      currency_char %in% currencies$curr_number
    )
  ) {
    cli::cli_abort(c(
      "The supplied `currency` is not available in the list of supported currencies.",
      "*" = "Use the `info_currencies()` function to see which currencies can be used.",
      "*" = "See `?fmt_currency` to better understand which input types are valid."
    ))
  }
}

#' Get the `sep_mark` value based on a locale
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @param default The default value for the `sep_mark`.
#' @param use_seps A logical value for whether to use separators at all.
#' @noRd
get_locale_sep_mark <- function(
    locale = NULL,
    default,
    use_seps
) {

  # If `use_seps` is FALSE, then force `sep_mark` to be an empty string
  if (!use_seps) {
    return("")
  }

  # If `locale` is NULL then return the default `sep_mark`
  if (is.null(locale)) {
    return(default)
  }

  # Get the correct `group_sep` value from the `gt:::locales` lookup table
  sep_mark <- filter_table_to_value(locales, group, locale == {{ locale }})

  # Replace any `""` or "\u00a0" with `" "` since an empty string actually
  # signifies a space character, and, we want to normalize to a simple space
  if (sep_mark == "" || sep_mark == "\u00a0") sep_mark <- " "

  sep_mark
}

#' Get the `dec_mark` value based on a locale
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @param default The default value for the `dec_mark`.
#' @noRd
get_locale_dec_mark <- function(locale = NULL, default) {

  # If `locale` is NULL then return the default `dec_mark`
  if (is.null(locale)) {
    return(default)
  }

  # Get the correct `decimal` value from the `gt:::locales` lookup table
  filter_table_to_value(locales, decimal, locale == {{ locale }})
}

#' Get the currency code value associated with a locale's territory
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
get_locale_currency_code <- function(locale = NULL) {

  # If `locale` is NULL then return `"USD"`
  if (is.null(locale)) {
    return("USD")
  }

  locale <- locales[locales$locale == locale, ][["currency_code"]][[1]]

  if (is.na(locale)) {
    return("USD")
  }

  locale
}

#' Get the `idx_set` vector based on a locale
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
get_locale_idx_set <- function(locale = NULL) {

  # If `locale` is NULL then return `LETTERS`
  if (is.null(locale)) {
    return(LETTERS)
  }

  locales[locales$locale == locale, ][["chr_index"]][[1]]
}

#' Get the `idx_num_spellout` vector based on a locale
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
get_locale_num_spellout <- function(locale = NULL) {

  # If `locale` is NULL then set locale as 'en'
  if (is.null(locale)) {
    locale <- "en"
  }

  # If `locale` contains `sr-Latn` then set locale as 'sr-Latn'
  if (grepl("sr-Latn", locale)) {
    locale <- "sr-Latn"
  }

  # Get a vector of all locales from the column names of the
  # `spelled_num` dataset
  all_locales <- base::setdiff(names(spelled_num), "number")

  # The user may supply a valid locale (even one from those available
  # in `gt:::locales`) but there is no associated locale in `all_locales`;
  # in such a case when strip it down to the language and check if it is
  # then available in this internal dataset
  if (!(locale %in% all_locales)) {

    locale_segments <- get_locale_segments(locale = locale)

    if (any(locale_segments %in% all_locales)) {

      locale <- locale_segments[locale_segments %in% all_locales]

    } else {
      locale <- "en"
    }
  }

  spelled_num[[locale]]
}

#' Get the `no_table_data_text` value based on a locale
#'
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#' @noRd
get_locale_no_table_data_text <- function(locale = NULL) {

  # If `locale` is NULL then use the 'en' locale
  if (is.null(locale)) {
    locale <- "en"
  }

  # Get the correct `no_table_data_text` value from the
  # `gt:::locales` lookup table
  filter_table_to_value(locales, no_table_data_text, locale == {{ locale }})
}

get_locale_segments <- function(locale) {

  if (!grepl("-", locale)) {
    return(locale)
  }

  segments <- locale

  while (grepl("-", locale)) {

    locale <- gsub("-[^-]*$", "", locale)
    segments <- c(segments, locale)
  }

  segments
}

#' Resolve the locale in functions with a `locale` argument
#'
#' This performs locale resolution since the default locale (possibly set in
#' `gt()`) can be overridden with a `locale` set in a downstream function.
#' This performs a final validation of the resolved locale to ensure it has a
#' supported value.
#'
#' @param data The gt object.
#' @param locale The user-supplied `locale` value, found in several `fmt_*()`
#'   functions. This is expected as `NULL` if not supplied by the user.
#'
#' @noRd
resolve_locale <- function(data, locale) {

  if (is.null(locale)) {
    locale <- dt_locale_get_value(data = data)
  }

  # An 'undetermined' locale should map back to the `"en"` locale
  if (!is.null(locale) && locale == "und") {
    locale <- "en"
  }

  locale <- normalize_locale(locale = locale)

  validate_locale(locale = locale)

  locale
}

#' Determine which numbers in scientific notation would be zero order
#'
#' @param x A vector of numeric values, including `NA` values
#' @noRd
has_order_zero <- function(x) {
  ((x >= 1 & x < 10) | (x <= -1 & x > -10) | x == 0) & !is.na(x)
}

#' Get the correct number of decimal places for a specified currency
#'
#' @param currency The currency to use for the numeric value.
#' @param decimals The request number of decimal places.
#' @param use_subunits An option for whether the subunits portion of a currency
#'   value should be displayed.
#' @noRd
get_currency_decimals <- function(
    currency,
    decimals,
    use_subunits
) {

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
scale_x_values <- function(x, scale_by) {

  len <- length(scale_by)

  # Stop function if the length of `scale_by`
  # is not 1 of the length of `x`
  if (!any(len == 1, len == length(x))) {
    cli::cli_abort(
      "The length of the `scale_by` vector must be 1 or the length of `x`."
    )
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
format_num_to_str <- function(
    x,
    context,
    decimals,
    n_sigfig,
    sep_mark,
    dec_mark,
    drop_trailing_zeros,
    drop_trailing_dec_mark,
    format = "f",
    replace_minus_mark = TRUE,
    system = c("intl", "ind")
) {

  system <- rlang::arg_match(system)

  # If this hardcoding is ever to change, then we need to
  # modify the regexes below
  if (system == "ind") {

    sep_mark <- ","
    dec_mark <- "."
  }

  if (format == "fg") {

    x <- signif(x, digits = n_sigfig)
    mode <- NULL
    digits <- n_sigfig
    flag <- "#"
    drop0trailing <- FALSE

  } else if (format == "f") {

    mode <- "double"
    digits <- decimals
    flag <- ""
    drop0trailing <- drop_trailing_zeros

  } else if (format == "e") {

    mode <- "double"
    digits <- decimals
    flag <- ""
    drop0trailing <- FALSE

  } else {

    cli::cli_abort("The format provided isn't recognized.")
  }

  x_str <-
    formatC(
      x = x,
      format = format,
      mode = mode,
      digits = digits,
      flag = flag,
      drop0trailing = drop0trailing,
      big.mark = sep_mark,
      decimal.mark = dec_mark
    )

  # Remove `-` for any signed zeros returned by `formatC()`
  x_str_signed_zero <- grepl("^(-0|-0\\.0*?)$", x_str)
  x_str[x_str_signed_zero] <- gsub("-", "", x_str[x_str_signed_zero])

  # If a trailing decimal mark is to be retained (not the
  # default option but sometimes desirable), affix the `dec_mark`
  # to the right of those figures that are missing this mark
  if (!drop_trailing_dec_mark) {
    x_str_no_dec <- !grepl(dec_mark, x_str, fixed = TRUE)
    x_str[x_str_no_dec] <- paste_right(x_str[x_str_no_dec], dec_mark)
  }

  # Perform modifications to `x_str` values if formatting values to
  # conform to the Indian numbering system
  if (system == "ind") {

    is_inf <- grepl("Inf", x_str)
    x_str_numeric <- x_str[!is_inf]
    has_decimal <- grepl("\\.", x_str_numeric)
    is_negative <- grepl("^-", x_str_numeric)

    integer_parts <- sub("\\..*", "", x_str_numeric)

    integer_parts <-
      vapply(
        gsub("(,|-)", "", integer_parts),
        FUN.VALUE = character(1),
        USE.NAMES = FALSE,
        FUN = insert_seps_ind
      )

    decimal_str <- rep("", length(x_str_numeric))

    decimal_str[has_decimal] <-
      gsub("^.*?(\\..*)", "\\1", x_str_numeric[has_decimal])

    x_str[!is_inf] <-
      paste0(
        ifelse(is_negative, "-", ""),
        integer_parts,
        decimal_str
      )
  }

  # Replace the minus mark (a hyphen) with a context-specific minus sign
  if (replace_minus_mark) {
    x_str <- format_minus(x_str = x_str, x = x, context = context)
  }

  x_str
}

#' A `formatC()` call for `fmt_currency()`
#'
#' @inheritParams format_num_to_str
#' @noRd
format_num_to_str_c <- function(
    x,
    context,
    decimals,
    n_sigfig,
    sep_mark,
    dec_mark,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark,
    system = c("intl", "ind")
) {

  system <- rlang::arg_match(system)

  format_num_to_str(
    x = x,
    context = context,
    decimals = decimals,
    n_sigfig = n_sigfig,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    drop_trailing_zeros = drop_trailing_zeros,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    format = "f",
    system = system
  )
}

#' Surround formatted values with `$`s for LaTeX
#'
#' @param x Numeric values in `character` form.
#' @param context The output context.
#'
#' @noRd
to_latex_math_mode <- function(x, context) {

  if (context != "latex") {

    return(x)

  } else {

    # Ensure that `$` signs only surround the correct number parts
    # - certain LaTeX marks operate only in text mode and we need to
    #   conditionally surround only the number portion in these cases
    # - right now, the only marks that need to be situated outside of
    #   the math context are the per mille and per myriad (10,000)
    #   marks (provided by the `fmt_per()` function)
    if (all(grepl("\\\\textper(ten)?thousand$", x))) {
      out <- paste0("$", x)
      out <- gsub("(\\s*?\\\\textper(ten)?thousand)", "$\\1", out)
    } else {
      out <- paste_between(x, x_2 = c("$", "$"))
    }

    return(out)
  }
}

#' Obtain the contextually correct minus mark
#'
#' @param context The output context.
#' @noRd
context_missing_text <- function(missing_text, context) {

  is_asis <- inherits(missing_text, "AsIs")

  missing_text <-
    switch(
      context,
      html = ,
      latex = ,
      word =
        {
          if (!is_asis && missing_text == "---") {
            "\U02014"
          } else if (!is_asis && missing_text == "--") {
            "\U02013"
          } else {
            process_text(missing_text, context)
          }
        },
      rtf =
        {
          if (!is_asis && missing_text == "---") {
            "\\'97"
          } else if (!is_asis && missing_text == "--") {
            "\\'96"
          } else {
            process_text(missing_text, context)
          }
        }
    )

  if (
    context == "html" &&
    !is_asis &&
    (missing_text == "" || grepl("^\\s+$", missing_text))
  ) {
    missing_text <- "<br />"
  }

  missing_text
}

context_dash_mark <- context_missing_text

#' Obtain the contextually correct plus or minus mark
#'
#' @param context The output context.
#' @noRd
context_plusminus_mark <- function(plusminus_mark, context) {

  is_asis <- inherits(plusminus_mark, "AsIs")

  switch(
    context,
    html = ,
    latex = ,
    word =
      {
        if (!is_asis && plusminus_mark == " +/- ") {
          " \U000B1 "
        } else {
          plusminus_mark
        }
      },
    rtf =
      {
        if (!is_asis && plusminus_mark == " +/- ") {
          " \\'b1 "
        } else {
          plusminus_mark
        }
      }
  )
}

#' Obtain the contextually correct small values text for `sub_small_vals()`
#'
#' @param context The output context.
#' @noRd
resolve_small_vals_text <- function(
    threshold,
    small_pattern
) {

  gsub("{x}", abs(threshold), small_pattern, fixed = TRUE)
}

#' Obtain the contextually correct large values text for `sub_large_vals()`
#'
#' @param context The output context.
#' @noRd
context_large_vals_text <- function(
    threshold,
    large_pattern,
    sign,
    context
) {

  if (large_pattern == ">={x}") {
    if (sign == "-") {
      return(I(paste0(context_lte_mark(context = context), "-", threshold)))
    } else {
      return(I(paste0(context_gte_mark(context = context), threshold)))
    }
  }

  gsub("{x}", threshold, large_pattern, fixed = TRUE)
}

#' Obtain the contextually correct less than or equal to
#'
#' @param context The output context.
#' @noRd
context_lte_mark <- function(context) {

  switch(
    context,
    html = "\U02264",
    latex = "$\\leq$",
    "<="
  )
}

#' Obtain the contextually correct greater than or equal to
#'
#' @param context The output context.
#' @noRd
context_gte_mark <- function(context) {

  switch(
    context,
    html = "\U02265",
    latex = "$\\geq$",
    ">="
  )
}

#' Obtain the contextually correct minus mark
#'
#' @param context The output context.
#' @noRd
context_minus_mark <- function(context) {

  switch(
    context,
    html = "\U02212",
    "-"
  )
}

#' Obtain the contextually correct percent mark
#'
#' @param context The output context.
#' @noRd
context_percent_mark <- function(context) {

  switch(
    context,
    html = "%",
    latex = "\\%",
    "%"
  )
}

#' Obtain the contextually correct per mille mark
#'
#' @param context The output context.
#' @noRd
context_permille_mark <- function(context) {

  switch(
    context,
    latex = "\\textperthousand",
    rtf = "\\'89",
    "\U02030"
  )
}

#' Obtain the contextually correct per myriad mark
#'
#' @param context The output context.
#' @noRd
context_permyriad_mark <- function(context) {

  switch(
    context,
    latex = "\\textpertenthousand",
    rtf = "\\uc0\\u8241",
    "\U02031"
  )
}

#' Obtain the contextually correct pair of parentheses
#'
#' @param context The output context.
#' @noRd
context_parens_marks <- function(context) {

  switch(
    context,
    latex = c("(", ")"),
    c("(", ")")
  )
}

#' Obtain the contextually correct pair of opening/closing exponential strings
#'
#' @param context The output context.
#' @noRd
context_exp_marks <- function(context) {

  switch(
    context,
    html = c(" \U000D7 10<sup style='font-size: 65%;'>", "</sup>"),
    latex = c(" \\times 10^{", "}"),
    rtf = c(" \\'d7 10{\\super ", "}"),
    word = c(" \U000D7 10^", ""),
    c(" \U000D7 10^", "")
  )
}

#' Obtain the contextually correct string for scientific or engineering notation
#' where the default style (`"x10n"`) is not used.
#'
#' @param context The output context.
#' @param exp_style The style of formatting to use for the exponential notation.
#' @noRd
context_exp_str <- function(context, exp_style) {

  # Set default value for `exp_str`
  exp_str <- "E"

  # For the 'low-ten' style, a different `exp_str` value will be obtained
  # depending on the `context`
  if (exp_style == "low-ten") {

    exp_str <-
      switch(
        context,
        html = c("<sub style='font-size: 65%;'>10</sub>"),
        latex = c("{}_10"),
        rtf = c("{\\sub 10}"),
        word = c("10^"),
        "E"
      )
  }

  # If there is a single letter (or a letter and a '1') then
  # used that letter as the `exp_str` value
  if (grepl("^[a-zA-Z]{1}1?$", exp_style)) {
    exp_str <- substr(exp_style, 1, 1)
  }

  exp_str
}

#' Obtain the contextually correct symbol string
#'
#' @param context The output context.
#' @param symbol A symbol, which could be empty (NULL), a percent sign (`%`), or
#'   a currency symbol, or a `gt_currency` object.
#' @noRd
context_symbol_str <- function(context, symbol) {

  # If we supply `NULL` as `symbol`, then
  # return an empty string
  if (is.null(symbol)) {
    return("")
  }

  if (inherits(symbol, "gt_currency")) {

    symbol <-
      symbol[[context]] %||%
      symbol[["default"]] %||%
      cli::cli_abort(
        "The `{context}` output context isn't available in the
        `currency()` object (and there isn't a `default` context either)."
      )
  }

  # If we supply a percent sign as `symbol`,
  # get the contextually correct percent mark
  if (symbol == "%") {
    return(context_percent_mark(context))
  }

  # Get the contextually correct symbol string
  symbol <-
    switch(
      context,
      html = get_currency_str(currency = symbol),
      latex = {
        if (!inherits(symbol, "AsIs")) {
          paste_between(
            markdown_to_latex(
              get_currency_str(currency = symbol, fallback_to_code = TRUE),
              md_engine = "commonmark"
            ),
            c("\\text{", "}")
          )
        } else {
          symbol
        }
      },
      get_currency_str(currency = symbol, fallback_to_code = TRUE)
    )

  symbol
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
format_symbol_str <- function(
    x_abs_str,
    x,
    context,
    symbol,
    incl_space,
    placement
) {

  symbol_str <- context_symbol_str(context, symbol)

  if (symbol_str == "") {
    return(x_abs_str)
  }

  x_out <-
    vapply(
      seq_along(x),
      FUN.VALUE = character(1),
      USE.NAMES = FALSE,
      FUN = function(i) {

        # Using absolute value format, the minus mark will
        # be added later
        x_i <- x[i]
        x_str_i <- x_abs_str[i]

        # Place possible space and symbol on correct side of value
        x_str_i <-
          paste_on_side(
            x_str_i,
            x_side = ifelse(incl_space, " ", ""),
            direction = placement
          )
        x_str_i <-
          paste_on_side(
            x_str_i,
            x_side = as.character(symbol_str),
            direction = placement
          )

        # Create the minus mark for the context
        minus_mark <- context_minus_mark(context)

        # Place the `minus_mark` onto the formatted strings
        if (x_i < 0) {
          x_str_i <- paste_left(x_str_i, minus_mark)
        }

        x_str_i
      }
    )

  x_out
}

#' Transform currency values to accounting style
#'
#' @param x_str Numeric values in `character` form.
#' @param x Numeric values in `numeric` form.
#' @param context The output context.
#' @noRd
format_minus <- function(
    x_str,
    x,
    context
) {

  # Store logical vector of `x_vals` < 0
  x_lt0 <- x < 0

  # Return values unchanged if there are no negative values
  if (!any(x_lt0)) {
    return(x_str)
  }

  # Create the minus mark for the context
  minus_mark <- context_minus_mark(context)

  # Handle replacement of the minus mark
  tidy_gsub(x_str, "-", minus_mark, fixed = TRUE)
}

#' Transform currency values to accounting style
#'
#' @param x_str Numeric values in `character` form.
#' @param x Numeric values in `numeric` form.
#' @param context The output context.
#' @param accounting A logical value that indicates whether accounting style
#'   should be used.
#' @noRd
format_as_accounting <- function(
    x_str,
    x,
    context,
    accounting
) {

  if (!accounting) {
    return(x_str)
  }

  # TODO: Handle using `x_abs_str` instead

  # Store logical vector of `x` < 0
  x_lt0 <- x < 0

  # Return values unchanged if there are no negative values
  if (!any(x_lt0)) {
    return(x_str)
  }

  # Create the minus and parens marks for the context
  minus_mark <- context_minus_mark(context)
  parens_marks <- context_parens_marks(context)

  # Selectively remove minus sign and paste between parentheses
  x_str[x_lt0] <-
    paste_between(
      tidy_gsub(x_str[x_lt0], minus_mark, "", fixed = TRUE),
      x_2 = parens_marks
    )

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
prettify_scientific_notation <- function(
    x,
    context,
    small_pos,
    exp_marks
) {

  if (!any(grepl("e|E", x))) {
    return(x)
  }

  # For any numbers that shouldn't have an exponent, remove
  # that portion from the character version
  x[small_pos] <- split_scientific_notn(x[small_pos])$num

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

  # Handle replacement of the minus mark in number and exponent parts
  tidy_gsub(x, "-", minus_mark, fixed = TRUE)
}

#' Create the tibble with suffixes and scaling values
#'
#' The returned tibble should always have the same number of rows as the length
#' of input vector `x`.
#'
#' @param x Numeric values in `numeric` form.
#' @param decimals The exact number of decimal places to be used in the
#'   formatted numeric value.
#' @param suffix_labels The vector of suffix labels to use.
#' @param scale_by A value to scale the input.
#' @noRd
create_suffix_df <- function(
    x,
    decimals,
    suffix_labels,
    scale_by,
    system
) {

  suffix_fn <- if (system == "intl") num_suffix else num_suffix_ind

  # Create a tibble with scaled values for `x` and the
  # suffix labels to use for character formatting
  suffix_fn(
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
num_fmt_factory_multi <- function(
    pattern,
    use_latex_math_mode = TRUE,
    format_fn
) {

  # Generate a named list of factory functions, with one
  # component per context
  names(all_contexts) <- all_contexts

  lapply(
    all_contexts,
    FUN = function(x) {
      num_fmt_factory(
        context = x,
        pattern = pattern,
        use_latex_math_mode = use_latex_math_mode,
        format_fn = format_fn
      )
    }
  )
}

#' A factory function used for all numeric `fmt_*()` functions
#'
#' @param context The output context.
#' @param pattern The user-defined formatting pattern that allows for decoration
#'   of the formatted value.
#' @param format_fn A function for formatting the numeric values.
#' @noRd
num_fmt_factory <- function(
    context,
    pattern,
    use_latex_math_mode = TRUE,
    format_fn
) {

  # Force all arguments that don't have default values
  force(context)
  force(pattern)
  force(format_fn)

  function(x) {

    # Create `x_str` with the same length as `x`
    x_str <- rep(NA_character_, length(x))

    # Determine which of `x` are not NA
    non_na_x <- !is.na(x)

    if (any(non_na_x)) {

      # Create a possibly shorter vector of non-NA `x` values
      x_vals <- x[non_na_x]

      #
      # Apply a series of transformations to `x_str_vals`
      #

      # Format all non-NA `x` values with a formatting function
      x_str_vals <- format_fn(x_vals, context = context)

      # If in a LaTeX context, wrap values in math mode
      if (use_latex_math_mode) {
        x_str_vals <- to_latex_math_mode(x_str_vals, context = context)
      }

      # Handle formatting of pattern
      x_str_vals <- apply_pattern_fmt_x(x_str_vals, pattern = pattern)

      # Place the `x_str_vals` into `x_str` (at the non-NA indices)
      x_str[non_na_x] <- x_str_vals
    }

    x_str
  }
}

get_arg_names <- function(
    function_name,
    in_args = NULL,
    all_args_except = NULL
) {

  if (!is.null(in_args) && !is.null(all_args_except)) {
    stop("The `in_args` and `all_args_except` args should not both be used.")
  }

  if (is.null(in_args) && is.null(all_args_except)) {

    arg_names <- names(formals(function_name))

  } else if (!is.null(in_args) && is.null(all_args_except)) {

    arg_names <- in_args

  } else {

    arg_names <-
      base::setdiff(
        names(formals(function_name)),
        all_args_except
      )
  }

  arg_names
}

args_have_gt_column_obj <- function(arg_vals) {

  any(
    vapply(
      arg_vals,
      FUN.VALUE = logical(1),
      USE.NAMES = FALSE,
      FUN = function(x) {
        inherits(x, "gt_column")
      }
    )
  )
}

generate_param_tbl <- function(
    data,
    arg_vals,
    resolved_rows_idx
  ) {

  data_df <- dt_data_get(data = data)

  param_tbl <- dplyr::tibble(.rows = length(resolved_rows_idx))

  for (i in seq_along(names(arg_vals))) {

    if (inherits(arg_vals[[i]], "gt_column")) {

      resolved_column <-
        resolve_cols_c(expr = arg_vals[[i]][["column"]], data = data)

      param_vals <- data_df[resolved_rows_idx, ][[resolved_column]]

      if (!is.null(arg_vals[[i]][["fn"]])) {

        fn <- arg_vals[[i]][["fn"]]
        param_vals <- fn(param_vals)
      }

      if (!is.null(arg_vals[[i]][["na_value"]])) {

        na_value <- arg_vals[[i]][["na_value"]]
        param_vals[is.na(param_vals)] <- na_value
      }

      param_tbl <-
        dplyr::bind_cols(
          param_tbl,
          dplyr::tibble(!!names(arg_vals)[i] := param_vals)
        )

    } else {

      arg_name <- names(arg_vals)[i]
      default_for_arg <- rlang::eval_bare(formals(fmt_number)[[arg_name]])

      if (!identical(arg_vals[[i]], default_for_arg) && !is.null(arg_vals[[i]])) {

        param_tbl <-
          dplyr::bind_cols(
            param_tbl,
            dplyr::tibble(!!arg_name := arg_vals[[i]][1])
          )
      }
    }
  }

  param_tbl
}
