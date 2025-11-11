# Stylize your table with a colorful look

With `opt_stylize()` you can quickly style your **gt** table with a
carefully curated set of background colors, line colors, and line
styles. There are six styles to choose from and they largely vary in the
extent of coloring applied to different table locations. Some have table
borders applied, some apply darker colors to the table stub and summary
sections, and, some even have vertical lines. In addition to choosing a
`style` preset, there are six `color` variations that each use a range
of five color tints. Each of the color tints have been fine-tuned to
maximize the contrast between text and its background. There are 36
combinations of `style` and `color` to choose from.

## Usage

``` r
opt_stylize(data, style = 1, color = "blue", add_row_striping = TRUE)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- style:

  *Table style*

  `scalar<numeric|integer>(1>=val>=6)` // *default:* `1`

  Six numbered styles are available. Simply provide a number from `1`
  (the default) to `6` to choose a distinct look.

- color:

  *Color variation*

  `scalar<character>` // *default:* `"blue"`

  There are six color variations: `"blue"`, `"cyan"`, `"pink"`,
  `"green"`, `"red"`, and `"gray"`.

- add_row_striping:

  *Allow row striping*

  `scalar<logical>` // *default:* `TRUE`

  An option to enable row striping in the table body for the `style`
  chosen.

## Value

an object of class `gt_tbl`.

## Examples

Use `exibble` to create a **gt** table with a number of table parts
added. Then, use `opt_stylize()` to give the table some additional style
(using the `"cyan"` color variation and style number `6`).

    exibble |>
      gt(rowname_col = "row", groupname_col = "group") |>
      summary_rows(
        groups = "grp_a",
        columns = c(num, currency),
        fns = c("min", "max")
      ) |>
      grand_summary_rows(
        columns = currency,
        fns = total ~ sum(., na.rm = TRUE)
      ) |>
      tab_source_note(source_note = "This is a source note.") |>
      tab_footnote(
        footnote = "This is a footnote.",
        locations = cells_body(columns = 1, rows = 1)
      ) |>
      tab_header(
        title = "The title of the table",
        subtitle = "The table's subtitle"
      ) |>
      opt_stylize(style = 6, color = "cyan")

![This image of a table was generated from the first code example in the
\`opt_stylize()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_stylize_1.png)

## Function ID

10-1

## Function Introduced

`v0.7.0` (Aug 25, 2022)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
[`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md),
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
