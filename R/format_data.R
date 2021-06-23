#' Format numeric values
#'
#' @description
#' With numeric values in a **gt** table, we can perform number-based
#' formatting so that the targeted values are rendered with a higher
#' consideration for tabular presentation. Furthermore, there is finer control
#' over numeric formatting with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @param data A table object that is created using the [gt()] function.
#' @param columns The columns to format. Can either be a series of column names
#'   provided in [c()], a vector of column indices, or a helper function
#'   focused on selections. The select helper functions are: [starts_with()],
#'   [ends_with()], [contains()], [matches()], [one_of()], [num_range()], and
#'   [everything()].
#' @param rows Optional rows to format. Providing either [everything()] (the
#'   default) or `TRUE` results in all rows in `columns` being formatted. Can
#'   either be a vector of row captions provided in [c()], a vector of row
#'   indices, or a helper function focused on selections. The select helper
#'   functions are: [starts_with()], [ends_with()], [contains()], [matches()],
#'   [one_of()], [num_range()], and [everything()]. We can also use expressions
#'   to filter down to the rows we need (e.g.,
#'   `[colname_1] > 100 & [colname_2] < 50`).
#' @param decimals An option to specify the exact number of decimal places to
#'   use. The default number of decimal places is `2`.
#' @param n_sigfig A option to format numbers to *n* significant figures. By
#'   default, this is `NULL` and thus number values will be formatted according
#'   to the number of decimal places set via `decimals`. If opting to format
#'   according to the rules of significant figures, `n_sigfig` must be a number
#'   greater than or equal to `1`. Any values passed to the `decimals` and
#'   `drop_trailing_zeros` arguments will be ignored.
#' @param drop_trailing_zeros A logical value that allows for removal of
#'   trailing zeros (those redundant zeros after the decimal mark).
#' @param drop_trailing_dec_mark A logical value that determines whether decimal
#'   marks should always appear even if there are no decimal digits to display
#'   after formatting (e.g, `23` becomes `23.`). The default for this is `TRUE`,
#'   which means that trailing decimal marks are not shown.
#' @param use_seps An option to use digit group separators. The type of digit
#'   group separator is set by `sep_mark` and overridden if a locale ID is
#'   provided to `locale`. This setting is `TRUE` by default.
#' @param accounting An option to use accounting style for values. With `FALSE`
#'   (the default), negative values will be shown with a minus sign. Using
#'   `accounting = TRUE` will put negative values in parentheses.
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
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign. This option is disregarded when using accounting
#'   notation with `accounting = TRUE`.
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
#'     columns = num,
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
                       rows = everything(),
                       decimals = 2,
                       n_sigfig = NULL,
                       drop_trailing_zeros = FALSE,
                       drop_trailing_dec_mark = TRUE,
                       use_seps = TRUE,
                       accounting = FALSE,
                       scale_by = 1.0,
                       suffixing = FALSE,
                       pattern = "{x}",
                       sep_mark = ",",
                       dec_mark = ".",
                       force_sign = FALSE,
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

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `fmt_number()` and `fmt_integer()` functions can only be ",
      "used on `columns` with numeric data",
      call. = FALSE
    )
  }

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig)) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig)

    formatC_format <- "fg"
  } else {
    formatC_format <- "f"
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by
          )

        # Scale the `x` values by the `scale_by` values in `suffix_df`
        x <- scale_x_values(x, scale_by = suffix_df$scale_by)

        # Format numeric values to character-based numbers
        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = n_sigfig,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = drop_trailing_dec_mark,
            format = formatC_format
          )

        # Paste the vector of suffixes to the right of the values
        x_str <- paste_right(x_str, x_right = suffix_df$suffix)

        # Format values in accounting notation (if `accounting = TRUE`)
        x_str <-
          format_as_accounting(
            x_str,
            x = x,
            context = context,
            accounting = accounting
          )

        # Force a positive sign on certain values if the option is taken
        if (!accounting && force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

#' Format values as integers
#'
#' @description
#' With numeric values in a **gt** table, we can perform number-based
#' formatting so that the targeted values are always rendered as integer values.
#' We can have fine control over integer formatting with the following options:
#'
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param suffixing An option to scale and apply suffixes to larger numbers
#'   (e.g., `1924000` can be transformed to `2M`). This option can accept a
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
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column as integer
#' # values having no digit separators
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num, char) %>%
#'   gt() %>%
#'   fmt_integer(
#'     columns = num,
#'     use_seps = FALSE
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_integer_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-2
#'
#' @import rlang
#' @export
fmt_integer <- function(data,
                        columns,
                        rows = everything(),
                        use_seps = TRUE,
                        accounting = FALSE,
                        scale_by = 1.0,
                        suffixing = FALSE,
                        pattern = "{x}",
                        sep_mark = ",",
                        force_sign = FALSE,
                        locale = NULL) {

  fmt_number(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    decimals = 0,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = use_seps,
    accounting = accounting,
    scale_by = scale_by,
    suffixing = suffixing,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = "not used",
    force_sign = force_sign,
    locale = locale
  )
}

