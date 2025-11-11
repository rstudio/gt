# Substitute small values in the table body

Wherever there is numerical data that are very small in value,
replacement text may be better for explanatory purposes.
`sub_small_vals()` allows for this replacement through specification of
a `threshold`, a `small_pattern`, and the sign of the values to be
considered. The substitution will occur for those values found to be
between `0` and the threshold value. This is possible for small positive
and small negative values (this can be explicitly set by the `sign`
option). Note that the interval does not include the `0` or the
`threshold` value. Should you need to include zero values, use
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md).

## Usage

``` r
sub_small_vals(
  data,
  columns = everything(),
  rows = everything(),
  threshold = 0.01,
  small_pattern = if (sign == "+") "<{x}" else md("<*abs*(-{x})"),
  sign = "+"
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

  The columns to which substitution operations are constrained. Can
  either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should form a constraint for targeting operations. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row IDs within
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

- threshold:

  *Threshold value*

  `scalar<numeric|integer>` // *default:* `0.01`

  The threshold value with which values should be considered small
  enough for replacement.

- small_pattern:

  *Pattern specification for small values*

  `scalar<character>` // *default:*
  `if (sign == "+") "<{x}" else md("<*abs*(-{x})")`

  The pattern text to be used in place of the suitably small values in
  the rendered table.

- sign:

  *Consider positive or negative values?*

  `scalar<character>` // *default:* `"+"`

  The sign of the numbers to be considered in the replacement. By
  default, we only consider positive values (`"+"`). The other option
  (`"-"`) can be used to consider only negative values.

## Value

An object of class `gt_tbl`.

## Examples

Let's generate a simple, single-column tibble that contains an
assortment of values that could potentially undergo some substitution.

    tbl <- dplyr::tibble(num = c(10^(-4:2), 0, NA))

    tbl
    #> # A tibble: 9 x 1
    #>        num
    #>      <dbl>
    #> 1   0.0001
    #> 2   0.001
    #> 3   0.01
    #> 4   0.1
    #> 5   1
    #> 6  10
    #> 7 100
    #> 8   0
    #> 9  NA

The `tbl` contains a variety of smaller numbers and some might be small
enough to reformat with a threshold value. With `sub_small_vals()` we
can do just that:

    tbl |>
      gt() |>
      fmt_number(columns = num) |>
      sub_small_vals()

![This image of a table was generated from the first code example in the
\`sub_small_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_small_vals_1.png)

Small and negative values can also be handled but they are handled
specially by the `sign` parameter. Setting that to `"-"` will format
only the small, negative values.

    tbl |>
      dplyr::mutate(num = -num) |>
      gt() |>
      fmt_number(columns = num) |>
      sub_small_vals(sign = "-")

![This image of a table was generated from the second code example in
the \`sub_small_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_small_vals_2.png)

You don't have to settle with the default `threshold` value or the
default replacement pattern (in `small_pattern`). This can be changed
and the `"{x}"` in `small_pattern` (which uses the `threshold` value)
can even be omitted.

    tbl |>
      gt() |>
      fmt_number(columns = num) |>
      sub_small_vals(
        threshold = 0.0005,
        small_pattern = "smol"
      )

![This image of a table was generated from the third code example in the
\`sub_small_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_small_vals_3.png)

## Function ID

3-34

## Function Introduced

`v0.6.0` (May 24, 2022)

## See also

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
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
