# Option to modify the set of footnote marks

Alter the footnote marks for any footnotes that may be present in the
table. Either a vector of marks can be provided (including Unicode
characters), or, a specific keyword could be used to signify a preset
sequence. This function serves as a shortcut for using
`tab_options(footnotes.marks = {marks})`

## Usage

``` r
opt_footnote_marks(data, marks = "numbers")
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- marks:

  *Sequence of footnote marks*

  `vector<character>` // *default:* `"numbers"`

  Either a character vector of length greater than 1 (that will
  represent the series of marks) or a single keyword that represents a
  preset sequence of marks. The valid keywords are: `"numbers"` (for
  numeric marks), `"letters"` and `"LETTERS"` (for lowercase and
  uppercase alphabetic marks), `"standard"` (for a traditional set of
  four symbol marks), and `"extended"` (which adds two more symbols to
  the standard set).

## Value

An object of class `gt_tbl`.

## Specification of footnote marks

We can supply a vector that will represent the series of marks. The
series of footnote marks is recycled when its usage goes beyond the
length of the set. At each cycle, the marks are simply doubled, tripled,
and so on (e.g., `*` -\> `**` -\> `***`). The option exists for
providing keywords for certain types of footnote marks. The keywords
are:

- `"numbers"`: numeric marks, they begin from 1 and these marks are not
  subject to recycling behavior

- `"letters"`: minuscule alphabetic marks, internally uses the `letters`
  vector which contains 26 lowercase letters of the Roman alphabet

- `"LETTERS"`: majuscule alphabetic marks, using the `LETTERS` vector
  which has 26 uppercase letters of the Roman alphabet

- `"standard"`: symbolic marks, four symbols in total

- `"extended"`: symbolic marks, extends the standard set by adding two
  more symbols, making six

The symbolic marks are the: (1) Asterisk, (2) Dagger, (3) Double Dagger,
(4) Section Sign, (5) Double Vertical Line, and (6) Paragraph Sign; the
`"standard"` set has the first four, `"extended"` contains all.

## Examples

Use a summarized version of the
[`sza`](https://gt.rstudio.com/reference/sza.md) dataset to create a
**gt** table, adding three footnotes (with three calls of
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)).
We can modify the footnote marks to use with the `opt_footnote_marks()`
function. With the keyword `"standard"` we get four commonly-used
typographic marks.

    sza |>
      dplyr::filter(latitude == 30) |>
      dplyr::group_by(tst) |>
      dplyr::summarize(
        SZA.Max = if (
          all(is.na(sza))) {
          NA
        } else {
          max(sza, na.rm = TRUE)
        },
        SZA.Min = if (
          all(is.na(sza))) {
          NA
        } else {
          min(sza, na.rm = TRUE)
        },
        .groups = "drop"
      ) |>
      gt(rowname_col = "tst") |>
      tab_spanner_delim(delim = ".") |>
      sub_missing(
        columns = everything(),
        missing_text = "90+"
      ) |>
      tab_stubhead(label = "TST") |>
      tab_footnote(
        footnote = "True solar time.",
        locations = cells_stubhead()
      ) |>
      tab_footnote(
        footnote = "Solar zenith angle.",
        locations = cells_column_spanners(
          spanners = "spanner-SZA.Max"
        )
      ) |>
      tab_footnote(
        footnote = "The Lowest SZA.",
        locations = cells_stub(rows = "1200")
      ) |>
      opt_footnote_marks(marks = "standard")

![This image of a table was generated from the first code example in the
\`opt_footnote_marks()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_footnote_marks_1.png)

## Function ID

10-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md),
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
