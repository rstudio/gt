# Format email addresses to generate 'mailto:' links

Should cells contain email addresses, `fmt_email()` can be used to make
email addresses work well with email clients on the user system. This
should be expressly used on columns that contain *only* email addresses
(i.e., no email addresses as part of a larger block of text). Should you
have such a column of data, there are options for how the email
addresses should be styled. They can be of the conventional style (with
underlines and text coloring that sets it apart from other text), or,
they can appear to be button-like (with a surrounding box that can be
filled with a color of your choosing).

Email addresses in data cells are trusted as email addresses. We can
also provide more readable labels with the `display_name` argument.
Supplying a single value there will show the same label for all email
addresses but display names from an adjacent column could be used via a
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) call
within `display_name`.

## Usage

``` r
fmt_email(
  data,
  columns = everything(),
  rows = everything(),
  display_name = NULL,
  as_button = FALSE,
  color = "auto",
  show_underline = "auto",
  button_fill = "auto",
  button_width = "auto",
  button_outline = "auto",
  target = NULL
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

- display_name:

  *Display name for the email address*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The display name is the visible 'label' to use for the email address.
  If `NULL` (the default) the address itself will serve as the display
  name. There are two non-`NULL` options: (1) a piece of static text can
  be used for the display name by providing a string, and (2) a function
  can be provided to fashion a display name from every email address.

- as_button:

  *Style email address as a button*

  `scalar<logical>` // *default:* `FALSE`

  An option to style the email address as a button. By default, this is
  `FALSE`. If this option is chosen then the `button_fill` argument
  becomes usable.

- color:

  *Link color*

  `scalar<character>` // *default:* `"auto"`

  The color used for the resulting email address and its underline. This
  is `"auto"` by default; this allows **gt** to choose an appropriate
  color based on various factors (such as the background `button_fill`
  when `as_button` is `TRUE`).

- show_underline:

  *Show the link underline*

  `scalar<character>|scalar<logical>` // *default:* `"auto"`

  Should the email address be decorated with an underline? By default
  this is `"auto"` which means that **gt** will choose `TRUE` when
  `as_button = FALSE` and `FALSE` in the other case. The underline will
  be the same color as that set in the `color` option.

- button_fill, button_width, button_outline:

  *Button options*

  `scalar<character>` // *default:* `"auto"`

  Options for styling an email address as a button (and only applies if
  `as_button = TRUE`). All of these options are by default set to
  `"auto"`, allowing **gt** to choose appropriate fill, width, and
  outline values.

- target:

  *The 'target' anchor element attribute*

  `scalar<character>` // *default:* `NULL`

  The anchor element 'target' attribute value. For a description of the
  'target' attribute and its allowed values, refer to the [MDN Web Docs
  reference on the anchor HTML
  element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attributes).

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_email()` is compatible with body cells that are of the
`"character"` or `"factor"` types. Any other types of body cells are
ignored during formatting. This is to say that cells of incompatible
data types may be targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_email()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `display_name`

- `as_button`

- `color`

- `show_underline`

- `button_fill`

- `button_width`

- `button_outline`

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

## Examples

