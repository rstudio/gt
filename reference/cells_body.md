# Location helper for targeting data cells in the table body

`cells_body()` is used to target the data cells in the table body. The
function can be used to apply a footnote with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md), to
add custom styling with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), or the
transform the targeted cells with
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md).
The function is expressly used in each of those functions' `locations`
argument. The 'body' location is present by default in every **gt**
table.

## Usage

``` r
cells_body(columns = everything(), rows = everything())
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

- rows:

  *Rows to target*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should form a constraint for targeting operations. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row IDs within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

## Value

A list object with the classes `cells_body` and `location_cells`.

## Targeting cells with `columns` and `rows`

Targeting of values is done through `columns` and additionally by `rows`
(if nothing is provided for `rows` then entire columns are selected).
The `columns` argument allows us to target a subset of cells contained
in the resolved columns. We say resolved because aside from declaring
column names in [`c()`](https://rdrr.io/r/base/c.html) (with bare column
names or names in quotes) we can use **tidyselect**-style expressions.
This can be as basic as supplying a select helper like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
or, providing a more complex incantation like

`where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any `NA`s from consideration).

Once the columns are targeted, we may also target the `rows` within
those columns. This can be done in a variety of ways. If a stub is
present, then we potentially have row identifiers. Those can be used
much like column names in the `columns`-targeting scenario. We can use
simpler **tidyselect**-style expressions (the select helpers should work
well here) and we can use quoted row identifiers in
[`c()`](https://rdrr.io/r/base/c.html). It's also possible to use row
indices (e.g., `c(3, 5, 6)`) though these index values must correspond
to the row numbers of the input data (the indices won't necessarily
match those of rearranged rows if row groups are present). One more type
of expression is possible, an expression that takes column values (can
involve any of the available columns in the table) and returns a logical
vector.

## Examples

Let's use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. Add a footnote (with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md))
that targets a single data cell via the use of `cells_body()` in
`locations` (`rows = hp == max(hp)` will target a single row in the `hp`
column).

    gtcars |>
      dplyr::filter(ctry_origin == "United Kingdom") |>
      dplyr::select(mfr, model, year, hp) |>
      gt() |>
      tab_footnote(
        footnote = "Highest horsepower.",
        locations = cells_body(
          columns = hp,
          rows = hp == max(hp)
        ),
        placement = "right"
      ) |>
      opt_footnote_marks(marks = c("*", "+"))

![This image of a table was generated from the first code example in the
\`cells_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cells_body_1.png)

## Function ID

8-18

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other location helper functions:
[`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md),
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
