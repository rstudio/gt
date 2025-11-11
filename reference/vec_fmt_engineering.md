# Format a vector as values in engineering notation

With numeric values in a vector, we can perform formatting so that the
targeted values are rendered in engineering notation, where numbers are
written in the form of a mantissa (`m`) and an exponent (`n`). When
combined the construction is either of the form *m* x 10^*n* or *m*E*n*.
The mantissa is a number between `1` and `1000` and the exponent is a
multiple of `3`. For example, the number 0.0000345 can be written in
engineering notation as `34.50 x 10^-6`. This notation helps to simplify
calculations and make it easier to compare numbers that are on very
different scales.

We have fine control over the formatting task, with the following
options:

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- scaling: we can choose to scale targeted values by a multiplier value

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_engineering(
  x,
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_by = 1,
  exp_style = "x10n",
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign_m = FALSE,
  force_sign_n = FALSE,
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

- scale_by:

  *Scale values by a fixed multiplier*

  `scalar<numeric|integer>` // *default:* `1`

  All numeric values will be multiplied by the `scale_by` value before
  undergoing formatting. Since the `default` value is `1`, no values
  will be changed unless a different multiplier value is supplied.

- exp_style:

  *Style declaration for exponent formatting*

  `scalar<character>` // *default:* `"x10n"`

  Style of formatting to use for the scientific notation formatting. By
  default this is `"x10n"` but other options include using a single
  letter (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to
  signal a minimum digit width of one, or `"low-ten"` for using a
  stylized `"10"` marker.

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

- force_sign_m, force_sign_n:

  *Forcing the display of a positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Should the plus sign be shown for positive values of the mantissa
  (first component, `force_sign_m`) or the exponent (`force_sign_n`)?
  This would effectively show a sign for all values except zero on
  either of those numeric components of the notation. If so, use `TRUE`
  for either one of these options. The default for both is `FALSE`,
  where only negative numbers will display a sign.

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

    num_vals <- c(3.24e-4, 8.65, 1362902.2, -59027.3, NA)

Using `vec_fmt_engineering()` with the default options will create a
character vector with values engineering notation. Any `NA` values
remain as `NA` values. The rendering context will be autodetected unless
specified in the `output` argument (here, it is of the `"plain"` output
type).

    vec_fmt_engineering(num_vals)

    #> [1] "324.00 x 10^-6" "8.65" "1.36 x 10^6" "-59.03 x 10^3" "NA"

We can change the number of decimal places with the `decimals` option:

    vec_fmt_engineering(num_vals, decimals = 1)

    #> [1] "324.0 x 10^-6" "8.7" "1.4 x 10^6" "-59.0 x 10^3" "NA"

If we are formatting for a different locale, we could supply the locale
ID and **gt** will handle any locale-specific formatting options:

    vec_fmt_engineering(num_vals, locale = "da")

    #> [1] "324,00 x 10^-6" "8,65" "1,36 x 10^6" "-59,03 x 10^3" "NA"

Should you need to have positive and negative signs for the mantissa
component of a given value, use `force_sign_m = TRUE`:

    vec_fmt_engineering(num_vals, force_sign_m = TRUE)

    #> [1] "+324.00 x 10^-6" "+8.65" "+1.36 x 10^6" "-59.03 x 10^3" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_engineering(num_vals, pattern = "/{x}/")

    #> [1] "/324.00 x 10^-6/" "/8.65/" "/1.36 x 10^6/" "/-59.03 x 10^3/" "NA"

## Function ID

15-4

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md),
[`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md),
[`vec_fmt_index()`](https://gt.rstudio.com/reference/vec_fmt_index.md),
[`vec_fmt_integer()`](https://gt.rstudio.com/reference/vec_fmt_integer.md),
[`vec_fmt_markdown()`](https://gt.rstudio.com/reference/vec_fmt_markdown.md),
[`vec_fmt_number()`](https://gt.rstudio.com/reference/vec_fmt_number.md),
[`vec_fmt_number_si()`](https://gt.rstudio.com/reference/vec_fmt_number_si.md),
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md),
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
