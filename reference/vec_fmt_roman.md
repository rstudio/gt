# Format a vector as Roman numerals

With numeric values in a vector, we can transform those to Roman
numerals, rounding values as necessary.

## Usage

``` r
vec_fmt_roman(
  x,
  case = c("upper", "lower"),
  pattern = "{x}",
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

- case:

  *Use uppercase or lowercase letters*

  `singl-kw:[upper|lower]` // *default:* `"upper"`

  Should Roman numerals should be rendered as uppercase (`"upper"`) or
  lowercase (`"lower"`) letters? By default, this is set to `"upper"`.

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

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

    num_vals <- c(1, 4, 5, 8, 12, 20, 0, -5, 1.3, NA)

Using `vec_fmt_roman()` with the default options will create a character
vector with values rendered as Roman numerals. Zero values will be
rendered as `"N"`, any `NA` values remain as `NA` values, negative
values will be automatically made positive, and values greater than or
equal to 3900 will be rendered as `"ex terminis"`. The rendering context
will be autodetected unless specified in the `output` argument (here, it
is of the `"plain"` output type).

    vec_fmt_roman(num_vals)

    #> [1] "I" "IV" "V" "VIII" "XII" "XX" "N" "V" "I" "NA"

We can also use `vec_fmt_roman()` with the `case = "lower"` option to
create a character vector with values rendered as lowercase Roman
numerals.

    vec_fmt_roman(num_vals, case = "lower")

    #> [1] "i" "iv" "v" "viii" "xii" "xx" "n" "v" "i" "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_roman(num_vals, case = "lower", pattern = "{x}.")

    #> [1] "i." "iv." "v." "viii." "xii." "xx." "n." "v." "i." "NA"

## Function ID

15-10

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md).

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
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
