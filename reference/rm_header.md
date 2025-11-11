# Remove the table header

We can remove the table header from a **gt** table quite easily with
`rm_header()`. The table header is an optional table part (positioned
above the column labels) that can be added through
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md).

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that the table not contain a header. This function is safe to use even
if there is no header part in the input `gt_tbl` object.

## Usage

``` r
rm_header(data)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

## Value

An object of class `gt_tbl`.

## Examples

Let's use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. A header part can be added with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md); with
that, we get a title and a subtitle for the table.

    gt_tbl <-
      gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      )

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_header_1.png)

If you decide that you don't want the header in the `gt_tbl` object, it
can be removed with `rm_header()`.

    rm_header(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_header()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_header_2.png)

## Function ID

7-1

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md),
[`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
[`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
[`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
[`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md)
