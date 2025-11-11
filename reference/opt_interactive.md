# Option to put interactive elements in an HTML table

By default, a **gt** table rendered as HTML will essentially be a
'static' table. However, we can make it 'interactive' and configure
those interactive HTML options through the `opt_interactive()` function.
Making an HTML table interactive entails the enabling of controls for
pagination, global search, filtering, sorting, and more.

This function serves as a shortcut for setting the following options in
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md):

- `ihtml.active`

- `ihtml.use_pagination`

- `ihtml.use_pagination_info`

- `ihtml.use_sorting`

- `ihtml.use_search`

- `ihtml.use_filters`

- `ihtml.use_resizers`

- `ihtml.use_highlight`

- `ihtml.use_compact_mode`

- `ihtml.use_page_size_select`

- `ihtml.page_size_default`

- `ihtml.page_size_values`

- `ihtml.pagination_type`

- `ihtml.height`

- `ihtml.selection_mode`

## Usage

``` r
opt_interactive(
  data,
  active = TRUE,
  use_pagination = TRUE,
  use_pagination_info = TRUE,
  use_sorting = TRUE,
  use_search = FALSE,
  use_filters = FALSE,
  use_resizers = FALSE,
  use_highlight = FALSE,
  use_compact_mode = FALSE,
  use_text_wrapping = TRUE,
  use_page_size_select = FALSE,
  page_size_default = 10,
  page_size_values = c(10, 25, 50, 100),
  pagination_type = c("numbers", "jump", "simple"),
  height = "auto",
  selection_mode = NULL
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- active:

  *Display interactive HTML table*

  `scalar<logical>` // *default:* `TRUE`

  The `active` option will either enable or disable interactive features
  for an HTML table. The individual features of an interactive HTML
  table are controlled by the other options.

- use_pagination:

  *Display pagination controls*

  `scalar<logical>` // *default:* `TRUE`

  This is the option for using pagination controls (below the table
  body). By default, this is `TRUE` and it will allow the use to page
  through table content.

- use_pagination_info:

  *Display pagination info*

  `scalar<logical>` // *default:* `TRUE`

  If `use_pagination` is `TRUE` then the `use_pagination_info` option
  can be used to display informational text regarding the current page
  view (this is set to `TRUE` by default).

- use_sorting:

  *Provide column sorting controls*

  `scalar<logical>` // *default:* `TRUE`

  This option provides controls for sorting column values. By default,
  this is `TRUE`.

- use_search:

  *Provide a global search field*

  `scalar<logical>` // *default:* `FALSE`

  The `use_search` option places a search field for globally filtering
  rows to the requested content. By default, this is `FALSE`.

- use_filters:

  *Display filtering fields*

  `scalar<logical>` // *default:* `FALSE`

  The `use_filters` option places search fields below each column header
  and allows for filtering by column. By default, this is `FALSE`.

- use_resizers:

  *Allow column resizing*

  `scalar<logical>` // *default:* `FALSE`

  This option allows for the interactive resizing of columns. By
  default, this is `FALSE`.

- use_highlight:

  *Enable row highlighting on hover*

  `scalar<logical>` // *default:* `FALSE`

  The `use_highlight` option highlights individual rows upon hover. By
  default, this is `FALSE`.

- use_compact_mode:

  *Use compact mode*

  `scalar<logical>` // *default:* `FALSE`

  To reduce vertical padding and thus make the table consume less
  vertical space the `use_compact_mode` option can be used. By default,
  this is `FALSE`.

- use_text_wrapping:

  *Use text wrapping*

  `scalar<logical>` // *default:* `TRUE`

  The `use_text_wrapping` option controls whether text wrapping occurs
  throughout the table. This is `TRUE` by default and with that text
  will be wrapped to multiple lines. If `FALSE`, text will be truncated
  to a single line.

- use_page_size_select:

  *Allow for page size selection*

  `scalar<logical>` // *default:* `FALSE`

  The `use_page_size_select` option lets us display a dropdown menu for
  the number of rows to show per page of data.

- page_size_default:

  *Change the default page size*

  `scalar<numeric|integer>` // *default:* `10`

  The default page size (initially set as `10`) can be modified with
  `page_size_default` and this works whether or not
  `use_page_size_select` is set to `TRUE`.

- page_size_values:

  *Set of page-size values*

  `vector<numeric|integer>` // *default:* `c(10, 25, 50, 100)`

  By default, this is the vector `c(10, 25, 50, 100)` which corresponds
  to options for `10`, `25`, `50`, and `100` rows of data per page. To
  modify these page-size options, provide a numeric vector to
  `page_size_values`.

- pagination_type:

  *Change pagination mode*

  `scalar<character>` // *default:* `"numbers"`

  When using pagination the `pagination_type` option lets us select
  between one of three options for the layout of pagination controls.
  The default is `"numbers"`, where a series of page-number buttons is
  presented along with 'previous' and 'next' buttons. The `"jump"`
  option provides an input field with a stepper for the page number.
  With `"simple"`, only the 'previous' and 'next' buttons are displayed.

- height:

  *Height of interactive HTML table*

  Height of the table in pixels. Defaults to `"auto"` for automatic
  sizing.

- selection_mode:

  *Allow row selection*

  `scalar<character>` // *default:* `NULL`

  The `selection_mode` options allows users to select rows by clicking
  them. When this option is `"single"`, clicking another value toggles
  selection of the previously selected row off. When this option is
  `"multiple"`, multiple rows can be selected at once. Selected values
  are available in Shiny apps when `selection_mode` is not `NULL` and
  the table is used in
  [`render_gt()`](https://gt.rstudio.com/reference/render_gt.md).

## Value

An object of class `gt_tbl`.

## Examples

Use select columns from the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset to create a
**gt** table with a header (through
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md)) and a
source note (through
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md)).
Next, we will add interactive HTML features (and otherwise activate
interactive HTML mode) through `opt_interactive()`. It'll just be the
default set of interactive options.

    towny |>
      dplyr::select(name, census_div, starts_with("population")) |>
      gt() |>
      fmt_integer() |>
      cols_label_with(fn = function(x) sub("population_", "", x)) |>
      cols_width(
        name ~ px(200),
        census_div ~ px(200)
      ) |>
      tab_header(
        title = "Populations of Municipalities",
        subtitle = "Census values from 1996 to 2021."
      ) |>
      tab_source_note(source_note = md("Data taken from the `towny` dataset.")) |>
      opt_interactive()

![This image of a table was generated from the first code example in the
\`opt_interactive()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_interactive_1.png)

Interactive tables can have styled body cells. Here, we use the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
an interactive **gt** table. Using
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) and
[`data_color()`](https://gt.rstudio.com/reference/data_color.md) we can
flexibly style body cells throughout the table.

    gtcars |>
      gt() |>
      cols_width(everything() ~ px(130)) |>
      tab_style(
        style = cell_fill(color = "gray95"),
        locations = cells_body(columns = c(mfr, model))
      ) |>
      data_color(
        columns = c(starts_with("hp"), starts_with("trq")),
        method = "numeric",
        palette = "viridis"
      ) |>
      cols_hide(columns = trim) |>
      opt_interactive()

![This image of a table was generated from the second code example in
the \`opt_interactive()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_opt_interactive_2.png)

## Function ID

10-2

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

Other table option functions:
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md),
[`opt_all_caps()`](https://gt.rstudio.com/reference/opt_all_caps.md),
[`opt_css()`](https://gt.rstudio.com/reference/opt_css.md),
[`opt_footnote_marks()`](https://gt.rstudio.com/reference/opt_footnote_marks.md),
[`opt_footnote_order()`](https://gt.rstudio.com/reference/opt_footnote_order.md),
[`opt_footnote_spec()`](https://gt.rstudio.com/reference/opt_footnote_spec.md),
[`opt_horizontal_padding()`](https://gt.rstudio.com/reference/opt_horizontal_padding.md),
[`opt_row_striping()`](https://gt.rstudio.com/reference/opt_row_striping.md),
[`opt_stylize()`](https://gt.rstudio.com/reference/opt_stylize.md),
[`opt_table_font()`](https://gt.rstudio.com/reference/opt_table_font.md),
[`opt_table_lines()`](https://gt.rstudio.com/reference/opt_table_lines.md),
[`opt_table_outline()`](https://gt.rstudio.com/reference/opt_table_outline.md),
[`opt_vertical_padding()`](https://gt.rstudio.com/reference/opt_vertical_padding.md)
