# Generate flag icons for countries from their country codes

While it is fairly straightforward to insert images into body cells
(using [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md) is
one way to it), there is often the need to incorporate specialized types
of graphics within a table. One such group of graphics involves
iconography representing different countries, and the `fmt_flag()`
function helps with inserting a flag icon (or multiple) in body cells.
To make this work seamlessly, the input cells need to contain some
reference to a country, and this can be in the form of a 2- or 3-letter
ISO 3166-1 country code (e.g., Egypt has the `"EG"` country code). This
function will parse the targeted body cells for those codes (and the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
contains all of them) and insert the appropriate flag graphics.

Multiple flags can be included per cell by separating country codes with
commas (e.g., `"GB,TT"`). The `sep` argument allows for a common
separator to be applied between flag icons.

## Usage

``` r
fmt_flag(
  data,
  columns = everything(),
  rows = everything(),
  height = "1em",
  sep = " ",
  use_title = TRUE,
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

- height:

  *Height of flag*

  `scalar<character>` // *default:* `"1em"`

  The absolute height of the flag icon in the table cell. By default,
  this is set to `"1em"`.

- sep:

  *Separator between flags*

  `scalar<character>` // *default:* `" "`

  In the output of flag icons within a body cell, `sep` provides the
  separator between each icon. By default, this is a single space
  character (`" "`).

- use_title:

  *Display country name on hover*

  `scalar<logical>` // *default:* `TRUE`

  An option to display a tooltip for the country name (in the language
  according to the `locale` value, set either here or in
  [`gt()`](https://gt.rstudio.com/reference/gt.md)) when hovering over
  the flag icon.

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

`fmt_flag()` is compatible with body cells that are of the `"character"`
or `"factor"` types. Any other types of body cells are ignored during
formatting. This is to say that cells of incompatible data types may be
targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_flag()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `height`

- `sep`

- `use_title`

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

## Supported regions

The following 242 regions (most of which comprise countries) are
supported with names across 574 locales: `"AD"`, `"AE"`, `"AF"`, `"AG"`,
`"AI"`, `"AL"`, `"AM"`, `"AO"`, `"AR"`, `"AS"`, `"AT"`, `"AU"`, `"AW"`,
`"AX"`, `"AZ"`, `"BA"`, `"BB"`, `"BD"`, `"BE"`, `"BF"`, `"BG"`, `"BH"`,
`"BI"`, `"BJ"`, `"BL"`, `"BM"`, `"BN"`, `"BO"`, `"BR"`, `"BS"`, `"BT"`,
`"BW"`, `"BY"`, `"BZ"`, `"CA"`, `"CC"`, `"CD"`, `"CF"`, `"CG"`, `"CH"`,
`"CI"`, `"CK"`, `"CL"`, `"CM"`, `"CN"`, `"CO"`, `"CR"`, `"CU"`, `"CV"`,
`"CW"`, `"CY"`, `"CZ"`, `"DE"`, `"DJ"`, `"DK"`, `"DM"`, `"DO"`, `"DZ"`,
`"EC"`, `"EE"`, `"EG"`, `"EH"`, `"ER"`, `"ES"`, `"ET"`, `"EU"`, `"FI"`,
`"FJ"`, `"FK"`, `"FM"`, `"FO"`, `"FR"`, `"GA"`, `"GB"`, `"GD"`, `"GE"`,
`"GF"`, `"GG"`, `"GH"`, `"GI"`, `"GL"`, `"GM"`, `"GN"`, `"GP"`, `"GQ"`,
`"GR"`, `"GS"`, `"GT"`, `"GU"`, `"GW"`, `"GY"`, `"HK"`, `"HN"`, `"HR"`,
`"HT"`, `"HU"`, `"ID"`, `"IE"`, `"IL"`, `"IM"`, `"IN"`, `"IO"`, `"IQ"`,
`"IR"`, `"IS"`, `"IT"`, `"JE"`, `"JM"`, `"JO"`, `"JP"`, `"KE"`, `"KG"`,
`"KH"`, `"KI"`, `"KM"`, `"KN"`, `"KP"`, `"KR"`, `"KW"`, `"KY"`, `"KZ"`,
`"LA"`, `"LB"`, `"LC"`, `"LI"`, `"LK"`, `"LR"`, `"LS"`, `"LT"`, `"LU"`,
`"LV"`, `"LY"`, `"MA"`, `"MC"`, `"MD"`, `"ME"`, `"MF"`, `"MG"`, `"MH"`,
`"MK"`, `"ML"`, `"MM"`, `"MN"`, `"MO"`, `"MP"`, `"MQ"`, `"MR"`, `"MS"`,
`"MT"`, `"MU"`, `"MV"`, `"MW"`, `"MX"`, `"MY"`, `"MZ"`, `"NA"`, `"NC"`,
`"NE"`, `"NF"`, `"NG"`, `"NI"`, `"NL"`, `"NO"`, `"NP"`, `"NR"`, `"NU"`,
`"NZ"`, `"OM"`, `"PA"`, `"PE"`, `"PF"`, `"PG"`, `"PH"`, `"PK"`, `"PL"`,
`"PM"`, `"PN"`, `"PR"`, `"PS"`, `"PT"`, `"PW"`, `"PY"`, `"QA"`, `"RE"`,
`"RO"`, `"RS"`, `"RU"`, `"RW"`, `"SA"`, `"SB"`, `"SC"`, `"SD"`, `"SE"`,
`"SG"`, `"SI"`, `"SK"`, `"SL"`, `"SM"`, `"SN"`, `"SO"`, `"SR"`, `"SS"`,
`"ST"`, `"SV"`, `"SX"`, `"SY"`, `"SZ"`, `"TC"`, `"TD"`, `"TF"`, `"TG"`,
`"TH"`, `"TJ"`, `"TK"`, `"TL"`, `"TM"`, `"TN"`, `"TO"`, `"TR"`, `"TT"`,
`"TV"`, `"TW"`, `"TZ"`, `"UA"`, `"UG"`, `"US"`, `"UY"`, `"UZ"`, `"VA"`,
`"VC"`, `"VE"`, `"VG"`, `"VI"`, `"VN"`, `"VU"`, `"WF"`, `"WS"`, `"YE"`,
`"YT"`, `"ZA"`, `"ZM"`, and `"ZW"`.

You can view the entire set of supported flag icons as an informative
table by calling
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md).

## Examples

Use the [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
dataset to create a **gt** table. We will only include a few columns and
rows from that table. The `country_code_2` column has 2-letter country
codes in the format required for `fmt_flag()` and using that function
transforms the codes to circular flag icons.

    countrypops |>
      dplyr::filter(year == 2021) |>
      dplyr::filter(grepl("^S", country_name)) |>
      dplyr::arrange(country_name) |>
      dplyr::select(-country_name, -year) |>
      dplyr::slice_head(n = 10) |>
      gt() |>
      fmt_integer() |>
      fmt_flag(columns = country_code_2) |>
      fmt_country(columns = country_code_3) |>
      cols_label(
        country_code_2 = "",
        country_code_3 = "Country",
        population = "Population (2021)"
      )

![This image of a table was generated from the first code example in the
\`fmt_flag()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_flag_1.png)

Using [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
we can generate a table that provides populations every five years for
the Benelux countries (`"BE"`, `"NL"`, and `"LU"`). This requires some
manipulation with **dplyr** and **tidyr** before introducing the table
to **gt**. With `fmt_flag()` we can obtain flag icons in the
`country_code_2` column. After that, we can merge the flag icons into
the stub column, generating row labels that have a combination of icon
and text.

    countrypops |>
      dplyr::filter(country_code_2 %in% c("BE", "NL", "LU")) |>
      dplyr::filter(year %% 10 == 0) |>
      dplyr::select(country_name, country_code_2, year, population) |>
      tidyr::pivot_wider(names_from = year, values_from = population) |>
      dplyr::slice(1, 3, 2) |>
      gt(rowname_col = "country_name") |>
      tab_header(title = "Populations of the Benelux Countries") |>
      tab_spanner(columns = everything(), label = "Year") |>
      fmt_integer() |>
      fmt_flag(columns = country_code_2) |>
      cols_merge(
        columns = c(country_name, country_code_2),
        pattern = "{2} {1}"
      )

![This image of a table was generated from the second code example in
the \`fmt_flag()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_flag_2.png)

`fmt_flag()` works well even when there are multiple country codes
within the same cell. It can operate on comma-separated codes without
issue. When rendered to HTML, hovering over each of the flag icons
results in tooltip text showing the name of the country.

    countrypops |>
      dplyr::filter(year == 2021, population < 100000) |>
      dplyr::select(country_code_2, population) |>
      dplyr::mutate(population_class = cut(
        population,
        breaks = scales::breaks_pretty(n = 5)(population)
        )
      ) |>
      dplyr::group_by(population_class) |>
      dplyr::summarize(
        countries = paste0(country_code_2, collapse = ",")
      ) |>
      dplyr::arrange(desc(population_class)) |>
      gt() |>
      tab_header(title = "Countries with Small Populations") |>
      fmt_flag(columns = countries) |>
      fmt_bins(
        columns = population_class,
        fmt = ~ fmt_integer(., suffixing = TRUE)
      ) |>
      cols_label(
        population_class = "Population Range",
        countries = "Countries"
      ) |>
      cols_width(population_class ~ px(150))

![This image of a table was generated from the third code example in the
\`fmt_flag()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_flag_3.png)

## Function ID

3-25

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
