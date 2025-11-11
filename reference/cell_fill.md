# Helper for defining custom fills for table cells

`cell_fill()` is to be used with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), which
itself allows for the setting of custom styles to one or more cells.
Specifically, the call to `cell_fill()` should be bound to the `styles`
argument of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md).

## Usage

``` r
cell_fill(color = "#D3D3D3", alpha = NULL)
```

## Arguments

- color:

  *Cell fill color*

  `scalar<character>` // *default:* `"#D3D3D3"`

  If nothing is provided for `color` then `"#D3D3D3"` (light gray) will
  be used as a default.

- alpha:

  *Transparency value*

  `scalar<numeric|integer>(0>=val>=1)` // *default:* `NULL` (`optional`)

  An optional alpha transparency value for the `color` as single value
  in the range of `0` (fully transparent) to `1` (fully opaque). If not
  provided the fill color will either be fully opaque or use alpha
  information from the color value if it is supplied in the `#RRGGBBAA`
  format.

## Value

A list object of class `cell_styles`.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`num` and `currency` columns). Styles are added with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) in two
separate calls (targeting different body cells with the
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md) helper
function). With the `cell_fill()` helper function we define cells with a
`"lightblue"` background in one instance, and `"gray85"` in the other.

    exibble |>
      dplyr::select(num, currency) |>
      gt() |>
      fmt_number(decimals = 1) |>
      tab_style(
        style = cell_fill(color = "lightblue"),
        locations = cells_body(
          columns = num,
          rows = num >= 5000
        )
      ) |>
      tab_style(
        style = cell_fill(color = "gray85"),
        locations = cells_body(
          columns = currency,
          rows = currency < 100
        )
      )

![This image of a table was generated from the first code example in the
\`cell_fill()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cell_fill_1.png)

## Function ID

8-26

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
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
