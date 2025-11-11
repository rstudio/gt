# Format a vector as numeric values

With numeric values in a vector, we can perform number-based formatting
so that the values are rendered to a character vector with some level of
precision. The following major options are available:

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- scaling: we can choose to scale targeted values by a multiplier value

- large-number suffixing: larger figures (thousands, millions, etc.) can
  be autoscaled and decorated with the appropriate suffixes

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_number(
  x,
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  min_sep_threshold = 1,
  locale = NULL,
  output = c("auto", "plain", "html", "latex", "rtf", "word")
)
```

## Arguments

- x:

  *The input vector*

  `vector(numeric|integer)` // **required**

  This is the input vector that will undergo transformation to a
  character vector of the same length. Values within the vector will be
  formatted.

- decimals:

  *Number of decimal places*

  `scalar<numeric|integer>(val>=0)` // *default:* `2`

  This corresponds to the exact number of decimal places to use. A value
  such as `2.34` can, for example, be formatted with `0` decimal places
  and it would result in `"2"`. With `4` decimal places, the formatted
  value becomes `"2.3400"`.

- n_sigfig:

  *Number of significant figures*

  `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)

  A option to format numbers to *n* significant figures. By default,
  this is `NULL` and thus number values will be formatted according to
  the number of decimal places set via `decimals`. If opting to format
  according to the rules of significant figures, `n_sigfig` must be a
  number greater than or equal to `1`. Any values passed to the
  `decimals` and `drop_trailing_zeros` arguments will be ignored.

- drop_trailing_zeros:

  *Drop any trailing zeros*

  `scalar<logical>` // *default:* `FALSE`

  A logical value that allows for removal of trailing zeros (those
  redundant zeros after the decimal mark).

- drop_trailing_dec_mark:

  *Drop the trailing decimal mark*

  `scalar<logical>` // *default:* `TRUE`

  A logical value that determines whether decimal marks should always
  appear even if there are no decimal digits to display after formatting
  (e.g., `23` becomes `23.` if `FALSE`). By default trailing decimal
  marks are not shown.

- use_seps:

  *Use digit group separators*

  `scalar<logical>` // *default:* `TRUE`

  An option to use digit group separators. The type of digit group
  separator is set by `sep_mark` and overridden if a locale ID is
  provided to `locale`. This setting is `TRUE` by default.

- accounting:

  *Use accounting style*

  `scalar<logical>` // *default:* `FALSE`

  An option to use accounting style for values. Normally, negative
  values will be shown with a minus sign but using accounting style will
  instead put any negative values in parentheses.

- scale_by:

  *Scale values by a fixed multiplier*

  `scalar<numeric|integer>` // *default:* `1`

  All numeric values will be multiplied by the `scale_by` value before
  undergoing formatting. Since the `default` value is `1`, no values
  will be changed unless a different multiplier value is supplied. This
  value will be ignored if using any of the `suffixing` options (i.e.,
  where `suffixing` is not set to `FALSE`).

- suffixing:

  *Specification for large-number suffixing*

  `scalar<logical>|vector<character>` // *default:* `FALSE`

  The `suffixing` option allows us to scale and apply suffixes to larger
  numbers (e.g., `1924000` can be transformed to `1.92M`). This option
  can accept a logical value, where `FALSE` (the default) will not
  perform this transformation and `TRUE` will apply thousands (`"K"`),
  millions (`"M"`), billions (`"B"`), and trillions (`"T"`) suffixes
  after automatic value scaling.

  We can alternatively provide a character vector that serves as a
  specification for which symbols are to be used for each of the value
  ranges. These preferred symbols will replace the defaults (e.g.,
  `c("k", "Ml", "Bn", "Tr")` replaces `"K"`, `"M"`, `"B"`, and `"T"`).

  Including `NA` values in the vector will ensure that the particular
  range will either not be included in the transformation (e.g.,
  `c(NA, "M", "B", "T")` won't modify numbers at all in the thousands
  range) or the range will inherit a previous suffix (e.g., with
  `c("K", "M", NA, "T")`, all numbers in the range of millions and
  billions will be in terms of millions).

  Any use of `suffixing` (where it is not set expressly as `FALSE`)
  means that any value provided to `scale_by` will be ignored.

  If using `system = "ind"` then the default suffix set provided by
  `suffixing = TRUE` will be the equivalent of `c(NA, "L", "Cr")`. This
  doesn't apply suffixes to the thousands range, but does express values
  in *lakhs* and *crores*.

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

