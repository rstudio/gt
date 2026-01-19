# View a table on recommended Google Fonts

The [`google_font()`](https://gt.rstudio.com/reference/google_font.md)
helper function can be used wherever a font name should be specified.
There are two instances where this helper can be used: the `name`
argument in
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md)
(for setting a table font) and in that of
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) (used
with [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)).
Because there is an overwhelming number of fonts available in the
*Google Fonts* catalog, the `info_google_fonts()` provides a table with
a set of helpful font recommendations. These fonts look great in the
different parts of a **gt** table. Why? For the most part they are
suitable for body text, having large counters, large x-height,
reasonably low contrast, and open apertures. These font features all
make for high legibility at smaller sizes.

## Usage

``` r
info_google_fonts()
```

## Value

An object of class `gt_tbl`.

## Examples

Get a table of info on some of the recommended *Google Fonts* for
tables.

    info_google_fonts()

![This image of a table was generated from the first code example in the
\`info_google_fonts()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_info_google_fonts_1.png)

## Function ID

11-6

## Function Introduced

`v0.2.2` (August 5, 2020)

## See also

Other information functions:
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md),
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md),
[`info_icons()`](https://gt.rstudio.com/reference/info_icons.md),
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md),
[`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md),
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md),
[`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
