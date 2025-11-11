# Format a vector as time values

Format vector values to time values using one of 25 preset time styles.
Input can be in the form of `POSIXt` (i.e., datetimes), `character`
(must be in the ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`),
or `Date` (which always results in the formatting of `00:00:00`).

## Usage

``` r
vec_fmt_time(
  x,
  time_style = "iso",
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

- time_style:

  *Predefined style for times*

  `scalar<character>|scalar<numeric|integer>(1<=val<=25)` // *default:*
  `"iso"`

  The time style to use. By default this is the short name `"iso"` which
  corresponds to how times are formatted within ISO 8601 datetime
  values. There are 25 time styles in total and their short names can be
  viewed using
  [`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md).

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

## Formatting with the `time_style` argument

We need to supply a preset time style to the `time_style` argument.
There are many time styles and all of them can handle localization to
any supported locale. Many of the time styles are termed flexible time
formats and this means that their output will adapt to any `locale`
provided. That feature makes the flexible time formats a better option
for locales other than `"en"` (the default locale).

The following table provides a listing of all time styles and their
output values (corresponding to an input time of `14:35:00`). It is
noted which of these represent 12- or 24-hour time.

|     |               |                                  |               |
|-----|---------------|----------------------------------|---------------|
|     | Time Style    | Output                           | Notes         |
| 1   | `"iso"`       | `"14:35:00"`                     | ISO 8601, 24h |
| 2   | `"iso-short"` | `"14:35"`                        | ISO 8601, 24h |
| 3   | `"h_m_s_p"`   | `"2:35:00 PM"`                   | 12h           |
| 4   | `"h_m_p"`     | `"2:35 PM"`                      | 12h           |
| 5   | `"h_p"`       | `"2 PM"`                         | 12h           |
| 6   | `"Hms"`       | `"14:35:00"`                     | flexible, 24h |
| 7   | `"Hm"`        | `"14:35"`                        | flexible, 24h |
| 8   | `"H"`         | `"14"`                           | flexible, 24h |
| 9   | `"EHm"`       | `"Thu 14:35"`                    | flexible, 24h |
| 10  | `"EHms"`      | `"Thu 14:35:00"`                 | flexible, 24h |
| 11  | `"Hmsv"`      | `"14:35:00 GMT+00:00"`           | flexible, 24h |
| 12  | `"Hmv"`       | `"14:35 GMT+00:00"`              | flexible, 24h |
| 13  | `"hms"`       | `"2:35:00 PM"`                   | flexible, 12h |
| 14  | `"hm"`        | `"2:35 PM"`                      | flexible, 12h |
| 15  | `"h"`         | `"2 PM"`                         | flexible, 12h |
| 16  | `"Ehm"`       | `"Thu 2:35 PM"`                  | flexible, 12h |
| 17  | `"Ehms"`      | `"Thu 2:35:00 PM"`               | flexible, 12h |
| 18  | `"EBhms"`     | `"Thu 2:35:00 in the afternoon"` | flexible, 12h |
| 19  | `"Bhms"`      | `"2:35:00 in the afternoon"`     | flexible, 12h |
| 20  | `"EBhm"`      | `"Thu 2:35 in the afternoon"`    | flexible, 12h |
| 21  | `"Bhm"`       | `"2:35 in the afternoon"`        | flexible, 12h |
| 22  | `"Bh"`        | `"2 in the afternoon"`           | flexible, 12h |
| 23  | `"hmsv"`      | `"2:35:00 PM GMT+00:00"`         | flexible, 12h |
| 24  | `"hmv"`       | `"2:35 PM GMT+00:00"`            | flexible, 12h |
| 25  | `"ms"`        | `"35:00"`                        | flexible      |

We can call
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
in the console to view a similar table of time styles with example
output.

## Examples

Let's create a character vector of datetime values in the ISO-8601
format for the next few examples:

    str_vals <- c("2022-06-13 18:36", "2019-01-25 01:08", NA)

Using `vec_fmt_time()` (here with the `"iso-short"` time style) will
result in a character vector of formatted times. Any `NA` values remain
as `NA` values. The rendering context will be autodetected unless
specified in the `output` argument (here, it is of the `"plain"` output
type).

    vec_fmt_time(str_vals, time_style = "iso-short")

    #> [1] "18:36" "01:08" NA

We can choose from any of 25 different time formatting styles. Many of
these styles are flexible, meaning that the structure of the format will
adapt to different locales. Let's use the `"Bhms"` time style to
demonstrate this (first in the default locale of `"en"`):

    vec_fmt_time(str_vals, time_style = "Bhms")

    #> [1] "6:36:00 in the evening" "1:08:00 at night" NA

Let's perform the same type of formatting in the German (`"de"`) locale:

    vec_fmt_time(str_vals, time_style = "Bhms", locale = "de")

    #> [1] "6:36:00 abends" "1:08:00 nachts" NA

We can always use
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
to call up an info table that serves as a handy reference to all of the
`time_style` options.

As a last example, one can wrap the time values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_time(
      str_vals,
      time_style = "hm",
      pattern = "temps: {x}",
      locale = "fr-CA"
    )

    #> [1] "temps: 6:36 PM" "temps: 1:08 AM" NA

## Function ID

15-15

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md).

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
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md)
