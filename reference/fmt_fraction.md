# Format values as mixed fractions

With numeric values in a **gt** table, we can perform
mixed-fraction-based formatting. There are several options for setting
the accuracy of the fractions. Furthermore, there is an option for
choosing a layout (i.e., typesetting style) for the mixed-fraction
output.

The following options are available for controlling this type of
formatting:

- accuracy: how to express the fractional part of the mixed fractions;
  there are three keyword options for this and an allowance for
  arbitrary denominator settings

- simplification: an option to simplify fractions whenever possible

- layout: We can choose to output values with diagonal or inline
  fractions

- digit grouping separators: options to enable/disable digit separators
  and provide a choice of separator symbol for the whole number portion

- pattern: option to use a text pattern for decoration of the formatted
  mixed fractions

- locale-based formatting: providing a locale ID will result in number
  formatting specific to the chosen locale

## Usage

``` r
fmt_fraction(
  data,
  columns = everything(),
  rows = everything(),
  accuracy = NULL,
  simplify = TRUE,
  layout = c("inline", "diagonal"),
  use_seps = TRUE,
  pattern = "{x}",
  sep_mark = ",",
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

- accuracy:

  *Accuracy of fractions*

  `singl-kw:[low|med|high]|scalar<numeric|integer>(val>=1)` //
  *default:* `"low"`

  The type of fractions to generate. This can either be one of the
  keywords `"low"`, `"med"`, or `"high"` (to generate fractions with
  denominators of up to 1, 2, or 3 digits, respectively) or an integer
  value greater than zero to obtain fractions with a fixed denominator
  (`2` yields halves, `3` is for thirds, `4` is quarters, etc.). For the
  latter option, using `simplify = TRUE` will simplify fractions where
  possible (e.g., `2/4` will be simplified as `1/2`). By default, the
  `"low"` option is used.

- simplify:

  *Simplify the fraction*

  `scalar<logical>` // *default:* `TRUE`

  If choosing to provide a numeric value for `accuracy`, the option to
  simplify the fraction (where possible) can be taken with `TRUE` (the
  default). With `FALSE`, denominators in fractions will be fixed to the
  value provided in `accuracy`.

- layout:

  *Layout of fractions in HTML output*

  `singl-kw:[inline|diagonal]` // *default:* `"inline"`

  For HTML output, the `"inline"` layout is the default. This layout
  places the numerals of the fraction on the baseline and uses a
  standard slash character. The `"diagonal"` layout will generate
  fractions that are typeset with raised/lowered numerals and a virgule.

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

`fmt_fraction()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_fraction()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit ifferently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `accuracy`

- `simplify`

- `layout`

- `use_seps`

- `pattern`

- `sep_mark`

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
any value be provided in `sep_mark`, it will be overridden by the
locale's preferred values.

Note that a `locale` value provided here will override any global locale
setting performed in [`gt()`](https://gt.rstudio.com/reference/gt.md)'s
own `locale` argument (it is settable there as a value received by all
other functions that have a `locale` argument). As a useful reference on
which locales are supported, we can call
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Using a summarized version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
let's create a **gt** table. With `fmt_fraction()` we can format the
`f_sold` and `f_income` columns to display fractions. As for how the
fractions are represented, we are electing to use `accuracy = 10`. This
gives all fractions as tenths. We won't simplify the fractions (by using
`simplify = FALSE`) and this means that a fraction like `5/10` won't
become `1/2`. With `layout ="diagonal"`, we get a diagonal display of
all fractions.

    pizzaplace |>
      dplyr::group_by(type, size) |>
      dplyr::summarize(
        sold = dplyr::n(),
        income = sum(price),
        .groups = "drop_last"
      ) |>
      dplyr::group_by(type) |>
      dplyr::mutate(
        f_sold = sold / sum(sold),
        f_income = income / sum(income),
      ) |>
      dplyr::arrange(type, dplyr::desc(income)) |>
      gt(rowname_col = "size") |>
      tab_header(
        title = "Pizzas Sold in 2015",
        subtitle = "Fraction of Sell Count and Revenue by Size per Type"
      ) |>
      fmt_integer(columns = sold) |>
      fmt_currency(columns = income) |>
      fmt_fraction(
        columns = starts_with("f_"),
        accuracy = 10,
        simplify = FALSE,
        layout = "diagonal"
      ) |>
      sub_missing(missing_text = "") |>
      tab_spanner(
        label = "Sold",
        columns = contains("sold")
      ) |>
      tab_spanner(
        label = "Revenue",
        columns = contains("income")
      ) |>
      text_transform(
        locations = cells_body(),
        fn = function(x) {
          dplyr::case_when(
            x == 0 ~ "<em>nil</em>",
            x != 0 ~ x
          )
        }
      ) |>
      cols_label(
        sold = "Amount",
        income = "Amount",
        f_sold = md("_f_"),
        f_income = md("_f_")
      ) |>
      cols_align(align = "center", columns = starts_with("f")) |>
      tab_options(
        table.width = px(400),
        row_group.as_column = TRUE
      )

![This image of a table was generated from the first code example in the
\`fmt_fraction()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_fraction_1.png)

## Function ID

3-8

## Function Introduced

`v0.4.0` (February 15, 2022)

## See also

The vector-formatting version of this function:
[`vec_fmt_fraction()`](https://gt.rstudio.com/reference/vec_fmt_fraction.md).

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
