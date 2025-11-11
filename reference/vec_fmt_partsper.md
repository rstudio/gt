# Format a vector as parts-per quantities

With numeric values in a vector, we can format the values so that they
are rendered as *per mille*, *ppm*, *ppb*, etc., quantities. The
following list of keywords (with associated naming and scaling factors)
is available to use within `vec_fmt_partsper()`:

- `"per-mille"`: Per mille, (1 part in `1,000`)

- `"per-myriad"`: Per myriad, (1 part in `10,000`)

- `"pcm"`: Per cent mille (1 part in `100,000`)

- `"ppm"`: Parts per million, (1 part in `1,000,000`)

- `"ppb"`: Parts per billion, (1 part in `1,000,000,000`)

- `"ppt"`: Parts per trillion, (1 part in `1,000,000,000,000`)

- `"ppq"`: Parts per quadrillion, (1 part in `1,000,000,000,000,000`)

The function provides a lot of formatting control and we can use the
following options:

- custom symbol/units: we can override the automatic symbol or units
  display with our own choice as the situation warrants

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- value scaling toggle: choose to disable automatic value scaling in the
  situation that values are already scaled coming in (and just require
  the appropriate symbol or unit display)

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_partsper(
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
)
```

## Arguments

- x:

  *The input vector*

  `vector(numeric|integer)` // **required**

  This is the input vector that will undergo transformation to a
  character vector of the same length. Values within the vector will be
  formatted.

- to_units:

  *Output Quantity*

  `singl-kw:[per-mille|per-myriad|pcm|ppm|ppb|ppt|ppq]` // *default:*
  `"per-mille"`

  A keyword that signifies the desired output quantity. This can be any
  from the following set: `"per-mille"`, `"per-myriad"`, `"pcm"`,
  `"ppm"`, `"ppb"`, `"ppt"`, or `"ppq"`.

- symbol:

  *Symbol or units to use in output display*

  `scalar<character>` // *default:* `"auto"`

  The symbol/units to use for the quantity. By default, this is set to
  `"auto"` and **gt** will choose the appropriate symbol based on the
  `to_units` keyword and the output context. However, this can be
  changed by supplying a string (e.g, using `symbol = "ppbV"` when
  `to_units = "ppb"`).

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

  *Scale input values accordingly*

  `scalar<logical>` // *default:* `TRUE`

  Should the values be scaled through multiplication according to the
  keyword set in `to_units`? By default this is `TRUE` since the
  expectation is that normally values are proportions. Setting to
  `FALSE` signifies that the values are already scaled and require only
  the appropriate symbol/units when formatted.

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

  Should the positive sign be shown for positive values (effectively
  showing a sign for all values except zero)? If so, use `TRUE` for this
  option. The default is `FALSE`, where only negative numbers will
  display a minus sign. This option is disregarded when using accounting
  notation with `accounting = TRUE`.

- incl_space:

  *Include a space between the value and the symbol/units*

  `scalar<character>|scalar<logical>` // *default:* `"auto"`

  An option for whether to include a space between the value and the
  symbol/units. The default is `"auto"` which provides spacing dependent
  on the mark itself. This can be directly controlled by using either
  `TRUE` or `FALSE`.

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

    num_vals <- c(10^(-3:-5), NA)

Using `vec_fmt_partsper()` with the default options will create a
character vector where the resultant per mille values have two decimal
places and `NA` values will render as `"NA"`. The rendering context will
be autodetected unless specified in the `output` argument (here, it is
of the `"plain"` output type).

    vec_fmt_partsper(num_vals)

    #> [1] "1.00%." "0.10%." "0.01%." "NA"

We can change the output units to a different measure. If ppm units are
desired then `to_units = "ppm"` can be used.

    vec_fmt_partsper(num_vals, to_units = "ppm")

    #> [1] "1,000.00 ppm" "100.00 ppm" "10.00 ppm" "NA"

We can change the decimal mark to a comma, and we have to be sure to
change the digit separator mark from the default comma to something else
(a period works here):

    vec_fmt_partsper(
      num_vals,
      to_units = "ppm",
      sep_mark = ".",
      dec_mark = ","
    )

    #> [1] "1.000,00 ppm" "100,00 ppm" "10,00 ppm" "NA"

If we are formatting for a different locale, we could supply the locale
ID and let **gt** handle these locale-specific formatting options:

    vec_fmt_partsper(num_vals, to_units = "ppm", locale = "es")

    #> [1] "1.000,00 ppm" "100,00 ppm" "10,00 ppm" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_partsper(num_vals, to_units = "ppm", pattern = "{x}V")

    #> [1] "1,000.00 ppmV" "100.00 ppmV" "10.00 ppmV" "NA"

## Function ID

15-7

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md).

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
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
