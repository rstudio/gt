# Format values as currencies

With numeric values in a **gt** table, we can perform currency-based
formatting with `fmt_currency()`. The function supports both automatic
formatting with either a three-letter or a numeric currency code. We can
also specify a custom currency that is formatted according to one or
more output contexts with the
[`currency()`](https://gt.rstudio.com/reference/currency.md) helper
function. We have fine control over the conversion from numeric values
to currency values, where we could take advantage of the following
options:

- the currency: providing a currency code or common currency name will
  procure the correct currency symbol and number of currency subunits;
  we could also use the
  [`currency()`](https://gt.rstudio.com/reference/currency.md) helper
  function to specify a custom currency

- currency symbol placement: the currency symbol can be placed before or
  after the values

- decimals/subunits: choice of the number of decimal places, and a
  choice of the decimal symbol, and an option on whether to include or
  exclude the currency subunits (the decimal portion)

- negative values: choice of a negative sign or parentheses for values
  less than zero

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol

- scaling: we can choose to scale targeted values by a multiplier value

- large-number suffixing: larger figures (thousands, millions, etc.) can
  be autoscaled and decorated with the appropriate suffixes

- pattern: option to use a text pattern for decoration of the formatted
  currency values

- locale-based formatting: providing a locale ID will result in currency
  formatting specific to the chosen locale; it will also retrieve the
  locale's currency if none is explicitly given

We can call
[`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
for a useful reference on all of the valid inputs to the `currency`
argument.

## Usage

``` r
fmt_currency(
  data,
  columns = everything(),
  rows = everything(),
  currency = NULL,
  use_subunits = TRUE,
  decimals = NULL,
  drop_trailing_dec_mark = TRUE,
  use_seps = TRUE,
  min_sep_threshold = 1,
  accounting = FALSE,
  scale_by = 1,
  suffixing = FALSE,
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign = FALSE,
  placement = "left",
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

- currency:

  *Currency to use*

  `scalar<character>|obj:<gt_currency>` // *default:* `NULL`
  (`optional`)

  The currency to use for the numeric value. This input can be supplied
  as a 3-letter currency code (e.g., `"USD"` for U.S. Dollars, `"EUR"`
  for the Euro currency). Use
  [`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
  to get an information table with all of the valid currency codes and
  examples of each. Alternatively, we can provide a general currency
  type (e.g., `"dollar"`, `"pound"`, `"yen"`, etc.) to simplify the
  process. Use
  [`info_currencies()`](https://gt.rstudio.com/reference/info_currencies.md)
  with the `type == "symbol"` option to view an information table with
  all of the supported currency symbol names along with examples.

  We can also use the
  [`currency()`](https://gt.rstudio.com/reference/currency.md) helper
  function to specify a custom currency, where the string could vary
  across output contexts. For example, using
  `currency(html = "&fnof;", default = "f")` would give us a suitable
  glyph for the Dutch guilder in an HTML output table, and it would
  simply be the letter "f" in all other output contexts). Please note
  that `decimals` will default to `2` when using the
  [`currency()`](https://gt.rstudio.com/reference/currency.md) helper
  function.

  If nothing is provided here but a `locale` value has been set (either
  in this function call or as part of the initial
  [`gt()`](https://gt.rstudio.com/reference/gt.md) call), the currency
  will be obtained from that locale. Virtually all locales are linked to
  a territory that is a country (use
  [`info_locales()`](https://gt.rstudio.com/reference/info_locales.md)
  for details on all locales used in this package), so, the in-use (or
  *de facto*) currency will be obtained. As the default locale is
  `"en"`, the `"USD"` currency will be used if neither a `locale` nor a
  `currency` value is given.

- use_subunits:

  *Show or hide currency subunits*

  `scalar<logical>` // *default:* `TRUE`

  An option for whether the subunits portion of a currency value should
  be displayed. For example, with an input value of `273.81`, the
  default formatting will produce `"$273.81"`. Removing the subunits
  (with `use_subunits = FALSE`) will give us `"$273"`.

- decimals:

  *Number of decimal places*

  `scalar<numeric|integer>(val>=0)` // *default:* `NULL` (`optional`)

  The `decimals` values corresponds to the exact number of decimal
  places to use. This value is optional as a currency has an intrinsic
  number of decimal places (i.e., the subunits). A value such as `2.34`
  can, for example, be formatted with `0` decimal places and if the
  currency used is `"USD"` it would result in `"$2"`. With `4` decimal
  places, the formatted value becomes `"$2.3400"`.

- drop_trailing_dec_mark:

  *Drop the trailing decimal mark*

  `scalar<logical>` // *default:* `TRUE`

  A logical value that determines whether decimal marks should always
  appear even if there are no decimal digits to display after
  formatting. For example, when `use_subunits = FALSE` or `decimals = 0`
  a formatted value such as `"$23"` can be fashioned as `"$23."` by
  setting `drop_trailing_dec_mark = FALSE`.

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

- placement:

  *Currency symbol placement*

  `singl-kw:[left|right]` // *default:* `"left"`

  The placement of the currency symbol. This can be either be `"left"`
  (as in `"$450"`) or `"right"` (which yields `"450$"`).

- incl_space:

  *Include a space between the value and the currency symbol*

  `scalar<logical>` // *default:* `FALSE`

  An option for whether to include a space between the value and the
  currency symbol. The default is to not introduce a space character.

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

`fmt_currency()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_currency()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `currency`

- `use_subunits`

- `decimals`

- `drop_trailing_dec_mark`

- `use_seps`

- `accounting`

- `scale_by`

- `suffixing`

- `pattern`

- `sep_mark`

- `dec_mark`

- `force_sign`

- `placement`

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
`"fr"` for French (France). The use of a locale ID here means separator
and decimal marks will be correct for the given locale. Should any
values be provided in `sep_mark` or `dec_mark`, they will be overridden
by the locale's preferred values. In addition to number formatting,
providing a `locale` value and not providing a `currency` allows **gt**
to obtain the currency code from the locale's territory.

Note that a `locale` value provided here will override any global locale
setting performed in [`gt()`](https://gt.rstudio.com/reference/gt.md)'s
own `locale` argument (it is settable there as a value received by all
other functions that have a `locale` argument). As a useful reference on
which locales are supported, we can call
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Let's make a simple **gt** table from the
[`exibble`](https://gt.rstudio.com/reference/exibble.md) dataset. We'll
keep only the `num` and `currency`, columns, then, format those columns
using `fmt_currency()` (with the `"JPY"` and `"GBP"` currencies).

    exibble |>
      dplyr::select(num, currency) |>
      gt() |>
      fmt_currency(
        columns = num,
        currency = "JPY"
      ) |>
      fmt_currency(
        columns = currency,
        currency = "GBP"
      )

![This image of a table was generated from the first code example in the
\`fmt_currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_currency_1.png)

Let's take a single column from
[`exibble`](https://gt.rstudio.com/reference/exibble.md) (`currency`)
and format it with a currency name (this differs from the 3-letter
currency code). In this case, we'll use the `"euro"` currency and set
the placement of the symbol to the right of any value. Additionally, the
currency symbol will separated from the value with a single space
character (using `incl_space = TRUE`).

    exibble |>
      dplyr::select(currency) |>
      gt() |>
      fmt_currency(
        currency = "euro",
        placement = "right",
        incl_space = TRUE
      )

![This image of a table was generated from the second code example in
the \`fmt_currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_currency_2.png)

With the [`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md)
dataset, let's make a summary table that gets the number of `"hawaiian"`
pizzas sold (and revenue generated) by month. In the **gt** table, we'll
format only the `revenue` column. The `currency` value is automatically
U.S. Dollars when don't supply either a currency code or a locale. We'll
also create a grand summary with
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md).
Within that summary row, the total revenue needs to be formatted with
`fmt_currency()` and we can do that within the `fmt` argument.

    pizzaplace |>
      dplyr::filter(name == "hawaiian") |>
      dplyr::mutate(month = lubridate::month(date, label = TRUE, abbr = TRUE)) |>
      dplyr::select(month, price) |>
      dplyr::group_by(month) |>
      dplyr::summarize(
        `number sold` = dplyr::n(),
        revenue = sum(price)
      ) |>
      gt(rowname_col = "month") |>
      tab_header(title = "Summary of Hawaiian Pizzas Sold by Month") |>
      fmt_currency(columns = revenue) |>
      grand_summary_rows(
        fns = list(label = "Totals:", id = "totals", fn = "sum"),
        fmt = ~ fmt_currency(., columns = revenue),
      ) |>
      opt_all_caps()

![This image of a table was generated from the third code example in the
\`fmt_currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_currency_3.png)

If supplying a `locale` value to `fmt_currency()`, we can opt use the
locale's assumed currency and not have to supply a `currency` value
(doing so would override the locale's default currency). With a column
of locale values, we can format currency values on a row-by-row basis
through the use of
[`from_column()`](https://gt.rstudio.com/reference/from_column.md).
Here, we'll reference the `locale` column in the argument of the same
name.

    dplyr::tibble(
      amount = rep(50.84, 5),
      currency = c("JPY", "USD", "GHS", "KRW", "CNY"),
      locale = c("ja", "en", "ee", "ko", "zh"),
    ) |>
      gt() |>
      fmt_currency(
        columns = amount,
        locale = from_column(column = "locale")
      ) |>
      cols_hide(columns = locale)

![This image of a table was generated from the fourth code example in
the \`fmt_currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_currency_4.png)

We can similarly use
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) to
reference a column that has currency code values. Here's an example of
how to create a simple currency conversion table. The `curr` column
contains the 3-letter currency codes, and that column is referenced via
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) in
the `currency` argument of `fmt_currency()`.

    dplyr::tibble(
      flag = c("EU", "GB", "CA", "AU", "JP", "IN"),
      curr = c("EUR", "GBP", "CAD", "AUD", "JPY", "INR"),
      conv = c(
        0.912952, 0.787687, 1.34411,
        1.53927, 144.751, 82.9551
      )
    ) |>
      gt() |>
      fmt_currency(
        columns = conv,
        currency = from_column(column = "curr")
      ) |>
      fmt_flag(columns = flag) |>
      cols_merge(columns = c(flag, curr)) |>
      cols_label(
        flag = "Currency",
        conv = "Amount"
      ) |>
      tab_header(
        title = "Conversion of 1 USD to Six Other Currencies",
        subtitle = md("Conversion rates obtained on **Aug 13, 2023**")
      )

![This image of a table was generated from the fifth code example in the
\`fmt_currency()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_currency_5.png)

## Function ID

3-9

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_currency()`](https://gt.rstudio.com/reference/vec_fmt_currency.md).

Other data formatting functions:
[`data_color()`](https://gt.rstudio.com/reference/data_color.md),
[`fmt()`](https://gt.rstudio.com/reference/fmt.md),
[`fmt_auto()`](https://gt.rstudio.com/reference/fmt_auto.md),
[`fmt_bins()`](https://gt.rstudio.com/reference/fmt_bins.md),
[`fmt_bytes()`](https://gt.rstudio.com/reference/fmt_bytes.md),
[`fmt_chem()`](https://gt.rstudio.com/reference/fmt_chem.md),
[`fmt_country()`](https://gt.rstudio.com/reference/fmt_country.md),
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
