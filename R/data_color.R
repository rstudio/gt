#------------------------------------------------------------------------------#
#
#                /$$
#               | $$
#     /$$$$$$  /$$$$$$
#    /$$__  $$|_  $$_/
#   | $$  \ $$  | $$
#   | $$  | $$  | $$ /$$
#   |  $$$$$$$  |  $$$$/
#    \____  $$   \___/
#    /$$  \ $$
#   |  $$$$$$/
#    \______/
#
#  This file is part of the 'rstudio/gt' project.
#
#  Copyright (c) 2018-2025 gt authors
#
#  For full copyright and license information, please look at
#  https://gt.rstudio.com/LICENSE.html
#
#------------------------------------------------------------------------------#


#' Perform data cell colorization
#'
#' @description
#'
#' It's possible to add color to data cells according to their values with
#' `data_color()`. There is a multitude of ways to perform data cell
#' colorizing here:
#'
#' - targeting: we can constrain which columns and rows should receive the
#' colorization treatment (through the `columns` and `rows` arguments)
#' - direction: ordinarily we perform coloring in a column-wise fashion but
#' there is the option to color data cells in a row-wise manner (this is
#' controlled by the `direction` argument)
#' - coloring method: `data_color()` automatically computes colors based on the
#' column type but you can choose a specific methodology (e.g., with bins or
#' quantiles) and the function will generate colors accordingly; the `method`
#' argument controls this through keywords and other arguments act as inputs to
#' specific methods
#' - coloring function: a custom function can be supplied to the `fn` argument
#' for finer control over color evaluation with data; the `scales::col_*()`
#' color mapping functions can be used here or any function you might want to define
#' - color palettes: with `palette` we could supply a vector of colors, a
#' **viridis** or **RColorBrewer** palette name, or, a palette from the
#' **paletteer** package
#' - value domain: we can either opt to have the range of values define the
#' domain, or, specify one explicitly with the `domain` argument
#' - indirect color application: it's possible to compute colors from one column
#' and apply them to one or more different columns; we can even perform a
#' color mapping from multiple source columns to the same multiple of target
#' columns
#' - color application: with the `apply_to` argument, there's an option for
#' whether to apply the cell-specific colors to the cell background or the cell
#' text
#' - text autocoloring: if colorizing the cell background, `data_color()` will
#' automatically recolor the foreground text to provide the best contrast (can
#' be deactivated with `autocolor_text = FALSE`; a light and dark color to be
#' used can be specified with `autocolor_light` and `autocolor_dark`)
#'
#' `data_color()` won't fail with the default options used, but
#' that won't typically provide you the type of colorization you really need.
#' You can however safely iterate through a collection of different options
#' without running into too many errors.
#'
#' @inheritParams fmt_number
#'
#' @param columns *Columns to target*
#'
#'   [`<column-targeting expression>`][rows-columns] // *default:* `everything()`
#'
#'   The columns to which cell data color operations are constrained. Can either
#'   be a series of column names provided in `c()`, a vector of column indices,
#'   or a select helper function (e.g. [starts_with()], [ends_with()],
#'   [contains()], [matches()], [num_range()], and [everything()]).
#'
#' @param rows *Rows to target*
#'
#'   [`<row-targeting expression>`][rows-columns] // *default:* `everything()`
#'
#'   In conjunction with `columns`, we can specify which of their rows should
#'   form a constraint for cell data color operations. The default
#'   [everything()] results in all rows in `columns` being formatted.
#'   Alternatively, we can supply a vector of row IDs within `c()`, a vector of
#'   row indices, or a select helper function (e.g. [starts_with()],
#'   [ends_with()], [contains()], [matches()], [num_range()], and [everything()]).
#'   We can also use expressions to filter down to the rows we need
#'   (e.g., `[colname_1] > 100 & [colname_2] < 50`).
#'
#' @param direction *Color computation direction*
#'
#'   `singl-kw:[column|row]` // *default:* `"column"`
#'
#'   Should the color computations be performed column-wise or row-wise? By
#'   default this is set with the `"column"` keyword and colors will be applied
#'   down columns. The alternative option with the `"row"` keyword ensures that
#'   the color mapping works across rows.
#'
#' @param target_columns *Indirect columns to target*
#'
#'   `<row-targeting expression>` // *default:* `NULL` `optional`
#'
#'   For indirect column coloring treatments, we can supply the columns that
#'   will receive the styling. The necessary precondition is that we must use
#'   `direction = "column"`. If `columns` resolves to a single column then we
#'   may use one or more columns in `target_columns`. If on the other hand
#'   `columns` resolves to multiple columns, then `target_columns` must resolve
#'   to the same multiple.
#'
#' @param method *Color computation method*
#'
#'   `singl-kw:[auto|numeric|bin|quantile|factor]` // *default:* `"auto"`
#'
#'   A method for computing color based on the data within body cells. Can be
#'   `"auto"` (the default), `"numeric"`, `"bin"`, `"quantile"`, or `"factor"`.
#'   The `"auto"` method will automatically choose the `"numeric"` method for
#'   numerical input data or the `"factor"` method for any non-numeric inputs.
#'
#' @param palette *Color palette*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   A vector of color names, a color class that can be cast to a vector of
#'   color names, the name of an **RColorBrewer** palette, the name of a
#'   **viridis** palette, or a discrete palette accessible from the
#'   **paletteer** package using the `<package>::<palette>` syntax (e.g.,
#'   `"wesanderson::IsleofDogs1"`). If providing a vector of colors as a
#'   palette, each color value provided must either be a color name (Only R/X11
#'   color names or CSS 3.0 color names) or a hexadecimal string in the form of
#'   `"#RRGGBB"` or `"#RRGGBBAA"`. If nothing is provided here, the default R
#'   color palette is used (i.e., the colors from `palette()`).
#'
#' @param domain *Value domain*
#'
#'   `vector<numeric|integer|character>` // *default:* `NULL` (`optional`)
#'
#'   The possible values that can be mapped. For the `"numeric"` and `"bin"`
#'   methods, this can be a numeric range specified with a length of two vector.
#'   Representative numeric data is needed for the `"quantile"` method and
#'   categorical data must be used for the `"factor"` method. If `NULL` (the
#'   default value), the values in each column or row (depending on `direction`)
#'   value will represent the domain.
#'
#' @param bins *Specification of bin number*
#'
#'   `scalar<numeric|integer>` // *default:* `8`
#'
#'   For `method = "bin"` this can either be a numeric vector of two or more
#'   unique cut points, or, a single numeric value (greater than or equal to
#'   `2`) giving the number of intervals into which the domain values are to be
#'   cut. By default, this is `8`.
#'
#' @param quantiles *Specification of quantile number*
#'
#'   `scalar<numeric|integer>` // *default:* `4`
#'
#'   For `method = "quantile"` this is the number of equal-size quantiles to
#'   use. By default, this is set to `4`.
#'
#' @param levels *Specification of factor levels*
#'
#'   `vector<character>` // *default:* `NULL` (`optional`)
#'
#'   For `method = "factor"` this allows for an alternate way of specifying
#'   levels. If anything is provided here then any value supplied to `domain`
#'   will be ignored. This should be a character vector of unique values.
#'
#' @param ordered *Use an ordered factor*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   For `method = "factor"`, setting this to `TRUE` means that the vector
#'   supplied to `domain` will be treated as being in the correct order if that
#'   vector needs to be coerced to a factor. By default, this is `FALSE`.
#'
#' @param na_color *Default color for `NA` values*
#'
#'   `scalar<character>` // *default:* `NULL` (`optional`)
#'
#'   The color to use for missing values. By default (with `na_color = NULL`),
#'   the color gray (`"#808080"`) will be used. This option has no effect if
#'   providing a color-mapping function to `fn`.
#'
#' @param alpha *Transparency value*
#'
#'   `scalar<numeric|integer>(0>=val>=1)` // *default:* `NULL` (`optional`)
#'
#'   An optional, fixed alpha transparency value that will be applied to all
#'   color palette values (regardless of whether a color palette was directly
#'   supplied in `palette` or generated through a color mapping function via
#'   `fn`).
#'
#' @param reverse *Reverse order of computed colors*
#'
#'   `scalar<logical>` // *default:* `FALSE`
#'
#'   Should the colors computed operate in the reverse order? If `TRUE` then
#'   colors that normally change from red to blue will change in the opposite
#'   direction.
#'
#' @param fn *Color-mapping function*
#'
#'   `function` // *default:* `NULL` (`optional`)
#'
#'   A color-mapping function. The function should be able to take a vector of
#'   data values as input and return an equal-length vector of color values. The
#'   `scales::col_*()` functions (i.e.,[scales::col_numeric()],
#'   [scales::col_bin()], and [scales::col_factor()]) can be invoked here with
#'   options, as those functions themselves return a color-mapping function.
#'
#' @param apply_to *How to apply color*
#'
#'   `singl-kw:[fill|text]` // *default:* `"fill"`
#'
#'   Which style element should the colors be applied to? Options include the
#'   cell background (the default, given as `"fill"`) or the cell text
#'   (`"text"`).
#'
#' @param autocolor_text *Automatically recolor text*
#'
#'   `scalar<logical>` // *default:* `TRUE`
#'
#'   An option to let **gt** modify the coloring of text within cells undergoing
#'   background coloring. This will result in better text-to-background color
#'   contrast. By default, this is set to `TRUE`.
#'
#' @param contrast_algo *Color contrast algorithm choice*
#'
#'   `singl-kw:[apca|wcag]` // *default:* `"apca"`
#'
#'   The color contrast algorithm to use when `autocolor_text = TRUE`. By
#'   default this is `"apca"` (Accessible Perceptual Contrast Algorithm) and the
#'   alternative to this is `"wcag"` (Web Content Accessibility Guidelines).
#'
#' @param autocolor_light *Automatically recolor text, light color*
#'
#'   `scalar<character>` // *default:* `"white"`
#'
#'   The light color to use when `autocolor_text = TRUE`. By default the color
#'   `"white"` will be used (`#FFFFFF"`). Alpha channel values will be set to
#'   1.0 (fully opaque).
#'
#' @param autocolor_dark *Automatically recolor text, dark color*
#'
#'   `scalar<character>` // *default:* `"black"`
#'
#'   The dark color to use when `autocolor_text = TRUE`. By default the color
#'   `"black"` will be used (`#000000"`). Alpha channel values will be set to
#'   1.0 (fully opaque).
#'
#' @param colors *[Deprecated] Color mapping function*
#'
#'   `function` // *default:* `NULL` (`optional`)
#'
#'   This argument is deprecated. Use the `fn` argument instead to provide a
#'   **scales**-based color-mapping function. If providing a palette, use the
#'   `palette` argument.
#'
#' @return An object of class `gt_tbl`.
#'
#' @section Color computation methods:
#'
#' `data_color()` offers four distinct methods for computing color
#' based on cell data values. They are set by the `method` argument and the
#' options go by the keywords `"numeric"`, `"bin"`, `"quantile"`, and
#' `"factor"`. There are other arguments in `data_color()` that variously
#' support these methods (e.g., `bins` for the `"bin"` method, etc.). Here we'll
#' go through each method, providing a short explanation of what each one does
#' and which options are available.
#'
#' ### `"numeric"`
#'
#' The `"numeric"` method provides a simple linear mapping from continuous
#' numeric data to an interpolated `palette`. Internally, this uses
#' [scales::col_numeric()]. This method is suited for numeric data cell
#' values and can make use of a supplied `domain` value, in the form of a
#' two-element numeric vector describing the range of values, if provided.
#'
#' ### `"bin"`
#'
#' The `"bin"` method provides a mapping of continuous numeric data to
#' value-based bins. Internally, this uses [scales::col_bin()] which itself
#' uses [base::cut()]. As with the `"numeric"` method, `"bin"` is meant for
#' numeric data cell values. The use of a `domain` value is supported with this
#' method. The `bins` argument in `data_color()` is specific to this method,
#' offering the ability to: (1) specify the number of bins, or (2) provide a
#' vector of cut points.
#'
#' ### `"quantile"`
#'
#' The `"quantile"` method provides a mapping of continuous numeric data to
#' quantiles. Internally, this uses [scales::col_quantile()] which itself uses
#' [stats::quantile()]. Input data cell values should be numeric, as with the
#' `"numeric"` and `"bin"` methods. A numeric `domain` value is supported with
#' this method. The `quantiles` argument in `data_color()` controls the number
#' of equal-size quantiles to use.
#'
#' ### `"factor"`
#'
#' The `"factor"` method provides a mapping of factors to colors. With discrete
#' palettes, color interpolation is used when the number of factors does not
#' match the number of colors in the palette. Internally, this uses
#' [scales::col_factor()]. Input data cell values can be of any type
#' (i.e., factor, character, numeric values, and more are supported). The
#' optional input to `domain` should take the form of categorical data. The
#' `levels` and `ordered` arguments in `data_color()` support this method.
#'
#' @section Color palette access from **RColorBrewer** and **viridis**:
#'
#' All palettes from the **RColorBrewer** package and select palettes from
#' **viridis** can be accessed by providing the palette name in `palette`.
#' **RColorBrewer** has 35 available palettes:
#'
#' |    | Palette Name      | Colors  | Category    | Colorblind Friendly |
#' |----|-------------------|---------|-------------|---------------------|
#' | 1  | `"BrBG"`          | 11      | Diverging   | Yes                 |
#' | 2  | `"PiYG"`          | 11      | Diverging   | Yes                 |
#' | 3  | `"PRGn"`          | 11      | Diverging   | Yes                 |
#' | 4  | `"PuOr"`          | 11      | Diverging   | Yes                 |
#' | 5  | `"RdBu"`          | 11      | Diverging   | Yes                 |
#' | 6  | `"RdYlBu"`        | 11      | Diverging   | Yes                 |
#' | 7  | `"RdGy"`          | 11      | Diverging   | No                  |
#' | 8  | `"RdYlGn"`        | 11      | Diverging   | No                  |
#' | 9  | `"Spectral"`      | 11      | Diverging   | No                  |
#' | 10 | `"Dark2"`         | 8       | Qualitative | Yes                 |
#' | 11 | `"Paired"`        | 12      | Qualitative | Yes                 |
#' | 12 | `"Set1"`          | 9       | Qualitative | No                  |
#' | 13 | `"Set2"`          | 8       | Qualitative | Yes                 |
#' | 14 | `"Set3"`          | 12      | Qualitative | No                  |
#' | 15 | `"Accent"`        | 8       | Qualitative | No                  |
#' | 16 | `"Pastel1"`       | 9       | Qualitative | No                  |
#' | 17 | `"Pastel2"`       | 8       | Qualitative | No                  |
#' | 18 | `"Blues"`         | 9       | Sequential  | Yes                 |
#' | 19 | `"BuGn"`          | 9       | Sequential  | Yes                 |
#' | 20 | `"BuPu"`          | 9       | Sequential  | Yes                 |
#' | 21 | `"GnBu"`          | 9       | Sequential  | Yes                 |
#' | 22 | `"Greens"`        | 9       | Sequential  | Yes                 |
#' | 23 | `"Greys"`         | 9       | Sequential  | Yes                 |
#' | 24 | `"Oranges"`       | 9       | Sequential  | Yes                 |
#' | 25 | `"OrRd"`          | 9       | Sequential  | Yes                 |
#' | 26 | `"PuBu"`          | 9       | Sequential  | Yes                 |
#' | 27 | `"PuBuGn"`        | 9       | Sequential  | Yes                 |
#' | 28 | `"PuRd"`          | 9       | Sequential  | Yes                 |
#' | 29 | `"Purples"`       | 9       | Sequential  | Yes                 |
#' | 30 | `"RdPu"`          | 9       | Sequential  | Yes                 |
#' | 31 | `"Reds"`          | 9       | Sequential  | Yes                 |
#' | 32 | `"YlGn"`          | 9       | Sequential  | Yes                 |
#' | 33 | `"YlGnBu"`        | 9       | Sequential  | Yes                 |
#' | 34 | `"YlOrBr"`        | 9       | Sequential  | Yes                 |
#' | 35 | `"YlOrRd"`        | 9       | Sequential  | Yes                 |
#'
#' We can access four colorblind-friendly palettes from **viridis**:
#' `"viridis"`, `"magma"`, `"plasma"`, and `"inferno"`. Simply provide any one
#' of those names to `palette`.
#'
#' @section Color palette access from **paletteer**:
#'
#' Choosing the right color palette can often be difficult because it's both
#' hard to discover suitable palettes and then obtain the vector of colors. To
#' make this process easier we can elect to use the **paletteer** package,
#' which makes a wide range of palettes from various R packages readily
#' available. The [info_paletteer()] information table allows us to easily
#' inspect all of the discrete color palettes available in **paletteer**. We
#' only then need to specify the palette and associated package using the
#' `<package>::<palette>` syntax (e.g., `"tvthemes::Stannis"`) for
#' the `palette` argument.
#'
#' A requirement for using **paletteer** in this way is that the package must be
#' installed (**gt** doesn't import **paletteer** currently). This can be easily
#' done with `install.packages("paletteer")`. Not having this package installed
#' with result in an error when using the `<package>::<palette>` syntax in
#' `palette`.
#'
#' @section Foreground text and background fill:
#'
#' By default, **gt** will choose the ideal text color (for maximal contrast)
#' when colorizing the background of data cells. This option can be disabled by
#' setting `autocolor_text` to `FALSE`. The `contrast_algo` argument lets us
#' choose between two color contrast algorithms: `"apca"` (*Accessible
#' Perceptual Contrast Algorithm*, the default algo) and `"wcag"` (*Web Content
#' Accessibility Guidelines*). `autocolor_light` and `autocolor_dark` allow for
#' further customization, however, should only be used if you are sure that
#' accessibility criteria are guaranteed.
#'
#' @section Examples:
#'
#' `data_color()` can be used without any supplied arguments to
#' colorize a **gt** table. Let's do this with the [`exibble`] dataset:
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   data_color()
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_1.png")`
#' }}
#'
#' What's happened is that `data_color()` applies background colors to all cells
#' of every column with the default palette in R (accessed through `palette()`).
#' The default method for applying color is `"auto"`, where numeric values will
#' use the `"numeric"` method and character or factor values will use the
#' `"factor"` method. The text color undergoes an automatic modification that
#' maximizes contrast (since `autocolor_text` is `TRUE` by default).
#'
#' You can use any of the available `method` keywords and **gt** will only apply
#' color to the compatible values. Let's use the `"numeric"` method and supply
#' `palette` values of `"red"` and `"green"`.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   data_color(
#'     method = "numeric",
#'     palette = c("red", "green")
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_2.png")`
#' }}
#'
#' With those options in place we see that only the numeric columns `num` and
#' `currency` received color treatments. Moreover, the palette colors were
#' mapped to the lower and upper limits of the data in each column; interpolated
#' colors were used for the values in between the numeric limits of the two
#' columns.
#'
#' We can constrain the cells to which coloring will be applied with the
#' `columns` and `rows` arguments. Further to this, we can manually set the
#' limits of the data with the `domain` argument (which is preferable in most
#' cases). Here, the domain will be set as `domain = c(0, 50)`.
#'
#' ```r
#' exibble |>
#'   gt() |>
#'   data_color(
#'     columns = currency,
#'     rows = currency < 50,
#'     method = "numeric",
#'     palette = c("red", "green"),
#'     domain = c(0, 50)
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_3.png")`
#' }}
#'
#' We can use any of the palettes available in the **RColorBrewer** and
#' **viridis** packages. Let's make a new **gt** table from a subset of the
#' [`countrypops`] dataset. Then, through `data_color()`, we'll apply coloring
#' to the `population` column with the `"numeric"` method, use a domain between
#' 2.5 and 3.4 million, and specify `palette = "viridis"`.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Bangladesh",
#'     year %in% 2012:2021
#'   ) |>
#'   gt() |>
#'   data_color(
#'     columns = population,
#'     method = "numeric",
#'     palette = "viridis",
#'     domain = c(150E6, 170E6),
#'     reverse = TRUE
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_4.png")`
#' }}
#'
#' We can alternatively use the `fn` argument for supplying the **scales**-based
#' function [scales::col_numeric()]. That function call will itself return a
#' function (which is what the `fn` argument actually requires) that takes a
#' vector of numeric values and returns color values. Here is an alternate
#' version of the code that returns the same table as in the previous example.
#'
#' ```r
#' countrypops |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(
#'     country_name == "Bangladesh",
#'     year %in% 2012:2021
#'   ) |>
#'   gt() |>
#'   data_color(
#'     columns = population,
#'     fn = scales::col_numeric(
#'       palette = "viridis",
#'       domain = c(150E6, 170E6),
#'       reverse = TRUE
#'     )
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_4.png")`
#' }}
#'
#' Using your own function in `fn` can be very useful if you want to make use of
#' specialized arguments in the `scales::col_*()` functions. You could even
#' supply your own specialized function for performing complex colorizing
#' treatments!
#'
#' `data_color()` has a way to apply colorization indirectly to
#' other columns. That is, you can apply colors to a column different from the
#' one used to generate those specific colors. The trick is to use the
#' `target_columns` argument. Let's do this with a more complete
#' [`countrypops`]-based table example.
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_code_3 %in% c("FRA", "GBR")) |>
#'   dplyr::filter(year %% 10 == 0) |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::mutate(color = "") |>
#'   gt(groupname_col = "country_name") |>
#'   fmt_integer(columns = population) |>
#'   data_color(
#'     columns = population,
#'     target_columns = color,
#'     method = "numeric",
#'     palette = "viridis",
#'     domain = c(4E7, 7E7)
#'   ) |>
#'   cols_label(
#'     year = "",
#'     population = "Population",
#'     color = ""
#'   ) |>
#'   opt_vertical_padding(scale = 0.65)
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_5.png")`
#' }}
#'
#' When specifying a single column in `columns` we can use as many
#' `target_columns` values as we want. Let's make another [`countrypops`]-based
#' table where we map the generated colors from the `year` column to all columns
#' in the table. This time, the `palette` used is `"inferno"` (also from the
#' **viridis** package).
#'
#' ```r
#' countrypops |>
#'   dplyr::filter(country_code_3 %in% c("FRA", "GBR", "ITA")) |>
#'   dplyr::select(-contains("code")) |>
#'   dplyr::filter(year %% 5 == 0) |>
#'   tidyr::pivot_wider(
#'     names_from = "country_name",
#'     values_from = "population"
#'   ) |>
#'   gt() |>
#'   fmt_integer(columns = c(everything(), -year)) |>
#'   cols_width(
#'     year ~ px(80),
#'     everything() ~ px(160)
#'   ) |>
#'   opt_all_caps() |>
#'   opt_vertical_padding(scale = 0.75) |>
#'   opt_horizontal_padding(scale = 3) |>
#'   data_color(
#'     columns = year,
#'     target_columns = everything(),
#'     palette = "inferno"
#'   ) |>
#'   tab_options(
#'     table_body.hlines.style = "none",
#'     column_labels.border.top.color = "black",
#'     column_labels.border.bottom.color = "black",
#'     table_body.border.bottom.color = "black"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_6.png")`
#' }}
#'
#' Now, it's time to use [`pizzaplace`] to create a **gt** table. The color
#' palette to be used is the `"ggsci::red_material"` one (it's in the **ggsci**
#' R package but also obtainable from the **paletteer** package).
#' Colorization will be applied to the to the `sold` and `income` columns. We
#' don't have to specify those in `columns` because those are the only columns
#' in the table. Also, the `domain` is not set here. We'll use the bounds of the
#' available data in each column.
#'
#' ```r
#' pizzaplace |>
#'   dplyr::group_by(type, size) |>
#'   dplyr::summarize(
#'     sold = dplyr::n(),
#'     income = sum(price),
#'     .groups = "drop_last"
#'   ) |>
#'   dplyr::group_by(type) |>
#'   dplyr::mutate(f_sold = sold / sum(sold)) |>
#'   dplyr::mutate(size = factor(
#'     size, levels = c("S", "M", "L", "XL", "XXL"))
#'   ) |>
#'   dplyr::arrange(type, size) |>
#'   gt(
#'     rowname_col = "size",
#'     groupname_col = "type"
#'   ) |>
#'   fmt_percent(
#'     columns = f_sold,
#'     decimals = 1
#'   ) |>
#'   cols_merge(
#'     columns = c(size, f_sold),
#'     pattern = "{1} ({2})"
#'   ) |>
#'   cols_align(align = "left", columns = stub()) |>
#'   data_color(
#'     method = "numeric",
#'     palette = "ggsci::red_material"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_7.png")`
#' }}
#'
#' Colorization can occur in a row-wise manner. The key to making that happen is
#' by using `direction = "row"`. Let's use the [`sza`] dataset to make a **gt**
#' table. Then, color will be applied to values across each 'month' of data in
#' that table. This is useful when not setting a `domain` as the bounds of each
#' row will be captured, coloring each cell with values relative to the range.
#' The `palette` is `"PuOr"` from the **RColorBrewer** package (only the name
#' here is required).
#'
#' ```r
#' sza |>
#'   dplyr::filter(latitude == 20 & tst <= "1200") |>
#'   dplyr::select(-latitude) |>
#'   dplyr::filter(!is.na(sza)) |>
#'   tidyr::pivot_wider(
#'     names_from = tst,
#'     values_from = sza,
#'     names_sort = TRUE
#'   ) |>
#'   gt(rowname_col = "month") |>
#'   sub_missing(missing_text = "") |>
#'   data_color(
#'     direction = "row",
#'     palette = "PuOr",
#'     na_color = "white"
#'   )
#' ```
#'
#' \if{html}{\out{
#' `r man_get_image_tag(file = "man_data_color_8.png")`
#' }}
#'
#' Notice that `na_color = "white"` was used, and this avoids the appearance of
#' gray cells for the missing values (we also removed the `"NA"` text with
#' [sub_missing()], opting for empty strings).
#'
#' @family data formatting functions
#' @section Function ID:
#' 3-37
#'
#' @section Function Introduced:
#' `v0.2.0.5` (March 31, 2020)
#'
#' @export
data_color <- function(
    data,
    columns = everything(),
    rows = everything(),
    direction = c("column", "row"),
    target_columns = NULL,
    method = c("auto", "numeric", "bin", "quantile", "factor"),
    palette = NULL,
    domain = NULL,
    bins = 8,
    quantiles = 4,
    levels = NULL,
    ordered = FALSE,
    na_color = NULL,
    alpha = NULL,
    reverse = FALSE,
    fn = NULL,
    apply_to = c("fill", "text"),
    autocolor_text = TRUE,
    contrast_algo = c("apca", "wcag"),
    autocolor_light = "#FFFFFF",
    autocolor_dark = "#000000",
    colors = NULL
) {

  # Perform input object validation
  stop_if_not_gt_tbl(data = data)

  # Get the correct `direction` value
  direction <- rlang::arg_match0(direction, values = c("column", "row"))

  # Get the correct `method` value
  method <-
    rlang::arg_match0(
      method,
      values = c("auto", "numeric", "bin", "quantile", "factor")
    )

  # Get the correct `apply_to` value
  apply_to <- rlang::arg_match0(apply_to, values = c("fill", "text"))

  # Get the correct `contrast_algo` value
  contrast_algo <- rlang::arg_match0(contrast_algo, values = c("apca", "wcag"))

  # When using non-default `autocolor_light` or `autocolor_dark`, check if
  # {farver} is installed and stop if not (we would error in `ideal_fgnd_color()`,
  # check here to get out early)
  if (rlang::is_true(autocolor_text) && !autocolor_light %in% c("white", "#FFFFFF", "#FFF")) {
    rlang::check_installed(
      "farver", reason = "to use non-default `autocolor_light`."
      )
  }

  if (rlang::is_true(autocolor_text) && !autocolor_dark %in% c("black", "#000000", "#000")) {
    rlang::check_installed(
      "farver", reason = "to use non-default `autocolor_dark`."
      )
  }

  # If no color is provided to `na_color`, use gray as a default
  na_color <- na_color %||% "#808080"

  # Error early if `palette = NA`, or is a numeric vector.
  if (length(palette) > 0L && (is.numeric(palette) || anyNA(palette))) {
    cli::cli_abort(c(
      "`palette` must be a {.help [valid palette](gt::data_color)}, not a numeric vector."
    ))
  }

  # Defuse any function supplied to `fn`; if a function is supplied to `colors`
  # (previous argument for this purpose) then let that take precedent and
  # provide a deprecation warning
  if (!is.null(colors)) {

    fn <- rlang::enquo(colors)

    if (is.character(rlang::eval_tidy(fn))) {

      palette <- rlang::eval_tidy(fn)
      fn <- NULL

      cli::cli_warn(c(
        "Since gt v0.9.0, the `colors` argument has been deprecated.",
        "*" = "Please use the `palette` argument to define a color palette."
      ),
      .frequency = "regularly",
      .frequency_id = "data_color_colors_arg_palette"
      )

    } else {

      cli::cli_warn(c(
        "Since gt v0.9.0, the `colors` argument has been deprecated.",
        "*" = "Please use the `fn` argument instead."
      ),
      .frequency = "regularly",
      .frequency_id = "data_color_colors_arg_fn"
      )
    }

  } else if (!is.null(fn)) {

    fn <- rlang::enquo(fn)

  } else {

    fn <- NULL
  }

  # Ensure that the `palette` contains something that can be used if no
  # function (as `fn`) was provided
  if (is.null(fn)) {

    # If no palette is provided, use the default palette
    palette <- palette %||% palette()

    # Obtain a palette from the paletteer package if the
    # `palette` value is of the special form `<package>::<palette>`
    if (
      is.character(palette) &&
      length(palette) == 1 &&
      grepl("^.+?::.+?$", palette)
    ) {

      # Determine if the paletteer package is installed and stop the
      # function if it is not present

      rlang::check_installed(
        "paletteer",
        reason = "to use palettes with the <package>::<palette> syntax."
      )

      # Parse the `palette` string and extract the two different
      # components: the package that the palette comes from and the
      # name of the palette
      palette_pkg <- unlist(strsplit(palette, "::"))[1]
      palette_name <- unlist(strsplit(palette, "::"))[2]

      # Get the table of discrete palettes hosted in the paletteer package
      palettes_tbl <- paletteer::palettes_d_names

      # Use a `filter()` statement to determine if the package part of the
      # string provided exists in paletteer
      palettes_tbl <- dplyr::filter(palettes_tbl, package == palette_pkg)

      # If the filtering results in a zero-row table, then stop the
      # function and provide messaging on what went wrong and how
      # to diagnose
      if (nrow(palettes_tbl) < 1) {
        cli::cli_abort(c(
          "The palette package name (supplied with the `<package>::<palette>`
          syntax) cannot be found in the paletteer package.",
          "*" = "Ensure that it exists in the vector accessed with
          `paletteer::paletteer_packages$Name`."
        ))
      }

      # Use a second `filter()` statement to determine if the palette name
      # component exists in paletteer for the color package
      palettes_tbl <- dplyr::filter(palettes_tbl, palette == palette_name)

      # If this filtering results in a zero-row table, stop the function
      # and provide messaging on what went wrong and how to diagnose
      if (nrow(palettes_tbl) < 1) {
        cli::cli_abort(c(
          "The palette name (supplied with the `<package>::<palette>`
          syntax) is not associated with the {.pkg {palette_pkg}} package as a
          discrete palette.",
          "*" = "Ensure that the combination of palette package and palette
          name exists as a record in the table accessed with
          `paletteer::palettes_d_names`."
        ))
      }

      # Getting to this stage means the palette exists in the user's
      # installation of paletteer; extract the palette with the
      # `paletteer::paletteer_d()`
      palette <- paletteer::paletteer_d(palette = palette)
    }

    # Cast the palette to a character vector for compatibility with
    # scales:::toPaletteFunc(), which does not have methods for classed color
    # vectors (such as those in the paletteer package). Casting is done here so
    # classed color vectors from packages other than paletteer can also be used
    # with `palette` (#1155).
    palette <- as.character(palette)
  }

  # Get the internal data table
  data_tbl <- dt_data_get(data = data)

  # Evaluate `colors` with `eval_tidy()` (supports quosures)
  fn <- rlang::eval_tidy(fn, data_tbl)

  # Resolution of `columns` as column names in the table
  resolved_columns <- resolve_cols_c(expr = {{ columns }}, data = data)

  # Resolution of `target_columns` as column names in the table
  resolved_target_columns <-
    resolve_cols_c(
      expr = {{ target_columns }},
      data = data,
      null_means = "nothing"
    )

  # Validate the supplied `resolved_target_columns` value
  if (length(resolved_target_columns) > 0) {

    # Stop function if the `direction = "column"` option is not used
    if (direction != "column") {

      cli::cli_abort(c(
        "Specification of {.arg target_columns} can only be done with the
        `direction = {.val column}` option.",
        "*" = "Please modify the `direction` option or remove any values in
        {.arg target_columns}."
      ))
    }

    # Obtain lengths of basis and target columns
    resolv_col_length <- length(resolved_columns)
    target_col_length <- length(resolved_target_columns)

    # Stop function in the case of more than one basis column not matching the
    # number of target columns
    if (resolv_col_length > 1 && resolv_col_length != target_col_length) {

      cli::cli_abort(c(
        "If the length of resolved {.arg columns} is greater than one it must match
        the length of the resolved {.arg target_columns}.",
        "*" = "Please ensure these greater-than-one lengths are the same."
      ))
    }
  }

  # Resolution of `rows` as row indices in the table
  resolved_rows <- resolve_rows_i(expr = {{ rows }}, data = data)

  # If resolved rows from tidyselect is NULL, then we return early
  # to avoid scales issues later.
  if (length(resolved_rows) == 0) {
    #1665
    return(data)
  }
  # Generate a table to accumulate all of the styles to be applied to the
  # body cells; in the end, this (along with all previously set styles) will
  # be used in a concluding `dt_styles_set()` call
  data_color_styles_tbl <-
    vctrs::data_frame(
      locname = character(0L),
      grpname = character(0L),
      colname = character(0L),
      locnum = numeric(0L),
      rownum = integer(0L),
      colnum = integer(0L),
      styles = list()
    )

  # Obtain the total number of iterations depending on whether
  # `direction` is column-wise or row-wise
  if (direction == "column") {
    total_iterations <- seq_along(resolved_columns)
  } else {
    total_iterations <- seq_along(resolved_rows)
  }

  # Iteration is performed in a piecewise manner
  for (i in total_iterations) {

    if (direction == "column") {

      data_vals <- data_tbl[resolved_rows, resolved_columns[i], drop = TRUE]

    } else {

      data_vals <- data_tbl[resolved_columns]
      data_vals <- unname(unlist(as.vector(data_vals[resolved_rows[i], ])))
    }

    if (!is.null(fn)) {

      # If a color function is directly provided, use as is
      color_fn <- fn

    } else if (method == "auto") {

      # For the "auto" method, we are getting data values in a piece-wise
      # fashion and the strategy is to generate a color function (using
      # a `scales::col_*()` function) for each piece of data; we can
      # process vectors that are numeric with `scales::col_numeric()` and
      # vectors that are either character or factor with `scales::col_factor()`

      if (is.numeric(data_vals)) {

        # Create a color function based on `scales::col_numeric()`
        # Rethrow the error if something occurs. #1373
        color_fn <-
          withCallingHandlers(
            scales::col_numeric(
              palette = palette,
              domain = domain %||% data_vals,
              na.color = na_color,
              alpha = TRUE,
              reverse = reverse
            ),
            error = function(e) {
              cli::cli_abort(
                "Failed to compute colors for column {.code {resolved_columns[i]}}.",
                parent = e
              )
            }
          )


      } else if (is.character(data_vals) || is.factor(data_vals)) {

        # At the time of this writing, scales has a bug where palettes in the
        # form of colors (as opposed to functions or palette names) use
        # interpolation when the number of colors is greater than the number
        # of levels. Instead, colors should be subsetted. scales does the right
        # thing for palette names though, so we need to screen those cases out.
        palette <-
          screen_palette_for_col_factor(
            palette = palette,
            data_vals = data_vals
          )

        # Create a color function based on `scales::col_factor()`
        color_fn <-
          scales::col_factor(
            palette = palette,
            domain = domain %||% data_vals,
            levels = levels,
            ordered = ordered,
            na.color = na_color,
            alpha = TRUE,
            reverse = reverse
          )
      }

    } else if (method == "numeric") {

      if (!is.numeric(data_vals) && direction == "row") {

        cli::cli_abort(c(
          "The {.val numeric} method with {.code direction = {.val row}} cannot be used
          when non-numeric columns are included.",
          "*" = "Either specify a collection of numeric columns or use the
          {.val factor} method."
        ))
      }

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_numeric()`
      color_fn <-
        scales::col_numeric(
          palette = palette,
          domain = domain %||% data_vals,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse
        )

    } else if (method == "bin") {

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_bin()`
      color_fn <-
        scales::col_bin(
          palette = palette,
          domain = domain %||% data_vals,
          bins = bins,
          pretty = FALSE,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse,
          right = FALSE
        )

    } else if (method == "quantile") {

      if (!is.numeric(data_vals)) next

      # Create a color function based on `scales::col_quantile()`
      color_fn <-
        scales::col_quantile(
          palette = palette,
          domain = domain %||% data_vals,
          n = quantiles,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse,
          right = FALSE
        )

    } else if (method == "factor") {

      palette <-
        screen_palette_for_col_factor(
          palette = palette,
          data_vals = data_vals
        )

      # Create a color function based on `scales::col_factor()`
      color_fn <-
        scales::col_factor(
          palette = palette,
          domain = domain %||% data_vals,
          levels = levels,
          ordered = ordered,
          na.color = na_color,
          alpha = TRUE,
          reverse = reverse
        )
    }

    # Evaluate `color_fn` with `eval_tidy()` (supports quosures)
    color_fn <- rlang::eval_tidy(color_fn, data_tbl)

    # Evaluate the color function with the data values
    color_vals <- color_fn(data_vals)

    # Process the color values, combining with a
    # fixed alpha value if necessary
    color_vals <- html_color(colors = color_vals, alpha = alpha)

    color_styles <-
      switch(
        apply_to,
        fill = lapply(color_vals, FUN = function(x) cell_fill(color = x)),
        text = lapply(color_vals, FUN = function(x) cell_text(color = x))
      )

    if (length(resolved_target_columns) > 0 && direction == "column") {

      if (length(resolved_columns) > 1) {

        data_color_styles_tbl <-
          vctrs::vec_rbind(
            data_color_styles_tbl,
            generate_data_color_styles_tbl(
              columns = resolved_target_columns[i],
              rows = resolved_rows,
              color_styles = color_styles
            )
          )

      } else {

        for (j in seq_along(resolved_target_columns)) {

          data_color_styles_tbl <-
            vctrs::vec_rbind(
              data_color_styles_tbl,
              generate_data_color_styles_tbl(
                columns = resolved_target_columns[j],
                rows = resolved_rows,
                color_styles = color_styles
              )
            )
        }
      }


    } else {

      data_color_styles_tbl <-
        vctrs::vec_rbind(
          data_color_styles_tbl,
          generate_data_color_styles_tbl(
            columns = if (direction == "column") resolved_columns[i] else resolved_columns,
            rows = if (direction == "column") resolved_rows else resolved_rows[i],
            color_styles = color_styles
          )
        )
    }

    # We are to generate an extra set of styling if we are applying coloring
    # to the background fill and `autocolor_text = TRUE`. This styling applies
    # to the foreground text in the same cells. For each background fill color,
    # the ideal text color (either a light or dark color) will be determined
    # and styles based on `cell_text(color = ...)` will be generated and added
    # to the `data_color_styles_tbl`
    if (apply_to == "fill" && autocolor_text) {

      color_vals <-
        ideal_fgnd_color(
          bgnd_color = color_vals,
          light = autocolor_light,
          dark = autocolor_dark,
          algo = contrast_algo
        )

      color_styles <- lapply(color_vals, FUN = function(x) cell_text(color = x))

      if (length(resolved_target_columns) > 0 && direction == "column") {

        if (length(resolved_columns) > 1) {

          data_color_styles_tbl <-
            vctrs::vec_rbind(
              data_color_styles_tbl,
              generate_data_color_styles_tbl(
                columns = resolved_target_columns[i],
                rows = resolved_rows,
                color_styles = color_styles
              )
            )

        } else {

          for (j in seq_along(resolved_target_columns)) {

            data_color_styles_tbl <-
              vctrs::vec_rbind(
                data_color_styles_tbl,
                generate_data_color_styles_tbl(
                  columns = resolved_target_columns[j],
                  rows = resolved_rows,
                  color_styles = color_styles
                )
              )
          }
        }

      } else {

        data_color_styles_tbl <-
          vctrs::vec_rbind(
            data_color_styles_tbl,
            generate_data_color_styles_tbl(
              columns = if (direction == "column") resolved_columns[i] else resolved_columns,
              rows = if (direction == "column") resolved_rows else resolved_rows[i],
              color_styles = color_styles
            )
          )
      }
    }
  }

  dt_styles_set(
    data = data,
    styles = vctrs::vec_rbind(dt_styles_get(data = data), data_color_styles_tbl)
  )
}

