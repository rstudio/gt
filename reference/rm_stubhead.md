# Remove the stubhead label

We can easily remove the stubhead label from a **gt** table with
`rm_stubhead()`. The stubhead location only exists if there is a table
stub and the text in that cell is added with
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md).

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that the table not contain any content in the stubhead. This function is
safe to use even if there is no stubhead label in the input `gt_tbl`
object.

## Usage

``` r
rm_stubhead(data)
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

Using the [`gtcars`](https://gt.rstudio.com/reference/gtcars.md)
dataset, we'll create a **gt** table. With
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
it's possible to add a stubhead label. This appears in the top-left and
can be used to describe what is in the stub.

    gt_tbl <-
      gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:5) |>
      gt(rowname_col = "model") |>
      tab_stubhead(label = "car")

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_stubhead_1.png)

If you decide that you don't want the stubhead label in the `gt_tbl`
object, it can be removed with `rm_stubhead()`.

    rm_stubhead(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_stubhead_2.png)

## Function ID

7-2

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md),
[`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
[`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
[`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
[`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md)
