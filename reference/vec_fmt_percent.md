# Format a vector as percentage values

With numeric values in vector, we can perform percentage-based
formatting. It is assumed that numeric values in the input vector are
proportional values and, in this case, the values will be automatically
multiplied by `100` before decorating with a percent sign (the other
case is accommodated though setting the `scale_values` to `FALSE`). For
more control over percentage formatting, we can use the following
options:

- percent sign placement: the percent sign can be placed after or before
  the values and a space can be inserted between the symbol and the
  value.

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_percent(
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

- scale_values:

  *Multiply input values by 100*

  `scalar<logical>` // *default:* `TRUE`

  Should the values be scaled through multiplication by 100? By default
  this scaling is performed since the expectation is that incoming
  values are usually proportional. Setting to `FALSE` signifies that the
  values are already scaled and require only the percent sign when
  formatted.

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

- incl_space:

  *Include a space between the value and the % sign*

  `scalar<logical>` // *default:* `FALSE`

  An option for whether to include a space between the value and the
  percent sign. The default is to not introduce a space character.

- placement:

  *Percent sign placement*

  `singl-kw:[right|left]` // *default:* `"right"`

  This option governs the placement of the percent sign. This can be
  either be `"right"` (the default) or `"left"`.

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

    num_vals <- c(0.0052, 0.08, 0, -0.535, NA)

Using `vec_fmt_percent()` with the default options will create a
character vector where the resultant percentage values have two decimal
places and `NA` values will render as `"NA"`. The rendering context will
be autodetected unless specified in the `output` argument (here, it is
of the `"plain"` output type).

    vec_fmt_percent(num_vals)

    #> [1] "0.52%" "8.00%" "0.00%" "-53.50%" "NA"

We can change the decimal mark to a comma, and we have to be sure to
change the digit separator mark from the default comma to something else
(a period works here):

    vec_fmt_percent(num_vals, sep_mark = ".", dec_mark = ",")

    #> [1] "0,52%" "8,00%" "0,00%" "-53,50%" "NA"

If we are formatting for a different locale, we could supply the locale
ID and let **gt** handle these locale-specific formatting options:

    vec_fmt_percent(num_vals, locale = "pt")

    #> [1] "0,52%" "8,00%" "0,00%" "-53,50%" "NA"

There are many options for formatting values. Perhaps you need to have
explicit positive and negative signs? Use `force_sign = TRUE` for that.

    vec_fmt_percent(num_vals, force_sign = TRUE)

    #> [1] "+0.52%" "+8.00%" "0.00%" "-53.50%" "NA"

Those trailing zeros past the decimal mark can be stripped out by using
the `drop_trailing_zeros` option.

    vec_fmt_percent(num_vals, drop_trailing_zeros = TRUE)

    #> [1] "0.52%" "8%" "0%" "-53.5%" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_percent(num_vals, pattern = "{x}wt")

    #> [1] "0.52%wt" "8.00%wt" "0.00%wt" "-53.50%wt" "NA"

## Function ID

15-6

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md).

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
[`vec_fmt_number()`](https://gt.rstudio.com/reference/vec_fmt_number.md),
[`vec_fmt_number_si()`](https://gt.rstudio.com/reference/vec_fmt_number_si.md),
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
