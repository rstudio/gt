#' Format numeric values
#'
#' With numeric values in a gt table, we can perform number-based formatting so
#' that the targeted values are rendered with the following options:
#' \itemize{
#' \item decimals -- choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item negative values -- choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators -- options to enable/disable and a choice of
#' separator symbol
#' \item scaling -- we can choose to scale targeted values by a multiplier value
#' \item pattern -- option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting -- providing a locale ID will result in number
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through \code{columns} and additionally by
#' \code{rows} (if nothing is provided for \code{rows} then entire columns are
#' selected). A number of helper functions exist to make targeting more
#' effective. Conditional formatting is possible by providing a conditional
#' expression to the \code{rows} argument. See the Arguments section for more
#' information on this.
#'
#' @param data a table object that is created using the \code{\link{gt}()}
#'   function.
#' @param columns the columns to format. Can either be a series of column names
#'   provided in \code{vars()}, a vector of column indices, or a helper function
#'   focused on selections. The select helper functions are:
#'   \code{\link{starts_with}()}, \code{\link{ends_with}()},
#'   \code{\link{contains}()}, \code{\link{matches}()}, \code{\link{one_of}()},
#'   and \code{\link{everything}()}.
#' @param rows optional rows to format. Not providing any value results in all
#'   rows in \code{columns} being formatted. Can either be a vector of row
#'   captions provided \code{c()}, a vector of row indices, or a helper function
#'   focused on selections. The select helper functions are:
#'   \code{\link{starts_with}()}, \code{\link{ends_with}()},
#'   \code{\link{contains}()}, \code{\link{matches}()}, \code{\link{one_of}()},
#'   and \code{\link{everything}()}. We can also use expressions to filter down
#'   to the rows we need (e.g., \code{[colname_1] > 100 & [colname_2] < 50}).
#' @param decimals an option to specify the exact number of decimal places to
#'   use. The default number of decimal places is \code{2}.
#' @param drop_trailing_zeros a logical value that allows for removal of
#'   trailing zeros (those redundant zeros after the decimal mark).
#' @param negative_val the formatting to use for negative values. With
#'   \code{signed} (the default), negative values will be shown with a negative
#'   sign. Using \code{parens} will show the negative value in parentheses.
#' @param use_seps an option to use digit group separators. The type of digit
#'   group separator is set by \code{sep_mark} and overridden if a locale ID is
#'   provided to \code{locale}. This setting is \code{TRUE} by default.
#' @param scale_by a value to scale the input. The default is \code{1.0}.
#' @param pattern a formatting pattern that allows for decoration of the
#'   formatted value. The value itself is represented by \code{{x}} and all
#'   other characters are taken to be string literals.
#' @param sep_mark the mark to use as a separator between groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param locale an optional locale ID that can be used for formatting the value
#'   according the locale's rules. Examples include \code{"en_US"} for English
#'   (United States) and \code{"fr_FR"} for French (France). The use of a valid
#'   locale ID will override any values provided in \code{sep_mark} and
#'   \code{dec_mark}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column as numeric
#' # with three decimal places and with no
#' # use of digit separators
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num),
#'     decimals = 3,
#'     use_seps = FALSE
#'   )
#'
#' # Use `exibble` to create a gt table;
#' # format the `num` column as numeric,
#' # but treating the first four rows
#' # different than the last four
#' tab_2 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num),
#'     rows = 1:4,
#'     decimals = 2) %>%
#'   fmt_number(
#'     columns = vars(num),
#'     rows = 5:8,
#'     decimals = 1,
#'     scale_by = 1/1000,
#'     pattern = "{x}K")
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_number_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_number_2.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_number <- function(data,
                       columns,
                       rows = NULL,
                       decimals = 2,
                       drop_trailing_zeros = FALSE,
                       negative_val = "signed",
                       use_seps = TRUE,
                       scale_by = 1.0,
                       pattern = "{x}",
                       sep_mark = ",",
                       dec_mark = ".",
                       locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  if (!is.null(locale) && locale %in% locales$base_locale_id) {
    sep_mark <- get_locale_sep_mark(locale = locale)
    dec_mark <- get_locale_dec_mark(locale = locale)
  } else if (!is.null(locale) && !(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not in the available in the list of supported locale list",
         call. = FALSE)
  }

  # Provide an empty string for `sep_mark` if we choose
  # to not use digit group separators
  if (!use_seps) {
    sep_mark <- ""
  }

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        default = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Format all non-NA x values
          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * scale_by,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = drop_trailing_zeros)

          # Handle negative values
          if (negative_val == "parens") {

            # Determine which of `x` are not NA and also negative
            negative_x <- x < 0 & !is.na(x)

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("^-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])
          x
        }
      ))
}

