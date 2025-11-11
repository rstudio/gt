# Output a **gt** object as RTF

Get the RTF content from a `gt_tbl` object as as a single-element
character vector. This object can be used with
[`writeLines()`](https://rdrr.io/r/base/writeLines.html) to generate a
valid .rtf file that can be opened by RTF readers.

## Usage

``` r
as_rtf(
  data,
  incl_open = TRUE,
  incl_header = TRUE,
  incl_page_info = TRUE,
  incl_body = TRUE,
  incl_close = TRUE
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- incl_open, incl_close:

  *Include opening/closing braces*

  `scalar<logical>` // *default:* `TRUE`

  Options that govern whether the opening or closing `"{"` and `"}"`
  should be included. By default, both options are `TRUE`.

- incl_header:

  *Include RTF header*

  `scalar<logical>` // *default:* `TRUE`

  Should the RTF header be included in the output? By default, this is
  `TRUE`.

- incl_page_info:

  *Include RTF page information*

  `scalar<logical>` // *default:* `TRUE`

  Should the RTF output include directives for the document pages? This
  is `TRUE` by default.

- incl_body:

  *Include RTF body*

  `scalar<logical>` // *default:* `TRUE`

  An option to include the body of RTF document. By default, this is
  `TRUE`.

## Examples

Use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. Add a header with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) and
then export the table as RTF code using the `as_rtf()` function.

    tab_rtf <-
      gtcars |>
      dplyr::select(mfr, model) |>
      dplyr::slice(1:2) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      as_rtf()

## Function ID

13-4

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
