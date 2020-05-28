#' Format numeric values
#'
#' With numeric values in a **gt** table, we can perform number-based
#' formatting so that the targeted values are rendered with a higher
#' consideration for tabular presentation. Furthermore, there is finer control
#' over numeric formatting with the following options:
#' \itemize{
#' \item decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item negative values: choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' \item scaling: we can choose to scale targeted values by a multiplier value
#' \item large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' \item pattern: option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @param data A table object that is created using the [gt()] function.
#' @param columns The columns to format. Can either be a series of column names
#'   provided in [vars()], a vector of column indices, or a helper function
#'   focused on selections. The select helper functions are: [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], and [everything()].
#' @param rows Optional rows to format. Not providing any value results in all
#'   rows in `columns` being formatted. Can either be a vector of row captions
#'   provided [c()], a vector of row indices, or a helper function focused on
#'   selections. The select helper functions are: [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], and [everything()].
#'   We can also use expressions to filter down to the rows we need (e.g.,
#'   `[colname_1] > 100 & [colname_2] < 50`).
#' @param decimals An option to specify the exact number of decimal places to
#'   use. The default number of decimal places is `2`.
#' @param accounting An option to use accounting style for negative values. With
#'   `FALSE` (the default), negative values will be shown with a minus sign.
#'   Using `accounting = TRUE` will put negative values in parentheses.
#' @param drop_trailing_zeros A logical value that allows for removal of
#'   trailing zeros (those redundant zeros after the decimal mark).
#' @param use_seps An option to use digit group separators. The type of digit
#'   group separator is set by `sep_mark` and overridden if a locale ID is
#'   provided to `locale`. This setting is `TRUE` by default.
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#'   This value will be ignored if using any of the `suffixing` options (i.e.,
#'   where `suffixing` is not set to `FALSE`).
#' @param suffixing An option to scale and apply suffixes to larger numbers
#'   (e.g., `1924000` can be transformed to `1.92M`). This option can accept a
#'   logical value, where `FALSE` (the default) will not perform this
#'   transformation and `TRUE` will apply thousands (`K`), millions (`M`),
#'   billions (`B`), and trillions (`T`) suffixes after automatic value scaling.
#'   We can also specify which symbols to use for each of the value ranges by
#'   using a character vector of the preferred symbols to replace the defaults
#'   (e.g., `c("k", "Ml", "Bn", "Tr")`).
#'
#'   Including `NA` values in the vector will ensure that the particular range
#'   will either not be included in the transformation (e.g, `c(NA, "M", "B",
#'   "T")` won't modify numbers in the thousands range) or the range will
#'   inherit a previous suffix (e.g., with `c("K", "M", NA, "T")`, all numbers
#'   in the range of millions and billions will be in terms of millions).
#'
#'   Any use of `suffixing` (where it is not set expressly as `FALSE`) means
#'   that any value provided to `scale_by` will be ignored.
#' @param pattern A formatting pattern that allows for decoration of the
#'   formatted value. The value itself is represented by `{x}` and all other
#'   characters are taken to be string literals.
#' @param sep_mark The mark to use as a separator between groups of digits
#'   (e.g., using `sep_mark = ","` with `1000` would result in a formatted value
#'   of `1,000`).
#' @param dec_mark The character to use as a decimal mark (e.g., using `dec_mark
#'   = ","` with `0.152` would result in a formatted value of `0,152`).
#' @param locale An optional locale ID that can be used for formatting the value
#'   according the locale's rules. Examples include `"en_US"` for English
#'   (United States) and `"fr_FR"` for French (France). The use of a valid
#'   locale ID will override any values provided in `sep_mark` and `dec_mark`.
#'   We can use the [info_locales()] function as a useful reference for all of
#'   the locales that are supported.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' library(tidyr)
#'
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
#' # Use `countrypops` to create a gt
#' # table; format all numeric columns
#' # to use large-number suffixing
#' tab_2 <-
#'   countrypops %>%
#'   dplyr::select(country_code_3, year, population) %>%
#'   dplyr::filter(
#'     country_code_3 %in% c(
#'       "CHN", "IND", "USA", "PAK", "IDN")
#'   ) %>%
#'   dplyr::filter(year > 1975 & year %% 5 == 0) %>%
#'   tidyr::spread(year, population) %>%
#'   dplyr::arrange(desc(`2015`)) %>%
#'   gt(rowname_col = "country_code_3") %>%
#'   fmt_number(
#'     columns = 2:9,
#'     decimals = 2,
#'     suffixing = TRUE
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_number_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_number_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-1
#'
#' @import rlang
#' @export
fmt_number <- function(data,
                       columns,
                       rows = NULL,
                       decimals = 2,
                       accounting = FALSE,
                       drop_trailing_zeros = FALSE,
                       use_seps = TRUE,
                       scale_by = 1.0,
                       suffixing = FALSE,
                       pattern = "{x}",
                       sep_mark = ",",
                       dec_mark = ".",
                       locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = c("numeric", "integer"))) {
    stop("The `fmt_number()` function can only be used on `columns` with numeric data",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `suffix_df` object
        suffix_df <- create_suffix_df(x, decimals, suffix_labels, scale_by)

        x %>%
          # Scale the `x_vals` by the `scale_by` values
          scale_x_values(suffix_df$scale_by) %>%
          # Format numeric values to character-based numbers
          format_num_to_str(
            context = context, decimals = decimals, sep_mark = sep_mark,
            dec_mark = dec_mark, drop_trailing_zeros = drop_trailing_zeros
          ) %>%
          format_as_accounting(
            x = x, context = context, accounting = accounting
          ) %>%
          # With large-number suffixing support, we paste the
          # vector of suffixes to the right of the values
          paste_right(suffix_df$suffix)
      }
    )
  )
}

