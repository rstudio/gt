# Format values as parts-per quantities

With numeric values in a **gt** table we can format the values so that
they are rendered as *per mille*, *ppm*, *ppb*, etc., quantities. The
following list of keywords (with associated naming and scaling factors)
is available to use within `fmt_partsper()`:

- `"per-mille"`: Per mille, (1 part in `1,000`)

- `"per-myriad"`: Per myriad, (1 part in `10,000`)

- `"pcm"`: Per cent mille (1 part in `100,000`)

- `"ppm"`: Parts per million, (1 part in `1,000,000`)

- `"ppb"`: Parts per billion, (1 part in `1,000,000,000`)

- `"ppt"`: Parts per trillion, (1 part in `1,000,000,000,000`)

- `"ppq"`: Parts per quadrillion, (1 part in `1,000,000,000,000,000`)

The function provides a lot of formatting control and we can use the
following options:

- custom symbol/units: we can override the automatic symbol or units
  display with our own choice as the situation warrants

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- value scaling toggle: choose to disable automatic value scaling in the
  situation that values are already scaled coming in (and just require
  the appropriate symbol or unit display)

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
fmt_partsper(
  data,
  columns = everything(),
  rows = everything(),
  to_units = c("per-mille", "per-myriad", "pcm", "ppm", "ppb", "ppt", "ppq"),
  symbol = "auto",
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_values = TRUE,
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  incl_space = "auto",
  system = c("intl", "ind"),
  locale = NULL
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

- to_units:

  *Output Quantity*

  `singl-kw:[per-mille|per-myriad|pcm|ppm|ppb|ppt|ppq]` // *default:*
  `"per-mille"`

  A keyword that signifies the desired output quantity. This can be any
  from the following set: `"per-mille"`, `"per-myriad"`, `"pcm"`,
  `"ppm"`, `"ppb"`, `"ppt"`, or `"ppq"`.

- symbol:

  *Symbol or units to use in output display*

  `scalar<character>` // *default:* `"auto"`

  The symbol/units to use for the quantity. By default, this is set to
  `"auto"` and **gt** will choose the appropriate symbol based on the
  `to_units` keyword and the output context. However, this can be
  changed by supplying a string (e.g, using `symbol = "ppbV"` when
  `to_units = "ppb"`).

- decimals:

  *Number of decimal places*

  `scalar<numeric|integer>(val>=0)` // *default:* `2`

  This corresponds to the exact number of decimal places to use. A value
  such as `2.34` can, for example, be formatted with `0` decimal places
  and it would result in `"2"`. With `4` decimal places, the formatted
  value becomes `"2.3400"`.

- drop_trailing_zeros:

  *Drop any trailing zeros*

  `scalar<logical>` // *default:* `FALSE`

  A logical value that allows for removal of trailing zeros (those
  redundant zeros after the decimal mark).

- drop_trailing_dec_mark:

  *Drop the trailing decimal mark*

  `scalar<logical>` // *default:* `TRUE`

  A logical value that determines whether decimal marks should always
  appear even if there are no decimal digits to display after formatting
  (e.g., `23` becomes `23.` if `FALSE`). By default trailing decimal
  marks are not shown.

- scale_values:

  *Scale input values accordingly*

  `scalar<logical>` // *default:* `TRUE`

  Should the values be scaled through multiplication according to the
  keyword set in `to_units`? By default this is `TRUE` since the
  expectation is that normally values are proportions. Setting to
  `FALSE` signifies that the values are already scaled and require only
  the appropriate symbol/units when formatted.

- use_seps:

  *Use digit group separators*

  `scalar<logical>` // *default:* `TRUE`

  An option to use digit group separators. The type of digit group
  separator is set by `sep_mark` and overridden if a locale ID is
  provided to `locale`. This setting is `TRUE` by default.

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

- sep_mark:

  *Separator mark for digit grouping*

  `scalar<character>` // *default:* `","`

  The string to use as a separator between groups of digits. For
  example, using `sep_mark = ","` with a value of `1000` would result in
  a formatted value of `"1,000"`. This argument is ignored if a `locale`
  is supplied (i.e., is not `NULL`).

- dec_mark:

  *Decimal mark*

  `scalar<character>` // *default:* `"."`

  The string to be used as the decimal mark. For example, using
  `dec_mark = ","` with the value `0.152` would result in a formatted
  value of `"0,152"`). This argument is ignored if a `locale` is
  supplied (i.e., is not `NULL`).

