# Option to align the table header

By default, a table header added to a **gt** table has center alignment
for both the title and the subtitle elements. This function allows us to
easily set the horizontal alignment of the title and subtitle to the
left or right by using the `"align"` argument. This function serves as a
convenient shortcut for
`<gt_tbl> |> tab_options(heading.align = <align>)`.

## Usage

``` r
opt_align_table_header(data, align = c("left", "center", "right"))
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- align:

  *Header alignment*

  `singl-kw:[left|center|right]` // *default:* `"left"`

  The alignment of the title and subtitle elements in the table header.
  Options are `"left"` (the default), `"center"`, or `"right"`.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, we'll align the header contents (consisting
of the title and the subtitle) to the left with the
`opt_align_table_header()` function.

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
      opt_align_table_header(align = "left")

![This image of a table was generated from the first code example in the
\`opt_align_table_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_align_table_header_1.png)

## Function ID

10-7

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table option functions:
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
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