#' Format values to scientific notation
#'
#' @description
#' With numeric values in a **gt** table, we can perform formatting so that the
#' targeted values are rendered in scientific notation. Furthermore, there is
#' fine control with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
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
#'     columns = num,
#'     rows = num > 500,
#'     decimals = 1,
#'     scale_by = 1/1000,
#'     pattern = "{x}K"
#'   ) %>%
#'   fmt_scientific(
#'     columns = num,
#'     rows = num <= 500,
#'     decimals = 1
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_scientific_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-3
#'
#' @import rlang
#' @export
fmt_scientific <- function(data,
                           columns,
                           rows = everything(),
                           decimals = 2,
                           drop_trailing_zeros = FALSE,
                           scale_by = 1.0,
                           pattern = "{x}",
                           sep_mark = ",",
                           dec_mark = ".",
                           force_sign = FALSE,
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
  validate_locale(locale = locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `fmt_scientific()` function can only be used on `columns` with numeric data.",
      call. = FALSE
    )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
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
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by
          )

        # Scale the `x` values by the `scale_by` values in `suffix_df`
        x <- scale_x_values(x, scale_by = suffix_df$scale_by)

        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = NULL,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = FALSE,
            format = "e",
            replace_minus_mark = FALSE
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

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

#' Format values to engineering notation
#'
#' @description
#' With numeric values in a **gt** table, we can perform formatting so that the
#' targeted values are rendered in engineering notation.
#'
#' With this function, there is fine control over the formatted values with the
#' following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). A number of
#' helper functions exist to make targeting more effective. Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column in
#' # engineering notation
#' tab_1 <-
#'   exibble %>%
#'   gt() %>%
#'   fmt_engineering(columns = num)
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_engineering_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-4
#'
#' @export
fmt_engineering <- function(data,
                            columns,
                            rows = everything(),
                            decimals = 2,
                            drop_trailing_zeros = FALSE,
                            scale_by = 1.0,
                            pattern = "{x}",
                            sep_mark = ",",
                            dec_mark = ".",
                            force_sign = FALSE,
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
  validate_locale(locale = locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (!column_classes_are_valid(data, {{ columns }}, valid_classes = c("numeric", "integer"))) {
    stop("The `fmt_scientific()` function can only be used on `columns` with numeric data",
         call. = FALSE)
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
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
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by
          )

        # Scale the `x_vals` by the `scale_by` values
        x <- scale_x_values(x, suffix_df$scale_by)

        zero_x <- x == 0
        negative_x <- x < 0
        x_str_left <- x_str_right <- x_str <- character(length = length(x))

        # Powers in engineering notation always in steps of 3; this
        # calculation gets, for every value, the effective power value
        power_3 <- floor(log(abs(x), base = 1000)) * 3

        # Any zero values will return Inf from the previous calculation
        # so we must replace these with a `0`
        power_3[is.infinite(power_3)] <- 0L

        # The numbers on the LHS must be scaled to correspond to the
        # RHS 10^`power_level` values (i.e., `<LHS> x 10^(n * 3)`)
        x <- x / 10^(power_3)

        # With the scaled values for the LHS, format these according
        # to the options set by the user
        x_str_left <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = NULL,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = FALSE,
            format = "f",
            replace_minus_mark = FALSE
          ) %>%
          replace_minus()

        # Generate the RHS of the formatted value (i.e., the `x 10^(n * 3)`)
        x_str_right <-
          paste0(
            exp_marks[1],
            as.character(power_3) %>% replace_minus(),
            exp_marks[2]
          )

        # Replace elements from `x_str_right` where exponent values
        # are zero with empty strings
        x_str_right[power_3 == 0] <- ""

        # Paste the LHS and RHS components to generate the formatted values
        x_str <- paste0(x_str_left, x_str_right)

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

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
                       rows,
                       symbol = "*",
                       accounting = FALSE,
                       decimals = NULL,
                       drop_trailing_zeros = FALSE,
                       drop_trailing_dec_mark = TRUE,
                       use_seps = TRUE,
                       scale_by = 1.0,
                       suffixing = FALSE,
                       pattern = "{x}",
                       sep_mark = ",",
                       dec_mark = ".",
                       force_sign = FALSE,
                       placement = "left",
                       incl_space = FALSE,
                       locale = NULL) {

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Stop function if `locale` does not have a valid value
  validate_locale(locale = locale)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `x_str` vector
        x_str <- character(length(x))

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by
          )

        # Scale the `x_vals` by the `scale_by` value
        x <- scale_x_values(x, suffix_df$scale_by)

        is_negative_x <- x < 0
        is_not_negative_x <- !is_negative_x

        if (any(is_not_negative_x)) {

          # Format numeric values to character-based numbers
          x_str[is_not_negative_x] <-
            format_num_to_str_c(
              x[is_not_negative_x],
              context = context,
              decimals = decimals,
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark
            )
        }

        x_abs_str <- x_str

        if (any(is_negative_x)) {

          # Format numeric values to character-based numbers
          x_abs_str[is_negative_x] <-
            format_num_to_str_c(
              abs(x[is_negative_x]),
              context = context,
              decimals = decimals,
              sep_mark = sep_mark,
              dec_mark = dec_mark,
              drop_trailing_zeros = drop_trailing_zeros,
              drop_trailing_dec_mark = drop_trailing_dec_mark
            )
        }

        # Format values with a symbol string
        x_str <-
          format_symbol_str(
            x_abs_str = x_abs_str,
            x = x,
            context = context,
            symbol = symbol,
            incl_space = incl_space,
            placement = placement
          )

        # Format values in accounting notation (if `accounting = TRUE`)
        x_str <-
          format_as_accounting(
            x_str,
            x = x,
            context = context,
            accounting = accounting
          )

        # Paste the vector of suffixes to the right of the values
        x_str <- paste_right(x_str, x_right = suffix_df$suffix)

        # Force a positive sign on certain values if the option is taken
        if (!accounting && force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

#' Format values as a percentage
#'
#' @description
#' With numeric values in a **gt** table, we can perform percentage-based
#' formatting. It is assumed the input numeric values are proportional values
#' and, in this case, the values will be automatically multiplied by `100`
#' before decorating with a percent sign (the other case is accommodated though
#' setting the `scale_values` to `FALSE`) For more control over percentage
#' formatting, we can use the following options:
#'
#' - percent sign placement: the percent sign can be placed after or
#' before the values and a space can be inserted between the symbol and the
#' value.
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param scale_values Should the values be scaled through multiplication by
#'   100? By default this is `TRUE` since the expectation is that normally
#'   values are proportions. Setting to `FALSE` signifies that the values are
#'   already scaled and require only the percent sign when formatted.
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
#'     columns = frac_of_quota,
#'     decimals = 1
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_percent_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-5
#'
#' @import rlang
#' @export
fmt_percent <- function(data,
                        columns,
                        rows = everything(),
                        decimals = 2,
                        drop_trailing_zeros = FALSE,
                        drop_trailing_dec_mark = TRUE,
                        scale_values = TRUE,
                        use_seps = TRUE,
                        accounting = FALSE,
                        pattern = "{x}",
                        sep_mark = ",",
                        dec_mark = ".",
                        force_sign = FALSE,
                        incl_space = FALSE,
                        placement = "right",
                        locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `fmt_percent()` function can only be used on `columns` with numeric data.",
      call. = FALSE
    )
  }

  if (scale_values) {
    scale_by <- 100
  } else {
    scale_by <- 1.0
  }

  # Pass `data`, `columns`, `rows`, and other options to `fmt_symbol()`
  fmt_symbol(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    symbol = "%",
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = drop_trailing_zeros,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    use_seps = use_seps,
    scale_by = scale_by,
    suffixing = FALSE,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    force_sign = force_sign,
    placement = placement,
    incl_space = incl_space,
    locale = locale
  )
}