Let's take ten rows from the
[`peeps`](https://gt.rstudio.com/reference/peeps.md) dataset and create
a table of contact information with mailing addresses and email
addresses. With the column that contains email addresses (`email_addr`),
we can use `fmt_email()` to generate 'mailto:' links. Clicking any of
these formatted email addresses should result in new message creation
(depending on the OS integration with an email client).

    peeps |>
      dplyr::filter(country == "AUS") |>
      dplyr::select(
        starts_with("name"),
        address, city, state_prov, postcode, country, email_addr
      ) |>
      dplyr::mutate(city = toupper(city)) |>
      gt(rowname_col = "name_family") |>
      tab_header(title = "Our Contacts in Australia") |>
      tab_stubhead(label = "Name") |>
      fmt_email(columns = email_addr) |>
      fmt_country(columns = country) |>
      cols_merge(
        columns = c(address, city, state_prov, postcode, country),
        pattern = "{1}<br>{2} {3} {4}<br>{5}"
      ) |>
      cols_merge(
        columns = c(name_family, name_given),
        pattern = "{1},<br>{2}"
      ) |>
      cols_label(
        address = "Mailing Address",
        email_addr = "Email"
      ) |>
      tab_style(
        style = cell_text(size = "x-small"),
        locations = cells_body(columns = address)
      ) |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the first code example in the
\`fmt_email()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_email_1.png)

We can further condense the table by reducing the email link to an icon.
The approach we take here is the use of a **fontawesome** icon within
the `display_name` argument. The icon used is `"envelope"` and each icon
produced serves as a clickable 'mailto:' link. By adjusting one of the
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) calls,
we can place the icon/link next to the name of the person.

    peeps |>
      dplyr::filter(country == "AUS") |>
      dplyr::select(
        starts_with("name"),
        address, city, state_prov, postcode, country, email_addr
      ) |>
      dplyr::mutate(city = toupper(city)) |>
      gt(rowname_col = "name_family") |>
      tab_header(title = "Our Contacts in Australia") |>
      fmt_email(
        columns = email_addr,
        display_name = fontawesome::fa(
          name = "envelope",
          height = "0.75em",
          fill = "gray"
        )
      ) |>
      fmt_country(columns = country) |>
      cols_merge(
        columns = c(address, city, state_prov, postcode, country),
        pattern = "{1}<br>{2} {3} {4}<br>{5}"
      ) |>
      cols_merge(
        columns = c(name_family, name_given, email_addr),
        pattern = "{1}, {2} {3}"
      ) |>
      cols_width(everything() ~ px(200)) |>
      tab_style(
        style = cell_text(size = px(11)),
        locations = cells_body(columns = address)
      ) |>
      tab_options(column_labels.hidden = TRUE) |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the second code example in
the \`fmt_email()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_email_2.png)

Another option is to display the names of the email recipients instead
of the email addresses, making the display names serve as 'mailto:'
links. We can do this by using
[`from_column()`](https://gt.rstudio.com/reference/from_column.md) in
the `display_name` argument. The display names in this case are the
combined given and family names, handled earlier through a
[`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
call. With some space conserved, we take the opportunity here to add in
phone information for each person.

    peeps |>
      dplyr::filter(country == "AUS") |>
      dplyr::mutate(name = paste(name_given, name_family)) |>
      dplyr::mutate(city = toupper(city)) |>
      dplyr::mutate(phone_number = gsub("^\\(0|\\)", "", phone_number)) |>
      dplyr::select(
        name, address, city, state_prov, postcode, country,
        email_addr, phone_number, country_code
      ) |>
      gt(rowname_col = "email_addr") |>
      tab_header(title = "Our Contacts in Australia") |>
      tab_stubhead(label = "Name") |>
      fmt_email(
        columns = email_addr,
        display_name = from_column("name"),
        color = "gray25"
      ) |>
      cols_hide(columns = name) |>
      fmt_country(columns = country) |>
      cols_merge(
        columns = c(address, city, state_prov, postcode, country),
        pattern = "{1}<br>{2} {3} {4}<br>{5}"
      ) |>
      cols_merge(
        columns = c(phone_number, country_code),
        pattern = "+{2} {1}"
      ) |>
      cols_label(
        address = "Mailing Address",
        email_addr = "Email",
        phone_number = "Phone"
      ) |>
      cols_move_to_start(columns = phone_number) |>
      cols_width(everything() ~ px(170)) |>
      tab_style(
        style = cell_text(size = px(11)),
        locations = cells_body(columns = address)
      ) |>
      cols_align(align = "left") |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the third code example in the
\`fmt_email()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_email_3.png)

## Function ID

3-23

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
