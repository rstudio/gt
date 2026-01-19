# View a table with all available flags for `fmt_flag()`

[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md) can be used
to render flag icons within body cells that have 2-letter country codes.
There are a lot of countries, so, calling `info_flags()` can be helpful
in showing all of the valid and supported country codes along with their
flag icons.

## Usage

``` r
info_flags()
```

## Value

An object of class `gt_tbl`.

## Examples

Get a table of info on all the available flag icons.

    info_flags()

![This image of a table was generated from the first code example in the
\`info_flags()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_info_flags_1.png)

## Function ID

11-8

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other information functions:
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md),
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md),
[`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md),
[`info_icons()`](https://gt.rstudio.com/reference/info_icons.md),
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md),
[`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md),
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md),
[`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
