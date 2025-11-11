# Format URLs to generate links

Should cells contain URLs, `fmt_url()` can be used to make them
navigable links. This should be expressly used on columns that contain
*only* URL text (i.e., no URLs as part of a larger block of text).
Should you have such a column of data, there are options for how the
links should be styled. They can be of the conventional style (with
underlines and text coloring that sets it apart from other text), or,
they can appear to be button-like (with a surrounding box that can be
filled with a color of your choosing).

URLs in data cells are detected in two ways. The first is using the
simple Markdown notation for URLs of the form: `[label](URL)`. The
second assumes that the text is the URL. In the latter case the URL is
also used as the label but there is the option to use the `label`
argument to modify that text.

## Usage

``` r
fmt_url(
  data,
  columns = everything(),
  rows = everything(),
  label = NULL,
  as_button = FALSE,
  color = "auto",
  show_underline = "auto",
  button_fill = "auto",
  button_width = "auto",
  button_outline = "auto",
  target = NULL,
  rel = NULL,
  referrerpolicy = NULL,
  hreflang = NULL
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

- label:

  *Link label*

  `scalar<character>` // *default:* `NULL` (`optional`)

  The visible 'label' to use for the link. If `NULL` (the default) the
  URL will serve as the label. There are two non-`NULL` options: (1) a
  piece of static text can be used for the label by providing a string,
  and (2) a function can be provided to fashion a label from every URL.

- as_button:

  *Style link as a button*

  `scalar<logical>` // *default:* `FALSE`

  An option to style the link as a button. By default, this is `FALSE`.
  If this option is chosen then the `button_fill` argument becomes
  usable.

- color:

  *Link color*

  `scalar<character>` // *default:* `"auto"`

  The color used for the resulting link and its underline. This is
  `"auto"` by default; this allows **gt** to choose an appropriate color
  based on various factors (such as the background `button_fill` when
  `as_button` is `TRUE`).

- show_underline:

  *Show the link underline*

  `scalar<character>|scalar<logical>` // *default:* `"auto"`

  Should the link be decorated with an underline? By default this is
  `"auto"` which means that **gt** will choose `TRUE` when
  `as_button = FALSE` and `FALSE` in the other case. The link underline
  will be the same color as that set in the `color` option.

- button_fill, button_width, button_outline:

  *Button options*

  `scalar<character>` // *default:* `"auto"`

  Options for styling a link-as-button (and only applies if
  `as_button = TRUE`). All of these options are by default set to
  `"auto"`, allowing **gt** to choose appropriate fill, width, and
  outline values.

- target, rel, referrerpolicy, hreflang:

  *Anchor element attributes*

  `scalar<character>` // *default:* `NULL`

  Additional anchor element attributes. For descriptions of each
  attribute and the allowed values, refer to the [MDN Web Docs reference
  on the anchor HTML
  element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/a#attributes).

## Value

An object of class `gt_tbl`.

## Compatibility of formatting function with data values

`fmt_url()` is compatible with body cells that are of the `"character"`
or `"factor"` types. Any other types of body cells are ignored during
formatting. This is to say that cells of incompatible data types may be
targeted, but there will be no attempt to format them.

## Compatibility of arguments with the [`from_column()`](https://gt.rstudio.com/reference/from_column.md) helper function

[`from_column()`](https://gt.rstudio.com/reference/from_column.md) can
be used with certain arguments of `fmt_url()` to obtain varying
parameter values from a specified column within the table. This means
that each row could be formatted a little bit differently. These
arguments provide support for
[`from_column()`](https://gt.rstudio.com/reference/from_column.md):

- `label`

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

Using a portion of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset, let's
create a **gt** table. We can use `fmt_url()` on the `website` column to
generate navigable links to websites. By default the links are
underlined and the color will be chosen for you (it's dark cyan).

    towny |>
      dplyr::filter(csd_type == "city") |>
      dplyr::select(name, website, population_2021) |>
      dplyr::slice_max(population_2021, n = 10) |>
      gt() |>
      tab_header(
        title = md("The 10 Largest Municipalities in `towny`"),
        subtitle = "Population values taken from the 2021 census."
      ) |>
      fmt_integer() |>
      fmt_url(columns = website) |>
      cols_label(
        name = "Name",
        website = "Site",
        population_2021 = "Population"
      )

![This image of a table was generated from the first code example in the
\`fmt_url()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_url_1.png)

Let's try something else. We can set a static text label for the link
with the `label` argument (and we'll use the word `"site"` for this).
The link underline is removable with `show_underline = FALSE`. With this
change, it seems sensible to merge the link to the `"name"` column and
enclose the link text in parentheses
([`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
handles all that).

    towny |>
      dplyr::filter(csd_type == "city") |>
      dplyr::select(name, website, population_2021) |>
      dplyr::slice_max(population_2021, n = 10) |>
      gt() |>
      tab_header(
        title = md("The 10 Largest Municipalities in `towny`"),
        subtitle = "Population values taken from the 2021 census."
      ) |>
      fmt_integer() |>
      fmt_url(
        columns = website,
        label = "site",
        show_underline = FALSE
      ) |>
      cols_merge(
        columns = c(name, website),
        pattern = "{1} ({2})"
      ) |>
      cols_label(
        name = "Name",
        population_2021 = "Population"
      )