generate_data_color_styles_tbl <- function(columns, rows, color_styles) {

  vctrs::data_frame(
    locname = "data",
    grpname = NA_character_,
    colname = columns,
    locnum = 5,
    rownum = rows,
    colnum = NA_integer_,
    styles = color_styles
  )
}

screen_palette_for_col_factor <- function(palette, data_vals) {

  if (length(palette) > 1) {

    nlvl <-
      if (is.factor(data_vals)) {
        nlevels(data_vals)
      } else {
        nlevels(factor(data_vals))
      }

    if (length(palette) > nlvl) {
      palette <- palette[seq_len(nlvl)]
    }
  }
  palette
}

#' Are color values in rgba() format?
#'
#' The input for this is a character vector that should contain color strings.
#' While users won't directly supply colors in rgba() format, `html_color()`
#' can produce these types of color values and this utility function is
#' used in `rgba_to_hex()` to help convert colors *back* to hexadecimal
#' (ultimately for `ideal_fgnd_color()`). The output of
#' `is_rgba_col()` is a vector of logical values (the same length as the input
#' `colors` vector).
#'
#' @param colors A vector of color values.
#'
#' @noRd
is_rgba_col <- function(colors) {
  grepl("^rgba\\(\\s*(?:[0-9]+?\\s*,\\s*){3}[0-9\\.]+?\\s*\\)$", colors)
}