#' Format values to scientific notation
#'
#' With numeric values in a gt table, we can perform formatting so that the
#' targeted values are rendered in scientific notation. Furthermore, there is
#' fine control with the following options:
#' \itemize{
#' \item decimals -- choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item scaling -- we can choose to scale targeted values by a multiplier value
#' \item pattern -- option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting -- providing a locale ID will result in
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through \code{columns} and additionally by
#' \code{rows} (if nothing is provided for \code{rows} then entire columns are
#' selected). A number of helper functions exist to make targeting more
#' effective. Conditional formatting is possible by providing a conditional
#' expression to the \code{rows} argument. See the Arguments section for more
#' information on this.
#' @inheritParams fmt_number
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column as partially
#' # numeric and partially in scientific
#' # notation
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_number(
#'     columns = vars(num),
#'     rows = num > 500,
#'     decimals = 1,
#'     scale_by = 1/1000,
#'     pattern = "{x}K"
#'   ) %>%
#'   fmt_scientific(
#'     columns = vars(num),
#'     rows = num <= 500,
#'     decimals = 1
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_scientific_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_scientific <- function(data,
                           columns,
                           rows = NULL,
                           decimals = 2,
                           drop_trailing_zeros = FALSE,
                           scale_by = 1.0,
                           pattern = "{x}",
                           sep_mark = ",",
                           dec_mark = ".",
                           locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  if (!is.null(locale) && locale %in% locales$base_locale_id) {
    sep_mark <- get_locale_sep_mark(locale = locale)
    dec_mark <- get_locale_dec_mark(locale = locale)
  } else if (!is.null(locale) && !(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not in the available in the list of supported locale list",
         call. = FALSE)
  }

  format_fcn_sci_notn_factory <- function(exp_start_str, exp_end_str) {

    function(x) {

      # Format the number component as a character vector
      x_str <-
        formatC(
          x = x * scale_by,
          digits = decimals,
          mode = "double",
          big.mark = sep_mark,
          decimal.mark = dec_mark,
          format = "e",
          drop0trailing = drop_trailing_zeros)

      small_pos <- (
        (x >= 1 & x < 10) |
          (x <= -1 & x > -10) |
          is_equal_to(x, 0)
      )

      # For any numbers that shouldn't have an exponent, remove
      # that portion from the character version
      if (any(small_pos)) {
        x_str[small_pos] <- split_scientific_notn(x_str[small_pos])$num
      }

      if (any(!small_pos)) {
        sci_parts <- split_scientific_notn(x_str[!small_pos])

        x_str[!small_pos] <- paste0(
          sci_parts$num, exp_start_str,
          sci_parts$exp, exp_end_str)
      }

      # Handle formatting of pattern
      pre_post_txt <- get_pre_post_txt(pattern)
      x_str <- paste0(pre_post_txt[1], x_str, pre_post_txt[2])

      x_str
    }
  }

  # Create the default formatting function for scientific notation
  format_fcn_sci_notn_default <- format_fcn_sci_notn_factory(
    exp_start_str = " x 10(",
    exp_end_str = ")")

  # Create the HTML formatting function for scientific notation
  format_fcn_sci_notn_html <- format_fcn_sci_notn_factory(
    exp_start_str = " &times; 10<sup class='gt_super'>",
    exp_end_str = "</sup>")

  # Create the Latex formatting function for scientific notation
  format_fcn_sci_notn_latex <- format_fcn_sci_notn_factory(
    exp_start_str = "$ \\times 10^{",
    exp_end_str = "}$")

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        html = format_fcn_sci_notn_html,
        default = format_fcn_sci_notn_default,
        latex = format_fcn_sci_notn_latex))
}

