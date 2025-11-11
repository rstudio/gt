# Move one or more columns

On those occasions where you need to move columns this way or that way,
we can make use of the `cols_move()` function. While it's true that the
movement of columns can be done upstream of **gt**, it is much easier
and less error prone to use the function provided here. The movement
procedure here takes one or more specified columns (in the `columns`
argument) and places them to the right of a different column (the
`after` argument). The ordering of the `columns` to be moved is
preserved, as is the ordering of all other columns in the table.

## Usage

``` r
cols_move(data, columns, after)
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

- columns:

  *Columns to target*

  `<column-targeting expression>` // **required**

  The columns for which the moving operations should be applied. Can
  either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html).
  The columns move as a group to a different position. The order of the
  remaining columns will be preserved.

- after:

  *Column used as anchor*

  `<column-targeting expression>` // **required**

  The column used to anchor the insertion of the moved columns. All of
  the moved columns will be placed to the right of this column. While
  select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here.

## Value

An object of class `gt_tbl`.

## Details

The columns supplied in `columns` must all exist in the table and none
of them can be in the `after` argument. The `after` column must also
exist and only one column should be provided here. If you need to place
one or more columns at the beginning of the column series, the
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md)
function should be used. Similarly, if those columns to move should be
placed at the end of the column series then use
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md).

## Examples

Use the [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
dataset to create a **gt** table. We'll choose to position the
`population` column after the `country_name` column by using the
`cols_move()` function.

    countrypops |>
      dplyr::select(-contains("code")) |>
      dplyr::filter(
        country_name == "Japan",
        year %in% 2012:2021
      ) |>
      gt() |>
      cols_move(
        columns = population,
        after = country_name
      ) |>
      fmt_integer(columns = population)

![This image of a table was generated from the first code example in the
\`cols_move()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_move_1.png)

## Function ID

5-9

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
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
