# Merge columns to a value-with-uncertainty column

`cols_merge_uncert()` is a specialized variant of
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md). It
takes as input a base value column (`col_val`) and either: (1) a single
uncertainty column, or (2) two columns representing lower and upper
uncertainty bounds. These columns will be essentially merged in a single
column (that of `col_val`). What results is a column with values and
associated uncertainties, and any columns specified in `col_uncert` are
hidden from appearing the output table.

## Usage

``` r
cols_merge_uncert(
  data,
  col_val,
  col_uncert,
  rows = everything(),
  sep = " +/- ",
  autohide = TRUE
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

- col_val:

  *Column to target for base values*

  `<column-targeting expression>` // **required**

  The column that contains values for the start of the range. While
  select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here.

- col_uncert:

  *Column or columns to target for uncertainty values*

  `<column-targeting expression>` // **required**

  The most common case involves supplying a single column with
  uncertainties; these values will be combined with those in `col_val`.
  Less commonly, the lower and upper uncertainty bounds may be
  different. For that case, two columns representing the lower and upper
  uncertainty values away from `col_val`, respectively, should be
  provided. While select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that one or two
  column names be explicitly provided in a vector.

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

- sep:

  *Separator text for uncertainties*

  `scalar<character>` // *default:* `" +/- "`

  The separator text that contains the uncertainty mark for a single
  uncertainty value. The default value of `" +/- "` indicates that an
  appropriate plus/minus mark will be used depending on the output
  context. Should you want this special symbol to be taken literally, it
  can be supplied within the [`I()`](https://rdrr.io/r/base/AsIs.html)
  function.

- autohide:

  *Automatic hiding of the `col_uncert` column(s)*

  `scalar<logical>` // *default:* `TRUE`

  An option to automatically hide any columns specified in `col_uncert`.
  Any columns with their state changed to 'hidden' will behave the same
  as before, they just won't be displayed in the finalized table.

## Value

An object of class `gt_tbl`.

## Comparison with other column-merging functions

This function could be somewhat replicated using
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) in the
case where a single column is supplied for `col_uncert`, however,
`cols_merge_uncert()` employs the following specialized semantics for
`NA` handling:

1.  `NA`s in `col_val` result in missing values for the merged column
    (e.g., `NA` + `0.1` = `NA`)

2.  `NA`s in `col_uncert` (but not `col_val`) result in base values only
    for the merged column (e.g., `12.0` + `NA` = `12.0`)

3.  `NA`s both `col_val` and `col_uncert` result in missing values for
    the merged column (e.g., `NA` + `NA` = `NA`)

Any resulting `NA` values in the `col_val` column following the merge
operation can be easily formatted using
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md).

This function is part of a set of four column-merging functions. The
other three are the general
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
function and the specialized
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md)
and
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md)
functions. These functions operate similarly, where the non-target
columns can be optionally hidden from the output table through the
`hide_columns` or `autohide` options.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`num` and `currency` columns). We'll format the `num` column with the
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md)
function. Next we merge the `currency` and `num` columns into the
`currency` column; this will contain a base value and an uncertainty and
it's all done using the `cols_merge_uncert()` function. After the
merging process, the column label for the `currency` column is updated
with [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) to
better describe the content.

    exibble |>
      dplyr::select(num, currency) |>
      dplyr::slice(1:7) |>
      gt() |>
      fmt_number(
        columns = num,
        decimals = 3,
        use_seps = FALSE
      ) |>
      cols_merge_uncert(
        col_val = currency,
        col_uncert = num
      ) |>
      cols_label(currency = "value + uncert.")

![This image of a table was generated from the first code example in the
\`cols_merge_uncert()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_merge_uncert_1.png)

## Function ID

5-15

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
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
