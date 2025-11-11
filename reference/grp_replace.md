# Replace one or more **gt** tables in a `gt_group` container object

[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) can be used
to create a container for multiple **gt** tables. In some circumstances,
you might want to replace a specific `gt_tbl` object (or multiple) with
a different one. This can be done with `grp_replace()`. The important
thing is that the number of **gt** tables provided must equal the number
of indices for tables present in the `gt_group` object.

## Usage

``` r
grp_replace(.data, ..., .list = list2(...), .which)
```

## Arguments

- .data:

  *The gt table group object*

  `obj:<gt_group>` // **required**

  This is a `gt_group` container object. It is typically generated
  through use of
  [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) along
  with one or more `gt_tbl` objects, or, made by splitting a **gt**
  table with
  [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md).

- ...:

  *One or more gt table objects*

  `obj:<gt_tbl>` // **required** (or, use `.list`)

  One or more **gt** table (`gt_tbl`) objects, typically generated via
  the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- .list:

  *Alternative to `...`*

  `<list of multiple expressions>` // (or, use `...`)

  Allows for the use of a list as an input alternative to `...`.

- .which:

  *The tables to replace*

  `vector<numeric|integer>` // *default:* `NULL` (`optional`)

  A vector of index values denoting which **gt** tables should be
  replaced inside of the `gt_group` object.

## Value

An object of class `gt_group`.

## Function ID

14-6

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
