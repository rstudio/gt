# Use icons within a table's body cells

We can draw from a library of thousands of icons and selectively insert
them into a **gt** table. The `fmt_icon()` function makes this possible
and it operates a lot like
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md) in that
input cells need to contain some reference to an icon name. We are
exclusively using *Font Awesome* icons here (and we do need to have the
**fontawesome** package installed) so the reference is the short icon
name. Multiple icons can be included per cell by separating icon names
with commas (e.g., `"hard-drive,clock"`). The `sep` argument allows for
a common separator to be applied between icons.

## Usage

``` r
fmt_icon(
  data,
  columns = everything(),
  rows = everything(),
  height = "1em",
  sep = " ",
  stroke_color = NULL,
  stroke_width = NULL,
  stroke_alpha = NULL,
  fill_color = NULL,
  fill_alpha = NULL,
  vertical_adj = NULL,
  margin_left = NULL,
  margin_right = NULL,
  a11y = c("semantic", "decorative", "none")
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to target*

  [`<column-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- rows:

  *Rows to target*

  [`<row-targeting expression>`](https://gt.rstudio.com/reference/rows-columns.md)
  // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  In conjunction with `columns`, we can specify which of their rows
  should undergo formatting. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row captions within
  [`c()`](https://rdrr.io/r/base/c.html), a vector of row indices, or a
  select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  We can also use expressions to filter down to the rows we need (e.g.,
  `[colname_1] > 100 & [colname_2] < 50`).

- height:

  *Height of icon*

  `scalar<character>` // *default:* `"1em"`

  The absolute height of the icon in the table cell. By default, this is
  set to `"1em"`.

- sep:

  *Separator between icons*

  `scalar<character>` // *default:* `" "`

  In the output of icons within a body cell, `sep` provides the
  separator between each icon. By default, this is a single space
  character (`" "`).

- stroke_color:

  *Color of the icon stroke/outline*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The icon stroke is essentially the outline of the icon. The color of
  the stroke can be modified by applying a single color here. If not
  provided then the default value of `"currentColor"` is applied so that
  the stroke color matches that of the parent HTML element's color
  attribute.

- stroke_width:

  *Width of the icon stroke/outline*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The `stroke_width` option allows for setting the color of the icon
  outline stroke. By default, the stroke width is very small at `"1px"`
  so a size adjustment here can sometimes be useful.

- stroke_alpha:

  *Transparency value for icon stroke/outline*

  `scalar<numeric>` // *default:* `NULL` (`optional`)

  The level of transparency for the icon stroke can be controlled with a
  decimal value between `0` and `1`.

- fill_color:

  *Color of the icon fill*

  `scalar<character>|vector<character>` // *default:* `NULL`
  (`optional`)

  The fill color of the icon can be set with `fill_color`; providing a
  single color here will change the color of the fill but not of the
  icon's 'stroke' or outline (use `stroke_color` to modify that). A
  named vector or named list comprising the icon names with
  corresponding fill colors can alternatively be used here (e.g.,
  `list("circle-check" = "green", "circle-xmark" = "red"`). If nothing
  is provided then the default value of `"currentColor"` is applied so
  that the fill matches the color of the parent HTML element's color
  attribute.

- fill_alpha:

  *Transparency value for icon fill*

  `scalar<numeric|integer>(0>=val>=1)` // *default:* `NULL` (`optional`)

  The level of transparency for the icon fill can be controlled with a
  decimal value between `0` and `1`.

- vertical_adj:

  *Vertical adjustment of icon from baseline*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The vertical alignment of the icon. By default, a length of
  `"-0.125em"` is used.

- margin_left:

  *Margin width left of icon*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The length value for the margin that's to the left of the icon can be
  set with `margin_left`. By default, `"auto"` is used for this but if
  space is needed on the left-hand side then a length of `"0.2em"` is
  recommended as a starting point.

- margin_right:

  *Margin width right of icon*

  `scalar<character|numeric|integer>` // *default:* `NULL` (`optional`)

  The length value for the margin that's to the right of the icon can be
  set with `margin_right`. By default, `"auto"` is used for this but if
  space is needed on the right-hand side then a length of `"0.2em"` is
  recommended as a starting point.

- a11y:

  *Accessibility mode for icon*

  `singl-kw:[semantic|decorative|none]` // *default:* `"semantic"`

  The accessibility mode for the icon display can be set with the `a11y`
  argument. Icons can either be `"semantic"` or `"decorative"`. Using
  `"none"` will result in no accessibility features for the icons.

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_icon()` is compatible with body cells that are of the `"character"`
or `"factor"` types. Any other types of body cells are ignored during
formatting. This is to say that cells of incompatible data types may be
targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_icon()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `height`

- `sep`

- `stroke_color`

- `stroke_width`

- `stroke_alpha`

- `fill_color`

- `fill_alpha`

- `vertical_adj`

- `margin_left`

- `margin_right`

- `a11y`

Please note that for each of the aforementioned arguments, a
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) call
needs to reference a column that has data of the correct type (this is
different for each argument). Additional columns for parameter values
can be generated with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (if not
already present). Columns that contain parameter data can also be hidden
from final display with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md). Finally,
there is no limitation to how many arguments the
[`from_column()`](https://gt.rstudio.com/reference/from_column.md)
helper is applied so long as the arguments belong to this closed set.

## Icons that can be used

`fmt_icon()` relies on an installation of the **fontawesome** package to
operate and every icon within that package can be accessed here with
either an icon name or a full name. For example, the *Arrow Down* icon
has an icon name of `"arrow-down"` and its corresponding full name is
`"fas fa-arrow-down"`. In most cases you'll want to use the shorter
name, but some icons have both a *Solid* (`"fas"`) and a *Regular*
(`"far"`) variant so only the full name can disambiguate the pairing. In
the latest release of **fontawesome** (`v0.5.2`), there are 2,025 icons
and you can view the entire icon listing by calling
[`info_icons()`](https://gt.rstudio.com/reference/info_icons.md). What
you'll get from that is an information table showing every icon and
associated set of identifiers.

## Examples

For this first example of generating icons with `fmt_icon()`, let's make
a simple tibble that has two columns of *Font Awesome* icon names. We
separate multiple icons per cell with commas. By default, the icons are
1 em in height; we're going to make the icons slightly larger here (so
we can see the fine details of them) by setting `height = "4em"`.

    dplyr::tibble(
      animals = c(
        "hippo", "fish,spider", "mosquito,locust,frog",
        "dog,cat", "kiwi-bird"
      ),
      foods = c(
        "bowl-rice", "egg,pizza-slice", "burger,lemon,cheese",
        "carrot,hotdog", "bacon"
      )
    ) |>
      gt() |>
      fmt_icon(height = "4em") |>
      cols_align(align = "center", columns = everything())

![This image of a table was generated from the first code example in the
\`fmt_icon()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_icon_1.png)

Let's take a few rows from the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset and make it
so the `csd_type` column contains *Font Awesome* icon names (we want
only the `"city"` and `"house-chimney"` icons here). After using
`fmt_icon()` to format the `csd_type` column, we get icons that are
representative of the two categories of municipality for this subset of
data.

    towny |>
      dplyr::select(name, csd_type, population_2021) |>
      dplyr::filter(csd_type %in% c("city", "town")) |>
      dplyr::group_by(csd_type) |>
      dplyr::slice_max(population_2021, n = 5) |>
      dplyr::ungroup() |>
      dplyr::mutate(
        csd_type = ifelse(csd_type == "town", "house-chimney", "city")
      ) |>
      gt() |>
      fmt_integer() |>
      fmt_icon(columns = csd_type) |>
      cols_move_to_start(columns = csd_type) |>
      cols_label(
        csd_type = "",
        name = "City/Town",
        population_2021 = "Population"
      )

![This image of a table was generated from the second code example in
the \`fmt_icon()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_icon_2.png)

Let's use a portion of the
[`metro`](https://gt.rstudio.com/reference/metro.md) dataset to create a
**gt** table. Depending on which train services are offered at the
subset of stations, *Font Awesome* icon names will be applied to cells
where the different services exist (the specific names are
`"train-subway"`, `"train"`, and `"train-tram"`). With
[`tidyr::unite()`](https://tidyr.tidyverse.org/reference/unite.html),
those icon names can be converged into a single column (`services`) with
the `NA` values removed. Since the names correspond to icons and they
are in the correct format (separated by commas), they can be formatted
as *Font Awesome* icons with `fmt_icon()`.

    metro |>
      dplyr::select(name, lines, connect_rer, connect_tramway, location) |>
      dplyr::slice_tail(n = 10) |>
      dplyr::mutate(lines = "train-subway") |>
      dplyr::mutate(connect_rer = ifelse(!is.na(connect_rer), "train", NA)) |>
      dplyr::mutate(
        connect_tramway = ifelse(!is.na(connect_tramway), "train-tram", NA)
      ) |>
      tidyr::unite(
        col = services,
        lines:connect_tramway,
        sep = ",",
        na.rm = TRUE
      ) |>
      gt() |>
      fmt_icon(
        columns = services,
        a11y = "decorative"
      ) |>
      cols_merge(
        columns = c(name, services),
        pattern = "{1} ({2})"
      ) |>
      cols_label(
        name = "Station",
        location = "Location"
      )

![This image of a table was generated from the third code example in the
\`fmt_icon()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_icon_3.png)

Taking a handful of starred reviews from a popular film review website,
we will attempt to format a numerical score (0 to 4) to use the `"star"`
and `"star-half"` icons. In this case, it is useful to generate the
repeating sequence of icon names (separated by commas) in the `rating`
column before introducing the table to
[`gt()`](https://gt.rstudio.com/reference/gt.md). We can make use of the
numerical rating values in `stars` within `fmt_icon()` with a little
help from
[`from_column()`](https://gt.rstudio.com/reference/from_column.md).
Using that, we can dynamically adjust the icon's `fill_alpha` (i.e.,
opacity) value and accentuate the films with higher scores.

    dplyr::tibble(
      film = c(
        "The Passengers of the Night", "Serena", "The Father",
        "Roma", "The Handmaiden", "Violet", "Vice"
      ),
      stars = c(3, 1, 3.5, 4, 4, 2.5, 1.5)
    ) |>
      dplyr::mutate(rating = dplyr::case_when(
        stars %% 1 == 0 ~ strrep("star,", stars),
        stars %% 1 != 0 ~ paste0(strrep("star,", floor(stars)), "star-half")
      )) |>
      gt() |>
      fmt_icon(
        columns = rating,
        fill_color = "red",
        fill_alpha = from_column("stars", fn = function(x) x / 4)
      ) |>
      cols_hide(columns = stars) |>
      tab_source_note(
        source_note = md(
          "Data obtained from <https://www.rogerebert.com/reviews>."
        )
      )

![This image of a table was generated from the fourth code example in
the \`fmt_icon()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_icon_4.png)

A fairly common thing to do with icons in tables is to indicate whether
a quantity is either higher or lower than another. Up and down arrow
symbols can serve as good visual indicators for this purpose. We can
make use of the `"up-arrow"` and `"down-arrow"` icons here. The
`fmt_icon()` function has to find those text values in cells to generate
the icons, so, let's generate the text within a new column with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) (an
expression is used therein to generate the correct text given the
`close` and `open` values). Following that, `fmt_icon()` is used and its
`fill_color` argument is provided with a named vector that indicates
which color should be used for each icon.

    sp500 |>
      dplyr::slice_head(n = 10) |>
      dplyr::select(date, open, close) |>
      dplyr::arrange(-dplyr::row_number()) |>
      gt(rowname_col = "date") |>
      cols_add(week = date, .after = date) |>
      cols_add(dir = ifelse(close > open, "arrow-up", "arrow-down")) |>
      cols_merge(columns = c(date, week), pattern = "{1} ({2})") |>
      fmt_date(columns = date, date_style = "m_day_year") |>
      fmt_datetime(columns = week, format = "w", pattern = "W{x}") |>
      fmt_currency() |>
      fmt_icon(
        columns = dir,
        fill_color = c("arrow-up" = "green", "arrow-down" = "red")
      ) |>
      cols_label(
        open = "Opening Value",
        close = "Closing Value",
        dir = ""
      ) |>
      opt_stylize(style = 1, color = "gray")

![This image of a table was generated from the fifth code example in the
\`fmt_icon()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_icon_5.png)

## Function ID

3-27

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md),
[`fmt_date()`](https://gt.rstudio.com/reference/fmt_date.md),
[`fmt_datetime()`](https://gt.rstudio.com/reference/fmt_datetime.md),
[`fmt_duration()`](https://gt.rstudio.com/reference/fmt_duration.md),
[`fmt_email()`](https://gt.rstudio.com/reference/fmt_email.md),
[`fmt_engineering()`](https://gt.rstudio.com/reference/fmt_engineering.md),
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md),
[`fmt_fraction()`](https://gt.rstudio.com/reference/fmt_fraction.md),
[`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md),
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md),
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
[`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md),
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md),
[`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md),
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md),
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
[`fmt_spelled_num()`](https://gt.rstudio.com/reference/fmt_spelled_num.md),
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
