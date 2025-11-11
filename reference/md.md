# Interpret input text as Markdown-formatted text

Markdown text can be used in certain places in a **gt** table, and this
is wherever new text is defined (e.g., footnotes, source notes, the
table title, etc.). Using Markdown is advantageous for styling text
since it will be rendered correctly to the output format of the **gt**
table. There is also the
[`html()`](https://gt.rstudio.com/reference/html.md) helper that allows
you use HTML exclusively (for tables expressly meant for HTML output)
but `md()` allows for both; you get to use Markdown plus any HTML
fragments at the same time.

## Usage

``` r
md(text)
```

## Arguments

- text:

  *Markdown text*

  `scalar<character>` // **required**

  The text that is understood to contain Markdown formatting.

## Value

A character object of class `from_markdown`. It's tagged as being
Markdown text and it will undergo conversion to the desired output
context.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. When adding a title through
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md), we'll
use the `md()` helper to signify to **gt** that we're using Markdown
formatting.

    exibble |>
      dplyr::select(currency, char) |>
      gt() |>
      tab_header(title = md("Using *Markdown*"))

![This image of a table was generated from the first code example in the
\`md()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_md_1.png)

## Function ID

8-1

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
[`html()`](https://gt.rstudio.com/reference/html.md),
[`latex()`](https://gt.rstudio.com/reference/latex.md),
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
