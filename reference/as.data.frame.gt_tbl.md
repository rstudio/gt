# Transform a **gt** object to a data frame

This facilitates conversion of the `gt_tbl` object to a data frame.

## Usage

``` r
# S3 method for class 'gt_tbl'
as.data.frame(x, ...)
```

## Arguments

- x:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- ...:

  *Optional parameters*

  `<multiple expressions>` // (`optional`)

  Anything provided here in `...` will be passed to internal function
  calls that can consume it.
