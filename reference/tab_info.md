# Understand what's been set inside of a **gt** table object

It can become increasingly difficult to recall the ID values associated
with different labels in a **gt** table. Further to this, there are also
situations where **gt** will generate ID values on your behalf (e.g.,
with
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
etc.) while ensuring that duplicate ID values aren't produced. For the
latter case, it is impossible to know what those ID values are unless
one were to carefully examine to correct component of the `gt_tbl`
object.

Because it's so essential to know these ID values for targeting purposes
(when styling with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), adding
footnote marks with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
etc.), `tab_info()` can help with all of this. It summarizes (by
location) all of the table's ID values and their associated labels. The
product is an informational **gt** table, designed for easy retrieval of
the necessary values.

## Usage

``` r
tab_info(data)
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

Let's use a portion of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. We'll use
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) to
group two columns together under a spanner column with the ID and label
`"performance"`. Finally, we can use`tab_info()` in a separate,
interactive statement so that we can inspect a table that summarizes the
ID values any associated label text for all parts of the table.

    gt_tbl <-
      gtcars |>
      dplyr::select(model, year, starts_with("hp"), msrp) |>
      dplyr::slice(1:4) |>
      gt(rowname_col = "model") |>
      tab_spanner(
        label = "performance",
        columns = starts_with("hp")
      )

    gt_tbl |> tab_info()

![This image of a table was generated from the first code example in the
\`tab_info()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_info_1.png)

## Function ID

2-12

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
