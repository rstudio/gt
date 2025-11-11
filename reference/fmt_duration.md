# Format numeric or duration values as styled time duration strings

Format input values to time duration values whether those input values
are numbers or of the `difftime` class. We can specify which time units
any numeric input values have (as weeks, days, hours, minutes, or
seconds) and the output can be customized with a duration style
(corresponding to narrow, wide, colon-separated, and ISO forms) and a
choice of output units ranging from weeks to seconds.

## Usage

``` r
fmt_duration(
  data,
  columns = everything(),
  rows = everything(),
  input_units = NULL,
  output_units = NULL,
  duration_style = c("narrow", "wide", "colon-sep", "iso"),
  trim_zero_units = TRUE,
  max_output_units = NULL,
  pattern = "{x}",
  use_seps = TRUE,
  sep_mark = ",",
  force_sign = FALSE,
  system = c("intl", "ind"),
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

- input_units:

  *Declaration of duration units for numerical values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  If one or more selected columns contains numeric values (not
  `difftime` values, which contain the duration units), a keyword must
  be provided for `input_units` for **gt** to determine how those values
  are to be interpreted in terms of duration. The accepted units are:
  `"seconds"`, `"minutes"`, `"hours"`, `"days"`, and `"weeks"`.

- output_units:

  *Choice of output units*

  `mult-kw:[weeks|days|hours|minutes|seconds]` // *default:* `NULL`
  (`optional`)

  Controls the output time units. The default, `NULL`, means that **gt**
  will automatically choose time units based on the input duration
  value. To control which time units are to be considered for output
  (before trimming with `trim_zero_units`) we can specify a vector of
  one or more of the following keywords: `"weeks"`, `"days"`, `"hours"`,
  `"minutes"`, or `"seconds"`.

- duration_style:

  *Style for representing duration values*

  `singl-kw:[narrow|wide|colon-sep|iso]` // *default:* `"narrow"`

  A choice of four formatting styles for the output duration values.
  With `"narrow"` (the default style), duration values will be formatted
  with single letter time-part units (e.g., 1.35 days will be styled as
  `"1d 8h 24m"`). With `"wide"`, this example value will be expanded to
  `"1 day 8 hours 24 minutes"` after formatting. The `"colon-sep"` style
  will put days, hours, minutes, and seconds in the
  `"([D]/)[HH]:[MM]:[SS]"` format. The `"iso"` style will produce a
  value that conforms to the ISO 8601 rules for duration values (e.g.,
  1.35 days will become `"P1DT8H24M"`).

- trim_zero_units:

  *Trimming of zero values*

  `scalar<logical>|mult-kw:[leading|trailing|internal]` // *default:*
  `TRUE`

  Provides methods to remove output time units that have zero values. By
  default this is `TRUE` and duration values that might otherwise be
  formatted as `"0w 1d 0h 4m 19s"` with `trim_zero_units = FALSE` are
  instead displayed as `"1d 4m 19s"`. Aside from using `TRUE`/`FALSE` we
  could provide a vector of keywords for more precise control. These
  keywords are: (1) `"leading"`, to omit all leading zero-value time
  units (e.g., `"0w 1d"` -\> `"1d"`), (2) `"trailing"`, to omit all
  trailing zero-value time units (e.g., `"3d 5h 0s"` -\> `"3d 5h"`), and
  `"internal"`, which removes all internal zero-value time units (e.g.,
  `"5d 0h 33m"` -\> `"5d 33m"`).

- max_output_units:

  *Maximum number of time units to display*

  `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)

  If `output_units` is `NULL`, where the output time units are
  unspecified and left to **gt** to handle, a numeric value provided for
  `max_output_units` will be taken as the maximum number of time units
  to display in all output time duration values. By default, this is
  `NULL` and all possible time units will be displayed. This option has
  no effect when `duration_style = "colon-sep"` (only `output_units` can
  be used to customize that type of duration output).

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

- use_seps:

  *Use digit group separators*

  `scalar<logical>` // *default:* `TRUE`

  An option to use digit group separators. The type of digit group
  separator is set by `sep_mark` and overridden if a locale ID is
  provided to `locale`. This setting is `TRUE` by default.

- sep_mark:

  *Separator mark for digit grouping*

  `scalar<character>` // *default:* `","`

  The string to use as a separator between groups of digits. For
  example, using `sep_mark = ","` with a value of `1000` would result in
  a formatted value of `"1,000"`. This argument is ignored if a `locale`
  is supplied (i.e., is not `NULL`).

- force_sign:

  *Forcing the display of a positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Should the positive sign be shown for positive values (effectively
  showing a sign for all values except zero)? If so, use `TRUE` for this
  option. By default only negative values will display a minus sign.

- system:

  *Numbering system for grouping separators*

  `singl-kw:[intl|ind]` // *default:* `"intl"`

  The international numbering system (keyword: `"intl"`) is widely used
  and its grouping separators (i.e., `sep_mark`) are always separated by
  three digits. The alternative system, the Indian numbering system
  (keyword: `"ind"`), uses grouping separators that correspond to
  thousand, lakh, crore, and higher quantities.

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

## Output units for the colon-separated duration style

The colon-separated duration style (enabled when
`duration_style = "colon-sep"`) is essentially a clock-based output
format which uses the display logic of chronograph watch functionality.
It will, by default, display duration values in the `(D/)HH:MM:SS`
format. Any duration values greater than or equal to 24 hours will have
the number of days prepended with an adjoining slash mark. While this
output format is versatile, it can be changed somewhat with the
`output_units` option. The following combinations of output units are
permitted:

- `c("minutes", "seconds")` -\> `MM:SS`

- `c("hours", "minutes")` -\> `HH:MM`

- `c("hours", "minutes", "seconds")` -\> `HH:MM:SS`

- `c("days", "hours", "minutes")` -\> `(D/)HH:MM`

Any other specialized combinations will result in the default set being
used, which is `c("days", "hours", "minutes", "seconds")`

## Compatibility of formatting function with data values

`fmt_duration()` is compatible with body cells that are of the
`"numeric"`, `"integer"`, or `"difftime"` types. Any other types of body
cells are ignored during formatting. This is to say that cells of
incompatible data types may be targeted, but there will be no attempt to
format them.

## Examples

Use part of the `sp500` table to create a **gt** table. Create a
`difftime`-based column and format the duration values to be displayed
as the number of days since March 30, 2020.

    sp500 |>
      dplyr::slice_head(n = 10) |>
      dplyr::mutate(
        time_point = lubridate::ymd("2020-03-30"),
        time_passed = difftime(time_point, date)
      ) |>
      dplyr::select(time_passed, open, close) |>
      gt(rowname_col = "month") |>
      fmt_duration(
        columns = time_passed,
        output_units = "days",
        duration_style = "wide"
      ) |>
      fmt_currency(columns = c(open, close))

![This image of a table was generated from the first code example in the
\`fmt_duration()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_duration_1.png)

## Function ID

3-17

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The vector-formatting version of this function:
[`vec_fmt_duration()`](https://gt.rstudio.com/reference/vec_fmt_duration.md).

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
