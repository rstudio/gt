# Format numeric values

With numeric values in a **gt** table, we can perform number-based
formatting so that the targeted values are rendered with a higher
consideration for tabular presentation. Furthermore, there is finer
control over numeric formatting with the following options:

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- scaling: we can choose to scale targeted values by a multiplier value

- large-number suffixing: larger figures (thousands, millions, etc.) can
  be autoscaled and decorated with the appropriate suffixes

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
fmt_number(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  min_sep_threshold = 1,
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

- n_sigfig:

  *Number of significant figures*

  `scalar<numeric|integer>(val>=1)` // *default:* `NULL` (`optional`)

  A option to format numbers to *n* significant figures. By default,
  this is `NULL` and thus number values will be formatted according to
  the number of decimal places set via `decimals`. If opting to format
  according to the rules of significant figures, `n_sigfig` must be a
  number greater than or equal to `1`. Any values passed to the
  `decimals` and `drop_trailing_zeros` arguments will be ignored.

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

- use_seps:

  *Use digit group separators*

  `scalar<logical>` // *default:* `TRUE`

  An option to use digit group separators. The type of digit group
  separator is set by `sep_mark` and overridden if a locale ID is
  provided to `locale`. This setting is `TRUE` by default.

- accounting:

  *Use accounting style*

  `scalar<logical>` // *default:* `FALSE`

  An option to use accounting style for values. Normally, negative
  values will be shown with a minus sign but using accounting style will
  instead put any negative values in parentheses.

- scale_by:

  *Scale values by a fixed multiplier*

  `scalar<numeric|integer>` // *default:* `1`

  All numeric values will be multiplied by the `scale_by` value before
  undergoing formatting. Since the `default` value is `1`, no values
  will be changed unless a different multiplier value is supplied. This
  value will be ignored if using any of the `suffixing` options (i.e.,
  where `suffixing` is not set to `FALSE`).

- suffixing:

  *Specification for large-number suffixing*

  `scalar<logical>|vector<character>` // *default:* `FALSE`

  The `suffixing` option allows us to scale and apply suffixes to larger
  numbers (e.g., `1924000` can be transformed to `1.92M`). This option
  can accept a logical value, where `FALSE` (the default) will not
  perform this transformation and `TRUE` will apply thousands (`"K"`),
  millions (`"M"`), billions (`"B"`), and trillions (`"T"`) suffixes
  after automatic value scaling.

  We can alternatively provide a character vector that serves as a
  specification for which symbols are to be used for each of the value
  ranges. These preferred symbols will replace the defaults (e.g.,
  `c("k", "Ml", "Bn", "Tr")` replaces `"K"`, `"M"`, `"B"`, and `"T"`).

  Including `NA` values in the vector will ensure that the particular
  range will either not be included in the transformation (e.g.,
  `c(NA, "M", "B", "T")` won't modify numbers at all in the thousands
  range) or the range will inherit a previous suffix (e.g., with
  `c("K", "M", NA, "T")`, all numbers in the range of millions and
  billions will be in terms of millions).

  Any use of `suffixing` (where it is not set expressly as `FALSE`)
  means that any value provided to `scale_by` will be ignored.

  If using `system = "ind"` then the default suffix set provided by
  `suffixing = TRUE` will be the equivalent of `c(NA, "L", "Cr")`. This
  doesn't apply suffixes to the thousands range, but does express values
  in *lakhs* and *crores*.

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

`fmt_number()` is compatible with body cells that are of the `"numeric"`
or `"integer"` types. Any other types of body cells are ignored during
formatting. This is to say that cells of incompatible data types may be
targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_number()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `decimals`

- `n_sigfig`

- `drop_trailing_zeros`

- `drop_trailing_dec_mark`

- `use_seps`

- `accounting`

- `scale_by`

- `suffixing`

- `pattern`

- `sep_mark`

- `dec_mark`

- `force_sign`

- `min_sep_threshold`

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

Let's use the [`exibble`](https://gt.rstudio.com/reference/exibble.md)
dataset to create a **gt** table. With `fmt_number()`, we'll format the
`num` column to have three decimal places (with `decimals = 3`) and omit
the use of digit separators (with `use_seps = FALSE`).

    exibble |>
      gt() |>
      fmt_number(
        columns = num,
        decimals = 3,
        use_seps = FALSE
      )

![This image of a table was generated from the first code example in the
\`fmt_number()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_number_1.png)

Use a modified version of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table with row labels. Format all columns to use
large-number suffixing (e.g., where `"10,000,000"` becomes `"10M"`) with
the `suffixing = TRUE` option.

    countrypops |>
      dplyr::select(country_code_3, year, population) |>
      dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
      dplyr::filter(year > 1975 & year %% 5 == 0) |>
      tidyr::pivot_wider(names_from = year, values_from = population) |>
      dplyr::arrange(desc(`2015`)) |>
      gt(rowname_col = "country_code_3") |>
      fmt_number(suffixing = TRUE)

![This image of a table was generated from the second code example in
the \`fmt_number()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_number_2.png)

In a variation of the previous table, we can combine large-number
suffixing with a declaration of the number of significant digits to use.
With things like population figures, `n_sigfig = 3` is a very good
option.

    countrypops |>
      dplyr::select(country_code_3, year, population) |>
      dplyr::filter(country_code_3 %in% c("CHN", "IND", "USA", "PAK", "IDN")) |>
      dplyr::filter(year > 1975 & year %% 5 == 0) |>
      tidyr::pivot_wider(names_from = year, values_from = population) |>
      dplyr::arrange(desc(`2015`)) |>
      gt(rowname_col = "country_code_3") |>
      fmt_number(suffixing = TRUE, n_sigfig = 3)

![This image of a table was generated from the third code example in the
\`fmt_number()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_number_3.png)

There can be cases where you want to show numbers to a large number of
decimal places but also drop the unnecessary trailing zeros for
low-precision values. Let's take a portion of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset and format
the `latitude` and `longitude` columns with `fmt_number()`. We'll have
up to 5 digits displayed as decimal values, but we'll also
unconditionally drop any runs of trailing zeros in the decimal part with
`drop_trailing_zeros = TRUE`.

    towny |>
      dplyr::select(name, latitude, longitude) |>
      dplyr::slice_head(n = 10) |>
      gt() |>
      fmt_number(decimals = 5, drop_trailing_zeros = TRUE) |>
      cols_merge(columns = -name, pattern = "{1}, {2}") |>
      cols_label(
        name ~ "Municipality",
        latitude = "Location"
      )

![This image of a table was generated from the fourth code example in
the \`fmt_number()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_number_4.png)

Another strategy for dealing with precision of decimals is to have a
separate column of values that specify how many decimal digits to
retain. Such a column can be added via
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md) or it can
be part of the input table for
[`gt()`](https://gt.rstudio.com/reference/gt.md). With that column
available, it can be referenced in the `decimals` argument with
[`from_column()`](https://gt.rstudio.com/reference/from_column.md). This
approach yields a display of coordinate values that reflects the
measurement precision of each value.

    towny |>
      dplyr::select(name, latitude, longitude) |>
      dplyr::slice_head(n = 10) |>
      gt() |>
      cols_add(dec_digits = c(1, 2, 2, 5, 5, 2, 3, 2, 3, 3)) |>
      fmt_number(decimals = from_column(column = "dec_digits")) |>
      cols_merge(columns = -name, pattern = "{1}, {2}") |>
      cols_label(
        name ~ "Municipality",
        latitude = "Location"
      )

![This image of a table was generated from the fifth code example in the
\`fmt_number()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_number_5.png)

## Function ID

3-1

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The integer-formatting function (format rounded values (i.e., no
decimals shown and input values are rounded as necessary):
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md).

The vector-formatting version of this function:
[`vec_fmt_number()`](https://gt.rstudio.com/reference/vec_fmt_number.md)

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
