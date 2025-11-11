# Generate country names from their corresponding country codes

Tables that have comparable data between countries often need to have
the country name included. While this seems like a fairly simple task,
being consistent with country names is surprisingly difficult. The
`fmt_country()` function can help in this regard by supplying a country
name based on a 2- or 3-letter ISO 3166-1 country code (e.g., Singapore
has the `"SG"` country code). The resulting country names have been
obtained from the Unicode *CLDR* (Common Locale Data Repository), which
is a good source since all country names are agreed upon by consensus.
Furthermore, the country names can be localized through the `locale`
argument (either in this function or through the initial
[`gt()`](https://gt.rstudio.com/reference/gt.md) call).

Multiple country names can be included per cell by separating country
codes with commas (e.g., `"RO,BM"`). And it is okay if the codes are set
in either uppercase or lowercase letters. The `sep` argument allows for
a common separator to be applied between country names.

## Usage

``` r
fmt_country(
  data,
  columns = everything(),
  rows = everything(),
  pattern = "{x}",
  sep = " ",
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

- sep:

  *Separator between country names*

  `scalar<character>` // *default:* `" "`

  In the output of country names within a body cell, `sep` provides the
  separator between each instance. By default, this is a single space
  character (`" "`).

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

`fmt_country()` function is compatible with body cells that are of the
`"character"` or `"factor"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_country()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `pattern`

- `sep`

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

## Examples

The [`peeps`](https://gt.rstudio.com/reference/peeps.md) dataset will be
used to generate a small **gt** table containing only the people born in
the 1980s. The `country` column contains 3-letter country codes and
those will be transformed to country names with `fmt_country()`.

    peeps |>
      dplyr::filter(grepl("198", dob)) |>
      dplyr::select(name_given, name_family, country, dob) |>
      dplyr::arrange(country, name_family) |>
      gt() |>
      fmt_country(columns = country) |>
      cols_merge(columns = c(name_given, name_family)) |>
      opt_vertical_padding(scale = 0.5) |>
      tab_options(column_labels.hidden = TRUE)

![This image of a table was generated from the first code example in the
\`fmt_country()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_country_1.png)

Use the [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
dataset to create a **gt** table. We will only include a few columns and
rows from that table. The `country_code_3` column has 3-letter country
codes in the format required for `fmt_country()` and using that function
transforms the codes to country names.

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

![This image of a table was generated from the second code example in
the \`fmt_country()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_country_2.png)

The country names derived from country codes can be localized. Let's
translate some of those country names into three different languages
using different `locale` values in separate calls of `fmt_country()`.

    countrypops |>
      dplyr::filter(year == 2021) |>
      dplyr::arrange(desc(population)) |>
      dplyr::filter(
        dplyr::row_number() > max(dplyr::row_number()) - 5 |
        dplyr::row_number() <= 5
      ) |>
      dplyr::select(
        country_code_fl = country_code_2,
        country_code_2a = country_code_2,
        country_code_2b = country_code_2,
        country_code_2c = country_code_2,
        population
      ) |>
      gt(rowname_col = "country_code_fl") |>
      fmt_integer() |>
      fmt_flag(columns = stub()) |>
      fmt_country(columns = ends_with("a")) |>
      fmt_country(columns = ends_with("b"), locale = "ja") |>
      fmt_country(columns = ends_with("c"), locale = "ar") |>
      cols_label(
        ends_with("a") ~ "`en`",
        ends_with("b") ~ "`ja`",
        ends_with("c") ~ "`ar`",
        population = "Population",
        .fn = md
      ) |>
      tab_spanner(
        label = "Country name in specified locale",
        columns = matches("2a|2b|2c")
      ) |>
      cols_align(align = "center", columns = matches("2a|2b|2c")) |>
      opt_horizontal_padding(scale = 2)

![This image of a table was generated from the third code example in the
\`fmt_country()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_country_3.png)

Let's make another **gt** table, this time using the
[`films`](https://gt.rstudio.com/reference/films.md) dataset. The
`countries_of_origin` column contains 2-letter country codes and some
cells contain multiple countries (separated by commas). We'll use
`fmt_country()` on that column and also specify that the rendered
country names should be separated by a comma and a space character. Also
note that historical country codes like `"SU"` ('USSR'), `"CS"`
('Czechoslovakia'), and `"YU"` ('Yugoslavia') are permitted as inputs
for `fmt_country()`.

    films |>
      dplyr::filter(year == 1959) |>
      dplyr::select(
        contains("title"), run_time, director, countries_of_origin, imdb_url
      ) |>
      gt() |>
      tab_header(title = "Feature Films in Competition at the 1959 Festival") |>
      fmt_country(columns = countries_of_origin, sep = ", ") |>
      fmt_url(
        columns = imdb_url,
        label = fontawesome::fa("imdb", fill = "black")
      ) |>
      cols_merge(
        columns = c(title, original_title, imdb_url),
        pattern = "{1}<< ({2})>> {3}"
      ) |>
      cols_label(
        title = "Film",
        run_time = "Length",
        director = "Director",
        countries_of_origin = "Country"
      ) |>
      opt_vertical_padding(scale = 0.5) |>
      opt_table_font(stack = "classical-humanist", weight = "bold") |>
      opt_stylize(style = 1, color = "gray") |>
      tab_options(heading.title.font.size = px(26))

![This image of a table was generated from the fourth code example in
the \`fmt_country()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_country_4.png)

Country names can sometimes pair nicely with flag-based graphics. In
this example (using a different portion of the
[`films`](https://gt.rstudio.com/reference/films.md) dataset) we use
`fmt_country()` along with
[`fmt_flag()`](https://gt.rstudio.com/reference/fmt_flag.md). The
formatted country names are then merged into the same cells as the icons
via [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md).

    films |>
      dplyr::filter(director == "Jean-Pierre Dardenne, Luc Dardenne") |>
      dplyr::select(title, year, run_time, countries_of_origin) |>
      gt() |>
      tab_header(title = "In Competition Films by the Dardenne Bros.") |>
      cols_add(country_flag = countries_of_origin) |>
      fmt_flag(columns = country_flag) |>
      fmt_country(columns = countries_of_origin, sep = ", ") |>
      cols_merge(
        columns = c(countries_of_origin, country_flag),
        pattern = "{2}<br>{1}"
      ) |>
      tab_style(
        style = cell_text(size = px(9)),
        locations = cells_body(columns = countries_of_origin)
      ) |>
      cols_merge(columns = c(title, year), pattern = "{1} ({2})") |>
      opt_vertical_padding(scale = 0.5) |>
      opt_horizontal_padding(scale = 3) |>
      opt_table_font(font = google_font("PT Sans")) |>
      opt_stylize(style = 1, color = "blue") |>
      tab_options(
        heading.title.font.size = px(26),
        column_labels.hidden = TRUE
      )

![This image of a table was generated from the fifth code example in the
\`fmt_country()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_country_5.png)

## Function ID

3-26

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
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_units()`](https://gt.rstudio.com/reference/fmt_units.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
