# Format `TRUE` and `FALSE` values

There can be times where logical values are useful in a **gt** table.
You might want to express a 'yes' or 'no', a 'true' or 'false', or,
perhaps use pairings of complementary symbols that make sense in a
table. The `fmt_tf()` function has a set of `tf_style` presets that can
be used to quickly map `TRUE`/`FALSE` values to strings (which are
automatically translated according to a given `locale` value), or,
symbols like up/down or left/right arrows and open/closed shapes.

While the presets are nice, you can provide your own mappings through
the `true_val` and `false_val` arguments. With those you could provide
text (perhaps a Unicode symbol?) or even a **fontawesome** icon by using
`fontawesome::fa("<icon name>")`. The function will automatically handle
alignment when `auto_align = TRUE` and try to give you the best look
depending on the options chosen. For extra customization, you can also
apply color to the individual `TRUE`, `FALSE`, and `NA` mappings. Just
supply a vector of colors (up to a length of 3) to the `colors`
argument.

## Usage

``` r
fmt_tf(
  data,
  columns = everything(),
  rows = everything(),
  tf_style = "true-false",
  pattern = "{x}",
  true_val = NULL,
  false_val = NULL,
  na_val = NULL,
  colors = NULL,
  auto_align = TRUE,
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

- tf_style:

  *Predefined style for `TRUE`/`FALSE` formatting*

  `scalar<character>|scalar<numeric|integer>(1<=val<=10)` // *default:*
  `"true-false"`

  The `TRUE`/`FALSE` mapping style to use. By default this is the short
  name `"true-false"` which corresponds to the words 'true' and 'false'.
  Two other `tf_style` values produce words: `"yes-no"` and `"up-down"`.
  All three of these options for `tf_style` are locale-aware through the
  `locale` option, so, a `"yes"` value will instead be `"ja"` when
  `locale = "de"`. Options 4 through to 10 involve pairs of symbols
  (e.g., `"check-mark"` displays a check mark for `TRUE` and an X symbol
  for `FALSE`). There are 10 `TRUE`/`FALSE` styles and their short names
  can be viewed using
  [`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md).

- pattern:

  *Specification of the formatting pattern*

  `scalar<character>` // *default:* `"{x}"`

  A formatting pattern that allows for decoration of the formatted
  value. The formatted value is represented by the `{x}` (which can be
  used multiple times, if needed) and all other characters will be
  interpreted as string literals.

- true_val:

  *Text to use for `TRUE` values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  While the choice of a `tf_style` will typically supply the `true_val`
  and `false_val` text, we could override this and supply text for any
  `TRUE` values. This doesn't need to be used in conjunction with
  `false_val`.

- false_val:

  *Text to use for `FALSE` values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  While the choice of a `tf_style` will typically supply the `true_val`
  and `false_val` text, we could override this and supply text for any
  `FALSE` values. This doesn't need to be used in conjunction with
  `true_val`.