#' Format values as a percentage
#'
#' With numeric values in a gt table, we can perform percentage-based
#' formatting. The targeted values are scaled by \code{100} and are rendered
#' with the following options:
#' \itemize{
#' \item percent sign placement -- the percent sign can be placed after or
#' before the values and a space can be inserted between the symbol and the
#' value.
#' \item decimals -- choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item negative values -- choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators -- options to enable/disable and a choice of
#' separator symbol
#' \item pattern -- option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting -- providing a locale ID will result in number
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through \code{columns} and additionally by
#' \code{rows} (if nothing is provided for \code{rows} then entire columns are
#' selected). A number of helper functions exist to make targeting more
#' effective. Conditional formatting is possible by providing a conditional
#' expression to the \code{rows} argument. See the Arguments section for more
#' information on this.
#' @inheritParams fmt_number
#' @param incl_space an option on whether to include a space between the value
#'   and the percent sign. The default is to not introduce a space character.
#' @param placement the placement of the percent sign. This can be either be
#'   \code{right} (the default) or \code{left}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column to have
#' # percentage values in the first five
#' # of its rows
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_percent(
#'     columns = vars(num),
#'     rows = 1:5,
#'     decimals = 1,
#'     drop_trailing_zeros = TRUE
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_percent_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_percent <- function(data,
                        columns,
                        rows = NULL,
                        decimals = 2,
                        drop_trailing_zeros = FALSE,
                        negative_val = "signed",
                        use_seps = TRUE,
                        pattern = "{x}",
                        sep_mark = ",",
                        dec_mark = ".",
                        incl_space = FALSE,
                        placement = "right",
                        locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  if (!is.null(locale) && locale %in% locales$base_locale_id) {
    sep_mark <- get_locale_sep_mark(locale = locale)
    dec_mark <- get_locale_dec_mark(locale = locale)
  } else if (!is.null(locale) && !(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not in the available in the list of supported locale list",
         call. = FALSE)
  }

  # Provide an empty string for `sep_mark` if we choose
  # to not use digit group separators
  if (!use_seps) {
    sep_mark <- ""
  }

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        latex = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Format all non-NA x values
          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * 100.0,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = drop_trailing_zeros)

          if (placement == "right") {
            x[non_na_x] <- paste0(
              x[non_na_x],
              ifelse(incl_space, " \\%", "\\%"))
          } else {
            x[non_na_x] <- paste0(
              ifelse(incl_space, "\\% ", "\\%"),
              x[non_na_x])
          }

          # Handle negative values
          if (negative_val == "parens") {

            # Determine which of `x` are not NA and also negative
            negative_x <- x < 0 & !is.na(x)

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("^-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])

          x
        },
        default = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Format all non-NA x values
          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * 100.0,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = drop_trailing_zeros)

          if (placement == "right") {
            x[non_na_x] <- paste0(
              x[non_na_x],
              ifelse(incl_space, " %", "%"))
          } else {
            x[non_na_x] <- paste0(
              ifelse(incl_space, "% ", "%"),
              x[non_na_x])
          }

          # Handle negative values
          if (negative_val == "parens") {

            # Determine which of `x` are not NA and also negative
            negative_x <- x < 0 & !is.na(x)

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("^-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])

          x
        }
      ))
}

