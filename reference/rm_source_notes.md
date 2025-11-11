# Remove table source notes

If you have one or more source notes that ought to be removed,
`rm_source_notes()` allows for such a selective removal. The table
footer is an optional table part that is positioned below the table
body, containing areas for both the source notes and footnotes.

This function for removal is useful if you have received a **gt** table
(perhaps through an API that returns **gt** objects) but would prefer
that some or all of the source notes be removed. This function is safe
to use even if there are no source notes in the input `gt_tbl` object so
long as select helpers (such as the default
[`everything()`](https://tidyselect.r-lib.org/reference/everything.html))
are used instead of explicit integer values.

## Usage

``` r
rm_source_notes(data, source_notes = everything())
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- source_notes:

  *Source notes to remove*

  `scalar<numeric|integer>|everything()` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  A specification of which source notes should be removed. The source
  notes to be removed can be given as a vector of integer values (they
  are stored as integer positions, in order of creation, starting at
  `1`). A select helper can also be used and, by default, this is
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  (whereby all source notes will be removed).

## Value

An object of class `gt_tbl`.

## Examples

Use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table.
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md)
is used to add a source note to the table footer that cites the data
source (or, it could just be arbitrary text). We'll use the function
twice, in effect adding two source notes to the footer.

    gt_tbl <-
      gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_source_note(source_note = "Data from the 'edmunds.com' site.") |>
      tab_source_note(source_note = "Showing only the first five rows.") |>
      cols_width(everything() ~ px(120))

    gt_tbl

![This image of a table was generated from the first code example in the
\`rm_source_notes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_source_notes_1.png)

If you decide that you don't want the source notes in the `gt_tbl`
object, they can be removed with `rm_source_notes()`.

    rm_source_notes(data = gt_tbl)

![This image of a table was generated from the second code example in
the \`rm_source_notes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_source_notes_2.png)

Individual source notes can be selectively removed. Source notes are
identified by their index values. To remove the source note concerning
the extent of the data (source note `2`, since it was supplied to **gt**
after the other source note) we would give the correct index value to
`source_notes`.

    rm_source_notes(data = gt_tbl, source_notes = 2)

![This image of a table was generated from the third code example in the
\`rm_source_notes()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_rm_source_notes_3.png)

## Function ID

7-5

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part removal functions:
[`rm_caption()`](https://gt.rstudio.com/reference/rm_caption.md),
[`rm_footnotes()`](https://gt.rstudio.com/reference/rm_footnotes.md),
[`rm_header()`](https://gt.rstudio.com/reference/rm_header.md),
[`rm_spanners()`](https://gt.rstudio.com/reference/rm_spanners.md),
[`rm_stubhead()`](https://gt.rstudio.com/reference/rm_stubhead.md)
