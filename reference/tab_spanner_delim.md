# Create column labels and spanners via delimited column names

`tab_spanner_delim()` can take specially-crafted column names and
generate one or more spanners (and revise column labels at the same
time). This is done by splitting the column name by the specified
delimiter text (`delim`) and placing the fragments from top to bottom
(i.e., higher-level spanners to the column labels) or vice versa.
Furthermore, neighboring text fragments on different spanner levels that
have the same text will be coalesced together. For instance, having the
three side-by-side column names `rating_1`, `rating_2`, and `rating_3`
will (in the default case at least) result in a spanner with the label
`"rating"` above columns with the labels `"1"`, `"2"`, and `"3"`. There
are many options in `cols_spanner_delim()` to slice and dice delimited
column names in different ways:

- delimiter text: choose the delimiter text to use for the fragmentation
  of column names into spanners with the `delim` argument

- direction and amount of splitting: we can choose to split *n* times
  according to a `limit` argument, and, we get to specify from which
  side of the column name the splitting should commence

- reversal of fragments: we can reverse the order the fragments we get
  from the splitting procedure with the `reverse` argument

- column constraints: it's possible to constrain which columns in a
  **gt** table should participate in spanner creation using vectors or
  **tidyselect**-style expressions

## Usage

``` r
tab_spanner_delim(
  data,
  delim,
  columns = everything(),
  split = c("last", "first"),
  limit = NULL,
  reverse = FALSE
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- delim:

  *Delimiter for splitting*

  `scalar<character>` // **required**

  The delimiter text to use to split one of more column names (i.e.,
  those that are targeted via the `columns` argument).

- columns:

  *Columns to target*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns to consider for the splitting, relabeling, and spanner
  setting operations. Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.,
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- split:

  *Splitting side*

  `singl-kw:[last|first]` // *default:* `"last"`

  Should the delimiter splitting occur from the `"last"` instance of the
  `delim` character or from the `"first"`? The default here uses the
  `"last"` keyword, and splitting begins at the last instance of the
  delimiter in the column name. This option only has some consequence
  when there is a `limit` value applied that is lesser than the number
  of delimiter characters for a given column name (i.e., number of
  splits is not the maximum possible number).

- limit:

  *Limit for splitting*

  `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)

  An optional limit to place on the splitting procedure. The default
  `NULL` means that a column name will be split as many times are there
  are delimiter characters. In other words, the default means there is
  no limit. If an integer value is given to `limit` then splitting will
  cease at the iteration given by `limit`. This works in tandem with
  `split` since we can adjust the number of splits from either the right
  side (`split = "last"`) or left side (`split = "first"`) of the column
  name.

- reverse:

  *Reverse vector of split names*

  `scalar<logical>` // *default:* `FALSE`

  Should the order of split names be reversed? By default, this is
  `FALSE`.

## Value

An object of class `gt_tbl`.

## Details on column splitting

If we take a hypothetical table that includes the column names
`province.NL_ZH.pop`, `province.NL_ZH.gdp`, `province.NL_NH.pop`, and
`province.NL_NH.gdp`, we can see that we have a naming system that has a
well-defined structure. We start with the more general to the left
(`"province"`) and move to the more specific on the right (`"pop"`). If
the columns are in the table in this exact order, then things are in an
ideal state as the eventual spanner labels will form from this
neighboring. When using `tab_spanner_delim()` here with `delim` set as
`"."` we get the following text fragments:

- `province.NL_ZH.pop` -\> `"province"`, `"NL_ZH"`, `"pop"`

- `province.NL_ZH.gdp` -\> `"province"`, `"NL_ZH"`, `"gdp"`

- `province.NL_NH.pop` -\> `"province"`, `"NL_NH"`, `"pop"`

- `province.NL_NH.gdp` -\> `"province"`, `"NL_NH"`, `"gdp"`

This gives us the following arrangement of column labels and spanner
labels:

    --------- `"province"` ---------- <- level 2 spanner
    ---`"NL_ZH"`--- | ---`"NL_NH"`--- <- level 1 spanners
    `"pop"`|`"gdp"` | `"pop"`|`"gdp"` <- column labels
    ---------------------------------

There might be situations where the same delimiter is used throughout
but only the last instance requires a splitting. With a pair of column
names like `north_holland_pop` and `north_holland_area` you would only
want `"pop"` and `"area"` to be column labels underneath a single
spanner (`"north_holland"`). To achieve this, the `split` and `limit`
arguments are used and the values for each need to be `split = "last"`
and `limit = 1`. This will give us the following arrangement:

    --`"north_holland"`-- <- level 1 spanner
     `"pop"`  |  `"area"` <- column labels
    ---------------------

## Examples