#' Format values as currencies
#'
#' With numeric values in a gt table, we can perform currency-based formatting.
#' This function supports both automatic formatting with a three-letter currency
#' code and numeric formatting facilitated through the use of a locale ID.
#'
#' The targeted numeric values are rendered with the following options:
#' \itemize{
#' \item currency symbol placement -- the currency symbol can be placed before
#' or after the values
#' \item decimals/subunits -- choice of the number of decimal places, and a
#' choice of the decimal symbol, and an option on whether to include or exclude
#' the currency subunits (decimal portion)
#' \item negative values -- choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators -- options to enable/disable and a choice of
#' separator symbol
#' \item scaling -- we can choose to scale targeted values by a multiplier value
#' \item pattern -- option to use a text pattern for decoration of the formatted
#' currency values
#' \item locale-based formatting -- providing a locale ID will result in
#' currency formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through \code{columns} and additionally by
#' \code{rows} (if nothing is provided for \code{rows} then entire columns are
#' selected). A number of helper functions exist to make targeting more
#' effective. Conditional formatting is possible by providing a conditional
#' expression to the \code{rows} argument. See the Arguments section for more
#' information on this.
#' @inheritParams fmt_number
#' @param currency the currency to use for the numeric value. This is to be
#'   supplied as a 3-letter currency code. Examples include \code{"USD"} for
#'   U.S. Dollars and \code{"EUR"} for the Euro currency.
#' @param use_subunits an option for whether the subunits portion of a currency
#'   value should be displayed.
#' @param placement the placement of the currency symbol. This can be either be
#'   \code{left} (the default) or \code{right}.
#' @param incl_space an option on whether to include a space between the value
#'   and the curerncy symbol. The default is to not introduce a space character.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `currency` column to have
#' # currency values in euros (EUR)
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_currency(
#'     columns = vars(currency),
#'     currency = "EUR"
#'   )
#'
#' # Use `exibble` to create a gt table;
#' # Keep only the `num` and `currency`,
#' # columns, then, format those columns
#' # using the "CNY" and "GBP" currencies
#' tab_2 <-
#'   exibble %>%
#'   dplyr::select(num, currency) %>%
#'   gt() %>%
#'   fmt_currency(
#'     columns = vars(num),
#'     currency = "CNY"
#'   ) %>%
#'   fmt_currency(
#'     columns = vars(currency),
#'     currency = "GBP"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_currency_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_currency_2.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_currency <- function(data,
                         columns,
                         rows = NULL,
                         currency,
                         use_subunits = TRUE,
                         negative_val = "signed",
                         decimals = NULL,
                         use_seps = TRUE,
                         scale_by = 1.0,
                         pattern = "{x}",
                         sep_mark = ",",
                         dec_mark = ".",
                         placement = "left",
                         incl_space = FALSE,
                         locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  if (!is.null(locale) && locale %in% locales$base_locale_id) {
    sep_mark <- get_locale_sep_mark(locale = locale)
    dec_mark <- get_locale_dec_mark(locale = locale)
  } else if (!is.null(locale) && !(locale %in% locales$base_locale_id)) {
    stop("The supplied `locale` is not in the available in the list of supported locale list",
         call. = FALSE)
  }

  # Return data if `currency` does not have a valid value
  if (!is_currency_valid(currency)) {

    message("The value supplied for `currency` is not valid.")
    return(data)
  }

  # Get the currency string for the HTML context
  currency_str_html <- get_currency_str(currency)

  # Get the currency string for the non-HTML context
  currency_str <- get_currency_str(currency, fallback_to_code = TRUE)

  # Get the number of decimal places
  if (is.null(decimals) & use_subunits) {

    # Get decimal places using `get_currency_exponent()` fcn
    if (currency %in% currency_symbols$curr_symbol) {
      decimals <- 2
    } else {
      decimals <- get_currency_exponent(currency = currency)
    }

  } else if (is.null(decimals) & use_subunits == FALSE) {
    decimals <- 0
  }

  # Provide an empty string for `sep_mark` if we choose
  # to not use digit group separators
  if (!use_seps) {
    sep_mark <- ""
  }

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        default = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Determine which of `x` are not NA and also negative
          negative_x <- x < 0 & !is.na(x)

          # Format all non-NA x values
          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * scale_by,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = FALSE)

          # Handle placement of the currency symbol
          if (placement == "left") {
            x[non_na_x] <- paste0(
              currency_str, ifelse(incl_space, " ", ""), x[non_na_x])
          } else {
            x[non_na_x] <- paste0(
              x[non_na_x], ifelse(incl_space, " ", ""), currency_str)
          }

          # Handle negative values
          if (negative_val == "parens") {

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])
          x
        },
        html = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Determine which of `x` are not NA and also negative
          negative_x <- x < 0 & !is.na(x)

          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * scale_by,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = FALSE)

          # Handle placement of the currency symbol
          if (placement == "left") {
            x[non_na_x] <- paste0(
              currency_str_html, ifelse(incl_space, " ", ""), x[non_na_x])
          } else {
            x[non_na_x] <- paste0(
              x[non_na_x], ifelse(incl_space, " ", ""), currency_str_html)
          }

          # Handle negative values
          if (negative_val == "parens") {

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])
          x
        },
        latex = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

          # Determine which of `x` are not NA and also negative
          negative_x <- x < 0 & !is.na(x)

          # Format all non-NA x values
          x[non_na_x] <-
            formatC(
              x = x[non_na_x] * scale_by,
              digits = decimals,
              mode = "double",
              big.mark = sep_mark,
              decimal.mark = dec_mark,
              format = "f",
              drop0trailing = FALSE)

          # Handle placement of the currency symbol
          if (placement == "left") {
            x[non_na_x] <- paste0(
              markdown_to_latex(currency_str), ifelse(incl_space, " ", ""), x[non_na_x])
          } else {
            x[non_na_x] <- paste0(
              x[non_na_x], ifelse(incl_space, " ", ""), markdown_to_latex(currency_str))
          }

          # Handle negative values
          if (negative_val == "parens") {

            # Apply parentheses to the formatted value and remove
            # the minus sign
            x[negative_x] <- paste0("(", gsub("-", "", x[negative_x]), ")")
          }

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x[non_na_x] <- paste0(pre_post_txt[1], x[non_na_x], pre_post_txt[2])
          x
        }
        ))
}