#' Format values to scientific notation
#'
#' With numeric values in a **gt** table, we can perform formatting so that the
#' targeted values are rendered in scientific notation. Furthermore, there is
#' fine control with the following options:
#' \itemize{
#' \item decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item scaling: we can choose to scale targeted values by a multiplier value
#' \item pattern: option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_scientific_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-2
#'
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

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Set default values
  suffixing <- FALSE
  use_seps <- TRUE

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = c("numeric", "integer"))) {
    stop("The `fmt_scientific()` function can only be used on `columns` with numeric data",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Define the marks by context
        exp_marks <- context_exp_marks(context)
        minus_mark <- context_minus_mark(context)

        # Define the `replace_minus()` function
        replace_minus <- function(x) {
          x %>% tidy_gsub("-", minus_mark, fixed = TRUE)
        }

        # Create the `suffix_df` object
        suffix_df <- create_suffix_df(x, decimals, suffix_labels, scale_by)

        # Scale the `x_vals` by the `scale_by` values
        x <- x %>% scale_x_values(suffix_df$scale_by)

        x_str <-
          x %>%
          # Format numeric values to character-based numbers
          format_num_to_str(
            context = context, decimals = decimals, sep_mark = sep_mark,
            dec_mark = dec_mark, drop_trailing_zeros = drop_trailing_zeros,
            format = "e", replace_minus_mark = FALSE
          )

        # # Determine which values don't require the (x 10^n)
        # # for scientific foramtting since their order would be zero
        small_pos <- has_order_zero(x)

        # For any numbers that shouldn't have an exponent, remove
        # that portion from the character version
        x_str[small_pos] <-
          split_scientific_notn(x_str[small_pos])$num %>%
          replace_minus()

        # For any non-NA numbers that do have an exponent, format
        # those according to the output context
        sci_parts <- split_scientific_notn(x_str[!small_pos])

        x_str[!small_pos] <-
          paste0(
            sci_parts$num %>% replace_minus(),
            exp_marks[1],
            sci_parts$exp %>% replace_minus(),
            exp_marks[2]
          )

        x_str
      }
    )
  )
}

