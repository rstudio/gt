# Print a **gt** table

This facilitates printing of the HTML table to the R console.

This facilitates printing of multiple HTML tables (in a `gt_group`
object) to the R console.

## Usage

``` r
# S3 method for class 'gt_tbl'
print(x, ..., view = interactive())

# S3 method for class 'gt_group'
print(x, ..., view = interactive())

# S3 method for class 'rtf_text'
print(x, ...)
```

## Arguments

- x:

  Object to be printed.

- ...:

  Any additional parameters.

- view:

  The value for [`print()`](https://rdrr.io/r/base/print.html)s `browse`
  argument.
