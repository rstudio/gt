# Helper for providing a numeric value as percentage

A percentage value acts as a length value that is relative to an initial
state. For instance an 80 percent value for something will size the
target to 80 percent the size of its 'previous' value. This type of
sizing is useful for sizing up or down a length value with an intuitive
measure. This helper function can be used for the setting of font sizes
(e.g., in
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md)) and
altering the thicknesses of lines (e.g., in
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md)).
Should a more exact definition of size be required, the analogous helper
function `pct()` will be more useful.

## Usage

``` r
pct(x)
```

## Arguments

- x:

  *Numeric value in percent*

  `scalar<numeric|integer>` // **required**

  The numeric value to format as a string percentage for some
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
  arguments that can take percentage values (e.g., `table.width`).

## Value

A character vector with a single value in percentage units.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. Inside of the
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) call
(which is itself inside of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)), we'll
use the `pct()` helper function to define the font size for the column
labels as a percentage value.

    exibble |>
      gt() |>
      tab_style(
        style = cell_text(size = pct(75)),
        locations = cells_column_labels()
      )

![This image of a table was generated from the first code example in the
\`pct()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_pct_1.png)

## Function ID

8-4

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
[`md()`](https://gt.rstudio.com/reference/md.md),
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
