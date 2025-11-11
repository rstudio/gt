# Format values as times

Format input values to time values using one of 25 preset time styles.
Input can be in the form of `POSIXt` (i.e., datetimes), `character`
(must be in the ISO 8601 forms of `HH:MM:SS` or `YYYY-MM-DD HH:MM:SS`),
or `Date` (which always results in the formatting of `00:00:00`).

## Usage

``` r
fmt_time(
  data,
  columns = everything(),
  rows = everything(),
  time_style = "iso",
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
  for a useful reference for all of the locales that are supported. A
  locale ID can be also set in the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function call (where
  it would be used automatically by any function with a `locale`
  argument) but a `locale` value provided here will override that global
  locale.

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_time()` is compatible with body cells that are of the `"Date"`,
`"POSIXt"` or `"character"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_time()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `time_style`

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

## Adapting output to a specific `locale`

This formatting function can adapt outputs according to a provided
`locale` value. Examples include `"en"` for English (United States) and
`"fr"` for French (France). Note that a `locale` value provided here
will override any global locale setting performed in
[`gt()`](https://gt.rstudio.com/reference/gt.md)'s own `locale` argument
(it is settable there as a value received by all other functions that
have a `locale` argument). As a useful reference on which locales are
supported, we can use
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`date` and `time` columns). Format the `time` column with `fmt_time()`
to display times formatted with the `"h_m_s_p"` time style.

    exibble |>
      dplyr::select(date, time) |>
      gt() |>
      fmt_time(
        columns = time,
        time_style = "h_m_s_p"
      )

![This image of a table was generated from the first code example in the
\`fmt_time()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_1.png)

Again using the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset, let's format the `time` column to have mixed time formats,
where times after 16:00 will be different than the others because of the
expressions used in the `rows` argument. This will involve two calls of
`fmt_time()` with different statements provided for `rows`. In the first
call (times after 16:00) the time style `"h_m_s_p"` is used; for the
second call, `"h_m_p"` is the named time style supplied to `time_style`.

    exibble |>
      dplyr::select(date, time) |>
      gt() |>
      fmt_time(
        columns = time,
        rows = time > "16:00",
        time_style = "h_m_s_p"
      ) |>
      fmt_time(
        columns = time,
        rows = time <= "16:00",
        time_style = "h_m_p"
      )

![This image of a table was generated from the second code example in
the \`fmt_time()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_2.png)

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a single-column **gt** table (with only the `time` column).
Format the time values using the `"EBhms"` time style (which is one of
the 'flexible' styles). Also, we'll set the locale to `"sv"` to get the
times in Swedish.

    exibble |>
      dplyr::select(time) |>
      gt() |>
      fmt_time(
        columns = time,
        time_style = "EBhms",
        locale = "sv"
      )

![This image of a table was generated from the third code example in the
\`fmt_time()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_time_3.png)

## Function ID

3-15

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_time()`](https://gt.rstudio.com/reference/vec_fmt_time.md).

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
[`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
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
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