#' Are color values in hexadecimal format?
#'
#' This regex checks for valid hexadecimal colors in either the `#RRGGBB` and
#' `#RRGGBBAA` forms (not including shortened form `#RGB` here,
#' `is_short_hex()` handles this case).
#'
#' @param colors A vector of color values.
#'
#' @noRd
is_hex_col <- function(colors) {
  grepl("^#[0-9a-fA-F]{6}([0-9a-fA-F]{2})?$", colors)
}

#' Are color values in the shorthand hexadecimal format?
#'
#' This regex checks for valid hexadecimal colors in the `#RGB` or `#RGBA`
#' shorthand forms.
#'
#' @param colors A vector of color values.
#'
#' @noRd
is_short_hex <- function(colors) {
  grepl("^#[0-9a-fA-F]{3}([0-9a-fA-F])?$", colors)
}

#' Expand shorthand hexadecimal colors to the normal form
#'
#' This function takes a vector of colors in the `#RGB` or `#RGBA`
#' shorthand forms and transforms them to their respective normal forms
#' (`#RRGGBB` and `#RRGGBBAA`). This should only be used with a vector of
#' `#RGB`- and `#RGBA`-formatted color values; `is_short_hex()` should be used
#' beforehand to ensure that input `colors` vector conforms to this expectation.
#'
#' @param colors A vector of color values.
#'
#' @noRd
expand_short_hex <- function(colors) {
  gsub("^#(.)(.)(.)(.?)$", "#\\1\\1\\2\\2\\3\\3\\4\\4", toupper(colors))
}

