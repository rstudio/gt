# Format values to spelled-out numbers

With numeric values in a **gt** table we can transform those to numbers
that are spelled out with `fmt_spelled_num()`. Any values from `0` to
`100` can be spelled out so, for example, the value `23` will be
formatted as `"twenty-three"`. Providing a locale ID will result in the
number spelled out in the locale's language rules. For example, should a
Swedish locale (`"sv"`) be provided, the value `23` will yield
`"tjugotre"`. In addition to this, we can optionally use the `pattern`
argument for decoration of the formatted values.

## Usage

``` r
fmt_spelled_num(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}",
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

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

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

`fmt_spelled_num()` is compatible with body cells that are of the
`"numeric"` or `"integer"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_spelled_num()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `pattern`

- `locale`

Please note that for both of the aforementioned arguments, a
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

## Supported locales

The following 80 locales are supported in the `locale` argument of
`fmt_spelled_num()`: `"af"` (Afrikaans), `"ak"` (Akan), `"am"`
(Amharic), `"ar"` (Arabic), `"az"` (Azerbaijani), `"be"` (Belarusian),
`"bg"` (Bulgarian), `"bs"` (Bosnian), `"ca"` (Catalan), `"ccp"`
(Chakma), `"chr"` (Cherokee), `"cs"` (Czech), `"cy"` (Welsh), `"da"`
(Danish), `"de"` (German), `"de-CH"` (German (Switzerland)), `"ee"`
(Ewe), `"el"` (Greek), `"en"` (English), `"eo"` (Esperanto), `"es"`
(Spanish), `"et"` (Estonian), `"fa"` (Persian), `"ff"` (Fulah), `"fi"`
(Finnish), `"fil"` (Filipino), `"fo"` (Faroese), `"fr"` (French),
`"fr-BE"` (French (Belgium)), `"fr-CH"` (French (Switzerland)), `"ga"`
(Irish), `"he"` (Hebrew), `"hi"` (Hindi), `"hr"` (Croatian), `"hu"`
(Hungarian), `"hy"` (Armenian), `"id"` (Indonesian), `"is"` (Icelandic),
`"it"` (Italian), `"ja"` (Japanese), `"ka"` (Georgian), `"kk"` (Kazakh),
`"kl"` (Kalaallisut), `"km"` (Khmer), `"ko"` (Korean), `"ky"` (Kyrgyz),
`"lb"` (Luxembourgish), `"lo"` (Lao), `"lrc"` (Northern Luri), `"lt"`
(Lithuanian), `"lv"` (Latvian), `"mk"` (Macedonian), `"ms"` (Malay),
`"mt"` (Maltese), `"my"` (Burmese), `"ne"` (Nepali), `"nl"` (Dutch),
`"nn"` (Norwegian Nynorsk), `"no"` (Norwegian), `"pl"` (Polish), `"pt"`
(Portuguese), `"qu"` (Quechua), `"ro"` (Romanian), `"ru"` (Russian),
`"se"` (Northern Sami), `"sk"` (Slovak), `"sl"` (Slovenian), `"sq"`
(Albanian), `"sr"` (Serbian), `"sr-Latn"` (Serbian (Latin)), `"su"`
(Sundanese), `"sv"` (Swedish), `"sw"` (Swahili), `"ta"` (Tamil), `"th"`
(Thai), `"tr"` (Turkish), `"uk"` (Ukrainian), `"vi"` (Vietnamese),
`"yue"` (Cantonese), and `"zh"` (Chinese).

## Examples