#' Format values to take a predefined symbol
#'
#' @inheritParams fmt_number
#' @inheritParams fmt_currency
#' @return An object of class `gt_tbl`.
#' @noRd
fmt_symbol <- function(data,
                       columns,
                       rows = NULL,
                       symbol = "*",
                       accounting = FALSE,
                       decimals = NULL,
                       drop_trailing_zeros = FALSE,
                       use_seps = TRUE,
                       scale_by = 1.0,
                       suffixing = FALSE,
                       pattern = "{x}",
                       sep_mark = ",",
                       dec_mark = ".",
                       placement = "left",
                       incl_space = FALSE,
                       locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `x_str` vector
        x_str <- character(length(x))

        # Create the `suffix_df` object
        suffix_df <- create_suffix_df(x, decimals, suffix_labels, scale_by)

        # Scale the `x_vals` by the `scale_by` value
        x <- x %>% scale_x_values(suffix_df$scale_by)

        is_negative_x <- x < 0
        is_not_negative_x <- !is_negative_x

        if (any(is_not_negative_x)) {

          x_str[is_not_negative_x] <-
            x[is_not_negative_x] %>%
            # Format numeric values to character-based numbers
            format_num_to_str_c(
              context = context, decimals = decimals, sep_mark = sep_mark,
              dec_mark = dec_mark, drop_trailing_zeros = drop_trailing_zeros
            )
        }

        x_abs_str <- x_str

        if (any(is_negative_x)) {

          x_abs_str[is_negative_x] <-
            x[is_negative_x] %>%
            abs() %>%
            # Format numeric values to character-based numbers
            format_num_to_str_c(
              context = context, decimals = decimals, sep_mark = sep_mark,
              dec_mark = dec_mark, drop_trailing_zeros = drop_trailing_zeros
            )
        }

        x_str <-
          # Format values with a symbol string
          format_symbol_str(
            context = context, x_abs_str = x_abs_str, x = x,
            symbol = symbol, incl_space = incl_space,
            placement = placement
          ) %>%
          # Format values in accounting style
          format_as_accounting(
            x = x, context = context, accounting = accounting
          ) %>%
          # With large-number suffixing support, we paste the
          # vector of suffixes to the right of the values
          paste_right(suffix_df$suffix)

        x_str
      }
    )
  )
}

#' Format values as a percentage
#'
#' With numeric values in a **gt** table, we can perform percentage-based
#' formatting. It is assumed the input numeric values are in a fractional format
#' since the numbers will be automatically multiplied by `100` before decorating
#' with a percent sign. For more control over percentage formatting, we can use
#' the following options:
#' \itemize{
#' \item percent sign placement: the percent sign can be placed after or
#' before the values and a space can be inserted between the symbol and the
#' value.
#' \item decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' \item negative values: choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' \item pattern: option to use a text pattern for decoration of the formatted
#' values
#' \item locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#' }
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param incl_space An option for whether to include a space between the value
#'   and the percent sign. The default is to not introduce a space character.
#' @param placement The placement of the percent sign. This can be either be
#'   `right` (the default) or `left`.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `pizzaplace` to create a gt table;
#' # format the `frac_of_quota` column to
#' # display values as percentages
#' tab_1 <-
#'   pizzaplace %>%
#'   dplyr::mutate(month = as.numeric(substr(date, 6, 7))) %>%
#'   dplyr::group_by(month) %>%
#'   dplyr::summarize(pizzas_sold = dplyr::n()) %>%
#'   dplyr::ungroup() %>%
#'   dplyr::mutate(frac_of_quota = pizzas_sold / 4000) %>%
#'   gt(rowname_col = "month") %>%
#'   fmt_percent(
#'     columns = vars(frac_of_quota),
#'     decimals = 1
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_percent_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-3
#'
#' @import rlang
#' @export
fmt_percent <- function(data,
                        columns,
                        rows = NULL,
                        decimals = 2,
                        accounting = FALSE,
                        drop_trailing_zeros = FALSE,
                        use_seps = TRUE,
                        pattern = "{x}",
                        sep_mark = ",",
                        dec_mark = ".",
                        incl_space = FALSE,
                        placement = "right",
                        locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = c("numeric", "integer"))) {
    stop("The `fmt_percent()` function can only be used on `columns` with numeric data",
         call. = FALSE)
  }

  fmt_symbol(
    data = data,
    columns = !!columns,
    rows = !!rows,
    symbol = "%",
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = drop_trailing_zeros,
    use_seps = use_seps,
    scale_by = 100,
    suffixing = FALSE,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    placement = placement,
    incl_space = incl_space,
    locale = locale
  )
}

