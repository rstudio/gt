# View a table with all units that can be converted by `unit_conversion()`

[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
can be used to yield conversion factors across compatible pairs of
units. This is useful for expressing values in different units and the
conversion can be performed via the `scale_by` argument available in
several formatting functions. When calling
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md),
one must supply two string-based keywords to specify the value's current
units and the desired units. All of these keywords are provided in the
table shown by calling `info_unit_conversions()`.

## Usage

``` r
info_unit_conversions()
```

## Value

An object of class `gt_tbl`.

## Examples

Get a table of info on all the available keywords for unit conversions.

    info_unit_conversions()

![This image of a table was generated from the first code example in the
\`info_unit_conversions()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_info_unit_conversions_1.png)

## Function ID

11-10

## Function Introduced

`v0.11.0` (July 9, 2024)

## See also

Other information functions:
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md),
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md),
[`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md),
[`info_icons()`](https://gt.rstudio.com/reference/info_icons.md),
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_paletteer()`](https://gt.rstudio.com/reference/info_paletteer.md),
[`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md),
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md)