#' For a background color, which foreground color provides better contrast?
#'
#' The `bgnd_color` input for this function is a single color value in 'rgba()'
#' format. The output is a single color value in #RRGGBB hexadecimal format.
#' `light` and `dark` accepts every color(specification) that can be handled by
#' {farver}.
#'
#' @noRd
ideal_fgnd_color <- function(
    bgnd_color,
    light = "#FFFFFF",
    dark = "#000000",
    algo = c("apca", "wcag")
) {

  # Get the correct `algo` value
  algo <- rlang::arg_match0(algo, values = c("apca", "wcag"))

  light_color <- farver::encode_colour(farver::decode_colour(light))
  dark_color <- farver::encode_colour(farver::decode_colour(dark))

  # Normalize color to hexadecimal color if it is in the 'rgba()' string format
  bgnd_color <- rgba_to_hex(colors = bgnd_color)

  # Normalize color to a #RRGGBB (stripping the alpha channel)
  bgnd_color <- html_color(colors = bgnd_color, alpha = 1)

  if (algo == "apca") {

    # Determine the ideal color for the chosen background color with APCA
    contrast_dark <- get_contrast_ratio(color_1 = dark_color, color_2 = bgnd_color, algo = "apca")[, 1]
    contrast_light <- get_contrast_ratio(color_1 = light_color, color_2 = bgnd_color, algo = "apca")[, 1]

  } else {

    # Determine the ideal color for the chosen background color with WCAG
    contrast_dark <- get_contrast_ratio(color_1 = dark_color, color_2 = bgnd_color, algo = "wcag")
    contrast_light <- get_contrast_ratio(color_1 = light_color, color_2 = bgnd_color, algo = "wcag")
  }

  ifelse(abs(contrast_dark) >= abs(contrast_light), dark_color, light_color)
}

