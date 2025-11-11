# Transform a **gt** table to a `gtable` object

`as_gtable()` performs the transformation of a `gt_tbl` object to a
[`gtable`](https://gtable.r-lib.org/reference/gtable.html) object.

## Usage

``` r
as_gtable(data, plot = FALSE, text_grob = grid::textGrob)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- plot:

  *Render through the graphics device?*

  `scalar<logical>` // *default:* `FALSE`

  The `plot` option determines whether the `gtable` object should be
  rendered on the graphics device.

- text_grob:

  *Function for drawing text*

  `function` // *default:*
  [`grid::textGrob`](https://rdrr.io/r/grid/grid.text.html)

  A `function` which will be used to draw text. Defaults to
  [`grid::textGrob()`](https://rdrr.io/r/grid/grid.text.html) but can be
  swapped to `gridtext::richtext_grob()` to better render HTML content.

## Value

A `gtable` object.

## Function ID

13-6

## Function Introduced

`v0.11.0` (July 9, 2024)

## See also

Other table export functions:
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
