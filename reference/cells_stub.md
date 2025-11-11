# Location helper for targeting cells in the table stub

`cells_stub()` is used to target the table's stub cells and it is useful
when applying a footnote with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) or
adding a custom style with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). The
function is expressly used in each of those functions' `locations`
argument. Here are several ways that a stub location might be available
in a **gt** table: (1) through specification of a `rowname_col` in
[`gt()`](https://gt.rstudio.com/reference/gt.md), (2) by introducing a
data frame with row names to
[`gt()`](https://gt.rstudio.com/reference/gt.md) with
`rownames_to_stub = TRUE`, or (3) by using
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md) or
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
with neither of the previous two conditions being true.

## Usage

``` r
cells_stub(rows = everything(), columns = NULL)
```

## Arguments

- rows:

  *Rows to target*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The rows to which targeting operations are constrained. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in the stub being targeted. Multiple targeting
  methods are supported:

  **Numeric indices:** A vector of row indices within
  [`c()`](https://rdrr.io/r/base/c.html) (e.g., `c(1, 3, 5)`).

  **Content-based targeting:** A vector of content values within
  [`c()`](https://rdrr.io/r/base/c.html) that match values in any stub
  column (e.g., `c("Ford", "BMW")` to target all rows containing those
  manufacturer names). This is particularly useful for multi-column
  stubs where you want to target based on content rather than
  calculating row indices.

  **Select helpers:** Use functions like
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html).

  **Expressions:** Filter expressions to target specific rows (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

  When using content-based targeting with multi-column stubs, the
  function will search all stub columns for matching values unless
  specific `columns` are provided to constrain the search.

- columns:

  *Stub columns to target*

  `<column-targeting expression>` // *default:* `NULL` (`optional`)

  The stub columns to which targeting operations are constrained. By
  default (`NULL`), all stub columns are targeted for backward
  compatibility. For tables with multi-column stubs (created with
  `gt(rowname_col = c(...))` or when `row_group_as_column = TRUE`), you
  can target specific columns by providing a vector of column names
  within [`c()`](https://rdrr.io/r/base/c.html), a vector of column
  indices, or a select helper function. When `columns` is specified,
  only the intersection of the specified columns and rows will be
  targeted. For single-column stubs, this argument can be omitted for
  traditional behavior.

## Value

A list object with the classes `cells_stub` and `location_cells`.

## Examples

Let's create a **gt** table using a transformed version of the
[`sza`](https://gt.rstudio.com/reference/sza.md) dataset. We'll color
all of the `month` values in the table stub with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), using
`cells_stub()` in `locations`.

    sza |>
      dplyr::filter(latitude == 20 & tst <= "1000") |>
      dplyr::select(-latitude) |>
      dplyr::filter(!is.na(sza)) |>
      tidyr::pivot_wider(
        names_from = "tst",
        values_from = sza,
        names_sort = TRUE
      ) |>
      gt(rowname_col = "month") |>
      sub_missing(missing_text = "") |>
      tab_style(
        style = list(
          cell_fill(color = "darkblue"),
          cell_text(color = "white")
          ),
        locations = cells_stub()
      )

![This image of a table was generated from the first code example in the
\`cells_stub()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cells_stub_1.png)

For multi-column stubs, you can target specific columns. Here's an
example with a table that has multiple stub columns:

    # Create a table with multi-column stub
    dplyr::tibble(
      country = rep(c("USA", "Canada"), each = 3),
      region = rep(c("North", "South", "West"), 2),
      pop_2020 = c(5000, 3000, 2000, 4000, 3500, 1500),
      pop_2021 = c(5100, 3100, 2100, 4100, 3600, 1600)
    ) |>
      gt(rowname_col = c("country", "region")) |>
      tab_style(
        style = cell_fill(color = "lightblue"),
        locations = cells_stub(columns = "country", rows = 1:2)
      ) |>
      tab_style(
        style = cell_text(weight = "bold"),
        locations = cells_stub(columns = "region", rows = c(1, 3, 5))
      )

You can also use content-based targeting to target rows by their actual
values rather than calculating row indices:

    # Content-based targeting example
    gtcars |>
      dplyr::select(mfr, model, year, hp, msrp) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = c("mfr", "model")) |>
      tab_style(
        style = cell_fill(color = "lightcoral"),
        locations = cells_stub(rows = "Ford")  # Targets all Ford rows
      ) |>
      tab_style(
        style = cell_text(weight = "bold"),
        locations = cells_stub(rows = c("BMW", "Audi"), columns = "mfr")
      )

## Function ID

8-17

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
[`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md),
[`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md),
[`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md),
[`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md),
[`cells_title()`](https://gt.rstudio.com/reference/cells_title.md),
[`location-helper`](https://gt.rstudio.com/reference/location-helper.md)
