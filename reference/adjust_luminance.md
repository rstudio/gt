# Adjust the luminance for a palette of colors

The `adjust_luminance()` function can brighten or darken a palette of
colors by an arbitrary number of steps, which is defined by a real
number between -2.0 and 2.0. The transformation of a palette by a fixed
step in this function will tend to apply greater darkening or lightening
for those colors in the midrange compared to any very dark or very light
colors in the input palette.

## Usage

``` r
adjust_luminance(colors, steps)
```

## Arguments

- colors:

  *Color vector*

  `vector<character>` // **required**

  This is the vector of colors that will undergo an adjustment in
  luminance. Each color value provided must either be a color name (in
  the set of colors provided by
  [`grDevices::colors()`](https://rdrr.io/r/grDevices/colors.html)) or a
  hexadecimal string in the form of "#RRGGBB" or "#RRGGBBAA".

- steps:

  *Adjustment level*

  `scalar<numeric|integer>(-2>=val>=2)` // **required**

  A positive or negative factor by which the luminance of colors in the
  `colors` vector will be adjusted. Must be a number between `-2.0` and
  `2.0`.

## Value

A vector of color values.

## Details

This function can be useful when combined with the
[`data_color()`](https://gt.rstudio.com/reference/data_color.md)
function's `palette` argument, which can use a vector of colors or any
of the `col_*` functions from the **scales** package (all of which have
a `palette` argument).

## Examples

Get a palette of 8 pastel colors from the **RColorBrewer** package.

    pal <- RColorBrewer::brewer.pal(8, "Pastel2")

Create lighter and darker variants of the base palette (one step lower,
one step higher).

    pal_darker  <- pal |> adjust_luminance(-1.0)
    pal_lighter <- pal |> adjust_luminance(+1.0)

Create a tibble and make a **gt** table from it. Color each column in
order of increasingly darker palettes (with
[`data_color()`](https://gt.rstudio.com/reference/data_color.md)).

    dplyr::tibble(a = 1:8, b = 1:8, c = 1:8) |>
      gt() |>
      data_color(
        columns = a,
        colors = scales::col_numeric(
          palette = pal_lighter,
          domain = c(1, 8)
        )
      ) |>
      data_color(
        columns = b,
        colors = scales::col_numeric(
          palette = pal,
          domain = c(1, 8)
        )
      ) |>
      data_color(
        columns = c,
        colors = scales::col_numeric(
          palette = pal_darker,
          domain = c(1, 8)
        )
      )

![This image of a table was generated from the first code example in the
\`adjust_luminance()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_adjust_luminance_1.png)

## Function ID

8-9

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
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
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
