# Format image paths to generate images in cells

To more easily insert graphics into body cells, we can use
`fmt_image()`. This allows for one or more images to be placed in the
targeted cells. The cells need to contain some reference to an image
file, either: (1) complete http/https or local paths to the files; (2)
the file names, where a common path can be provided via `path`; or (3) a
fragment of the file name, where the `file_pattern` helps to compose the
entire file name and `path` provides the path information. This should
be expressly used on columns that contain *only* references to image
files (i.e., no image references as part of a larger block of text).
Multiple images can be included per cell by separating image references
by commas. The `sep` argument allows for a common separator to be
applied between images.

## Usage

``` r
fmt_image(
  data,
  columns = everything(),
  rows = everything(),
  height = NULL,
  width = NULL,
  sep = " ",
  path = NULL,
  file_pattern = "{x}",
  encode = TRUE
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

- height, width:

  *Height and width of images*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The absolute height of the image in the table cell. If you set the
  `width` and `height` remains `NULL` (or vice versa), the
  width-to-height ratio will be preserved when **gt** calculates the
  length of the missing dimension. If `width` and `height` are both
  `NULL`, `height` is set as `"2em"` and `width` will be calculated.

- sep:

  *Separator between images*

  `scalar<character>` // *default:* `" "`

  In the output of images within a body cell, `sep` provides the
  separator between each image.

- path:

  *Path to image files*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An optional path to local image files (this is combined with all
  filenames).

- file_pattern:

  *File pattern specification*

  `scalar<character>` // *default:* `"{x}"`

  The pattern to use for mapping input values in the body cells to the
  names of the graphics files. The string supplied should use `"{x}"` in
  the pattern to map filename fragments to input strings.

- encode:

  *Use Base64 encoding*

  `scalar<logical>` // *default:* `TRUE`

  The option to always use Base64 encoding for image paths that are
  determined to be local. By default, this is `TRUE`.

## Value

An object of class `gt_tbl`.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_image()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `height`

- `width`

- `sep`

- `path`

- `file_pattern`

- `encode`

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

## Examples

Using a small portion of
[`metro`](https://gt.rstudio.com/reference/metro.md) dataset, let's
create a **gt** table. We will only include a few columns and rows from
that table. The `lines` and `connect_rer` columns have comma-separated
listings of numbers/letters (corresponding to lines served at each
station). We have a directory of SVG graphics for all of these lines
within the package (the path for the directory containing the images can
be accessed via `system.file("metro_svg", package = "gt")`), and the
filenames roughly correspond to the data in those two columns.
`fmt_image()` can be used with these inputs since the `path` and
`file_pattern` arguments allow us to compose complete and valid file
locations. What you get from all of this are sequences of images in the
table cells, taken from the referenced graphics files on disk.

    metro |>
      dplyr::select(name, caption, lines, connect_rer) |>
      dplyr::slice_head(n = 10) |>
      gt() |>
      cols_merge(
        columns = c(name, caption),
        pattern = "{1}<< ({2})>>"
      ) |>
      text_replace(
        locations = cells_body(columns = name),
        pattern = "\\((.*?)\\)",
        replacement = "<br>(<em>\\1</em>)"
      ) |>
      sub_missing(columns = connect_rer, missing_text = "") |>
      fmt_image(
        columns = lines,
        path = system.file("metro_svg", package = "gt"),
        file_pattern = "metro_{x}.svg"
      ) |>
      fmt_image(
        columns = connect_rer,
        path = system.file("metro_svg", package = "gt"),
        file_pattern = "rer_{x}.svg"
      ) |>
      cols_label(
        name = "Station",
        lines = "Lines",
        connect_rer = "RER"
      ) |>
      cols_align(align = "left") |>
      tab_style(
        style = cell_borders(
          sides = c("left", "right"),
          weight = px(1),
          color = "gray85"
        ),
        locations = cells_body(columns = lines)
      ) |>
      opt_stylize(style = 6, color = "blue") |>
      opt_all_caps() |>
      opt_horizontal_padding(scale = 1.75)

![This image of a table was generated from the first code example in the
\`fmt_image()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_image_1.png)

## Function ID

3-24

## Function Introduced

`v0.9.0` (Mar 31, 2023)

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
[`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md),
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
