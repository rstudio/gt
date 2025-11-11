# Generate a special **gt** table for previewing a dataset

Sometimes you may want to see just a small portion of your input data.
We can use `gt_preview()` in place of
[`gt()`](https://gt.rstudio.com/reference/gt.md) to get the first x rows
of data and the last y rows of data (which can be set by the `top_n` and
`bottom_n` arguments). It's not advised to use additional **gt**
functions to further modify the output of `gt_preview()`. Furthermore,
you cannot pass a **gt** object to `gt_preview()`.

## Usage

``` r
gt_preview(data, top_n = 5, bottom_n = 1, incl_rownums = TRUE)
```

## Arguments

- data:

  *Input data table*

  `obj:<data.frame>|obj:<tbl_df>` // **required**

  A `data.frame` object or a tibble (`tbl_df`).

- top_n:

  *Top n rows to display*

  `scalar<numeric|integer>` // *default:* `5`

  The `top_n` value will be used as the number of rows from the top of
  the table to display. The default, `5`, will show the first five rows
  of the table.

- bottom_n:

  *Bottom n rows to display*

  `scalar<numeric|integer>` // *default:* `1`

  The `bottom_n` value will be used as the number of rows from the
  bottom of the table to display. The default, `1`, will show the final
  row of the table.

- incl_rownums:

  *Display row numbers*

  `scalar<logical>` // *default:* `TRUE`

  An option to include the row numbers for `data` in the table stub.

## Value

An object of class `gt_tbl`.

## Details

By default, the output table will include row numbers in a stub
(including a range of row numbers for the omitted rows). This row
numbering option can be deactivated by setting `incl_rownums` to
`FALSE`.

## Examples

With three columns from the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset, let's
create a **gt** table preview with the `gt_preview()` function. You'll
get only the first five rows and the last row.

    gtcars |>
      dplyr::select(mfr, model, year) |>
      gt_preview()

![This image of a table was generated from the first code example in the
\`gt_preview()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_gt_preview_1.png)

## Function ID

1-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table creation functions:
[`gt()`](https://gt.rstudio.com/reference/gt.md)