#' Format values as dates
#'
#' Format input date values that are character-based and expressed according to
#' the ISO 8601 date format (\code{YYYY-MM-DD}). Once the appropriate data cells
#' are targeted with \code{columns} (and, optionally, \code{rows}), we can
#' simply apply a preset date style to format the dates.
#'
#' The following date styles are available for simpler formatting of ISO dates
#' (all using the input date of \code{2000-02-29} in the example output dates):
#'
#' \enumerate{
#' \item iso: \code{2000-02-29}
#' \item wday_month_day_year: \code{Tuesday, February 29, 2000}
#' \item wd_m_day_year: \code{Tue, Feb 29, 2000}
#' \item wday_day_month_year: \code{Tuesday 29 February 2000}
#' \item month_day_year: \code{February 29, 2000}
#' \item m_day_year: \code{Feb 29, 2000}
#' \item day_m_year: \code{29 Feb 2000}
#' \item day_month_year: \code{29 February 2000}
#' \item day_month: \code{29 February}
#' \item year: \code{2000}
#' \item month: \code{February}
#' \item day: \code{29}
#' \item year.mn.day: \code{2000/02/29}
#' \item y.mn.day: \code{0/02/29}
#' }
#'
#' We can use the \code{\link{info_date_style}()} function for a useful
#' reference on all of the possible inputs to \code{date_style}.
#'
#' @inheritParams fmt_number
#' @param date_style the date style to use. Supply a number (from \code{1} to
#' \code{14}) that corresponds to the preferred date style. Use
#' \code{\link{info_date_style}()} to see the different numbered and named date
#' presets.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # keep only the `date` and `time` columns;
#' # format the `date` column to have
#' # dates formatted as `month_day_year`
#' # (date style `5`)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(date, time) %>%
#'   gt() %>%
#'   fmt_date(
#'     columns = vars(date),
#'     date_style = 5
#'   )
#'
#' # Use `exibble` to create a gt table;
#' # keep only the `date` and `time` columns;
#' # format the `date` column to have mixed
#' # date formats (dates after April will
#' # be different than the others)
#' tab_2 <-
#'   exibble %>%
#'   dplyr::select(date, time) %>%
#'   gt() %>%
#'   fmt_date(
#'     columns = vars(date),
#'     rows =
#'       as.Date(date) > as.Date("2015-04-01"),
#'     date_style = 6
#'   ) %>%
#'   fmt_date(
#'     columns = vars(date),
#'     rows =
#'       as.Date(date) <= as.Date("2015-04-01"),
#'     date_style = 7
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_date_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_date_2.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_date <- function(data,
                     columns,
                     rows = NULL,
                     date_style = 2) {

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        default = function(x) {

          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
            strftime(format = date_format_str) %>%
            tidy_gsub("^0", "") %>%
            tidy_gsub(" 0([0-9])", " \\1") %>%
            tidy_gsub("pm$", "PM") %>%
            tidy_gsub("am$", "AM")
        }))
}

