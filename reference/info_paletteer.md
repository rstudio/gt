# View a table with info on color palettes

While [`data_color()`](https://gt.rstudio.com/reference/data_color.md)
allows us to flexibly color data cells in our **gt** table, the harder
part of this process is discovering and choosing color palettes that are
suitable for the table output. We can make this process much easier in
two ways: (1) by using the **paletteer** package, which makes a wide
range of palettes from various R packages readily available, and (2)
calling `info_paletteer()` to give us an information table that serves
as a quick reference for all of the discrete color palettes available in
**paletteer**.

## Usage

``` r
info_paletteer(color_pkgs = NULL)
```

## Arguments

- color_pkgs:

  *Filter to specific color packages*

  `vector<character>` // *default:* `NULL` (`optional`)

  A vector of color packages that determines which sets of palettes
  should be displayed in the information table. If this is `NULL` (the
  default) then all of the discrete palettes from all of the color
  packages represented in **paletteer** will be displayed.

## Value

An object of class `gt_tbl`.

## Details

The palettes displayed are organized by package and by palette name.
These values are required when obtaining a palette (as a vector of
hexadecimal colors), from
[`paletteer::paletteer_d()`](https://rdrr.io/pkg/paletteer/man/paletteer_d.html).
Once we are familiar with the names of the color palette packages (e.g.,
**RColorBrewer**, **ggthemes**, **wesanderson**), we can narrow down the
content of this information table by supplying a vector of such package
names to `color_pkgs`.

Colors from the following color packages (all supported by
**paletteer**) are shown by default with `info_paletteer()`:

- **awtools**, 5 palettes

- **dichromat**, 17 palettes

- **dutchmasters**, 6 palettes

- **ggpomological**, 2 palettes

- **ggsci**, 42 palettes

- **ggthemes**, 31 palettes

- **ghibli**, 27 palettes

- **grDevices**, 1 palette

- **jcolors**, 13 palettes

- **LaCroixColoR**, 21 palettes

- **NineteenEightyR**, 12 palettes

- **nord**, 16 palettes

- **ochRe**, 16 palettes

- **palettetown**, 389 palettes

- **pals**, 8 palettes

- **Polychrome**, 7 palettes

- **quickpalette**, 17 palettes

- **rcartocolor**, 34 palettes

- **RColorBrewer**, 35 palettes

- **Redmonder**, 41 palettes

- **wesanderson**, 19 palettes

- **yarrr**, 21 palettes

## Examples

Get a table of info on just the `"ggthemes"` color palette (easily
accessible from the **paletteer** package).

    info_paletteer(color_pkgs = "ggthemes")

![This image of a table was generated from the first code example in the
\`info_paletteer()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_info_paletteer_1.png)

## Function ID

11-5

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other information functions:
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md),
[`info_date_style()`](https://gt.rstudio.com/reference/info_date_style.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md),
[`info_google_fonts()`](https://gt.rstudio.com/reference/info_google_fonts.md),
[`info_icons()`](https://gt.rstudio.com/reference/info_icons.md),
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_time_style()`](https://gt.rstudio.com/reference/info_time_style.md),
[`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
