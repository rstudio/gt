# Format a vector of numeric or duration values as styled time duration strings

Format input values to time duration values whether those input values
are numbers or of the `difftime` class. We can specify which time units
any numeric input values have (as weeks, days, hours, minutes, or
seconds) and the output can be customized with a duration style
(corresponding to narrow, wide, colon-separated, and ISO forms) and a
choice of output units ranging from weeks to seconds.

## Usage

``` r
vec_fmt_duration(
  x,
  input_units = NULL,
  output_units = NULL,
  duration_style = c("narrow", "wide", "colon-sep", "iso"),
  trim_zero_units = TRUE,
  max_output_units = NULL,
  pattern = "{x}",
  use_seps = TRUE,
  sep_mark = ",",
  force_sign = FALSE,
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

## Examples

Let's create a `difftime`-based vector for the next few examples:

    difftimes <-
      difftime(
        lubridate::ymd("2017-01-15"),
        lubridate::ymd(c("2015-06-25", "2016-03-07", "2017-01-10"))
      )

Using `vec_fmt_duration()` with its defaults provides us with a succinct
vector of formatted durations.

    vec_fmt_duration(difftimes)

    #> [1] "81w 3d" "44w 6d" "5d"

We can elect to use just only the time units of days to describe the
duration values.

    vec_fmt_duration(difftimes, output_units = "days")

    #> [1] "570d" "314d" "5d"

We can also use numeric values in the input vector `vec_fmt_duration()`.
Here's a numeric vector for use with examples:

    num_vals <- c(3.235, 0.23, 0.005, NA)

The necessary thing with numeric values as an input is defining what
time unit those values have.

    vec_fmt_duration(num_vals, input_units = "days")

    #> [1] "3d 5h 38m 24s" "5h 31m 12s" "7m 12s" "NA"

We can define a set of output time units that we want to see.

    vec_fmt_duration(
      num_vals,
      input_units = "days",
      output_units = c("hours", "minutes")
    )

    #> [1] "77h 38m" "5h 31m" "7m" "NA"

There are many duration 'styles' to choose from. We could opt for the
`"wide"` style.

    vec_fmt_duration(
      num_vals,
      input_units = "days",
      duration_style = "wide"
    )

    #> [1] "3 days 5 hours 38 minutes 24 seconds"
    #> [2] "5 hours 31 minutes 12 seconds"
    #> [3] "7 minutes 12 seconds"
    #> [4] "NA"

We can always perform locale-specific formatting with
`vec_fmt_duration()`. Let's attempt the same type of duration formatting
as before with the `"nl"` locale.

    vec_fmt_duration(
      num_vals,
      input_units = "days",
      duration_style = "wide",
      locale = "nl"
    )

    #> [1] "3 dagen 5 uur 38 minuten 24 seconden"
    #> [2] "5 uur 31 minuten 12 seconden"
    #> [3] "7 minuten 12 seconden"
    #> [4] "NA"

## Function ID

15-17

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

The variant function intended for formatting **gt** table data:
[`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md).

Other vector formatting functions:
[`vec_fmt_bytes()`](https://gt.rstudio.com/reference/vec_fmt_bytes.md),
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md),
[`vec_fmt_date()`](https://gt.rstudio.com/reference/vec_fmt_date.md),
[`vec_fmt_datetime()`](https://gt.rstudio.com/reference/vec_fmt_datetime.md),
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