#' Format values as times
#'
#' Format input time values that are character-based and expressed according to
#' the ISO 8601 time format (\code{HH:MM:SS}). Once the appropriate data cells
#' are targeted with \code{columns} (and, optionally, \code{rows}), we can
#' simply apply a preset time style to format the times.
#'
#' The following time styles are available for simpler formatting of ISO times
#' (all using the input time of \code{14:35:00} in the example output times):
#'
#' \enumerate{
#' \item hms: \code{14:35:00}
#' \item hm: \code{14:35}
#' \item hms_p: \code{2:35:00 PM}
#' \item hm_p: \code{2:35 PM}
#' \item h_p: \code{2 PM}
#' }
#'
#' We can use the \code{\link{info_time_style}()} function for a useful
#' reference on all of the possible inputs to \code{time_style}.
#'
#' @inheritParams fmt_number
#' @param time_style the time style to use. Supply a number (from \code{1} to
#' \code{5}) that corresponds to the preferred time style. Use
#' \code{\link{info_time_style}()} to see the different numbered and named time
#' presets.
#' @examples
#' # Use `exibble` to create a gt table;
#' # keep only the `date` and `time` columns;
#' # format the `time` column to have
#' # times formatted as `hms_p`
#' # (time style `3`)
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(date, time) %>%
#'   gt() %>%
#'   fmt_time(
#'     columns = vars(time),
#'     time_style = 3
#'   )
#'
#' # Use `exibble` to create a gt table;
#' # keep only the `date` and `time` columns;
#' # format the `time` column to have mixed
#' # time formats (times after 16:00 will
#' # be different than the others)
#' tab_2 <-
#'   exibble %>%
#'   dplyr::select(date, time) %>%
#'   gt() %>%
#'   fmt_time(
#'     columns = vars(time),
#'     rows =
#'       time > "16:00",
#'     time_style = 3
#'   ) %>%
#'   fmt_time(
#'     columns = vars(time),
#'     rows =
#'       time <= "16:00",
#'     time_style = 4
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_time_1.svg}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_time_2.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_time <- function(data,
                     columns,
                     rows = NULL,
                     time_style = 2) {

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        default = function(x) {

          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
            strftime(format = time_format_str) %>%
            tidy_gsub("^0", "") %>%
            tidy_gsub(" 0([0-9])", " \\1") %>%
            tidy_gsub("pm$", "PM") %>%
            tidy_gsub("am$", "AM")
        }))
}

#' Format values as date-times
#' @inheritParams fmt_number
#' @inheritParams fmt_date
#' @inheritParams fmt_time
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # keep only the `datetime` column;
#' # format the column to have dates
#' # formatted as `month_day_year` and
#' # times to be `hms_p`
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(datetime) %>%
#'   gt() %>%
#'   fmt_datetime(
#'     columns = vars(datetime),
#'     date_style = 5,
#'     time_style = 3
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_datetime_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_datetime <- function(data,
                         columns,
                         rows = NULL,
                         date_style = 2,
                         time_style = 2) {

  # Transform `date_style` to `date_format`
  date_format <- get_date_format(date_style = date_style)

  # Transform `time_style` to `time_format`
  time_format <- get_time_format(time_style = time_style)

  # Combine into a single datetime format string
  date_time_format_str <-
    paste0(date_format, " ", time_format)

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        default = function(x) {

          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
            strftime(format = date_time_format_str) %>%
            tidy_gsub("^0", "") %>%
            tidy_gsub(" 0([0-9])", " \\1") %>%
            tidy_gsub("pm$", "PM") %>%
            tidy_gsub("am$", "AM")
        }))
}

