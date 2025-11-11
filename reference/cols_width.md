# Set the widths of columns

Manual specifications of column widths can be performed using the
`cols_width()` function. We choose which columns get specific widths.
This can be in units of pixels (easily set by use of the
[`px()`](https://gt.rstudio.com/reference/px.md) helper function), or,
as percentages (where the
[`pct()`](https://gt.rstudio.com/reference/pct.md) helper function is
useful). Width assignments are supplied in `...` through two-sided
formulas, where the left-hand side defines the target columns and the
right-hand side is a single dimension.

## Usage

``` r
cols_width(.data, ..., .list = list2(...))
```

## Arguments

- .data:

  *The gt table or gt group data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

  OR

  `obj:<gt_group>` // **required**

  This is the **gt** group object that is commonly created through use
  of the [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md)
  function.

- ...:

  *Column width assignments*

  `<multiple expressions>` // **required** (or, use `.list`)

  Expressions for the assignment of column widths for the table columns
  in `.data`. Two-sided formulas (e.g, `<LHS> ~ <RHS>`) can be used,
  where the left-hand side corresponds to selections of columns and the
  right-hand side evaluates to single-length character values in the
  form `{##}px` (i.e., pixel dimensions); the
  [`px()`](https://gt.rstudio.com/reference/px.md) helper function is
  best used for this purpose. Column names should be enclosed in
  [`c()`](https://rdrr.io/r/base/c.html). The column-based select
  helpers
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  can be used in the LHS. Subsequent expressions that operate on the
  columns assigned previously will result in overwriting column width
  values (both in the same `cols_width()` call and across separate
  calls). All other columns can be assigned a default width value by
  using
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  on the left-hand side.

- .list:

  *Alternative to `...`*

  `<list of multiple expressions>` // **required** (or, use `...`)

  Allows for the use of a list as an input alternative to `...`.

## Value

An object of class `gt_tbl`.

## Details

Column widths can be set as absolute or relative values (with px and
percentage values). Those columns not specified are treated as having
variable width. The sizing behavior for column widths depends on the
combination of value types, and, whether a table width has been set
(which could, itself, be expressed as an absolute or relative value).
Widths for the table and its container can be individually modified with
the `table.width` and `container.width` arguments within
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)).

## Examples

Use select columns from the
[`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset to
create a **gt** table. We can specify the widths of columns with
`cols_width()`. This is done with named arguments in `...`, specifying
the exact widths for table columns (using
[`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
at the end will capture all remaining columns).

    exibble |>
      dplyr::select(
        num, char, date,
        datetime, row
      ) |>
      gt() |>
      cols_width(
        num ~ px(150),
        ends_with("r") ~ px(100),
        starts_with("date") ~ px(200),
        everything() ~ px(60)
      )

![This image of a table was generated from the first code example in the
\`cols_width()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_width_1.png)

## Function ID

5-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md),
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md),
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md),
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md),
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md)