#' Format values as currencies
#'
#' With numeric values in a **gt** table, we can perform currency-based
#' formatting. This function supports both automatic formatting with a
#' three-letter or numeric currency code. We can also specify a custom currency
#' that is formatted according to the output context with the [currency()]
#' helper function. Numeric formatting facilitated through the use of a locale
#' ID. We have fine control over the conversion from numeric values to currency
#' values, where we could take advantage of the following options:
#' \itemize{
#' \item the currency: providing a currency code or common currency name will
#' procure the correct currency symbol and number of currency subunits; we could
#' also use the [currency()] helper function to specify a custom currency
#' \item currency symbol placement: the currency symbol can be placed before
#' or after the values
#' \item decimals/subunits: choice of the number of decimal places, and a
#' choice of the decimal symbol, and an option on whether to include or exclude
#' the currency subunits (decimal portion)
#' \item negative values: choice of a negative sign or parentheses for values
#' less than zero
#' \item digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' \item scaling: we can choose to scale targeted values by a multiplier value
#' \item large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' \item pattern: option to use a text pattern for decoration of the formatted
#' currency values
#' \item locale-based formatting: providing a locale ID will result in
#' currency formatting specific to the chosen locale
#' }
#' We can use the [info_currencies()] function for a useful reference on all of
#' the possible inputs to the `currency` argument.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param currency The currency to use for the numeric value. This input can be
#'   supplied as a 3-letter currency code (e.g., `"USD"` for U.S. Dollars,
#'   `"EUR"` for the Euro currency). Use [info_currencies()] to get an
#'   information table with all of the valid currency codes and examples of
#'   each. Alternatively, we can provide a common currency name (e.g.,
#'   `"dollar"`, `"pound"`, `"yen"`, etc.) to simplify the process. Use
#'   [info_currencies()] with the `type == "symbol"` option to view an
#'   information table with all of the supported currency symbol names along
#'   with examples.
#'
#'   We can also use the [currency()] helper function to specify a custom
#'   currency, where the string could vary across output contexts. For example,
#'   using `currency(html = "&fnof;", default = "f")` would give us a suitable
#'   glyph for the Dutch guilder in an HTML output table, and it would simply be
#'   the letter "f" in all other output contexts). Please note that `decimals`
#'   will default to `2` when using the [currency()] helper function.
#'
#'   If nothing is provided to `currency` then `"USD"` (U.S. dollars) will be
#'   used.
#' @param use_subunits An option for whether the subunits portion of a currency
#'   value should be displayed. By default, this is `TRUE`.
#' @param placement The placement of the currency symbol. This can be either be
#'   `left` (the default) or `right`.
#' @param incl_space An option for whether to include a space between the value
#'   and the currency symbol. The default is to not introduce a space character.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_currency_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_currency_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-4
#'
#' @import rlang
#' @export
fmt_currency <- function(data,
                         columns,
                         rows = NULL,
                         currency = "USD",
                         use_subunits = TRUE,
                         accounting = FALSE,
                         decimals = NULL,
                         use_seps = TRUE,
                         scale_by = 1.0,
                         suffixing = FALSE,
                         pattern = "{x}",
                         sep_mark = ",",
                         dec_mark = ".",
                         placement = "left",
                         incl_space = FALSE,
                         locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = c("numeric", "integer"))) {
    stop("The `fmt_currency()` function can only be used on `columns` with numeric data",
         call. = FALSE)
  }

  # Stop function if `currency` does not have a valid value
  validate_currency(currency = currency)

  # Get the number of decimal places
  decimals <-
    get_currency_decimals(
      currency = currency,
      decimals = decimals,
      use_subunits = use_subunits
    )

  fmt_symbol(
    data = data,
    columns = !!columns,
    rows = !!rows,
    symbol = currency,
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = FALSE,
    use_seps = use_seps,
    scale_by = scale_by,
    suffixing = suffixing,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    placement = placement,
    incl_space = incl_space,
    locale = locale
  )
}