- force_sign:

  *Forcing the display of a positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Should the positive sign be shown for positive values (effectively
  showing a sign for all values except zero)? If so, use `TRUE` for this
  option. The default is `FALSE`, where only negative numbers will
  display a minus sign. This option is disregarded when using accounting
  notation with `accounting = TRUE`.

- incl_space:

  *Include a space between the value and the symbol/units*

  `scalar<character>|scalar<logical>` // *default:* `"auto"`

  An option for whether to include a space between the value and the
  symbol/units. The default is `"auto"` which provides spacing dependent
  on the mark itself. This can be directly controlled by using either
  `TRUE` or `FALSE`.

- system:

  *Numbering system for grouping separators*

  `singl-kw:[intl|ind]` // *default:* `"intl"`

  The international numbering system (keyword: `"intl"`) is widely used
  and its grouping separators (i.e., `sep_mark`) are always separated by
  three digits. The alternative system, the Indian numbering system
  (keyword: `"ind"`), uses grouping separators that correspond to
  thousand, lakh, crore, and higher quantities.

- locale:

  *Locale identifier*

  `scalar<character>` // *default:* `NULL` (`optional`)

  An optional locale identifier that can be used for formatting values
  according to the locale's rules. Examples include `"en"` for English
  (United States) and `"fr"` for French (France). We can call
  [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
  for a useful reference for all of the locales that are supported. A
  locale ID can be also set in the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) function call (where
  it would be used automatically by any function with a `locale`
  argument) but a `locale` value provided here will override that global
  locale.

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_partsper()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_partsper()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `to_units`

- `symbol`

- `decimals`

- `drop_trailing_zeros`

- `drop_trailing_dec_mark`

- `scale_values`

- `use_seps`

- `pattern`

- `sep_mark`

- `dec_mark`

- `force_sign`

- `incl_space`

- `system`

- `locale`

Please note that for all of the aforementioned arguments, a
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

## Adapting output to a specific `locale`

This formatting function can adapt outputs according to a provided
`locale` value. Examples include `"en"` for English (United States) and
`"fr"` for French (France). The use of a valid locale ID here means
separator and decimal marks will be correct for the given locale. Should
any values be provided in `sep_mark` or `dec_mark`, they will be
overridden by the locale's preferred values.

Note that a `locale` value provided here will override any global locale
setting performed in [`gt()`](https://gt.rstudio.com/reference/gt.md)'s
own `locale` argument (it is settable there as a value received by all
other functions that have a `locale` argument). As a useful reference on
which locales are supported, we can call
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Create a tibble of small numeric values and generate a **gt** table.
Format the `a` column to appear in scientific notation with
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md)
and format the `b` column as *per mille* values with `fmt_partsper()`.

    dplyr::tibble(x = 0:-5, a = 10^(0:-5), b = a) |>
      gt(rowname_col = "x") |>
      fmt_scientific(a, decimals = 0) |>
      fmt_partsper(
        columns = b,
        to_units = "per-mille"
      )

![This image of a table was generated from the first code example in the
\`fmt_partsper()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_partsper_1.png)

## Function ID

3-7

## Function Introduced

`v0.6.0` (May 24, 2022)

## See also

The vector-formatting version of this function:
[`vec_fmt_partsper()`](https://gt.rstudio.com/reference/vec_fmt_partsper.md).

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
[`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md),
[`fmt_index()`](https://gt.rstudio.com/reference/fmt_index.md),
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
[`fmt_markdown()`](https://gt.rstudio.com/reference/fmt_markdown.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`fmt_number_si()`](https://gt.rstudio.com/reference/fmt_number_si.md),
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
