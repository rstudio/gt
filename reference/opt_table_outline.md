# Option to wrap an outline around the entire table

This function puts an outline of consistent `style`, `width`, and
`color` around the entire table. It'll write over any existing outside
lines so long as the `width` is larger that of the existing lines. The
default value of `style` (`"solid"`) will draw a solid outline, whereas
a value of `"none"` will remove any present outline.

## Usage

``` r
opt_table_outline(data, style = "solid", width = px(3), color = "#D3D3D3")
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- style:

  *Outline style property*

  `scalar<character>` // *default:* `"solid"`

  The style property for the table outline. By default, this is
  `"solid"`. If `"none"` is used then the outline is removed and any
  values provided for `width` and `color` will be ignored (i.e., not
  set).

- width:

  *Outline width value*

  `scalar<character>` // *default:* `px(3)`

  The width property for the table outline. By default, this is `px(3)`
  (or, `"3px"`).

- color:

  *Color of outline*

  `scalar<character>` // *default:* `"#D3D3D3"`

  The color of the table outline. By default, this is `"#D3D3D3"`.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, let's make it so that we have an outline wrap
around the entire table by using the `opt_table_outline()` function.

    tab_1 <-
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
      opt_table_outline()

    tab_1

![This image of a table was generated from the first code example in the
\`opt_table_outline()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_table_outline_1.png)

Remove the table outline with the `style = "none"` option.

    tab_1 |> opt_table_outline(style = "none")

![This image of a table was generated from the second code example in
the \`opt_table_outline()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_table_outline_2.png)

## Function ID

10-12

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
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
