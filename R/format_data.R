#' Format numeric values
#' @param data a table object that is created using the \code{\link{gt}()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any value results in all
#' rows in \code{columns} being formatted.
#' @param decimals an option to specify the exact number of decimal places to
#' use. The default number of decimal places is \code{2}.
#' @param drop_trailing_zeros a logical value that allows for removal of
#' trailing zeros (those redundant zeros after the decimal mark).
#' @param negative_val the formatting to use for negative values. With
#' \code{signed} (the default), negative values will be shown with a negative
#' sign. Using \code{parens} will show the negative value in parentheses.
#' @param use_seps an option to use digit group separators. The type of digit
#' group separator is set by \code{sep_mark} and overridden if a locale ID is
#' provided to \code{locale}. This setting is \code{TRUE} by default.
#' @param scale_by a value to scale the input. The default is \code{1.0}.
#' @param pattern a formatting pattern that allows for decoration of the
#' formatted value. The value itself is represented by \code{{x}} and all
#' other characters are taken to be string literals.
#' @param sep_mark the mark to use as a separator between groups of digits.
#' @param dec_mark the character to use as a decimal mark.
#' @param locale an optional locale ID that can be used for formatting the value
#' according the locale's rules. Examples include \code{"en_US"} for English
#' (United States) and \code{"fr_FR"} for French (France). The use of a valid
#' locale ID will override any values provided in \code{sep_mark} and
#' \code{dec_mark}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' library(tidyverse)
#'
#' # Create a table object using the
#' # `mtcars` dataset and format specified
#' # numeric columns to display values to
#' # two decimal places
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_number(
#'     columns = vars(mpg, disp, drat, qsec),
#'     decimals = 5)
#'
#' # Create a tibble with two columns
#' # that are both numeric
#' data_tbl <-
#'   dplyr::tribble(
#'     ~val_1,   ~val_2,
#'     8236625,  -2345,
#'     6533405,  -7865,
#'     7363931,  2345,
#'     9326440,  7543)
#'
#' # Create a gt table from `data_tbl` and
#' # scale the numeric values in columns
#' # `val_1` and `val_2` and apply a suffix
#' gt(data_tbl) %>%
#'   fmt_number(
#'     columns = vars(val_1),
#'     decimals = 2,
#'     scale_by = 1E-6,
#'     pattern = "{x}") %>%
#'   fmt_number(
#'     columns = vars(val_2),
#'     decimals = 2,
#'     scale_by = 1/1000,
#'     pattern = "{x}K")
#' @family data formatting functions
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

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
#' @inheritParams fmt_number
#' @return an object of class \code{gt_tbl}.
#' @examples
#' # Create a table object using the
#' # `mtcars` dataset and format specified
#' # numeric columns to display values in
#' # scientific notation
#' gt(mtcars, rownames_to_stub = TRUE) %>%
#'   fmt_scientific(
#'     columns = vars(disp),
#'     decimals = 2)
#' @family data formatting functions
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

  # Create the html formatting function for scientific notation
  format_fcn_sci_notn_html <- format_fcn_sci_notn_factory(
    exp_start_str = " &times; 10<sup class='gt_super'>",
    exp_end_str = "</sup>")

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
        html = format_fcn_sci_notn_html,
        default = format_fcn_sci_notn_default))
}

