# Target cells in the table body and style accordingly

With `tab_style_body()` we can target cells through value, regex, and
custom matching rules and apply styles to them and their surrounding
context (i.e., styling an entire row or column wherein the match is
found). Just as with the general
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) function,
this function is focused on the application of styles for HTML output
only (as such, other output formats will ignore all
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) calls).

With the collection of `cell_*()` helper functions available in **gt**,
we can modify:

- the background color of the cell
  ([`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md):
  `color`)

- the cell's text color, font, and size
  ([`cell_text()`](https://gt.rstudio.com/reference/cell_text.md):
  `color`, `font`, `size`)

- the text style
  ([`cell_text()`](https://gt.rstudio.com/reference/cell_text.md):
  `style`), enabling the use of italics or oblique text.

- the text weight
  ([`cell_text()`](https://gt.rstudio.com/reference/cell_text.md):
  `weight`), allowing the use of thin to bold text (the degree of choice
  is greater with variable fonts)

- the alignment and indentation of text
  ([`cell_text()`](https://gt.rstudio.com/reference/cell_text.md):
  `align` and `indent`)

- the cell borders
  ([`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md))

## Usage

``` r
tab_style_body(
  data,
  style,
  columns = everything(),
  rows = everything(),
  values = NULL,
  pattern = NULL,
  fn = NULL,
  targets = "cell",
  extents = "body"
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- style:

  *Style declarations*

  `<style expressions>` // **required**

  The styles to use for the targeted cells.
  [`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
  [`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md), and
  [`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md)
  can be used here to more easily generate valid styles. If using more
  than one helper function to define styles, all calls must be enclosed
  in a [`list()`](https://rdrr.io/r/base/list.html). Custom CSS
  declarations can be used for HTML output by including a
  [`css()`](https://rstudio.github.io/htmltools/reference/css.html)-based
  statement as a list item.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns to which substitution operations are constrained. Can
  either be a series of column names provided in
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

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
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

- values:

  *Values for targeting*

  `vector<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The specific value or values that should be targeted for styling. If
  `pattern` is also supplied then `values` will be ignored.

- pattern:

  *Regex pattern for targeting*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A regex pattern that can target solely those values in
  `character`-based columns. If `values` is also supplied, `pattern`
  will take precedence.

- fn:

  *Function to return logical values*

  `<function>` // *default:* `NULL` (`optional`)

  A supplied function that operates on each cell of each column
  specified through `columns` and `rows`. The function should be
  fashioned such that a single logical value is returned. If either of
  `values` or `pattern` is also supplied, `fn` will take precedence.

- targets:

  *Styling targets*

  `vector<character>` // *default:* `"cell"`

  A vector of styling target keywords to contain or expand the target of
  each cell. By default, this is a vector just containing `"cell"`.
  However, the keywords `"row"` and `"column"` may be used separately or
  in combination to style the target cells' associated rows or columns.

- extents:

  *Styling extents*

  `vector<character>` // *default:* `"body"`

  A vector of locations to project styling. By default, this is a vector
  just containing `"body"`, whereby styled rows or columns (facilitated
  via inclusion of the `"row"` and `"column"` keywords in `targets`)
  will not permeate into the stub. The additional keyword `"stub"` may
  be used alone or in conjunction with `"body"` to project or expand the
  styling into the stub.

## Value

An object of class `gt_tbl`.

## Examples

Use `exibble` to create a **gt** table with a stub and row groups. This
contains an assortment of values that could potentially undergo some
styling via `tab_style_body()`.

    gt_tbl <-
      exibble |>
      gt(
        rowname_col = "row",
        groupname_col = "group"
      )

Cells in the table body can be styled through specification of literal
values in the `values` argument of `tab_style_body()`. It's okay to
search for numerical, character, or logical values across all columns.
Let's target the values `49.95` and `33.33` and style those cells with
an orange fill.

    gt_tbl |>
      tab_style_body(
        style = cell_fill(color = "orange"),
        values = c(49.95, 33.33)
      )

![This image of a table was generated from the first code example in the
\`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_1.png)

Multiple styles can be combined in a `list`, here's an example of that
using the same cell targets:

    gt_tbl |>
      tab_style_body(
        style = list(
          cell_text(font = google_font("Inter"), color = "white"),
          cell_fill(color = "red"),
          cell_borders(
            sides = c("left", "right"),
            color = "steelblue",
            weight = px(4)
          )
        ),
        values = c(49.95, 33.33)
      )

![This image of a table was generated from the second code example in
the \`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_2.png)

You can opt to color entire rows or columns (or both, should you want
to) with those specific keywords in the `targets` argument. For the
`49.95` value we will style the entire row and with `33.33` the entire
column will get the same styling.

    gt_tbl |>
      tab_style_body(
        style = cell_fill(color = "lightblue"),
        values = 49.95,
        targets = "row"
      ) |>
      tab_style_body(
        style = cell_fill(color = "lightblue"),
        values = 33.33,
        targets = "column"
      )

![This image of a table was generated from the third code example in the
\`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_3.png)

In a minor variation to the prior example, it's possible to extend the
styling to other locations, or, entirely project the styling elsewhere.
This is done with the `extents` argument. Valid keywords that can be
included in the vector are: `"body"` (the default) and `"stub"`. Let's
take the previous example and extend the styling of the row into the
stub.

    gt_tbl |>
      tab_style_body(
        style = cell_fill(color = "lightblue"),
        values = 49.95,
        targets = "row",
        extents = c("body", "stub")
      ) |>
      tab_style_body(
        style = cell_fill(color = "lightblue"),
        values = 33.33,
        targets = "column"
      )

![This image of a table was generated from the fourth code example in
the \`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_4.png)

We can also use the `pattern` argument to target cell values in
`character`-based columns. The `"fctr"` column is skipped because it is
in fact a factor-based column.

    gt_tbl |>
      tab_style_body(
        style = cell_fill(color = "green"),
        pattern = "ne|na"
      )

![This image of a table was generated from the fifth code example in the
\`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_5.png)

For the most flexibility in targeting, it's best to use the `fn`
argument. The function you give to `fn` will be invoked separately on
all cells so the `columns` argument of `tab_style_body()` might be
useful to limit which cells should be evaluated. For this next example,
the supplied function should only be used on numeric values and we can
make sure of this by using `columns = where(is.numeric)`.

    gt_tbl |>
      tab_style_body(
        columns = where(is.numeric),
        style = cell_fill(color = "pink"),
        fn = function(x) x >= 0 && x < 50
      )

![This image of a table was generated from the sixth code example in the
\`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_6.png)

Styling every `NA` value in a table is also easily accomplished with the
`fn` argument by way of [`is.na()`](https://rdrr.io/r/base/NA.html).

    gt_tbl |>
      tab_style_body(
        style = cell_text(color = "red3"),
        fn = function(x) is.na(x)
      ) |>
      sub_missing(missing_text = "Not Available")

![This image of a table was generated from the seventh code example in
the \`tab_style_body()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_style_body_7.png)

## Function ID

2-11

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)
