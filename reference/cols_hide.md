# Hide one or more columns

`cols_hide()` allows us to hide one or more columns from appearing in
the final output table. While it's possible and often desirable to omit
columns from the input table data before introduction to
[`gt()`](https://gt.rstudio.com/reference/gt.md), there can be cases
where the data in certain columns is useful (as a column reference
during formatting of other columns) but the final display of those
columns is not necessary.

## Usage

``` r
cols_hide(data, columns)
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

  The columns to hide in the output display table. Can either be a
  series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

## Value

An object of class `gt_tbl`. `data` will be unaltered if `columns` is
not supplied.

## Details

The hiding of columns is internally a rendering directive, so, all
columns that are 'hidden' are still accessible and useful in any
expression provided to a `rows` argument. Furthermore, `cols_hide()` (as
with many **gt** functions) can be placed anywhere in a pipeline of
**gt** function calls (acting as a promise to hide columns when the
timing is right). However, there's perhaps greater readability when
placing this call closer to the end of such a pipeline. `cols_hide()`
quietly changes the visible state of a column (much like
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md)) and
doesn't yield warnings or messages when changing the state of
already-invisible columns.

## Examples

Let's use a small portion of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table. We can hide the `country_code_2` and
`country_code_3` columns with the `cols_hide()` function.

    countrypops |>
      dplyr::filter(
        country_name == "Egypt",
        year %in% 2017:2021
      ) |>
      gt() |>
      cols_hide(columns = c(country_code_2, country_code_3))

![This image of a table was generated from the first code example in the
\`cols_hide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_hide_1.png)

Using another
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md)-based
**gt** table, we can use the `population` column to provide the
conditional placement of footnotes. Then, we'll hide that column along
with the `country_code_3` column. Note that the order of `cols_hide()`
and [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
has no effect on the final display of the table.

    countrypops |>
      dplyr::filter(
        country_name == "Pakistan",
        year %in% 2017:2021
      ) |>
      gt() |>
      cols_hide(columns = c(country_code_3, population)) |>
      tab_footnote(
        footnote = "Population above 220,000,000.",
        locations = cells_body(
          columns = year,
          rows = population > 220E6
        )
      )

![This image of a table was generated from the second code example in
the \`cols_hide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_hide_2.png)

## Function ID

5-12

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md) to
perform the inverse operation.

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md),
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
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
