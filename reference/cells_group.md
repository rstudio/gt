# Location helper for targeting row groups (deprecated)

Location helper for targeting row groups (deprecated)

## Usage

``` r
cells_group(groups = everything())
```

## Arguments

- groups:

  *Specification of row group IDs*

  `<row-group-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The row groups to which targeting operations are constrained. Can
  either be a series of row group ID values provided in
  [`c()`](https://rdrr.io/r/base/c.html) or a select helper function
  (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

## Function Introduced

`v0.2.0.5` (March 31, 2020)