#' Convert colors in mixed formats (incl. rgba() strings) format to hexadecimal
#'
#' This function will accept colors in mixed formats and convert any in the
#' 'rgba()' string format (e.g., "`rgba(255,170,0,0.5)`") to a hexadecimal
#' format that preserves the alpha information (#RRGGBBAA). This function is
#' required for the `ideal_fgnd_color()` function.
#'
#' @noRd
rgba_to_hex <- function(colors) {

  colors_vec <- rep(NA_character_, length(colors))

  colors_rgba <- is_rgba_col(colors = colors)

  colors_vec[!colors_rgba] <- colors[!colors_rgba]

  rgba_str <- gsub("(rgba\\(|\\))", "", colors[colors_rgba])

  rgba_vec <- as.numeric(unlist(strsplit(rgba_str, ",")))

  color_matrix <-
    matrix(
      rgba_vec,
      ncol = 4L,
      dimnames = list(c(), c("r", "g", "b", "alpha")),
      byrow = TRUE
    )

  alpha <- unname(color_matrix[, "alpha"])

  # Convert color matrix to hexadecimal colors in the #RRGGBBAA format
  colors_to_hex <-
    grDevices::rgb(
      red = color_matrix[, "r"] / 255,
      green = color_matrix[, "g"] / 255,
      blue = color_matrix[, "b"] / 255,
      alpha = alpha
    )

  colors_vec[colors_rgba] <- colors_to_hex

  colors_vec
}

