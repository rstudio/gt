# Helper to target cells at `locations`

This listing with locations corresponding roughly from top to bottom of
a table:

- [`cells_title()`](https://gt.rstudio.com/reference/cells_title.md):
  targets the table title or the table subtitle depending on the value
  given to the `groups` argument (`"title"` or `"subtitle"`).

- [`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md):
  targets the stubhead location, a cell of which is only available when
  there is a stub; a label in that location can be created by using
  [`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md).

- [`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md)\*:
  targets the spanner column labels with the `spanners` argument;
  spanner column labels appear above the column labels.

- [`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md)\*:
  targets the column labels with its `columns` argument.

- [`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md)\*:
  targets the row group labels in any available row groups using the
  `groups` argument.

- [`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md)\*:
  targets row labels in the table stub using the `rows` argument.

- [`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)\*:
  targets data cells in the table body using intersections of `columns`
  and `rows`.

- [`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md):
  targets summary cells in the table body using the `groups` argument
  and intersections of `columns` and `rows`.

- [`cells_grand_summary()`](https://gt.rstudio.com/reference/cells_grand_summary.md):
  targets cells of the table's grand summary using intersections of
  `columns` and `rows`

- [`cells_stub_summary()`](https://gt.rstudio.com/reference/cells_stub_summary.md):
  targets summary row labels in the table stub using the `groups` and
  `rows` arguments.

- [`cells_stub_grand_summary()`](https://gt.rstudio.com/reference/cells_stub_grand_summary.md):
  targets grand summary row labels in the table stub using the `rows`
  argument.

- [`cells_footnotes()`](https://gt.rstudio.com/reference/cells_footnotes.md):
  targets all footnotes in the table footer (cannot be used with
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)).

- [`cells_source_notes()`](https://gt.rstudio.com/reference/cells_source_notes.md):
  targets all source notes in the table footer (cannot be used with
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)).

`*` are the only functions usable by the `text_*()` functions.

## Note

When using any of the location helper functions with an appropriate
function that has a `locations` argument (e.g.,
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)),
multiple locations can be targeted by enclosing several `cells_*()`
helper functions in a [`list()`](https://rdrr.io/r/base/list.html)
(e.g., `list(cells_body(), cells_grand_summary())`).

## See also

Functions with `locations` argument:

- [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)

- [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)

- [`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)

- [`text_replace()`](https://gt.rstudio.com/reference/text_replace.md)

- [`text_case_when()`](https://gt.rstudio.com/reference/text_case_when.md)

- [`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md)

These functions contain more example of usage.

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
[`cells_stubhead()`](https://gt.rstudio.com/reference/cells_stubhead.md),
[`cells_summary()`](https://gt.rstudio.com/reference/cells_summary.md),
[`cells_title()`](https://gt.rstudio.com/reference/cells_title.md)
