# Add a spanner label

With `tab_spanner()`, you can insert a spanner in the column labels part
of a **gt** table. This part of the table contains, at a minimum, column
labels and, optionally, an unlimited number of levels for spanners. A
spanner will occupy space over any number of contiguous column labels
and it will have an associated label and ID value. This function allows
for mapping to be defined by column names, existing spanner ID values,
or a mixture of both. The spanners are placed in the order of calling
`tab_spanner()` so if a later call uses the same columns in its
definition (or even a subset) as the first invocation, the second
spanner will be overlaid atop the first. Options exist for forcibly
inserting a spanner underneath other (with `level` as space permits) and
with `replace`, which allows for full or partial spanner replacement.

## Usage

``` r
tab_spanner(
  data,
  label,
  columns = NULL,
  spanners = NULL,
  level = NULL,
  id = label,
  gather = TRUE,
  replace = FALSE
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- label:

  *Spanner label text*

  `scalar<character>` // **required**

  The text to use for the spanner label. We can optionally use
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) to style the text
  as Markdown or to retain HTML elements in the text.

- columns:

  *Columns to target*

  `<column-targeting expression>` // *default:* `NULL` (`optional`)

  The columns to serve as components of the spanner. Can either be a
  series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  This argument works in tandem with the `spanners` argument.

- spanners:

  *Spanners to target*

  `vector<character>` // *default:* `NULL` (`optional`)

  The spanners that should be spanned over, should they already be
  defined. One or more spanner ID values (in quotes) can be supplied
  here. This argument works in tandem with the `columns` argument.

- level:

  *Spanner level for insertion*

  `scalar<numeric|integer>` // *default:* `NULL` (`optional`)

  An explicit level to which the spanner should be placed. If not
  provided, **gt** will choose the level based on the inputs provided
  within `columns` and `spanners`, placing the spanner label where it
  will fit. The first spanner level (right above the column labels) is
  `1`.

  In combination with
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
  or `ihtml.active = TRUE` in
  [`tab_options()`](https://gt.rstudio.com/reference/tab_options.md)
  only level `1` is supported, additional levels would be discarded.

- id:

  *Spanner ID*

  `scalar<character>` // *default:* `label`

  The ID for the spanner. When accessing a spanner through the
  `spanners` argument of `tab_spanner()` or
  [`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md)
  (when using
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) or
  [`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md))
  the `id` value is used as the reference (and not the `label`). If an
  `id` is not explicitly provided here, it will be taken from the
  `label` value. It is advisable to set an explicit `id` value if you
  plan to access this cell in a later function call and the label text
  is complicated (e.g., contains markup, is lengthy, or both). Finally,
  when providing an `id` value you must ensure that it is unique across
  all ID values set for spanner labels (the function will stop if `id`
  isn't unique).

- gather:

  *Gather columns together*

  `scalar<logical>` // *default:* `TRUE`

  An option to move the specified `columns` such that they are unified
  under the spanner. Ordering of the moved-into-place columns will be
  preserved in all cases. By default, this is set to `TRUE`.

- replace:

  *Replace existing spanners*

  `scalar<logical>` // *default:* `FALSE`

  Should new spanners be allowed to partially or fully replace existing
  spanners? (This is a possibility if setting spanners at an already
  populated `level`.) By default, this is set to `FALSE` and an error
  will occur if some replacement is attempted.

## Value

An object of class `gt_tbl`.

## Targeting columns with the `columns` argument

The `columns` argument allows us to target a subset of columns contained
in the table. We can declare column names in
[`c()`](https://rdrr.io/r/base/c.html) (with bare column names or names
in quotes) or we can use **tidyselect**-style expressions. This can be
as basic as supplying a select helper like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
or, providing a more complex incantation like

`where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any `NA`s from consideration).

## Details on spanner placement

Let's take a hypothetical table that includes the following column names
in order from left to right: `year`, `len.pop`, `m.pop`, `len.dens`, and
`m.dens`. We'd like to have some useful spanners, but don't want to have
any over the `year` column (so we'll avoid using that column when
defining spanners). Let's start by creating a schematic representation
of what is wanted in terms of spanners:

           | ------- `"Two Provinces of Ireland"` ------ <- level 2 spanner
           | ---- `"Leinster"` ---- | --- `"Munster"` -- <- level 1 spanners
    `year` | `len.pop` | `len.dens` | `m.pop` | `m.dens` <- column names
    ----------------------------------------------------

To make this arrangement happen, we need three separate calls of
`tab_spanner()`:

- `tab_spanner(., label = "Leinster", columns = starts_with("len"))`

