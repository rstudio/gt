# Clone one or more **gt** tables in a `gt_group` container object

Should you have a `gt_group` object, created through use of the
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md) function,
you may in certain circumstances want to create replicas of `gt_tbl`
objects in that collection. This can be done with the `grp_clone()`
function and the placement of the cloned **gt** tables can be controlled
with either the `before` or `after` arguments.

## Usage

``` r
grp_clone(data, which = NULL, before = NULL, after = NULL)
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

  *The tables to clone*

  `vector<numeric|integer>` // *default:* `NULL` (`optional`)

  A vector of index values denoting which **gt** tables should be cloned
  inside of the `gt_group` object.

- before, after:

  *Table used as anchor*

  `scalar<numeric|integer>` // *default:* `NULL` (`optional`)

  A single index for either `before` or `after`, specifies where the
  cloned `gt_tbl` objects should be placed amongst the existing
  collection of **gt** tables. If nothing is provided for either
  argument, the incoming `gt_tbl` objects will be appended.

## Value

An object of class `gt_group`.

## Function ID

14-5

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table group functions:
[`grp_add()`](https://gt.rstudio.com/reference/grp_add.md),
[`grp_options()`](https://gt.rstudio.com/reference/grp_options.md),
[`grp_pull()`](https://gt.rstudio.com/reference/grp_pull.md),
[`grp_replace()`](https://gt.rstudio.com/reference/grp_replace.md),
[`grp_rm()`](https://gt.rstudio.com/reference/grp_rm.md),
[`gt_group()`](https://gt.rstudio.com/reference/gt_group.md),
[`gt_split()`](https://gt.rstudio.com/reference/gt_split.md)
