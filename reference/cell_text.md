# Helper for defining custom text styles for table cells

This helper function can be used with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), which
itself allows for the setting of custom styles to one or more cells. We
can also define several styles within a single call of `cell_text()` and
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) will
reliably apply those styles to the targeted element.

## Usage

``` r
cell_text(
  color = NULL,
  font = NULL,
  size = NULL,
  align = NULL,
  v_align = NULL,
  style = NULL,
  weight = NULL,
  stretch = NULL,
  decorate = NULL,
  transform = NULL,
  whitespace = NULL,
  indent = NULL
)
```

## Arguments

- color:

  *Text color*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The text color can be modified through the `color` argument.

- font:

  *Font (or collection of fonts) used for text*

  `vector<character>` // *default:* `NULL` (`optional`)

  The font or collection of fonts (subsequent font names are) used as
  fallbacks.

- size:

  *Text size*

  `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)

  The size of the font. Can be provided as a number that is assumed to
  represent `px` values (or could be wrapped in the
  [`px()`](https://gt.rstudio.com/reference/px.md) helper function). We
  can also use one of the following absolute size keywords:
  `"xx-small"`, `"x-small"`, `"small"`, `"medium"`, `"large"`,
  `"x-large"`, or `"xx-large"`.

- align:

  *Text alignment*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The text in a cell can be horizontally aligned though one of the
  following options: `"center"`, `"left"`, `"right"`, or `"justify"`.

- v_align:

  *Vertical alignment*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The vertical alignment of the text in the cell can be modified through
  the options `"middle"`, `"top"`, or `"bottom"`.

- style:

  *Text style*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Can be one of either `"normal"`, `"italic"`, or `"oblique"`.

- weight:

  *Font weight*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The weight of the font can be modified thorough a text-based option
  such as `"normal"`, `"bold"`, `"lighter"`, `"bolder"`, or, a numeric
  value between `1` and `1000`, inclusive. Note that only variable fonts
  may support the numeric mapping of weight.

- stretch:

  *Stretch text*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Allows for text to either be condensed or expanded. We can use one of
  the following text-based keywords to describe the degree of
  condensation/expansion: `"ultra-condensed"`, `"extra-condensed"`,
  `"condensed"`, `"semi-condensed"`, `"normal"`, `"semi-expanded"`,
  `"expanded"`, `"extra-expanded"`, or `"ultra-expanded"`.
  Alternatively, we can supply percentage values from `0\%` to `200\%`,
  inclusive. Negative percentage values are not allowed.

- decorate:

  *Decorate text*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Allows for text decoration effect to be applied. Here, we can use
  `"overline"`, `"line-through"`, or `"underline"`.

- transform:

  *Transform text*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Allows for the transformation of text. Options are `"uppercase"`,
  `"lowercase"`, or `"capitalize"`.

- whitespace:

  *White-space options*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A white-space preservation option. By default, runs of white-space
  will be collapsed into single spaces but several options exist to
  govern how white-space is collapsed and how lines might wrap at
  soft-wrap opportunities. The options are `"normal"`, `"nowrap"`,
  `"pre"`, `"pre-wrap"`, `"pre-line"`, and `"break-spaces"`.

- indent:

  *Text indentation*

  `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)

  The indentation of the text. Can be provided as a number that is
  assumed to represent `px` values (or could be wrapped in the
  [`px()`](https://gt.rstudio.com/reference/px.md) helper function).
  Alternatively, this can be given as a percentage (easily constructed
  with [`pct()`](https://gt.rstudio.com/reference/pct.md)).

## Value

A list object of class `cell_styles`.

## Examples

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a simple, two-column **gt** table (keeping only the
`num` and `currency` columns). With
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) (called
twice), we'll selectively add style to the values formatted with
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md). We do
this by using `cell_text()` in the `style` argument of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md).

    exibble |>
      dplyr::select(num, currency) |>
      gt() |>
      fmt_number(decimals = 1) |>
      tab_style(
        style = cell_text(weight = "bold"),
        locations = cells_body(
          columns = num,
          rows = num >= 5000
        )
      ) |>
      tab_style(
        style = cell_text(style = "italic"),
        locations = cells_body(
          columns = currency,
          rows = currency < 100
        )
      )

![This image of a table was generated from the first code example in the
\`cell_text()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cell_text_1.png)

## Function ID

8-25

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other helper functions:
[`adjust_luminance()`](https://gt.rstudio.com/reference/adjust_luminance.md),
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md),
[`currency()`](https://gt.rstudio.com/reference/currency.md),
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md),
[`escape_latex()`](https://gt.rstudio.com/reference/escape_latex.md),
[`from_column()`](https://gt.rstudio.com/reference/from_column.md),
[`google_font()`](https://gt.rstudio.com/reference/google_font.md),
[`gt_latex_dependencies()`](https://gt.rstudio.com/reference/gt_latex_dependencies.md),
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
