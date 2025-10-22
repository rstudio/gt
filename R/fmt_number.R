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
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


# fmt_number() -----------------------------------------------------------------
#' Format numeric values
#'
#' @description
#'
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
#' @param data *The gt table data object*
#'
#'   `obj:<gt_tbl>` // **required**
#'
#'   This is the **gt** table object that is commonly created through use of the
#'   [gt()] function.
#'
#' @param columns *Columns to target*
#'
#'   [`<column-targeting expression>`][`rows-columns`] // *default:* `everything()`
#'
#'   Can either be a series of column names provided in `c()`, a vector of
#'   column indices, or a select helper function (e.g. [starts_with()],
#'   [ends_with()], [contains()], [matches()], [num_range()] and [everything()]).
#'
#' @param rows *Rows to target*
#'
#'   [`<row-targeting expression>`][`rows-columns`] // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   undergo formatting. The default [everything()] results in all rows in
#'   `columns` being formatted. Alternatively, we can supply a vector of row
#'   captions within `c()`, a vector of row indices, or a select helper
#'   function (e.g. [starts_with()], [ends_with()], [contains()], [matches()],
#'   [num_range()], and [everything()]). We can also use expressions to filter
#'   down to the rows we need (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param decimals *Number of decimal places*
#'
#'   `scalar<numeric|integer>(val>=0)` // *default:* `2`
#'
#'   This corresponds to the exact number of decimal places to use. A value
#'   such as `2.34` can, for example, be formatted with `0` decimal places and
#'   it would result in `"2"`. With `4` decimal places, the formatted value
#'   becomes `"2.3400"`.
#'
#' @param n_sigfig *Number of significant figures*
#'
#'   `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)
#'
#'   A option to format numbers to *n* significant figures. By default, this is
#'   `NULL` and thus number values will be formatted according to the number of
#'   decimal places set via `decimals`. If opting to format according to the
#'   rules of significant figures, `n_sigfig` must be a number greater than or
#'   equal to `1`. Any values passed to the `decimals` and `drop_trailing_zeros`
#'   arguments will be ignored.
#'
#' @param drop_trailing_zeros *Drop any trailing zeros*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   A logical value that allows for removal of trailing zeros (those redundant
#'   zeros after the decimal mark).
#'
#' @param drop_trailing_dec_mark *Drop the trailing decimal mark*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   A logical value that determines whether decimal marks should always appear
#'   even if there are no decimal digits to display after formatting (e.g., `23`
#'   becomes `23.` if `FALSE`). By default trailing decimal marks are not shown.
#'
#' @param use_seps *Use digit group separators*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to use digit group separators. The type of digit group separator
#'   is set by `sep_mark` and overridden if a locale ID is provided to `locale`.
#'   This setting is `TRUE` by default.
#'
#' @param accounting *Use accounting style*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   An option to use accounting style for values. Normally, negative values
#'   will be shown with a minus sign but using accounting style will instead put
#'   any negative values in parentheses.
#'
#' @param scale_by *Scale values by a fixed multiplier*
#'
#'   `scalar<numeric|integer>` // *default:* `1`
#'
#'   All numeric values will be multiplied by the `scale_by` value before
#'   undergoing formatting. Since the `default` value is `1`, no values will be
#'   changed unless a different multiplier value is supplied. This value will be
#'   ignored if using any of the `suffixing` options (i.e., where `suffixing` is
#'   not set to `FALSE`).
#'
#' @param suffixing *Specification for large-number suffixing*
#'
#'   `scalar<logical>|vector<character>` // *default:* `FALSE`
#'
#'   The `suffixing` option allows us to scale and apply suffixes to larger
#'   numbers (e.g., `1924000` can be transformed to `1.92M`). This option can
#'   accept a logical value, where `FALSE` (the default) will not perform this
#'   transformation and `TRUE` will apply thousands (`"K"`), millions (`"M"`),
#'   billions (`"B"`), and trillions (`"T"`) suffixes after automatic value
#'   scaling.
#'
#'   We can alternatively provide a character vector that serves as a
#'   specification for which symbols are to be used for each of the value ranges.
#'   These preferred symbols will replace the defaults (e.g.,
#'   `c("k", "Ml", "Bn", "Tr")` replaces `"K"`, `"M"`, `"B"`, and `"T"`).
#'
#'   Including `NA` values in the vector will ensure that the particular range
#'   will either not be included in the transformation (e.g.,
#'   `c(NA, "M", "B", "T")` won't modify numbers at all in the thousands range)
#'   or the range will inherit a previous suffix (e.g., with
#'   `c("K", "M", NA, "T")`, all numbers in the range of millions and billions
#'   will be in terms of millions).
#'
#'   Any use of `suffixing` (where it is not set expressly as `FALSE`) means
#'   that any value provided to `scale_by` will be ignored.
#'
#'   If using `system = "ind"` then the default suffix set provided by
#'   `suffixing = TRUE` will be the equivalent of `c(NA, "L", "Cr")`. This
#'   doesn't apply suffixes to the thousands range, but does express values in
#'   *lakhs* and *crores*.
#'
#' @param pattern *Specification of the formatting pattern*
#'
#'   `scalar<character>` // *default:* `"{x}"`
#'
#'   A formatting pattern that allows for decoration of the formatted value. The
#'   formatted value is represented by the `{x}` (which can be used multiple
#'   times, if needed) and all other characters will be interpreted as string
#'   literals.
#'
#' @param sep_mark *Separator mark for digit grouping*
#'
#'   `scalar<character>` // *default:* `","`
#'
#'   The string to use as a separator between groups of digits. For example,
#'   using `sep_mark = ","` with a value of `1000` would result in a formatted
#'   value of `"1,000"`. This argument is ignored if a `locale` is supplied
#'   (i.e., is not `NULL`).
#'
#' @param dec_mark *Decimal mark*
#'
#'   `scalar<character>` // *default:* `"."`
#'
#'   The string to be used as the decimal mark. For example, using
#'   `dec_mark = ","` with the value `0.152` would result in a formatted value
#'   of `"0,152"`). This argument is ignored if a `locale` is supplied (i.e., is
#'   not `NULL`).
#'
#' @param force_sign *Forcing the display of a positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the positive sign be shown for positive values (effectively showing
#'   a sign for all values except zero)? If so, use `TRUE` for this option. The
#'   default is `FALSE`, where only negative numbers will display a minus sign.
#'   This option is disregarded when using accounting notation with
#'   `accounting = TRUE`.
#'
#' @param min_sep_threshold *Minimum digit threshold for grouping separators*
#'
#'   `scalar<numeric|integer>(val>=1,val<=3)` // *default:* `1`
#'
#'   The minimum number of digits required in the integer part of a number for
#'   grouping separators to be applied. This parameter determines when digit
#'   grouping begins based on the magnitude of values. The value `1` (the
#'   default) applies separators starting at 4-digit numbers (e.g., `1,000` and
#'   above). A value of `2` starts grouping at 5-digit numbers (`10,000` and
#'   above), while `3` begins at 6-digit numbers (`100,000` and above). If a
#'   `locale` is provided, the locale-specific minimum grouping digits value
#'   from CLDR will be used, overriding this parameter.
#'
#' @param system *Numbering system for grouping separators*
#'
#'   `singl-kw:[intl|ind]` // *default:* `"intl"`
#'
#'   The international numbering system (keyword: `"intl"`) is widely used and
#'   its grouping separators (i.e., `sep_mark`) are always separated by three
#'   digits. The alternative system, the Indian numbering system (keyword:
#'   `"ind"`), uses grouping separators that correspond to thousand, lakh,
#'   crore, and higher quantities.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported. A locale ID can
#'   be also set in the initial [gt()] function call (where it would be used
#'   automatically by any function with a `locale` argument) but a `locale`
#'   value provided here will override that global locale.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_number()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_number()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `decimals`
#' - `n_sigfig`
#' - `drop_trailing_zeros`
#' - `drop_trailing_dec_mark`
#' - `use_seps`
#' - `accounting`
#' - `scale_by`
#' - `suffixing`
#' - `pattern`
#' - `sep_mark`
#' - `dec_mark`
#' - `force_sign`
#' - `min_sep_threshold`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator and
#' decimal marks will be correct for the given locale. Should any values be
#' provided in `sep_mark` or `dec_mark`, they will be overridden by the locale's
#' preferred values.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' Let's use the [`exibble`] dataset to create a **gt** table. With
#' `fmt_number()`, we'll format the `num` column to have three decimal
#' places (with `decimals = 3`) and omit the use of digit separators (with
#' `use_seps = FALSE`).
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   fmt_number(
#'     columns = num,
#'     decimals = 3,
#'     use_seps = FALSE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_1.png")`
#' }}
#'
#' Use a modified version of the [`countrypops`] dataset to create a **gt**
#' table with row labels. Format all columns to use large-number suffixing
#' (e.g., where `"10,000,000"` becomes `"10M"`) with the `suffixing = TRUE`
#' option.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   dplyr::arrange(desc(`2015`)) |>
#'   gt(rowname_col = "country_code_3") |>
#'   fmt_number(suffixing = TRUE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_2.png")`
#' }}
#'
#' In a variation of the previous table, we can combine large-number suffixing
#' with a declaration of the number of significant digits to use. With things
#' like population figures, `n_sigfig = 3` is a very good option.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   dplyr::arrange(desc(`2015`)) |>
#'   gt(rowname_col = "country_code_3") |>
#'   fmt_number(suffixing = TRUE, n_sigfig = 3)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_3.png")`
#' }}
#'
#' There can be cases where you want to show numbers to a large number of
#' decimal places but also drop the unnecessary trailing zeros for low-precision
#' values. Let's take a portion of the [`towny`] dataset and format the
#' `latitude` and `longitude` columns with `fmt_number()`. We'll have up to 5
#' digits displayed as decimal values, but we'll also unconditionally drop any
#' runs of trailing zeros in the decimal part with `drop_trailing_zeros = TRUE`.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, latitude, longitude) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   fmt_number(decimals = 5, drop_trailing_zeros = TRUE) |>
#'   cols_merge(columns = -name, pattern = "{1}, {2}") |>
#'   cols_label(
#'     name ~ "Municipality",
#'     latitude = "Location"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_4.png")`
#' }}
#'
#' Another strategy for dealing with precision of decimals is to have a separate
#' column of values that specify how many decimal digits to retain. Such a
#' column can be added via [cols_add()] or it can be part of the input table for
#' [gt()]. With that column available, it can be referenced in the `decimals`
#' argument with [from_column()]. This approach yields a display of coordinate
#' values that reflects the measurement precision of each value.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, latitude, longitude) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   cols_add(dec_digits = c(1, 2, 2, 5, 5, 2, 3, 2, 3, 3)) |>
#'   fmt_number(decimals = from_column(column = "dec_digits")) |>
#'   cols_merge(columns = -name, pattern = "{1}, {2}") |>
#'   cols_label(
#'     name ~ "Municipality",
#'     latitude = "Location"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_number_5.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-1
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @seealso
#' The integer-formatting function (format rounded values (i.e., no decimals shown and
#'input values are rounded as necessary): [fmt_integer()].
#'
#' The vector-formatting version of this function: [vec_fmt_number()]
#'
#' @export
fmt_number <- function(
    data,
    columns = everything(),
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
    min_sep_threshold = 1,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - decimals
  # - n_sigfig
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - use_seps
  # - accounting
  # - scale_by
  # - suffixing
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - min_sep_threshold
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_number",
        all_args_except = c("data", "columns", "rows")
      )
    )
  # Assume that if decimals = 0, function = fmt_integer, fmt_number otherwise
  if (identical(decimals, 0)) {
    fn_call <- call("fmt_integer")
  } else {
    fn_call <- call("fmt_number")
  }

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data,
        call = fn_call
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_number(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          decimals = p_i$decimals %||% decimals,
          n_sigfig = p_i$n_sigfig %||% n_sigfig,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          use_seps = p_i$use_seps %||% use_seps,
          accounting = p_i$accounting %||% accounting,
          scale_by = p_i$scale_by %||% scale_by,
          suffixing = p_i$suffixing %||% suffixing,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          min_sep_threshold = p_i$min_sep_threshold %||% min_sep_threshold,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Ensure that arguments are matched
  system <- rlang::arg_match0(system, c("intl", "ind"))

  # Stop function if `locale` does not have a valid value; normalize locale
  # and resolve one that might be set globally
  validate_locale(locale = locale)
  locale <- normalize_locale(locale = locale)
  locale <- resolve_locale(data = data, locale = locale)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)
  min_sep_threshold <- get_locale_min_sep_threshold(locale, min_sep_threshold)

  # Normalize the `suffixing` input to either return a character vector
  # of suffix labels, or NULL (the case where `suffixing` is FALSE)
  suffix_labels <- normalize_suffixing_inputs(suffixing, scale_by, system)

  valid_class <- c("numeric", "integer")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class, call = fn_call)

  # Set the `formatC_format` option according to whether number
  # formatting with significant figures is to be performed
  if (!is.null(n_sigfig) && !is.na(n_sigfig[1])) {

    # Stop function if `n_sigfig` does not have a valid value
    validate_n_sigfig(n_sigfig = n_sigfig)

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
    compat = valid_class,
    fns = num_fmt_factory_multi(
      pattern = pattern,
      format_fn = function(x, context) {

        # Create the `suffix_df` object
        suffix_df <-
          create_suffix_df(
            x,
            decimals = decimals,
            suffix_labels = suffix_labels,
            scale_by = scale_by,
            system = system
          )

        # Determine whether `scale_by` is supplied as a function; if it isn't
        # the only other pathway involves getting the vector of values produced
        # by the `create_suffix_df()` function
        if (rlang::is_function(scale_by)) {
          to_scale_by <- scale_by
        } else {
          to_scale_by <- suffix_df$scale_by
        }

        # Scale the `x` values using `to_scale_by` (either a function or
        # a numeric vector)
        x <- scale_x_values(x, scale_by = to_scale_by)

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
            format = formatC_format,
            min_sep_threshold = min_sep_threshold,
            system = system
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

# fmt_integer() ----------------------------------------------------------------
#' Format values as integers
#'
#' @description
#'
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
#' @inheritParams fmt_number
#'
#' @param suffixing *Specification for large-number suffixing*
#'
#'   `scalar<logical>|vector<character>` // *default:* `FALSE`
#'
#'   The `suffixing` option allows us to scale and apply suffixes to larger
#'   numbers (e.g., `1924000` can be transformed to `2M`). This option can
#'   accept a logical value, where `FALSE` (the default) will not perform this
#'   transformation and `TRUE` will apply thousands (`K`), millions (`M`),
#'   billions (`B`), and trillions (`T`) suffixes after automatic value scaling.
#'
#'   We can alternatively provide a character vector that serves as a
#'   specification for which symbols are to be used for each of the value ranges.
#'   These preferred symbols will replace the defaults (e.g.,
#'   `c("k", "Ml", "Bn", "Tr")` replaces `"K"`, `"M"`, `"B"`, and `"T"`).
#'
#'   Including `NA` values in the vector will ensure that the particular range
#'   will either not be included in the transformation (e.g.,
#'   `c(NA, "M", "B", "T")` won't modify numbers at all in the thousands range)
#'   or the range will inherit a previous suffix (e.g., with
#'   `c("K", "M", NA, "T")`, all numbers in the range of millions and billions
#'   will be in terms of millions).
#'
#'   Any use of `suffixing` (where it is not set expressly as `FALSE`) means
#'   that any value provided to `scale_by` will be ignored.
#'
#'   If using `system = "ind"` then the default suffix set provided by
#'   `suffixing = TRUE` will be the equivalent of `c(NA, "L", "Cr")`. This
#'   doesn't apply suffixes to the thousands range, but does express values in
#'   *lakhs* and *crores*.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of formatting function with data values:
#'
#' `fmt_integer()` is compatible with body cells that are of the `"numeric"` or
#' `"integer"` types. Any other types of body cells are ignored during
#' formatting. This is to say that cells of incompatible data types may be
#' targeted, but there will be no attempt to format them.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [from_column()] can be used with certain arguments of `fmt_integer()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [from_column()]:
#'
#' - `use_seps`
#' - `accounting`
#' - `scale_by`
#' - `suffixing`
#' - `pattern`
#' - `sep_mark`
#' - `force_sign`
#' - `min_sep_threshold`
#' - `system`
#' - `locale`
#'
#' Please note that for all of the aforementioned arguments, a [from_column()]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [cols_add()] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [cols_hide()].
#' Finally, there is no limitation to how many arguments the [from_column()]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Adapting output to a specific `locale`:
#'
#' This formatting function can adapt outputs according to a provided `locale`
#' value. Examples include `"en"` for English (United States) and `"fr"` for
#' French (France). The use of a valid locale ID here means separator marks will
#' be correct for the given locale. Should any value be provided in `sep_mark`,
#' it will be overridden by the locale's preferred value.
#'
#' Note that a `locale` value provided here will override any global locale
#' setting performed in [gt()]'s own `locale` argument (it is settable there as
#' a value received by all other functions that have a `locale` argument). As a
#' useful reference on which locales are supported, we can call [info_locales()]
#' to view an info table.
#'
#' @section Examples:
#'
#' For this example, we'll use two columns from the [`exibble`] dataset and
#' create a simple **gt** table. With `fmt_integer()`, we'll format the `num`
#' column as integer values having no digit separators (with the
#' `use_seps = FALSE` option).
#'
#' ```r
#' exibble |>
#'   dplyr::select(num, char) |>
#'   gt() |>
#'   fmt_integer(use_seps = FALSE)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_integer_1.png")`
#' }}
#'
#' Let's use a modified version of the [`countrypops`] dataset to create a
#' **gt** table with row labels. We will format all numeric columns with
#' `fmt_integer()` and scale all values by `1 / 1E6`, giving us integer values
#' representing millions of people. We can make clear what the values represent
#' with an informative spanner label via [tab_spanner()].
#'
#' ```r
#' countrypops |>
#'   dplyr::select(country_code_3, year, population) |>
#'   dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
#'   dplyr::filter(year > 1975 & year %% 5 == 0) |>
#'   tidyr::pivot_wider(names_from = year, values_from = population) |>
#'   dplyr::arrange(desc(`2015`)) |>
#'   gt(rowname_col = "country_code_3") |>
#'   fmt_integer(scale_by = 1 / 1E6) |>
#'   tab_spanner(label = "Millions of People", columns = everything())
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_integer_2.png")`
#' }}
#'
#' Using a subset of the [`towny`] dataset, we can do interesting things with
#' integer values. Through [cols_add()] we'll add the `difference` column (which
#' calculates the difference between 2021 and 2001 populations). All numeric
#' values will be formatted with a first pass of `fmt_integer()`; a second pass
#' of `fmt_integer()` focuses on the `difference` column and here we use the
#' `force_sign = TRUE` option to draw attention to positive and negative
#' difference values.
#'
#' ```r
#' towny |>
#'   dplyr::select(name, population_2001, population_2021) |>
#'   dplyr::slice_tail(n = 10) |>
#'   gt() |>
#'   cols_add(difference = population_2021 - population_2001) |>
#'   fmt_integer() |>
#'   fmt_integer(columns = difference, force_sign = TRUE) |>
#'   cols_label_with(fn = function(x) gsub("population_", "", x)) |>
#'   tab_style(
#'     style = cell_fill(color = "gray90"),
#'     locations = cells_body(columns = difference)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_fmt_integer_3.png")`
#' }}
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-2
#'
#' @section Function Introduced:
#' `v0.3.1` (August 9, 2021)
#'
#' @seealso
#' Format number with decimal values: [fmt_number()]
#'
#' The vector-formatting version of this function: [vec_fmt_integer()]
#'
#' @export
fmt_integer <- function(
    data,
    columns = everything(),
    rows = everything(),
    use_seps = TRUE,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    force_sign = FALSE,
    min_sep_threshold = 1,
    system = c("intl", "ind"),
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  #
  # - use_seps
  # - accounting
  # - scale_by
  # - suffixing
  # - pattern
  # - sep_mark
  # - force_sign
  # - min_sep_threshold
  # - system
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_integer",
        all_args_except = c("data", "columns", "rows")
      )
    )

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_vars()`
    resolved_rows_idx <-
      resolve_rows_i(
        expr = {{ rows }},
        data = data
      )

    param_tbl <-
      generate_param_tbl(
        data = data,
        arg_vals = arg_vals,
        resolved_rows_idx = resolved_rows_idx
      )

    for (i in seq_len(nrow(param_tbl))) {

      p_i <- as.list(param_tbl[i, ])

      data <-
        fmt_integer(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          use_seps = p_i$use_seps %||% use_seps,
          accounting = p_i$accounting %||% accounting,
          scale_by = p_i$scale_by %||% scale_by,
          suffixing = p_i$suffixing %||% suffixing,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          force_sign = p_i$force_sign %||% force_sign,
          min_sep_threshold = p_i$min_sep_threshold %||% min_sep_threshold,
          system = p_i$system %||% system,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

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
    min_sep_threshold = min_sep_threshold,
    system = system,
    locale = locale
  )
}
