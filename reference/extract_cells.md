# Extract a vector of formatted cells from a **gt** object

Get a vector of cell data from a `gt_tbl` object. The output vector will
have cell data formatted in the same way as the table.

## Usage

``` r
extract_cells(
  data,
  columns,
  rows = everything(),
  output = c("auto", "plain", "html", "latex", "rtf", "word", "grid")
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should form a constraint for extraction. The default
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

- output:

  *Output format*

  `singl-kw:[auto|plain|html|latex|rtf|word]` // *default:* `"auto"`

  The output style of the resulting character vector. This can either be
  `"auto"` (the default), `"plain"`, `"html"`, `"latex"`, `"rtf"`, or
  `"word"`. In **knitr** rendering (i.e., Quarto or R Markdown), the
  `"auto"` option will choose the correct `output` value

## Value

A vector of cell data extracted from a **gt** table.

## Examples

Let's create a **gt** table with the
[`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset to use
in the next few examples:

    gt_tbl <- gt(exibble, rowname_col = "row", groupname_col = "group")

We can extract a cell from the table with the `extract_cells()`
function. This is done by providing a column and a row intersection:

    extract_cells(gt_tbl, columns = num, row = 1)

    #> [1] "1.111e-01"

Multiple cells can be extracted. Let's get the first four cells from the
`char` column.

    extract_cells(gt_tbl, columns = char, rows = 1:4)

    #> [1] "apricot" "banana" "coconut" "durian"

We can format cells and expect that the formatting is fully retained
after extraction.

    gt_tbl |>
      fmt_number(columns = num, decimals = 2) |>
      extract_cells(columns = num, rows = 1)

    #> [1] "0.11"

## Function ID

13-9

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
