# Provide a vector of sensible system fonts for use with **gt** tables

The vector of fonts given by `default_fonts()` can be safely used with a
**gt** table rendered as HTML since the font stack is expected to be
available across a wide set of systems. We can always specify additional
fonts to use and place them higher in precedence order, done through
prepending to this vector (i.e., this font stack should be placed after
that to act as a set of fallbacks).

This vector of fonts is useful when specifying `font` values inside
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) (itself
usable in [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)
or
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)).
If using
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
(which also has a `font` argument), we probably don't need to specify
this vector of fonts since that function prepends font names (this is
handled by its `add` option, which is `TRUE` by default).

## Usage

``` r
default_fonts()
```

## Value

A character vector of font names.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`char` and `time` columns). Attempting to modify the fonts used for the
`time` column is much safer if `default_fonts()` is appended to the end
of the `font` listing inside
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md). What
will happen, since the `"Comic Sansa"` and `"Menloa"` fonts shouldn't
exist, is that we'll get

    exibble |>
      dplyr::select(char, time) |>
      gt() |>
      tab_style(
        style = cell_text(
          font = c("Comic Sansa", "Menloa", default_fonts())
        ),
        locations = cells_body(columns = time)
      )

![This image of a table was generated from the first code example in the
\`default_fonts()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_default_fonts_1.png)

## Function ID

8-32

## Function Introduced

`v0.2.2` (August 5, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`currency()`](https://gt.rstudio.com/reference/currency.md),
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