#' Format values as a percentage
#' @inheritParams fmt_number
#' @param incl_space an option on whether to include a space between the value
#' and the percent sign. The default is to not introduce a space character.
#' @param placement the placement of the percent sign. This can be either be
#' \code{right} (the default) or \code{left}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' library(tidyverse)
#'
#' # Create a tibble with two columns
#' # that are both numeric
#' data_tbl <-
#'   dplyr::tribble(
#'     ~val_1, ~val_2,
#'     0.345,  2.6,
#'     0.234,  3.3,
#'     0.53,   3.8,
#'     0.391,  4.2)
#'
#' # Create a table object using this
#' # dataset and foramt the `val_1` column
#' # as percentage values and `val_2`
#' # as numeric values
#' gt(data_tbl) %>%
#'   fmt_percent(
#'     columns = vars(val_1),
#'     decimals = 1) %>%
#'   fmt_number(
#'     columns = vars(val_2),
#'     decimals = 2)
#' @family data formatting functions
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

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
#' @inheritParams fmt_number
#' @param currency the currency to use for the numeric value. This is to be
#' supplied as a 3-letter currency code. Examples include \code{"USD"} for
#' U.S. Dollars and \code{"EUR"} for the Euro currency.
#' @param use_subunits an option for whether the subunits portion of a currency
#' value should be displayed.
#' @param decimals an option to specify the exact number of decimal places to
#' use for the currency's subunits.
#' @param placement the placement of the currency symbol. This can be either be
#' \code{left} (the default) or \code{right}.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' library(tidyverse)
#'
#' # Create a tibble with two columns
#' # that are both numeric
#' data_tbl <-
#'   dplyr::tribble(
#'     ~val_usd, ~val_jpy,
#'     23.346,   2606.95,
#'     832.830,  93002.54,
#'     72.013,   8041.73,
#'     83.1,     9279.82)
#'
#' # Create a table object using this
#' # dataset and where the `val_usd`
#' # and `val_jpy` are formatted as
#' # the `USD` and `JPY` currencies
#' gt(data_tbl) %>%
#'   fmt_currency(
#'     columns = vars(val_usd),
#'     currency = "USD") %>%
#'   fmt_currency(
#'     columns = vars(val_jpy),
#'     currency = "JPY")
#'
#' # Create another tibble with larger
#' # numeric values
#' data_tbl_lg <-
#'   dplyr::tribble(
#'     ~val_usd_lg, ~val_jpy_lg,
#'     546262,      3950249,
#'     729472,      5390202,
#'     292592,      9373824,
#'     573256,      2350300)
#'
#' # Create a table object using this
#' # dataset and where the `val_usd`
#' # and `val_jpy` are still formatted as
#' # the `USD` and `JPY` currencies but
#' # this time with scaled values
#' # (thousands and millions with the
#' # appropriate suffixes)
#' gt(data_tbl_lg) %>%
#'   fmt_currency(
#'     columns = vars(val_usd_lg),
#'     currency = "USD",
#'     decimals = 1,
#'     scale_by = 1/1000,
#'     pattern = "{x}K") %>%
#'   fmt_currency(
#'     columns = vars(val_jpy_lg),
#'     currency = "JPY",
#'     decimals = 2,
#'     scale_by = 1E-6,
#'     pattern = "{x}M")
#' @family data formatting functions
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
  if (!is_currency_valid(currency = currency)) {

    message("The value supplied for `currency` is not valid.")
    return(data)
  }

  # Get the currency string for the HTML context
  currency_str_html <-
    get_currency_str(currency = currency)

  # Get the currency string for the non-HTML context
  currency_str <-
    get_currency_str(currency = currency, fallback_to_code = TRUE)

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

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
              drop0trailing = FALSE)

          # Handle placement of the currency symbol
          if (placement == "left") {
            x[non_na_x] <- paste0(currency_str, x[non_na_x])
          } else {
            x[non_na_x] <- paste0(x[non_na_x], currency_str)
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
        html = function(x) {

          # Determine which of `x` are not NA
          non_na_x <- !is.na(x)

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
            x[non_na_x] <- paste0(currency_str_html, x[non_na_x])
          } else {
            x[non_na_x] <- paste0(x[non_na_x], currency_str_html)
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
        }))
}

