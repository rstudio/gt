# Format measurement units

`fmt_units()` lets you better format measurement units in the table
body. These must conform to **gt**'s specialized units notation (e.g.,
`"J Hz^-1 mol^-1"` can be used to generate units for the *molar Planck
constant*) for the best conversion. The notation here provides several
conveniences for defining units, so as long as the values to be
formatted conform to this syntax, you'll obtain nicely-formatted units
no matter what the table output format might be (i.e., HTML, LaTeX, RTF,
etc.). Details pertaining to the units notation can be found in the
section entitled *How to use **gt**'s units notation*.

## Usage

``` r
fmt_units(data, columns = everything(), rows = everything())
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

## Value

An object of class `gt_tbl`.

## How to use **gt**'s units notation

The units notation involves a shorthand of writing units that feels
familiar and is fine-tuned for the task at hand. Each unit is treated as
a separate entity (parentheses and other symbols included) and the
addition of subscript text and exponents is flexible and relatively easy
to formulate. This is all best shown with examples:

- `"m/s"` and `"m / s"` both render as `"m/s"`

- `"m s^-1"` will appear with the `"-1"` exponent intact

- `"m /s"` gives the same result, as `"/<unit>"` is equivalent to
  `"<unit>^-1"`

- `"E_h"` will render an `"E"` with the `"h"` subscript

- `"t_i^2.5"` provides a `t` with an `"i"` subscript and a `"2.5"`
  exponent

- `"m[_0^2]"` will use overstriking to set both scripts vertically

- `"g/L %C6H12O6%"` uses a chemical formula (enclosed in a pair of `"%"`
  characters) as a unit partial, and the formula will render correctly
  with subscripted numbers

- Common units that are difficult to write using ASCII text may be
  implicitly converted to the correct characters (e.g., the `"u"` in
  `"ug"`, `"um"`, `"uL"`, and `"umol"` will be converted to the Greek
  *mu* symbol; `"degC"` and `"degF"` will render a degree sign before
  the temperature unit)

- We can transform shorthand symbol/unit names enclosed in `":"` (e.g.,
  `":angstrom:"`, `":ohm:"`, etc.) into proper symbols

- Greek letters can added by enclosing the letter name in `":"`; you can
  use lowercase letters (e.g., `":beta:"`, `":sigma:"`, etc.) and
  uppercase letters too (e.g., `":Alpha:"`, `":Zeta:"`, etc.)

- The components of a unit (unit name, subscript, and exponent) can be
  fully or partially italicized/emboldened by surrounding text with
  `"*"` or `"**"`

## Examples

Let's use the [`illness`](https://gt.rstudio.com/reference/illness.md)
dataset and create a new **gt** table. The `units` column contains
character values in **gt**'s specialized units notation (e.g.,
`"x10^9 / L"`) so the `fmt_units()` function was used to better format
those units.

    illness |>
      gt() |>
      fmt_units(columns = units) |>
      sub_missing(columns = -starts_with("norm")) |>
      sub_missing(columns = c(starts_with("norm"), units), missing_text = "") |>
      sub_large_vals(rows = test == "MYO", threshold = 1200) |>
      fmt_number(
        decimals = 2,
        drop_trailing_zeros = TRUE
      ) |>
      tab_header(title = "Laboratory Findings for the YF Patient") |>
      tab_spanner(label = "Day", columns = starts_with("day")) |>
      cols_label_with(fn = ~ gsub("day_", "", .)) |>
      cols_merge_range(col_begin = norm_l, col_end = norm_u) |>
      cols_label(
        starts_with("norm") ~ "Normal Range",
        test ~ "Test",
        units ~ "Units"
      ) |>
      cols_width(
        starts_with("day") ~ px(80),
        everything() ~ px(120)
      ) |>
      tab_style(
        style = cell_text(align = "center"),
        locations = cells_column_labels(columns = starts_with("day"))
      ) |>
      tab_style(
        style = cell_fill(color = "aliceblue"),
        locations = cells_body(columns = c(test, units))
      ) |>
      opt_vertical_padding(scale = 0.4) |>
      opt_align_table_header(align = "left") |>
      tab_options(heading.padding = px(10))

![This image of a table was generated from the first code example in the
\`fmt_units()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_units_1.png)

The [`constants`](https://gt.rstudio.com/reference/constants.md) dataset
contains values for hundreds of fundamental physical constants. We'll
take a subset of values that have some molar basis and generate a **gt**
table from that. Like the
[`illness`](https://gt.rstudio.com/reference/illness.md) dataset, this
one has a `units` column so, again, the `fmt_units()` function will be
used to format those units. Here, the preference for typesetting
measurement units is to have positive and negative exponents (e.g., not
`"<unit_1> / <unit_2>"` but rather `"<unit_1> <unit_2>^-1"`).

    constants |>
      dplyr::filter(grepl("molar", name)) |>
      gt() |>
      cols_hide(columns = c(uncert, starts_with("sf"))) |>
      fmt_units(columns = units) |>
      fmt_scientific(columns = value, decimals = 3) |>
      tab_header(title = "Physical Constants Having a Molar Basis") |>
      tab_options(column_labels.hidden = TRUE)

![This image of a table was generated from the second code example in
the \`fmt_units()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_units_2.png)

## Function ID

3-20

## Function Introduced

`v0.10.0` (October 7, 2023)

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
[`fmt_tf()`](https://gt.rstudio.com/reference/fmt_tf.md),
[`fmt_time()`](https://gt.rstudio.com/reference/fmt_time.md),
[`fmt_url()`](https://gt.rstudio.com/reference/fmt_url.md),
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
