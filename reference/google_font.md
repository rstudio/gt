# Helper function for specifying a font from the *Google Fonts* service

`google_font()` can be used wherever a font name should be specified.
There are two instances where this helper can be used: the `name`
argument in
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
(for setting a table font) and in that of
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) (used
with [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)). To
get a helpful listing of fonts that work well in tables, call
[`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md).

## Usage

``` r
google_font(name)
```

## Arguments

- name:

  *Google Font name*

  `scalar<character>` // **required**

  The complete name of a font available in *Google Fonts*.

## Value

An object of class `font_css`.

## Examples

Use the [`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset
to create a **gt** table of two columns and eight rows. We'll replace
missing values with em dashes using
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md). For
text in the `time` column, we will use the font called `"IBM Plex Mono"`
which is available in Google Fonts. This is defined inside the
`google_font()` call, itself part of a vector that includes fonts
returned by
[`default_fonts()`](https://gt.rstudio.com/reference/default_fonts.md)
(those fonts will serve as fallbacks just in case the font supplied by
Google Fonts is not accessible). In terms of placement, all of this is
given to the `font` argument of
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) which is
itself given to the `style` argument of
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md).

    exibble |>
      dplyr::select(char, time) |>
      gt() |>
      sub_missing() |>
      tab_style(
        style = cell_text(
          font = c(
            google_font(name = "IBM Plex Mono"),
            default_fonts()
          )
        ),
        locations = cells_body(columns = time)
      )

![This image of a table was generated from the first code example in the
\`google_font()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_google_font_1.png)

We can use a subset of the
[`sp500`](https://gt.rstudio.com/reference/sp500.md) dataset to create a
small **gt** table. With
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md), we
can display a dollar sign for the first row of the monetary values.
Then, we'll set a larger font size for the table and opt to use the
`"Merriweather"` font by calling `google_font()` within
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md).
In cases where that font may not materialize, we include two font
fallbacks: `"Cochin"` and the catchall `"Serif"` group.

    sp500 |>
      dplyr::slice(1:10) |>
      dplyr::select(-volume, -adj_close) |>
      gt() |>
      fmt_currency(
        rows = 1,
        currency = "USD",
        use_seps = FALSE
      ) |>
      tab_options(table.font.size = px(20)) |>
      opt_table_font(
        font = list(
          google_font(name = "Merriweather"),
          "Cochin", "Serif"
        )
      )

![This image of a table was generated from the second code example in
the \`google_font()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_google_font_2.png)

## Function ID

8-31

## Function Introduced

`v0.2.2` (August 5, 2020)

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
