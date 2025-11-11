# Format a vector as values in terms of bytes

With numeric values in a vector, we can transform each into byte values
with human readable units. `vec_fmt_bytes()` allows for the formatting
of byte sizes to either of two common representations: (1) with decimal
units (powers of 1000, examples being `"kB"` and `"MB"`), and (2) with
binary units (powers of 1024, examples being `"KiB"` and `"MiB"`).

It is assumed the input numeric values represent the number of bytes and
automatic truncation of values will occur. The numeric values will be
scaled to be in the range of 1 to \<1000 and then decorated with the
correct unit symbol according to the standard chosen. For more control
over the formatting of byte sizes, we can use the following options:

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
vec_fmt_bytes(
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
)
```

## Arguments

- x:

  *The input vector*

  `vector(numeric|integer)` // **required**

  This is the input vector that will undergo transformation to a
  character vector of the same length. Values within the vector will be
  formatted.

- standard:

  *Standard used to express byte sizes*

  `singl-kw:[decimal|binary]` // *default:* `"decimal"`

  The form of expressing large byte sizes is divided between: (1)
  decimal units (powers of 1000; e.g., `"kB"` and `"MB"`), and (2)
  binary units (powers of 1024; e.g., `"KiB"` and `"MiB"`).

- decimals:

  *Number of decimal places*

  `scalar<numeric|integer>(val>=0)` // *default:* `1`

  This corresponds to the exact number of decimal places to use. A value
  such as `2.34` can, for example, be formatted with `0` decimal places
  and it would result in `"2"`. With `4` decimal places, the formatted
  value becomes `"2.3400"`. The trailing zeros can be removed with
  `drop_trailing_zeros = TRUE`.

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

  Should the positive sign be shown for positive numbers (effectively
  showing a sign for all numbers except zero)? If so, use `TRUE` for
  this option. The default is `FALSE`, where only negative numbers will
  display a minus sign.

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

  *Include a space between the value and the units*

  `scalar<logical>` // *default:* `TRUE`

  An option for whether to include a space between the value and the
  units. The default is to use a space character for separation.

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

    num_vals <- c(3.24294e14, 8, 1362902, -59027, NA)

Using `vec_fmt_bytes()` with the default options will create a character
vector with values in bytes. Any `NA` values remain as `NA` values. The
rendering context will be autodetected unless specified in the `output`
argument (here, it is of the `"plain"` output type).

    vec_fmt_bytes(num_vals)

    #> [1] "324.3 TB" "8 B" "1.4 MB" "-59 kB" "NA"

We can change the number of decimal places with the `decimals` option:

    vec_fmt_bytes(num_vals, decimals = 2)

    #> [1] "324.29 TB" "8 B" "1.36 MB" "-59.03 kB" "NA"

If we are formatting for a different locale, we could supply the locale
ID and **gt** will handle any locale-specific formatting options:

    vec_fmt_bytes(num_vals, locale = "fi")

    #> [1] "324,3 TB" "8 B" "1,4 MB" "-59 kB" "NA"

Should you need to have positive and negative signs on each of the
output values, use `force_sign = TRUE`:

    vec_fmt_bytes(num_vals, force_sign = TRUE)

    #> [1] "+324.3 TB" "+8 B" "+1.4 MB" "-59 kB" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_bytes(num_vals, pattern = "[{x}]")

    #> [1] "[324.3 TB]" "[8 B]" "[1.4 MB]" "[-59 kB]" "NA"

## Function ID

15-13

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md).

Other vector formatting functions:
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
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