#' Format values as currencies
#'
#' @description
#' With numeric values in a **gt** table, we can perform currency-based
#' formatting. This function supports both automatic formatting with a
#' three-letter or numeric currency code. We can also specify a custom currency
#' that is formatted according to the output context with the [currency()]
#' helper function. Numeric formatting facilitated through the use of a locale
#' ID. We have fine control over the conversion from numeric values to currency
#' values, where we could take advantage of the following options:
#'
#' - the currency: providing a currency code or common currency name will
#' procure the correct currency symbol and number of currency subunits; we could
#' also use the [currency()] helper function to specify a custom currency
#' - currency symbol placement: the currency symbol can be placed before
#' or after the values
#' - decimals/subunits: choice of the number of decimal places, and a
#' choice of the decimal symbol, and an option on whether to include or exclude
#' the currency subunits (decimal portion)
#' - negative values: choice of a negative sign or parentheses for values
#' less than zero
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - large-number suffixing: larger figures (thousands, millions, etc.) can
#' be autoscaled and decorated with the appropriate suffixes
#' - pattern: option to use a text pattern for decoration of the formatted
#' currency values
#' - locale-based formatting: providing a locale ID will result in
#' currency formatting specific to the chosen locale
#'
#' We can use the [info_currencies()] function for a useful reference on all of
#' the possible inputs to the `currency` argument.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
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
#'     columns = currency,
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
#'     columns = num,
#'     currency = "CNY"
#'   ) %>%
#'   fmt_currency(
#'     columns = currency,
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
#' 3-6
#'
#' @import rlang
#' @export
fmt_currency <- function(data,
                         columns,
                         rows = everything(),
                         currency = "USD",
                         use_subunits = TRUE,
                         decimals = NULL,
                         drop_trailing_dec_mark = TRUE,
                         use_seps = TRUE,
                         accounting = FALSE,
                         scale_by = 1.0,
                         suffixing = FALSE,
                         pattern = "{x}",
                         sep_mark = ",",
                         dec_mark = ".",
                         force_sign = FALSE,
                         placement = "left",
                         incl_space = FALSE,
                         locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `fmt_currency()` function can only be used on `columns` with numeric data.",
      call. = FALSE
    )
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

  # Pass `data`, `columns`, `rows`, and other options to `fmt_symbol()`
  fmt_symbol(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    symbol = currency,
    accounting = accounting,
    decimals = decimals,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = drop_trailing_dec_mark,
    use_seps = use_seps,
    scale_by = scale_by,
    suffixing = suffixing,
    pattern = pattern,
    sep_mark = sep_mark,
    dec_mark = dec_mark,
    force_sign = force_sign,
    placement = placement,
    incl_space = incl_space,
    locale = locale
  )
}

