# Output a **gt** object as LaTeX

Get the LaTeX content from a `gt_tbl` object as a `knit_asis` object.
This object contains the LaTeX code and attributes that serve as LaTeX
dependencies (i.e., the LaTeX packages required for the table). Using
[`as.character()`](https://rdrr.io/r/base/character.html) on the created
object will result in a single-element vector containing the LaTeX code.

## Usage

``` r
as_latex(data)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

## Details

LaTeX packages required to generate tables are: booktabs, caption,
longtable, colortbl, array, anyfontsize, multirow.

In the event packages are not automatically added during the render
phase of the document, please create and include a style file to load
them.

Inside the document's YAML metadata, please include:

    output:
      pdf_document: # Change to appropriate LaTeX template
        includes:
          in_header: 'gt_packages.sty'

The `gt_packages.sty` file would then contain the listed dependencies
above:

      \usepackage{booktabs, caption, longtable, colortbl, array}

## Examples

Use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. Add a header with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) and
then export the table as LaTeX code using the `as_latex()` function.

    tab_latex <-
      gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      as_latex()

What's returned is a `knit_asis` object, which makes it easy to include
in R Markdown documents that are knit to PDF. We can use
[`as.character()`](https://rdrr.io/r/base/character.html) to get just
the LaTeX code as a single-element vector.

## Function ID

13-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`as_word()`](https://gt.rstudio.com/reference/as_word.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
