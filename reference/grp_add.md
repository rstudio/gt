# Add one or more **gt** tables to a `gt_group` container object

Should you have a `gt_group` object, created through use of the
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) function,
you might want to add more **gt** tables to that container. While it's
common to generate a `gt_group` object with a collection of `gt_tbl`
objects, one can also create an 'empty' `gt_group` object. Whatever your
workflow might be, the `grp_add()` function makes it possible to
flexibly add one or more new **gt** tables, returning a refreshed
`gt_group` object.

## Usage

``` r
grp_add(.data, ..., .list = list2(...), .before = NULL, .after = NULL)
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

- .before, .after:

  *Table used as anchor*

  `scalar<numeric|integer>` // *default:* `NULL` (`optional`)

  A single index for either `.before` or `.after`, specifying where the
  supplied `gt_tbl` objects should be placed amongst the existing
  collection of **gt** tables. If nothing is provided for either
  argument the incoming `gt_tbl` objects will be appended.

## Value

An object of class `gt_group`.

## Function ID

14-4

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
