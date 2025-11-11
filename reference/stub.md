# Select helper for targeting the stub column

Should you need to target only the stub column for formatting or other
operations, the `stub()` select helper can be used. This obviates the
need to use the name of the column that was selected as the stub column.

## Usage

``` r
stub(column = NULL)
```

## Arguments

- column:

  *Stub column selection*

  `scalar<integer>` // *default:* `NULL` (optional)

  For tables with multi-column stubs, optionally specify which stub
  column to target. Use `1` for the rightmost stub column, `2` for the
  second from right, etc. If `NULL` (the default), all stub columns are
  selected.

## Value

A character vector of class `"stub_column"`.

## Examples

Create a tibble that has a `row` column (values from `1` to `6`), a
`group` column, and a `vals` column (containing the same values as in
`row`).

    tbl <-
      dplyr::tibble(
        row = 1:6,
        group = c(rep("Group A", 3), rep("Group B", 3)),
        vals = 1:6
      )

Create a **gt** table with a two-column stub (incorporating the `row`
and `group` columns in that). Format the row labels of the stub with
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md) to obtain
Roman numerals in the stub; we're selecting the stub column here with
the `stub()` select helper.

    tbl |>
      gt(rowname_col = "row", groupname_col = "group") |>
      fmt_roman(columns = stub()) |>
      tab_options(row_group.as_column = TRUE)

![This image of a table was generated from the first code example in the
\`stub()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_stub_1.png)

For multi-column stubs, you can set widths for all stub columns together
or target specific columns individually:

    exibble |>
      dplyr::select(num, char, row, group) |>
      gt(rowname_col = c("group", "row")) |>
      cols_width(
        stub() ~ px(200),        # All stub columns get 200px
        everything() ~ px(100)
      )

![This image of a table was generated from the second code example in
the \`stub()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_stub_2.png)

Or target specific stub columns (1 = rightmost, 2 = second from right):

    exibble |>
      dplyr::select(num, char, row, group) |>
      gt(rowname_col = c("group", "row")) |>
      cols_width(
        stub(1) ~ px(70),        # Rightmost stub column (row)
        stub(2) ~ px(200),       # Second stub column (group)
        everything() ~ px(100)
      )

![This image of a table was generated from the third code example in the
\`stub()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_stub_3.png)

## Function ID

8-10

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
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
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