#' Format values as bytes
#'
#' @description
#' With numeric values in a **gt** table, we can transform those to values of
#' bytes with human readable units. The `fmt_bytes()` function allows for the
#' formatting of byte sizes to either of two common representations: (1) with
#' decimal units (powers of 1000, examples being `"kB"` and `"MB"`), and (2)
#' with binary units (powers of 1024, examples being `"KiB"` and `"MiB"`).
#'
#' It is assumed the input numeric values represent the number of bytes and
#' automatic truncation of values will occur. The numeric values will be scaled
#' to be in the range of 1 to <1000 and then decorated with the correct unit
#' symbol according to the standard chosen. For more control over the formatting
#' of byte sizes, we can use the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the Arguments section for more information on this.
#'
#' @inheritParams fmt_number
#' @param standard The way to express large byte sizes.
#' @param decimals An option to specify the exact number of decimal places to
#'   use. The default number of decimal places is `1`.
#' @param incl_space An option for whether to include a space between the value
#'   and the units. The default of `TRUE` uses a space character for separation.
#' @param force_sign Should the positive sign be shown for positive numbers
#'   (effectively showing a sign for all numbers except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
#'
#' @return An object of class `gt_tbl`.
#'
#' @examples
#' # Use `exibble` to create a gt table;
#' # format the `num` column to have
#' # byte sizes in the binary standard
#' tab_1 <-
#'   exibble %>%
#'   dplyr::select(num) %>%
#'   gt() %>%
#'   fmt_bytes(columns = num)
#'
#' # Create a similar table with the
#' # `fmt_bytes()` function, this time
#' # showing byte sizes as binary values
#' tab_2 <-
#'   exibble %>%
#'   dplyr::select(num) %>%
#'   gt() %>%
#'   fmt_bytes(
#'     columns = num,
#'     standard = "binary"
#'   )
#'
#' @family Format Data
#' @section Function ID:
#' 3-7
#'
#' @import rlang
#' @export
fmt_bytes <- function(data,
                      columns,
                      rows = everything(),
                      standard = c("decimal", "binary"),
                      decimals = 1,
                      n_sigfig = NULL,
                      drop_trailing_zeros = TRUE,
                      drop_trailing_dec_mark = TRUE,
                      use_seps = TRUE,
                      pattern = "{x}",
                      sep_mark = ",",
                      dec_mark = ".",
                      force_sign = FALSE,
                      incl_space = TRUE,
                      locale = NULL) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  standard <- match.arg(standard)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig)) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig = n_sigfig)

    formatC_format <- "fg"

  } else {
    formatC_format <- "f"
  }

  if (standard == "decimal") {

    base <- 1000
    byte_units <- c("B", "kB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB")

  } else {

    base <- 1024
    byte_units <- c("B", "KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB")
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Truncate all byte values
        x <- trunc(x)

        num_power_idx <- floor(log(abs(x), base = base)) + 1
        num_power_idx <- pmax(1, pmin(length(byte_units), num_power_idx))

        units_str <- byte_units[num_power_idx]
        x <- x / base^(num_power_idx-1)

        # Format numeric values to character-based numbers
        x_str <-
          format_num_to_str(
            x,
            context = context,
            decimals = decimals,
            n_sigfig = n_sigfig,
            sep_mark = sep_mark,
            dec_mark = dec_mark,
            drop_trailing_zeros = drop_trailing_zeros,
            drop_trailing_dec_mark = drop_trailing_dec_mark,
            format = formatC_format
          ) %>%
          paste_right(x_right = paste0(if (incl_space) " ", units_str))

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {

          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste_left(x_str[positive_x], x_left = "+")
        }

        x_str
      }
    )
  )
}

