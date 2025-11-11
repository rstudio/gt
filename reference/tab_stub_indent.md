# Control indentation of row labels in the stub

Indentation of row labels is an effective way for establishing structure
in a table stub. `tab_stub_indent()` allows for fine control over row
label indentation in the stub. We can use an explicit definition of an
indentation level (with a number between `0` and `5`), or, employ an
indentation directive using keywords (`"increase"`/`"decrease"`).

## Usage

``` r
tab_stub_indent(data, rows, indent = "increase")
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- rows:

  *Rows to target*

  `<row-targeting expression>` // **required**

  The rows to consider for the indentation change. We can supply a
  vector of row ID values within [`c()`](https://rdrr.io/r/base/c.html),
  a vector of row indices, or use select helpers here (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

- indent:

  *Indentation directive*

  `scalar<character|numeric|integer>` // *default:* `"increase"`

  An indentation directive either as a keyword describing the
  indentation change or as an explicit integer value for directly
  setting the indentation level. The keyword `"increase"` (the default)
  will increase the indentation level by one; `"decrease"` will do the
  same in the reverse direction. The starting indentation level of `0`
  means no indentation and this values serves as a lower bound. The
  upper bound for indentation is at level `5`.

## Value

An object of class `gt_tbl`.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with the `indent` argument of `tab_stub_indent()` to obtain
varying parameter values from a specified column within the table. This
means that each row label could be indented a little bit differently.

Please note that for this argument (`indent`), a
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) call
needs to reference a column that has data of the `numeric` or `integer`
type. Additional columns for parameter values can be generated with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (if not
already present). Columns that contain parameter data can also be hidden
from final display with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md).

## Examples

Using a subset of the
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md) dataset
within a **gt** table, we can provide some indentation to all of the row
labels in the stub via `tab_stub_indent()`. Here we provide an `indent`
value of `3` for a very prominent indentation that clearly shows that
the row labels are subordinate to the two row group labels in this table
(`"inorganic reactions"` and `"carbonyls"`).

    photolysis |>
      dplyr::select(cmpd_name, products, type, l, m, n) |>
      dplyr::slice_head(n = 10) |>
      gt(groupname_col = "type", rowname_col = "cmpd_name") |>
      fmt_chem(columns = products) |>
      fmt_scientific(columns = l) |>
      tab_stub_indent(
        rows = everything(),
        indent = 3
      )

![This image of a table was generated from the first code example in the
\`tab_stub_indent()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stub_indent_1.png)

Let's use a summarized version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset
to create a another **gt** table with row groups and row labels. With
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
we'll generate summary rows at the top of each row group. Using
`tab_stub_indent()` we can add indentation to the row labels in the
stub.

    pizzaplace |>
      dplyr::group_by(type, size) |>
      dplyr::summarize(
        sold = dplyr::n(),
        income = sum(price),
        .groups = "drop"
      ) |>
      gt(rowname_col = "size", groupname_col = "type") |>
      tab_header(title = "Pizzas Sold in 2015") |>
      fmt_integer(columns = sold) |>
      fmt_currency(columns = income) |>
      summary_rows(
        fns = list(label = "All Sizes", fn = "sum"),
        side = "top",
        fmt = list(
          ~ fmt_integer(., columns = sold),
          ~ fmt_currency(., columns = income)
        )
      ) |>
      tab_options(
        summary_row.background.color = "gray95",
        row_group.background.color = "#FFEFDB",
        row_group.as_column = TRUE
      ) |>
      tab_stub_indent(
        rows = everything(),
        indent = 2
      )

![This image of a table was generated from the second code example in
the \`tab_stub_indent()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stub_indent_2.png)

Indentation of entries in the stub can be controlled by values within a
column. Here's an example of that using the
[`constants`](https://gt.rstudio.com/reference/constants.md) dataset,
where variations of a row label are mutated to eliminate the common
leading text (replacing it with `"..."`). At the same time, the
indentation for those rows is set to `4` in the `indent` column (value
is `0` otherwise). The `tab_stub_indent()` statement uses
[`from_column()`](https://gt.rstudio.com/reference/from_column.md),
which passes values from the `indent` column to the namesake argument.
We hide the `indent` column from view by use of
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md).

    constants |>
      dplyr::select(name, value, uncert, units) |>
      dplyr::filter(
        grepl("^atomic mass constant", name) |
          grepl("^Rydberg constant", name) |
          grepl("^Bohr magneton", name)
      ) |>
      dplyr::mutate(
        indent = ifelse(grepl("constant |magneton ", name), 4, 0),
        name = gsub(".*constant |.*magneton ", "...", name)
      ) |>
      gt(rowname_col = "name") |>
      tab_stubhead(label = "Physical Constant") |>
      tab_stub_indent(
        rows = everything(),
        indent = from_column(column = "indent")
      ) |>
      fmt_scientific(columns = c(value, uncert)) |>
      fmt_units(columns = units) |>
      cols_hide(columns = indent) |>
      cols_label(
        value = "Value",
        uncert = "Uncertainty",
        units = "Units"
      ) |>
      cols_width(
        stub() ~ px(250),
        c(value, uncert) ~ px(150),
        units ~ px(80)
      ) |>
      tab_style(
        style = cell_text(indent = px(10)),
        locations = list(
          cells_column_labels(columns = units),
          cells_body(columns = units)
        )
      )

![This image of a table was generated from the third code example in the
\`tab_stub_indent()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_stub_indent_3.png)

## Function ID

2-6

## Function Introduced

`v0.7.0` (Aug 25, 2022)

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
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
