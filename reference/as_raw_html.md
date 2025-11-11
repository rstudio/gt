# Get the HTML content of a **gt** table

Get the HTML content from a `gt_tbl` object as a single-element
character vector. By default, the generated HTML will have inlined
styles, where CSS styles (that were previously contained in CSS rule
sets external to the `<table> element`) are included as `style`
attributes in the HTML table's tags. This option is preferable when
using the output HTML table in an emailing context.

## Usage

``` r
as_raw_html(data, inline_css = TRUE)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- inline_css:

  *Use inline CSS*

  `scalar<logical>` // *default:* `TRUE`

  An option to supply styles to table elements as inlined CSS styles.
  This is useful when including the table HTML as part of an HTML email
  message body, since inlined styles are largely supported in email
  clients over using CSS in a `<style>` block.

## Examples

Use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. Add a header with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) and
then export the table as HTML code with inlined CSS styles using
`as_raw_html()`.

    tab_html <-
      gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice_head(n = 5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      as_raw_html()

What's returned is a single-element vector containing the HTML for the
table. It has only the `<table>...</table>` part so it's not a complete
HTML document but rather an HTML fragment.

## Function ID

13-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
