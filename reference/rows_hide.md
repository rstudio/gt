# Hide one or more rows

`rows_hide()` allows us to hide one or more rows from appearing in the
final output table. While it's possible and often desirable to omit rows
from the input table data before introduction to
[`gt()`](https://gt.rstudio.com/reference/gt.md), there can be cases
where the data in certain rows is useful (as a row reference during
formatting of other rows or for column-based aggregations) but the final
display of those rows is not necessary.

## Usage

``` r
rows_hide(data, rows)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- rows:

  *Rows to target*

  `<row-targeting expression>` // **required**

  The rows to hide in the output display table. Can either be a series
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

The hiding of rows is internally a rendering directive, so, all rows
that are 'hidden' are still accessible and useful in any expression
provided to a `columns` argument (for column-level operations).
Furthermore, `rows_hide()` (as with many **gt** functions) can be placed
anywhere in a pipeline of **gt** function calls (acting as a promise to
hide rows when the timing is right). However, there's perhaps greater
readability when placing this call closer to the end of such a pipeline.

`rows_hide()` quietly changes the visible state of a row (much like
[`rows_unhide()`](https://gt.rstudio.com/reference/rows_unhide.md)) and
doesn't yield warnings or messages when changing the state of
already-hidden rows.

## Examples

Let's use a small portion of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table. We can hide rows where the population is below
a certain threshold using `rows_hide()`.

    countrypops |>
      dplyr::filter(
        country_name == "Egypt",
        year %in% 2017:2021
      ) |>
      gt(rowname_col = "year") |>
      fmt_integer(columns = population) |>
      rows_hide(rows = population < 100E6)

![This image of a table was generated from the first code example in the
\`rows_hide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rows_hide_1.png)

Using another
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md)-based
**gt** table, we can hide specific rows by targeting them with their row
labels (from the stub). Note that the footnote placement still works
correctly, skipping the hidden rows in its mark indexing.

    countrypops |>
      dplyr::filter(
        country_name == "Brazil",
        year %in% 2017:2021
      ) |>
      gt(rowname_col = "year") |>
      fmt_integer(columns = population) |>
      rows_hide(rows = c("2018", "2020")) |>
      tab_footnote(
        footnote = "Population above 210,000,000.",
        locations = cells_body(
          columns = population,
          rows = population > 210E6
        )
      )

![This image of a table was generated from the second code example in
the \`rows_hide()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rows_hide_2.png)

## Function ID

6-7

## Function Introduced

*In Development*

## See also

Other row addition/modification functions:
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md),
[`row_order()`](https://gt.rstudio.com/reference/row_order.md),
[`rows_add()`](https://gt.rstudio.com/reference/rows_add.md),
[`rows_unhide()`](https://gt.rstudio.com/reference/rows_unhide.md),
[`summary_columns()`](https://gt.rstudio.com/reference/summary_columns.md),
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
