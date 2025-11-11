# Get a conversion factor across two measurement units of a given class

The `unit_conversion()` helper function gives us a conversion factor for
transforming a value from one form of measurement units to a target
form. For example if you have a length value that is expressed in miles
you could transform that value to one in kilometers through
multiplication of the value by the conversion factor (in this case
`1.60934`).

For `unit_conversion()` to understand the source and destination units,
you need to provide a keyword value for the `from` and `to` arguments.
To aid as a reference for this, call
[`info_unit_conversions()`](https://gt.rstudio.com/reference/info_unit_conversions.md)
to display an information table that contains all of the keywords for
every conversion type.

## Usage

``` r
unit_conversion(from, to)
```

## Arguments

- from:

  *Units for the input value*

  `scalar<character>` // **required**

  The keyword representing the units for the value that requires unit
  conversion. In the case where the value has units of miles, the
  necessary input is `"length.mile"`.

- to:

  *Desired units for the value*

  `scalar<character>` // **required**

  The keyword representing the target units for the value with units
  defined in `from`. In the case where input value has units of miles
  and we would rather want the value to be expressed as kilometers, the
  `to` value should be `"length.kilometer"`.

## Value

A single numerical value.

## Examples

Let's use a portion of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset and create
a table showing population, density, and land area for 10
municipalities. The `land_area_km2` values are in units of square
kilometers, however, we'd rather the values were in square miles. We can
convert the numeric values while formatting the values with
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) by
using `unit_conversion()` in the `scale_by` argument since the return
value of that is a conversion factor (which is applied to each value by
multiplication). The same is done for converting the 'people per square
kilometer' values in `density_2021` to 'people per square mile',
however, the units to convert are in the denominator so the inverse of
the conversion factor must be used.

    towny |>
      dplyr::slice_max(density_2021, n = 10) |>
      dplyr::select(name, population_2021, density_2021, land_area_km2) |>
      gt(rowname_col = "name") |>
      fmt_integer(columns = population_2021) |>
      fmt_number(
        columns = land_area_km2,
        decimals = 1,
        scale_by = unit_conversion(
          from = "area.square-kilometer",
          to = "area.square-mile"
        )
      ) |>
      fmt_number(
        columns = density_2021,
        decimals = 1,
        scale_by = 1 / unit_conversion(
          from = "area.square-kilometer",
          to = "area.square-mile"
        )
      ) |>
      cols_label(
        land_area_km2 = "Land Area,<br>sq. mi",
        population_2021 = "Population",
        density_2021 = "Density,<br>ppl / sq. mi",
        .fn = md
      )

![This image of a table was generated from the first code example in the
\`unit_conversion()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_unit_conversion_1.png)

With a small slice of the
[`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md) dataset,
let's display the temperature values in terms of degrees Celsius
(present in the data) *and* as temperatures in degrees Fahrenheit
(achievable via conversion). We can duplicate the `temp` column through
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (naming the
new column as `temp_f`) and when formatting through
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md) we
can call `unit_conversion()` within the `scale_by` argument to perform
this transformation while formatting the values as integers.

    gibraltar |>
      dplyr::filter(
        date == "2023-05-15",
        time >= "06:00",
        time <= "12:00"
      ) |>
      dplyr::select(time, temp) |>
      gt() |>
      tab_header(
        title = "Air Temperature During Late Morning Hours at LXGB Stn.",
        subtitle = "May 15, 2023"
      ) |>
      cols_add(temp_f = temp) |>
      cols_move(columns = temp_f, after = temp) |>
      tab_spanner(
        label = "Temperature",
        columns = starts_with("temp")
      ) |>
      fmt_number(
        columns = temp,
        decimals = 1
      ) |>
      fmt_integer(
        columns = temp_f,
        scale_by = unit_conversion(
          from = "temperature.C",
          to = "temperature.F"
        )
      ) |>
      cols_label(
        time = "Time",
        temp = "{{degC}}",
        temp_f = "{{degF}}"
      ) |>
      cols_width(
        starts_with("temp") ~ px(80),
        time ~ px(100)
      ) |>
      opt_horizontal_padding(scale = 3) |>
      opt_vertical_padding(scale = 0.5) |>
      opt_align_table_header(align = "left") |>
      tab_options(heading.title.font.size = px(16))

![This image of a table was generated from the second code example in
the \`unit_conversion()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_unit_conversion_2.png)

## Function ID

8-7

## Function Introduced

`v0.11.0` (July 9, 2024)

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
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md)
