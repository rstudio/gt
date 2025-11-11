# Add a source note citation

Add a source note to the footer part of the **gt** table. A source note
is useful for citing the data included in the table. Several can be
added to the footer, simply use multiple calls of `tab_source_note()`
and they will be inserted in the order provided. We can use Markdown
formatting for the note, or, if the table is intended for HTML output,
we can include HTML formatting.

## Usage

``` r
tab_source_note(data, source_note)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- source_note:

  *Source note text*

  `scalar<character>` // **required**

  Text to be used in the source note. We can optionally use
  [`md()`](https://gt.rstudio.com/reference/md.md) and
  [`html()`](https://gt.rstudio.com/reference/html.md) to style the text
  as Markdown or to retain HTML elements in the text.

## Value

An object of class `gt_tbl`.

## Examples

With three columns from the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset, let's
create a **gt** table. We can use `tab_source_note()` to add a source
note to the table footer. Here we are citing the data source but this
function can be used for any text you'd prefer to display in the footer
section.

    gtcars |>
      dplyr::select(mfr, model, msrp) |>
      dplyr::slice(1:5) |>
      gt() |>
      tab_source_note(source_note = "From edmunds.com")

![This image of a table was generated from the first code example in the
\`tab_source_note()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_source_note_1.png)

## Function ID

2-8

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