#' Format values as dates
#'
#' Format input date values that are either of the `Date` type, or, are
#' character-based and expressed according to the ISO 8601 date format
#' (`YYYY-MM-DD`). Once the appropriate data cells are targeted with `columns`
#' (and, optionally, `rows`), we can simply apply a preset date style to format
#' the dates. The following date styles are available for simpler formatting of
#' ISO dates (all using the input date of `2000-02-29` in the example output
#' dates):
#' \enumerate{
#' \item iso: `2000-02-29`
#' \item wday_month_day_year: `Tuesday, February 29, 2000`
#' \item wd_m_day_year: `Tue, Feb 29, 2000`
#' \item wday_day_month_year: `Tuesday 29 February 2000`
#' \item month_day_year: `February 29, 2000`
#' \item m_day_year: `Feb 29, 2000`
#' \item day_m_year: `29 Feb 2000`
#' \item day_month_year: `29 February 2000`
#' \item day_month: `29 February`
#' \item year: `2000`
#' \item month: `February`
#' \item day: `29`
#' \item year.mn.day: `2000/02/29`
#' \item y.mn.day: `0/02/29`
#' }
#' We can use the [info_date_style()] function for a useful reference on all of
#' the possible inputs to `date_style`.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param date_style The date style to use. Supply a number (from `1` to `14`)
#'   that corresponds to the preferred date style. Use [info_date_style()] to
#'   see the different numbered and named date presets.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_date_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_date_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-5
#'
#' @import rlang
#' @export
fmt_date <- function(data,
                     columns,
                     rows = NULL,
                     date_style = 2) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = c("Date", "character"))) {
    stop("The `fmt_date()` function can only be used on `columns` with `character` or `Date` values",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      default = function(x) {

        # If `x` is of the `Date` type, simply make
        # that a character vector
        if (inherits(x, "Date")) {
          x <- as.character(x)
        }

        date <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_format_str)

        if (date_style %in% 2:12) {
          date <- date %>% tidy_gsub(., "^0", "")
        }

        date %>%
          tidy_gsub(" 0([0-9])", " \\1") %>%
          tidy_gsub("pm$", "PM") %>%
          tidy_gsub("am$", "AM")
      }
    )
  )
}