![This image of a table was generated from the second code example in
the \`fmt_url()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_url_2.png)

`fmt_url()` allows for the styling of links as 'buttons'. This is as
easy as setting `as_button = TRUE`. Doing that unlocks the ability to
set a `button_fill` color. This color can automatically selected by
**gt** (this is the default) but here we're using `"steelblue"`. The
`label` argument also accepts a function! We can choose to adapt the
label text from the URLs by eliminating any leading `"https://"` or
`"www."` parts.

    towny |>
      dplyr::filter(csd_type == "city") |>
      dplyr::select(name, website, population_2021) |>
      dplyr::slice_max(population_2021, n = 10) |>
      dplyr::mutate(ranking = dplyr::row_number()) |>
      gt(rowname_col = "ranking") |>
      tab_header(
        title = md("The 10 Largest Municipalities in `towny`"),
        subtitle = "Population values taken from the 2021 census."
      ) |>
      fmt_integer() |>
      fmt_url(
        columns = website,
        label = function(x) gsub("https://|www.", "", x),
        as_button = TRUE,
        button_fill = "steelblue",
        button_width = px(150)
      ) |>
      cols_move_to_end(columns = website) |>
      cols_align(align = "center", columns = website) |>
      cols_width(
        ranking ~ px(40),
        website ~ px(200)
      ) |>
      tab_options(column_labels.hidden = TRUE) |>
      tab_style(
        style = cell_text(weight = "bold"),
        locations = cells_stub()
      ) |>
      opt_vertical_padding(scale = 0.75)

![This image of a table was generated from the third code example in the
\`fmt_url()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_url_3.png)

It's perhaps inevitable that you'll come across missing values in your
column of URLs. `fmt_url()` will preserve input `NA` values, allowing
you to handle them with
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md).
Here's an example of that.

    towny |>
      dplyr::select(name, website, population_2021) |>
      dplyr::slice_min(population_2021, n = 10) |>
      gt() |>
      tab_header(
        title = md("The 10 Smallest Municipalities in `towny`"),
        subtitle = "Population values taken from the 2021 census."
      ) |>
      fmt_integer() |>
      fmt_url(columns = website) |>
      cols_label(
        name = "Name",
        website = "Site",
        population_2021 = "Population"
      ) |>
      sub_missing()

![This image of a table was generated from the fourth code example in
the \`fmt_url()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_url_4.png)

Links can be presented as icons. Let's take a look at an example of this
type of presentation with a table based on the
[`films`](https://gt.rstudio.com/reference/films.md) dataset. The
`imdb_url` column contains the URL information and in the `fmt_url()`
call, we can use
[`fontawesome::fa()`](https://rstudio.github.io/fontawesome/reference/fa.html)
to specify a `label`. In this case we elect to use the `"link"` icon and
we can make some sizing adjustments to the icon here to ensure the
layout looks optimal. We also use
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) to
combine the film's title, its original title (if present), and the link
icon.

    films |>
      dplyr::filter(year == 2021) |>
      dplyr::select(
        contains("title"), run_time, director, imdb_url
      ) |>
      gt() |>
      tab_header(title = "Feature Films in Competition at the 2021 Festival") |>
      fmt_url(
        columns = imdb_url,
        label = fontawesome::fa(
          name = "link",
          height = "0.75em",
          vertical_align = "0em"
         ),
        color = "gray65"
      ) |>
      cols_merge(
        columns = c(title, original_title, imdb_url),
        pattern = "{1}<< ({2})>> {3}"
      ) |>
      cols_label(
        title = "Film",
        run_time = "Length",
        director = "Director(s)",
      ) |>
      tab_options(heading.title.font.size = px(26)) |>
      opt_vertical_padding(scale = 0.4) |>
      opt_horizontal_padding(scale = 2) |>
      opt_align_table_header(align = "left")

![This image of a table was generated from the fifth code example in the
\`fmt_url()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_fmt_url_5.png)

## Function ID

3-22

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
[`sub_large_vals()`](https://gt.rstudio.com/reference/sub_large_vals.md),
[`sub_missing()`](https://gt.rstudio.com/reference/sub_missing.md),
[`sub_small_vals()`](https://gt.rstudio.com/reference/sub_small_vals.md),
[`sub_values()`](https://gt.rstudio.com/reference/sub_values.md),
[`sub_zero()`](https://gt.rstudio.com/reference/sub_zero.md)
