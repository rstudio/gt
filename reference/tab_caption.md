# Add a table caption

Add a caption to a **gt** table, which is handled specially for a table
within an R Markdown, Quarto, or **bookdown** context. The addition of
captions makes tables cross-referencing across the containing document.
The caption location (i.e., top, bottom, margin) is handled at the
document level in each of these systems.

## Usage

``` r
tab_caption(data, caption)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- caption:

  *Table caption text*

  `scalar<character>` // **required**

  The table caption to use for cross-referencing in R Markdown, Quarto,
  or **bookdown**.

## Value

An object of class `gt_tbl`.

## Examples

With three columns from the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset, let's
create a **gt** table. First, we'll add a header part with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md). After
that, a caption is added with `tab_caption()`.

    gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      tab_caption(caption = md("**gt** table example."))

![This image of a table was generated from the first code example in the
\`tab_caption()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_caption_1.png)

## Function ID

2-9

## Function Introduced

`v0.8.0` (November 16, 2022)

## See also

Other part creation/modification functions:
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
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
