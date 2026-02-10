# Unhide one or more rows

`rows_unhide()` allows us to take one or more hidden rows (usually done
via [`rows_hide()`](https://gt.rstudio.com/reference/rows_hide.md)) and
make them visible in the final output table. This may be important in
cases where the user obtains a `gt_tbl` object with hidden rows and
there is motivation to reveal one or more of those.

## Usage

``` r
rows_unhide(data, rows)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- rows:

  *Rows to target*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The rows to unhide in the output display table. Can either be a series
  of row IDs provided in [`c()`](https://rdrr.io/r/base/c.html), a
  vector of row indices, or a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[column_1] > 100 & [column_2] < 50`).

## Value

An object of class `gt_tbl`.

## Details

The hiding and unhiding of rows is internally a rendering directive, so,
all rows that are 'hidden' are still accessible and useful in any
expression provided to a `columns` argument. The `rows_unhide()`
function quietly changes the visible state of a row (much like the
[`rows_hide()`](https://gt.rstudio.com/reference/rows_hide.md) function)
and doesn't yield warnings or messages when changing the state of
already-visible rows.

## Examples

Let's use a small portion of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table. We'll hide all rows but then unhide specific
ones.

    tab_1 <-
      countrypops |>
      dplyr::filter(
        country_name == "Japan",
        year %in% 2017:2021
      ) |>
      gt(rowname_col = "year") |>
      fmt_integer(columns = population) |>
      rows_hide(rows = everything())

    tab_1

![This image of a table was generated from the first code example in the
\`rows_unhide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rows_unhide_1.png)

If we obtain the `tab_1` object without access to the code or source
data, and we want to reveal otherwise hidden rows, then `rows_unhide()`
becomes useful.

    tab_1 |> rows_unhide(rows = c("2019", "2021"))

![This image of a table was generated from the second code example in
the \`rows_unhide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rows_unhide_2.png)

## Function ID

6-8

## Function Introduced

*In Development*

## See also

Other row addition/modification functions:
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md),
[`row_order()`](https://gt.rstudio.com/reference/row_order.md),
[`rows_add()`](https://gt.rstudio.com/reference/rows_add.md),
[`rows_hide()`](https://gt.rstudio.com/reference/rows_hide.md),
[`summary_columns()`](https://gt.rstudio.com/reference/summary_columns.md),
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
