# Remove table footnotes

If you have one or more footnotes that ought to be removed,
`rm_footnotes()` allows for such a selective removal. The table footer
is an optional table part that is positioned below the table body,
containing areas for both the footnotes and source notes.

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that some or all of the footnotes be removed. This function is safe to
use even if there are no footnotes in the input `gt_tbl` object so long
as select helpers (such as the default
[`everything()`](https://tidyselect.r-lib.org/reference/everything.html))
are used instead of explicit integer values.

## Usage

``` r
rm_footnotes(data, footnotes = everything())
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- footnotes:

  *Footnotes to remove*

  `scalar<numeric|integer>|everything()` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  A specification of which footnotes should be removed. The footnotes to
  be removed can be given as a vector of integer values (they are stored
  as integer positions, in order of creation, starting at `1`). A select
  helper can also be used and, by default, this is
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  (whereby all footnotes will be removed).

## Value

An object of class `gt_tbl`.

## Examples

Use a subset of the [`sza`](https://gt.rstudio.com/reference/sza.md)
dataset to create a **gt** table. Color the `sza` column using
[`data_color()`](https://gt.rstudio.com/reference/data_color.md), then,
use [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
twice to add two footnotes (each one targeting a different column
label).

    gt_tbl <-
      sza |>
      dplyr::filter(
        latitude == 20 &
          month == "jan" &
          !is.na(sza)
      ) |>
      dplyr::select(-latitude, -month) |>
      gt() |>
      data_color(
        columns = sza,
        palette = c("white", "yellow", "navyblue"),
        domain = c(0, 90)
      ) |>
      tab_footnote(
        footnote = "Color indicates height of sun.",
        locations = cells_column_labels(
          columns = sza
        )
      ) |>
      tab_footnote(
        footnote = "
        The true solar time at the given latitude
        and date (first of month) for which the
        solar zenith angle is calculated.
        ",
        locations = cells_column_labels(
          columns = tst
        )
      ) |>
      cols_width(everything() ~ px(150))

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_footnotes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_footnotes_1.png)

If you decide that you don't want the footnotes in the `gt_tbl` object,
they can be removed with `rm_footnotes()`.

    rm_footnotes(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_footnotes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_footnotes_2.png)

Individual footnotes can be selectively removed. Footnotes are
identified by their index values. To remove the footnote concerning true
solar time (footnote `2`, since it was supplied to **gt** after the
other footnote) we would give the correct index value to `footnotes`.

    rm_footnotes(data = gt_tbl, footnotes = 2)

![This image of a table was generated from the third code example in the
\`rm_footnotes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_footnotes_3.png)

## Function ID

7-4

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md),
[`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
[`rm_source_notes()`](https://gt.rstudio.com/reference/rm_source_notes.md),
[`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
[`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md)
