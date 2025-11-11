# Option to specify the formatting of footnote marks

Modify the way footnote marks are formatted. This can be performed for
those footnote marks that alight to the targeted text in cells in
various locations in the table or the footnote marks that appear in the
table footer. A simple specification string can be provided for either
or both types of marks in `opt_footnote_spec()` . This function serves
as a shortcut for using either of
`tab_options(footnotes.spec_ref = {spec})` or
`tab_options(footnotes.spec_ftr = {spec})`.

## Usage

``` r
opt_footnote_spec(data, spec_ref = NULL, spec_ftr = NULL)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- spec_ref, spec_ftr:

  *Specifications for formatting of footnote marks*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Specification of the footnote marks when behaving as footnote
  references and as marks in the footer section of the table. This is a
  string containing spec characters. The default is the spec string
  `"^i"`, which is superscript text set in italics.

## Value

An object of class `gt_tbl`.

## Specification rules for the formatting of footnote marks

A footnote spec consists of a string containing control characters for
formatting. Not every type of formatting makes sense for footnote marks
so the specification is purposefully constrained to the following:

- as superscript text (with the `"^"` control character) or
  regular-sized text residing on the baseline

- bold text (with `"b"`), italicized text (with `"i"`), or unstyled text
  (don't use either of the `"b"` or `"i"` control characters)

- enclosure in parentheses (use `"("` / `")"`) or square brackets (with
  `"["` / `"]"`)

- a period following the mark (using `"."`); this is most commonly used
  in the table footer

With the aforementioned control characters we could, for instance,
format the footnote marks to be superscript text in bold type with
`"^b"`. We might want the marks in the footer to be regular-sized text
in parentheses, so the spec could be either `"()"` or `"(x)"` (you can
optionally use `"x"` as a helpful placeholder for the marks).

## Examples

Use a modified version of
[`sp500`](https://gt.rstudio.com/reference/sp500.md) the dataset to
create a **gt** table with row labels. We'll add two footnotes using the
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
function. We can call `opt_footnote_spec()` to specify that the marks of
the footnote reference should be superscripts in bold, and, the marks in
the footer section should be enclosed in parentheses.

    sp500 |>
      dplyr::filter(date >= "1987-10-14" & date <= "1987-10-25") |>
      dplyr::select(date, open, close, volume) |>
      dplyr::mutate(difference = close - open) |>
      dplyr::mutate(change = (close - open) / open) |>
      dplyr::mutate(day = vec_fmt_datetime(date, format = "E")) |>
      dplyr::arrange(-dplyr::row_number()) |>
      gt(rowname_col = "date") |>
      fmt_currency() |>
      fmt_number(columns = volume, suffixing = TRUE) |>
      fmt_percent(columns = change) |>
      cols_move_to_start(columns = day) |>
      cols_width(
        stub() ~ px(130),
        day ~ px(50),
        everything() ~ px(100)
      ) |>
      tab_footnote(
        footnote = "Commerce report on trade deficit.",
        locations = cells_stub(rows = 1)
      ) |>
      tab_footnote(
        footnote = "Black Monday market crash, representing the greatest
        one-day percentage decline in U.S. stock market history.",
        locations = cells_body(columns = change, rows = change < -0.15)
      ) |>
      opt_footnote_spec(spec_ref = "^xb", spec_ftr = "(x)")

![This image of a table was generated from the first code example in the
\`opt_footnote_spec()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_footnote_spec_1.png)

## Function ID

10-4

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
[`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