#' Format values as dates
#'
#' @description
#' Format input values to time values using one of fourteen presets. Input can
#' be in the form of `POSIXt` (i.e., date-times), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
#'
#' Once the appropriate data cells are targeted with `columns` (and, optionally,
#' `rows`), we can simply apply a preset date style to format the dates. The
#' following date styles are available for use (all using the input date of
#' `2000-02-29` in the example output dates):
#'
#' 1. `"iso"`: `2000-02-29`
#' 2. `"wday_month_day_year"`: `Tuesday, February 29, 2000`
#' 3. `"wd_m_day_year"`: `Tue, Feb 29, 2000`
#' 4. `"wday_day_month_year"`: `Tuesday 29 February 2000`
#' 5. `"month_day_year"`: `February 29, 2000`
#' 6. `"m_day_year"`: `Feb 29, 2000`
#' 7. `"day_m_year"`: `29 Feb 2000`
#' 8. `"day_month_year"`: `29 February 2000`
#' 9. `"day_month"`: `29 February`
#' 10. `"year"`: `2000`
#' 11. `"month"`: `February`
#' 12. `"day"`: `29`
#' 13. `"year.mn.day"`: `2000/02/29`
#' 14. `"y.mn.day"`: `00/02/29`
#'
#' We can use the [info_date_style()] function for a useful reference on all of
#' the possible inputs to `date_style`.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the *Arguments* section for more information on this.
#'
#' @inheritParams fmt_number
#' @param date_style The date style to use. Supply a number (from `1` to `14`)
#'   that corresponds to the preferred date style, or, provide a named date
#'   style (`"wday_month_day_year"`, `"m_day_year"`, `"year.mn.day"`, etc.). Use
#'   [info_date_style()] to see the different numbered and named date presets.
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
#'     columns = date,
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
#'     columns = date,
#'     rows =
#'       as.Date(date) > as.Date("2015-04-01"),
#'     date_style = "m_day_year"
#'   ) %>%
#'   fmt_date(
#'     columns = date,
#'     rows =
#'       as.Date(date) <= as.Date("2015-04-01"),
#'     date_style = "day_m_year"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_date_1.png}{options: width=100\%}}
#'
#' \if{html}{\figure{man_fmt_date_2.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-8
#'
#' @import rlang
#' @export
fmt_date <- function(data,
                     columns,
                     rows = everything(),
                     date_style = 2) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Transform `date_style` to `date_format_str`
  date_format_str <- get_date_format(date_style = date_style)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("Date", "POSIXt", "character")
    )
  ) {
    stop(
      "The `fmt_date()` function can only be used on `columns` of certain types:\n",
      "* Allowed types are `Date`, `POSIXt`, and `character` (in ISO 8601 format).",
      call. = FALSE
    )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      default = function(x) {

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        date <-
          tryCatch(
            as.POSIXlt(x),
            error = function(cond) {
              stop(
                "One or more of the provided date/date-time values are invalid.",
                call. = FALSE
              )
            }
          )

        # Format the date string using `strftime()`
        date <- strftime(date, format = date_format_str)

        # Perform several cosmetic changes to the formatted date
        if (date_format_str != "%F") {

          date <- gsub(" 0([0-9])", " \\1", date)
          date <- gsub("^0([0-9])[^/]", "\\1 ", date)
        }

        date
      }
    )
  )
}

#' Format values as times
#'
#' @description
#' Format input values to time values using one of five presets. Input can be in
#' the form of `POSIXt` (i.e., date-times), `character` (must be in the ISO
#' 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which always
#' results in the formatting of `00:00:00`).
#'
#' Once the appropriate data cells are targeted with `columns` (and, optionally,
#' `rows`), we can simply apply a preset time style to format the times. The
#' following time styles are available for use (all using the input time of
#' `14:35:00` in the example output times):
#'
#' 1. `"hms"`: `14:35:00`
#' 2. `"hm"`: `14:35`
#' 3. `"hms_p"`: `2:35:00 PM`
#' 4. `"hm_p"`: `2:35 PM`
#' 5. `"h_p"`: `2 PM`
#'
#' We can use the [info_time_style()] function for a useful reference on all of
#' the possible inputs to `time_style`.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the *Arguments* section for more information on this.
#'
#' @inheritParams fmt_number
#' @param time_style The time style to use. Supply a number (from `1` to `5`)
#'   that corresponds to the preferred time style, or, provide a named time
#'   style (`"hms"`, `"hms_p"`, `"h_p"`, etc.). Use [info_time_style()] to see
#'   the different numbered and named time presets.
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
#'     columns = time,
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
#'     columns = time,
#'     rows =
#'       time > "16:00",
#'     time_style = 3
#'   ) %>%
#'   fmt_time(
#'     columns = time,
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
#' 3-9
#'
#' @import rlang
#' @export
fmt_time <- function(data,
                     columns,
                     rows = everything(),
                     time_style = 2) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Transform `time_style` to `time_format_str`
  time_format_str <- get_time_format(time_style = time_style)

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("Date", "POSIXt", "character"))
  ) {
    stop(
      "The `fmt_time()` function can only be used on `columns` of certain types:\n",
      "* Allowed types are `Date`, `POSIXt`, and `character` (in `HH:MM:SS` format).",
      call. = FALSE
    )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      default = function(x) {

        # If the incoming values are strings that adequately represent time
        # values, then prepend with the `1970-01-01` dummy date to create an
        # input that will works with `strftime()`
        if (all(is_string_time(x))) {
          x <- paste("1970-01-01", x)
        }

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        time <-
          tryCatch(
            as.POSIXlt(x),
            error = function(cond) {
              stop(
                "One or more of the provided date/time/date-time values are invalid.",
                call. = FALSE
              )
            }
          )

        # Format the date string using `strftime()`
        time <- strftime(time, format = time_format_str)

        # Perform several cosmetic changes to the formatted time
        if (grepl("%P$", time_format_str)) {

          time <- gsub("^0", "", time)
          time <- gsub(" 0([0-9])", " \\1", time)
          time <- gsub("pm$", "PM", time)
          time <- gsub("am$", "AM", time)
        }

        time
      }
    )
  )
}

