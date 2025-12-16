# Format a vector as numbers with SI prefixes

With numeric values in a vector, we can format the values with SI
(International System of Units) prefixes. These prefixes like k (kilo),
M (mega), G (giga), and m (milli) scale numbers in either powers of 1000
(engineering mode) or powers of 10 and 100 (decimal mode).

We have control over the formatting with the following options:

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- scaling: we can choose to scale targeted values by a multiplier value
  (useful for unit conversions)

- SI prefix mode: choose between engineering prefixes (powers of 1000)
  or decimal prefixes (all SI prefixes)

- units: an optional unit designation for the values

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_number_si(
  x,
  unit = NULL,
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_by = 1,
  prefix_mode = c("engineering", "decimal"),
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
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

- unit:

  *Unit to append to formatted values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A character string specifying the unit to append after the SI prefix
  (e.g., `"g"` for grams, `"W"` for watts, `"Hz"` for hertz, `"m"` for
  meters). If `NULL`, only the prefix will be shown. The unit can also
  be dynamically specified per row using
  [`from_column()`](https://gt.rstudio.com/reference/from_column.md).

- decimals:

  *Number of decimal places*

  `scalar<numeric|integer>(val>=0)` // *default:* `2`

  The exact number of decimal places to display in the mantissa. If both
  `decimals` and `n_sigfig` are provided, `n_sigfig` takes precedence.

- drop_trailing_zeros:

  *Drop trailing zeros*

  `scalar<logical>` // *default:* `FALSE`

  Remove trailing zeros after the decimal point (e.g., "1.50" becomes
  "1.5").

- drop_trailing_dec_mark:

  *Drop trailing decimal mark*

  `scalar<logical>` // *default:* `TRUE`

  Remove the decimal mark if all decimal places are zero (e.g., "1."
  becomes "1").

- scale_by:

  *Scale values by a fixed multiplier*

  `scalar<numeric|integer>` // *default:* `1`

  All numeric values will be multiplied by the `scale_by` value before
  undergoing formatting. Since the `default` value is `1`, no values
  will be changed unless a different multiplier value is supplied. This
  is useful for unit conversions, such as using
  [`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
  to convert horsepower to watts before formatting with SI prefixes.

- prefix_mode:

  *Type of SI prefixes to use*

  `singl-kw:[engineering|decimal]` // *default:* `"engineering"`

  The type of SI prefixes to use. Options are `"engineering"` (powers of
  1000 only) or `"decimal"` (all SI prefixes including powers of 10 and
  100). See the *SI Prefix Modes* section for details.

- pattern:

  *Decoration pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern for decorating values. Use `{x}` to represent the
  formatted value (including prefix and unit).

- sep_mark:

  *Thousands separator*

  `scalar<character>` // *default:* `","`

  The character to use as the thousands separator. Overridden if
  `locale` is provided.

- dec_mark:

  *Decimal mark*

  `scalar<character>` // *default:* `"."`

  The character to use as the decimal point. Overridden if `locale` is
  provided.

- force_sign:

  *Force positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Force the display of a plus sign for positive values.

- incl_space:

  *Include a space between the value and the unit symbol*

  `scalar<logical>` // *default:* `TRUE`

  An option for whether to include a space between the numerical value
  and the SI prefix + unit (e.g., `TRUE` for "1.5 kW", `FALSE` for
  "1.5kW"). Per SI convention, there should be a space between the value
  and the unit symbol.

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

    num_vals <- c(1.5e9, 2.7e6, 4200, 0.3, 0.00012, 2.4e-8)

Using `vec_fmt_number_si()` with the default options will create a
character vector with values formatted with SI prefixes. Any `NA` values
remain as `NA` values. The rendering context will be autodetected unless
specified in the `output` argument (here, it is of the `"plain"` output
type).

    vec_fmt_number_si(num_vals)

    #> [1] "1.50 G" "2.70 M" "4.20 k" "300.00 m" "120.00 u" "24.00 n"

We can add a unit designation to all values with the `unit` option:

    vec_fmt_number_si(num_vals, unit = "W")

    #> [1] "1.50 GW" "2.70 MW" "4.20 kW" "300.00 mW" "120.00 uW" "24.00 nW"

We can change the number of decimal places with the `decimals` option:

    vec_fmt_number_si(num_vals, unit = "g", decimals = 0)

    #> [1] "2 Gg" "3 Mg" "4 kg" "0 g" "0 g" "0 g"

If we are formatting for a different locale, we could supply the locale
ID and **gt** will handle any locale-specific formatting options:

    vec_fmt_number_si(num_vals, unit = "m", locale = "fr")

    #> [1] "1,50 Gm" "2,70 Mm" "4,20 km" "300,00 mm" "120,00 um" "24,00 nm"

The `scale_by` option is useful for unit conversions. For instance, to
convert meters to millimeters:

    vec_fmt_number_si(c(0.5, 1.2, 3.8), unit = "m", scale_by = 1000)

    #> [1] "500.00 mm" "1.20 km" "3.80 km"

We can control the space between the number and unit with `incl_space`:

    vec_fmt_number_si(num_vals, unit = "Hz", incl_space = FALSE, decimals = 1)

    #> [1] "1.5GHz" "2.7MHz" "4.2kHz" "300.0mHz" "120.0uHz" "24.0nHz"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_number_si(num_vals, pattern = "[{x}]")

    #> [1] "[1.50 G]" "[2.70 M]" "[4.20 k]" "[300.00 m]" "[120.00 u]" "[24.00 n]"

## Function ID

15-5

## Function Introduced

`v1.2.0` (December 16, 2025)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md).

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
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md),
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