#' With a vector of input colors return normalized color strings
#'
#' Input colors can be color names (e.g., `"green"`, `"steelblue"`, etc.) or
#' colors in hexadecimal format with or without an alpha component (either
#' #RRGGBB or #RRGGBBAA). Output is the same length vector as the
#' input but it will contain a mixture of either #RRGGBB colors (if the input
#' alpha value for a color is 1) or 'rgba()' string format colors (if the input
#' alpha value for a color is not 1).
#'
#' @noRd
html_color <- function(colors, alpha = NULL, call = rlang::caller_env()) {

  # Stop function if there are any NA values in `colors`
  if (anyNA(colors)) {
    cli::cli_abort("`colors` should not contain any `NA` values.", call = call)
  }

  is_rgba <- is_rgba_col(colors = colors)
  is_short_hex <- is_short_hex(colors = colors)

  # Expand any shorthand hexadecimal color values to the `RRGGBB` form
  colors[is_short_hex] <- expand_short_hex(colors = colors[is_short_hex])

  is_hex <- is_hex_col(colors = colors)

  # If not classified as RGBA or hexadecimal, assume other values are named
  # colors to be handled separately
  is_named <- !is_rgba & !is_hex

  colors[is_named] <- tolower(colors[is_named])

  named_colors <- colors[is_named]

  if (length(named_colors) > 0) {

    # Ensure that all color names are in the set of X11/R color
    # names or CSS color names
    check_named_colors(named_colors, call = call)

    # Translate the `transparent` color to #FFFFFF00 (white, transparent)
    named_colors[named_colors == "transparent"] <- "#FFFFFF00"

    # Translate any CSS exclusive colors to hexadecimal values;
    # there are nine CSS 3.0 named colors that don't belong to the
    # set of X11/R color names (not included numbered variants and
    # the numbered grays, those will be handled by `grDevices::col2rgb()`)
    is_css_excl_named <- colors %in% names(css_exclusive_colors())

    if (any(is_css_excl_named)) {

      # `css_exclusive_colors()` returns a named vector
      # of the CSS colors not in the X11/R set; the names are the hexadecimal
      # color values
      colors[is_css_excl_named] <-
        unname(css_exclusive_colors()[colors[is_css_excl_named]])
    }
  }

  # Normalize all non-'rgba()' color values and combine
  # with any preexisting 'rgba()' color values
  colors[!is_rgba] <-
    normalize_colors(
      colors = colors[!is_rgba],
      alpha = alpha
    )

  colors
}