#' Format values as date-times
#'
#' @description
#' Format input values to date-time values using one of fourteen presets for the
#' date component and one of five presets for the time component. Input can be
#' in the form of `POSIXt` (i.e., date-times), the `Date` type, or `character`
#' (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' Once the appropriate data cells are targeted with `columns` (and, optionally,
#' `rows`), we can simply apply preset date and time styles to format the
#' date-time values. The following date styles are available for formatting of
#' the date portion (all using the input date of `2000-02-29` in the example
#' output dates):
#'
#' 1. `"iso"`: `2000-02-29`
#' 2. `"wday_month_day_year"`: `Tuesday, February 29, 2000`
#' 3. `"wd_m_day_year"`: `Tue, Feb 29, 2000`
#' 4. `"wday_day_month_year"`: `Tuesday 29 February 2000`
#' 5. `"month_day_year"`: `February 29, 2000`
#' 6. `"m_day_year"`: `Feb 29, 2000`
#' 7. `"day_m_year"`: `29 Feb 2000`
#' 8. `"day_month_year"`: `29 February 2000`
#' 9. `"day_month"`: `29 February`
#' 10. `"year"`: `2000`
#' 11. `"month"`: `February`
#' 12. `"day"`: `29`
#' 13. `"year.mn.day"`: `2000/02/29`
#' 14. `"y.mn.day"`: `00/02/29`
#'
#' The following time styles are available for formatting of the time portion
#' (all using the input time of `14:35:00` in the example output times):
#'
#' 1. `"hms"`: `14:35:00`
#' 2. `"hm"`: `14:35`
#' 3. `"hms_p"`: `2:35:00 PM`
#' 4. `"hm_p"`: `2:35 PM`
#' 5. `"h_p"`: `2 PM`
#'
#' We can use the [info_date_style()] and [info_time_style()] functions as
#' useful references for all of the possible inputs to `date_style` and
#' `time_style`.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
#' formatting is possible by providing a conditional expression to the `rows`
#' argument. See the *Arguments* section for more information on this.
#'
#' @section Date and Time Formats:
#' Using `format` to create custom time formats isn't so hard once we know about
#' all of the different format codes. The formats are all indicated with a
#' leading `%` and literal characters are any of those without the leading `%`.
#' We'll use the date and time `"2015-06-08 23:05:37.48"` for all of the
#' examples here.
#'
#' First off, let's look at a few format code combinations that work well
#' together as format codes. This will give us an intuition on how these
#' generally work.
#'
#' - `"%m/%d/%Y"` -> `"06/08/2015"`
#' - `"%A, %B %e, %Y"` -> `"Monday, June 8, 2015"`
#' - `"%b %e %a"` -> `"Jun 8 Mon"`
#' - `"%H:%M"` -> `"23:05"`
#' - `"%I:%M %p"` -> `"11:05 pm"`
#' - `"%A, %B %e, %Y at %I:%M %p"` -> `"Monday, June 8, 2015 at 11:05 pm"`
#'
#' Here are the individual format codes for date components:
#'
#' - `"%a"` -> `"Mon"` (abbreviated day of week name)
#' - `"%A"` -> `"Monday"` (full day of week name)
#' - `"%w"` -> `"1"` (day of week number in `0..6`; Sunday is `0`)
#' - `"%u"` -> `"1"` (day of week number in `1..7`; Monday is `1`, Sunday `7`)
#' - `"%y"` -> `"15"` (abbreviated year, using the final two digits)
#' - `"%Y"` -> `"2015"` (full year)
#' - `"%b"` -> `"Jun"` (abbreviated month name)
#' - `"%B"` -> `"June"` (full month name)
#' - `"%m"` -> `"06"` (month number)
#' - `"%d"` -> `"08"` (day number, zero-padded)
#' - `"%e"` -> `"8"` (day number without zero padding)
#'
#' Here are the individual format codes for time components:
#'
#' - `"%H"` -> `"23"` (24h hour)
#' - `"%I"` -> `"11"` (12h hour)
#' - `"%M"` -> `"05"` (minute)
#' - `"%S"` -> `"37"` (second)
#' - `"%OS3"` -> `"37.480"` (seconds with decimals; `3` decimal places here)
#' - `%p` -> `"pm"` (AM or PM indicator, may not appear in certain locales)
#'
#' Here are some extra formats that you may find useful:
#'
#' - `"%j"` -> `"159"` (day of the year, always zero-padded)
#' - `"%W"` -> `"23"` (week number for the year, always zero-padded)
#' - `"%V"` -> `"24"` (week number for the year, following ISO 8601 standard)
#' - `"%C"` -> `"20"` (the century number)
#' - `"%z"` -> `"+0000"` (signed time zone offset, here using UTC)
#' - `"%F"` -> `"2015-06-08"` (the date in the ISO 8601 date format)
#' - `"%%"` -> `"%"` (the literal "`%`" character, in case you need it)
#'
#' @inheritParams fmt_number
#' @inheritParams fmt_date
#' @inheritParams fmt_time
#' @param format An optional format code used for generating custom dates/times.
#'   If used then the arguments governing preset styles (`date_style` and
#'   `time_style`) will be ignored in favor of formatting via the `format`
#'   string.
#' @param tz The time zone for printing dates/times (i.e., the output) and only
#'   used internally when providing a `format` string. The default of `NULL`
#'   will use the system's current time zone but one can, for example, provide
#'   `"GMT"` for representing date-times in UTC (a vector of all valid `tz`
#'   values can be produced with [OlsonNames()]).
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
#'     columns = datetime,
#'     date_style = 5,
#'     time_style = 3
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_datetime_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-10
#'
#' @import rlang
#' @export
fmt_datetime <- function(data,
                         columns,
                         rows = everything(),
                         date_style = 2,
                         time_style = 2,
                         sep = " ",
                         format = NULL,
                         tz = "UTC",
                         pattern = "{x}") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  if (!is.null(format)) {

    # Ensure that the format string meets some basic validation requirements
    check_format_string(format = format)

  } else {

    # Transform `date_style` to `date_format`
    date_format_str <- get_date_format(date_style = date_style)

    # Transform `time_style` to `time_format`
    time_format_str <- get_time_format(time_style = time_style)
  }

  # Stop function if any columns have data that is incompatible
  # with this formatter
  if (
    !column_classes_are_valid(
      data = data,
      columns = {{ columns }},
      valid_classes = c("Date", "POSIXt", "character"))
    ) {
      stop(
        "The `fmt_datetime()` function can only be used on `columns` of certain types:\n",
        "* Allowed types are `Date`, `POSIXt`, and `character` (in ISO 8601 format).",
        call. = FALSE
      )
  }

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      default = function(x) {

        # If a format string is provided then use that to generate the
        # formatted date/time string
        if (!is.null(format)) {

          # If the incoming values are strings that adequately represent time
          # values, then prepend with the `1970-01-01` dummy date to create an
          # input that will works with `strftime()`
          if (all(is_string_time(x))) {
            x <- paste("1970-01-01", x)
          }

          if (is.null(tz)) {
            tz <- ""
          }

          # Format the date-time values using `strftime()`
          return(strftime(x, format = format, tz = tz))
        }

        #
        # Format the date portion of the datetime string
        #

        # Convert incoming values to POSIXlt but provide a friendly error
        # if the values cannot be parsed by `as.POSIXlt()`
        datetime <-
          tryCatch(
            as.POSIXlt(x),
            error = function(cond) {
              stop(
                "One or more of the provided date/date-time values are invalid.",
                call. = FALSE
              )
            }
          )

        # Format `datetime` into a date string using `strftime()` with
        # the resolved formatting string
        date <- strftime(datetime, format = date_format_str, tz = tz)

        # Perform several cosmetic changes to the formatted date
        if (date_format_str != "%F") {

          date <- gsub(" 0([0-9])", " \\1", date)
          date <- gsub("^0([0-9])[^/]", "\\1 ", date)
        }

        #
        # Format the time portion of the datetime string
        #

        # Format `datetime` into a time string using `strftime()` with
        # the resolved formatting string
        time <- strftime(datetime, format = time_format_str, tz = tz)

        # Perform several cosmetic changes to the formatted time
        if (grepl("%P$", time_format_str)) {

          time <- gsub("^0", "", time)
          time <- gsub(" 0([0-9])", " \\1", time)
          time <- gsub("pm$", "PM", time)
          time <- gsub("am$", "AM", time)
        }

        datetime <- gsub("NA NA", "NA", paste(date, time))

        datetime
      }
    )
  )
}

