# Option to use all caps in select table locations

Sometimes an all-capitalized look is suitable for a table. With the
`opt_all_caps()` function, we can transform characters in the column
labels, the stub, and in all row groups in this way (and there's control
over which of these locations are transformed).

This function serves as a convenient shortcut for
`<gt_tbl> |> tab_options(<location>.text_transform = "uppercase", <location>.font.size = pct(80), <location>.font.weight = "bolder")`
(for all `locations` selected).

## Usage

``` r
opt_all_caps(
  data,
  all_caps = TRUE,
  locations = c("column_labels", "stub", "row_group")
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- all_caps:

  *Use all-caps transformation*

  `scalar<logical>` // *default:* `TRUE`

  A logical value to indicate whether the text transformation to all
  caps should be performed (`TRUE`, the default) or reset to default
  values (`FALSE`) for the `locations` targeted.

- locations:

  *Locations to target*

  `mult-kw:[column_labels|stub|row_group]` // *default:*
  `c("column_labels", "stub", "row_group")`

  Which locations should undergo this text transformation? By default it
  includes all of the `"column_labels"`, the `"stub"`, and the
  `"row_group"` locations. However, we could just choose one or two of
  those.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, we'll ensure that all text in the column
labels, the stub, and in all row groups is transformed to all caps using
`opt_all_caps()`.

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
      opt_all_caps()

![This image of a table was generated from the first code example in the
\`opt_all_caps()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_all_caps_1.png)

## Function ID

10-10

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
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
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
