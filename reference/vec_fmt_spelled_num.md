# Format a vector as spelled-out numbers

With numeric values in a vector, we can transform those to numbers that
are spelled out. Any values from `0` to `100` can be spelled out
according to the specified locale. For example, the value `23` will be
rendered as `"twenty-three"` if the locale is an English-language one
(or, not provided at all); should a Swedish locale be provided (e.g.,
`"sv"`), the output will instead be `"tjugotre"`.

## Usage

``` r
vec_fmt_spelled_num(
  x,
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

## Supported locales

The following 80 locales are supported in the `locale` argument of
`vec_fmt_spelled_num()`: `"af"` (Afrikaans), `"ak"` (Akan), `"am"`
(Amharic), `"ar"` (Arabic), `"az"` (Azerbaijani), `"be"` (Belarusian),
`"bg"` (Bulgarian), `"bs"` (Bosnian), `"ca"` (Catalan), `"ccp"`
(Chakma), `"chr"` (Cherokee), `"cs"` (Czech), `"cy"` (Welsh), `"da"`
(Danish), `"de"` (German), `"de-CH"` (German (Switzerland)), `"ee"`
(Ewe), `"el"` (Greek), `"en"` (English), `"eo"` (Esperanto), `"es"`
(Spanish), `"et"` (Estonian), `"fa"` (Persian), `"ff"` (Fulah), `"fi"`
(Finnish), `"fil"` (Filipino), `"fo"` (Faroese), `"fr"` (French),
`"fr-BE"` (French (Belgium)), `"fr-CH"` (French (Switzerland)), `"ga"`
(Irish), `"he"` (Hebrew), `"hi"` (Hindi), `"hr"` (Croatian), `"hu"`
(Hungarian), `"hy"` (Armenian), `"id"` (Indonesian), `"is"` (Icelandic),
`"it"` (Italian), `"ja"` (Japanese), `"ka"` (Georgian), `"kk"` (Kazakh),
`"kl"` (Kalaallisut), `"km"` (Khmer), `"ko"` (Korean), `"ky"` (Kyrgyz),
`"lb"` (Luxembourgish), `"lo"` (Lao), `"lrc"` (Northern Luri), `"lt"`
(Lithuanian), `"lv"` (Latvian), `"mk"` (Macedonian), `"ms"` (Malay),
`"mt"` (Maltese), `"my"` (Burmese), `"ne"` (Nepali), `"nl"` (Dutch),
`"nn"` (Norwegian Nynorsk), `"no"` (Norwegian), `"pl"` (Polish), `"pt"`
(Portuguese), `"qu"` (Quechua), `"ro"` (Romanian), `"ru"` (Russian),
`"se"` (Northern Sami), `"sk"` (Slovak), `"sl"` (Slovenian), `"sq"`
(Albanian), `"sr"` (Serbian), `"sr-Latn"` (Serbian (Latin)), `"su"`
(Sundanese), `"sv"` (Swedish), `"sw"` (Swahili), `"ta"` (Tamil), `"th"`
(Thai), `"tr"` (Turkish), `"uk"` (Ukrainian), `"vi"` (Vietnamese),
`"yue"` (Cantonese), and `"zh"` (Chinese).

## Examples

Let's create a numeric vector for the next few examples:

    num_vals <- c(1, 8, 23, 76, 0, -5, 200, NA)

Using `vec_fmt_spelled_num()` will create a character vector with values
rendered as spelled-out numbers. Any `NA` values remain as `NA` values.
The rendering context will be autodetected unless specified in the
`output` argument (here, it is of the `"plain"` output type).

    vec_fmt_spelled_num(num_vals)

    #> [1] "one"     "eight"     "twenty-three"  "seventy-six"  "zero"
    #> [6] "-5"      "200"       "NA"

If we are formatting for a different locale, we could supply the locale
ID and let **gt** obtain a locale-specific set of spelled numbers:

    vec_fmt_spelled_num(num_vals, locale = "af")

    #> [1] "een"     "agt"     "drie-en-twintig"     "ses-en-sewentig"
    #> [5] "nul"     "-5"      "200"                 "NA"

As a last example, one can wrap the values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_spelled_num(num_vals, pattern = "{x}.")

    #> [1] "one."     "eight."     "twenty-three."  "seventy-six."  "zero."
    #> [6] "-5."      "200."       "NA"

## Function ID

15-12

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md).

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
[`vec_fmt_roman()`](https://gt.rstudio.com/reference/vec_fmt_roman.md),
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md),
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md)
