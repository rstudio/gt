# Supply a custom currency symbol to `fmt_currency()`

The `currency()` helper function makes it easy to specify a
context-aware currency symbol to `currency` argument of
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md).
Since **gt** can render tables to several output formats, `currency()`
allows for different variations of the custom symbol based on the output
context (which are `html`, `latex`, `rtf`, and `default`). The number of
decimal places for the custom currency defaults to `2`, however, a value
set for the `decimals` argument of
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)
will take precedence.

## Usage

``` r
currency(..., .list = list2(...))
```

## Arguments

- ...:

  *Currency symbols by output context*

  `<named arguments>` // **required** (or, use `.list`)

  One or more named arguments using output contexts as the names and
  currency symbol text as the values.

- .list:

  *Alternative to `...`*

  `<list of multiple expressions>` // **required** (or, use `...`)

  Allows for the use of a list as an input alternative to `...`.

## Value

A list object of class `gt_currency`.

## Details

We can use any combination of `html`, `latex`, `rtf`, and `default` as
named arguments for the currency text in each of the namesake contexts.
The `default` value is used as a fallback when there doesn't exist a
dedicated currency text value for a particular output context (e.g.,
when a table is rendered as HTML and we use
`currency(latex = "LTC", default = "ltc")`, the currency symbol will be
`"ltc"`. For convenience, if we provide only a single string without a
name, it will be taken as the `default` (i.e., `currency("ltc")` is
equivalent to `currency(default = "ltc")`). However, if we were to
specify currency strings for multiple output contexts, names are
required each and every context.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. Within the
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md)
call, we'll format the `currency` column to have currency values in
guilder (a defunct Dutch currency). We can register this custom currency
with the `currency()` helper function, supplying the `"&fnof;"` HTML
entity for `html` outputs and using `"f"` for any other type of **gt**
output.

    exibble |>
      gt() |>
      fmt_currency(
        columns = currency,
        currency = currency(
          html = "&fnof;",
          default = "f"
        ),
        decimals = 2
      )

![This image of a table was generated from the first code example in the
\`currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_currency_1.png)

## Function ID

8-6

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
[`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md),
[`from_column()`](https://gt.rstudio.com/reference/from_column.md),
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