#' Format Markdown text
#'
#' @description
#' Any Markdown-formatted text in the incoming cells will be transformed to the
#' appropriate output type during render when using `fmt_markdown()`.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
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
#'     fmt_markdown(columns = everything()) %>%
#'     tab_options(table.width = px(400))
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_markdown_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-11
#'
#' @import rlang
#' @export
fmt_markdown <- function(data,
                         columns,
                         rows = everything()) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions as a function list to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
    fns = list(
      html = function(x) {
        md_to_html(x)
      },
      latex = function(x) {
        markdown_to_latex(x)
      },
      rtf = function(x) {
        markdown_to_rtf(x)
      },
      default = function(x) {
        vapply(
          x,
          FUN.VALUE = character(1),
          USE.NAMES = FALSE,
          commonmark::markdown_text
        ) %>%
          stringr::str_replace("\n$", "")
      }
    )
  )
}

#' Format by simply passing data through
#'
#' @description
#' Format by passing data through no other transformation other than: (1)
#' coercing to `character` (as all the `fmt_*()` functions do), and (2) applying
#' text via the `pattern` argument (the default is to apply nothing). All of
#' this is useful when don't want to modify the input data other than to
#' decorate it within a pattern. Also, this function is useful when used as the
#' `formatter` function in the [summary_rows()] function, where the output may
#' be text or useful as is.
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
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
#'     columns = char,
#'     rows = !is.na(char),
#'     pattern = "{x}s"
#'   )
#'
#' @section Figures:
#' \if{html}{\figure{man_fmt_passthrough_1.png}{options: width=100\%}}
#'
#' @family Format Data
#' @section Function ID:
#' 3-12
#'
#' @import rlang
#' @export
fmt_passthrough <- function(data,
                            columns,
                            rows = everything(),
                            escape = TRUE,
                            pattern = "{x}") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
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
          x_str <- process_text(text = x_str, context = "html")
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
          x_str <- process_text(text = x_str, context = "latex")
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
          x_str <- process_text(text = x_str, context = "rtf")
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
#' @description
#' Wherever there is missing data (i.e., `NA` values) a customizable mark may
#' present better than the standard `NA` text that would otherwise appear. The
#' `fmt_missing()` function allows for this replacement through its
#' `missing_text` argument (where an em dash serves as the default).
#'
#' @details
#' Targeting of values is done through `columns` and additionally by `rows` (if
#' nothing is provided for `rows` then entire columns are selected). Conditional
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
#' 3-13
#'
#' @import rlang
#' @export
fmt_missing <- function(data,
                        columns,
                        rows = everything(),
                        missing_text = "---") {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Pass `data`, `columns`, `rows`, and the formatting
  # functions (as a function list) to `fmt()`
  fmt(
    data = data,
    columns = {{ columns }},
    rows = {{ rows }},
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
      rtf = function(x) {

        missing_text <-
          context_missing_text(
            missing_text = missing_text,
            context = "rtf"
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
#' @description
#' The `fmt()` function provides greater control in formatting raw data values
#' than any of the specialized `fmt_*()` functions that are available in
#' **gt**. Along with the `columns` and `rows` arguments that provide some
#' precision in targeting data cells, the `fns` argument allows you to define
#' one or more functions for manipulating the raw data.
#'
#' If providing a single function to `fns`, the recommended format is in the
#' form: `fns = function(x) ...`. This single function will format the targeted
#' data cells the same way regardless of the output format (e.g., HTML, LaTeX,
#' RTF).
#'
#' If you require formatting of `x` that depends on the output format, a list of
#' functions can be provided for the `html`, `latex`, and `default` contexts.
#' This can be in the form of `fns = list(html = function(x) ..., latex =
#' function(x) ..., default = function(x) ...)`. In this multiple-function case,
#' we recommended including the `default` function as a fallback if all contexts
#' aren't provided.
#'
#' @details
#' As with all of the `fmt_*()` functions, targeting of values is done through
#' `columns` and additionally by `rows` (if nothing is provided for `rows` then
#' entire columns are selected). Conditional formatting is possible by providing
#' a conditional expression to the `rows` argument. See the Arguments section
#' for more information on this.
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
#'     columns = num,
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
#' 3-14
#'
#' @import rlang
#' @export
fmt <- function(data,
                columns = everything(),
                rows = everything(),
                fns) {

  # Perform input object validation
  stop_if_not_gt(data = data)

  # Get the `stub_df` data frame from `data`
  stub_df <- dt_stub_df_get(data = data)
  data_tbl <- dt_data_get(data = data)

  #
  # Resolution of columns and rows as character vectors
  #

  resolved_columns <-
    resolve_cols_c(
      expr = {{ columns }},
      data = data
    )

  resolved_rows_idx <-
    resolve_rows_i(
      expr = {{ rows }},
      data = data
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
