# Modify the ordering of any row groups

We can modify the display order of any row groups in a **gt** object
with `row_group_order()`. The `groups` argument takes a vector of row
group ID values. After this function is invoked, the row groups will
adhere to this revised ordering. It isn't necessary to provide all row
ID values in `groups`, rather, what is provided will assume the
specified ordering at the top of the table and the remaining row groups
will follow in their original ordering.

## Usage

``` r
row_group_order(data, groups)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- groups:

  *Specification of row group IDs*

  `vector<character>` // **required**

  A character vector of row group ID values corresponding to the revised
  ordering. While this vector must contain valid group ID values, it is
  not required to have all of the row group IDs within it; any omitted
  values will be added to the end while preserving the original
  ordering.

## Value

An object of class `gt_tbl`.

## Examples

Let's use [`exibble`](https://gt.rstudio.com/reference/exibble.md) to
create a **gt** table with a stub and with row groups. We can modify the
order of the row groups with `row_group_order()`, specifying the new
ordering in `groups`.

    exibble |>
      dplyr::select(char, currency, row, group) |>
      gt(
        rowname_col = "row",
        groupname_col = "group"
      ) |>
      row_group_order(groups = c("grp_b", "grp_a"))

![This image of a table was generated from the first code example in the
\`row_group_order()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_row_group_order_1.png)

## Function ID

6-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other row addition/modification functions:
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
[`rows_add()`](https://gt.rstudio.com/reference/rows_add.md),
[`summary_columns()`](https://gt.rstudio.com/reference/summary_columns.md),
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
