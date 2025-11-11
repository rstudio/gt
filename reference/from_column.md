# Reference a column of values for certain parameters

It can be useful to obtain parameter values from a column in a **gt**
for functions that operate on the table body and stub cells. For
example, you might want to indent row labels in the stub. You could call
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)
and indent different rows to various indentation levels. However, each
level of indentation applied necessitates a new call of that function.
To make this better, we can use indentation values available in a table
column via the `from_column()` helper function. For the
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)
case, you'd invoke this helper at the `indent` argument and specify the
column that has the values.

## Usage

``` r
from_column(column, na_value = NULL, fn = NULL)
```

## Arguments

- column:

  *Column name*

  `scalar<character>` // **required**

  A single column name in quotation marks. Values will be extracted from
  this column and provided to compatible arguments.

- na_value:

  *Default replacement for `NA` values*

  `scalar<character|numeric|logical>` // *default:* `NULL` (`optional`)

  A single value to replace any `NA` values in the `column`. Take care
  to provide a value that is of the same type as the `column` values to
  avoid any undesirable coercion.

- fn:

  *Function to apply*

  `function|formula` // *default:* `NULL` (`optional`)

  If a function is provided here, any values extracted from the table
  `column` (except `NA` values) can be mutated.

## Value

A list object of class `gt_column`.

## Functions that allow the use of the `from_column()` helper

Only certain functions (and furthermore a subset of arguments within
each) support the use of `from_column()` for accessing varying parameter
values. These functions are:

- [`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)

- [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md)

- [`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md)

- [`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)

- [`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md)

- [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md)

- [`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md)

- [`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md)

- [`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)

- [`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md)

- [`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md)

- [`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md)

- [`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md)

- [`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md)

- [`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md)

- [`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md)

- [`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md)

- [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md)

- [`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md)

- [`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md)

- [`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md)

Within help documents for each of these functions you'll find the
*Compatibility of arguments with the `from_column()` helper function*
section and sections like these describe which arguments support the use
of `from_column()`.

## Examples

`from_column()` can be used in a variety of formatting functions so that
values for common options don't have to be static, they can change in
every row (so long as you have a column of compatible option values).
Here's an example where we have a table of repeating numeric values
along with a column of currency codes. We can format the numbers to
currencies with
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md) and
use `from_column()` to reference the column of currency codes, giving us
values that are each formatted as having a different currency.

    dplyr::tibble(
      amount = rep(30.75, 6),
      curr = c("USD", "EUR", "GBP", "CAD", "AUD", "JPY"),
    ) |>
      gt() |>
      fmt_currency(currency = from_column(column = "curr"))

![This image of a table was generated from the first code example in the
\`from_column()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_from_column_1.png)

Let's summarize the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to get a
set of rankings of car manufacturer by country of origin. The `n` column
represents the number of cars a manufacturer has within this dataset and
we can use that column as a way to size the text. We do that in the
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) call; the
`from_column()` function is used within the
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) statement
to fashion different font sizes from that `n` column. This is done in
conjunction with the `fn` argument of `from_column()`, which helps to
tweak the values in `n` to get a useful range of font sizes.

    gtcars |>
      dplyr::count(mfr, ctry_origin) |>
      dplyr::arrange(ctry_origin) |>
      gt(groupname_col = "ctry_origin") |>
      tab_style(
        style = cell_text(
          size = from_column(
            column = "n",
            fn = function(x) paste0(5 + (x * 3), "px")
          )
        ),
        locations = cells_body()
      ) |>
      tab_style(
        style = cell_text(align = "center"),
        locations = cells_row_groups()
      ) |>
      cols_hide(columns = n) |>
      tab_options(column_labels.hidden = TRUE) |>
      opt_all_caps() |>
      opt_vertical_padding(scale = 0.25) |>
      cols_align(align = "center", columns = mfr)

![This image of a table was generated from the second code example in
the \`from_column()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_from_column_2.png)

## Function ID

8-5

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`currency()`](https://gt.rstudio.com/reference/currency.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
[`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md),
[`google_font()`](https://gt.rstudio.com/reference/google_font.md),
[`gt_latex_dependencies()`](https://gt.rstudio.com/reference/gt_latex_dependencies.md),
[`html()`](https://gt.rstudio.com/reference/html.md),
[`latex()`](https://gt.rstudio.com/reference/latex.md),
[`md()`](https://gt.rstudio.com/reference/md.md),
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