#' Format values as dates
#'
#' See \code{\link{info_date_style}()} for a useful reference on
#' \code{date_style}.
#'
#' @inheritParams fmt_number
#' @param date_style the date style to use. Supply a number (from \code{1} to
#' \code{14}) that corresponds to the preferred date style. Use
#' \code{\link{info_date_style}()} to see the different numbered and named date
#' presets.
#' @return an object of class \code{gt_tbl}.
#' @examples
#' library(tidyverse)
#'
#' # Create a tibble with a column
#' # that contains dates
#' data_tbl <-
#'   dplyr::tribble(
#'     ~date,
#'     "2017-10-15",
#'     "2013-02-22",
#'     "2014-09-22",
#'     "2018-01-10")
#'
#' # Create a table object using this
#' # dataset and format the `date`
#' # column with `date_style` '2'
#' gt(data_tbl) %>%
#'   fmt_date(
#'     columns = vars(date),
#'     date_style = "2")
#' @family data formatting functions
#' @export
fmt_date <- function(data,
                     columns,
                     rows = NULL,
                     date_style) {

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
#' @inheritParams fmt_number
#' @param time_style the time style to use. Supply a number (from \code{1} to
#' \code{5}) that corresponds to the preferred time style. Use
#' \code{\link{info_time_style}()} to see the different numbered and named time
#' presets.
#' @examples
#' library(tidyverse)
#'
#' # Create a tibble with a column
#' # that contains 24-hour time strings
#' data_tbl <-
#'   dplyr::tribble(
#'     ~time,
#'     "12:35:23",
#'     "15:01:34",
#'     "09:45:23",
#'     "01:32:00")
#'
#' # Create a table object using this
#' # dataset and format the `time`
#' # column with `time_style` '3'
#' gt(data_tbl) %>%
#'   fmt_time(
#'     columns = vars(time),
#'     time_style = 3)
#' @family data formatting functions
#' @export
fmt_time <- function(data,
                     columns,
                     rows = NULL,
                     time_style) {

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
#' @family data formatting functions
#' @export
fmt_datetime <- function(data,
                         columns,
                         rows = NULL,
                         date_style,
                         time_style) {

  # Transform `date_style` to `date_format`
  date_format <- get_date_format(date_style = date_style)

  # Transform `time_style` to `time_format`
  time_format <- get_time_format(time_style = time_style)

  # Combine into a single datetime format string
  date_time_format_str <-
    paste0(date_format, " ", time_format)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
        default = function(x) {

          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
            strftime(format = date_time_format_str) %>%
            tidy_gsub("^0", "") %>%
            tidy_gsub(" 0([0-9])", " \\1") %>%
            tidy_gsub("pm$", "PM") %>%
            tidy_gsub("am$", "AM")
        }))
}

#' Format missing values
#'
#' Wherever there is missing data (i.e., \code{NA} values) a customizable mark
#' may present better than the standard `NA` text that would otherwise appear.
#' @param data a table object that is created using the \code{gt()} function.
#' @param columns the column names to format.
#' @param rows optional rows to format. Not providing any value results in all
#' rows in \code{columns} being formatted.
#' @param missing_text the text to be used in place of \code{NA} values in the
#' rendered table.
#' @return an object of class \code{gt_tbl}.
#' @family data formatting functions
#' @export
fmt_missing <- function(data,
                        columns,
                        rows = NULL,
                        missing_text = "---") {

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(data = data,
      columns = columns,
      rows = rows,
      fcns = list(
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
#' @param data a table object that is created using the \code{gt()} function.
#' @param columns the specification for which columns are to be formatted.
#' @param rows an optional specification for which rows are to be formatted.
#' @param fcns a single formatting function or a named list of functions.
#' @return an object of class \code{gt_tbl}.
#' @family data formatting functions
#' @export
fmt <- function(data,
                columns,
                rows = TRUE,
                fcns) {

  # Obtain the resolved columns and rows
  resolved <- column_row_resolution(data, columns, rows)

  # Return data if there are no rows or columns to format
  if (no_intersection(resolved)) {
    return(data)
  }

  # If a single function is supplied to `fcns` then
  # repackage that into a list as the `default` function
  if (is.function(fcns)) {
    fcns <- list(default = fcns)
  }

  # Create the `formatter_list`, which is a bundle of
  # formatting functions for specific columns and rows
  formatter_list <- list(
    func = fcns,
    cols = resolved$columns,
    rows = resolved$rows)

  # Incorporate the `formatter_list` object as the next
  # list in the `formats` list of lists
  next_index <- length(attr(data, "formats", exact = TRUE)) + 1
  attr(data, "formats")[[next_index]] <- formatter_list

  data
}
