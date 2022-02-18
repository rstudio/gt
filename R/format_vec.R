#' Format a vector as numeric values
#'
#' @description
#' With numeric values in a vector, we can perform number-based
#' formatting so that the values are rendered to a character vector with some
#' level of precision. The following major options are available:
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
#'   according the locale's rules. Examples include `"en_US"` for English
#'   (United States) and `"fr_FR"` for French (France). The use of a valid
#'   locale ID will override any values provided in `sep_mark` and `dec_mark`.
#'   We can use the [info_locales()] function as a useful reference for all of
#'   the locales that are supported.
#' @param output The output style of the resulting character vector. This can
#'   either be `"html"` (the default), `"latex"`, or `"rtf"`.
#'
#' @return A character vector.
#'
#' @export
x_number <- function(
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
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_number()` and `x_integer()` functions can only be ",
      "used with numeric vectors.",
      call. = FALSE
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
#' @inheritParams x_number
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
#' @export
x_integer <- function(
    x,
    use_seps = TRUE,
    accounting = FALSE,
    scale_by = 1.0,
    suffixing = FALSE,
    pattern = "{x}",
    sep_mark = ",",
    force_sign = FALSE,
    locale = NULL,
    output = c("html", "latex", "rtf")
) {

  x_number(
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
#' @inheritParams x_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
#'
#' @return A character vector.
#'
#' @export
x_scientific <- function(
    x,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    scale_by = 1.0,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    locale = NULL,
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_scientific()` function can only be used with numeric vectors.",
      call. = FALSE
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
#' @inheritParams x_number
#' @param scale_by A value to scale the input. The default is `1.0`. All numeric
#'   values will be multiplied by this value first before undergoing formatting.
#' @param force_sign Should the positive sign be shown for positive values
#'   (effectively showing a sign for all values except zero)? If so, use `TRUE`
#'   for this option. The default is `FALSE`, where only negative numbers will
#'   display a minus sign.
#'
#' @return A character vector.
#'
#' @export
x_engineering <- function(
    x,
    decimals = 2,
    drop_trailing_zeros = FALSE,
    scale_by = 1.0,
    pattern = "{x}",
    sep_mark = ",",
    dec_mark = ".",
    force_sign = FALSE,
    locale = NULL,
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_engineering()` function can only be used with numeric vectors.",
      call. = FALSE
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
#' @inheritParams x_number
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
#' @export
x_percent <- function(
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
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_percent()` function can only be used with numeric vectors.",
      call. = FALSE
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
#' @inheritParams x_number
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
#' @param layout For HTML output, the `"diagonal"` layout is the default. This
#'   will generate fractions that are typeset with raised/lowered numerals and a
#'   virgule. The `"inline"` layout places the numerals of the fraction on the
#'   baseline and uses a standard slash character.
#'
#' @return A character vector.
#'
#' @export
x_fraction <- function(
    x,
    accuracy = NULL,
    simplify = TRUE,
    layout = c("diagonal", "inline"),
    use_seps = TRUE,
    pattern = "{x}",
    sep_mark = ",",
    locale = NULL,
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_fraction()` function can only be used with numeric vectors.",
      call. = FALSE
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
#' @inheritParams x_number
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
#' @export
x_currency <- function(
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
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_currency()` function can only be used with numeric vectors.",
      call. = FALSE
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

#' Format a vector as values in terms of bytes
#'
#' @description
#' With numeric values in a vector, we can transform each into byte values with
#' human readable units. The `x_bytes()` function allows for the formatting of
#' byte sizes to either of two common representations: (1) with decimal units
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
#' @inheritParams x_number
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
#' @export
x_bytes <- function(
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
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("numeric", "integer")
    )
  ) {
    stop(
      "The `x_bytes()` function can only be used with numeric vectors.",
      call. = FALSE
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
#' be in the form of `POSIXt` (i.e., date-times), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
#'
#' We can simply apply a preset date style to format the dates. The following
#' date styles are available for use (all using the input date of `2000-02-29`
#' in the example output dates):
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
#' @inheritParams x_number
#' @param date_style The date style to use. Supply a number (from `1` to `14`)
#'   that corresponds to the preferred date style, or, provide a named date
#'   style (`"wday_month_day_year"`, `"m_day_year"`, `"year.mn.day"`, etc.). Use
#'   [info_date_style()] to see the different numbered and named date presets.
#'
#' @return A character vector.
#'
#' @export
x_date <- function(
    x,
    date_style = 2,
    pattern = "{x}",
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("Date", "POSIXt", "character")
    )
  ) {
    stop(
      "The `x_date()` function can only be used with numeric vectors.",
      call. = FALSE
    )
  }

  render_as_vector(
    fmt_date(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      date_style = date_style,
      pattern = pattern
    ),
    output = output
  )
}

#' Format a vector as time values
#'
#' @description
#' Format vector values to time values using one of five presets. Input can be
#' in the form of `POSIXt` (i.e., date-times), `character` (must be in the ISO
#' 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`), or `Date` (which always
#' results in the formatting of `00:00:00`).
#'
#' We can simply apply a preset time style to format the times. The following
#' time styles are available for use (all using the input time of `14:35:00` in
#' the example output times):
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
#' @inheritParams x_number
#' @param time_style The time style to use. Supply a number (from `1` to `5`)
#'   that corresponds to the preferred time style, or, provide a named time
#'   style (`"hms"`, `"hms_p"`, `"h_p"`, etc.). Use [info_time_style()] to see
#'   the different numbered and named time presets.
#'
#' @return A character vector.
#'
#' @export
x_time <- function(
    x,
    time_style = 2,
    pattern = "{x}",
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("Date", "POSIXt", "character")
    )
  ) {
    stop(
      "The `x_time()` function can only be used with numeric vectors.",
      call. = FALSE
    )
  }

  render_as_vector(
    fmt_time(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything(),
      time_style = time_style,
      pattern = pattern
    ),
    output = output
  )
}