Let's use a summarized version of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset to create
a **gt** table. `fmt_spelled_num()` is used to transform integer values
into spelled-out numbering (in the `n` column). That formatted column of
numbers-as-words is given cell background colors via
[`data_color()`](https://gt.rstudio.com/reference/data_color.md) (the
underlying numerical values are always available).

    gtcars |>
      dplyr::count(mfr, ctry_origin) |>
      dplyr::arrange(ctry_origin) |>
      gt(rowname_col = "mfr", groupname_col = "ctry_origin") |>
      cols_label(n = "No. of Entries") |>
      fmt_spelled_num() |>
      tab_stub_indent(rows = everything(), indent = 2) |>
      data_color(
        columns = n,
        method = "numeric",
        palette = "viridis",
        alpha = 0.8
      ) |>
      opt_all_caps() |>
      opt_vertical_padding(scale = 0.5) |>
      cols_align(align = "center", columns = n)

![This image of a table was generated from the first code example in the
\`fmt_spelled_num()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_spelled_num_1.png)

With a considerable amount of **dplyr** and **tidyr** work done to the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
we can create a new **gt** table. `fmt_spelled_num()` will be used here
to transform the integer values in the `rank` column. We'll do so with a
special `pattern` that puts the word 'Number' in front of every
spelled-out number.

    pizzaplace |>
      dplyr::mutate(month = lubridate::month(date, label = TRUE)) |>
      dplyr::filter(month %in% month.abb[1:6]) |>
      dplyr::group_by(name, month) |>
      dplyr::summarize(sum = sum(price), .groups = "drop") |>
      dplyr::arrange(month, desc(sum)) |>
      dplyr::group_by(month) |>
      dplyr::slice_head(n = 5) |>
      dplyr::mutate(rank = dplyr::row_number()) |>
      dplyr::ungroup() |>
      dplyr::select(-sum) |>
      tidyr::pivot_wider(names_from = month, values_from = c(name)) |>
      gt() |>
      fmt_spelled_num(columns = rank, pattern = "Number {x}") |>
      opt_all_caps() |>
      cols_align(columns = -rank, align = "center") |>
      cols_width(
        rank ~ px(120),
        everything() ~ px(100)
      ) |>
      opt_table_font(stack = "rounded-sans") |>
      tab_options(table.font.size = px(14))

![This image of a table was generated from the second code example in
the \`fmt_spelled_num()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_spelled_num_2.png)

Let's make a table that compares how the numbers from `1` to `10` are
spelled across a small selection of languages. Here we use
`fmt_spelled_num()` with each column, ensuring that the `locale` value
matches that of the column name.

    dplyr::tibble(
      num = 1:10,
      en = num,
      fr = num,
      de = num,
      es = num,
      pl = num,
      bg = num,
      ko = num,
      zh = num
    ) |>
      gt(rowname_col = "num") |>
      fmt_spelled_num(columns = en, locale = "en") |>
      fmt_spelled_num(columns = fr, locale = "fr") |>
      fmt_spelled_num(columns = de, locale = "de") |>
      fmt_spelled_num(columns = es, locale = "es") |>
      fmt_spelled_num(columns = pl, locale = "pl") |>
      fmt_spelled_num(columns = bg, locale = "bg") |>
      fmt_spelled_num(columns = ko, locale = "ko") |>
      fmt_spelled_num(columns = zh, locale = "zh") |>
      cols_label_with(fn = function(x) md(paste0("`", x, "`"))) |>
      tab_spanner(
        label = "Numbers in the specified locale",
        columns = everything()
      ) |>
      cols_align(align = "left", columns = everything()) |>
      cols_width(
        c(en, fr, de, es, pl, bg) ~ px(100),
        c(ko, zh) ~ px(50)
      ) |>
      opt_horizontal_padding(scale = 2) |>
      opt_vertical_padding(scale = 0.5)

![This image of a table was generated from the third code example in the
\`fmt_spelled_num()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_spelled_num_3.png)

## Function ID

3-12

## Function Introduced

`v0.9.0` (Mar 31, 2023)

## See also

The vector-formatting version of this function:
[`vec_fmt_spelled_num()`](https://gt.rstudio.com/reference/vec_fmt_spelled_num.md).

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
[`fmt_scientific()`](https://gt.rstudio.com/reference/fmt_scientific.md),
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
