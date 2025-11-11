# Substitute large values in the table body

Wherever there are numerical data that are very large in value,
replacement text may be better for explanatory purposes.
`sub_large_vals()` allows for this replacement through specification of
a `threshold`, a `large_pattern`, and the sign (positive or negative) of
the values to be considered.

## Usage

``` r
sub_large_vals(
  data,
  columns = everything(),
  rows = everything(),
  threshold = 1e+12,
  large_pattern = ">={x}",
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

  `scalar<numeric|integer>` // *default:* `1E12`

  The threshold value with which values should be considered large
  enough for replacement.

- large_pattern:

  *Pattern specification for large values*

  `scalar<character>` // *default:* `">={x}"`

  The pattern text to be used in place of the suitably large values in
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

    tbl <- dplyr::tibble(num = c(0, NA, 10^(8:14)))

    tbl
    #> # A tibble: 9 x 1
    #>     num
    #>   <dbl>
    #> 1  0
    #> 2 NA
    #> 3  1e 8
    #> 4  1e 9
    #> 5  1e10
    #> 6  1e11
    #> 7  1e12
    #> 8  1e13
    #> 9  1e14

The `tbl` object contains a variety of larger numbers and some might be
larger enough to reformat with a threshold value. With
`sub_large_vals()` we can do just that:

    tbl |>
      gt() |>
      fmt_number(columns = num) |>
      sub_large_vals()

![This image of a table was generated from the first code example in the
\`sub_large_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_large_vals_1.png)

Large negative values can also be handled but they are handled specially
by the `sign` parameter. Setting that to `"-"` will format only the
large values that are negative. Notice that with the default
`large_pattern` value of `">={x}"` the `">="` is automatically changed
to `"<="`.

    tbl |>
      dplyr::mutate(num = -num) |>
      gt() |>
      fmt_number(columns = num) |>
      sub_large_vals(sign = "-")

![This image of a table was generated from the second code example in
the \`sub_large_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_large_vals_2.png)

You don't have to settle with the default `threshold` value or the
default replacement pattern (in `large_pattern`). This can be changed
and the `"{x}"` in `large_pattern` (which uses the `threshold` value)
can even be omitted.

    tbl |>
      gt() |>
      fmt_number(columns = num) |>
      sub_large_vals(
        threshold = 5E10,
        large_pattern = "hugemongous"
      )

![This image of a table was generated from the third code example in the
\`sub_large_vals()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_large_vals_3.png)

## Function ID

3-35

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
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
