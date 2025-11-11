# Get the LaTeX dependencies required for a **gt** table

When working with Rnw (Sweave) files or otherwise writing LaTeX code,
including a **gt** table can be problematic if we don't have knowledge
of the LaTeX dependencies. For the most part, these dependencies are the
LaTeX packages that are required for rendering a **gt** table.
`gt_latex_dependencies()` provides an object that can be used to provide
the LaTeX in an Rnw file, allowing **gt** tables to work and not yield
errors due to missing packages.

## Usage

``` r
gt_latex_dependencies()
```

## Value

An object of class `knit_asis`.

## Details

Here is an example Rnw document that shows how `gt_latex_dependencies()`
can be used in conjunction with a **gt** table:

    %!sweave=knitr

    \documentclass{article}

    <<echo=FALSE>>=
    library(gt)
     @

    <<results='asis', echo=FALSE>>=
    gt_latex_dependencies()
     @

    \begin{document}

    <<results='asis', echo=FALSE>>=
    gt(exibble)
     @

    \end{document}

## Function ID

8-30

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`currency()`](https://gt.rstudio.com/reference/currency.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
[`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md),
[`from_column()`](https://gt.rstudio.com/reference/from_column.md),
[`google_font()`](https://gt.rstudio.com/reference/google_font.md),
[`html()`](https://gt.rstudio.com/reference/html.md),
[`latex()`](https://gt.rstudio.com/reference/latex.md),
[`md()`](https://gt.rstudio.com/reference/md.md),
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
