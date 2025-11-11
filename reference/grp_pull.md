# Pull out a **gt** table from a `gt_group` container object

Should you have a `gt_group` object, created through use of
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md), you may
have a need to extract a **gt** table from that container. `grp_pull()`
makes this possible, returning a `gt_tbl` object. The only thing you
need to provide is the index value for the **gt** table within the
`gt_group` object.

## Usage

``` r
grp_pull(data, which)
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

  *The table to pull from the group*

  `scalar<numeric|integer>` // **required**

  A single index value denoting which `gt_tbl` table should be obtained
  from the `gt_group` object.

## Value

An object of class `gt_tbl`.

## Function ID

14-3

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_clone()`](https://gt.rstudio.com/reference/grp_clone.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
