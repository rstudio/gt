# Merge two columns to a value range column

`cols_merge_range()` is a specialized variant of
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md). It
operates by taking a two columns that constitute a range of values
(`col_begin` and `col_end`) and merges them into a single column. What
results is a column containing both values separated by an em dash. The
column specified in `col_end` is dropped from the output table.

## Usage

``` r
cols_merge_range(
  data,
  col_begin,
  col_end,
  rows = everything(),
  autohide = TRUE,
  sep = NULL,
  locale = NULL
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

- col_begin:

  *Column to target for beginning of range*

  `<column-targeting expression>` // **required**

  The column that contains values for the start of the range. While
  select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here.

- col_end:

  *Column to target for end of range*

  `<column-targeting expression>` // **required**

  The column that contains values for the end of the range. While select
  helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name be used. This is to ensure that exactly one column is
  provided here.

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

  *Automatic hiding of the `col_end` column*

  `scalar<logical>` // *default:* `TRUE`

  An option to automatically hide the column specified as `col_end`. Any
  columns with their state changed to hidden will behave the same as
  before, they just won't be displayed in the finalized table.

- sep:

  *Separator text for ranges*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The separator text that indicates the values are ranged. If a `sep`
  value is not provided then the range separator specific to the
  `locale` provided will be used (if a locale isn't specified then an en
  dash will be used). You can specify the use of an en dash with `"--"`;
  a triple-hyphen sequence (`"---"`) will be transformed to an em dash.
  Should you want hyphens to be taken literally, the `sep` value can be
  supplied within the base [`I()`](https://rdrr.io/r/base/AsIs.html)
  function.

- locale:

  *Locale identifier*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An optional locale identifier that can be used for applying a `sep`
  pattern specific to a locale's rules. Examples include `"en"` for
  English (United States) and `"fr"` for French (France). We can call
  [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
  as a useful reference for all of the locales that are supported. A
  locale ID can be also set in the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function call (where
  it would be used automatically by any function with a `locale`
  argument) but a `locale` value provided here will override that global
  locale.

## Value

An object of class `gt_tbl`.

## Comparison with other column-merging functions

This function could be somewhat replicated using
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
however, `cols_merge_range()` employs the following specialized
operations for `NA` handling:

1.  `NA`s in `col_begin` (but not `col_end`) result in a display of only

2.  `NA`s in `col_end` (but not `col_begin`) result in a display of only
    the `col_begin` values only for the merged column (this is the
    converse of the previous)

3.  `NA`s both in `col_begin` and `col_end` result in missing values for
    the merged column

Any resulting `NA` values in the `col_begin` column following the merge
operation can be easily formatted using
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md).
Separate calls of
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md) can
be used for the `col_begin` and `col_end` columns for finer control of
the replacement values.

This function is part of a set of four column-merging functions. The
other three are the general
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
function and the specialized
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md)
and
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md)
functions. These functions operate similarly, where the non-target
columns can be optionally hidden from the output table through the
`hide_columns` or `autohide` options.

## Examples

Let's use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table, keeping only the `model`, `mpg_c`, and `mpg_h` columns.
Merge the `"mpg*"` columns together as a single range column (which is
labeled as MPG, in italics) using the `cols_merge_range()` function.
After the merging process, the column label for the `mpg_c` column is
updated with
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) to
better describe the content.

    gtcars |>
      dplyr::select(model, starts_with("mpg")) |>
      dplyr::slice(1:8) |>
      gt() |>
      cols_merge_range(
        col_begin = mpg_c,
        col_end = mpg_h
      ) |>
      cols_label(mpg_c = md("*MPG*"))

![This image of a table was generated from the first code example in the
\`cols_merge_range()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_merge_range_1.png)

## Function ID

5-16

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
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
