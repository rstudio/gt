# Remove the table caption

We can easily remove the caption text from a **gt** table with
`rm_caption()`. The caption may exist if it were set through the
[`gt()`](https://gt.rstudio.com/reference/gt.md) `caption` argument or
via [`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md).

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that the table not have a caption at all. This function is safe to use
even if there is no table caption set in the input `gt_tbl` object.

## Usage

``` r
rm_caption(data)
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

Use a portion of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. We'll add a header part with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md), and, a
caption will also be added via
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md).

    gt_tbl <-
      gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      tab_caption(caption = md("**gt** table example."))

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_caption()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_caption_1.png)

If you decide that you don't want the caption in the `gt_tbl` object, it
can be removed with `rm_caption()`.

    rm_caption(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_caption()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_caption_2.png)

## Function ID

7-6

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
[`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
[`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
[`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
[`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md)
