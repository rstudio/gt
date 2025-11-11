# Format values to scientific notation

With numeric values in a **gt** table, we can perform formatting so that
the targeted values are rendered in scientific notation, where extremely
large or very small numbers can be expressed in a more practical
fashion. Here, numbers are written in the form of a mantissa (`m`) and
an exponent (`n`) with the construction *m* x 10^*n* or *m*E*n*. The
mantissa component is a number between `1` and `10`. For instance,
`2.5 x 10^9` can be used to represent the value 2,500,000,000 in
scientific notation. In a similar way, 0.00000012 can be expressed as
`1.2 x 10^-7`. Due to its ability to describe numbers more succinctly
and its ease of calculation, scientific notation is widely employed in
scientific and technical domains.

We have fine control over the formatting task, with the following
options:

- decimals: choice of the number of decimal places, option to drop
  trailing zeros, and a choice of the decimal symbol

- scaling: we can choose to scale targeted values by a multiplier value

- pattern: option to use a text pattern for decoration of the formatted
  values

- locale-based formatting: providing a locale ID will result in
  formatting specific to the chosen locale

## Usage

``` r
fmt_scientific(
  data,
  columns = everything(),
  rows = everything(),
  decimals = 2,
  n_sigfig = NULL,
  drop_trailing_zeros = FALSE,
  drop_trailing_dec_mark = TRUE,
  scale_by = 1,
  exp_style = "x10n",
  pattern = "{x}",
  sep_mark = ",",
  dec_mark = ".",
  force_sign_m = FALSE,
  force_sign_n = FALSE,
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

- scale_by:

  *Scale values by a fixed multiplier*

  `scalar<numeric|integer>` // *default:* `1`

  All numeric values will be multiplied by the `scale_by` value before
  undergoing formatting. Since the `default` value is `1`, no values
  will be changed unless a different multiplier value is supplied.

- exp_style:

  *Style declaration for exponent formatting*

  `scalar<character>` // *default:* `"x10n"`

  Style of formatting to use for the scientific notation formatting. By
  default this is `"x10n"` but other options include using a single
  letter (e.g., `"e"`, `"E"`, etc.), a letter followed by a `"1"` to
  signal a minimum digit width of one, or `"low-ten"` for using a
  stylized `"10"` marker.

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

- force_sign_m, force_sign_n:

  *Forcing the display of a positive sign*

  `scalar<logical>` // *default:* `FALSE`

  Should the plus sign be shown for positive values of the mantissa
  (first component, `force_sign_m`) or the exponent (`force_sign_n`)?
  This would effectively show a sign for all values except zero on
  either of those numeric components of the notation. If so, use `TRUE`
  for either one of these options. The default for both is `FALSE`,
  where only negative numbers will display a sign.

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

`fmt_scientific()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_scientific()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `decimals`

- `drop_trailing_zeros`

- `drop_trailing_dec_mark`

- `scale_by`

- `exp_style`

- `pattern`

- `sep_mark`

- `dec_mark`

- `force_sign_m`

- `force_sign_n`

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

Let's define a data frame that contains two columns of values (one
`small` and one `large`). After creating a simple **gt** table from
`small_large_tbl` we'll call `fmt_scientific()` on both columns.

    small_large_tbl <-
      dplyr::tibble(
        small = 10^(-12:-1),
        large = 10^(1:12)
      )

    small_large_tbl |>
      gt() |>
      fmt_scientific()

![This image of a table was generated from the first code example in the
\`fmt_scientific()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_scientific_1.png)

The default method of styling the notation uses the '*m* x 10^*n*'
construction but this can be changed to a '*m*E*n*' style via the
`exp_style` argument. We can supply any single letter here and
optionally affix a `"1"` to indicate there should not be any
zero-padding of the *n* value. Two calls of `fmt_scientific()` are used
here to show different options for styling in scientific notation.

    small_large_tbl |>
      gt() |>
      fmt_scientific(
        columns = small,
        exp_style = "E"
      ) |>
      fmt_scientific(
        columns = large,
        exp_style = "e1",
        force_sign_n = TRUE
      )

![This image of a table was generated from the second code example in
the \`fmt_scientific()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_scientific_2.png)

Taking a portion of the
[`reactions`](https://gt.rstudio.com/reference/reactions.md) dataset, we
can create a **gt** table that contains reaction rate constants that
should be expressed in scientific notation. All of the numeric values in
the filtered table require that type of formatting so `fmt_scientific()`
can be called without requiring any specification of column names in the
`columns` argument. By default, the number of decimal places is fixed to
`2`, which is fine for this table.

    reactions |>
      dplyr::filter(cmpd_type == "mercaptan") |>
      dplyr::select(cmpd_name, cmpd_formula, OH_k298, Cl_k298, NO3_k298) |>
      gt(rowname_col = "cmpd_name") |>
      tab_header(title = "Gas-phase reactions of selected mercaptan compounds") |>
      tab_spanner(
        label = md("Reaction Rate Constant (298 K),<br>{{cm^3 molecules^-1 s^-1}}"),
        columns = ends_with("k298")
      ) |>
      fmt_chem(columns = cmpd_formula) |>
      fmt_scientific() |>
      sub_missing() |>
      cols_label(
        cmpd_formula = "",
        OH_k298 = "OH",
        NO3_k298 = "{{%NO3%}}",
        Cl_k298 = "Cl"
      ) |>
      opt_stylize() |>
      opt_horizontal_padding(scale = 3) |>
      opt_table_font(font = google_font("IBM Plex Sans")) |>
      tab_options(stub.font.weight = "500")

![This image of a table was generated from the third code example in the
\`fmt_scientific()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_scientific_3.png)

The [`constants`](https://gt.rstudio.com/reference/constants.md) table
contains a plethora of data on the fundamental physical constants and
values range from very small to very large, warranting the use of
figures in scientific notation. Because the values differ in the degree
of measurement precision, the dataset has columns (`sf_value` and
`sf_uncert`) that include the number of significant figures for each
measurement value and for the associated uncertainty. We can use the
`n_sigfig` argument of `fmt_scientific()` in conjunction with the
[`from_column()`](https://gt.rstudio.com/reference/from_column.md)
helper to format each value and its uncertainty to the proper number of
significant digits.

    constants |>
      dplyr::filter(grepl("Planck", name)) |>
      gt() |>
      fmt_scientific(
        columns = value,
        n_sigfig = from_column(column = "sf_value")
      ) |>
      fmt_scientific(
        columns = uncert,
        n_sigfig = from_column(column = "sf_uncert")
      ) |>
      cols_hide(columns = starts_with("sf")) |>
      fmt_units(columns = units) |>
      sub_missing(missing_text = "")

![This image of a table was generated from the fourth code example in
the \`fmt_scientific()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_scientific_4.png)

## Function ID

3-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

The vector-formatting version of this function:
[`vec_fmt_scientific()`](https://gt.rstudio.com/reference/vec_fmt_scientific.md).

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
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md),
[`fmt_roman()`](https://gt.rstudio.com/reference/fmt_roman.md),
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
