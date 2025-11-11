# Format values as dates

Format input values to time values using one of 41 preset date styles.
Input can be in the form of `POSIXt` (i.e., datetimes), the `Date` type,
or `character` (must be in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS` or
`YYYY-MM-DD`).

## Usage

``` r
fmt_date(
  data,
  columns = everything(),
  rows = everything(),
  date_style = "iso",
  pattern = "{x}",
  locale = NULL
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should undergo formatting. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row captions within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

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
  for a useful reference for all of the locales that are supported. A
  locale ID can be also set in the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function call (where
  it would be used automatically by any function with a `locale`
  argument) but a `locale` value provided here will override that global
  locale.

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_date()` is compatible with body cells that are of the `"Date"`,
`"POSIXt"` or `"character"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_date()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `date_style`

- `pattern`

- `locale`

Please note that for each of the aforementioned arguments, a
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) call
needs to reference a column that has data of the correct type (this is
different for each argument). Additional columns for parameter values
can be generated with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (if not
already present). Columns that contain parameter data can also be hidden
from final display with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md). Finally,
there is no limitation to how many arguments the
[`from_column()`](https://gt.rstudio.com/reference/from_column.md)
helper is applied so long as the arguments belong to this closed set.

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

## Adapting output to a specific `locale`

This formatting function can adapt outputs according to a provided
`locale` value. Examples include `"en"` for English (United States) and
`"fr"` for French (France). Note that a `locale` value provided here
will override any global locale setting performed in
[`gt()`](https://gt.rstudio.com/reference/gt.md)'s own `locale` argument
(it is settable there as a value received by all other functions that
have a `locale` argument). As a useful reference on which locales are
supported, we can call
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`date` and `time` columns). With `fmt_date()`, we'll format the `date`
column to display dates formatted with the `"month_day_year"` date
style.

    exibble |>
      dplyr::select(date, time) |>
      gt() |>
      fmt_date(
        columns = date,
        date_style = "month_day_year"
      )

![This image of a table was generated from the first code example in the
\`fmt_date()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_date_1.png)

Again using the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset, let's format the `date` column to have mixed date formats,
where dates after April 1st will be different than the others because of
the expressions used in the `rows` argument. This will involve two calls
of `fmt_date()` with different statements provided for `rows`. In the
first call (dates after the 1st of April) the date style `"m_day_year"`
is used; for the second call, `"day_m_year"` is the named date style
supplied to `date_style`.

    exibble |>
      dplyr::select(date, time) |>
      gt() |>
      fmt_date(
        columns = date,
        rows = as.Date(date) > as.Date("2015-04-01"),
        date_style = "m_day_year"
      ) |>
      fmt_date(
        columns = date,
        rows = as.Date(date) <= as.Date("2015-04-01"),
        date_style = "day_m_year"
      )

![This image of a table was generated from the second code example in
the \`fmt_date()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_date_2.png)

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a single-column **gt** table (with only the `date` column).
Format the date values using the `"yMMMEd"` date style (which is one of
the 'flexible' styles). Also, we'll set the locale to `"nl"` to get the
dates in Dutch.

    exibble |>
      dplyr::select(date) |>
      gt() |>
      fmt_date(
        date_style = "yMMMEd",
        locale = "nl"
      )

![This image of a table was generated from the third code example in the
\`fmt_date()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_date_3.png)

## Function ID

3-14

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md).

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
[`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md),
[`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md),
[`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md),
[`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md),
[`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md),
[`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md),
[`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md),
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md),
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
[`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md),
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md),
[`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md),
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md),
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md),
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