#' Format values as times
#'
#' Format input time values that are character-based and expressed according to
#' the ISO 8601 time format (`HH:MM:SS`). Once the appropriate data cells are
#' targeted with `columns` (and, optionally, `rows`), we can simply apply a
#' preset time style to format the times. The following time styles are
#' available for simpler formatting of ISO times (all using the input time of
#' `14:35:00` in the example output times):
#' \enumerate{
#' \item hms: `14:35:00`
#' \item hm: `14:35`
#' \item hms_p: `2:35:00 PM`
#' \item hm_p: `2:35 PM`
#' \item h_p: `2 PM`
#' }
#' We can use the [info_time_style()] function for a useful reference on all of
#' the possible inputs to `time_style`.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param time_style The time style to use. Supply a number (from `1` to `5`)
#'   that corresponds to the preferred time style. Use [info_time_style()] to
#'   see the different numbered and named time presets.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_time_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_time_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-6
#'
#' @import rlang
#' @export
fmt_time <- function(data,
                     columns,
                     rows = NULL,
                     time_style = 2) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = "character")) {
    stop("The `fmt_date()` function can only be used on `columns` with `character` values",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      default = function(x) {

        time <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = time_format_str)

        if (time_style %in% 3:5) {
          time <- time %>% tidy_gsub(., "^0", "")
        }

        time %>%
          tidy_gsub(" 0([0-9])", " \\1") %>%
          tidy_gsub("pm$", "PM") %>%
          tidy_gsub("am$", "AM")
      }
    )
  )
}

#' Format values as date-times
#'
#' Format input date-time values that are character-based and expressed
#' according to the ISO 8601 date-time format (`YYYY-MM-DD HH:MM:SS`). Once the
#' appropriate data cells are targeted with `columns` (and, optionally, `rows`),
#' we can simply apply preset date and time styles to format the date-time
#' values. The following date styles are available for simpler formatting of the
#' date portion (all using the input date of `2000-02-29` in the example output
#' dates):
#' \enumerate{
#' \item iso: `2000-02-29`
#' \item wday_month_day_year: `Tuesday, February 29, 2000`
#' \item wd_m_day_year: `Tue, Feb 29, 2000`
#' \item wday_day_month_year: `Tuesday 29 February 2000`
#' \item month_day_year: `February 29, 2000`
#' \item m_day_year: `Feb 29, 2000`
#' \item day_m_year: `29 Feb 2000`
#' \item day_month_year: `29 February 2000`
#' \item day_month: `29 February`
#' \item year: `2000`
#' \item month: `February`
#' \item day: `29`
#' \item year.mn.day: `2000/02/29`
#' \item y.mn.day: `0/02/29`
#' }
#' The following time styles are available for simpler formatting of the time
#' portion (all using the input time of `14:35:00` in the example output times):
#' \enumerate{
#' \item hms: `14:35:00`
#' \item hm: `14:35`
#' \item hms_p: `2:35:00 PM`
#' \item hm_p: `2:35 PM`
#' \item h_p: `2 PM`
#' }
#' We can use the [info_date_style()] and [info_time_style()] functions as
#' useful references for all of the possible inputs to `date_style` and
#' `time_style`.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @inheritParams fmt_date
#' @inheritParams fmt_time
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_datetime_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-7
#'
#' @import rlang
#' @export
fmt_datetime <- function(data,
                         columns,
                         rows = NULL,
                         date_style = 2,
                         time_style = 2) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Transform `date_style` to `date_format`
  date_format_str <- get_date_format(date_style = date_style)

  # Transform `time_style` to `time_format`
  time_format_str <- get_time_format(time_style = time_style)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, !!columns, valid_classes = "character")) {
    stop("The `fmt_datetime()` function can only be used on `columns` with `character` values",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      default = function(x) {

        date <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = date_format_str)

        if (date_style %in% 2:12) {
          date <- date %>% tidy_gsub(., "^0", "")
        }

        date <-
          date %>%
          tidy_gsub(" 0([0-9])", " \\1") %>%
          tidy_gsub("pm$", "PM") %>%
          tidy_gsub("am$", "AM")

        time <-
          ifelse(grepl("^[0-9]*?\\:[0-9]*?", x), paste("1970-01-01", x), x) %>%
          strftime(format = time_format_str)

        if (time_style %in% 3:5) {
          time <- time %>% tidy_gsub(., "^0", "")
        }

        time <-
          time %>%
          tidy_gsub(" 0([0-9])", " \\1") %>%
          tidy_gsub("pm$", "PM") %>%
          tidy_gsub("am$", "AM")

        datetime <-
          paste(date, time) %>%
          tidy_gsub("NA NA", "NA")

        datetime
      }
    )
  )
}

