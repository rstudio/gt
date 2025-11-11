# View a table with all available Font Awesome icons for `fmt_icon()`

[`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) can be used
to render *Font Awesome* icons within body cells that reference the icon
names. Further to this, the text transformation functions (e.g.,
[`text_case_match()`](https://gt.rstudio.com/reference/text_case_match.md))
allow for the insertion of these icons as replacement text (so long as
you use the `fa()` function from the **fontawesome** package). Because
there is a very large number of icons available to use in *Font
Awesome*, `info_icons()` can be used to provide us with a table that
lists all the icons along with their short and full names (either can be
used with [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md)).
It also contains acceptable codes for
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md)

## Usage

``` r
info_icons()
```

## Value

An object of class `gt_tbl`.

## Examples

Get a table of info on all the available *Font Awesome* icons.

    info_icons()

![This image of a table was generated from the first code example in the
\`info_icons()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_info_icons_1.png)

## Function ID

11-8

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other information functions:
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md),
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md),
[`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md),
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md),
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md),
[`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
