# Format values as a percentage

With numeric values in a **gt** table, we can perform percentage-based
formatting. It is assumed the input numeric values are proportional
values and, in this case, the values will be automatically multiplied by
`100` before decorating with a percent sign (the other case is
accommodated through setting `scale_values = FALSE`). For more control
over percentage formatting, we can use the following options:

- percent sign placement: the percent sign can be placed after or before
  the values and a space can be inserted between the symbol and the
  value.

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- value scaling toggle: choose to disable automatic value scaling in the
  situation that values are already scaled coming in (and just require
  the percent symbol)

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
fmt_percent(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_values = TRUE,
  use_seps = TRUE,
  min_sep_threshold = 1,
  accounting = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  placement = "right",
  incl_space = FALSE,
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

  *Multiply input values by 100*

  `scalar<logical>` // *default:* `TRUE`

  Should the values be scaled through multiplication by 100? By default
  this scaling is performed since the expectation is that incoming
  values are usually proportional. Setting to `FALSE` signifies that the
  values are already scaled and require only the percent sign when
  formatted.

- use_seps:

  *Use digit group separators*

  `scalar<logical>` // *default:* `TRUE`

  An option to use digit group separators. The type of digit group
  separator is set by `sep_mark` and overridden if a locale ID is
  provided to `locale`. This setting is `TRUE` by default.

- min_sep_threshold:

  *Minimum digit threshold for grouping separators*

  `scalar<numeric|integer>(val>=1)` // *default:* `1`

  The minimum number of digits required in the integer part of a number
  for grouping separators to be applied. This parameter determines when
  digit grouping begins based on the magnitude of values. The value `1`
  (the default) applies separators starting at 4-digit numbers (e.g.,
  `1,000` and above). A value of `2` starts grouping at 5-digit numbers
  (`10,000` and above), while `3` begins at 6-digit numbers (`100,000`
  and above).

- accounting:

  *Use accounting style*

  `scalar<logical>` // *default:* `FALSE`

  An option to use accounting style for values. Normally, negative
  values will be shown with a minus sign but using accounting style will
  instead put any negative values in parentheses.

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

- placement:

  *Percent sign placement*

  `singl-kw:[right|left]` // *default:* `"right"`

  This option governs the placement of the percent sign. This can be
  either be `"right"` (the default) or `"left"`.

- incl_space:

  *Include a space between the value and the % sign*

  `scalar<logical>` // *default:* `FALSE`

  An option for whether to include a space between the value and the
  percent sign. The default is to not introduce a space character.

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

`fmt_percent()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_percent()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `decimals`

- `drop_trailing_zeros`

- `drop_trailing_dec_mark`

- `scale_values`

- `use_seps`

- `accounting`

- `pattern`

- `sep_mark`

- `dec_mark`

- `force_sign`

- `incl_space`

- `placement`

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
which locales are supported, we can
call[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
to view an info table.

## Examples

Use a summarized version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset
to create a **gt** table. With `fmt_percent()`, we can format the
`frac_of_quota` column to display values as percentages (to one decimal
place).

    pizzaplace |>
      dplyr::mutate(month = as.numeric(substr(date, 6, 7))) |>
      dplyr::count(month, name = "pizzas_sold") |>
      dplyr::mutate(frac_of_quota = pizzas_sold / 4000) |>
      gt(rowname_col = "month") |>
      fmt_percent(
        columns = frac_of_quota,
        decimals = 1
      )

![This image of a table was generated from the first code example in the
\`fmt_percent()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_percent_1.png)

## Function ID

3-6

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_percent()`](https://gt.rstudio.com/reference/vec_fmt_percent.md).

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
[`fmt_partsper()`](https://gt.rstudio.com/reference/fmt_partsper.md),
[`fmt_passthrough()`](https://gt.rstudio.com/reference/fmt_passthrough.md),
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
