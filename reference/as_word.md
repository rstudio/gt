# Output a **gt** object as Word

Get the Open Office XML table tag content from a `gt_tbl` object as a
single-element character vector.

## Usage

``` r
as_word(
  data,
  align = "center",
  caption_location = c("top", "bottom", "embed"),
  caption_align = "left",
  split = FALSE,
  keep_with_next = TRUE,
  autonum = TRUE
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- align:

  *Table alignment*

  `scalar<character>` // *default:* `"center"`

  An option for table alignment. Can either be `"center"`, `"left"`, or
  `"right"`.

- caption_location:

  *Caption location*

  `singl-kw:[top|bottom|embed]` // *default:* `"top"`

  Determines where the caption should be positioned. This can either be
  `"top"`, `"bottom"`, or `"embed"`.

- caption_align:

  *Caption alignment*

  Determines the alignment of the caption. This is either `"left"` (the
  default), `"center"`, or `"right"`. This option is only used when
  `caption_location` is not set as `"embed"`.

- split:

  *Allow splitting of a table row across pages*

  `scalar<logical>` // *default:* `FALSE`

  A logical value that indicates whether to activate the Word option
  `Allow row to break across pages`.

- keep_with_next:

  *Keeping rows together*

  `scalar<logical>` // *default:* `TRUE`

  A logical value that indicates whether a table should use Word option
  `Keep rows together`.

- autonum:

  Automatic Table Numbering

  `scalar<logical>` // *default:* `TRUE`

  A logical value that indicates whether a table should use Words
  built-in auto table numbering option in the caption.
  `Automatic Table Numbering`.

## Examples

Use a subset of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. Add a header with
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) and
then export the table as OOXML code for Word using `as_word()`

    tab_rtf <-
      gtcars |>
      dplyr::select(mfr, model) |>
      dplyr::slice(1:2) |>
      gt() |>
      tab_header(
        title = md("Data listing from **gtcars**"),
        subtitle = md("`gtcars` is an R dataset")
      ) |>
      as_word()

## Function ID

13-5

## Function Introduced

`v0.7.0` (August 25, 2022)

## See also

Other table export functions:
[`as_gtable()`](https://gt.rstudio.com/reference/as_gtable.md),
[`as_latex()`](https://gt.rstudio.com/reference/as_latex.md),
[`as_raw_html()`](https://gt.rstudio.com/reference/as_raw_html.md),
[`as_rtf()`](https://gt.rstudio.com/reference/as_rtf.md),
[`extract_body()`](https://gt.rstudio.com/reference/extract_body.md),
[`extract_cells()`](https://gt.rstudio.com/reference/extract_cells.md),
[`extract_summary()`](https://gt.rstudio.com/reference/extract_summary.md),
[`gtsave()`](https://gt.rstudio.com/reference/gtsave.md)
