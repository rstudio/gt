# Move one or more columns to the end

It's possible to move a set of columns to the end of the column series,
we only need to specify which `columns` are to be moved. While this can
be done upstream of **gt**, this function makes to process much easier
and it's less error prone. The ordering of the `columns` that are moved
to the end is preserved (same with the ordering of all other columns in
the table).

## Usage

``` r
cols_move_to_end(data, columns)
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
  The columns move as a group to the right-most side of the table. The
  order of the remaining columns will be preserved.

## Value

An object of class `gt_tbl`.

## Details

The columns supplied in `columns` must all exist in the table. If you
need to place one or columns at the start of the column series,
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md)
should be used. More control is offered with
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md), where
columns could be placed after a specific column.

## Examples

For this example, we'll use a portion of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a simple **gt** table. Let's move the `year` column, which is
the middle column, to the end of the column series with
`cols_move_to_end()`.

    countrypops |>
      dplyr::select(-contains("code")) |>
      dplyr::filter(
        country_name == "Benin",
        year %in% 2017:2021
      ) |>
      gt() |>
      cols_move_to_end(columns = year)

![This image of a table was generated from the first code example in the
\`cols_move_to_end()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_move_to_end_1.png)

We can also move multiple columns at a time. With the same
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md)-based
table, let's move both the `year` and `country_name` columns to the end
of the column series.

    countrypops |>
      dplyr::select(-contains("code")) |>
      dplyr::filter(
        country_name == "Benin",
        year %in% 2017:2021
      ) |>
      gt() |>
      cols_move_to_end(columns = c(year, country_name))

![This image of a table was generated from the second code example in
the \`cols_move_to_end()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_move_to_end_2.png)

## Function ID

5-11

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
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
