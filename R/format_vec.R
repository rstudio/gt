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

output_types <- c("auto", "plain", "html", "latex", "rtf", "word")

# vec_fmt_number() -------------------------------------------------------------
#' Format a vector as numeric values
#'
#' @description
#'
#' With numeric values in a vector, we can perform number-based formatting so
#' that the values are rendered to a character vector with some level of
#' precision. The following major options are available:
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
#' @param x *The input vector*
#'
#'   `vector(numeric|integer)` // **required**
#'
#'   This is the input vector that will undergo transformation to a character
#'   vector of the same length. Values within the vector will be formatted.
#'
#' @inheritParams fmt_number
#'
#' @param output *Output format*
#'
#'   `singl-kw:[auto|plain|html|latex|rtf|word]` // *default:* `"auto"`
#'
#'   The output style of the resulting character vector. This can either be
#'   `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or
#'   `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the `"auto"`
#'   option will choose the correct `output` value
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(5.2, 8.65, 0, -5.3, NA)
#' ```
#'
#' Using `vec_fmt_number()` with the default options will create a character
#' vector where the numeric values have two decimal places and `NA` values will
#' render as `"NA"`. Also, the rendering context will be autodetected unless
#' specified in the `output` argument (here, it is of the `"plain"` output
#' type).
#'
#' ```r
#' vec_fmt_number(num_vals)
#' ```
#' ```
#' #> [1] "5.20" "8.65" "0.00" "-5.30" "NA"
#' ```
#'
#' We can change the decimal mark to a comma, and we have to be sure to change
#' the digit separator mark from the default comma to something else (a period
#' works here):
#'
#' ```r
#' vec_fmt_number(num_vals, sep_mark = ".", dec_mark = ",")
#' ```
#' ```
#' #> [1] "5,20" "8,65" "0,00" "-5,30" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** handle these locale-specific formatting options:
#'
#' ```r
#' vec_fmt_number(num_vals, locale = "fr")
#' ```
#' ```
#' #> [1] "5,20" "8,65" "0,00" "-5,30" "NA"
#' ```
#'
#' There are many options for formatting values. Perhaps you need to have
#' explicit positive and negative signs? Use `force_sign = TRUE` for that.
#'
#' ```r
#' vec_fmt_number(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+5.20" "+8.65" "0.00" "-5.30" "NA"
#' ```
#'
#' Those trailing zeros past the decimal mark can be stripped out by using the
#' `drop_trailing_zeros` option.
#'
#' ```r
#' vec_fmt_number(num_vals, drop_trailing_zeros = TRUE)
#' ```
#' ```
#' #> [1] "5.2" "8.65" "0" "-5.3" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_number(num_vals, pattern = "`{x}`")
#' ```
#' ```
#' #> [1] "`5.20`" "`8.65`" "`0.00`" "`-5.30`" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-1
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_number()].
#'
#' @export
vec_fmt_number <- function(
    x,
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
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if `x` is not a vector or is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_number(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      decimals = decimals,
      n_sigfig = n_sigfig,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      use_seps = use_seps,
      accounting = accounting,
      scale_by = scale_by,
      suffixing = suffixing,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      min_sep_threshold = min_sep_threshold,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_integer() ------------------------------------------------------------
#' Format a vector as integer values
#'
#' @description
#'
#' With numeric values in a vector, we can perform number-based formatting so
#' that the input values are always rendered as integer values within a
#' character vector. The following major options are available:
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
#' @inheritParams fmt_integer
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(5.2, 8.65, 13602, -5.3, NA)
#' ```
#'
#' Using `vec_fmt_integer()` with the default options will create a character
#' vector where the input values undergo rounding to become integers and `NA`
#' values will render as `"NA"`. Also, the rendering context will be
#' autodetected unless specified in the `output` argument (here, it is of the
#' `"plain"` output type).
#'
#' ```r
#' vec_fmt_integer(num_vals)
#' ```
#' ```
#' #> [1] "5" "9" "13,602" "-5" "NA"
#' ```
#'
#' We can change the digit separator mark to a period with the `sep_mark`
#' option:
#'
#' ```r
#' vec_fmt_integer(num_vals, sep_mark = ".")
#' ```
#' ```
#' #> [1] "5" "9" "13.602" "-5" "NA"
#' ```
#'
#' Many options abound for formatting values. If you have a need for positive
#' and negative signs in front of each and every value, use `force_sign = TRUE`:
#'
#' ```r
#' vec_fmt_integer(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+5" "+9" "+13,602" "-5" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_integer(num_vals, pattern = "`{x}`")
#' ```
#' ```
#' #> [1] "`5`" "`9`" "`13,602`" "`-5`" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-2
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_integer()].
#'
#' @export
vec_fmt_integer <- function(
    x,
    use_seps = TRUE,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    force_sign = FALSE,
    min_sep_threshold = 1,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  vec_fmt_number(
    x,
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
    locale = locale,
    output = output
  )
}

# vec_fmt_scientific() ---------------------------------------------------------
#' Format a vector as values in scientific notation
#'
#' @description
#'
#' With numeric values in a vector, we can perform formatting so that the
#' targeted values are rendered in scientific notation, where extremely large or
#' very small numbers can be expressed in a more practical fashion. Here,
#' numbers are written in the form of a mantissa (`m`) and an exponent (`n`)
#' with the construction *m* x 10^*n* or *m*E*n*. The mantissa component is a
#' number between `1` and `10`. For instance, `2.5 x 10^9` can be used to
#' represent the value 2,500,000,000 in scientific notation. In a similar way,
#' 0.00000012 can be expressed as `1.2 x 10^-7`. Due to its ability to describe
#' numbers more succinctly and its ease of calculation, scientific notation is
#' widely employed in scientific and technical domains.
#'
#' We have fine control over the formatting task, with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_scientific
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(3.24e-4, 8.65, 1362902.2, -59027.3, NA)
#' ```
#'
#' Using `vec_fmt_scientific()` with the default options will create a character
#' vector with values in scientific notation. Any `NA` values remain as `NA`
#' values. The rendering context will be autodetected unless specified in the
#' `output` argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_scientific(num_vals)
#' ```
#' ```
#' #> [1] "3.24 x 10^-4" "8.65" "1.36 x 10^6" "-5.90 x 10^4" "NA"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_scientific(num_vals, decimals = 1)
#' ```
#' ```
#' #> [1] "3.2 x 10^-4" "8.7" "1.4 x 10^6" "-5.9 x 10^4" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_scientific(num_vals, locale = "es")
#' ```
#' ```
#' #> [1] "3,24 x 10^-4" "8,65" "1,36 x 10^6" "-5,90 x 10^4" "NA"
#' ```
#'
#' Should you need to have positive and negative signs for the mantissa
#' component of a given value, use `force_sign_m = TRUE`:
#'
#' ```r
#' vec_fmt_scientific(num_vals, force_sign_m = TRUE)
#' ```
#' ```
#' #> [1] "+3.24 x 10^-4" "+8.65" "+1.36 x 10^6" "-5.90 x 10^4" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_scientific(num_vals, pattern = "[{x}]")
#' ```
#' ```
#' #> [1] "[3.24 x 10^-4]" "[8.65]" "[1.36 x 10^6]" "[-5.90 x 10^4]" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-3
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_scientific()].
#'
#' @export
vec_fmt_scientific <- function(
    x,
    decimals = 2,
    n_sigfig = NULL,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_by = 1.0,
    exp_style = "x10n",
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign_m = FALSE,
    force_sign_n = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_scientific(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      decimals = decimals,
      n_sigfig = n_sigfig,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      scale_by = scale_by,
      exp_style = exp_style,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign_m = force_sign_m,
      force_sign_n = force_sign_n,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_engineering() --------------------------------------------------------
#' Format a vector as values in engineering notation
#'
#' @description
#'
#' With numeric values in a vector, we can perform formatting so that the
#' targeted values are rendered in engineering notation, where numbers are
#' written in the form of a mantissa (`m`) and an exponent (`n`). When combined
#' the construction is either of the form *m* x 10^*n* or *m*E*n*. The mantissa
#' is a number between `1` and `1000` and the exponent is a multiple of `3`. For
#' example, the number 0.0000345 can be written in engineering notation as
#' `34.50 x 10^-6`. This notation helps to simplify calculations and make it
#' easier to compare numbers that are on very different scales.
#'
#' We have fine control over the formatting task, with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_engineering
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(3.24e-4, 8.65, 1362902.2, -59027.3, NA)
#' ```
#'
#' Using `vec_fmt_engineering()` with the default options will create a
#' character vector with values engineering notation. Any `NA` values remain as
#' `NA` values. The rendering context will be autodetected unless specified in
#' the `output` argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_engineering(num_vals)
#' ```
#' ```
#' #> [1] "324.00 x 10^-6" "8.65" "1.36 x 10^6" "-59.03 x 10^3" "NA"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_engineering(num_vals, decimals = 1)
#' ```
#' ```
#' #> [1] "324.0 x 10^-6" "8.7" "1.4 x 10^6" "-59.0 x 10^3" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_engineering(num_vals, locale = "da")
#' ```
#' ```
#' #> [1] "324,00 x 10^-6" "8,65" "1,36 x 10^6" "-59,03 x 10^3" "NA"
#' ```
#'
#' Should you need to have positive and negative signs for the mantissa
#' component of a given value, use `force_sign_m = TRUE`:
#'
#' ```r
#' vec_fmt_engineering(num_vals, force_sign_m = TRUE)
#' ```
#' ```
#' #> [1] "+324.00 x 10^-6" "+8.65" "+1.36 x 10^6" "-59.03 x 10^3" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_engineering(num_vals, pattern = "/{x}/")
#' ```
#' ```
#' #> [1] "/324.00 x 10^-6/" "/8.65/" "/1.36 x 10^6/" "/-59.03 x 10^3/" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-4
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_engineering()].
#'
#' @export
vec_fmt_engineering <- function(
    x,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_by = 1.0,
    exp_style = "x10n",
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign_m = FALSE,
    force_sign_n = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_engineering(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      scale_by = scale_by,
      exp_style = exp_style,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign_m = force_sign_m,
      force_sign_n = force_sign_n,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_number_si() ----------------------------------------------------------
#' Format a vector as numbers with SI prefixes
#'
#' @description
#'
#' With numeric values in a vector, we can format the values with SI (International
#' System of Units) prefixes. These prefixes like k (kilo), M (mega), G (giga),
#' and m (milli) scale numbers in either powers of 1000 (engineering mode) or
#' powers of 10 and 100 (decimal mode).
#'
#' We have control over the formatting with the following options:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' (useful for unit conversions)
#' - SI prefix mode: choose between engineering prefixes (powers of 1000) or
#' decimal prefixes (all SI prefixes)
#' - units: an optional unit designation for the values
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_number_si
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(1.5e9, 2.7e6, 4200, 0.3, 0.00012, 2.4e-8)
#' ```
#'
#' Using `vec_fmt_number_si()` with the default options will create a
#' character vector with values formatted with SI prefixes. Any `NA` values
#' remain as `NA` values. The rendering context will be autodetected unless
#' specified in the `output` argument (here, it is of the `"plain"` output
#' type).
#'
#' ```r
#' vec_fmt_number_si(num_vals)
#' ```
#' ```
#' #> [1] "1.50 G" "2.70 M" "4.20 k" "300.00 m" "120.00 u" "24.00 n"
#' ```
#'
#' We can add a unit designation to all values with the `unit` option:
#'
#' ```r
#' vec_fmt_number_si(num_vals, unit = "W")
#' ```
#' ```
#' #> [1] "1.50 GW" "2.70 MW" "4.20 kW" "300.00 mW" "120.00 uW" "24.00 nW"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_number_si(num_vals, unit = "g", decimals = 0)
#' ```
#' ```
#' #> [1] "2 Gg" "3 Mg" "4 kg" "0 g" "0 g" "0 g"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_number_si(num_vals, unit = "m", locale = "fr")
#' ```
#' ```
#' #> [1] "1,50 Gm" "2,70 Mm" "4,20 km" "300,00 mm" "120,00 um" "24,00 nm"
#' ```
#'
#' The `scale_by` option is useful for unit conversions. For instance, to
#' convert meters to millimeters:
#'
#' ```r
#' vec_fmt_number_si(c(0.5, 1.2, 3.8), unit = "m", scale_by = 1000)
#' ```
#' ```
#' #> [1] "500.00 mm" "1.20 km" "3.80 km"
#' ```
#'
#' We can control the space between the number and unit with `incl_space`:
#'
#' ```r
#' vec_fmt_number_si(num_vals, unit = "Hz", incl_space = FALSE, decimals = 1)
#' ```
#' ```
#' #> [1] "1.5GHz" "2.7MHz" "4.2kHz" "300.0mHz" "120.0uHz" "24.0nHz"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_number_si(num_vals, pattern = "[{x}]")
#' ```
#' ```
#' #> [1] "[1.50 G]" "[2.70 M]" "[4.20 k]" "[300.00 m]" "[120.00 u]" "[24.00 n]"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-5
#'
#' @section Function Introduced:
#' *In Development*
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_number_si()].
#'
#' @export
vec_fmt_number_si <- function(
    x,
    unit = NULL,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_by = 1.0,
    prefix_mode = c("engineering", "decimal"),
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = TRUE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  # Ensure that `prefix_mode` is matched correctly to one option
  prefix_mode <- rlang::arg_match0(prefix_mode, values = c("engineering", "decimal"))

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_number_si(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      unit = unit,
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      scale_by = scale_by,
      prefix_mode = prefix_mode,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_percent() ------------------------------------------------------------
#' Format a vector as percentage values
#'
#' @description
#'
#' With numeric values in vector, we can perform percentage-based formatting. It
#' is assumed that numeric values in the input vector are proportional values
#' and, in this case, the values will be automatically multiplied by `100`
#' before decorating with a percent sign (the other case is accommodated though
#' setting the `scale_values` to `FALSE`). For more control over percentage
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
#' @inheritParams fmt_percent
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(0.0052, 0.08, 0, -0.535, NA)
#' ```
#'
#' Using `vec_fmt_percent()` with the default options will create a character
#' vector where the resultant percentage values have two decimal places and `NA`
#' values will render as `"NA"`. The rendering context will be autodetected
#' unless specified in the `output` argument (here, it is of the `"plain"`
#' output type).
#'
#' ```r
#' vec_fmt_percent(num_vals)
#' ```
#' ```
#' #> [1] "0.52%" "8.00%" "0.00%" "-53.50%" "NA"
#' ```
#'
#' We can change the decimal mark to a comma, and we have to be sure to change
#' the digit separator mark from the default comma to something else (a period
#' works here):
#'
#' ```r
#' vec_fmt_percent(num_vals, sep_mark = ".", dec_mark = ",")
#' ```
#' ```
#' #> [1] "0,52%" "8,00%" "0,00%" "-53,50%" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** handle these locale-specific formatting options:
#'
#' ```r
#' vec_fmt_percent(num_vals, locale = "pt")
#' ```
#' ```
#' #> [1] "0,52%" "8,00%" "0,00%" "-53,50%" "NA"
#' ```
#'
#' There are many options for formatting values. Perhaps you need to have
#' explicit positive and negative signs? Use `force_sign = TRUE` for that.
#'
#' ```r
#' vec_fmt_percent(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+0.52%" "+8.00%" "0.00%" "-53.50%" "NA"
#' ```
#'
#' Those trailing zeros past the decimal mark can be stripped out by using the
#' `drop_trailing_zeros` option.
#'
#' ```r
#' vec_fmt_percent(num_vals, drop_trailing_zeros = TRUE)
#' ```
#' ```
#' #> [1] "0.52%" "8%" "0%" "-53.5%" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_percent(num_vals, pattern = "{x}wt")
#' ```
#' ```
#' #> [1] "0.52%wt" "8.00%wt" "0.00%wt" "-53.50%wt" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-6
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_percent()].
#'
#' @export
vec_fmt_percent <- function(
    x,
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
    min_sep_threshold = 1,
    incl_space = FALSE,
    placement = "right",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_percent(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      scale_values = scale_values,
      use_seps = use_seps,
      accounting = accounting,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      min_sep_threshold = min_sep_threshold,
      incl_space = incl_space,
      placement = placement,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_partsper() -----------------------------------------------------------
#' Format a vector as parts-per quantities
#'
#' @description
#'
#' With numeric values in a vector, we can format the values so that they
#' are rendered as *per mille*, *ppm*, *ppb*, etc., quantities. The following
#' list of keywords (with associated naming and scaling factors) is available to
#' use within `vec_fmt_partsper()`:
#'
#' - `"per-mille"`: Per mille, (1 part in `1,000`)
#' - `"per-myriad"`: Per myriad, (1 part in `10,000`)
#' - `"pcm"`: Per cent mille (1 part in `100,000`)
#' - `"ppm"`: Parts per million, (1 part in `1,000,000`)
#' - `"ppb"`: Parts per billion, (1 part in `1,000,000,000`)
#' - `"ppt"`: Parts per trillion, (1 part in `1,000,000,000,000`)
#' - `"ppq"`: Parts per quadrillion, (1 part in `1,000,000,000,000,000`)
#'
#' The function provides a lot of formatting control and we can use the
#' following options:
#'
#' - custom symbol/units: we can override the automatic symbol or units display
#' with our own choice as the situation warrants
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol
#' - value scaling toggle: choose to disable automatic value scaling in the
#' situation that values are already scaled coming in (and just require the
#' appropriate symbol or unit display)
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_partsper
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(10^(-3:-5), NA)
#' ```
#'
#' Using `vec_fmt_partsper()` with the default options will create a character
#' vector where the resultant per mille values have two decimal places and `NA`
#' values will render as `"NA"`. The rendering context will be autodetected
#' unless specified in the `output` argument (here, it is of the `"plain"`
#' output type).
#'
#' ```r
#' vec_fmt_partsper(num_vals)
#' ```
#' ```
#' #> [1] "1.00%." "0.10%." "0.01%." "NA"
#' ```
#'
#' We can change the output units to a different measure. If ppm units are
#' desired then `to_units = "ppm"` can be used.
#'
#' ```r
#' vec_fmt_partsper(num_vals, to_units = "ppm")
#' ```
#' ```
#' #> [1] "1,000.00 ppm" "100.00 ppm" "10.00 ppm" "NA"
#' ```
#'
#' We can change the decimal mark to a comma, and we have to be sure to change
#' the digit separator mark from the default comma to something else (a period
#' works here):
#'
#' ```r
#' vec_fmt_partsper(
#'   num_vals,
#'   to_units = "ppm",
#'   sep_mark = ".",
#'   dec_mark = ","
#' )
#' ```
#' ```
#' #> [1] "1.000,00 ppm" "100,00 ppm" "10,00 ppm" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** handle these locale-specific formatting options:
#'
#' ```r
#' vec_fmt_partsper(num_vals, to_units = "ppm", locale = "es")
#' ```
#' ```
#' #> [1] "1.000,00 ppm" "100,00 ppm" "10,00 ppm" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_partsper(num_vals, to_units = "ppm", pattern = "{x}V")
#' ```
#' ```
#' #> [1] "1,000.00 ppmV" "100.00 ppmV" "10.00 ppmV" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-7
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_partsper()].
#'
#' @export
vec_fmt_partsper <- function(
    x,
    to_units = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq"),
    symbol = "auto",
    decimals = 2,
    drop_trailing_zeros = FALSE,
    drop_trailing_dec_mark = TRUE,
    scale_values = TRUE,
    use_seps = TRUE,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    incl_space = "auto",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `to_units` is matched correctly to one option
  to_units <-
    rlang::arg_match0(
      to_units,
      values = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq")
    )

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_partsper(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      to_units = to_units,
      symbol = symbol,
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      scale_values = scale_values,
      use_seps = use_seps,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_fraction() -----------------------------------------------------------
#' Format a vector as mixed fractions
#'
#' @description
#'
#' With numeric values in vector, we can perform mixed-fraction-based
#' formatting. There are several options for setting the accuracy of the
#' fractions. Furthermore, there is an option for choosing a layout (i.e.,
#' typesetting style) for the mixed-fraction output.
#'
#' The following options are available for controlling this type of formatting:
#'
#' - accuracy: how to express the fractional part of the mixed fractions; there
#' are three keyword options for this and an allowance for arbitrary denominator
#' settings
#' - simplification: an option to simplify fractions whenever possible
#' - layout: We can choose to output values with diagonal or inline fractions
#' - digit grouping separators: options to enable/disable digit separators
#' and provide a choice of separator symbol for the whole number portion
#' - pattern: option to use a text pattern for decoration of the formatted
#' mixed fractions
#' - locale-based formatting: providing a locale ID will result in number
#' formatting specific to the chosen locale
#'
#' @inheritParams fmt_fraction
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(0.0052, 0.08, 0, -0.535, NA)
#' ```
#'
#' Using `vec_fmt_fraction()` will create a character vector of fractions. Any
#' `NA` values will render as `"NA"`. The rendering context will be autodetected
#' unless specified in the `output` argument (here, it is of the `"plain"`
#' output type).
#'
#' ```r
#' vec_fmt_fraction(num_vals)
#' ```
#' ```
#' #> [1] "0" "1/9" "0" "-5/9" "NA"
#' ```
#'
#' There are many options for formatting as fractions. If you'd like a higher
#' degree of accuracy in the computation of fractions we can supply the `"med"`
#' or `"high"` keywords to the `accuracy` argument:
#'
#' ```r
#' vec_fmt_fraction(num_vals, accuracy = "high")
#' ```
#' ```
#' #> [1] "1/200" "2/25" "0" "-107/200" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_fraction(num_vals, accuracy = 8, pattern = "[{x}]")
#' ```
#' ```
#' #> [1] "[0]" "[1/8]" "[0]" "[-1/2]" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-8
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_fraction()].
#'
#' @export
vec_fmt_fraction <- function(
    x,
    accuracy = NULL,
    simplify = TRUE,
    layout = c("inline", "diagonal"),
    use_seps = TRUE,
    pattern = "{x}",
    sep_mark = ",",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `layout` is matched correctly to one option
  layout <- rlang::arg_match0(layout, values = c("inline", "diagonal"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_fraction(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      accuracy = accuracy,
      simplify = simplify,
      layout = layout,
      use_seps = use_seps,
      pattern = pattern,
      sep_mark = sep_mark,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_currency() -----------------------------------------------------------
#' Format a vector as currency values
#'
#' @description
#'
#' With numeric values in a vector, we can perform currency-based formatting.
#' This function supports both automatic formatting with a three-letter or
#' numeric currency code. We can also specify a custom currency that is
#' formatted according to the output context with the [currency()] helper
#' function. We have fine control over the conversion from numeric values to
#' currency values, where we could take advantage of the following options:
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
#' - locale-based formatting: providing a locale ID will result in currency
#' formatting specific to the chosen locale; it will also retrieve the locale's
#' currency if none is explicitly given
#'
#' We can call [info_currencies()] for a useful reference on all of the possible
#' inputs to the `currency` argument.
#'
#' @inheritParams fmt_currency
#'
#' @inheritParams vec_fmt_number
#'
#' @param currency *Currency to use*
#'
#'   `scalar<character>|obj:<gt_currency>` // *default:* `NULL` (`optional`)
#'
#'   The currency to use for the numeric value. This input can be
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
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(5.2, 8.65, 0, -5.3, NA)
#' ```
#'
#' Using `vec_fmt_currency()` with the default options will create a character
#' vector where the numeric values have been transformed to U.S. Dollars
#' (`"USD"`). Furthermore, the rendering context will be autodetected unless
#' specified in the `output` argument (here, it is of the `"plain"` output
#' type).
#'
#' ```r
#' vec_fmt_currency(num_vals)
#' ```
#' ```
#' #> [1] "$5.20" "$8.65" "$0.00" "-$5.30" "NA"
#' ```
#'
#' We can supply a currency code to the `currency` argument. Let's use British
#' Pounds through `currency = "GBP"`:
#'
#' ```r
#' vec_fmt_currency(num_vals, currency = "GBP")
#' ```
#' ```
#' #> [1] "GBP5.20" "GBP8.65" "GBP0.00" "-GBP5.30" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** handle all locale-specific formatting options:
#'
#' ```r
#' vec_fmt_currency(num_vals, locale = "fr")
#' ```
#' ```
#' #> [1] "EUR5,20" "EUR8,65" "EUR0,00" "-EUR5,30" "NA"
#' ```
#'
#' There are many options for formatting values. Perhaps you need to have
#' explicit positive and negative signs? Use `force_sign = TRUE` for that.
#'
#' ```r
#' vec_fmt_currency(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+$5.20" "+$8.65" "$0.00" "-$5.30" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_currency(num_vals, pattern = "`{x}`")
#' ```
#' ```
#' #> [1] "`$5.20`" "`$8.65`" "`$0.00`" "`-$5.30`" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-9
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_currency()].
#'
#' @export
vec_fmt_currency <- function(
    x,
    currency = NULL,
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
    min_sep_threshold = 1,
    placement = "left",
    incl_space = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_currency(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      currency = currency,
      use_subunits = use_subunits,
      decimals = decimals,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      use_seps = use_seps,
      accounting = accounting,
      scale_by = scale_by,
      suffixing = suffixing,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      min_sep_threshold = min_sep_threshold,
      placement = placement,
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_roman() --------------------------------------------------------------
#' Format a vector as Roman numerals
#'
#' @description
#'
#' With numeric values in a vector, we can transform those to Roman numerals,
#' rounding values as necessary.
#'
#' @inheritParams fmt_roman
#'
#' @inheritParams vec_fmt_number
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(1, 4, 5, 8, 12, 20, 0, -5, 1.3, NA)
#' ```
#'
#' Using `vec_fmt_roman()` with the default options will create a character
#' vector with values rendered as Roman numerals. Zero values will be rendered
#' as `"N"`, any `NA` values remain as `NA` values, negative values will be
#' automatically made positive, and values greater than or equal to 3900 will be
#' rendered as `"ex terminis"`. The rendering context will be autodetected
#' unless specified in the `output` argument (here, it is of the `"plain"`
#' output type).
#'
#' ```r
#' vec_fmt_roman(num_vals)
#' ```
#'
#' ```
#' #> [1] "I" "IV" "V" "VIII" "XII" "XX" "N" "V" "I" "NA"
#' ```
#'
#' We can also use `vec_fmt_roman()` with the `case = "lower"` option to create
#' a character vector with values rendered as lowercase Roman numerals.
#'
#' ```r
#' vec_fmt_roman(num_vals, case = "lower")
#' ```
#'
#' ```
#' #> [1] "i" "iv" "v" "viii" "xii" "xx" "n" "v" "i" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_roman(num_vals, case = "lower", pattern = "{x}.")
#' ```
#' ```
#' #> [1] "i." "iv." "v." "viii." "xii." "xx." "n." "v." "i." "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-10
#'
#' @section Function Introduced:
#' `v0.8.0` (November 16, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_roman()].
#'
#' @export
vec_fmt_roman <- function(
    x,
    case = c("upper", "lower"),
    pattern = "{x}",
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `case` and `output` are matched correctly to one option
  case <- rlang::arg_match0(case, values = c("upper", "lower"))
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_roman(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      case = case,
      pattern = pattern
    ),
    output = output
  )
}

# vec_fmt_index() --------------------------------------------------------------
#' Format a vector as indexed characters
#'
#' @description
#'
#' With numeric values in a vector, we can transform those to index values,
#' usually based on letters. These characters can be derived from a specified
#' locale and they are intended for ordering (often leaving out characters with
#' diacritical marks).
#'
#' @inheritParams fmt_index
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for
#'   a useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(1, 4, 5, 8, 12, 20, 26, 34, 0, -5, 1.3, NA)
#' ```
#'
#' Using `vec_fmt_index()` with the default options will create a character
#' vector with values rendered as index numerals. Zero values will be rendered
#' as `""` (i.e., empty strings), any `NA` values remain as `NA` values, and
#' negative values will be automatically made positive. The rendering context
#' will be autodetected unless specified in the `output` argument (here, it is
#' of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_index(num_vals)
#' ```
#'
#' ```
#' #> [1] "A" "D" "E" "H" "L" "T" "Z" "HH" "" "E" "A" "NA"
#' ```
#'
#' We can also use `vec_fmt_index()` with the `case = "lower"` option to create
#' a character vector with values rendered as lowercase Roman numerals.
#'
#' ```r
#' vec_fmt_index(num_vals, case = "lower")
#' ```
#'
#' ```
#' #> [1] "a" "d" "e" "h" "l" "t" "z" "hh" "" "e" "a" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** obtain a locale-specific set of index values:
#'
#' ```r
#' vec_fmt_index(1:10, locale = "so")
#' ```
#' ```
#' #> [1] "B" "C" "D" "F" "G" "H" "J" "K" "L" "M"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_index(num_vals, case = "lower", pattern = "{x}.")
#' ```
#' ```
#' #> [1] "a." "d." "e." "h." "l." "t." "z." "hh." "." "e." "a." "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-11
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_index()].
#'
#' @export
vec_fmt_index <- function(
    x,
    case = c("upper", "lower"),
    index_algo = c("repeat", "excel"),
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `case`, `index_algo` and `output` are matched correctly to one option
  case <- rlang::arg_match0(case, values = c("upper", "lower"))
  index_algo <- rlang::arg_match0(index_algo, values = c("repeat", "excel"))
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_index(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      case = case,
      index_algo = index_algo,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_spelled_num() --------------------------------------------------------
#' Format a vector as spelled-out numbers
#'
#' @description
#'
#' With numeric values in a vector, we can transform those to numbers that are
#' spelled out. Any values from `0` to `100` can be spelled out according to the
#' specified locale. For example, the value `23` will be rendered as
#' `"twenty-three"` if the locale is an English-language one (or, not provided
#' at all); should a Swedish locale be provided (e.g., `"sv"`), the output will
#' instead be `"tjugotre"`.
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Supported locales:
#'
#' The following 80 locales are supported in the `locale` argument of
#' `vec_fmt_spelled_num()`: `"af"` (Afrikaans), `"ak"` (Akan), `"am"` (Amharic),
#' `"ar"` (Arabic), `"az"` (Azerbaijani), `"be"` (Belarusian), `"bg"`
#' (Bulgarian), `"bs"` (Bosnian), `"ca"` (Catalan), `"ccp"` (Chakma), `"chr"`
#' (Cherokee), `"cs"` (Czech), `"cy"` (Welsh), `"da"` (Danish), `"de"` (German),
#' `"de-CH"` (German (Switzerland)), `"ee"` (Ewe), `"el"` (Greek), `"en"`
#' (English), `"eo"` (Esperanto), `"es"` (Spanish), `"et"` (Estonian), `"fa"`
#' (Persian), `"ff"` (Fulah), `"fi"` (Finnish), `"fil"` (Filipino), `"fo"`
#' (Faroese), `"fr"` (French), `"fr-BE"` (French (Belgium)), `"fr-CH"` (French
#' (Switzerland)), `"ga"` (Irish), `"he"` (Hebrew), `"hi"` (Hindi), `"hr"`
#' (Croatian), `"hu"` (Hungarian), `"hy"` (Armenian), `"id"` (Indonesian),
#' `"is"` (Icelandic), `"it"` (Italian), `"ja"` (Japanese), `"ka"` (Georgian),
#' `"kk"` (Kazakh), `"kl"` (Kalaallisut), `"km"` (Khmer), `"ko"` (Korean),
#' `"ky"` (Kyrgyz), `"lb"` (Luxembourgish), `"lo"` (Lao), `"lrc"` (Northern
#' Luri), `"lt"` (Lithuanian), `"lv"` (Latvian), `"mk"` (Macedonian), `"ms"`
#' (Malay), `"mt"` (Maltese), `"my"` (Burmese), `"ne"` (Nepali), `"nl"` (Dutch),
#' `"nn"` (Norwegian Nynorsk), `"no"` (Norwegian), `"pl"` (Polish), `"pt"`
#' (Portuguese), `"qu"` (Quechua), `"ro"` (Romanian), `"ru"` (Russian), `"se"`
#' (Northern Sami), `"sk"` (Slovak), `"sl"` (Slovenian), `"sq"` (Albanian),
#' `"sr"` (Serbian), `"sr-Latn"` (Serbian (Latin)), `"su"` (Sundanese), `"sv"`
#' (Swedish), `"sw"` (Swahili), `"ta"` (Tamil), `"th"` (Thai), `"tr"` (Turkish),
#' `"uk"` (Ukrainian), `"vi"` (Vietnamese), `"yue"` (Cantonese), and `"zh"`
#' (Chinese).
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(1, 8, 23, 76, 0, -5, 200, NA)
#' ```
#'
#' Using `vec_fmt_spelled_num()` will create a character vector with values
#' rendered as spelled-out numbers. Any `NA` values remain as `NA` values. The
#' rendering context will be autodetected unless specified in the `output`
#' argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_spelled_num(num_vals)
#' ```
#'
#' ```
#' #> [1] "one"     "eight"     "twenty-three"  "seventy-six"  "zero"
#' #> [6] "-5"      "200"       "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** obtain a locale-specific set of spelled numbers:
#'
#' ```r
#' vec_fmt_spelled_num(num_vals, locale = "af")
#' ```
#' ```
#' #> [1] "een"     "agt"     "drie-en-twintig"     "ses-en-sewentig"
#' #> [5] "nul"     "-5"      "200"                 "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_spelled_num(num_vals, pattern = "{x}.")
#' ```
#' ```
#' #> [1] "one."     "eight."     "twenty-three."  "seventy-six."  "zero."
#' #> [6] "-5."      "200."       "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-12
#'
#' @section Function Introduced:
#' `v0.9.0` (Mar 31, 2023)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_spelled_num()].
#'
#' @export
vec_fmt_spelled_num <- function(
    x,
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_spelled_num(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_bytes() --------------------------------------------------------------
#' Format a vector as values in terms of bytes
#'
#' @description
#'
#' With numeric values in a vector, we can transform each into byte values with
#' human readable units. `vec_fmt_bytes()` allows for the formatting of byte
#' sizes to either of two common representations: (1) with decimal units
#' (powers of 1000, examples being `"kB"` and `"MB"`), and (2) with binary units
#' (powers of 1024, examples being `"KiB"` and `"MiB"`).
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
#' @inheritParams fmt_bytes
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a numeric vector for the next few examples:
#'
#' ```r
#' num_vals <- c(3.24294e14, 8, 1362902, -59027, NA)
#' ```
#'
#' Using `vec_fmt_bytes()` with the default options will create a character
#' vector with values in bytes. Any `NA` values remain as `NA` values. The
#' rendering context will be autodetected unless specified in the `output`
#' argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_bytes(num_vals)
#' ```
#' ```
#' #> [1] "324.3 TB" "8 B" "1.4 MB" "-59 kB" "NA"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_bytes(num_vals, decimals = 2)
#' ```
#' ```
#' #> [1] "324.29 TB" "8 B" "1.36 MB" "-59.03 kB" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_bytes(num_vals, locale = "fi")
#' ```
#' ```
#' #> [1] "324,3 TB" "8 B" "1,4 MB" "-59 kB" "NA"
#' ```
#'
#' Should you need to have positive and negative signs on each of the output
#' values, use `force_sign = TRUE`:
#'
#' ```r
#' vec_fmt_bytes(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+324.3 TB" "+8 B" "+1.4 MB" "-59 kB" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_bytes(num_vals, pattern = "[{x}]")
#' ```
#' ```
#' #> [1] "[324.3 TB]" "[8 B]" "[1.4 MB]" "[-59 kB]" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-13
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_bytes()].
#'
#' @export
vec_fmt_bytes <- function(
    x,
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
    min_sep_threshold = 1,
    incl_space = TRUE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer"))

  # Ensure that `standard` and `output` are matched correctly to one option
  standard <- rlang::arg_match0(standard, values = c("decimal", "binary"))
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_bytes(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      standard = standard,
      decimals = decimals,
      n_sigfig = n_sigfig,
      drop_trailing_zeros = drop_trailing_zeros,
      drop_trailing_dec_mark = drop_trailing_dec_mark,
      use_seps = use_seps,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      min_sep_threshold = min_sep_threshold,
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_date() ---------------------------------------------------------------
#' Format a vector as date values
#'
#' @description
#'
#' Format vector values to date values using one of 41 preset date styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
#'
#' @inheritParams fmt_date
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We need to supply a preset date style to the `date_style` argument. The date
#' styles are numerous and can handle localization to any supported locale. A
#' large segment of date styles are termed flexible date formats and this means
#' that their output will adapt to any `locale` provided. That feature makes the
#' flexible date formats a better option for locales other than `"en"` (the
#' default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can call [info_date_style()] in the console to view a similar table
#' of date styles with example output.
#'
#' @section Examples:
#'
#' Let's create a character vector of dates in the ISO-8601 format for the next
#' few examples:
#'
#' ```r
#' str_vals <- c("2022-06-13", "2019-01-25", "2015-03-23", NA)
#' ```
#'
#' Using `vec_fmt_date()` (here with the `"wday_month_day_year"` date style)
#' will result in a character vector of formatted dates. Any `NA` values remain
#' as `NA` values. The rendering context will be autodetected unless specified
#' in the `output` argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_date(str_vals, date_style = "wday_month_day_year")
#' ```
#' ```
#' #> [1] "Monday, June 13, 2022" "Friday, January 25, 2019"
#' #> [3] "Monday, March 23, 2015" NA
#' ```
#'
#' We can choose from any of 41 different date formatting styles. Many of these
#' styles are flexible, meaning that the structure of the format will adapt
#' to different locales. Let's use the `"yMMMEd"` date style to demonstrate this
#' (first in the default locale of `"en"`):
#'
#' ```r
#' vec_fmt_date(str_vals, date_style = "yMMMEd")
#' ```
#' ```
#' #> [1] "Mon, Jun 13, 2022" "Fri, Jan 25, 2019" "Mon, Mar 23, 2015" NA
#' ```
#'
#' Let's perform the same type of formatting in the French (`"fr"`) locale:
#'
#' ```r
#' vec_fmt_date(str_vals, date_style = "yMMMEd", locale = "fr")
#' ```
#' ```
#' #> [1] "lun. 13 juin 2022" "ven. 25 janv. 2019" "lun. 23 mars 2015" NA
#' ```
#'
#' We can always use [info_date_style()] to call up an info table that serves as
#' a handy reference to all of the `date_style` options.
#'
#' As a last example, one can wrap the date values in a pattern with the
#' `pattern` argument. Note here that `NA` values won't have the pattern
#' applied.
#'
#' ```r
#' vec_fmt_date(str_vals, pattern = "Date: {x}")
#' ```
#' ```
#' #> [1] "Date: 2022-06-13" "Date: 2019-01-25" "Date: 2015-03-23" NA
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-14
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_date()].
#'
#' @export
vec_fmt_date <- function(
    x,
    date_style = "iso",
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("Date", "POSIXt", "character"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_date(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      date_style = date_style,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_time() ---------------------------------------------------------------
#' Format a vector as time values
#'
#' @description
#'
#' Format vector values to time values using one of 25 preset time styles. Input
#' can be in the form of `POSIXt` (i.e., datetimes), `character` (must be in the
#' ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which
#' always results in the formatting of `00:00:00`).
#'
#' @inheritParams fmt_time
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We need to supply a preset time style to the `time_style` argument. There are
#' many time styles and all of them can handle localization to any supported
#' locale. Many of the time styles are termed flexible time formats and this
#' means that their output will adapt to any `locale` provided. That feature
#' makes the flexible time formats a better option for locales other than `"en"`
#' (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can call [info_time_style()] in the console to view a similar table of
#' time styles with example output.
#'
#' @section Examples:
#'
#' Let's create a character vector of datetime values in the ISO-8601 format
#' for the next few examples:
#'
#' ```r
#' str_vals <- c("2022-06-13 18:36", "2019-01-25 01:08", NA)
#' ```
#'
#' Using `vec_fmt_time()` (here with the `"iso-short"` time style) will result
#' in a character vector of formatted times. Any `NA` values remain as `NA`
#' values. The rendering context will be autodetected unless specified in the
#' `output` argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_time(str_vals, time_style = "iso-short")
#' ```
#' ```
#' #> [1] "18:36" "01:08" NA
#' ```
#'
#' We can choose from any of 25 different time formatting styles. Many of these
#' styles are flexible, meaning that the structure of the format will adapt
#' to different locales. Let's use the `"Bhms"` time style to demonstrate this
#' (first in the default locale of `"en"`):
#'
#' ```r
#' vec_fmt_time(str_vals, time_style = "Bhms")
#' ```
#' ```
#' #> [1] "6:36:00 in the evening" "1:08:00 at night" NA
#' ```
#'
#' Let's perform the same type of formatting in the German (`"de"`) locale:
#'
#' ```r
#' vec_fmt_time(str_vals, time_style = "Bhms", locale = "de")
#' ```
#' ```
#' #> [1] "6:36:00 abends" "1:08:00 nachts" NA
#' ```
#'
#' We can always use [info_time_style()] to call up an info table that serves as
#' a handy reference to all of the `time_style` options.
#'
#' As a last example, one can wrap the time values in a pattern with the
#' `pattern` argument. Note here that `NA` values won't have the pattern
#' applied.
#'
#' ```r
#' vec_fmt_time(
#'   str_vals,
#'   time_style = "hm",
#'   pattern = "temps: {x}",
#'   locale = "fr-CA"
#' )
#' ```
#' ```
#' #> [1] "temps: 6:36 PM" "temps: 1:08 AM" NA
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-15
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_time()].
#'
#' @export
vec_fmt_time <- function(
    x,
    time_style = "iso",
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("Date", "POSIXt", "character"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_time(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      time_style = time_style,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_datetime() -----------------------------------------------------------
#' Format a vector as datetime values
#'
#' @description
#'
#' Format values in a vector to datetime values using either presets for the
#' date and time components or a formatting directive (this can either use a
#' *CLDR* datetime pattern or `strptime` formatting). Input can be in the form
#' of `POSIXct` (i.e., datetimes), the `Date` type, or `character` (must be in
#' the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' @inheritParams fmt_datetime
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Formatting with the `date_style` argument:
#'
#' We can supply a preset date style to the `date_style` argument to separately
#' handle the date portion of the output. The date styles are numerous and can
#' handle localization to any supported locale. A large segment of date styles
#' are termed flexible date formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible date formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all date styles and their output
#' values (corresponding to an input date of `2000-02-29`).
#'
#' |    | Date Style            | Output                  | Notes         |
#' |----|-----------------------|-------------------------|---------------|
#' | 1  | `"iso"`               | `"2000-02-29"`          | ISO 8601      |
#' | 2  | `"wday_month_day_year"`| `"Tuesday, February 29, 2000"`  |      |
#' | 3  | `"wd_m_day_year"`     | `"Tue, Feb 29, 2000"`   |               |
#' | 4  | `"wday_day_month_year"`| `"Tuesday 29 February 2000"`    |      |
#' | 5  | `"month_day_year"`    | `"February 29, 2000"`   |               |
#' | 6  | `"m_day_year"`        | `"Feb 29, 2000"`        |               |
#' | 7  | `"day_m_year"`        | `"29 Feb 2000"`         |               |
#' | 8  | `"day_month_year"`    | `"29 February 2000"`    |               |
#' | 9  | `"day_month"`         | `"29 February"`         |               |
#' | 10 | `"day_m"`             | `"29 Feb"`              |               |
#' | 11 | `"year"`              | `"2000"`                |               |
#' | 12 | `"month"`             | `"February"`            |               |
#' | 13 | `"day"`               | `"29"`                  |               |
#' | 14 | `"year.mn.day"`       | `"2000/02/29"`          |               |
#' | 15 | `"y.mn.day"`          | `"00/02/29"`            |               |
#' | 16 | `"year_week"`         | `"2000-W09"`            |               |
#' | 17 | `"year_quarter"`      | `"2000-Q1"`             |               |
#' | 18 | `"yMd"`               | `"2/29/2000"`           | flexible      |
#' | 19 | `"yMEd"`              | `"Tue, 2/29/2000"`      | flexible      |
#' | 20 | `"yMMM"`              | `"Feb 2000"`            | flexible      |
#' | 21 | `"yMMMM"`             | `"February 2000"`       | flexible      |
#' | 22 | `"yMMMd"`             | `"Feb 29, 2000"`        | flexible      |
#' | 23 | `"yMMMEd"`            | `"Tue, Feb 29, 2000"`   | flexible      |
#' | 24 | `"GyMd"`              | `"2/29/2000 A"`         | flexible      |
#' | 25 | `"GyMMMd"`            | `"Feb 29, 2000 AD"`     | flexible      |
#' | 26 | `"GyMMMEd"`           | `"Tue, Feb 29, 2000 AD"`| flexible      |
#' | 27 | `"yM"`                | `"2/2000"`              | flexible      |
#' | 28 | `"Md"`                | `"2/29"`                | flexible      |
#' | 29 | `"MEd"`               | `"Tue, 2/29"`           | flexible      |
#' | 30 | `"MMMd"`              | `"Feb 29"`              | flexible      |
#' | 31 | `"MMMEd"`             | `"Tue, Feb 29"`         | flexible      |
#' | 32 | `"MMMMd"`             | `"February 29"`         | flexible      |
#' | 33 | `"GyMMM"`             | `"Feb 2000 AD"`         | flexible      |
#' | 34 | `"yQQQ"`              | `"Q1 2000"`             | flexible      |
#' | 35 | `"yQQQQ"`             | `"1st quarter 2000"`    | flexible      |
#' | 36 | `"Gy"`                | `"2000 AD"`             | flexible      |
#' | 37 | `"y"`                 | `"2000"`                | flexible      |
#' | 38 | `"M"`                 | `"2"`                   | flexible      |
#' | 39 | `"MMM"`               | `"Feb"`                 | flexible      |
#' | 40 | `"d"`                 | `"29"`                  | flexible      |
#' | 41 | `"Ed"`                | `"29 Tue"`              | flexible      |
#'
#' We can call [info_date_style()] in the console to view a similar table of
#' date styles with example output.
#'
#' @section Formatting with the `time_style` argument:
#'
#' We can supply a preset time style to the `time_style` argument to separately
#' handle the time portion of the output. There are many time styles and all of
#' them can handle localization to any supported locale. Many of the time styles
#' are termed flexible time formats and this means that their output will adapt
#' to any `locale` provided. That feature makes the flexible time formats a
#' better option for locales other than `"en"` (the default locale).
#'
#' The following table provides a listing of all time styles and their output
#' values (corresponding to an input time of `14:35:00`). It is noted which of
#' these represent 12- or 24-hour time. Some of the flexible formats (those
#' that begin with `"E"`) include the day of the week. Keep this in mind
#' when pairing such `time_style` values with a `date_style` so as to avoid
#' redundant or repeating information.
#'
#' |    | Time Style    | Output                          | Notes         |
#' |----|---------------|---------------------------------|---------------|
#' | 1  | `"iso"`       | `"14:35:00"`                    | ISO 8601, 24h |
#' | 2  | `"iso-short"` | `"14:35"`                       | ISO 8601, 24h |
#' | 3  | `"h_m_s_p"`   | `"2:35:00 PM"`                  | 12h           |
#' | 4  | `"h_m_p"`     | `"2:35 PM"`                     | 12h           |
#' | 5  | `"h_p"`       | `"2 PM"`                        | 12h           |
#' | 6  | `"Hms"`       | `"14:35:00"`                    | flexible, 24h |
#' | 7  | `"Hm"`        | `"14:35"`                       | flexible, 24h |
#' | 8  | `"H"`         | `"14"`                          | flexible, 24h |
#' | 9  | `"EHm"`       | `"Thu 14:35"`                   | flexible, 24h |
#' | 10 | `"EHms"`      | `"Thu 14:35:00"`                | flexible, 24h |
#' | 11 | `"Hmsv"`      | `"14:35:00 GMT+00:00"`          | flexible, 24h |
#' | 12 | `"Hmv"`       | `"14:35 GMT+00:00"`             | flexible, 24h |
#' | 13 | `"hms"`       | `"2:35:00 PM"`                  | flexible, 12h |
#' | 14 | `"hm"`        | `"2:35 PM"`                     | flexible, 12h |
#' | 15 | `"h"`         | `"2 PM"`                        | flexible, 12h |
#' | 16 | `"Ehm"`       | `"Thu 2:35 PM"`                 | flexible, 12h |
#' | 17 | `"Ehms"`      | `"Thu 2:35:00 PM"`              | flexible, 12h |
#' | 18 | `"EBhms"`   | `"Thu 2:35:00 in the afternoon"`  | flexible, 12h |
#' | 19 | `"Bhms"`      | `"2:35:00 in the afternoon"`    | flexible, 12h |
#' | 20 | `"EBhm"`      | `"Thu 2:35 in the afternoon"`   | flexible, 12h |
#' | 21 | `"Bhm"`       | `"2:35 in the afternoon"`       | flexible, 12h |
#' | 22 | `"Bh"`        | `"2 in the afternoon"`          | flexible, 12h |
#' | 23 | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`        | flexible, 12h |
#' | 24 | `"hmv"`       | `"2:35 PM GMT+00:00"`           | flexible, 12h |
#' | 25 | `"ms"`        | `"35:00"`                       | flexible      |
#'
#' We can call [info_time_style()] in the console to view a similar table of
#' time styles with example output.
#'
#' @section Formatting with a *CLDR* datetime pattern:
#'
#' We can use a *CLDR* datetime pattern with the `format` argument to create
#' a highly customized and locale-aware output. This is a character string that
#' consists of two types of elements:
#'
#' - Pattern fields, which repeat a specific pattern character one or more
#'   times. These fields are replaced with date and time data when formatting.
#'   The character sets of `A`-`Z` and `a`-`z` are reserved for use as pattern
#'   characters.
#' - Literal text, which is output verbatim when formatting. This can include:
#'     - Any characters outside the reserved character sets, including
#'       spaces and punctuation.
#'     - Any text between single vertical quotes (e.g., `'text'`).
#'     - Two adjacent single vertical quotes (''), which represent a literal
#'     single quote, either inside or outside quoted text.
#'
#' The number of pattern fields is quite sizable so let's first look at how some
#' *CLDR* datetime patterns work. We'll use the datetime string
#' `"2018-07-04T22:05:09.2358(America/Vancouver)"` for all of the examples that
#' follow.
#'
#' - `"mm/dd/y"` -> `"05/04/2018"`
#' - `"EEEE, MMMM d, y"` -> `"Wednesday, July 4, 2018"`
#' - `"MMM d E"` -> `"Jul 4 Wed"`
#' - `"HH:mm"` -> `"22:05"`
#' - `"h:mm a"` -> `"10:05 PM"`
#' - `"EEEE, MMMM d, y 'at' h:mm a"` -> `"Wednesday, July 4, 2018 at 10:05 PM"`
#'
#' Here are the individual pattern fields:
#'
#' ## Year
#'
#' ### Calendar Year
#'
#' This yields the calendar year, which is always numeric. In most cases the
#' length of the `"y"` field specifies the minimum number of digits to display,
#' zero-padded as necessary. More digits will be displayed if needed to show the
#' full year. There is an exception: `"yy"` gives use just the two low-order
#' digits of the year, zero-padded as necessary. For most use cases, `"y"` or
#' `"yy"` should be good enough.
#'
#' | Field Patterns                 | Output                                 |
#' |------------------------------- |----------------------------------------|
#' | `"y"`                          | `"2018"`                               |
#' | `"yy"`                         | `"18"`                                 |
#' | `"yyy"` to `"yyyyyyyyy"`       | `"2018"` to `"000002018"`              |
#'
#' ### Year in the Week in Year Calendar
#'
#' This is the year in 'Week of Year' based calendars in which the year
#' transition occurs on a week boundary. This may differ from calendar year
#' `"y"` near a year transition. This numeric year designation is used in
#' conjunction with pattern character `"w"` in the ISO year-week calendar as
#' defined by ISO 8601.
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"Y"`                          | `"2018"`                               |
#' | `"YY"`                         | `"18"`                                 |
#' | `"YYY"` to `"YYYYYYYYY"`       | `"2018"` to `"000002018"`              |
#'
#' ## Quarter
#'
#' ### Quarter of the Year: formatting and standalone versions
#'
#' The quarter names are identified numerically, starting at `1` and ending at
#' `4`. Quarter names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for quarters of the year consists of some run
#' of `"Q"` values whereas the standalone form uses `"q"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"Q"`/`"q"`       | `"3"`           | Numeric, one digit                |
#' | `"QQ"`/`"qq"`     | `"03"`          | Numeric, two digits (zero padded) |
#' | `"QQQ"`/`"qqq"`   | `"Q3"`          | Abbreviated                       |
#' | `"QQQQ"`/`"qqqq"` | `"3rd quarter"` | Wide                              |
#' | `"QQQQQ"`/`"qqqqq"` | `"3"`         | Narrow                            |
#'
#' ## Month
#'
#' ### Month: formatting and standalone versions
#'
#' The month names are identified numerically, starting at `1` and ending at
#' `12`. Month names may vary along two axes: the width and the context. The
#' context is either 'formatting' (taken as a default), which the form used
#' within a complete date format string, or, 'standalone', the form for date
#' elements used independently (such as in calendar headers). The standalone
#' form may be used in any other date format that shares the same form of the
#' name. Here, the formatting form for months consists of some run of `"M"`
#' values whereas the standalone form uses `"L"`.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"M"`/`"L"`       | `"7"`           | Numeric, minimum digits           |
#' | `"MM"`/`"LL"`     | `"07"`          | Numeric, two digits (zero padded) |
#' | `"MMM"`/`"LLL"`   | `"Jul"`         | Abbreviated                       |
#' | `"MMMM"`/`"LLLL"` | `"July"`        | Wide                              |
#' | `"MMMMM"`/`"LLLLL"` | `"J"`         | Narrow                            |
#'
#' ## Week
#'
#' ### Week of Year
#'
#' Values calculated for the week of year range from `1` to `53`. Week `1` for a
#' year is the first week that contains at least the specified minimum number of
#' days from that year. Weeks between week `1` of one year and week `1` of the
#' following year are numbered sequentially from `2` to `52` or `53` (if
#' needed).
#'
#' There are two available field lengths. Both will display the week of year
#' value but the `"ww"` width will always show two digits (where weeks `1` to
#' `9` are zero padded).
#'
#' | Field Patterns   | Output    | Notes                                    |
#' |------------------|-----------|------------------------------------------|
#' | `"w"`            | `"27"`    | Minimum digits                           |
#' | `"ww"`           | `"27"`    | Two digits (zero padded)                 |
#'
#' ### Week of Month
#'
#' The week of a month can range from `1` to `5`. The first day of every month
#' always begins at week `1` and with every transition into the beginning of a
#' week, the week of month value is incremented by `1`.
#'
#' | Field Pattern    | Output                                               |
#' |------------------|------------------------------------------------------|
#' | `"W"`            | `"1"`                                                |
#'
#' ## Day
#'
#' ### Day of Month
#'
#' The day of month value is always numeric and there are two available field
#' length choices in its formatting. Both will display the day of month value
#' but the `"dd"` formatting will always show two digits (where days `1` to `9`
#' are zero padded).
#'
#' | Field Patterns | Output    | Notes                                      |
#' |----------------|-----------|--------------------------------------------|
#' | `"d"`          | `"4"`     | Minimum digits                             |
#' | `"dd"`         | `"04"`    | Two digits, zero padded                    |
#'
#' ### Day of Year
#'
#' The day of year value ranges from `1` (January 1) to either `365` or `366`
#' (December 31), where the higher value of the range indicates that the year is
#' a leap year (29 days in February, instead of 28). The field length specifies
#' the minimum number of digits, with zero-padding as necessary.
#'
#' | Field Patterns  | Output   | Notes                                      |
#' |-----------------|----------|--------------------------------------------|
#' | `"D"`           | `"185"`  |                                            |
#' | `"DD"`          | `"185"`  | Zero padded to minimum width of 2          |
#' | `"DDD"`         | `"185"`  | Zero padded to minimum width of 3          |
#'
#' ### Day of Week in Month
#'
#' The day of week in month returns a numerical value indicating the number of
#' times a given weekday had occurred in the month (e.g., '2nd Monday in
#' March'). This conveniently resolves to predicable case structure where ranges
#' of day of the month values return predictable day of week in month values:
#'
#' - days `1` - `7` -> `1`
#' - days `8` - `14` -> `2`
#' - days `15` - `21` -> `3`
#' - days `22` - `28` -> `4`
#' - days `29` - `31` -> `5`
#'
#' | Field Pattern                  | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"F"`                          | `"1"`                                  |
#'
#' ### Modified Julian Date
#'
#' The modified version of the Julian date is obtained by subtracting
#' 2,400,000.5 days from the Julian date (the number of days since January 1,
#' 4713 BC). This essentially results in the number of days since midnight
#' November 17, 1858. There is a half day offset (unlike the Julian date, the
#' modified Julian date is referenced to midnight instead of noon).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"g"` to `"ggggggggg"`         | `"58303"` -> `"000058303"`             |
#'
#' ## Weekday
#'
#' ### Day of Week Name
#'
#' The name of the day of week is offered in four different widths.
#'
#' | Field Patterns             | Output         | Notes                     |
#' |----------------------------|----------------|---------------------------|
#' | `"E"`, `"EE"`, or `"EEE"`  | `"Wed"`        | Abbreviated               |
#' | `"EEEE"`                   | `"Wednesday"`  | Wide                      |
#' | `"EEEEE"`                  | `"W"`          | Narrow                    |
#' | `"EEEEEE"`                 | `"We"`         | Short                     |
#'
#' ## Periods
#'
#' ### AM/PM Period of Day
#'
#' This denotes before noon and after noon time periods. May be upper or
#' lowercase depending on the locale and other options. The wide form may be
#' the same as the short form if the 'real' long form (e.g. 'ante meridiem') is
#' not customarily used. The narrow form must be unique, unlike some other
#' fields.
#'
#' | Field Patterns                 | Output   | Notes                       |
#' |--------------------------------|----------|-----------------------------|
#' | `"a"`, `"aa"`, or `"aaa"`      | `"PM"`   | Abbreviated                 |
#' | `"aaaa"`                       | `"PM"`   | Wide                        |
#' | `"aaaaa"`                      | `"p"`    | Narrow                      |
#'
#' ### AM/PM Period of Day Plus Noon and Midnight
#'
#' Provide AM and PM as well as phrases for exactly noon and midnight. May be
#' upper or lowercase depending on the locale and other options. If the locale
#' doesn't have the notion of a unique 'noon' (i.e., 12:00), then the PM form
#' may be substituted. A similar behavior can occur for 'midnight' (00:00) and
#' the AM form. The narrow form must be unique, unlike some other fields.
#'
#' (a) `input_midnight`: `"2020-05-05T00:00:00"`
#' (b) `input_noon`: `"2020-05-05T12:00:00"`
#'
#' | Field Patterns                 | Output             | Notes             |
#' |--------------------------------|--------------------|-------------------|
#' | `"b"`, `"bb"`, or `"bbb"`      | (a) `"midnight"`   | Abbreviated       |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbb"`                       | (a) `"midnight"`   | Wide              |
#' |                                | (b) `"noon"`       |                   |
#' | `"bbbbb"`                      | (a) `"mi"`         | Narrow            |
#' |                                | (b) `"n"`          |                   |
#'
#' ### Flexible Day Periods
#'
#' Flexible day periods denotes things like 'in the afternoon', 'in the
#' evening', etc., and the flexibility comes from a locale's language and
#' script. Each locale has an associated rule set that specifies when the day
#' periods start and end for that locale.
#'
#' (a) `input_morning`: `"2020-05-05T00:08:30"`
#' (b) `input_afternoon`: `"2020-05-05T14:00:00"`
#'
#' | Field Patterns             | Output                   | Notes           |
#' |----------------------------|--------------------------|-----------------|
#' | `"B"`, `"BB"`, or `"BBB"`  | (a) `"in the morning"`   | Abbreviated     |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBB"`                   | (a) `"in the morning"`   | Wide            |
#' |                            | (b) `"in the afternoon"` |                 |
#' | `"BBBBB"`                  | (a) `"in the morning"`   | Narrow          |
#' |                            | (b) `"in the afternoon"` |                 |
#'
#' ## Hours, Minutes, and Seconds
#'
#' ### Hour 0-23
#'
#' Hours from `0` to `23` are for a standard 24-hour clock cycle (midnight plus
#' 1 minute is `00:01`) when using `"HH"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"H"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"HH"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-12
#'
#' Hours from `1` to `12` are for a standard 12-hour clock cycle (midnight plus
#' 1 minute is `12:01`) when using `"hh"` (which is the more common width that
#' indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"h"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"hh"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-24
#'
#' Using hours from `1` to `24` is a less common way to express a 24-hour clock
#' cycle (midnight plus 1 minute is `24:01`) when using `"kk"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"k"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"kk"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 0-11
#'
#' Using hours from `0` to `11` is a less common way to express a 12-hour clock
#' cycle (midnight plus 1 minute is `00:01`) when using `"KK"` (which is the
#' more common width that indicates zero-padding to 2 digits).
#'
#' Using `"2015-08-01T08:35:09"`:
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"K"`                  | `"7"`   | Numeric, minimum digits              |
#' | `"KK"`                 | `"07"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Minute
#'
#' The minute of the hour which can be any number from `0` to `59`. Use `"m"` to
#' show the minimum number of digits, or `"mm"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"m"`                  | `"5"`   | Numeric, minimum digits              |
#' | `"mm"`                 | `"06"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Seconds
#'
#' The second of the minute which can be any number from `0` to `59`. Use `"s"`
#' to show the minimum number of digits, or `"ss"` to always show two digits
#' (zero-padding, if necessary).
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"s"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"ss"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Fractional Second
#'
#' The fractional second truncates (like other time fields) to the width
#' requested (i.e., count of letters). So using pattern `"SSSS"` will display
#' four digits past the decimal (which, incidentally, needs to be added manually
#' to the pattern).
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"S"` to `"SSSSSSSSS"`         | `"2"` -> `"235000000"`                 |
#'
#' ### Milliseconds Elapsed in Day
#'
#' There are 86,400,000 milliseconds in a day and the `"A"` pattern will provide
#' the whole number. The width can go up to nine digits with `"AAAAAAAAA"` and
#' these higher field widths will result in zero padding if necessary.
#'
#' Using `"2011-07-27T00:07:19.7223"`:
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"A"` to `"AAAAAAAAA"`         | `"439722"` -> `"000439722"`            |
#'
#' ## Era
#'
#' ### The Era Designator
#'
#' This provides the era name for the given date. The Gregorian calendar has two
#' eras: AD and BC. In the AD year numbering system, AD 1 is immediately
#' preceded by 1 BC, with nothing in between them (there was no year zero).
#'
#' | Field Patterns                 | Output          | Notes                |
#' |--------------------------------|-----------------|----------------------|
#' | `"G"`, `"GG"`, or `"GGG"`      | `"AD"`          | Abbreviated          |
#' | `"GGGG"`                       | `"Anno Domini"` | Wide                 |
#' | `"GGGGG"`                      | `"A"`           | Narrow               |
#'
#' ## Time Zones
#'
#' ### TZ // Short and Long Specific non-Location Format
#'
#' The short and long specific non-location formats for time zones are suggested
#' for displaying a time with a user friendly time zone name. Where the short
#' specific format is unavailable, it will fall back to the short localized GMT
#' format (`"O"`). Where the long specific format is unavailable, it will fall
#' back to the long localized GMT format (`"OOOO"`).
#'
#' | Field Patterns             | Output                    | Notes          |
#' |----------------------------|---------------------------|----------------|
#' | `"z"`, `"zz"`, or `"zzz"`  | `"PDT"`                   | Short Specific |
#' | `"zzzz"`                   | `"Pacific Daylight Time"` | Long Specific  |
#'
#' ### TZ // Common UTC Offset Formats
#'
#' The ISO8601 basic format with hours, minutes and optional seconds fields is
#' represented by `"Z"`, `"ZZ"`, or `"ZZZ"`. The format is equivalent to RFC 822
#' zone format (when the optional seconds field is absent). This is equivalent
#' to the `"xxxx"` specifier. The field pattern `"ZZZZ"` represents the long
#' localized GMT format. This is equivalent to the `"OOOO"` specifier. Finally,
#' `"ZZZZZ"` pattern yields the ISO8601 extended format with hours, minutes and
#' optional seconds fields. The ISO8601 UTC indicator `Z` is used when local
#' time offset is `0`. This is equivalent to the `"XXXXX"` specifier.
#'
#' | Field Patterns             | Output       | Notes                       |
#' |----------------------------|--------------|-----------------------------|
#' | `"Z"`, `"ZZ"`, or `"ZZZ"`  | `"-0700"`    | ISO 8601 basic format       |
#' | `"ZZZZ"`                   | `"GMT-7:00"` | Long localized GMT format   |
#' | `"ZZZZZ"`                  | `"-07:00"`   | ISO 8601 extended format    |
#'
#' ### TZ // Short and Long Localized GMT Formats
#'
#' The localized GMT formats come in two widths `"O"` (which removes the minutes
#' field if it's `0`) and `"OOOO"` (which always contains the minutes field).
#' The use of the `GMT` indicator changes according to the locale.
#'
#' | Field Patterns          | Output        | Notes                         |
#' |-------------------------|---------------|-------------------------------|
#' | `"O"`                   | `"GMT-7"`     | Short localized GMT format    |
#' | `"OOOO"`                | `"GMT-07:00"` | Long localized GMT format     |
#'
#' ### TZ // Short and Long Generic non-Location Formats
#'
#' The generic non-location formats are useful for displaying a recurring wall
#' time (e.g., events, meetings) or anywhere people do not want to be overly
#' specific. Where either of these is unavailable, there is a fallback to the
#' generic location format (`"VVVV"`), then the short localized GMT format as
#' the final fallback.
#'
#' | Field Patterns  | Output           | Notes                              |
#' |-----------------|------------------|------------------------------------|
#' | `"v"`           | `"PT"`           | Short generic non-location format  |
#' | `"vvvv"`        | `"Pacific Time"` | Long generic non-location format   |
#'
#' ### TZ // Short Time Zone IDs and Exemplar City Formats
#'
#' These formats provide variations of the time zone ID and often include the
#' exemplar city. The widest of these formats, `"VVVV"`, is useful for
#' populating a choice list for time zones, because it supports 1-to-1 name/zone
#' ID mapping and is more uniform than other text formats.
#'
#' | Field Patterns     | Output                | Notes                      |
#' |--------------------|-----------------------|----------------------------|
#' | `"V"`              | `"cavan"`             | Short time zone ID         |
#' | `"VV"`             | `"America/Vancouver"` | Long time zone ID          |
#' | `"VVV"`            | `"Vancouver"`         | The tz exemplar city       |
#' | `"VVVV"`           | `"Vancouver Time"`    | Generic location format    |
#'
#' ### TZ // ISO 8601 Formats with Z for +0000
#'
#' The `"X"`-`"XXX"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. The final two widths, `"XXXX"` and `"XXXXX"` allow
#' for optional seconds fields. The seconds field is *not* supported by the ISO
#' 8601 specification. For all of these, the ISO 8601 UTC indicator `Z` is used
#' when the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"X"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"XX"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"XXX"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"XXXX"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"XXXXX"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' ### TZ // ISO 8601 Formats (no use of Z for +0000)
#'
#' The `"x"`-`"xxxxx"` field patterns represent valid ISO 8601 patterns for time
#' zone offsets in datetimes. They are similar to the `"X"`-`"XXXXX"` field
#' patterns except that the ISO 8601 UTC indicator `Z` *will not* be used when
#' the local time offset is `0`.
#'
#' | Field Patterns | Output     | Notes                                     |
#' |----------------|------------|-------------------------------------------|
#' | `"x"`          | `"-07"`    | ISO 8601 basic format (h, optional m)     |
#' | `"xx"`         | `"-0700"`  | ISO 8601 basic format (h & m)             |
#' | `"xxx"`        | `"-07:00"` | ISO 8601 extended format (h & m)          |
#' | `"xxxx"`       | `"-0700"`  | ISO 8601 basic format (h & m, optional s) |
#' | `"xxxxx"`      | `"-07:00"` | ISO 8601 extended format (h & m, optional s) |
#'
#' @section Formatting with a `strptime` format code:
#'
#' Performing custom date/time formatting with the `format` argument can also
#' occur with a `strptime` format code. This works by constructing a string of
#' individual format codes representing formatted date and time elements. These
#' are all indicated with a leading `%`, literal characters are interpreted as
#' any characters not starting with a `%` character.
#'
#' First off, let's look at a few format code combinations that work well
#' together as a `strptime` format. This will give us an intuition on how these
#' generally work. We'll use the datetime `"2015-06-08 23:05:37.48"` for all of
#' the examples that follow.
#'
#' - `"%m/%d/%Y"` -> `"06/08/2015"`
#' - `"%A, %B %e, %Y"` -> `"Monday, June 8, 2015"`
#' - `"%b %e %a"` -> `"Jun 8 Mon"`
#' - `"%H:%M"` -> `"23:05"`
#' - `"%I:%M %p"` -> `"11:05 pm"`
#' - `"%A, %B %e, %Y at %I:%M %p"` -> `"Monday, June 8, 2015 at 11:05 pm"`
#'
#' Here are the individual format codes for the date components:
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
#' - `"%j"` -> `"159"` (day of the year, always zero-padded)
#' - `"%W"` -> `"23"` (week number for the year, always zero-padded)
#' - `"%V"` -> `"24"` (week number for the year, following the ISO 8601
#' standard)
#' - `"%C"` -> `"20"` (the century number)
#'
#' Here are the individual format codes for the time components:
#'
#' - `"%H"` -> `"23"` (24h hour)
#' - `"%I"` -> `"11"` (12h hour)
#' - `"%M"` -> `"05"` (minute)
#' - `"%S"` -> `"37"` (second)
#' - `"%OS3"` -> `"37.480"` (seconds with decimals; `3` decimal places here)
#' - `%p` -> `"pm"` (AM or PM indicator)
#'
#' Here are some extra formats that you may find useful:
#'
#' - `"%z"` -> `"+0000"` (signed time zone offset, here using UTC)
#' - `"%F"` -> `"2015-06-08"` (the date in the ISO 8601 date format)
#' - `"%%"` -> `"%"` (the literal "`%`" character, in case you need it)
#'
#' @section Examples:
#'
#' Let's create a character vector of datetime values in the ISO-8601 format
#' for the next few examples:
#'
#' ```r
#' str_vals <- c("2022-06-13 18:36", "2019-01-25 01:08", NA)
#' ```
#'
#' Using `vec_fmt_datetime()` with different `date_style` and `time_style`
#' options (here, `date_style = "yMMMEd"` and `time_style = "Hm"`) will result
#' in a character vector of formatted datetime values. Any `NA` values remain as
#' `NA` values. The rendering context will be autodetected unless specified in
#' the `output` argument (here, it is of the `"plain"` output type).
#'
#' ```r
#' vec_fmt_datetime(
#'   str_vals,
#'   date_style = "yMMMEd",
#'   time_style = "Hm"
#' )
#' ```
#' ```
#' #> [1] "Mon, Jun 13, 2022 18:36" "Fri, Jan 25, 2019 01:08" NA
#' ```
#'
#' We can choose from any of 41 different date styles and 25 time formatting
#' styles. Many of these styles are flexible, meaning that the structure of the
#' format will adapt to different locales. Let's use a combination of the
#' `"yMMMd"` and `"hms"` date and time styles to demonstrate this (first in the
#' default locale of `"en"`):
#'
#' ```r
#' vec_fmt_datetime(
#'   str_vals,
#'   date_style = "yMMMd",
#'   time_style = "hms"
#' )
#' ```
#' ```
#' #> [1] "Jun 13, 2022 6:36:00 PM" "Jan 25, 2019 1:08:00 AM" NA
#' ```
#'
#' Let's perform the same type of formatting in the Italian (`"it"`) locale:
#'
#' ```r
#' vec_fmt_datetime(
#'   str_vals,
#'   date_style = "yMMMd",
#'   time_style = "hms",
#'   locale = "it"
#' )
#' ```
#' ```
#' #> [1] "13 giu 2022 6:36:00 PM" "25 gen 2019 1:08:00 AM" NA
#' ```
#'
#' We can always use [info_date_style()] or [info_time_style()] to call up info
#' tables that serve as handy references to all of the `date_style` and
#' `time_style` options.
#'
#' It's possible to supply our own time formatting pattern within the `format`
#' argument. One way is with a CLDR pattern, which is locale-aware:
#'
#' ```r
#' vec_fmt_datetime(str_vals, format = "EEEE, MMMM d, y, h:mm a")
#' ```
#' ```
#' #> [1] "Monday, June 13, 2022, 06:36 PM"
#' #> [2] "Friday, January 25, 2019, 01:08 AM"
#' #> [3] NA
#' ```
#'
#' By using the `locale` argument, this can be formatted as Dutch datetime
#' values:
#'
#' ```r
#' vec_fmt_datetime(
#'   str_vals,
#'   format = "EEEE, MMMM d, y, h:mm a",
#'   locale = "nl"
#' )
#' ```
#' ```
#' #> [1] "maandag, juni 13, 2022, 6:36 p.m."
#' #> [2] "vrijdag, januari 25, 2019, 1:08 a.m."
#' #> [3] NA
#' ```
#'
#' It's also possible to use a `strptime` format code with `format` (however,
#' any value provided to `locale` will be ignored).
#'
#' ```r
#' vec_fmt_datetime(str_vals, format = "%A, %B %e, %Y at %I:%M %p")
#' ```
#' ```
#' #> [1] "Monday, June 13, 2022 at 06:36 pm"
#' #> [2] "Friday, January 25, 2019 at 01:08 am"
#' #> [3] NA
#' ```
#'
#' As a last example, one can wrap the datetime values in a pattern with the
#' `pattern` argument. Note here that `NA` values won't have the pattern
#' applied.
#'
#' ```r
#' vec_fmt_datetime(
#'   str_vals,
#'   sep = " at ",
#'   pattern = "Date and Time: {x}"
#' )
#' ```
#' ```
#' #> [1] "Date and Time: 2022-06-13 at 18:36:00"
#' #> [2] "Date and Time: 2019-01-25 at 01:08:00"
#' #> [3] NA
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-16
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_datetime()].
#'
#' @export
vec_fmt_datetime <- function(
    x,
    date_style = "iso",
    time_style = "iso",
    sep = " ",
    format = NULL,
    tz = NULL,
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("Date", "POSIXct", "character"))

  # Ensure that `output` is matched correctly to one option
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_datetime(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      date_style = date_style,
      time_style = time_style,
      sep = sep,
      format = format,
      tz = tz,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_duration() -----------------------------------------------------------
#' Format a vector of numeric or duration values as styled time duration strings
#'
#' @description
#'
#' Format input values to time duration values whether those input values are
#' numbers or of the `difftime` class. We can specify which time units any
#' numeric input values have (as weeks, days, hours, minutes, or seconds) and
#' the output can be customized with a duration style (corresponding to narrow,
#' wide, colon-separated, and ISO forms) and a choice of output units ranging
#' from weeks to seconds.
#'
#' @section Output units for the colon-separated duration style:
#'
#' The colon-separated duration style (enabled when
#' `duration_style = "colon-sep"`) is essentially a clock-based output format
#' which uses the display logic of chronograph watch functionality. It will, by
#' default, display duration values in the `(D/)HH:MM:SS` format. Any duration
#' values greater than or equal to 24 hours will have the number of days
#' prepended with an adjoining slash mark. While this output format is
#' versatile, it can be changed somewhat with the `output_units` option. The
#' following combinations of output units are permitted:
#'
#' - `c("minutes", "seconds")` -> `MM:SS`
#' - `c("hours", "minutes")` -> `HH:MM`
#' - `c("hours", "minutes", "seconds")` -> `HH:MM:SS`
#' - `c("days", "hours", "minutes")` -> `(D/)HH:MM`
#'
#' Any other specialized combinations will result in the default set being used,
#' which is `c("days", "hours", "minutes", "seconds")`
#'
#' @inheritParams fmt_duration
#'
#' @inheritParams vec_fmt_number
#'
#' @param locale *Locale identifier*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   An optional locale identifier that can be used for formatting values
#'   according to the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). We can call [info_locales()] for a
#'   useful reference for all of the locales that are supported.
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Let's create a `difftime`-based vector for the next few examples:
#'
#' ```r
#' difftimes <-
#'   difftime(
#'     lubridate::ymd("2017-01-15"),
#'     lubridate::ymd(c("2015-06-25", "2016-03-07", "2017-01-10"))
#'   )
#' ```
#'
#' Using `vec_fmt_duration()` with its defaults provides us with a succinct
#' vector of formatted durations.
#'
#' ```r
#' vec_fmt_duration(difftimes)
#' ```
#' ```
#' #> [1] "81w 3d" "44w 6d" "5d"
#' ```
#'
#' We can elect to use just only the time units of days to describe the duration
#' values.
#'
#' ```r
#' vec_fmt_duration(difftimes, output_units = "days")
#' ```
#' ```
#' #> [1] "570d" "314d" "5d"
#' ```
#'
#' We can also use numeric values in the input vector `vec_fmt_duration()`.
#' Here's a numeric vector for use with examples:
#'
#' ```r
#' num_vals <- c(3.235, 0.23, 0.005, NA)
#' ```
#'
#' The necessary thing with numeric values as an input is defining what time
#' unit those values have.
#'
#' ```r
#' vec_fmt_duration(num_vals, input_units = "days")
#' ```
#' ```
#' #> [1] "3d 5h 38m 24s" "5h 31m 12s" "7m 12s" "NA"
#' ```
#'
#' We can define a set of output time units that we want to see.
#'
#' ```r
#' vec_fmt_duration(
#'   num_vals,
#'   input_units = "days",
#'   output_units = c("hours", "minutes")
#' )
#' ```
#' ```
#' #> [1] "77h 38m" "5h 31m" "7m" "NA"
#' ```
#'
#' There are many duration 'styles' to choose from. We could opt for the
#' `"wide"` style.
#'
#' ```r
#' vec_fmt_duration(
#'   num_vals,
#'   input_units = "days",
#'   duration_style = "wide"
#' )
#' ```
#' ```
#' #> [1] "3 days 5 hours 38 minutes 24 seconds"
#' #> [2] "5 hours 31 minutes 12 seconds"
#' #> [3] "7 minutes 12 seconds"
#' #> [4] "NA"
#' ```
#'
#' We can always perform locale-specific formatting with `vec_fmt_duration()`.
#' Let's attempt the same type of duration formatting as before with the `"nl"`
#' locale.
#'
#' ```r
#' vec_fmt_duration(
#'   num_vals,
#'   input_units = "days",
#'   duration_style = "wide",
#'   locale = "nl"
#' )
#' ```
#' ```
#' #> [1] "3 dagen 5 uur 38 minuten 24 seconden"
#' #> [2] "5 uur 31 minuten 12 seconden"
#' #> [3] "7 minuten 12 seconden"
#' #> [4] "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-17
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_duration()].
#'
#' @export
vec_fmt_duration <- function(
    x,
    input_units = NULL,
    output_units = NULL,
    duration_style = c("narrow", "wide", "colon-sep", "iso"),
    trim_zero_units = TRUE,
    max_output_units = NULL,
    pattern = "{x}",
    use_seps = TRUE,
    sep_mark = ",",
    force_sign = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Stop function if class of `x` is incompatible with the formatting
  check_vector_valid(x, valid_classes = c("numeric", "integer", "difftime"))

  # Ensure that `duration_style` and `output` are matched correctly to one option
  duration_style <-
    rlang::arg_match0(
      duration_style,
      values = c("narrow", "wide", "colon-sep", "iso")
    )
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }

  render_as_vector(
    fmt_duration(
      gt_one_col(x),
      columns = "x",
      rows = everything(),
      input_units = input_units,
      output_units = output_units,
      duration_style = duration_style,
      trim_zero_units = trim_zero_units,
      max_output_units = max_output_units,
      pattern = pattern,
      use_seps = use_seps,
      sep_mark = sep_mark,
      force_sign = force_sign,
      locale = locale
    ),
    output = output
  )
}

# vec_fmt_markdown() -----------------------------------------------------------
#' Format a vector containing Markdown text
#'
#' @description
#'
#' Any Markdown-formatted text in the input vector will be transformed to the
#' appropriate output type.
#'
#' @inheritParams fmt_markdown
#'
#' @inheritParams vec_fmt_number
#'
#' @return A character vector.
#'
#' @section Examples:
#'
#' Create a vector of Markdown-based text snippets.
#'
#' ```{r}
#' text_vec <-
#'   c(
#'     "This **is** *Markdown*.",
#'     "Info on Markdown syntax can be found
#' [here](https://daringfireball.net/projects/markdown/).",
#'     "The **gt** package has these datasets:
#' - `countrypops`
#' - `sza`
#' - `gtcars`
#' - `sp500`
#' - `pizzaplace`
#' - `exibble`"
#'   )
#' ```
#'
#' With `vec_fmt_markdown()` we can easily convert these to different output types,
#' like HTML
#'
#' ```{r}
#' vec_fmt_markdown(text_vec, output = "html")
#' ```
#'
#' or LaTeX
#'
#' ```{r}
#' vec_fmt_markdown(text_vec, output = "latex")
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 15-18
#'
#' @section Function Introduced:
#' `v0.7.0` (Aug 25, 2022)
#'
#' @seealso The variant function intended for formatting **gt** table data:
#'   [fmt_markdown()].
#'
#' @export
vec_fmt_markdown <- function(
    x,
    md_engine = c("markdown", "commonmark"),
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Check that `x` is a vector with rlang::is_vector
  check_vector_valid(x)

  # Ensure that arguments are matched
  md_engine <-
    rlang::arg_match0(
      md_engine,
      values = c("markdown", "commonmark")
    )
  output <- rlang::arg_match0(output, values = output_types)

  if (output == "auto") {
    output <- determine_output_format()
  }
  # Avoid modifying the output to base64enc in Quarto
  if (check_quarto() && output == "html") {
    # Similar to withr::local_envvar
    current_envvar <- Sys.getenv("QUARTO_BIN_PATH")
    Sys.unsetenv("QUARTO_BIN_PATH")
    on.exit(
      Sys.setenv(QUARTO_BIN_PATH = current_envvar),
      add = TRUE,
      after = TRUE
    )
  }
  vec_fmt_out <-
    render_as_vector(
      fmt_markdown(
        gt_one_col(x),
        columns = "x",
        rows = everything(),
        md_engine = md_engine
      ),
      output = output
    )

  if (output == "html") {
    vec_fmt_out <- gsub("^<span class='gt_from_md'>(.*)", "\\1", vec_fmt_out)
    vec_fmt_out <- gsub("(.*)\n</span>", "\\1", vec_fmt_out)
  }

  vec_fmt_out
}

gt_one_col <- function(x) {
  gt(vctrs::data_frame(x = x), auto_align = FALSE, process_md = FALSE, groupname_col = NULL)
}

# Similar as `stop_if_not_vector()` if `valid_classes` is not supplied.
check_vector_valid <- function(x, valid_classes = NULL, call = rlang::caller_env()) {
  is_vec <- rlang::is_vector(x)

  if (!is_vec || !(is.null(valid_classes) || inherits(x, valid_classes))) {
    cli::cli_abort(
      "{.arg x} must be {.or {valid_classes}} vectors, not {.obj_type_friendly {x}}.",
      call = call
    )
  }

  invisible()
}

# In the case where strict mode is being used
# (options("gt.strict_column_fmt" = TRUE)), stop the function if any of the
# resolved columns have data that is incompatible with the formatter
check_columns_valid_if_strict <- function(
    data,
    columns,
    valid_classes,
    extra_msg = NULL,
    call = rlang::caller_env()
) {

  # Don't check if strict mode is not enabled
  # strict mode is opt-in, not the default
  if (!isTRUE(getOption("gt.strict_column_fmt", FALSE))) {
    return()
  }

  all_valid <- column_classes_are_valid(
    data = data,
    columns = {{ columns }},
    valid_classes = valid_classes,
    call = call
  )
  if (all_valid) {
    return()
  }

  if (!all_valid) {
    cli::cli_abort(c(
      "{.arg columns} must be {.or {valid_classes}} data.",
      extra_msg
    ), call = call)
  }
}

render_as_vector <- function(data, output) {
  dt_body_get(build_data_body(data, context = output))[["x"]]
}

determine_output_format <- function() {

  # In an interactive context where the context is to be automatically
  # determined, always generate plain output
  if (rlang::is_interactive()) {
    return("plain")
  }

  # Check whether knitr is in the package library and stop function
  # only if it is not present
  rlang::check_installed("knitr", "to automatically detect the output context with `output = \"auto\".")

  if (knitr_is_rtf_output()) {
    return("rtf")
  } else if (knitr::is_latex_output()) {
    return("latex")
  } else if (knitr_is_word_output()) {
    return("word")
  }
  "html"
}
