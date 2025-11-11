# Select helper for targeting the row group column

Should you need to target only the row group column for column-width
declarations (i.e., when `row_group_as_column = TRUE` is set in the
initial [`gt()`](https://gt.rstudio.com/reference/gt.md) call), the
`row_group()` select helper can be used. This shorthand makes it so you
don't have to use the name of the column that was selected as the row
group column.

## Usage

``` r
row_group()
```

## Value

A character vector of class `"row_group_column"`.

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
and `group` columns in that). We can set the widths of the two columns
in the stub with the `row_group()` and
[`stub()`](https://gt.rstudio.com/reference/stub.md) helpers on the LHS
of the expressions passed to
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md).

    tbl |>
      gt(
        rowname_col = "row",
        groupname_col = "group",
        row_group_as_column = TRUE
      ) |>
      fmt_roman(columns = stub()) |>
      cols_width(
        row_group() ~ px(200),
        stub() ~ px(100),
        vals ~ px(50)
      )

![This image of a table was generated from the first code example in the
\`row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_row_group_1.png)

## Function ID

8-11

## Function Introduced

`v0.11.0` (July 9, 2024)

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
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
