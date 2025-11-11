# Options to define font choices for the entire table

`opt_table_font()` makes it possible to define fonts used for an entire
**gt** table. Any font names supplied in `font` will (by default, with
`add = TRUE`) be placed before the names present in the existing font
stack (i.e., they will take precedence). You can choose to base the font
stack on those provided by
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md) by
providing a valid keyword for a themed set and optionally prepending
`font` values to that.

Take note that you could still have entirely different fonts in specific
locations of the table. For that you would need to use
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) or
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
in conjunction with
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md).

## Usage

``` r
opt_table_font(
  data,
  font = NULL,
  stack = NULL,
  size = NULL,
  weight = NULL,
  style = NULL,
  color = NULL,
  add = TRUE
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- font:

  *Default table fonts*

  `vector<character>|list|obj:<font_css>` // *default:* `NULL`
  (`optional`)

  One or more font names available as system or web fonts. These can be
  combined with a [`c()`](https://rdrr.io/r/base/c.html) or a
  [`list()`](https://rdrr.io/r/base/list.html). To choose fonts from the
  *Google Fonts* service, we can call the
  [`google_font()`](https://gt.rstudio.com/reference/google_font.md)
  helper function.

- stack:

  *Name of font stack*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A name that is representative of a font stack (obtained via internally
  via the
  [`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md)
  helper function). If provided, this new stack will replace any defined
  fonts and any `font` values will be prepended.

- size:

  *Text size*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The text size for the entire table can be set by providing a `size`
  value. Can be specified as a single-length character vector with units
  of pixels (e.g., `12px`) or as a percentage (e.g., `80%`). If provided
  as a single-length numeric vector, it is assumed that the value is
  given in units of pixels. The
  [`px()`](https://gt.rstudio.com/reference/px.md) and
  [`pct()`](https://gt.rstudio.com/reference/pct.md) helper functions
  can also be used to pass in numeric values and obtain values as pixel
  or percentage units.

- weight:

  *Text weight*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  Option to set the weight of the font. Can be a text-based keyword such
  as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric value
  between `1` and `1000`, inclusive. Please note that typefaces have
  varying support for the numeric mapping of weight.

- style:

  *Text style*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An option to modify the text style. Can be one of either `"normal"`,
  `"italic"`, or `"oblique"`.

- color:

  *Text color*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The `color` option defines the text color used throughout the table. A
  color name or a hexadecimal color code should be provided.

- add:

  *Add to existing fonts*

  `scalar<logical>` // *default:* `TRUE`

  Should fonts be added to the beginning of any already-defined fonts
  for the table? By default, this is `TRUE` and is recommended since
  those fonts already present can serve as fallbacks when everything
  specified in `font` is not available. If a `stack` is provided, then
  `add` will automatically set to `FALSE`.

## Value

An object of class `gt_tbl`.

## Possibilities for the `font` argument

We have the option to supply one or more font names for the `font`
argument. They can be enclosed in [`c()`](https://rdrr.io/r/base/c.html)
or a [`list()`](https://rdrr.io/r/base/list.html). You can generate this
list or vector with a combination of font names, and you can freely use
[`google_font()`](https://gt.rstudio.com/reference/google_font.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
and [`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md)
to help compose your font family.

## Possibilities for the `stack` argument

There are several themed font stacks available via the
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md)
helper function. That function can be used to generate all or a segment
of a vector supplied to the `font` argument. However, using the `stack`
argument with one of the 15 keywords for the font stacks available in
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md), we
could be sure that the typeface class will work across multiple computer
systems. Any of the following keywords can be used:

- `"system-ui"`

- `"transitional"`

- `"old-style"`

- `"humanist"`

- `"geometric-humanist"`

- `"classical-humanist"`

- `"neo-grotesque"`

- `"monospace-slab-serif"`

- `"monospace-code"`

- `"industrial"`

- `"rounded-sans"`

- `"slab-serif"`

- `"antique"`

- `"didone"`

- `"handwritten"`

## Examples

Use a subset of the [`sp500`](https://gt.rstudio.com/reference/sp500.md)
dataset to create a small **gt** table. We'll use
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md) to
display a dollar sign for the first row of monetary values. The
`"Merriweather"` font (from *Google Fonts*, via
[`google_font()`](https://gt.rstudio.com/reference/google_font.md)) with
two system font fallbacks (`"Cochin"` and the generic `"serif"`).

    sp500 |>
      dplyr::slice(1:10) |>
      dplyr::select(-volume, -adj_close) |>
      gt() |>
      fmt_currency(
        rows = 1,
        use_seps = FALSE
      ) |>
      opt_table_font(
        font = list(
          google_font(name = "Merriweather"),
          "Cochin", "serif"
        )
      )

![This image of a table was generated from the first code example in the
\`opt_table_font()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_table_font_1.png)

With the [`sza`](https://gt.rstudio.com/reference/sza.md) dataset we'll
create a two-column, eleven-row table. Within `opt_table_font()`, the
`stack` argument will be supplied with the `"rounded-sans"` font stack.
This sets up a family of fonts with rounded, curved letterforms that
should be locally available in different computing environments.

    sza |>
      dplyr::filter(
        latitude == 20 &
          month == "jan" &
          !is.na(sza)
      ) |>
      dplyr::select(-latitude, -month) |>
      gt() |>
      opt_table_font(stack = "rounded-sans") |>
      opt_all_caps()

![This image of a table was generated from the second code example in
the \`opt_table_font()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_table_font_2.png)

## Function ID

10-13

## Function Introduced

`v0.2.2` (August 5, 2020)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
[`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md),
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
