# Interpret input text as LaTeX-formatted text

For certain pieces of text (like in column labels or table headings) we
may want to express them as raw LaTeX. In fact, with LaTeX, so much more
can be done for formatting. The `latex()` function will guard the input
LaTeX from being escaped.

## Usage

``` r
latex(text)
```

## Arguments

- text:

  *LaTeX text*

  `scalar<character>` // **required**

  The text that is understood to be LaTeX text, which is to be preserved
  in the LaTeX output context.

## Value

A character object of class `latex`. It's tagged as an latex fragment
that is not to be sanitized.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. When adding a title through
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md), we'll
use the `latex()` helper to signify to **gt** that we're using LaTeX
formatting.

    exibble |>
      dplyr::select(currency, char) |>
      gt() |>
      tab_header(title = latex("\\emph{LaTeX}"))

![This image of a table was generated from the first code example in the
\`latex()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_latex_1.png)

## Function ID

8-2

## Function Introduced

`v1.0.1` (May 10, 2025)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`currency()`](https://gt.rstudio.com/reference/currency.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
[`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md),
[`from_column()`](https://gt.rstudio.com/reference/from_column.md),
[`google_font()`](https://gt.rstudio.com/reference/google_font.md),
[`gt_latex_dependencies()`](https://gt.rstudio.com/reference/gt_latex_dependencies.md),
[`html()`](https://gt.rstudio.com/reference/html.md),
[`md()`](https://gt.rstudio.com/reference/md.md),
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
