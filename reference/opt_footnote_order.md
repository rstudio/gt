# Option to modify the order of footnotes

We can alter the order in which marked footnotes appear in relation to
any unmarked footnotes in the footer section of the table. A single
keyword is to be supplied and it will determine whether marked footnotes
should appear: (1) before unmarked, (2) after unmarked, or (3) in call
order.

## Usage

``` r
opt_footnote_order(data, order = "marks_last")
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- order:

  *Method for ordering footnote marks*

  `scalar<character>` // *default:* `"marks_last"`

  A keyword provided here will determine how marked footnotes will be
  arranged in relation to unmarked footnotes. Use either:
  `"marks_last"`, `"marks_first"`, or `"preserve_order"`.

## Value

An object of class `gt_tbl`.

## Specification of footnote order

The keywords are:

- `"marks_last"`: marked footnotes should appear beneath unmarked in the
  table (default)

- `"marks_first"`: marked footnotes should appear before unmarked in the
  table

- `"preserve_order"`: footnotes will appear in the order they were
  specified in
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)

## Examples

Use a summarized version of the
[`sza`](https://gt.rstudio.com/reference/sza.md) dataset to create a
**gt** table, adding three marked footnotes and one unmarked (with four
calls of
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)).
We can modify the order of footnotes with the `opt_footnote_order()`
function.

    sza |>
      dplyr::filter(latitude == 30) |>
      dplyr::group_by(tst) |>
      dplyr::summarize(
        SZA.Max = if (
          all(is.na(sza))) {
          NA
        } else {
          max(sza, na.rm = TRUE)
        },
        SZA.Min = if (
          all(is.na(sza))) {
          NA
        } else {
          min(sza, na.rm = TRUE)
        },
        .groups = "drop"
      ) |>
      gt(rowname_col = "tst") |>
      tab_spanner_delim(delim = ".") |>
      sub_missing(
        columns = everything(),
        missing_text = "90+"
      ) |>
      tab_stubhead(label = "TST") |>
      tab_footnote(
        footnote = "True solar time.",
        locations = cells_stubhead()
      ) |>
      tab_footnote(
        footnote = "Solar zenith angle.",
        locations = cells_column_spanners(
          spanners = "spanner-SZA.Max"
        )
      ) |>
      tab_footnote(
        footnote = "The Lowest SZA.",
        locations = cells_stub(rows = "1200")
      ) |>
      tab_footnote(
        footnote = "Values calculated on the first of every month."
      ) |>
      opt_footnote_order(order = "marks_first")

![This image of a table was generated from the first code example in the
\`opt_footnote_order()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_footnote_order_1.png)

## Function ID

10-5

## Function Introduced

`v0.1.1.9000` (September 22, 2025)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
