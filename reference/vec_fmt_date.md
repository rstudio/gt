# Format a vector as date values

Format vector values to date values using one of 41 preset date styles.
Input can be in the form of `POSIXt` (i.e., datetimes), the `Date` type,
or `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
`YYYY-MM-DD`).

## Usage

``` r
vec_fmt_date(
  x,
  date_style = "iso",
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

- date_style:

  *Predefined style for dates*

  `scalar<character>|scalar<numeric|integer>(1<=val<=41)` // *default:*
  `"iso"`

  The date style to use. By default this is the short name `"iso"` which
  corresponds to ISO 8601 date formatting. There are 41 date styles in
  total and their short names can be viewed using
  [`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md).

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

## Formatting with the `date_style` argument

We need to supply a preset date style to the `date_style` argument. The
date styles are numerous and can handle localization to any supported
locale. A large segment of date styles are termed flexible date formats
and this means that their output will adapt to any `locale` provided.
That feature makes the flexible date formats a better option for locales
other than `"en"` (the default locale).

The following table provides a listing of all date styles and their
output values (corresponding to an input date of `2000-02-29`).

|     |                         |                                |          |
|-----|-------------------------|--------------------------------|----------|
|     | Date Style              | Output                         | Notes    |
| 1   | `"iso"`                 | `"2000-02-29"`                 | ISO 8601 |
| 2   | `"wday_month_day_year"` | `"Tuesday, February 29, 2000"` |          |
| 3   | `"wd_m_day_year"`       | `"Tue, Feb 29, 2000"`          |          |
| 4   | `"wday_day_month_year"` | `"Tuesday 29 February 2000"`   |          |
| 5   | `"month_day_year"`      | `"February 29, 2000"`          |          |
| 6   | `"m_day_year"`          | `"Feb 29, 2000"`               |          |
| 7   | `"day_m_year"`          | `"29 Feb 2000"`                |          |
| 8   | `"day_month_year"`      | `"29 February 2000"`           |          |
| 9   | `"day_month"`           | `"29 February"`                |          |
| 10  | `"day_m"`               | `"29 Feb"`                     |          |
| 11  | `"year"`                | `"2000"`                       |          |
| 12  | `"month"`               | `"February"`                   |          |
| 13  | `"day"`                 | `"29"`                         |          |
| 14  | `"year.mn.day"`         | `"2000/02/29"`                 |          |
| 15  | `"y.mn.day"`            | `"00/02/29"`                   |          |
| 16  | `"year_week"`           | `"2000-W09"`                   |          |
| 17  | `"year_quarter"`        | `"2000-Q1"`                    |          |
| 18  | `"yMd"`                 | `"2/29/2000"`                  | flexible |
| 19  | `"yMEd"`                | `"Tue, 2/29/2000"`             | flexible |
| 20  | `"yMMM"`                | `"Feb 2000"`                   | flexible |
| 21  | `"yMMMM"`               | `"February 2000"`              | flexible |
| 22  | `"yMMMd"`               | `"Feb 29, 2000"`               | flexible |
| 23  | `"yMMMEd"`              | `"Tue, Feb 29, 2000"`          | flexible |
| 24  | `"GyMd"`                | `"2/29/2000 A"`                | flexible |
| 25  | `"GyMMMd"`              | `"Feb 29, 2000 AD"`            | flexible |
| 26  | `"GyMMMEd"`             | `"Tue, Feb 29, 2000 AD"`       | flexible |
| 27  | `"yM"`                  | `"2/2000"`                     | flexible |
| 28  | `"Md"`                  | `"2/29"`                       | flexible |
| 29  | `"MEd"`                 | `"Tue, 2/29"`                  | flexible |
| 30  | `"MMMd"`                | `"Feb 29"`                     | flexible |
| 31  | `"MMMEd"`               | `"Tue, Feb 29"`                | flexible |
| 32  | `"MMMMd"`               | `"February 29"`                | flexible |
| 33  | `"GyMMM"`               | `"Feb 2000 AD"`                | flexible |
| 34  | `"yQQQ"`                | `"Q1 2000"`                    | flexible |
| 35  | `"yQQQQ"`               | `"1st quarter 2000"`           | flexible |
| 36  | `"Gy"`                  | `"2000 AD"`                    | flexible |
| 37  | `"y"`                   | `"2000"`                       | flexible |
| 38  | `"M"`                   | `"2"`                          | flexible |
| 39  | `"MMM"`                 | `"Feb"`                        | flexible |
| 40  | `"d"`                   | `"29"`                         | flexible |
| 41  | `"Ed"`                  | `"29 Tue"`                     | flexible |

We can call
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
in the console to view a similar table of date styles with example
output.

## Examples

Let's create a character vector of dates in the ISO-8601 format for the
next few examples:

    str_vals <- c("2022-06-13", "2019-01-25", "2015-03-23", NA)

Using `vec_fmt_date()` (here with the `"wday_month_day_year"` date
style) will result in a character vector of formatted dates. Any `NA`
values remain as `NA` values. The rendering context will be autodetected
unless specified in the `output` argument (here, it is of the `"plain"`
output type).

    vec_fmt_date(str_vals, date_style = "wday_month_day_year")

    #> [1] "Monday, June 13, 2022" "Friday, January 25, 2019"
    #> [3] "Monday, March 23, 2015" NA

We can choose from any of 41 different date formatting styles. Many of
these styles are flexible, meaning that the structure of the format will
adapt to different locales. Let's use the `"yMMMEd"` date style to
demonstrate this (first in the default locale of `"en"`):

    vec_fmt_date(str_vals, date_style = "yMMMEd")

    #> [1] "Mon, Jun 13, 2022" "Fri, Jan 25, 2019" "Mon, Mar 23, 2015" NA

Let's perform the same type of formatting in the French (`"fr"`) locale:

    vec_fmt_date(str_vals, date_style = "yMMMEd", locale = "fr")

    #> [1] "lun. 13 juin 2022" "ven. 25 janv. 2019" "lun. 23 mars 2015" NA

We can always use
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md)
to call up an info table that serves as a handy reference to all of the
`date_style` options.

As a last example, one can wrap the date values in a pattern with the
`pattern` argument. Note here that `NA` values won't have the pattern
applied.

    vec_fmt_date(str_vals, pattern = "Date: {x}")

    #> [1] "Date: 2022-06-13" "Date: 2019-01-25" "Date: 2015-03-23" NA

## Function ID

15-14

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
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
