# Substitute targeted values in the table body

Should you need to replace specific cell values with custom text,
`sub_values()` can be good choice. We can target cells for replacement
through value, regex, and custom matching rules.

## Usage

``` r
sub_values(
  data,
  columns = everything(),
  rows = everything(),
  values = NULL,
  pattern = NULL,
  fn = NULL,
  replacement = NULL,
  escape = TRUE
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

- values:

  *Values to match on*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The specific value or values that should be replaced with a
  `replacement` value. If `pattern` is also supplied then `values` will
  be ignored.

- pattern:

  *Regex pattern to match with*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A regex pattern that can target solely those values in
  `character`-based columns. If `values` is also supplied, `pattern`
  will take precedence.

- fn:

  *Function to return logical values*

  `<function>` // *default:* `NULL` (`optional`)

  A supplied function that operates on `x` (the data in a column) and
  should return a logical vector that matches the length of `x` (i.e.,
  number of rows in the input table). If either of `values` or `pattern`
  is also supplied, `fn` will take precedence.

- replacement:

  *Replacement value for matches*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The replacement value for any cell values matched by either `values`
  or `pattern`. Must be a character or numeric vector of length 1.

- escape:

  *Text escaping*

  `scalar<logical>` // *default:* `TRUE`

  An option to escape replacement text according to the final output
  format of the table. For example, if a LaTeX table is to be generated
  then LaTeX escaping would be performed on the replacements during
  rendering. By default this is set to `TRUE` but setting to `FALSE`
  would be useful in the case where replacement text is crafted for a
  specific output format in mind.

## Value

An object of class `gt_tbl`.

## Examples

Let's create an input table with three columns. This contains an
assortment of values that could potentially undergo some substitution
via `sub_values()`.

    tbl <-
      dplyr::tibble(
        num_1 = c(-0.01, 74, NA, 0, 500, 0.001, 84.3),
        int_1 = c(1L, -100000L, 800L, 5L, NA, 1L, -32L),
        lett = LETTERS[1:7]
      )

    tbl
    #> # A tibble: 7 x 3
    #>     num_1   int_1 lett
    #>     <dbl>   <int> <chr>
    #> 1  -0.01        1 A
    #> 2  74     -100000 B
    #> 3  NA         800 C
    #> 4   0           5 D
    #> 5 500          NA E
    #> 6   0.001       1 F
    #> 7  84.3       -32 G

Values in the table body cells can be replaced by specifying which
values should be replaced (in `values`) and what the replacement value
should be. It's okay to search for numerical or character values across
all columns and the replacement value can also be of the `numeric` or
`character` types.

    tbl |>
      gt() |>
      sub_values(values = c(74, 500), replacement = 150) |>
      sub_values(values = "B", replacement = "Bee") |>
      sub_values(values = 800, replacement = "Eight hundred")

![This image of a table was generated from the first code example in the
\`sub_values()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_values_1.png)

We can also use the `pattern` argument to target cell values for
replacement in `character`-based columns.

    tbl |>
      gt() |>
      sub_values(pattern = "A|C|E", replacement = "Ace")

![This image of a table was generated from the second code example in
the \`sub_values()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_values_2.png)

For the most flexibility, it's best to use the `fn` argument. With that
you need to ensure that the function you provide will return a logical
vector when invoked on a column of cell values, taken as `x` (and, the
length of that vector must match the length of `x`).

    tbl |>
      gt() |>
      sub_values(
        fn = function(x) x >= 0 & x < 50,
        replacement = "Between 0 and 50"
      )

![This image of a table was generated from the third code example in the
\`sub_values()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_sub_values_3.png)

## Function ID

3-36

## Function Introduced

`v0.8.0` (November 16, 2022)

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
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
