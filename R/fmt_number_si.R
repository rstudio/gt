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


# fmt_number_si() --------------------------------------------------------------
#' Format numbers with SI prefixes
#'
#' @description
#'
#' Format numeric values with SI (International System of Units) prefixes,
#' automatically selecting the appropriate prefix to keep the mantissa in a
#' readable range. SI prefixes range from quetta (Q, 10³⁰) to ronto (r, 10⁻²⁷)
#' and are commonly used in scientific and engineering contexts to represent
#' very large or very small quantities with units (e.g., "5.2 kW", "3.8 µg",
#' "1.2 GHz").
#'
#' This function provides fine control over SI prefix formatting with the
#' following options:
#'
#' - unit specification: define a fixed unit or use per-row units from a column
#' - prefix selection: choose between all SI prefixes or only engineering
#' prefixes (powers of 1000)
#' - precision control: specify decimal places or significant figures
#' - spacing: customize the separator between number, prefix, and unit
#' - locale-based formatting: use locale-specific decimal and thousands separators
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
#' @param unit *Unit to append to formatted values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   A character string specifying the unit to append after the SI prefix
#'   (e.g., `"g"` for grams, `"W"` for watts, `"Hz"` for hertz, `"m"` for meters).
#'   If `NULL`, only the prefix will be shown. The unit can also be dynamically
#'   specified per row using [from_column()].
#'
#' @param prefix_mode *Type of SI prefixes to use*
#'
#'   `singl-kwd:[engineering|decimal]` // *default:* `"engineering"`
#'
#'   The type of SI prefixes to use:
#'   - `"engineering"`: Use only prefixes for powers of 1000 (k, M, G, T, P, E,
#'     Z, Y, R, Q for positive; m, µ, n, p, f, a, z, y, r for negative). This
#'     is the most common convention in scientific and engineering contexts.
#'   - `"decimal"`: Use all SI prefixes including those for powers of 10 and 100
#'     (da, h, d, c in addition to engineering prefixes). Less commonly used.
#'
#' @param decimals *Number of decimal places*
#'
#'   `scalar<numeric|integer>(val>=0)` // *default:* `2`
#'
#'   The exact number of decimal places to display in the mantissa. If both
#'   `decimals` and `n_sigfig` are provided, `n_sigfig` takes precedence.
#'
#' @param n_sigfig *Number of significant figures*
#'
#'   `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)
#'
#'   Format numbers to *n* significant figures. This is often preferred in
#'   scientific contexts to maintain consistent precision across different
#'   magnitudes. When specified, the `decimals` argument is ignored.
#'
#' @param drop_trailing_zeros *Drop trailing zeros*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Remove trailing zeros after the decimal point (e.g., "1.50" becomes "1.5").
#'
#' @param drop_trailing_dec_mark *Drop trailing decimal mark*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Remove the decimal mark if all decimal places are zero (e.g., "1." becomes "1").
#'
#' @param use_seps *Use digit group separators*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   Enable or disable the use of digit separators (e.g., thousands separators).
#'
#' @param sep *Separator between number and unit*
#'
#'   `scalar<character>` // *default:* `""`
#'
#'   The character(s) to use between the formatted number (with prefix) and the
#'   unit. Common options are `""` (no space), `" "` (thin space), or `" "` (regular space).
#'   Scientific convention varies by field and publication.
#'
#' @param pattern *Decoration pattern*
#'
#'   `scalar<character>` // *default:* `"{x}"`
#'
#'   A formatting pattern for decorating values. Use `{x}` to represent the
#'   formatted value (including prefix and unit).
#'
#' @param sep_mark *Thousands separator*
#'
#'   `scalar<character>` // *default:* `","`
#'
#'   The character to use as the thousands separator. Overridden if `locale` is provided.
#'
#' @param dec_mark *Decimal mark*
#'
#'   `scalar<character>` // *default:* `"."`
#'
#'   The character to use as the decimal point. Overridden if `locale` is provided.
#'
#' @param force_sign *Force positive sign*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Force the display of a plus sign for positive values.
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier for locale-specific number formatting.
#'   When provided, overrides `sep_mark` and `dec_mark` with locale-appropriate values.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Compatibility of arguments with the `from_column()` helper function:
#'
#' [`from_column()`] can be used with certain arguments of `fmt_number_si()` to
#' obtain varying parameter values from a specified column within the table.
#' This means that each row could be formatted a little bit differently. These
#' arguments provide support for [`from_column()`]:
#'
#' - `unit`: The unit can be specified with a column name in quotes.
#' - `decimals`: Each row's number formatting could use a different number of
#'   decimal places.
#' - `n_sigfig`: Each row could have a different number of significant figures.
#' - `drop_trailing_zeros`: The option to drop trailing zeros can be controlled
#'   per row.
#' - `drop_trailing_dec_mark`: The option to drop trailing decimal marks can be
#'   controlled per row.
#' - `use_seps`: The use of digit separators can be enabled or disabled on a
#'   per-row basis.
#' - `sep`: The separator between number and unit can vary per row.
#' - `pattern`: The formatting pattern can be specified per row.
#' - `sep_mark`: The thousands separator mark can be set per row.
#' - `dec_mark`: The decimal mark can be set per row.
#' - `force_sign`: Whether to force a plus sign can be controlled per row.
#' - `locale`: The locale can be specified per row.
#'
#' Please note that for all of the aforementioned arguments, a [`from_column()`]
#' call needs to reference a column that has data of the correct type (this is
#' different for each argument). Additional columns for parameter values can be
#' generated with [`cols_add()`] (if not already present). Columns that contain
#' parameter data can also be hidden from final display with [`cols_hide()`].
#' Finally, there is no limitation to how many arguments the [`from_column()`]
#' helper is applied so long as the arguments belong to this closed set.
#'
#' @section Examples:
#'
#' Let's use the [`gtcars`] dataset to create a table showing power output
#' with SI prefixes. We'll format the `hp` column (horsepower) to show values
#' in watts (note: 1 hp ≈ 746 W), using SI prefixes with 3 significant figures.
#'
#' ```r
#' gtcars |>
#'   dplyr::select(mfr, model, hp) |>
#'   dplyr::slice_head(n = 10) |>
#'   gt() |>
#'   cols_add(power_w = hp * 746) |>
#'   fmt_number_si(
#'     columns = power_w,
#'     unit = "W",
#'     n_sigfig = 3,
#'     sep = " "
#'   )
#' ```
#'
#' Use the [`illness`] dataset to show very small concentration values with
#' appropriate SI prefixes. The `units` column contains varying units per row.
#'
#' ```r
#' # Create example data with varying measurements
#' data.frame(
#'   substance = c("Glucose", "Vitamin C", "Caffeine"),
#'   amount = c(0.0051, 0.000075, 0.0002),
#'   unit = c("g", "g", "g")
#' ) |>
#'   gt() |>
#'   fmt_number_si(
#'     columns = amount,
#'     unit = from_column("unit"),
#'     n_sigfig = 2,
#'     sep = " "
#'   )
#' # Results: "5.1 mg", "75 µg", "200 µg"
#' ```
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-X
#'
#' @section Function Introduced:
#' `vX.X.X` (TBD)
#'
#' @export
fmt_number_si <- function(
    data,
    columns = everything(),
    rows = everything(),
    unit = NULL,
    prefix_mode = c("engineering", "decimal"),
    decimals = 2,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    use_seps = TRUE,
    sep = "",
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    locale = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Match the prefix_mode argument
  prefix_mode <- rlang::arg_match0(prefix_mode, values = c("engineering", "decimal"))

  #
  # Begin support for `from_column()` objects passed to compatible arguments
  #

  # Supports parameters:
  # - unit
  # - decimals
  # - n_sigfig
  # - drop_trailing_zeros
  # - drop_trailing_dec_mark
  # - use_seps
  # - sep
  # - pattern
  # - sep_mark
  # - dec_mark
  # - force_sign
  # - locale

  arg_vals <-
    mget(
      get_arg_names(
        function_name = "fmt_number_si",
        all_args_except = c("data", "columns", "rows", "prefix_mode")
      )
    )

  fn_call <- call("fmt_number_si")

  if (args_have_gt_column_obj(arg_vals = arg_vals)) {

    # Resolve the row numbers using `resolve_rows_i()`
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
        fmt_number_si(
          data = data,
          columns = {{ columns }},
          rows = resolved_rows_idx[i],
          unit = p_i$unit %||% unit,
          prefix_mode = prefix_mode,
          decimals = p_i$decimals %||% decimals,
          n_sigfig = p_i$n_sigfig %||% n_sigfig,
          drop_trailing_zeros = p_i$drop_trailing_zeros %||% drop_trailing_zeros,
          drop_trailing_dec_mark = p_i$drop_trailing_dec_mark %||% drop_trailing_dec_mark,
          use_seps = p_i$use_seps %||% use_seps,
          sep = p_i$sep %||% sep,
          pattern = p_i$pattern %||% pattern,
          sep_mark = p_i$sep_mark %||% sep_mark,
          dec_mark = p_i$dec_mark %||% dec_mark,
          force_sign = p_i$force_sign %||% force_sign,
          locale = p_i$locale %||% locale
        )
    }

    return(data)
  }

  #
  # End support for `from_column()` objects passed to compatible arguments
  #

  # Determine if we're using significant figures or decimal places
  if (!is.null(n_sigfig)) {
    formatC_format <- "fg"
  } else {
    formatC_format <- "f"
  }

  # Get the SI prefix labels based on prefix_mode
  si_labels <- get_si_labels(prefix_mode = prefix_mode)

  # Use locale-based marks if a locale ID is provided
  sep_mark <- get_locale_sep_mark(locale, sep_mark, use_seps)
  dec_mark <- get_locale_dec_mark(locale, dec_mark)

  valid_class <- c("numeric", "integer")
  check_columns_valid_if_strict(data, {{ columns }}, valid_class)

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

        # Define the marks by context
        minus_mark <- context_minus_mark(context = context)

        # Create the `si_prefix_df` object
        si_prefix_df <-
          create_si_prefix_df(
            x,
            decimals = decimals,
            si_labels = si_labels
          )

        # Scale the `x` values by the SI prefix scale factors
        x <- x * si_prefix_df$scale_by

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
            system = "intl"
          )

        # Additional cleanup: ensure trailing decimal marks are removed if requested
        # (format_num_to_str doesn't always handle this when sep_mark is non-empty)
        if (drop_trailing_dec_mark && nzchar(dec_mark)) {
          x_str <- gsub(paste0("\\", dec_mark, "$"), "", x_str)
        }

        # Add unit with separator if both prefix and unit exist
        if (!is.null(unit) && nzchar(unit)) {
          # Combine: number + separator + prefix + unit
          x_str <- paste0(x_str, sep, si_prefix_df$prefix, unit)
        } else {
          # Just combine number with SI prefix (no unit)
          x_str <- paste0(x_str, si_prefix_df$prefix)
        }

        # Replace minus signs with the context-appropriate minus mark
        x_str <- gsub("-", minus_mark, x_str, fixed = TRUE)

        # Force a positive sign on certain values if the option is taken
        if (force_sign) {
          positive_x <- !is.na(x) & x > 0
          x_str[positive_x] <- paste0("+", x_str[positive_x])
        }

        x_str
      }
    )
  )
}