#' Format Markdown text
#'
#' Any Markdown-formatted text in the incoming cells will be transformed to the
#' appropriate output type during render when using `fmt_markdown()`.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Create a few Markdown-based
#' # text snippets
#' text_1a <- "
#' ### This is Markdown.
#'
#' Markdown’s syntax is comprised entirely of
#' punctuation characters, which punctuation
#' characters have been carefully chosen so as
#' to look like what they mean... assuming
#' you’ve ever used email.
#' "
#'
#' text_1b <- "
#' Info on Markdown syntax can be found
#' [here](https://daringfireball.net/projects/markdown/).
#' "
#'
#' text_2a <- "
#' The **gt** package has these datasets:
#'
#'  - `countrypops`
#'  - `sza`
#'  - `gtcars`
#'  - `sp500`
#'  - `pizzaplace`
#'  - `exibble`
#' "
#'
#' text_2b <- "
#' There's a quick reference [here](https://commonmark.org/help/).
#' "
#'
#' # Arrange the text snippets as a tibble
#' # using the `dplyr::tribble()` function;
#' # then, create a gt table and format
#' # all columns with `fmt_markdown()`
#' tab_1 <-
#'   dplyr::tribble(
#'     ~Markdown, ~md,
#'     text_1a,   text_2a,
#'     text_1b,   text_2b,
#'   ) %>%
#'     gt() %>%
#'     fmt_markdown(columns = TRUE) %>%
#'     tab_options(table.width = px(400))
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_markdown_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-8
#'
#' @import rlang
#' @export
fmt_markdown <- function(data,
                         columns,
                         rows = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Capture expression in `rows`
  columns <- rlang::enquo(columns)
  rows <- rlang::enquo(rows)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      html = function(x) {
        md_to_html(x)
      },
      latex = function(x) {
        markdown_to_latex(x)
      },
      default = function(x) {
        vapply(x, commonmark::markdown_text, character(1), USE.NAMES = FALSE) %>%
          stringr::str_replace("\n$", "")
      }
    )
  )
}

#' Format by simply passing data through
#'
#' Format by passing data through no other transformation other than: (1)
#' coercing to `character` (as all the `fmt_*()` functions do), and (2) applying
#' text via the `pattern` argument (the default is to apply nothing). All of
#' this is useful when don't want to modify the input data other than to
#' decorate it within a pattern. Also, this function is useful when used as the
#' `formatter` function in the [summary_rows()] function, where the output may
#' be text or useful as is.
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param escape An option to escape text according to the final output format
#'   of the table. For example, if a LaTeX table is to be generated then LaTeX
#'   escaping would be performed during rendering. By default this is set to
#'   `TRUE` and setting to `FALSE` is useful in the case where LaTeX-formatted
#'   text should be passed through to the output LaTeX table unchanged.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_passthrough_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-9
#'
#' @import rlang
#' @export
fmt_passthrough <- function(data,
                            columns,
                            rows = NULL,
                            escape = TRUE,
                            pattern = "{x}") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      html = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- x_str %>% process_text(context = "html")
        }

        x_str
      },
      latex = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        if (escape) {
          x_str <- x_str %>% process_text(context = "latex")
        }

        x_str
      },
      default = function(x) {

        # Create `x_str` with same length as `x`
        x_str <- rep(NA_character_, length(x))

        # Handle formatting of pattern
        x_str <-
          apply_pattern_fmt_x(
            pattern,
            values = x
          )

        x_str
      }
    )
  )
}

