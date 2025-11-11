# Unhide one or more columns

`cols_unhide()` allows us to take one or more hidden columns (usually
done via [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md))
and make them visible in the final output table. This may be important
in cases where the user obtains a `gt_tbl` object with hidden columns
and there is motivation to reveal one or more of those.

## Usage

``` r
cols_unhide(data, columns)
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

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns to unhide in the output display table. Can either be a
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

An object of class `gt_tbl`.

## Details

The hiding and unhiding of columns is internally a rendering directive,
so, all columns that are 'hidden' are still accessible and useful in any
expression provided to a `rows` argument. The `cols_unhide()` function
quietly changes the visible state of a column (much like the
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) function)
and doesn't yield warnings or messages when changing the state of
already-visible columns.

## Examples

Let's use a small portion of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table. We'll hide the `country_code_2` and
`country_code_3` columns with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md).

    tab_1 <-
      countrypops |>
      dplyr::filter(
        country_name == "Singapore",
        year %in% 2017:2021
      ) |>
      gt() |>
      cols_hide(columns = c(country_code_2, country_code_3))

    tab_1

![This image of a table was generated from the first code example in the
\`cols_unhide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_unhide_1.png)

If the `tab_1` object is provided without the code or source data to
regenerate it, and, the user wants to reveal otherwise hidden columns
then `cols_unhide()` becomes useful.

    tab_1 |> cols_unhide(columns = country_code_2)

![This image of a table was generated from the second code example in
the \`cols_unhide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_unhide_2.png)

## Function ID

5-13

## Function Introduced

`v0.3.0` (May 12, 2021)

## See also

[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) to
perform the inverse operation.

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
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