# Helper functions -------------------------------------------------------------

#' Get SI prefix labels
#'
#' Returns the appropriate set of SI prefix labels based on the mode.
#' @param prefix_mode Either "engineering" or "decimal"
#' @noRd
get_si_labels <- function(prefix_mode) {

  if (prefix_mode == "engineering") {
    # Engineering notation: powers of 1000 only
    # Positive: 10^3, 10^6, 10^9, 10^12, 10^15, 10^18, 10^21, 10^24, 10^27, 10^30
    # Negative: 10^-3, 10^-6, 10^-9, 10^-12, 10^-15, 10^-18, 10^-21, 10^-24, 10^-27, 10^-30
    list(
      exponents = c(-30, -27, -24, -21, -18, -15, -12, -9, -6, -3,
                    3, 6, 9, 12, 15, 18, 21, 24, 27, 30),
      symbols = c("r", "r", "y", "z", "a", "f", "p", "n", "µ", "m",
                  "k", "M", "G", "T", "P", "E", "Z", "Y", "R", "Q")
    )
  } else {
    # Decimal notation: all SI prefixes
    list(
      exponents = c(-30, -27, -24, -21, -18, -15, -12, -9, -6, -3, -2, -1,
                    1, 2, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30),
      symbols = c("r", "r", "y", "z", "a", "f", "p", "n", "µ", "m", "c", "d",
                  "da", "h", "k", "M", "G", "T", "P", "E", "Z", "Y", "R", "Q")
    )
  }
}

