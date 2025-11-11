# Location helper for targeting the column labels

`cells_column_labels()` is used to target the table's column labels when
applying a footnote with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) or
adding custom style with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). The
function is expressly used in each of those functions' `locations`
argument. The 'column_labels' location is present by default in every
**gt** table.

## Usage

``` r
cells_column_labels(columns = everything())
```

## Arguments

- columns:

  *Columns to target*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns to which targeting operations are constrained. Can either
  be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

## Value

A list object with the classes `cells_column_labels` and
`location_cells`.

## Targeting columns with the `columns` argument

The `columns` argument allows us to target a subset of columns contained
in the table. We can declare column names in
[`c()`](https://rdrr.io/r/base/c.html) (with bare column names or names
in quotes) or we can use **tidyselect**-style expressions. This can be
as basic as supplying a select helper like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
or, providing a more complex incantation like

`where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any `NA`s from consideration).

## Examples

Let's use a small portion of the
[`sza`](https://gt.rstudio.com/reference/sza.md) dataset to create a
**gt** table. Add footnotes to the column labels with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) and
`cells_column_labels()` in `locations`.

    sza |>
      dplyr::filter(
        latitude == 20 & month == "jan" &
          !is.na(sza)
      ) |>
      dplyr::select(-latitude, -month) |>
      gt() |>
      tab_footnote(
        footnote = "True solar time.",
        locations = cells_column_labels(
          columns = tst
        )
      ) |>
      tab_footnote(
        footnote = "Solar zenith angle.",
        locations = cells_column_labels(
          columns = sza
        )
      )

![This image of a table was generated from the first code example in the
\`cells_column_labels()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cells_column_labels_1.png)

## Function ID

8-15

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other location helper functions:
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md),
[`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md),
[`cells_footnotes()`](https://gt.rstudio.com/reference/cells_footnotes.md),
[`cells_grand_summary()`](https://gt.rstudio.com/reference/cells_grand_summary.md),
[`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md),
[`cells_source_notes()`](https://gt.rstudio.com/reference/cells_source_notes.md),
[`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md),
[`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md),
[`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md),
[`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md),
[`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md),
[`cells_title()`](https://gt.rstudio.com/reference/cells_title.md),
[`location-helper`](https://gt.rstudio.com/reference/location-helper.md)
