# Create a `gt_group` container for holding multiple **gt** table objects

`gt_group()` creates a container for storage of multiple **gt** tables.
This type of object allows for flexibility in printing multiple tables
in different output formats. For example, if printing multiple tables in
a paginated output environment (e.g., RTF, Word, etc.), each **gt**
table can be printed independently and table separation (usually a page
break) occurs between each of those.

## Usage

``` r
gt_group(..., .list = list2(...), .use_grp_opts = FALSE)
```

## Arguments

- ...:

  *One or more gt table data objects*

  `obj:<gt_tbl>` // (`optional`)

  One or more **gt** table (`gt_tbl`) objects, typically generated via
  the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- .list:

  *Alternative to `...`*

  `<list of multiple expressions>` // (or, use `...`)

  Allows for the use of a list as an input alternative to `...`.

- .use_grp_opts:

  *Apply options to all contained tables?*

  `scalar<logical>` // *default:* `FALSE`

  Should options specified in the `gt_group` object be applied to all
  contained **gt** tables? By default this is `FALSE`.

## Value

An object of class `gt_group`.

## Function ID

14-1

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