#' Format by simply passing data through
#'
#' Format by passing data through no other transformation other than: (1)
#' coercing to \code{character} (as all the \code{fmt_*()} functions do), and
#' (2) applying prefixed or suffixed text via the \code{pattern} argument (the
#' default is to apply nothing). All of this is useful when don't want to modify
#' the input data other than to decorate it within a pattern. Also, this
#' function is useful when used as a \code{formatter} function in the
#' \code{summary_rows} function, where the output may be text or useful as is
#' (that function requires a formatter function).
#' @inheritParams fmt_number
#' @param escape an option to escape text according to the final output format
#'   of the table. For example, if a Latex table is to be generated then Latex
#'   escaping would be performed during rendering. By default this is set to
#'   \code{TRUE} and setting to \code{FALSE} is useful in the case where
#'   Latex-formatted text should be passed through to the output Latex table
#'   unchanged.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # keep only the `char` column;
#' # pass the data in that column through
#' # but apply a simple pattern that adds
#' # an 's' to the non-NA values
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(char) %>%
#'   gt() %>%
#'   fmt_passthrough(
#'     columns = vars(char),
#'     rows = !is.na(char),
#'     pattern = "{x}s"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_passthrough_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_passthrough <- function(data,
                            columns,
                            rows = NULL,
                            escape = TRUE,
                            pattern = "{x}") {

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        html = function(x) {

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x <- paste0(pre_post_txt[1], x, pre_post_txt[2])

          if (escape) {
            x <- x %>% process_text(context = "html")
          }

          x
        },
        latex = function(x) {

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x <- paste0(pre_post_txt[1], x, pre_post_txt[2])

          if (escape) {
            x <- x %>% process_text(context = "latex")
          }

          x
        },
        default = function(x) {

          # Handle formatting of pattern
          pre_post_txt <- get_pre_post_txt(pattern)
          x <- paste0(pre_post_txt[1], x, pre_post_txt[2])

          x
        }
      ))
}

#' Format missing values
#'
#' Wherever there is missing data (i.e., \code{NA} values) a customizable mark
#' may present better than the standard `NA` text that would otherwise appear.
#' @inheritParams fmt_number
#' @param missing_text the text to be used in place of \code{NA} values in the
#' rendered table.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # NA values in different columns will
#' # be given replacement text
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(-row, -group) %>%
#'   gt() %>%
#'   fmt_missing(
#'     columns = 1:2,
#'     missing_text = "missing"
#'   ) %>%
#'   fmt_missing(
#'     columns = 4:7,
#'     missing_text = "nothing"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_missing_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @export
fmt_missing <- function(data,
                        columns,
                        rows = NULL,
                        missing_text = "---") {

  # Capture expression in `rows`
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = !!rows,
      fns = list(
        html = function(x) {
          if (missing_text == "---") {
            missing_text <- "\u2014"
          } else if (missing_text == "--") {
            missing_text <- "\u2013"
          }

          x[is.na(x)] <- missing_text
          x
        },
        default = function(x) {

          x[is.na(x)] <- missing_text
          x
        }
      ))
}

#' Set a column format with a formatter function
#' @inheritParams fmt_number
#' @param fns a single formatting function or a named list of functions.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Use `exibble` to create a gt table;
#' # NA values in different columns will
#' # be given replacement text
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(-row, -group) %>%
#'   gt() %>%
#'   fmt(
#'     columns = vars(num),
#'     fns = function(x) {
#'       paste0("'", x * 1000, "'")
#'     }
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_1.svg}{options: width=100\%}}
#'
#' @family data formatting functions
#' @import rlang
#' @importFrom tibble rownames_to_column
#' @importFrom dplyr filter arrange
#' @export
fmt <- function(data,
                columns = NULL,
                rows = NULL,
                fns) {

  # Get the `data_df` data frame from `data`
  data_df <- as.data.frame(data)

  # Get the `stub_df` data frame from `data`
  stub_df <- attr(data, "stub_df", exact = TRUE)

  # Collect the column names and column indices
  # from `data_df`
  colnames <- names(data_df)

  # Collect the rownames from `stub_df`
  rownames <- stub_df$rowname

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  columns <- rlang::enquo(columns)
  rows <- rlang::enquo(rows)

  resolved_columns <-
    resolve_vars(var_expr = columns, var_names = colnames, data_df = data_df)

  resolved_rows <-
    resolve_vars(var_expr = rows, var_names = rownames, data_df = data_df)

  # Translate the column indices to column names
  resolved_columns <- colnames[resolved_columns]

  # If a single function is supplied to `fns` then
  # repackage that into a list as the `default` function
  if (is.function(fns)) {
    fns <- list(default = fns)
  }

  # Create the `formatter_list`, which is a bundle of
  # formatting functions for specific columns and rows
  formatter_list <- list(
    func = fns,
    cols = resolved_columns,
    rows = resolved_rows)

  # Incorporate the `formatter_list` object as the next
  # list in the `formats` list of lists
  next_index <- length(attr(data, "formats", exact = TRUE)) + 1
  attr(data, "formats")[[next_index]] <- formatter_list

  data
}
