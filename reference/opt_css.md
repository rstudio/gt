# Option to add custom CSS for the table

`opt_css()` makes it possible to add CSS to a **gt** table. This CSS
will be added after the compiled CSS that **gt** generates automatically
when the object is transformed to an HTML output table. You can supply
`css` as a vector of lines or as a single string.

## Usage

``` r
opt_css(data, css, add = TRUE, allow_duplicates = FALSE)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- css:

  *CSS declarations*

  `scalar<character>` // **required**

  The CSS to include as part of the rendered table's `<style>` element.

- add:

  *Add to existing CSS*

  `scalar<logical>` // *default:* `TRUE`

  If `TRUE`, the default, the CSS is added to any already-defined CSS
  (typically from previous calls of
  [`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
  `opt_css()`, or, directly setting CSS the `table.additional_css` value
  in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)).
  If this is set to `FALSE`, the CSS provided here will replace any
  previously-stored CSS.

- allow_duplicates:

  *Allow for CSS duplication*

  `scalar<logical>` // *default:* `FALSE`

  When this is `FALSE` (the default), the CSS provided here won't be
  added (provided that `add = TRUE`) if it is seen in the
  already-defined CSS.

## Value

An object of class `gt_tbl`.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`num` and `currency` columns). Through use of the `opt_css()` function,
we can insert CSS rulesets as as string. We need to ensure that the
table ID is set explicitly (we've done so here with the ID value of
`"one"`, setting it in the
[`gt()`](https://gt.rstudio.com/reference/gt.md) function).

    exibble |>
      dplyr::select(num, currency) |>
      gt(id = "one") |>
      fmt_currency(
        columns = currency,
        currency = "HKD"
      ) |>
      fmt_scientific(columns = num) |>
      opt_css(
        css = "
        #one .gt_table {
          background-color: skyblue;
        }
        #one .gt_row {
          padding: 20px 30px;
        }
        #one .gt_col_heading {
          text-align: center !important;
        }
        "
      )

![This image of a table was generated from the first code example in the
\`opt_css()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_css_1.png)

## Function ID

10-14

## Function Introduced

`v0.2.2` (August 5, 2020)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
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