#' Format missing values
#'
#' Wherever there is missing data (i.e., `NA` values) a customizable mark may
#' present better than the standard `NA` text that would otherwise appear. The
#' `fmt_missing()` function allows for this replacement through its
#' `missing_text` argument (where an em dash serves as the default).
#'
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param missing_text The text to be used in place of `NA` values in the
#'   rendered table.
#'
#' @return An object of class `gt_tbl`.
#'
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
#' \if{html}{\figure{man_fmt_missing_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-10
#'
#' @import rlang
#' @export
fmt_missing <- function(data,
                        columns,
                        rows = NULL,
                        missing_text = "---") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Capture expression in `rows` and `columns`
  rows <- rlang::enquo(rows)
  columns <- rlang::enquo(columns)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = !!columns,
    rows = !!rows,
    fns = list(
      html = function(x) {

        missing_text <-
          context_missing_text(
            missing_text = missing_text,
            context = "html"
          )

        # Any values of `x` that are `NA` get
        # `missing_text` as output; any values that
        # are not missing get `NA` as their output
        # (meaning, the existing output for that
        # value, if it exists, should be inherited)
        ifelse(is.na(x), missing_text, NA_character_)
      },
      default = function(x) {

        # Any values of `x` that are `NA` get
        # `missing_text` as output; any values that
        # are not missing get `NA` as their output
        # (meaning, the existing output for that
        # value, if it exists, should be inherited)
        ifelse(is.na(x), missing_text, NA_character_)
      }
    )
  )
}

#' Set a column format with a formatter function
#'
#' The `fmt()` function provides greater control in formatting raw data values
#' than any of the specialized `fmt_*()` functions that are available in
#' **gt**. Along with the `columns` and `rows` arguments that provide some
#' precision in targeting data cells, the `fns` argument allows you to define
#' one or more functions for manipulating the raw data.
#' If providing a single function to `fns`, the recommended format is in the
#' form: `fns = function(x) ...`. This single function will format the targeted
#' data cells the same way regardless of the output format (e.g., HTML, LaTeX,
#' RTF).
#' If you require formatting of `x` that depends on the output format, a list of
#' functions can be provided for the `html`, `latex`, and `default` contexts.
#' This can be in the form of `fns = list(html = function(x) ..., latex =
#' function(x) ..., default = function(x) ...)`. In this multiple-function case,
#' we recommended including the `default` function as a fallback if all contexts
#' aren't provided.
#'
#' As with all of the `fmt_*()` functions, targeting of values is done through
#' `columns` and additionally by `rows` (if nothing is provided for `rows` then
#' entire columns are selected). A number of helper functions exist to make
#' targeting more effective. Conditional formatting is possible by providing a
#' conditional expression to the `rows` argument. See the Arguments section for
#' more information on this.
#'
#' @inheritParams fmt_number
#' @param fns Either a single formatting function or a named list of functions.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the numeric values in the `num`
#' # column with a function supplied to
#' # the `fns` argument
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
#' \if{html}{\figure{man_fmt_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-11
#'
#' @import rlang
#' @export
fmt <- function(data,
                columns = NULL,
                rows = NULL,
                fns) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)
  data_tbl <- dt_data_get(data = data)

  #
  # Resolution of columns and rows as integer vectors
  # providing the positions of the matched variables
  #

  columns <- rlang::enquo(columns)
  rows <- rlang::enquo(rows)

  resolved_columns <-
    resolve_vars(
      var_expr = !!columns,
      data = data
    )

  resolved_rows_idx <-
    resolve_data_vals_idx(
      var_expr = !!rows,
      data_tbl = data_tbl,
      vals = stub_df$rowname
    )

  # If a single function is supplied to `fns` then
  # repackage that into a list as the `default` function
  if (is.function(fns)) {
    fns <- list(default = fns)
  }

  # Create the `formatter_list`, which is a bundle of
  # formatting functions for specific columns and rows
  formatter_list <-
    list(
      func = fns,
      cols = resolved_columns,
      rows = resolved_rows_idx
    )

  dt_formats_add(data = data, formats = formatter_list)
}