#' Format a vector as date-time values
#'
#' @description
#' Format vector values to date-time values using one of fourteen presets for
#' the date component and one of five presets for the time component. Input can
#' be in the form of `POSIXct` (i.e., date-times), the `Date` type, or
#' `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
#' `YYYY-MM-DD`).
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
#' @inheritParams x_number
#' @inheritParams x_date
#' @inheritParams x_time
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
#' @export
x_datetime <- function(
    x,
    date_style = 2,
    time_style = 2,
    sep = " ",
    format = NULL,
    tz = NULL,
    pattern = "{x}",
    output = c("html", "latex", "rtf")) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  # Stop function if class of `x` is incompatible with the formatting
  if (
    !vector_class_is_valid(
      x,
      valid_classes = c("Date", "POSIXct", "character")
    )
  ) {
    stop(
      "The `x_datetime()` function can only be used with numeric vectors.",
      call. = FALSE
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
      pattern = pattern
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
#' @inheritParams x_number
#'
#' @return A character vector.
#'
#' @export
x_markdown <- function(
    x,
    output = c("html", "latex", "rtf")
) {

  output <- match.arg(output)

  # Ensure that `x` is strictly a vector with `rlang::is_vector()`
  stop_if_not_vector(x)

  render_as_vector(
    fmt_markdown(
      gt(dplyr::tibble(x = x)),
      columns = "x", rows = everything()
    ),
    output = output
  )
}

stop_if_not_vector <- function(x) {

  if (!rlang::is_vector(x)) {
    stop(
      "The object provided as `x` should be a vector",
      call. = FALSE
    )
  }
}

vector_class_is_valid <- function(x, valid_classes) {
  inherits(x, valid_classes)
}

render_as_vector <- function(data,
                             output) {

  built <- build_data(data, context = output)
  dplyr::pull(dt_body_get(built), "x")
}
