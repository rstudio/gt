# Format column data containing bin/interval information

When using [`cut()`](https://rdrr.io/r/base/cut.html) (or other
functions that use it in some way) you get bins that can look like this:
`"(0,10]"`, `"(10,15]"`, `"(15,20]"`, `"(20,40]"`. This interval
notation expresses the lower and upper limits of each range. The square
or round brackets define whether each of the endpoints are included in
the range (`[`/`]` for inclusion, `(`/`)` for exclusion). Should bins of
this sort be present in a table, the `fmt_bins()` function can be used
to format that syntax to a form that presents better in a display table.
It's possible to format the values of the intervals with the `fmt`
argument, and, the separator can be modified with the `sep` argument.

## Usage

``` r
fmt_bins(
  data,
  columns = everything(),
  rows = everything(),
  sep = "--",
  fmt = NULL
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

- sep:

  *Separator between values*

  `scalar<character>` // *default:* `"--"`

  The separator text that indicates the values are ranged. The default
  value of `"--"` indicates that an en dash will be used for the range
  separator. Using `"---"` will be taken to mean that an em dash should
  be used. Should you want these special symbols to be taken literally,
  they can be supplied within
  [`base::I()`](https://rdrr.io/r/base/AsIs.html).

- fmt:

  *Formatting expressions*

  `<single expression>` // *default:* `NULL` (`optional`)

  An optional formatting expression in formula form. If used, the RHS of
  `~` should contain a formatting call (e.g.,
  `~ fmt_number(., decimals = 3, use_seps = FALSE`).

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_bins()` is compatible with body cells that are of the `"character"`
or `"factor"` types. Any other types of body cells are ignored during
formatting. This is to say that cells of incompatible data types may be
targeted, but there will be no attempt to format them.

## Formatting expressions for `fmt`

We can supply a one-sided (RHS only) expression to `fmt`, and, several
can be provided in a list. The expression uses a formatting function
(e.g., [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
etc.) and it must contain an initial `.` that stands for the data
object. If performing numeric formatting it might look something like
this:

`fmt = ~ fmt_number(., decimals = 1, use_seps = FALSE)`

## Examples

Use the [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
dataset to create a **gt** table. Before even getting to the
[`gt()`](https://gt.rstudio.com/reference/gt.md) call, we use
[`cut()`](https://rdrr.io/r/base/cut.html) in conjunction with
[`scales::breaks_log()`](https://scales.r-lib.org/reference/breaks_log.html)
to create some highly customized bins. Consequently each country's
population in the 2021 year is assigned to a bin. These bins have a
characteristic type of formatting that can be used as input to
`fmt_bins()`, and using that formatting function allows us to customize
the presentation of those ranges. For instance, here we are formatting
the left and right values of the ranges with
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md)
(using formula syntax).

    countrypops |>
      dplyr::filter(year == 2021) |>
      dplyr::select(country_code_2, population) |>
      dplyr::mutate(population_class = cut(
        population,
        breaks = scales::breaks_log(n = 20)(population)
        )
      ) |>
      dplyr::group_by(population_class) |>
      dplyr::summarize(
        count = dplyr::n(),
        countries = paste0(country_code_2, collapse = ",")
      ) |>
      dplyr::arrange(desc(population_class)) |>
      gt() |>
      fmt_flag(columns = countries) |>
      fmt_bins(
        columns = population_class,
        fmt = ~ fmt_integer(., suffixing = TRUE)
      ) |>
      cols_label(
        population_class = "Population Range",
        count = "",
        countries = "Countries"
      ) |>
      cols_width(
        population_class ~ px(150),
        count ~ px(50)
      ) |>
      tab_style(
        style = cell_text(style = "italic"),
        locations = cells_body(columns = count)
      )

![This image of a table was generated from the first code example in the
\`fmt_bins()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_bins_1.png)

## Function ID

3-18

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
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
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