# Utility function for creating 'rgba()' color values
# from an RGBA color matrix (already subsetted to those
# rows where alpha < 1)
col_matrix_to_rgba <- function(color_matrix) {

  paste0(
    "rgba(",
    color_matrix[, "red"], ",",
    color_matrix[, "green"], ",",
    color_matrix[, "blue"], ",",
    round(color_matrix[, "alpha"], 2),
    ")"
  )
}

# Utility function for generating hexadecimal or 'rgba()' colors (for IE11
# compatibility with colors having some transparency) from hexadecimal color
# values and X11/R color names
normalize_colors <- function(colors, alpha) {

  # Create a color matrix with an `alpha` column
  color_matrix <- t(grDevices::col2rgb(col = colors, alpha = TRUE))
  color_matrix[, "alpha"] <- color_matrix[, "alpha"] / 255

  # If `alpha` has a value, replace all pre-existing
  # alpha values in the color matrix with `alpha`
  if (!is.null(alpha)) {
    color_matrix[, "alpha"] <- alpha
  }

  # Generate a vector for the finalized HTML color values
  colors_html <- rep(NA_character_, nrow(color_matrix))

  # Determine which of the input colors have an alpha of `1`
  colors_alpha_1 <- color_matrix[, "alpha"] == 1

  # Generate #RRGGBB color values for `colors_html`
  colors_html[colors_alpha_1] <-
    grDevices::rgb(
      red = color_matrix[colors_alpha_1, "red", drop = FALSE] / 255,
      green = color_matrix[colors_alpha_1, "green", drop = FALSE] / 255,
      blue = color_matrix[colors_alpha_1, "blue", drop = FALSE] / 255
    )

  # Generate rgba() color values for `colors_html`
  colors_html[!colors_alpha_1] <-
    col_matrix_to_rgba(color_matrix[!colors_alpha_1, , drop = FALSE])

  colors_html
}

css_exclusive_colors <- function() {

  color_tbl_subset <- css_colors[!css_colors$is_x11_color, ]

  color_values <- color_tbl_subset[["hexadecimal"]]

  stats::setNames(
    color_values,
    tolower(color_tbl_subset[["color_name"]])
  )
}

valid_color_names <- function() {
  c(tolower(grDevices::colors()), names(css_exclusive_colors()), "transparent")
}

check_named_colors <- function(named_colors, call = rlang::caller_env()) {

  named_colors <- tolower(named_colors)

  if (!all(named_colors %in% valid_color_names())) {

    invalid_colors <- base::setdiff(unique(named_colors), valid_color_names())

    one_several_invalid <-
      ifelse(
        length(invalid_colors) > 1L,
        "Several invalid color names were ",
        "An invalid color name was "
      )

    cli::cli_abort(c(
      "{one_several_invalid} used ({.str {invalid_colors}}).",
      "*" = "Only R/X11 color names and CSS 3.0 color names can be used."
     ),
     call = call
     )
  }
}
