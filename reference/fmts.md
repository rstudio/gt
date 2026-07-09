# Formatting functions

All formatting functions in gt are quite consistent. All functions that
start with the common `fmt_*()` prefix have the following points in
common

## Details

Let's use the [exibble](https://gt.rstudio.com/reference/exibble.md)
data for this.

## Examples

``` r
gt_tbl <- gt(exibble)

#
# They all have `columns` and `rows` to specify target cells and default to
# styling all compatible cells.
#
# By default, they apply styling to all compatible columns.

# Will style all numeric columns
gt_tbl |> fmt_number()


  

num
```
