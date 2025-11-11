# Helper for providing a numeric value as pixels value

For certain parameters, a length value is required. Examples include the
setting of font sizes (e.g., in
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md)) and
thicknesses of lines (e.g., in
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md)).
Setting a length in pixels with `px()` allows for an absolute definition
of size as opposed to the analogous helper function
[`pct()`](https://gt.rstudio.com/reference/pct.md).

## Usage

``` r
px(x)
```

## Arguments

- x:

  *Numeric length in pixels*

  `scalar<numeric|integer>` // **required**

  The numeric value to format as a string (e.g., `"12px"`) for some
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
  arguments that can take values as units of pixels (e.g.,
  `table.font.size`).

## Value

A character vector with a single value in pixel units.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table. Inside of the
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) call
(which is itself inside of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)), we'll
use the `px()` helper function to define the font size for the column
labels in units of pixels.

    exibble |>
      gt() |>
      tab_style(
        style = cell_text(size = px(20)),
        locations = cells_column_labels()
      )

![This image of a table was generated from the first code example in the
\`px()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_px_1.png)

## Function ID

8-3

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
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
