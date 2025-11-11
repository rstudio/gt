# Option to expand or contract vertical padding

Increase or decrease the vertical padding throughout all locations of a
**gt** table by use of a `scale` factor, which here is defined by a real
number between `0` and `3`. This function serves as a shortcut for
setting the following eight options in
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md):

- `heading.padding`

- `column_labels.padding`

- `data_row.padding`

- `row_group.padding`

- `summary_row.padding`

- `grand_summary_row.padding`

- `footnotes.padding`

- `source_notes.padding`

## Usage

``` r
opt_vertical_padding(data, scale = 1)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- scale:

  *Scale factor*

  `scalar<numeric|integer>(0>=val>=3)` // *default:* `1`

  A scale factor by which the vertical padding will be adjusted. Must be
  a number between `0` and `3`.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, we'll lessen the amount of vertical padding
across the entire table with `opt_vertical_padding()`. Using a `scale`
value of `0.25` (down from the default of `1`) means the vertical space
will be greatly reduced, resulting in a more compact table.

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
      opt_vertical_padding(scale = 0.25)

![This image of a table was generated from the first code example in the
\`opt_vertical_padding()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_vertical_padding_1.png)

## Function ID

10-8

## Function Introduced

`v0.4.0` (February 15, 2022)

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
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md)
