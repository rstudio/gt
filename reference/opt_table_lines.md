# Option to set table lines to different extents

`opt_table_lines()` sets table lines in one of three possible ways: (1)
all possible table lines drawn (`"all"`), (2) no table lines at all
(`"none"`), and (3) resetting to the default line styles (`"default"`).
This is great if you want to start off with lots of lines and subtract
just a few of them with
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) or
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). Or, use
it to start with a completely lineless table, adding individual lines as
needed.

## Usage

``` r
opt_table_lines(data, extent = c("all", "none", "default"))
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- extent:

  *Extent of lines added*

  `singl-kw:[all|none|default]` // *default:* `"all"`

  The extent to which lines will be visible in the table. Options are
  `"all"`, `"none"`, or `"default"`.

## Value

An object of class `gt_tbl`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table with a number of table parts added (using
functions like
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
and more). Following that, we'll use the `opt_table_lines()` function to
generate lines everywhere there can possibly be lines (the default for
the `extent` argument is `"all"`).

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
      opt_table_lines()

![This image of a table was generated from the first code example in the
\`opt_table_lines()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_table_lines_1.png)

## Function ID

10-11

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
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