- `tab_spanner(., label = "Munster", columns = starts_with("m"))`

- `tab_spanner(., label = "Two Provinces of Ireland", columns = -year)`

This will give us the spanners we need with the appropriate labels. The
ID values will be derived from the labels in this case, but they can
directly supplied via the `id` argument.

An important thing to keep aware of is that the order of calls matters.
The first two can be in any order but the third one *must* happen last
since we build spanners from the bottom up. Also note that the first
calls will rearrange columns! This is by design as the `gather = TRUE`
default will purposefully gather columns together so that the columns
will be united under a single spanner. More complex definitions of
spanners can be performed and the *Examples* section demonstrates some
of the more advanced calls of `tab_spanner()`.

As a final note, the column labels (by default deriving from the column
names) will likely need to change and that's especially true in the
above case. This can be done with either of
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) or
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md).

## Incorporating units with **gt**'s units notation

Measurement units are often seen as part of spanner labels and indeed it
can be much more straightforward to include them here rather than using
other devices to make readers aware of units for specific columns. Any
text pertaining units is to be defined alongside the spanner label. To
do this, we have to surround the portion of text in the label that
corresponds to the units definition with `"{{"`/`"}}"`.

Now that we know how to mark text for units definition, we know need to
know how to write proper units with the notation. Such notation uses a
succinct method of writing units and it should feel somewhat familiar
though it is particular to the task at hand. Each unit is treated as a
separate entity (parentheses and other symbols included) and the
addition of subscript text and exponents is flexible and relatively easy
to formulate. This is all best shown with a few examples:

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

Let's create a **gt** table using a small portion of the
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md) dataset. Over
several columns (`hp`, `hp_rpm`, `trq`, `trq_rpm`, `mpg_c`, `mpg_h`)
we'll use `tab_spanner()` to add a spanner with the label
`"performance"`. This effectively groups together several columns
related to car performance under a unifying label.

    gtcars |>
      dplyr::select(
        -mfr, -trim, bdy_style,
        -drivetrain, -trsmn, -ctry_origin
      ) |>
      dplyr::slice(1:8) |>
      gt(rowname_col = "model") |>
      tab_spanner(
        label = "performance",
        columns = c(
          hp, hp_rpm, trq, trq_rpm, mpg_c, mpg_h
        )
      )

