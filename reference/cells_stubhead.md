# Location helper for targeting the table stubhead cell

`cells_stubhead()` is used to target the table stubhead location when
applying a footnote with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) or
adding custom style with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). The
function is expressly used in each of those functions' `locations`
argument. The 'stubhead' location is always present alongside the 'stub'
location.

## Usage

``` r
cells_stubhead()
```

## Value

A list object with the classes `cells_stubhead` and `location_cells`.

## Examples

Using a summarized version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
let's create a **gt** table. Add a stubhead label with
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md) and
then style it with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) in
conjunction with the use of `cells_stubhead()` in the `locations`
argument.

    pizzaplace |>
      dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
      dplyr::group_by(month, type) |>
      dplyr::summarize(sold = dplyr::n(), .groups = "drop") |>
      dplyr::filter(month %in% 1:2) |>
      gt(rowname_col = "type") |>
      tab_stubhead(label = "type") |>
      tab_style(
        style = cell_fill(color = "lightblue"),
        locations = cells_stubhead()
      )

![This image of a table was generated from the first code example in the
\`cells_stubhead()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cells_stubhead_1.png)

## Function ID

8-13

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other location helper functions:
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md),
[`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md),
[`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md),
[`cells_footnotes()`](https://gt.rstudio.com/reference/cells_footnotes.md),
[`cells_grand_summary()`](https://gt.rstudio.com/reference/cells_grand_summary.md),
[`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md),
[`cells_source_notes()`](https://gt.rstudio.com/reference/cells_source_notes.md),
[`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md),
[`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md),
[`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md),
[`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md),
[`cells_title()`](https://gt.rstudio.com/reference/cells_title.md),
[`location-helper`](https://gt.rstudio.com/reference/location-helper.md)
