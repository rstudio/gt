# Remove one or more **gt** tables from a `gt_group` container object

A `gt_group` object, created through use of the
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) function,
can hold a multiple of **gt** tables. However, you might want to delete
one or more `gt_tbl` objects table from that container. With `grp_rm()`,
this is possible and safe to perform. What's returned is a `gt_group`
object with the specified `gt_tbl` objects gone. The only thing you need
to provide is the index value for the **gt** table within the `gt_group`
object.

## Usage

``` r
grp_rm(data, which)
```

## Arguments

- data:

  *The gt table group object*

  `obj:<gt_group>` // **required**

  This is a `gt_group` container object. It is typically generated
  through use of
  [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) along
  with one or more `gt_tbl` objects, or, made by splitting a **gt**
  table with
  [`gt_split()`](https://gt.rstudio.com/reference/gt_split.md).

- which:

  *The table to remove from the group*

  `scalar<numeric|integer>` // **required**

  A single index value denoting which `gt_tbl` table should be removed
  from the `gt_group` object.

## Value

An object of class `gt_group`.

## Function ID

14-7

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