![This image of a table was generated from the first code example in the
\`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_1.png)

With the default `gather = TRUE` option, columns selected for a
particular spanner will be moved so that there is no separation between
them. This can be seen with the example below that uses a subset of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset. The
starting column order is `name`, `latitude`, `longitude`,
`population_2016`, `density_2016`, `population_2021`, and
`density_2021`. The first two uses of `tab_spanner()` deal with making
separate spanners for the two population and two density columns. After
their use, the columns are moved to this new ordering: `name`,
`latitude`, `longitude`, `population_2016`, `population_2021`,
`density_2016`, and `density_2021`. The third and final call of
`tab_spanner()` doesn't further affect the ordering of columns.

    towny |>
      dplyr::slice_max(population_2021, n = 5) |>
      dplyr::select(
        name, latitude, longitude,
        ends_with("2016"), ends_with("2021")
      ) |>
      gt() |>
      tab_spanner(
        label = "Population",
        columns = starts_with("pop")
      ) |>
      tab_spanner(
        label = "Density",
        columns = starts_with("den")
      ) |>
      tab_spanner(
        label = md("*Location*"),
        columns = ends_with("itude"),
        id = "loc"
      )

![This image of a table was generated from the second code example in
the \`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_2.png)

While columns are moved, it is only the minimal amount of moving
required (pulling in columns from the right) to ensure that columns are
gathered under the appropriate spanners. With the last call, there are
two more things to note: (1) `label` values can use the
[`md()`](https://gt.rstudio.com/reference/md.md) (or
[`html()`](https://gt.rstudio.com/reference/html.md)) helper functions
to help create styled text, and (2) an `id` value may be supplied for
reference later (e.g., for styling with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) or
applying footnotes with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)).

It's possible to stack multiple spanners atop each other with
consecutive calls of `tab_spanner()`. It's a bit like playing Tetris:
putting a spanner down anywhere there is another spanner (i.e., there
are one or more shared columns) means that second spanner will reside a
level above the prior. Let's look at a few examples to see how this
works, and we'll also explore a few lesser-known placement tricks. We'll
use a cut down version of
[`exibble`](https://gt.rstudio.com/reference/exibble.md) for this, set
up a few level-`1` spanners, and then place a level-`2` spanner over two
other spanners.

    exibble_narrow <- exibble |> dplyr::slice_head(n = 3)

    exibble_narrow |>
      gt() |>
      tab_spanner(
        label = "Row Information",
        columns = c(row, group)
      ) |>
      tab_spanner(
        label = "Numeric Values",
        columns = where(is.numeric),
        id = "num_spanner"
      ) |>
      tab_spanner(
        label = "Text Values",
        columns = c(char, fctr),
        id = "text_spanner"
      ) |>
      tab_spanner(
        label = "Numbers and Text",
        spanners = c("num_spanner", "text_spanner")
      )

![This image of a table was generated from the third code example in the
\`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_3.png)

In the above example, we used the `spanners` argument to define where
the `"Numbers and Text"`-labeled spanner should reside. For that, we
supplied the `"num_spanner"` and `"text_spanner"` ID values for the two
spanners associated with the `num`, `currency`, `char`, and `fctr`
columns. Alternatively, we could have given those column names to the
`columns` argument and achieved the same result. You could actually use
a combination of `spanners` and `columns` to define where the spanner
should be placed. Here is an example of just that:

    exibble_narrow_gt <-
      exibble_narrow |>
      gt() |>
      tab_spanner(
        label = "Numeric Values",
        columns = where(is.numeric),
        id = "num_spanner"
      ) |>
      tab_spanner(
        label = "Text Values",
        columns = c(char, fctr),
        id = "text_spanner"
      ) |>
      tab_spanner(
        label = "Text, Dates, Times, Datetimes",
        columns = contains(c("date", "time")),
        spanners = "text_spanner"
      )

    exibble_narrow_gt

![This image of a table was generated from the fourth code example in
the \`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_4.png)

And, again, we could have solely supplied all of the column names to
`columns` instead of using this hybrid approach, but it is interesting
to express the definition of spanners with this flexible combination.

What if you wanted to extend the above example and place a spanner above
the `date`, `time`, and `datetime` columns? If you tried that in the
manner as exemplified above, the spanner will be placed in the third
level of spanners:

    exibble_narrow_gt |>
      tab_spanner(
        label = "Date and Time Columns",
        columns = contains(c("date", "time")),
        id = "date_time_spanner"
      )

![This image of a table was generated from the fifth code example in the
\`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_5.png)

Remember that the approach taken by `tab_spanner()` is to keep stacking
atop existing spanners. But, there is space next to the `"Text Values"`
spanner on the first level. You can either revise the order of
`tab_spanner()` calls, or, use the `level` argument to force the spanner
into that level (so long as there is space).

    exibble_narrow_gt |>
      tab_spanner(
        label = "Date and Time Columns",
        columns = contains(c("date", "time")),
        level = 1,
        id = "date_time_spanner"
      )

![This image of a table was generated from the sixth code example in the
\`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_6.png)

That puts the spanner in the intended level. If there aren't free
locations available in the `level` specified you'll get an error stating
which columns cannot be used for the new spanner (this can be
circumvented, if necessary, with the `replace = TRUE` option). If you
choose a level higher than the maximum occupied, then the spanner will
be dropped down. Again, these behaviors are indicative of Tetris-like
rules which tend to work well for the application of spanners.

Using a subset of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset, we can
create an interesting **gt** table. First, only certain columns are
selected from the dataset, some filtering of rows is done, rows are
sorted, and then only the first 10 rows are kept. After the data is
introduced to [`gt()`](https://gt.rstudio.com/reference/gt.md), we then
apply some spanner labels using two calls of `tab_spanner()`. In the
second of those, we incorporate unit notation text (within
`"{{"`/`"}}"`) in the `label` to get a display of nicely-formatted
units.

    towny |>
      dplyr::select(
        name, ends_with(c("2001", "2006")), matches("2001_2006")
      ) |>
      dplyr::filter(population_2001 > 100000) |>
      dplyr::slice_max(pop_change_2001_2006_pct, n = 10) |>
      gt() |>
      fmt_integer() |>
      fmt_percent(columns = matches("change"), decimals = 1) |>
      tab_spanner(
        label = "Population",
        columns = starts_with("pop")
      ) |>
      tab_spanner(
        label = "Density, {{*persons* km^-2}}",
        columns = starts_with("density")
      ) |>
      cols_label(
        ends_with("01") ~ "2001",
        ends_with("06") ~ "2006",
        matches("change") ~ md("Population Change,<br>2001 to 2006")
      ) |>
      cols_width(everything() ~ px(120))

![This image of a table was generated from the seventh code example in
the \`tab_spanner()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_7.png)

## Function ID

2-2

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md)
to create spanners and new column labels with delimited column names.

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner_delim()`](https://gt.rstudio.com/reference/tab_spanner_delim.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
