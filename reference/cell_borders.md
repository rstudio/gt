# Helper for defining custom borders for table cells

`cell_borders()` is to be used with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), which
itself allows for the setting of custom styles to one or more cells.
Specifically, the call to `cell_borders()` should be bound to the
`styles` argument of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). The
`sides` argument is where we define which borders should be modified
(e.g., `"left"`, `"right"`, etc.). With that selection, the `color`,
`style`, and `weight` of the selected borders can then be modified.

## Usage

``` r
cell_borders(sides = "all", color = "#000000", style = "solid", weight = px(1))
```

## Arguments

- sides:

  *Border sides*

  `vector<character>` // *default:* `"all"`

  The border sides to be modified. Options include `"left"`, `"right"`,
  `"top"`, and `"bottom"`. For all borders surrounding the selected
  cells, we can use the `"all"` option.

- color:

  *Border color*

  `scalar<character>|NULL` // *default:* `"#000000"`

  The border `color` can be defined with a color name or with a
  hexadecimal color code. The default `color` value is `"#000000"`
  (black). Borders for any defined `sides` can be removed by supplying
  `NULL` here.

- style:

  *Border line style*

  `scalar<character>|NULL` // *default:* `"solid"`

  The border `style` can be one of either `"solid"` (the default),
  `"dashed"`, `"dotted"`, `"hidden"`, or `"double"`. Borders for any
  defined `sides` can be removed by supplying `NULL` here.

- weight:

  *Border weight*

  `scalar<character>|NULL` // *default:* `px(1)`

  The default value for `weight` is `"1px"` and higher values will
  become more visually prominent. Borders for any defined `sides` can be
  removed by supplying `NULL` to any of `color`, `style`, or `weight`.

## Value

A list object of class `cell_styles`.

## Examples

We can add horizontal border lines for all table body rows in a **gt**
table based on the
[`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset. For
this, we need to use
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)
(targeting all cells in the table body with
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)) in
conjunction with `cell_borders()` in the `style` argument. Both top and
bottom borders will be added as `"solid"` and `"red"` lines with a line
width of 1.5 px.

    exibble |>
      gt() |>
      tab_style(
        style = cell_borders(
          sides = c("top", "bottom"),
          color = "red",
          weight = px(1.5),
          style = "solid"
        ),
        locations = cells_body()
      )

![This image of a table was generated from the first code example in the
\`cell_borders()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cell_borders_1.png)

It's possible to incorporate different horizontal and vertical (`"left"`
and `"right"`) borders at several different locations. This uses
multiple `cell_borders()` and
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md) calls
within their own respective lists.

    exibble |>
      gt() |>
      tab_style(
        style = list(
          cell_borders(
            sides = c("top", "bottom"),
            color = "#FF0000",
            weight = px(2)
          ),
          cell_borders(
            sides = c("left", "right"),
            color = "#0000FF",
            weight = px(2)
          )
        ),
        locations = list(
          cells_body(
            columns = num,
            rows = is.na(num)
          ),
          cells_body(
            columns = currency,
            rows = is.na(currency)
          )
        )
      )

![This image of a table was generated from the second code example in
the \`cell_borders()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cell_borders_2.png)

## Function ID

8-27

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
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