- sep_mark:

  *Separator mark for digit grouping*

  `scalar<character>` // *default:* `","`

  The string to use as a separator between groups of digits. For
  example, using `sep_mark = ","` with a value of `1000` would result in
  a formatted value of `"1,000"`. This argument is ignored if a `locale`
  is supplied (i.e., is not `NULL`).

- dec_mark:

  *Decimal mark*

  `scalar<character>` // *default:* `"."`

  The string to be used as the decimal mark. For example, using
  `dec_mark = ","` with the value `0.152` would result in a formatted
  value of `"0,152"`). This argument is ignored if a `locale` is
  supplied (i.e., is not `NULL`).

- force_sign:

  *Forcing the display of a positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Should the positive sign be shown for positive values (effectively
  showing a sign for all values except zero)? If so, use `TRUE` for this
  option. The default is `FALSE`, where only negative numbers will
  display a minus sign. This option is disregarded when using accounting
  notation with `accounting = TRUE`.

- min_sep_threshold:

  *Minimum digit threshold for grouping separators*

  `scalar<numeric|integer>(val>=1)` // *default:* `1`

  The minimum number of digits required in the integer part of a number
  for grouping separators to be applied. This parameter determines when
  digit grouping begins based on the magnitude of values. The value `1`
  (the default) applies separators starting at 4-digit numbers (e.g.,
  `1,000` and above). A value of `2` starts grouping at 5-digit numbers
  (`10,000` and above), while `3` begins at 6-digit numbers (`100,000`
  and above).

- locale:

  *Locale identifier*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An optional locale identifier that can be used for formatting values
  according to the locale's rules. Examples include `"en"` for English
  (United States) and `"fr"` for French (France). We can call
  [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
  for a useful reference for all of the locales that are supported.

- output:

  *Output format*

  `singl-kw:[auto|plain|html|latex|rtf|word]` // *default:* `"auto"`

  The output style of the resulting character vector. This can either be
  `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or
  `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the
  `"auto"` option will choose the correct `output` value

## Value

A character vector.

## Examples

Let's create a numeric vector for the next few examples:

    num_vals <- c(5.2, 8.65, 0, -5.3, NA)

Using `vec_fmt_number()` with the default options will create a
character vector where the numeric values have two decimal places and
`NA` values will render as `"NA"`. Also, the rendering context will be
autodetected unless specified in the `output` argument (here, it is of
the `"plain"` output type).

    vec_fmt_number(num_vals)

    #> [1] "5.20" "8.65" "0.00" "-5.30" "NA"

We can change the decimal mark to a comma, and we have to be sure to
change the digit separator mark from the default comma to something else
(a period works here):

    vec_fmt_number(num_vals, sep_mark = ".", dec_mark = ",")

    #> [1] "5,20" "8,65" "0,00" "-5,30" "NA"

If we are formatting for a different locale, we could supply the locale
ID and let **gt** handle these locale-specific formatting options:

    vec_fmt_number(num_vals, locale = "fr")

    #> [1] "5,20" "8,65" "0,00" "-5,30" "NA"

There are many options for formatting values. Perhaps you need to have
explicit positive and negative signs? Use `force_sign = TRUE` for that.

    vec_fmt_number(num_vals, force_sign = TRUE)

    #> [1] "+5.20" "+8.65" "0.00" "-5.30" "NA"

Those trailing zeros past the decimal mark can be stripped out by using
the `drop_trailing_zeros` option.

    vec_fmt_number(num_vals, drop_trailing_zeros = TRUE)

    #> [1] "5.2" "8.65" "0" "-5.3" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_number(num_vals, pattern = "`{x}`")

    #> [1] "`5.20`" "`8.65`" "`0.00`" "`-5.30`" "NA"

## Function ID

15-1

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md),
[`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md),
[`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md),
[`vec_fmt_index()`](https://gt.rstudio.com/reference/vec_fmt_index.md),
[`vec_fmt_integer()`](https://gt.rstudio.com/reference/vec_fmt_integer.md),
[`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md),
[`vec_fmt_number_si()`](https://gt.rstudio.com/reference/vec_fmt_number_si.md),
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md),
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
