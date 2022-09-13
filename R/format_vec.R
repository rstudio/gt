#' Format a vector as numeric values
#'
#' @description
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
#' @param x A numeric vector.
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
#' @param dec_mark The character to use as a decimal mark (e.g., using
#'   `dec_mark = ","` with `0.152` would result in a formatted value of
#'   `0,152`).
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign. This option is disregarded when using accounting
#'   notation with `accounting = TRUE`.
#' @param locale An optional locale ID that can be used for formatting the value
#'   according the locale's rules. Examples include `"en"` for English (United
#'   States) and `"fr"` for French (France). The use of a valid locale ID will
#'   override any values provided in `sep_mark` and `dec_mark`. We can use the
#'   [info_locales()] function as a useful reference for all of the locales that
#'   are supported.
#' @param output The output style of the resulting character vector. This can
#'   either be `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`,
#'   or `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the
#'   `"auto"` option will choose the correct `output` value
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
#' 14-1
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
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_number()` and `vec_fmt_integer()` functions can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_number(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as integer values
#'
#' @description
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
#' @inheritParams vec_fmt_number
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
#' 14-2
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
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

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
    locale = locale,
    output = output
  )
}

#' Format a vector as values in scientific notation
#'
#' @description
#' With numeric values in a vector, we can perform formatting so that the input
#' values are rendered into scientific notation within the output character
#' vector. The following major options are available:
#'
#' - decimals: choice of the number of decimal places, option to drop
#' trailing zeros, and a choice of the decimal symbol
#' - scaling: we can choose to scale targeted values by a multiplier value
#' - pattern: option to use a text pattern for decoration of the formatted
#' values
#' - locale-based formatting: providing a locale ID will result in
#' formatting specific to the chosen locale
#'
#' @inheritParams vec_fmt_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
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
#' #> [1] "3.24 × 10^-4" "8.65" "1.36 × 10^6" "-5.90 × 10^4" "NA"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_scientific(num_vals, decimals = 1)
#' ```
#' ```
#' #> [1] "3.2 × 10^-4" "8.7" "1.4 × 10^6" "-5.9 × 10^4" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_scientific(num_vals, locale = "es")
#' ```
#' ```
#' #> [1] "3,24 × 10^-4" "8,65" "1,36 × 10^6" "-5,90 × 10^4" "NA"
#' ```
#'
#' Should you need to have positive and negative signs on each of the output
#' values, use `force_sign = TRUE`:
#'
#' ```r
#' vec_fmt_scientific(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+3.24 × 10^-4" "+8.65" "+1.36 × 10^6" "-5.90 × 10^4" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_scientific(num_vals, pattern = "[{x}]")
#' ```
#' ```
#' #> [1] "[3.24 × 10^-4]" "[8.65]" "[1.36 × 10^6]" "[-5.90 × 10^4]" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 14-3
#'
#' @export
vec_fmt_scientific <- function(
    x,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    scale_by = 1.0,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_scientific()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_scientific(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      scale_by = scale_by,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as values in engineering notation
#'
#' @description
#' With numeric values in a vector, we can perform formatting so that the input
#' values are rendered into engineering notation within the output character
#' vector. The following major options are available:
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
#' @inheritParams vec_fmt_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
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
#' #> [1] "324.00 × 10^-6" "8.65" "1.36 × 10^6" "-59.03 × 10^3" "NA"
#' ```
#'
#' We can change the number of decimal places with the `decimals` option:
#'
#' ```r
#' vec_fmt_engineering(num_vals, decimals = 1)
#' ```
#' ```
#' #> [1] "324.0 × 10^-6" "8.7" "1.4 × 10^6" "-59.0 × 10^3" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and **gt** will handle any locale-specific formatting options:
#'
#' ```r
#' vec_fmt_engineering(num_vals, locale = "da")
#' ```
#' ```
#' #> [1] "324,00 × 10^-6" "8,65" "1,36 × 10^6" "-59,03 × 10^3" "NA"
#' ```
#'
#' Should you need to have positive and negative signs on each of the output
#' values, use `force_sign = TRUE`:
#'
#' ```r
#' vec_fmt_engineering(num_vals, force_sign = TRUE)
#' ```
#' ```
#' #> [1] "+324.00 × 10^-6" "+8.65" "+1.36 × 10^6" "-59.03 × 10^3" "NA"
#' ```
#'
#' As a last example, one can wrap the values in a pattern with the `pattern`
#' argument. Note here that `NA` values won't have the pattern applied.
#'
#' ```r
#' vec_fmt_engineering(num_vals, pattern = "/{x}/")
#' ```
#' ```
#' #> [1] "/324.00 × 10^-6/" "/8.65/" "/1.36 × 10^6/" "/-59.03 × 10^3/" "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 14-4
#'
#' @export
vec_fmt_engineering <- function(
    x,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    scale_by = 1.0,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_engineering()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_engineering(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      decimals = decimals,
      drop_trailing_zeros = drop_trailing_zeros,
      scale_by = scale_by,
      pattern = pattern,
      sep_mark = sep_mark,
      dec_mark = dec_mark,
      force_sign = force_sign,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as percentage values
#'
#' @description
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
#' @inheritParams vec_fmt_number
#' @param scale_values Should the values be scaled through multiplication by
#'   100? By default this is `TRUE` since the expectation is that normally
#'   values are proportions. Setting to `FALSE` signifies that the values are
#'   already scaled and require only the percent sign when formatted.
#' @param incl_space An option for whether to include a space between the value
#'   and the percent sign. The default is to not introduce a space character.
#' @param placement The placement of the percent sign. This can be either be
#'   `right` (the default) or `left`.
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
#' 14-5
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
    incl_space = FALSE,
    placement = "right",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_percent()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_percent(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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
      incl_space = incl_space,
      placement = placement,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as parts-per quantities
#'
#' @description
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
#' @inheritParams vec_fmt_number
#' @param to_units A keyword that signifies the desired output quantity. This
#'   can be any from the following set: `"per-mille"`, `"per-myriad"`, `"pcm"`,
#'   `"ppm"`, `"ppb"`, `"ppt"`, or `"ppq"`.
#' @param symbol The symbol/units to use for the quantity. By default, this is
#'   set to `"auto"` and **gt** will choose the appropriate symbol based on the
#'   `to_units` keyword and the output context. However, this can be changed by
#'   supplying a string (e.g, using `symbol = "ppbV"` when `to_units = "ppb"`).
#' @param scale_values Should the values be scaled through multiplication
#'   according to the keyword set in `to_units`? By default this is `TRUE` since
#'   the expectation is that normally values are proportions. Setting to `FALSE`
#'   signifies that the values are already scaled and require only the
#'   appropriate symbol/units when formatted.
#' @param incl_space An option for whether to include a space between the value
#'   and the symbol/units. The default is `"auto"` which provides spacing
#'   dependent on the mark itself. This can be directly controlled by using
#'   either `TRUE` or `FALSE`.
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
#' vector where the resultant per millle values have two decimal places and `NA`
#' values will render as `"NA"`. The rendering context will be autodetected
#' unless specified in the `output` argument (here, it is of the `"plain"`
#' output type).
#'
#' ```r
#' vec_fmt_partsper(num_vals)
#' ```
#' ```
#' #> [1] "1.00‰" "0.10‰" "0.01‰" "NA"
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
#' vec_fmt_partsper(num_vals, to_units = "ppm", sep_mark = ".", dec_mark = ",")
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
#' 14-6
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

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Ensure that `to_units` is matched correctly to one option
  to_units <- match.arg(to_units)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_partsper()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_partsper(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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

#' Format a vector as mixed fractions
#'
#' @description
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
#' @inheritParams vec_fmt_number
#' @param accuracy The type of fractions to generate. This can either be one of
#'   the keywords `"low"`, `"med"`, or `"high"` (to generate fractions with
#'   denominators of up to 1, 2, or 3 digits, respectively) or an integer value
#'   greater than zero to obtain fractions with a fixed denominator (`2` yields
#'   halves, `3` is for thirds, `4` is quarters, etc.). For the latter option,
#'   using `simplify = TRUE` will simplify fractions where possible (e.g., `2/4`
#'   will be simplified as `1/2`). By default, the `"low"` option is used.
#' @param simplify If choosing to provide a numeric value for `accuracy`, the
#'   option to simplify the fraction (where possible) can be taken with `TRUE`
#'   (the default). With `FALSE`, denominators in fractions will be fixed to the
#'   value provided in `accuracy`.
#' @param layout For HTML output, the `"inline"` layout is the default. This
#'   layout places the numerals of the fraction on the baseline and uses a
#'   standard slash character. The `"diagonal"` layout will generate fractions
#'   that are typeset with raised/lowered numerals and a virgule.
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
#' 14-7
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

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Ensure that `layout` is matched correctly to one option
  layout <- match.arg(layout)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_fraction()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_fraction(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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

#' Format a vector as currency values
#'
#' @description
#' With numeric values in a vector, we can perform currency-based
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
#' @inheritParams vec_fmt_number
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
#' Pounds by using `currency = "GBP"`:
#'
#' ```r
#' vec_fmt_currency(num_vals, currency = "GBP")
#' ```
#' ```
#' #> [1] "GBP5.20" "GBP8.65" "GBP0.00" "-GBP5.30" "NA"
#' ```
#'
#' If we are formatting for a different locale, we could supply the locale ID
#' and let **gt** handle qll locale-specific formatting options:
#'
#' ```r
#' vec_fmt_currency(num_vals, currency = "EUR", locale = "fr")
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
#' 14-8
#'
#' @export
vec_fmt_currency <- function(
    x,
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
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_currency()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_currency(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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
      placement = placement,
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as Roman numerals
#'
#' @description
#' With numeric values in a vector, we can transform those to Roman numerals,
#' rounding values as necessary.
#'
#' @inheritParams vec_fmt_number
#' @param case Should Roman numerals should be rendered as uppercase (`"upper"`)
#'   or lowercase (`"lower"`) letters? By default, this is set to `"upper"`.
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
#' 14-9
#'
#' @import rlang
#' @export
vec_fmt_roman <- function(
    x,
    case = c("upper", "lower"),
    pattern = "{x}",
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Ensure that `case` is matched correctly to one option
  case <- match.arg(case)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_roman()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_roman(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      case = case,
      pattern = pattern
    ),
    output = output
  )
}

#' Format a vector as values in terms of bytes
#'
#' @description
#' With numeric values in a vector, we can transform each into byte values with
#' human readable units. The `vec_fmt_bytes()` function allows for the
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
#' @inheritParams vec_fmt_number
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
#' 14-10
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
    incl_space = TRUE,
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Ensure that `standard` is matched correctly to one option
  standard <- match.arg(standard)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "integer"))) {
    cli::cli_abort(
      "The `vec_fmt_bytes()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_bytes(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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
      incl_space = incl_space,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as date values
#'
#' @description
#' Format vector values to date values using one of fourteen presets. Input can
#' be in the form of `POSIXt` (i.e., datetimes), the `Date` type, or `character`
#' (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' We can simply apply a preset date style to format the dates. The following
#' date styles are available for use (all using the input date of `2000-02-29`
#' in the example output dates):
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
#' We can use the [info_date_style()] function for a useful reference on all of
#' the possible inputs to `date_style`.
#'
#' @inheritParams vec_fmt_number
#' @param date_style The date style to use. By default this is `"iso"` which
#'   corresponds to ISO 8601 date formatting. The other date styles can be
#'   viewed using [info_date_style()].
#'
#' @return A character vector.
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
#' 14-11
#'
#' @export
vec_fmt_date <- function(
    x,
    date_style = "iso",
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("Date", "POSIXt", "character"))) {
    cli::cli_abort(
      "The `vec_fmt_date()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_date(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      date_style = date_style,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as time values
#'
#' @description
#' Format vector values to time values using one of five presets. Input can be
#' in the form of `POSIXt` (i.e., datetimes), `character` (must be in the ISO
#' 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which always
#' results in the formatting of `00:00:00`).
#'
#' We can simply apply a preset time style to format the times. The following
#' time styles are available for use (all using the input time of `14:35:00` in
#' the example output times):
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
#' We can use the [info_time_style()] function for a useful reference on all of
#' the possible inputs to `time_style`.
#'
#' @inheritParams vec_fmt_number
#' @param time_style The time style to use. By default this is `"iso"` which
#'   corresponds to how times are formatted within ISO 8601 datetime values. The
#'   other time styles can be viewed using [info_time_style()].
#'
#' @return A character vector.
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
#'   locale = "fr_CA"
#' )
#' ```
#' ```
#' #> [1] "temps: 6:36 PM" "temps: 1:08 AM" NA
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 14-12
#'
#' @export
vec_fmt_time <- function(
    x,
    time_style = "iso",
    pattern = "{x}",
    locale = NULL,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("Date", "POSIXt", "character"))) {
    cli::cli_abort(
      "The `vec_fmt_time()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_time(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      time_style = time_style,
      pattern = pattern,
      locale = locale
    ),
    output = output
  )
}

#' Format a vector as datetime values
#'
#' @description
#' Format vector values to datetime values using one of fourteen presets for the
#' date component and one of five presets for the time component. Input can be
#' in the form of `POSIXt` (i.e., datetimes), the `Date` type, or `character`
#' (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or `YYYY-MM-DD`).
#'
#' Once the appropriate data cells are targeted with `columns` (and, optionally,
#' `rows`), we can simply apply preset date and time styles to format the
#' datetime values. The following date styles are available for formatting of
#' the date portion (all using the input date of `2000-02-29` in the example
#' output dates):
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
#' The following time styles are available for formatting of the time portion
#' (all using the input time of `14:35:00` in the example output times):
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
#' We can use the [info_date_style()] and [info_time_style()] functions as
#' useful references for all of the possible inputs to `date_style` and
#' `time_style`.
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
#' ### Quarter of the Year: formatting ver.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"Q"`             | `"3"`           | Numeric, one digit                |
#' | `"QQ"`            | `"03"`          | Numeric, two digits (zero padded) |
#' | `"QQQ"`           | `"Q3"`          | Abbreviated                       |
#' | `"QQQQ"`          | `"3rd quarter"` | Wide                              |
#' | `"QQQQQ"`         | `"3"`           | Narrow                            |
#'
#' ### Quarter of the Year: standalone ver.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"q"`             | `"3"`           | Numeric, one digit                |
#' | `"qq"`            | `"03"`          | Numeric, two digits (zero padded) |
#' | `"qqq"`           | `"Q3"`          | Abbreviated                       |
#' | `"qqqq"`          | `"3rd quarter"` | Wide                              |
#' | `"qqqqq"`         | `"3"`           | Narrow                            |
#'
#' ## Month
#'
#' ### Month: formatting ver.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"M"`             | `"7"`           | Numeric, minimum digits           |
#' | `"MM"`            | `"07"`          | Numeric, two digits (zero padded) |
#' | `"MMM"`           | `"Jul"`         | Abbreviated                       |
#' | `"MMMM"`          | `"July"`        | Wide                              |
#' | `"MMMMM"`         | `"J"`           | Narrow                            |
#'
#' ### Month: standalone ver.
#'
#' | Field Patterns    | Output          | Notes                             |
#' |-------------------|-----------------|-----------------------------------|
#' | `"M"`             | `"7"`           | Numeric, minimum digits           |
#' | `"MM"`            | `"07"`          | Numeric, two digits (zero padded) |
#' | `"MMM"`           | `"Jul"`         | Abbreviated                       |
#' | `"MMMM"`          | `"July"`        | Wide                              |
#' | `"MMMMM"`         | `"J"`           | Narrow                            |
#'
#' ## Week
#'
#' ### Week of Year
#'
#' | Field Patterns   | Output    | Notes                                    |
#' |------------------|-----------|------------------------------------------|
#' | `"w"`            | `"27"`    | Minimum digits                           |
#' | `"ww"`           | `"27"`    | Two digits (zero padded)                 |
#'
#' ### Week of Month
#'
#' | Field Pattern    | Output                                               |
#' |------------------|------------------------------------------------------|
#' | `"W"`            | `"1"`                                                |
#'
#' ## Day
#'
#' ### Day of Month
#'
#' | Field Patterns | Output    | Notes                                      |
#' |----------------|-----------|--------------------------------------------|
#' | `"d"`          | `"4"`     | Minimum digits                             |
#' | `"dd"`         | `"04"`    | Two digits, zero padded                    |
#'
#' ### Day of Year
#'
#' | Field Patterns  | Output   | Notes                                      |
#' |-----------------|----------|--------------------------------------------|
#' | `"D"`           | `"185"`  |                                            |
#' | `"DD"`          | `"185"`  | Zero padded to minimum width of 2          |
#' | `"DDD"`         | `"185"`  | Zero padded to minimum width of 3          |
#'
#' ### Day of Week in Month
#'
#' | Field Pattern                  | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"F"`                          | `"1"`                                  |
#'
#' ### Modified Julian Day
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"g"` to `"ggggggggg"`         | `"58303"` -> `"000058303"`             |
#'
#' ## Weekday
#'
#' ### Day of Week Name
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
#' | Field Patterns                 | Output   | Notes                       |
#' |--------------------------------|----------|-----------------------------|
#' | `"a"`, `"aa"`, or `"aaa"`      | `"PM"`   | Abbreviated                 |
#' | `"aaaa"`                       | `"PM"`   | Wide                        |
#' | `"aaaaa"`                      | `"p"`    | Narrow                      |
#'
#' ### AM/PM Period of Day Plus Noon and Midnight
#'
#' (a) `input_midnight`: `"2020-05-05T00:00:00"`
#'
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
#' (a) `input_morning`: `"2020-05-05T00:08:30"`
#'
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
#' ### Hour 1-12
#'
#' Using: `"2015-08-01T08:35:09"`
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"h"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"hh"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 0-23
#'
#' Using: `"2015-08-01T08:35:09"`
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"H"`                  | `"8"`   | Numeric, minimum digits              |
#' | `"HH"`                 | `"08"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 0-11
#'
#' Using: `"2015-08-01T08:35:09"`
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"K"`                  | `"7"`   | Numeric, minimum digits              |
#' | `"KK"`                 | `"07"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Hour 1-24
#'
#' Using: `"2015-08-01T08:35:09"`
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"k"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"kk"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Minute
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"m"`                  | `"5"`   | Numeric, minimum digits              |
#' | `"mm"`                 | `"06"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Seconds
#'
#' | Field Patterns         | Output  | Notes                                |
#' |------------------------|---------|--------------------------------------|
#' | `"s"`                  | `"9"`   | Numeric, minimum digits              |
#' | `"ss"`                 | `"09"`  | Numeric, 2 digits (zero padded)      |
#'
#' ### Fractional Second
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"S"` to `"SSSSSSSSS"`         | `"2"` -> `"235000000"`                 |
#'
#' ### Milliseconds Elapsed in Day
#'
#' Using: `"2011-07-27T00:07:19.7223"`
#'
#' | Field Patterns                 | Output                                 |
#' |--------------------------------|----------------------------------------|
#' | `"A"` to `"AAAAAAAAA"`         | `"439722"` -> `"000439722"`            |
#'
#' ## Era
#'
#' ### The Era Designator
#'
#' This provides the era name for the given date.
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
#' | Field Patterns             | Output                    | Notes          |
#' |----------------------------|---------------------------|----------------|
#' | `"z"`, `"zz"`, or `"zzz"`  | `"PDT"`                   | Short Specific |
#' | `"zzzz"`                   | `"Pacific Daylight Time"` | Long Specific  |
#'
#' ### TZ // Short and Long Specific non-Location Formats
#'
#' | Field Patterns             | Output       | Notes                       |
#' |----------------------------|--------------|-----------------------------|
#' | `"Z"`, `"ZZ"`, or `"ZZZ"`  | `"-0700"`    | ISO 8601 basic format       |
#' | `"ZZZZ"`                   | `"GMT-7:00"` | Long localized GMT format   |
#' | `"ZZZZZ"`                  | `"-07:00"`   | ISO 8601 extended format    |
#'
#' ### TZ // Short and Long Localized GMT Formats
#'
#' | Field Patterns          | Output        | Notes                         |
#' |-------------------------|---------------|-------------------------------|
#' | `"O"`                   | `"GMT-7"`     | Short localized GMT format    |
#' | `"OOOO"`                | `"GMT-07:00"` | Long localized GMT format     |
#'
#' ### TZ // Short and Long Localized GMT Formats
#'
#' | Field Patterns  | Output           | Notes                              |
#' |-----------------|------------------|------------------------------------|
#' | `"v"`           | `"PT"`           | Short generic non-location format  |
#' | `"vvvv"`        | `"Pacific Time"` | Long generic non-location format   |
#'
#' ### TZ // Short Time Zone IDs and Exemplar City Formats (big V)
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
#' @inheritParams vec_fmt_number
#' @inheritParams vec_fmt_date
#' @inheritParams vec_fmt_time
#' @param sep The separator string to use between the date and time components.
#'   By default, this is a single space character (`" "`). Only used when not
#'   specifying a `format` code.
#' @param format An optional format code used for generating custom dates/times.
#'   If used then the arguments governing preset styles (`date_style` and
#'   `time_style`) will be ignored in favor of formatting via the `format`
#'   string.
#' @param tz The time zone for printing dates/times (i.e., the output). The
#'   default of `NULL` will preserve the time zone of the input data in the
#'   output. If providing a time zone, it must be one that is recognized by the
#'   user's operating system (a vector of all valid `tz` values can be produced
#'   with [OlsonNames()]).
#'
#' @return A character vector.
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
#' format will adapt to different locales. Let's use a combination of the the
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
#' 14-13
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

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("Date", "POSIXct", "character"))) {
    cli::cli_abort(
      "The `vec_fmt_datetime()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_datetime(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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

#' Format a vector of numeric or duration values as styled time duration strings
#'
#' @description
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
#' @inheritParams vec_fmt_number
#' @param input_units If one or more selected columns contains numeric values, a
#'   keyword must be provided for `input_units` for **gt** to determine how
#'   those values are to be interpreted in terms of duration. The accepted units
#'   are: `"seconds"`, `"minutes"`, `"hours"`, `"days"`, and `"weeks"`.
#' @param output_units Controls the output time units. The default, `NULL`,
#'   means that **gt** will automatically choose time units based on the input
#'   duration value. To control which time units are to be considered for output
#'   (before trimming with `trim_zero_units`) we can specify a vector of one or
#'   more of the following keywords: `"weeks"`, `"days"`, `"hours"`,
#'   `"minutes"`, or `"seconds"`.
#' @param duration_style A choice of four formatting styles for the output
#'   duration values. With `"narrow"` (the default style), duration values will
#'   be formatted with single letter time-part units (e.g., 1.35 days will be
#'   styled as `"1d 8h 24m`). With `"wide"`, this example value will be expanded
#'   to `"1 day 8 hours 24 minutes"` after formatting. The `"colon-sep"` style
#'   will put days, hours, minutes, and seconds in the `"([D]/)[HH]:[MM]:[SS]"`
#'   format. The `"iso"` style will produce a value that conforms to the ISO
#'   8601 rules for duration values (e.g., 1.35 days will become `"P1DT8H24M"`).
#' @param trim_zero_units Provides methods to remove output time units that have
#'   zero values. By default this is `TRUE` and duration values that might
#'   otherwise be formatted as `"0w 1d 0h 4m 19s"` with
#'   `trim_zero_units = FALSE` are instead displayed as `"1d 4m 19s"`. Aside
#'   from using `TRUE`/`FALSE` we could provide a vector of keywords for more
#'   precise control. These keywords are: (1) `"leading"`, to omit all leading
#'   zero-value time units (e.g., `"0w 1d"` -> `"1d"`), (2) `"trailing"`, to
#'   omit all trailing zero-value time units (e.g., `"3d 5h 0s"` -> `"3d 5h"`),
#'   and `"internal"`, which removes all internal zero-value time units (e.g.,
#'   `"5d 0h 33m"` -> `"5d 33m"`).
#' @param max_output_units If `output_units` is `NULL`, where the output time
#'   units are unspecified and left to **gt** to handle, a numeric value
#'   provided for `max_output_units` will be taken as the maximum number of time
#'   units to display in all output time duration values. By default, this is
#'   `NULL` and all possible time units will be displayed. This option has no
#'   effect when `duration_style = "colon-sep"` (only `output_units` can be used
#'   to customize that type of duration output).
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative value will
#'   display a minus sign.
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
#' #> [1] "3d 5h 38m 23s" "5h 31m 12s" "7m 12s" "NA"
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
#' #> [1] "3 days 5 hours 38 minutes 23 seconds"
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
#' #> [1] "3 dagen 5 uur 38 minuten 23 seconden"
#' #> [2] "5 uur 31 minuten 12 seconden"
#' #> [3] "7 minuten 12 seconden"
#' #> [4] "NA"
#' ```
#'
#' @family vector formatting functions
#' @section Function ID:
#' 14-14
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

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Ensure that `duration_style` is matched correctly to one option
  duration_style <- match.arg(duration_style)

  # Stop function if class of `x` is incompatible with the formatting
  if (!vector_class_is_valid(x, valid_classes = c("numeric", "difftime"))) {
    cli::cli_abort(
      "The `vec_fmt_bytes()` function can only be used with numeric vectors."
    )
  }

  render_as_vector(
    fmt_duration(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
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

#' Format a vector containing Markdown text
#'
#' @description
#' Any Markdown-formatted text in the input vector will be transformed to the
#' appropriate output type.
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
#' 14-15
#'
#' @export
vec_fmt_markdown <- function(
    x,
    output = c("auto", "plain", "html", "latex", "rtf", "word")
) {

  # Ensure that `output` is matched correctly to one option
  output <- match.arg(output)

  if (output == "auto") {
    output <- determine_output_format()
  }

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  vec_fmt_out <-
    render_as_vector(
      fmt_markdown(
        gt(dplyr::tibble(x = x)),
        columns = "x", rows = everything()
      ),
      output = output
    )

  if (output == "html") {
    vec_fmt_out <- gsub("^<div class='gt_from_md'>(.*)", "\\1", vec_fmt_out)
    vec_fmt_out <- gsub("(.*)\n</div>", "\\1", vec_fmt_out)
  }

  vec_fmt_out
}

stop_if_not_vector <- function(x) {
  if (!rlang::is_vector(x)) {
    cli::cli_abort("The object provided as `x` should be a vector.")
  }
}

vector_class_is_valid <- function(x, valid_classes) {
  inherits(x, valid_classes)
}

render_as_vector <- function(data, output) {
  dt_body_get(build_data(data, context = output))[["x"]]
}

determine_output_format <- function() {

  # In an interactive context where the context is to be automatically
  # determined, always generate plain output
  if (rlang::is_interactive()) {
    return("plain")
  }

  # Check whether knitr is in the package library and stop function
  # only if it is not present
  if (!requireNamespace("knitr", quietly = TRUE)) {

    cli::cli_abort(c(
      "Automatically detecting the output context with `output = \"auto\"`
      requires the knitr package.",
      "*" = "It can be installed with `install.packages(\"knitr\")`."
    ))
  }

  if (knitr_is_rtf_output()) {
    return("rtf")
  } else if (knitr::is_latex_output()) {
    return("latex")
  } else if (knitr_is_word_output()) {
    return("word")
  } else {
    return("html")
  }
}
