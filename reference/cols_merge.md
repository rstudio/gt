# Merge data from two or more columns to a single column

This function takes input from two or more columns and allows the
contents to be merged into a single column by using a pattern that
specifies the arrangement. We can specify which columns to merge
together in the `columns` argument. The string-combining pattern is to
be provided in the `pattern` argument. The first column in the `columns`
series operates as the target column (i.e., the column that will undergo
mutation) whereas all following `columns` will be untouched. There is
the option to hide the non-target columns (i.e., second and subsequent
columns given in `columns`). The formatting of values in different
columns will be preserved upon merging.

## Usage

``` r
cols_merge(
  data,
  columns,
  hide_columns = columns[-1],
  rows = everything(),
  pattern = NULL
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

- columns:

  *Columns to target*

  `<column-targeting expression>` // **required**

  The columns for which the merging operations should be applied. The
  first column resolved will be the target column (i.e., undergo
  mutation) and the other columns will serve to provide input. Can
  either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  A vector is recommended because in that case we are absolutely certain
  about the order of columns, and, that order information is needed for
  this and other arguments.

- hide_columns:

  *Subset of `columns` to hide*

  `<column-targeting expression>|FALSE` // *default:* `columns[-1]`

  Any column names provided here will have their state changed to
  `hidden` (via internal use of
  [`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md)) if
  they aren't already hidden. This is convenient if the shared purpose
  of these specified columns is only to provide string input to the
  target column. To suppress any hiding of columns, `FALSE` can be used
  here.

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

- pattern:

  *Formatting pattern*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A formatting pattern that specifies the arrangement of the `columns`
  values and any string literals. The pattern uses numbers (within
  [`{ }`](https://rdrr.io/r/base/Paren.html)) that correspond to the
  indices of columns provided in `columns`. If two columns are provided
  in `columns` and we would like to combine the cell data onto the first
  column, `"{1} {2}"` could be used. If a pattern isn't provided then a
  space-separated pattern that includes all `columns` will be generated
  automatically. Further details are provided in the *How the `pattern`
  works* section.

## Value

An object of class `gt_tbl`.

## How the `pattern` works

There are two types of templating for the `pattern` string:

1.  [`{ }`](https://rdrr.io/r/base/Paren.html) for arranging single
    column values in a row-wise fashion

2.  `<< >>` to surround spans of text that will be removed if any of the
    contained [`{ }`](https://rdrr.io/r/base/Paren.html) yields a
    missing value

Integer values are placed in [`{ }`](https://rdrr.io/r/base/Paren.html)
and those values correspond to the columns involved in the merge, in the
order they are provided in the `columns` argument. So the pattern
`"{1} ({2}-{3})"` corresponds to the target column value listed first in
`columns` and the second and third columns cited (formatted as a range
in parentheses). With hypothetical values, this might result as the
merged string `"38.2 (3-8)"`.

Because some values involved in merging may be missing, it is likely
that something like `"38.2 (3-NA)"` would be undesirable. For such
cases, placing sections of text in `<< >>` results in the entire span
being eliminated if there were to be an `NA` value (arising from
[`{ }`](https://rdrr.io/r/base/Paren.html) values). We could instead opt
for a pattern like `"{1}<< ({2}-{3})>>"`, which results in `"38.2"` if
either columns `{2}` or `{3}` have an `NA` value. We can even use a more
complex nesting pattern like `"{1}<< ({2}-<<{3}>>)>>"` to retain a lower
limit in parentheses (where `{3}` is `NA`) but remove the range
altogether if `{2}` is `NA`.

One more thing to note here is that if
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md) is
used on values in a column, those specific values affected won't be
considered truly missing by `cols_merge()` (since it's been handled with
substitute text). So, the complex pattern `"{1}<< ({2}-<<{3}>>)>>"`
might result in something like `"38.2 (3-limit)"` if
`sub_missing(..., missing_text = "limit")` were used on the third column
supplied in `columns`.

## Comparison with other column-merging functions

There are three other column-merging functions that offer specialized
behavior that is optimized for common table tasks:
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
and
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md).
These functions operate similarly, where the non-target columns can be
optionally hidden from the output table through the `autohide` option.

## Examples

Use a subset of the [`sp500`](https://gt.rstudio.com/reference/sp500.md)
dataset to create a **gt** table. Use the `cols_merge()` function to
merge the `open` & `close` columns together, and, the `low` & `high`
columns (putting an em dash between both). Relabel the columns with
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md).

    sp500 |>
      dplyr::slice(50:55) |>
      dplyr::select(-volume, -adj_close) |>
      gt() |>
      cols_merge(
        columns = c(open, close),
        pattern = "{1}&mdash;{2}"
      ) |>
      cols_merge(
        columns = c(low, high),
        pattern = "{1}&mdash;{2}"
      ) |>
      cols_label(
        open = "open/close",
        low = "low/high"
      )

![This image of a table was generated from the first code example in the
\`cols_merge()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_merge_1.png)

Use a portion of [`gtcars`](https://gt.rstudio.com/reference/gtcars.md)
to create a **gt** table. Use the `cols_merge()` function to merge the
`trq` & `trq_rpm` columns together, and, the `mpg_c` & `mpg_h` columns.
Given the presence of `NA` values, we can use patterns that drop parts
of the output text whenever missing values are encountered.

    gtcars |>
      dplyr::filter(year == 2017) |>
      dplyr::select(mfr, model, starts_with(c("trq", "mpg"))) |>
      gt() |>
      fmt_integer(columns = trq_rpm) |>
      cols_merge(
        columns = starts_with("trq"),
        pattern = "{1}<< ({2} rpm)>>"
      ) |>
      cols_merge(
        columns = starts_with("mpg"),
        pattern = "<<{1} city<</{2} hwy>>>>"
      ) |>
      cols_label(
        mfr = "Manufacturer",
        model = "Car Model",
        trq = "Torque",
        mpg_c = "MPG"
      )

![This image of a table was generated from the second code example in
the \`cols_merge()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_merge_2.png)

## Function ID

5-14

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