#' Create a data frame with SI prefix information
#'
#' For each value in `x`, determine the appropriate SI prefix and scale factor.
#' @param x Numeric vector
#' @param decimals Number of decimal places (used for rounding in selection)
#' @param si_labels List with exponents and symbols
#' @noRd
create_si_prefix_df <- function(x, decimals, si_labels) {

  n <- length(x)
  scale_by <- numeric(n)
  prefix <- character(n)

  for (i in seq_len(n)) {

    if (is.na(x[i]) || is.infinite(x[i]) || x[i] == 0) {
      # For NA, Inf, or zero values, no prefix
      scale_by[i] <- 1
      prefix[i] <- ""
    } else {
      # Find the best matching SI prefix
      # We want the mantissa to be in the range [1, 1000) for engineering mode
      # or [1, 10) for decimal mode with powers of 10
      best_exp <- 0
      best_idx <- NA

      for (j in seq_along(si_labels$exponents)) {
        exp_j <- si_labels$exponents[j]

        # Check if this exponent would give us a mantissa in [1, 1000)
        mantissa <- abs(x[i]) * 10^(-exp_j)

        if (mantissa >= 1 && mantissa < 1000) {
          # Prefer the largest exponent that keeps mantissa in range
          if (is.na(best_idx) || exp_j > best_exp) {
            best_exp <- exp_j
            best_idx <- j
          }
        }
      }

      if (is.na(best_idx)) {
        # No suitable prefix found, use no prefix
        scale_by[i] <- 1
        prefix[i] <- ""
      } else {
        scale_by[i] <- 10^(-best_exp)
        prefix[i] <- si_labels$symbols[best_idx]
      }
    }
  }

  vctrs::data_frame(
    scale_by = scale_by,
    prefix = prefix
  )
}
