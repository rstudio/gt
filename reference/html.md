# Interpret input text as HTML-formatted text

For certain pieces of text (like in column labels or table headings) we
may want to express them as raw HTML. In fact, with HTML, anything goes
so it can be much more than just text. The `html()` function will guard
the input HTML against escaping, so, your HTML tags will come through as
HTML when rendered... to HTML.

## Usage

``` r
html(text, ...)
```

## Arguments

- text:

  *HTML text*

  `scalar<character>` // **required**

  The text that is understood to be HTML text, which is to be preserved
  in the HTML output context.

- ...:

  *Optional parameters for
  [`htmltools::HTML()`](https://rstudio.github.io/htmltools/reference/HTML.html)*

  `<multiple expressions>` // (`optional`)

  The
  [`htmltools::HTML()`](https://rstudio.github.io/htmltools/reference/HTML.html)
  function contains `...` and anything provided here will be passed to
  that internal function call.

## Value

A character object of class `html`. It's tagged as an HTML fragment that
is not to be sanitized.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. When adding a title through
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md), we'll
use the `html()` helper to signify to **gt** that we're using HTML
formatting.

    exibble |>
      dplyr::select(currency, char) |>
      gt() |>
      tab_header(title = html("<em>HTML</em>"))

![This image of a table was generated from the first code example in the
\`html()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_html_1.png)

## Function ID

8-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

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