- na_val:

  *Text to use for `NA` values*

  `scalar<character>` // *default:* `NULL` (`optional`)

  None of the `tf_style` presets will replace any missing values
  encountered in the targeted cells. While we always have the option to
  use [`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md)
  for `NA` replacement, we have the opportunity to do that here with the
  `na_val` option. This is useful because we also have the means to add
  color to the `na_val` text or symbol and doing that requires that a
  replacement value for `NA`s is specified here.

- colors:

  *Colors to use for the resulting strings or symbols*

  `vector<character>` // *default:* `NULL` (`optional`)

  Providing a vector of color values to `colors` will progressively add
  color to the formatted result depending on the number of colors
  provided. With a single color, all formatted values will be in that
  color. Giving two colors results in `TRUE` values being the first
  color, and `FALSE` values receiving the second. With the three color
  option, the final color will be given to any `NA` values replaced
  through `na_val`.

- auto_align:

  *Automatic alignment of the formatted column*

  `scalar<logical>` // *default:* `TRUE`

  The input values may have resulted in an alignment that is not as
  suitable once formatting has occurred. With `auto_align = TRUE`, the
  formatted values will be inspected and this may result in a favorable
  change in alignment. Typically, symbols will be center aligned whereas
  words will receive a left alignment (for words in LTR languages).

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

`fmt_tf()` is compatible with body cells that are of the `"logical"`
(preferred) or `"numeric"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

There is a special caveat when attempting to format numerical values:
the values must either be exactly `1` (the analogue for `TRUE`) or
exactly `0` (the analogue for `FALSE`). Any other numerical values will
be disregarded and left as is. Because of these restrictions, it is
recommended that only logical values undergo formatting.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_tf()` to obtain varying parameter
values from a specified column within the table. This means that each
row could be formatted a little bit differently. These arguments provide
support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `tf_style`

- `pattern`

- `true_val`

- `false_val`

- `na_val`

- `locale`

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

## Formatting with the `tf_style` argument

We can supply a preset `TRUE`/`FALSE` style to the `tf_style` argument
to handle the formatting of logical values. There are several such
styles and the first three of them can handle localization to any
supported locale (i.e., the pairs of words for each style will be
translated to the language of the `locale`) value.

The following table provides a listing of all valid `tf_style` values
and a description of their output values. The output from styles `4` to
`10` are described in terms of the Unicode character names used for the
`TRUE` and `FALSE` values.

|     |                  |                                                                  |
|-----|------------------|------------------------------------------------------------------|
|     | TF Style         | Output (for `TRUE` and `FALSE`)                                  |
| 1   | `"true-false"`   | `"true"`, `"false"` (`locale`-aware)                             |
| 2   | `"yes-no"`       | `"yes"`, `"no"` (`locale`-aware)                                 |
| 3   | `"up-down"`      | `"up"`, `"down"` (`locale`-aware)                                |
| 4   | `"check-mark"`   | `<Heavy Check Mark>`, `<Heavy Ballot X>`                         |
| 5   | `"circles"`      | `<Black Circle>`, `<Heavy Circle>`                               |
| 6   | `"squares"`      | `<Black Square>`, `<White Square>`                               |
| 7   | `"diamonds"`     | `<Black Diamond>`, `<White Diamond>`                             |
| 8   | `"arrows"`       | `<Upwards Arrow>`, `<Downwards Arrow>`                           |
| 9   | `"triangles"`    | `<Black Up-Pointing Triangle>`, `<Black Down-Pointing Triangle>` |
| 10  | `"triangles-lr"` | `<Heavy Check Mark>`, `<Heavy Ballot X>`                         |

We can use the
[`info_tf_style()`](https://gt.rstudio.com/reference/info_tf_style.md)
function to view a similar table of `TRUE`/`FALSE` styles with example
output.

## Adapting output to a specific `locale`

This formatting function can adapt outputs according to a provided
`locale` value. Examples include `"en"` for English (United States) and
`"fr"` for French (France). Note that a `locale` value provided here
will override any global locale setting performed in
[`gt()`](https://gt.rstudio.com/reference/gt.md)'s own `locale` argument
(it is settable there as a value received by all other functions that
have a `locale` argument). As a useful reference on which locales are
supported, we can call
[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md) to
view an info table.

## Examples

Let's use a subset of the
[`sp500`](https://gt.rstudio.com/reference/sp500.md) dataset to create a
small **gt** table containing opening and closing price data for a week
in 2013. We can add a logical column (`dir`) with
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md); the
expression used determines whether the `close` value is greater than the
`open` value. That new column is inserted between `open` and `close`.
Then, we use `fmt_tf()` to generate up and down arrows in the `dir`
column. We elect to use green upward arrows and red downward arrows
(through the `colors` option). With a little numeric formatting and
changes to the column labels, the table becomes more presentable.

    sp500 |>
      dplyr::filter(date >= "2013-01-07" & date <= "2013-01-12") |>
      dplyr::arrange(date) |>
      dplyr::select(-c(adj_close, volume, high, low)) |>
      gt(rowname_col = "date") |>
      cols_add(dir = close > open, .after = open) |>
      fmt_tf(
        columns = dir,
        tf_style = "arrows",
        colors = c("green", "red")
      ) |>
      fmt_currency(columns = c(open, close)) |>
      cols_label(
        open = "Opening",
        close = "Closing",
        dir = ""
      )

![This image of a table was generated from the first code example in the
\`fmt_tf()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_tf_1.png)

The [`reactions`](https://gt.rstudio.com/reference/reactions.md) dataset
contains chemical kinetic information on a wide variety of
atmospherically-relevant compounds. It might be interesting to get a
summary (for a small subset of compounds) for which rate constants are
available for the selected compounds. We first start by selecting the
relevant rows and columns. Then we generate logical columns for each of
the reaction types (i.e., if a value is `NA` then there's no
measurement, so that's `FALSE`). Once the **gt** table has been created,
we can use `fmt_tf()` to provide open and filled circles to indicate
whether a particular reaction has been measured and presented in the
literature.

    reactions |>
      dplyr::filter(cmpd_type %in% c("carboxylic acid", "alkyne", "allene")) |>
      dplyr::select(cmpd_name, cmpd_type, ends_with("k298")) |>
      dplyr::mutate(across(ends_with("k298"), is.na)) |>
      gt(rowname_col = "cmpd_name", groupname_col = "cmpd_type") |>
      tab_spanner(
        label = "Has a measured rate constant",
        columns = ends_with("k298")
      ) |>
      tab_stub_indent(
        rows = everything(),
        indent = 2
      ) |>
      fmt_tf(
        columns = ends_with("k298"),
        tf_style = "circles"
      ) |>
      cols_label(
        OH_k298 = "OH",
        O3_k298 = "Ozone",
        NO3_k298 = "Nitrate",
        Cl_k298 = "Chlorine"
      ) |>
      cols_width(
        stub() ~ px(200),
        ends_with("k298") ~ px(80)
      ) |>
      opt_vertical_padding(scale = 0.35)

![This image of a table was generated from the second code example in
the \`fmt_tf()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_tf_2.png)

There are census-based population values in the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset and quite a
few small towns within it. Let's look at the ten smallest towns
(according to the 2021 figures) and work out whether their populations
have increased or declined since 1996. Also, let's determine which of
these towns even have a website. After that data preparation, the data
is made into a **gt** table and `fmt_tf()` can be used in the `website`
and `pop_dir` columns (which both have `TRUE`/`FALSE` values). Each of
these `fmt_tf()` calls will either produce `"yes"`/`"no"` or
`"up"`/`"down"` strings (set via the `tf_style` option).

    towny |>
      dplyr::arrange(population_2021) |>
      dplyr::mutate(website = !is.na(website))  |>
      dplyr::mutate(pop_dir = population_2021 > population_1996) |>
      dplyr::select(name, website, population_1996, population_2021, pop_dir) |>
      dplyr::slice_head(n = 10) |>
      gt(rowname_col = "name") |>
      tab_spanner(
        label = "Population",
        columns = starts_with("pop")
      ) |>
      tab_stubhead(label = "Town") |>
      fmt_tf(
        columns = website,
        tf_style = "yes-no",
        auto_align = FALSE
      ) |>
      fmt_tf(
        columns = pop_dir,
        tf_style = "up-down",
        pattern = "It's {x}."
      ) |>
      cols_label_with(
        columns = starts_with("population"),
        fn = function(x) sub("population_", "", x)
      ) |>
      cols_label(
        website = md("Has a  \n website?"),
        pop_dir = "Pop. direction?"
      ) |>
      opt_horizontal_padding(scale = 2)

![This image of a table was generated from the third code example in the
\`fmt_tf()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_tf_3.png)

If formatting to words instead of symbols (with the hyphenated
`tf_style` keywords), the words themselves can be translated to
different languages if providing a `locale` value. In this next example,
we're manually creating a tibble with locale codes and their associated
languages. The `yes` and `up` columns all receive `TRUE` whereas `no`
and `down` will all be `FALSE`. With two calls of `fmt_tf()` for each of
these pairings, we get the columns' namesake words. To have these words
translated, the `locale` argument is pointed toward values in the `code`
column by using
[`from_column()`](https://gt.rstudio.com/reference/from_column.md).

    dplyr::tibble(
      code = c("de", "fr", "is", "tr", "ka", "lt", "ca", "bg", "lv"),
      lang = c(
        "German", "French", "Icelandic", "Turkish", "Georgian",
        "Lithuanian", "Catalan", "Bulgarian", "Latvian"
      ),
      yes = TRUE,
      no = FALSE,
      up = TRUE,
      down = FALSE
    ) |>
      gt(rowname_col = "lang") |>
      tab_header(title = "Common words in a few languages") |>
      fmt_tf(
        columns = c(yes, no),
        tf_style = "yes-no",
        locale = from_column("code")
      ) |>
      fmt_tf(
        columns = c(up, down),
        tf_style = "up-down",
        locale = from_column("code")
      ) |>
      cols_merge(
        columns = c(lang, code),
        pattern = "{1} ({2})"
      ) |>
      cols_width(
        stub() ~ px(150),
        everything() ~ px(80)
      )

![This image of a table was generated from the fourth code example in
the \`fmt_tf()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_tf_4.png)

## Function ID

3-19

## Function Introduced

`v0.11.0` (July 9, 2024)

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
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
