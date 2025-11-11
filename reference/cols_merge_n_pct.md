# Merge two columns to combine counts and percentages

`cols_merge_n_pct()` is a specialized variant of
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md), It
operates by taking two columns that constitute both a count (`col_n`)
and a fraction of the total population (`col_pct`) and merges them into
a single column. What results is a column containing both counts and
their associated percentages (e.g., `12 (23.2%)`). The column specified
in `col_pct` is dropped from the output table.

## Usage

``` r
cols_merge_n_pct(data, col_n, col_pct, rows = everything(), autohide = TRUE)
```

## Arguments

- data:

  *The gt table or gt group data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

  OR

  `obj:<gt_group>` // **required**

  This is the **gt** group object that is commonly created through use
  of the [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md)
  function.

- col_n:

  *Column to target for counts*

  `<column-targeting expression>` // **required**

  The column that contains values for the count component. While select
  helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here.

- col_pct:

  *Column to target for percentages*

  `<column-targeting expression>` // **required**

  The column that contains values for the percentage component. While
  select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here. This column should be formatted such that percentages
  are displayed (e.g., with
  [`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md)).

- rows:

  *Rows to target*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should participate in the merging process. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row IDs within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

- autohide:

  *Automatic hiding of the `col_pct` column*

  `scalar<logical>` // *default:* `TRUE`

  An option to automatically hide the column specified as `col_pct`. Any
  columns with their state changed to hidden will behave the same as
  before, they just won't be displayed in the finalized table.

## Value

An object of class `gt_tbl`.

## Comparison with other column-merging functions

This function could be somewhat replicated using
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
however, `cols_merge_n_pct()` employs the following specialized
semantics for `NA` and zero-value handling:

1.  `NA`s in `col_n` result in missing values for the merged column
    (e.g., `NA` + `10.2%` = `NA`)

2.  `NA`s in `col_pct` (but not `col_n`) result in base values only for
    the merged column (e.g., `13` + `NA` = `13`)

3.  `NA`s both `col_n` and `col_pct` result in missing values for the
    merged column (e.g., `NA` + `NA` = `NA`)

4.  If a zero (`0`) value is in `col_n` then the formatted output will
    be `"0"` (i.e., no percentage will be shown)

Any resulting `NA` values in the `col_n` column following the merge
operation can be easily formatted using
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md).
Separate calls of
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md) can
be used for the `col_n` and `col_pct` columns for finer control of the
replacement values. It is the responsibility of the user to ensure that
values are correct in both the `col_n` and `col_pct` columns (this
function neither generates nor recalculates values in either).
Formatting of each column can be done independently in separate
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) and
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md)
calls.

This function is part of a set of four column-merging functions. The
other three are the general
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
function and the specialized
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md)
and
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md)
functions. These functions operate similarly, where the non-target
columns can be optionally hidden from the output table through the
`hide_columns` or `autohide` options.

## Examples

Using a summarized version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
let's create a **gt** table that displays the counts and percentages of
the top 3 pizzas sold by pizza category in 2015. The
`cols_merge_n_pct()` function is used to merge the `n` and `frac`
columns (and the `frac` column is formatted using
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md)).

    pizzaplace |>
      dplyr::count(name, type, price, sort = TRUE) |>
      dplyr::mutate(frac = prop.table(n)) |>
      dplyr::slice_max(n, n = 3, by = type) |>
      dplyr::arrange(type) |>
      gt(
        rowname_col = "name",
        groupname_col = "type"
      ) |>
      fmt_currency(price) |>
      fmt_percent(frac) |>
      cols_merge_n_pct(
        col_n = n,
        col_pct = frac
      ) |>
      cols_label(
        n = md("*N* (%)"),
        price = "Price"
      ) |>
      tab_style(
        style = cell_text(font = "monospace"),
        locations = cells_stub()
      ) |>
      tab_stubhead(md("Cat. and  \nPizza Code")) |>
      tab_header(title = "Top 3 Pizzas Sold by Category in 2015") |>
      tab_options(table.width = px(512))

![This image of a table was generated from the first code example in the
\`cols_merge_n_pct()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_merge_n_pct_1.png)

## Function ID

5-17

## Function Introduced

`v0.3.0` (May 12, 2021)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md),
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md),
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md),
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
