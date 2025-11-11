# Add a row group to a **gt** table

We can create a row group from a collection of rows with
`tab_row_group()`. This requires specification of the rows to be
included, either by supplying row labels, row indices, or through use of
a select helper function like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html).
To modify the order of row groups, we can use
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md).

To set a default row group label for any rows not formally placed in a
row group, we can use a separate call to
`tab_options(row_group.default_label = <label>)`. If this is not done
and there are rows that haven't been placed into a row group (where one
or more row groups already exist), those rows will be automatically
placed into a row group without a label.

## Usage

``` r
tab_row_group(data, label, rows, id = label, others_label = NULL, group = NULL)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- label:

  *Row group label text*

  `scalar<character>` // **required**

  The text to use for the row group label. We can optionally use
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) to style the text
  as Markdown or to retain HTML elements in the text.

- rows:

  *Rows to target*

  `<row-targeting expression>` // **required**

  The rows to be made components of the row group. We can supply a
  vector of row ID values within [`c()`](https://rdrr.io/r/base/c.html),
  a vector of row indices, or use select helpers (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

- id:

  *Row group ID*

  `scalar<character>` // *default:* `label`

  The ID for the row group. When accessing a row group through
  [`cells_row_groups()`](https://gt.rstudio.com/reference/cells_row_groups.md)
  (when using
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) or
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md))
  the `id` value is used as the reference (and not the `label`). If an
  `id` is not explicitly provided here, it will be taken from the
  `label` value. It is advisable to set an explicit `id` value if you
  plan to access this cell in a later function call and the label text
  is complicated (e.g., contains markup, is lengthy, or both). Finally,
  when providing an `id` value you must ensure that it is unique across
  all ID values set for row groups (the function will stop if `id` isn't
  unique).

- others_label:

  *[Deprecated](https://rdrr.io/r/base/Deprecated.html) Label for
  default row group*

  `scalar<character>` // *default:* `NULL` (`optional`)

  This argument is deprecated. Instead use
  `tab_options(row_group.default_label = <label>)`.

- group:

  *[Deprecated](https://rdrr.io/r/base/Deprecated.html) The group label*

  `scalar<character>` // *default:* `NULL` (`optional`)

  This argument is deprecated. Instead use `label`.

## Value

An object of class `gt_tbl`.

## Examples

Using a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset, let's
create a simple **gt** table with row labels (from the `model` column)
inside of a stub. This eight-row table begins with no row groups at all
but with a single use of `tab_row_group()`, we can specify a row group
that will contain any rows where the car model begins with a number.

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_row_group(
        label = "numbered",
        rows = matches("^[0-9]")
      )

![This image of a table was generated from the first code example in the
\`tab_row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_row_group_1.png)

This actually makes two row groups since there are row labels that don't
begin with a number. That second row group is a catch-all `NA` group,
and it doesn't display a label at all. Rather, it is set off from the
other group with a double line. This may be a preferable way to display
the arrangement of one distinct group and an 'others' or default group.
If that's the case but you'd like the order reversed, you can use
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md).

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_row_group(
        label = "numbered",
        rows = matches("^[0-9]")
      ) |>
      row_group_order(groups = c(NA, "numbered"))

![This image of a table was generated from the second code example in
the \`tab_row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_row_group_2.png)

Two more options include: (1) setting a default label for the 'others'
group (done through
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)), and
(2) creating row groups until there are no more unaccounted for rows.
Let's try the first option in the next example:

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_row_group(
        label = "numbered",
        rows = matches("^[0-9]")
      ) |>
      row_group_order(groups = c(NA, "numbered")) |>
      tab_options(row_group.default_label = "others")

![This image of a table was generated from the third code example in the
\`tab_row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_row_group_3.png)

The above use of the `row_group.default_label` in
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md) gets
the job done and provides a default label. One drawback is that the
default/`NA` group doesn't have an ID, so it can't as easily be styled
with [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md);
however, row groups have indices and the index for the `"others"` group
here is `1`.

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_row_group(
        label = "numbered",
        rows = matches("^[0-9]")
      ) |>
      row_group_order(groups = c(NA, "numbered")) |>
      tab_options(row_group.default_label = "others") |>
      tab_style(
        style = cell_fill(color = "bisque"),
        locations = cells_row_groups(groups = 1)
      ) |>
      tab_style(
        style = cell_fill(color = "lightgreen"),
        locations = cells_row_groups(groups = "numbered")
      )

![This image of a table was generated from the fourth code example in
the \`tab_row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_row_group_4.png)

Now let's try using `tab_row_group()` with our
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md)-based table such
that all rows are formally assigned to different row groups. We'll
define two row groups with the (Markdown-infused) labels
`"**Powerful Cars**"` and `"**Super Powerful Cars**"`. The distinction
between the groups is whether `hp` is lesser or greater than `600` (and
this is governed by the expressions provided to the `rows` argument).

    gtcars |>
      dplyr::select(model, year, hp, trq) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_row_group(
        label = md("**Powerful Cars**"),
        rows = hp < 600,
        id = "powerful"
      ) |>
      tab_row_group(
        label = md("**Super Powerful Cars**"),
        rows = hp >= 600,
        id = "v_powerful"
      ) |>
      tab_style(
        style = cell_fill(color = "gray85"),
        locations = cells_row_groups(groups = "powerful")
      ) |>
      tab_style(
        style = list(
          cell_fill(color = "gray95"),
          cell_text(size = "larger")
        ),
        locations = cells_row_groups(groups = "v_powerful")
      )

![This image of a table was generated from the fifth code example in the
\`tab_row_group()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_row_group_5.png)

Setting the `id` values for each of the row groups makes things easier
since you will have clean, markup-free ID values to reference in later
calls (as was done with the
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)
invocations in the example above). The use of the
[`md()`](https://gt.rstudio.com/reference/md.md) helper function makes
it so that any Markdown provided for the `label` of a row group is
faithfully rendered.

## Function ID

2-4

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