With a subset of the
[`towny`](https://gt.rstudio.com/reference/towny.md) dataset, we can
create a **gt** table and then use `tab_spanner_delim()` to
automatically generate column spanner labels. In this case we have some
column names in the form `population_<year>`. The underscore character
is the delimiter that separates a common word `"population"` and a year
value. In this default way of splitting, fragments to the right are
lowest (really they become new column labels) and moving left we get
spanners. Let's have a look at how `tab_spanner_delim()` handles these
column names:

    towny_subset_gt <-
      towny |>
      dplyr::select(name, starts_with("population")) |>
      dplyr::filter(grepl("^F", name)) |>
      gt() |>
      tab_spanner_delim(delim = "_") |>
      fmt_integer()

    towny_subset_gt

![This image of a table was generated from the first code example in the
\`tab_spanner_delim()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_delim_1.png)

The spanner created through this use of `tab_spanner_delim()` is
automatically given an ID value by **gt**. Because it's hard to know
what the ID value is, we can use
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md) to inspect
the table's indices and ID values.

    towny_subset_gt |> tab_info()

![This image of a table was generated from the second code example in
the \`tab_spanner_delim()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_delim_2.png)

From this informational table, we see that the ID for the spanner is
`"spanner-population_1996"`. Also, the columns are still accessible by
the original column names (`tab_spanner_delim()` did change their labels
though). Let's use
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) along
with
[`cells_column_spanners()`](https://gt.rstudio.com/reference/cells_column_spanners.md)
to add some styling to the spanner label of the `towny_subset_gt` table.

    towny_subset_gt |>
      tab_style(
        style = cell_text(weight = "bold", transform = "capitalize"),
        locations = cells_column_spanners(spanners = "spanner-population_1996")
      )

![This image of a table was generated from the third code example in the
\`tab_spanner_delim()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_delim_3.png)

We can plan ahead a bit and refashion the column names with **dplyr**
before introducing the table to
[`gt()`](https://gt.rstudio.com/reference/gt.md) and
`tab_spanner_delim()`. Here the column labels have underscore delimiters
where splitting is not wanted (so a period or space character is used
instead). The usage of `tab_spanner_delim()` gives two levels of
spanners. We can further touch up the labels after that with
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md)
and
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md).

    towny |>
      dplyr::slice_max(population_2021, n = 5) |>
      dplyr::select(name, ends_with("pct")) |>
      dplyr::rename_with(
        .fn = function(x) {
          x |>
            sub("pop_change_", "Population Change.", x = _) |>
            sub("_pct", ".pct", x = _)
        }
      ) |>
      gt(rowname_col = "name") |>
      tab_spanner_delim(delim = ".") |>
      fmt_number(decimals = 1, scale_by = 100) |>
      cols_label_with(
        fn = function(x) gsub("pct", "%", x)
      ) |>
      text_transform(
        fn = function(x) gsub("_", " - ", x, fixed = TRUE),
        locations = cells_column_spanners()
      ) |>
      tab_style(
        style = cell_text(align = "center"),
        locations = cells_column_labels()
      ) |>
      tab_style(
        style = "padding-right: 36px;",
        locations = cells_body()
      )

![This image of a table was generated from the fourth code example in
the \`tab_spanner_delim()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_delim_4.png)

With a summarized, filtered, and pivoted version of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
we can create another **gt** table and then use `tab_spanner_delim()`
with the delimiter/separator also used in
[`tidyr::pivot_wider()`](https://tidyr.tidyverse.org/reference/pivot_wider.html).
We can also process the generated column labels with
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md).

    pizzaplace |>
      dplyr::select(name, date, type, price) |>
      dplyr::group_by(name, date, type) |>
      dplyr::summarize(
        revenue = sum(price),
        sold = dplyr::n(),
        .groups = "drop"
      ) |>
      dplyr::filter(date %in% c("2015-01-01", "2015-01-02", "2015-01-03")) |>
      dplyr::filter(type %in% c("classic", "veggie")) |>
      tidyr::pivot_wider(
        names_from = date,
        names_sep = ".",
        values_from = c(revenue, sold),
        values_fn = sum,
        names_sort = TRUE
      ) |>
      gt(rowname_col = "name", groupname_col = "type") |>
      tab_spanner_delim(delim = ".") |>
      sub_missing(missing_text = "") |>
      fmt_currency(columns = starts_with("revenue")) |>
      data_color(
        columns = starts_with("revenue"),
        method = "numeric",
        palette = c("white", "lightgreen")
      ) |>
      cols_label_with(
        fn = function(x) {
          paste0(x, " (", vec_fmt_datetime(x, format = "E"), ")")
        }
      )

![This image of a table was generated from the fifth code example in the
\`tab_spanner_delim()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_tab_spanner_delim_5.png)

## Function ID

2-3

## Function Introduced

`v0.2.0.5` (March 31, 2020)

## See also

[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md) to
manually create spanners with more control over spanner labels.

Other part creation/modification functions:
[`tab_caption()`](https://gt.rstudio.com/reference/tab_caption.md),
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md),
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md),
[`tab_info()`](https://gt.rstudio.com/reference/tab_info.md),
[`tab_options()`](https://gt.rstudio.com/reference/tab_options.md),
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md),
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md),
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md),
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md),
[`tab_stubhead()`](https://gt.rstudio.com/reference/tab_stubhead.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md),
[`tab_style_body()`](https://gt.rstudio.com/reference/tab_style_body.md)
