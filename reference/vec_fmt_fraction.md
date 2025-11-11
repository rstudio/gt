# Format a vector as mixed fractions

With numeric values in vector, we can perform mixed-fraction-based
formatting. There are several options for setting the accuracy of the
fractions. Furthermore, there is an option for choosing a layout (i.e.,
typesetting style) for the mixed-fraction output.

The following options are available for controlling this type of
formatting:

- accuracy: how to express the fractional part of the mixed fractions;
  there are three keyword options for this and an allowance for
  arbitrary denominator settings

- simplification: an option to simplify fractions whenever possible

- layout: We can choose to output values with diagonal or inline
  fractions

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol for the whole number portion

- pattern: option to use a text pattern for decoration of the formatted
  mixed fractions

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
vec_fmt_fraction(
  x,
  accuracy = NULL,
  simplify = TRUE,
  layout = c("inline", "diagonal"),
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
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

- accuracy:

  *Accuracy of fractions*

  `singl-kw:[low|med|high]|scalar<numeric|integer>(val>=1)` //
  *default:* `"low"`

  The type of fractions to generate. This can either be one of the
  keywords `"low"`, `"med"`, or `"high"` (to generate fractions with
  denominators of up to 1, 2, or 3 digits, respectively) or an integer
  value greater than zero to obtain fractions with a fixed denominator
  (`2` yields halves, `3` is for thirds, `4` is quarters, etc.). For the
  latter option, using `simplify = TRUE` will simplify fractions where
  possible (e.g., `2/4` will be simplified as `1/2`). By default, the
  `"low"` option is used.

- simplify:

  *Simplify the fraction*

  `scalar<logical>` // *default:* `TRUE`

  If choosing to provide a numeric value for `accuracy`, the option to
  simplify the fraction (where possible) can be taken with `TRUE` (the
  default). With `FALSE`, denominators in fractions will be fixed to the
  value provided in `accuracy`.

- layout:

  *Layout of fractions in HTML output*

  `singl-kw:[inline|diagonal]` // *default:* `"inline"`

  For HTML output, the `"inline"` layout is the default. This layout
  places the numerals of the fraction on the baseline and uses a
  standard slash character. The `"diagonal"` layout will generate
  fractions that are typeset with raised/lowered numerals and a virgule.

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

Using `vec_fmt_fraction()` will create a character vector of fractions.
Any `NA` values will render as `"NA"`. The rendering context will be
autodetected unless specified in the `output` argument (here, it is of
the `"plain"` output type).

    vec_fmt_fraction(num_vals)

    #> [1] "0" "1/9" "0" "-5/9" "NA"

There are many options for formatting as fractions. If you'd like a
higher degree of accuracy in the computation of fractions we can supply
the `"med"` or `"high"` keywords to the `accuracy` argument:

    vec_fmt_fraction(num_vals, accuracy = "high")

    #> [1] "1/200" "2/25" "0" "-107/200" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_fraction(num_vals, accuracy = 8, pattern = "[{x}]")

    #> [1] "[0]" "[1/8]" "[0]" "[-1/2]" "NA"

## Function ID

15-8

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md),
[`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md),
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
