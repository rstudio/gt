# Set the alignment of columns

The individual alignments of columns (which includes the column labels
and all of their data cells) can be modified. We have the option to
align text to the `left`, the `center`, and the `right`. In a less
explicit manner, we can allow **gt** to automatically choose the
alignment of each column based on the data type (with the `auto`
option).

## Usage

``` r
cols_align(
  data,
  align = c("auto", "left", "center", "right"),
  columns = everything()
)
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

- align:

  *Alignment type*

  `singl-kw:[auto|left|center|right]` // *default:* `"auto"`

  This can be any of `"center"`, `"left"`, or `"right"` for center-,
  left-, or right-alignment. Alternatively, the `"auto"` option (the
  default), will automatically align values in columns according to the
  data type (see the Details section for specifics on which alignments
  are applied).

- columns:

  *Columns to target*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns for which the alignment should be applied. Can either be a
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
  By default this is set to
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  which means that the chosen alignment affects all columns.

## Value

An object of class `gt_tbl`.

## Details

When you create a **gt** table object using
[`gt()`](https://gt.rstudio.com/reference/gt.md), automatic alignment of
column labels and their data cells is performed. By default,
left-alignment is applied to columns of class `character`, `Date`, or
`POSIXct`; center-alignment is for columns of class `logical`, `factor`,
or `list`; and right-alignment is used for the `numeric` and `integer`
columns.

## Examples

Let's use
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) to
create a small **gt** table. We can change the alignment of the
`population` column with `cols_align()`. In this example, the label and
body cells of `population` will be aligned to the left.

    countrypops |>
      dplyr::select(-contains("code")) |>
      dplyr::filter(
        country_name == "San Marino",
        year %in% 2017:2021
      ) |>
      gt(
        rowname_col = "year",
        groupname_col = "country_name"
      ) |>
      cols_align(
        align = "left",
        columns = population
      )

![This image of a table was generated from the first code example in the
\`cols_align()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_align_1.png)

## Function ID

5-1

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
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
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
