# Format a vector as indexed characters

With numeric values in a vector, we can transform those to index values,
usually based on letters. These characters can be derived from a
specified locale and they are intended for ordering (often leaving out
characters with diacritical marks).

## Usage

``` r
vec_fmt_index(
  x,
  case = c("upper", "lower"),
  index_algo = c("repeat", "excel"),
  pattern = "{x}",
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

- case:

  *Use uppercase or lowercase letters*

  `singl-kw:[upper|lower]` // *default:* `"upper"`

  Should the resulting index characters be rendered as uppercase
  (`"upper"`) or lowercase (`"lower"`) letters? By default, this is set
  to `"upper"`.

- index_algo:

  *Indexing algorithm*

  `singl-kw:[repeat|excel]` // *default:* `"repeat"`

  The indexing algorithm handles the recycling of the index character
  set. By default, the `"repeat"` option is used where characters are
  doubled, tripled, and so on, when moving past the character set limit.
  The alternative is the `"excel"` option, where Excel-based column
  naming is adapted and used here (e.g., `[..., Y, Z, AA, AB, ...]`).

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

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

    num_vals <- c(1, 4, 5, 8, 12, 20, 26, 34, 0, -5, 1.3, NA)

Using `vec_fmt_index()` with the default options will create a character
vector with values rendered as index numerals. Zero values will be
rendered as `""` (i.e., empty strings), any `NA` values remain as `NA`
values, and negative values will be automatically made positive. The
rendering context will be autodetected unless specified in the `output`
argument (here, it is of the `"plain"` output type).

    vec_fmt_index(num_vals)

    #> [1] "A" "D" "E" "H" "L" "T" "Z" "HH" "" "E" "A" "NA"

We can also use `vec_fmt_index()` with the `case = "lower"` option to
create a character vector with values rendered as lowercase Roman
numerals.

    vec_fmt_index(num_vals, case = "lower")

    #> [1] "a" "d" "e" "h" "l" "t" "z" "hh" "" "e" "a" "NA"

If we are formatting for a different locale, we could supply the locale
ID and let **gt** obtain a locale-specific set of index values:

    vec_fmt_index(1:10, locale = "so")

    #> [1] "B" "C" "D" "F" "G" "H" "J" "K" "L" "M"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_index(num_vals, case = "lower", pattern = "{x}.")

    #> [1] "a." "d." "e." "h." "l." "t." "z." "hh." "." "e." "a." "NA"

## Function ID

15-11

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md),
[`vec_fmt_engineering()`](https://gt.rstudio.com/reference/vec_fmt_engineering.md),
[`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md),
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
