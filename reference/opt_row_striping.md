# Option to add or remove row striping

By default, a **gt** table does not have row striping enabled. However,
this function allows us to easily enable or disable striped rows in the
table body. This function serves as a convenient shortcut for
`<gt_tbl> |> tab_options(row.striping.include_table_body = TRUE|FALSE)`.

## Usage

``` r
opt_row_striping(data, row_striping = TRUE)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- row_striping:

  *Use alternating row stripes*

  `scalar<logical>` // *default:* `TRUE`

  A logical value to indicate whether row striping should be added or
  removed.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, we'll add row striping to every second row
with `opt_row_striping()`.

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
      opt_row_striping()

![This image of a table was generated from the first code example in the
\`opt_row_striping()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_row_striping_1.png)

## Function ID

10-6

## Function Introduced

`v0.2.0.5` (March 31, 2020)

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
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
