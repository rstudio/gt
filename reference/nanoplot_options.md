# Supply nanoplot options to `cols_nanoplot()`

When using
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
the defaults for the generated nanoplots can be modified with
`nanoplot_options()` within the `options` argument.

## Usage

``` r
nanoplot_options(
  data_point_radius = NULL,
  data_point_stroke_color = NULL,
  data_point_stroke_width = NULL,
  data_point_fill_color = NULL,
  data_line_type = NULL,
  data_line_stroke_color = NULL,
  data_line_stroke_width = NULL,
  data_area_fill_color = NULL,
  data_bar_stroke_color = NULL,
  data_bar_stroke_width = NULL,
  data_bar_fill_color = NULL,
  data_bar_negative_stroke_color = NULL,
  data_bar_negative_stroke_width = NULL,
  data_bar_negative_fill_color = NULL,
  reference_line_color = NULL,
  reference_area_fill_color = NULL,
  vertical_guide_stroke_color = NULL,
  vertical_guide_stroke_width = NULL,
  show_data_points = NULL,
  show_data_line = NULL,
  show_data_area = NULL,
  show_reference_line = NULL,
  show_reference_area = NULL,
  show_vertical_guides = NULL,
  show_y_axis_guide = NULL,
  interactive_data_values = NULL,
  y_val_fmt_fn = NULL,
  y_axis_fmt_fn = NULL,
  y_ref_line_fmt_fn = NULL,
  currency = NULL
)
```

## Arguments

- data_point_radius:

  *Radius of data points*

  `scalar<numeric>|vector<numeric>` // *default:* `NULL` (`optional`)

  The `data_point_radius` option lets you set the radius for each of the
  data points. By default this is set to `10`. Individual radius values
  can be set by using a vector of numeric values; however, the vector
  provided must match the number of data points.

- data_point_stroke_color:

  *Color of data points*

  `scalar<character>|vector<character>` // *default:* `NULL`
  (`optional`)

  The default stroke color of the data points is `"#FFFFFF"`
  (`"white"`). This works well when there is a visible data line
  combined with data points with a darker fill color. The stroke color
  can be modified with `data_point_stroke_color` for all data points by
  supplying a single color value. With a vector of colors, each data
  point's stroke color can be changed (ensure that the vector length
  matches the number of data points).

- data_point_stroke_width:

  *Width of surrounding line on data points*

  `scalar<numeric>|vector<numeric>` // *default:* `NULL` (`optional`)

  The width of the outside stroke for the data points can be modified
  with the `data_point_stroke_width` option. By default, a value of `4`
  (as in '4px') is used.

- data_point_fill_color:

  *Fill color for data points*

  `scalar<character>|vector<character>` // *default:* `NULL`
  (`optional`)

  By default, all data points have a fill color of `"#FF0000"`
  (`"red"`). This can be changed for all data points by providing a
  different color to `data_point_fill_color`. And, a vector of different
  colors can be supplied so long as the length is equal to the number of
  data points; the fill color values will be applied in order of left to
  right.

- data_line_type:

  *Type of data line: curved or straight*

  `scalar<character>` // *default:* `NULL` (`optional`)

  This can accept either `"curved"` or `"straight"`. Curved lines are
  recommended when the nanoplot has less than 30 points and data points
  are evenly spaced. In most other cases, straight lines might present
  better.

- data_line_stroke_color:

  *Color of the data line*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The color of the data line can be modified from its default
  `"#4682B4"` (`"steelblue"`) color by supplying a color to the
  `data_line_stroke_color` option.

- data_line_stroke_width:

  *Width of the data line*

  `scalar<numeric>` // *default:* `NULL` (`optional`)

  The width of the connecting data line can be modified with the
  `data_line_stroke_width` option. By default, a value of `4` (as in
  '4px') is used.

- data_area_fill_color:

  *Fill color for the data-point-bounded area*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The fill color for the area that bounds the data points in line plot.
  The default is `"#FF0000"` (`"red"`) but can be changed by providing a
  color value to `data_area_fill_color`.

- data_bar_stroke_color:

  *Color of a data bar's outside line*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The color of the stroke used for the data bars can be modified from
  its default `"#3290CC"` color by supplying a color to the
  `data_bar_stroke_color` option.

- data_bar_stroke_width:

  *Width of a data bar's outside line*

  `scalar<numeric>` // *default:* `NULL` (`optional`)

  The width of the stroke used for the data bars can be modified with
  the `data_bar_stroke_width` option. By default, a value of `4` (as in
  '4px') is used.

- data_bar_fill_color:

  *Fill color for data bars*

  `scalar<character>|vector<character>` // *default:* `NULL`
  (`optional`)

  By default, all data bars have a fill color of `"#3FB5FF"`. This can
  be changed for all data bars by providing a different color to
  `data_bar_fill_color`. And, a vector of different colors can be
  supplied so long as the length is equal to the number of data bars;
  the fill color values will be applied in order of left to right.

- data_bar_negative_stroke_color:

  *Stroke color for negative values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The color of the stroke used for the data bars that have negative
  values. The default color is `"#CC3243"` but this can be changed by
  supplying a color value to the `data_bar_negative_stroke_color`
  option.

- data_bar_negative_stroke_width:

  *Stroke width for negative values*

  `scalar<numeric>` // *default:* `NULL` (`optional`)

  The width of the stroke used for negative value data bars. This has
  the same default as `data_bar_stroke_width` with a value of `4` (as in
  '4px'). This can be changed by giving a numeric value to the
  `data_bar_negative_stroke_width` option.

- data_bar_negative_fill_color:

  *Fill color for negative values*

  `scalar<character>|vector<character>` // *default:* `NULL`
  (`optional`)

  By default, all negative data bars have a fill color of `"#D75A68"`.
  This can however be changed by providing a color value to the
  `data_bar_negative_fill_color` option.

- reference_line_color:

  *Color for the reference line*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The reference line will have a color of `"#75A8B0"` if it is set to
  appear. This color can be changed by providing a single color value to
  `reference_line_color`.

- reference_area_fill_color:

  *Fill color for the reference area*

  `scalar<character>` // *default:* `NULL` (`optional`)

  If a reference area has been defined and is visible it has by default
  a fill color of `"#A6E6F2"`. This can be modified by declaring a color
  value in the `reference_area_fill_color` option.

- vertical_guide_stroke_color:

  *Color of vertical guides*

  `scalar<character>` // *default:* `NULL` (`optional`)

  Vertical guides appear when hovering in the vicinity of data points.
  Their default color is `"#911EB4"` (a strong magenta color) and a fill
  opacity value of `0.4` is automatically applied to this. However, the
  base color can be changed with the `vertical_guide_stroke_color`
  option.

- vertical_guide_stroke_width:

  *Line widths for vertical guides*

  `scalar<numeric>` // *default:* `NULL` (`optional`)

  The vertical guide's stroke width, by default, is relatively large at
  `12` (this is '12px'). This is modifiable by setting a different value
  with the `vertical_guide_stroke_width` option.

- show_data_points:

  *Should the data points be shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  By default, all data points in a nanoplot are shown but this layer can
  be hidden by setting `show_data_points` to `FALSE`.

- show_data_line:

  *Should a data line be shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  The data line connects data points together and it is shown by
  default. This data line layer can be hidden by setting
  `show_data_line` to `FALSE`.

- show_data_area:

  *Should a data-point-bounded area be shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  The data area layer is adjacent to the data points and the data line.
  It is shown by default but can be hidden with
  `show_data_area = FALSE`.

- show_reference_line:

  *Should a reference line be shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  The layer with a horizontal reference line appears underneath that of
  the data points and the data line. Like vertical guides, hovering over
  a reference will show its value. The reference line (if available) is
  shown by default but can be hidden by setting `show_reference_line` to
  `FALSE`.

- show_reference_area:

  *Should a reference area be shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  The reference area appears at the very bottom of the layer stack, if
  it is available (i.e., defined in
  [`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md)).
  It will be shown in the default case but can be hidden by using
  `show_reference_area = FALSE`.

- show_vertical_guides:

  *Should there be vertical guides?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  Vertical guides appear when hovering over data points. This hidden
  layer is active by default but can be deactivated by using
  `show_vertical_guides = FALSE`.

- show_y_axis_guide:

  *Should there be a y-axis guide?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  The *y*-axis guide will appear when hovering over the far left side of
  a nanoplot. This hidden layer is active by default but can be
  deactivated by using `show_y_axis_guide = FALSE`.

- interactive_data_values:

  *Should data values be interactively shown?*

  `scalar<logical>` // *default:* `NULL` (`optional`)

  By default, numeric data values will be shown only when the user
  interacts with certain regions of a nanoplot. This is because the
  values may be numerous (i.e., clutter the display when all are
  visible) and it can be argued that the values themselves are secondary
  to the presentation. However, for some types of plots (like horizontal
  bar plots), a persistent display of values alongside the plot marks
  may be desirable. By setting `interactive_data_values = FALSE` we can
  opt for always displaying the data values alongside the plot
  components.

- y_val_fmt_fn, y_axis_fmt_fn, y_ref_line_fmt_fn:

  *Custom formatting for y values*

  `function` // *default:* `NULL` (`optional`)

  If providing a function to `y_val_fmt_fn`, `y_axis_fmt_fn`, or
  `y_ref_line_fmt_fn` then customized formatting of the *y* values
  associated with the data points/bars, the *y*-axis labels, and the
  reference line can be performed.

- currency:

  *Define values as currencies of a specific type*

  `scalar<character>|obj:<gt_currency>` // *default:* `NULL`
  (`optional`)

  If the values are to be displayed as currency values, supply
  either: (1) a 3-letter currency code (e.g., `"USD"` for U.S. Dollars,
  `"EUR"` for the Euro currency), (2) a common currency name (e.g.,
  `"dollar"`, `"pound"`, `"yen"`, etc.), or (3) an invocation of the
  [`currency()`](https://gt.rstudio.com/reference/currency.md) helper
  function for specifying a custom currency (where the string could vary
  across output contexts). Use
  [`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
  to get an information table with all of the valid currency codes, and
  examples of each, for the first two cases.

## Value

A list object of class `nanoplot_options`.

## Function ID

8-8

## Function Introduced

`v0.10.0` (October 7, 2023)

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
[`pct()`](https://gt.rstudio.com/reference/pct.md),
[`px()`](https://gt.rstudio.com/reference/px.md),
[`random_id()`](https://gt.rstudio.com/reference/random_id.md),
[`row_group()`](https://gt.rstudio.com/reference/row_group.md),
[`stub()`](https://gt.rstudio.com/reference/stub.md),
[`system_fonts()`](https://gt.rstudio.com/reference/system_fonts.md),
[`unit_conversion()`](https://gt.rstudio.com/reference/unit_conversion.md)
