# Add a new column of nanoplots, taking input data from selected columns

Nanoplots are tiny plots you can use in your **gt** table. They are
simple by design, mainly because there isn't a lot of space to work
with. With that simplicity, however, you do get a set of very succinct
data visualizations that adapt nicely to the amount of data you feed
into them. With `cols_nanoplot()` you take data from one or more columns
as the basic inputs for the nanoplots and generate a new column
containing the plots. The nanoplots are robust against missing values,
and multiple strategies are available for handling missingness.

Nanoplots try to show individual data with reasonably good visibility.
Interactivity is included as a basic feature so one can hover over the
data points and vertical guides will display the value ascribed to each
data point. Because **gt** knows all about numeric formatting, values
will be compactly formatted so as to not take up valuable real estate.
If you need to create a nanoplot based on monetary values, that can be
handled by providing the currency code to the
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
helper (then hook that up to the `options` argument). A guide on the
left-hand side of the plot area will appear on hover and display the
minimal and maximal *y* values.

There are three types of nanoplots available: `"line"`, `"bar"`,
`"boxplot"`. A line plot shows individual data points and has smooth
connecting lines between them to allow for easier scanning of values.
You can opt for straight-line connections between data points, or, no
connections at all (it's up to you). You can even eschew the data points
and just have a simple line. Regardless of how you mix and match
difference plot layers, the plot area focuses on the domain of the data
points with the goal of showing you the overall trend of the data. The
data you feed into a line plot can consist of a single vector of values
(resulting in equally-spaced *y* values), or, you can supply two vectors
representative of *x* and *y*.

A bar plot is built a little bit differently. The focus is on
evenly-spaced bars (requiring a single vector of values) that project
from a zero line, clearly showing the difference between positive and
negative values. By default, any type of nanoplot will have basic
interactivity. One can hover over the data points and vertical guides
will display values ascribed to each. A guide on the left-hand side of
the plot area will display the minimal and maximal *y* values on hover.

Every box plot will take the collection of values for a row and
construct the plot horizontally. This is essentially a standard
box-and-whisker diagram where outliers are automatically displayed
outside the left and right fences.

While basic customization options are present in the `cols_nanoplot()`,
many more opportunities for customizing nanoplots on a more granular
level are possible with the
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
helper function. That function should be invoked at the `options`
argument of `cols_nanoplot()`. Through that helper, layers of the
nanoplots can be selectively removed and the aesthetics of the remaining
plot components can be modified.

## Usage

``` r
cols_nanoplot(
  data,
  columns,
  rows = everything(),
  plot_type = c("line", "bar", "boxplot"),
  plot_height = "2em",
  missing_vals = c("gap", "marker", "zero", "remove"),
  autoscale = FALSE,
  autohide = TRUE,
  columns_x_vals = NULL,
  reference_line = NULL,
  reference_area = NULL,
  expand_x = NULL,
  expand_y = NULL,
  new_col_name = NULL,
  new_col_label = NULL,
  before = NULL,
  after = NULL,
  options = NULL
)
```

## Arguments

- data:

  *The gt table or gt group data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

  OR

  `obj:<gt_group>` // **required**

  This is the **gt** group object that is commonly created through use
  of the [`gt_group()`](https://gt.rstudio.com/reference/gt_group.md)
  function.

- columns:

  *Columns from which to get data for the dependent variable*

  `<column-targeting expression>` // **required**

  The columns which contain the numeric data to be plotted as nanoplots.
  Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  Data collected from the columns will be concatenated together in the
  order of resolution.

- rows:

  *Rows that should contain nanoplots*

  `<row-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  With `rows` we can specify which rows should contain nanoplots in the
  new column. The default
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
  results in all rows in `columns` being formatted. Alternatively, we
  can supply a vector of row IDs within
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

- plot_type:

  *The type of nanoplot to display*

  `singl-kw:[line|bar|boxplot]` // *default:* `"line"`

  Nanoplots can either take the form of a line plot (using `"line"`), a
  bar plot (with `"bar"`), or a box plot (`"boxplot"`). A line plot, by
  default, contains layers for a data line, data points, and a data
  area. Each of these can be deactivated by using
  [`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md).
  With a bar plot, the always visible layer is that of the data bars.
  Furthermore, a line plot can optionally take in *x* values through the
  `columns_x_vals` argument whereas bar plots and box plots both ignore
  any data representing the independent variable.

- plot_height:

  *The height of the nanoplots*

  `scalar<character>` // *default:* `"2em"`

  The height of the nanoplots. The default here is a sensible value of
  `"2em"`. By way of comparison, this is a far greater height than the
  default for icons through
  [`fmt_icon()`](https://gt.rstudio.com/reference/fmt_icon.md) (`"1em"`)
  and is the same height as images inserted via
  [`fmt_image()`](https://gt.rstudio.com/reference/fmt_image.md) (also
  having a `"2em"` height default).

- missing_vals:

  *Treatment of missing values*

  `singl-kw:[gap|marker|zero|remove]` // *default:* `"gap"`

  If missing values are encountered within the input data, there are
  three strategies available for their handling: (1) `"gap"` will show
  data gaps at the sites of missing data, where data lines will have
  discontinuities and bar plots will have missing bars; (2) `"marker"`
  will behave like `"gap"` but show prominent visual marks at the
  missing data locations; (3) `"zero"` will replace `NA` values with
  zero values; and (4) `"remove"` will remove any incoming `NA` values.

- autoscale:

  *Automatically set x- and y-axis scale limits based on data*

  `scalar<logical>` // *default:* `FALSE`

  Using `autoscale = TRUE` will ensure that the bounds of all nanoplots
  produced are based on the limits of data combined from all input rows.
  This will result in a shared scale across all of the nanoplots (for
  *y*- and *x*-axis data), which is useful in those cases where the
  nanoplot data should be compared across rows.

- autohide:

  *Automatically hide the `columns`/`columns_x_vals` column(s)*

  `scalar<logical>` // *default:* `TRUE`

  An option to automatically hide any columns specified in `columns` and
  also `columns_x_vals` (if used). Any columns with their state changed
  to 'hidden' will behave the same as before, they just won't be
  displayed in the finalized table. Should you want to have these
  'input' columns be viewable, set `autohide = FALSE`.

- columns_x_vals:

  *Columns containing values for the optional x variable*

  `<column-targeting expression>` // *default:* `NULL` (`optional`)

  We can optionally obtain data for the independent variable (i.e., the
  *x*-axis data) if specifying columns in `columns_x_vals`. This is only
  for the `"line"` type of plot (set via the `plot_type` argument). We
  can supply either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).
  Data collected from the columns will be concatenated together in the
  order of resolution.

- reference_line:

  *Add a reference line*

  `scalar<numeric|integer|character>` // *default:* `NULL` (`optional`)

  A reference line requires a single input to define the line. It could
  be a static numeric value, applied to all nanoplots generated. Or, the
  input can be one of the following for generating the line from the
  underlying data: (1) `"mean"`, (2) `"median"`, (3) `"min"`, (4)
  `"max"`, (5) `"q1"`, (6) `"q3"`, (7) `"first"`, or (8) `"last"`.

- reference_area:

  *Add a reference area*

  `vector<numeric|integer|character>|list` // *default:* `NULL`
  (`optional`)

  A reference area requires two inputs to define bottom and top
  boundaries for a rectangular area. The types of values supplied are
  the same as those expected for `reference_line`, which is either a
  static numeric value or one of the following keywords for the
  generation of the value: (1) `"mean"`, (2) `"median"`, (3)
  `"min"`, (4) `"max"`, (5) `"q1"`, (6) `"q3"`, (7) `"first"`, or (8)
  `"last"`. Input can either be a vector or list with two elements.

- expand_x, expand_y:

  *Expand plot scale in the x and y directions*

  `vector<numeric|integer>` // *default:* `NULL` (`optional`)

  Should you need to have plots expand in the *x* or *y* direction,
  provide one or more values to `expand_x` or `expand_y`. Any values
  provided that are outside of the range of data provided to the plot
  should result in a scale expansion.

- new_col_name:

  *Column name for the new column containing the plots*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A single column name in quotation marks. Values will be extracted from
  this column and provided to compatible arguments. If not provided the
  new column name will be `"nanoplots"`.

- new_col_label:

  *Column label for the new column containing the plots*

  `scalar<character>` // *default:* `NULL` (`optional`)

  A single column label. If not supplied then the column label will
  inherit from `new_col_name` (if nothing provided to that argument, the
  label will be `"nanoplots"`).

- before, after:

  *Column used as anchor*

  `<column-targeting expression>` // *default:* `NULL` (`optional`)

  A single column-resolving expression or column index can be given to
  either `before` or `after`. The column specifies where the new column
  containing the nanoplots should be positioned among the existing
  columns in the input data table. While select helper functions such as
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  and
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html)
  can be used for column targeting, it's recommended that a single
  column name or index be used. This is to ensure that exactly one
  column is provided to either of these arguments (otherwise, the
  function will be stopped). If nothing is provided for either argument
  then the new column will be placed at the end of the column series.

- options:

  *Set options for the nanoplots*

  `obj:<nanoplot_options` // *default:* `NULL` (`optional`)

  By using the
  [`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
  helper function here, you can alter the layout and styling of the
  nanoplots in the new column.

## Value

An object of class `gt_tbl`.

## Targeting cells with `columns` and `rows`

Targeting of values to insert into the nanoplots is done through
`columns` and additionally by `rows` (if nothing is provided for `rows`
then entire columns are selected). Aside from declaring column names in
[`c()`](https://rdrr.io/r/base/c.html) (with bare column names or names
in quotes) we can use also **tidyselect**-style expressions. This can be
as basic as supplying a select helper like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
or, providing a more complex incantation like

`where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any `NA`s from consideration).

Once the columns are targeted, we may also target the `rows` within
those columns. This can be done in a variety of ways. If a stub is
present, then we potentially have row identifiers. Those can be used
much like column names in the `columns`-targeting scenario. We can use
simpler **tidyselect**-style expressions (the select helpers should work
well here) and we can use quoted row identifiers in
[`c()`](https://rdrr.io/r/base/c.html). It's also possible to use row
indices (e.g., `c(3, 5, 6)`) though these index values must correspond
to the row numbers of the input data (the indices won't necessarily
match those of rearranged rows if row groups are present). One more type
of expression is possible, an expression that takes column values (can
involve any of the available columns in the table) and returns a logical
vector.

## How to supply data for nanoplots

The input data for nanoplots naturally needs to be numeric and there are
two major ways to formulate that data: (1) from single values across
many columns, and (2) using text-based value streams. It's pretty easy
to rationalize the first, and we may already have wide data in the input
data frame anyway (take a look at the
[`illness`](https://gt.rstudio.com/reference/illness.md) and
[`towny`](https://gt.rstudio.com/reference/towny.md) datasets for
examples of this). There's one data value per column so the key thing
here is to reference the columns in the correct order. With a select
helper, good column naming, and the columns being in the intended order,
this is a snap.

The second option is to use text-based value streams. Sometimes you
simply don't want or don't need multiple columns and so a single column
with all of the data might be more practical. To make this work, you'd
need to have a set of numerical values separated by some sort of
delimiter (could be a comma, a space, a semicolon, you get the idea).
Here's an example with three numbers, written three ways:
`"3.6 -2.44 1.98"`, `"3.6, -2.44, 1.98"`, and `"3.6;-2.44;1.98"`. You
can include `NA` values, not a problem, and here's an example of that:
`"6.232 NA 3.7 0.93"`. Another form of value stream involves using
datetimes in the ISO 8601 form of `YYYY-MM-DD HH:MM:SS`. These will be
internally converted to numeric values (seconds elapsed since
`"1970-01-01 00:00:00"`). An example of a datetime-based value stream
is: `"2012-06-12 08:24:13, 2012-06-12 10:37:08, 2012-06-12 14:03:24"`.

Value streams can be pretty big if you want them to be, and you don't
have to deal with containing individual values across multiple columns.
For the case where you need to provide two sets of values (*x* and *y*,
for line plots with `columns` and `columns_x_vals`), have two
equivalently sized value streams in two columns. Value streams can also
be concatenated together by referencing columns having their own
separate value streams.

## Reference line and reference area

Neither a horizontal *reference line* nor a *reference area* is present
in the default view but these can be added by providing valid input
values in the `reference_line` and `reference_area` arguments. A
reference line can be either be a static numeric value (supply any
number to `reference_line`), or it can be a keyword that computes the
reference line *y* value using the data values for each nanoplot. The
following keywords can be used:

1.  `"mean"`: The mean of the data values

2.  `"median"`: Median of data values

3.  `"min"`: Minimum value in set of data values

4.  `"max"`: The maximum value

5.  `"q1"`: The first, or lower, quartile of the data values

6.  `"q3"`: The third quartile, otherwise known as the upper quartile

7.  `"first"`: The first data value

8.  `"last"`: The last data value

The *reference area* accepts two inputs, and this can be two of the
above keywords, a keyword and a static numeric value, or two numeric
values.

## Examples

Let's make some nanoplots with the
[`illness`](https://gt.rstudio.com/reference/illness.md) dataset. The
columns beginning with 'day' all contain ordered measurement values,
comprising seven individual daily results. Using `cols_nanoplot()` we
create a new column to hold the nanoplots (with
`new_col_name = "nanoplots"`), referencing the columns containing the
data (with `columns = starts_with("day")`). It's also possible to define
a column label here using the `new_col_label` argument.

    illness |>
      dplyr::slice_head(n = 10) |>
      gt(rowname_col = "test") |>
      tab_header("Partial summary of daily tests performed on YF patient") |>
      tab_stubhead(label = md("**Test**")) |>
      cols_hide(columns = starts_with("norm")) |>
      fmt_units(columns = units) |>
      cols_nanoplot(
        columns = starts_with("day"),
        new_col_name = "nanoplots",
        new_col_label = md("*Progression*")
      ) |>
      cols_align(align = "center", columns = nanoplots) |>
      cols_merge(columns = c(test, units), pattern = "{1} ({2})") |>
      tab_footnote(
        footnote = "Measurements from Day 3 through to Day 8.",
        locations = cells_column_labels(columns = nanoplots)
      )

![This image of a table was generated from the first code example in the
\`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_1.png)

The previous table showed us some line-based nanoplots. We can also make
very small bar plots with `cols_nanoplot()`. Let's take the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset
and make a small summary table showing daily pizza sales by type (there
are four types). This will be limited to the first ten days of pizza
sales in 2015, so, there will be ten rows in total. We can use
`plot_type = "bar"` to make bar plots from the daily sales counts in the
`chicken`, `classic`, `supreme`, and `veggie` columns. Because we know
there will always be four bars (one for each type of pizza) we can be a
little creative and apply colors to each of the bars through use of the
`data_bar_fill_color` argument in
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md).

    pizzaplace |>
      dplyr::count(type, date) |>
      tidyr::pivot_wider(names_from = type, values_from = n) |>
      dplyr::slice_head(n = 10) |>
      gt(rowname_col = "date") |>
      tab_header(
        title = md("First Ten Days of Pizza Sales in 2015")
      ) |>
      cols_nanoplot(
        columns = c(chicken, classic, supreme, veggie),
        plot_type = "bar",
        autohide = FALSE,
        new_col_name = "pizzas_sold",
        new_col_label = "Sales by Type",
        options = nanoplot_options(
          show_data_line = FALSE,
          show_data_area = FALSE,
          data_bar_stroke_color = "transparent",
          data_bar_fill_color = c("brown", "gold", "purple", "green")
        )
      ) |>
      cols_width(pizzas_sold ~ px(150)) |>
      cols_align(columns = -date, align = "center") |>
      fmt_date(columns = date, date_style = "yMMMEd") |>
      opt_all_caps()

![This image of a table was generated from the second code example in
the \`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_2.png)

Now we'll make another table that contains two columns of nanoplots.
Starting from the [`towny`](https://gt.rstudio.com/reference/towny.md)
dataset, we first reduce it down to a subset of columns and rows. All of
the columns related to either population or density will be used as
input data for the two nanoplots. Both nanoplots will use a reference
line that is generated from the median of the input data. And by naming
the new nanoplot-laden columns in a similar manner as the input data
columns, we can take advantage of select helpers (e.g., when using
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md)).
Many of the input data columns are now redundant because of the plots,
so we'll elect to hide most of those with
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md).

    towny |>
      dplyr::select(name, starts_with("population"), starts_with("density")) |>
      dplyr::filter(population_2021 > 200000) |>
      dplyr::arrange(desc(population_2021)) |>
      gt() |>
      fmt_integer(columns = starts_with("population")) |>
      fmt_number(columns = starts_with("density"), decimals = 1) |>
      cols_nanoplot(
        columns = starts_with("population"),
        reference_line = "median",
        autohide = FALSE,
        new_col_name = "population_plot",
        new_col_label = md("*Change*")
      ) |>
      cols_nanoplot(
        columns = starts_with("density"),
        plot_type = "bar",
        autohide = FALSE,
        new_col_name = "density_plot",
        new_col_label = md("*Change*")
      ) |>
      cols_hide(columns = matches("2001|2006|2011|2016")) |>
      tab_spanner(
        label = "Population",
        columns = starts_with("population")
      ) |>
      tab_spanner(
        label = "Density ({{*persons* km^-2}})",
        columns = starts_with("density")
      ) |>
      cols_label_with(
        columns = -matches("plot"),
        fn = function(x) gsub("[^0-9]+", "", x)
      ) |>
      cols_align(align = "center", columns = matches("plot")) |>
      cols_width(
        name ~ px(140),
        everything() ~ px(100)
      ) |>
      opt_horizontal_padding(scale = 2)

![This image of a table was generated from the third code example in the
\`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_3.png)

The [`sza`](https://gt.rstudio.com/reference/sza.md) dataset can, with
just some use of **dplyr** and **tidyr**, give us a wide table full of
nanoplottable values. We'll transform the solar zenith angles to solar
altitude angles and create a column of nanoplots using the newly
calculated values. There are a few `NA` values during periods where the
sun hasn't risen (usually before 06:30 in the winter months) and those
values will be replaced with `0` using `missing_vals = "zero"`. We'll
also elect to create bar plots using the `plot_type = "bar"` option. The
height of the plots will be bumped up to `"2.5em"` from the default of
`"2em"`. Finally, we will use
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
to modify the coloring of the data bars.

    sza |>
      dplyr::filter(latitude == 20 & tst <= "1200") |>
      dplyr::select(-latitude) |>
      dplyr::filter(!is.na(sza)) |>
      dplyr::mutate(saa = 90 - sza) |>
      dplyr::select(-sza) |>
      tidyr::pivot_wider(
        names_from = tst,
        values_from = saa,
        names_sort = TRUE
      ) |>
      gt(rowname_col = "month") |>
      tab_header(
        title = "Solar Altitude Angles",
        subtitle = "Average values every half hour from 05:30 to 12:00"
      ) |>
      cols_nanoplot(
        columns = matches("0"),
        plot_type = "bar",
        missing_vals = "zero",
        new_col_name = "saa",
        plot_height = "2.5em",
        options = nanoplot_options(
          data_bar_stroke_color = "GoldenRod",
          data_bar_fill_color = "DarkOrange"
        )
      ) |>
      tab_options(
        table.width = px(400),
        column_labels.hidden = TRUE
      ) |>
      cols_align(
        align = "center",
        columns = everything()
      ) |>
      tab_source_note(
        source_note = "The solar altitude angle is the complement to
        the solar zenith angle. TMYK."
      )

![This image of a table was generated from the fourth code example in
the \`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_4.png)

You can use number and time streams as data for nanoplots. Let's
demonstrate how we can make use of them with some creative
transformation of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset.
A value stream is really a string with delimited numeric values, like
this: `"7.24,84.2,14"`. A value stream can also contain dates and/or
datetimes, and here's an example of that:
`"2020-06-02 13:05:13,2020-06-02 14:24:05,2020-06-02 18:51:37"`. Having
data in this form can often be more convenient since different nanoplots
might have varying amounts of data (and holding different amounts of
data in a fixed number of columns is cumbersome). There are `date` and
`time` columns in this dataset and we'll use that to get *x* values
denoting high-resolution time instants: the second of the day that a
pizza was sold (this is true pizza analytics). We also have the sell
price for a pizza, and that'll serve as the *y* values. The pizzas
belong to four different groups (in the `type` column) and we'll group
by that and create value streams with `paste(..., collapse = ",")`
inside the
[`dplyr::summarize()`](https://dplyr.tidyverse.org/reference/summarise.html)
call. With two value streams in each row (having the same number of
values) we can now make a **gt** table with nanoplots.

    pizzaplace |>
      dplyr::filter(date == "2015-01-01") |>
      dplyr::mutate(date_time = paste(date, time)) |>
      dplyr::select(type, date_time, price) |>
      dplyr::group_by(type) |>
      dplyr::summarize(
        date_time = paste(date_time, collapse = ","),
        sold = paste(price, collapse = ",")
      ) |>
      gt(rowname_col = "type") |>
      tab_header(
        title = md("Pizzas sold on **January 1, 2015**"),
        subtitle = "Between the opening hours of 11:30 to 22:30"
      ) |>
      cols_nanoplot(
        columns = sold,
        columns_x_vals = date_time,
        expand_x = c("2015-01-01 11:30", "2015-01-01 22:30"),
        reference_line = "median",
        new_col_name = "pizzas_sold",
        new_col_label = "Pizzas Sold",
        options = nanoplot_options(
          show_data_line = FALSE,
          show_data_area = FALSE,
          currency = "USD"
        )
      ) |>
      cols_width(pizzas_sold ~ px(200)) |>
      cols_align(columns = pizzas_sold, align = "center") |>
      opt_all_caps()

![This image of a table was generated from the fifth code example in the
\`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_5.png)

Notice that the columns containing the value streams are hid due to the
default argument `autohide = TRUE` because, while useful, they don't
need to be displayed to anybody viewing a table. Since we have a lot of
data points and a connecting line is not as valuable here, we also set
`show_data_line = FALSE` in
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md).
It's more interesting to see the clusters of the differently priced
pizzas over the entire day. Specifying a `currency` in
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md)
is a nice touch since the *y* values are sale prices in U.S. Dollars
(hovering over data points gives correctly formatted values). Finally,
having a reference line based on the median gives pretty useful
information. Seems like customers preferred getting the `"chicken"`-type
pizzas in large size!

Using the [`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md)
dataset, let's make a series of nanoplots across the meteorological
parameters of temperature, humidity, and wind speed. We'll want to
customize the appearance of the plots across three columns and we can
make this somewhat simpler by assigning a common set of options through
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md).
In this table we want to make comparisons across nanoplots in a
particular column easier, so, we'll set `autoscale = TRUE` so that there
is a common y-axis scale for each of the parameters (based on the
extents of the data).

    nanoplot_options_list <-
      nanoplot_options(
        data_point_radius = px(4),
        data_point_stroke_width = px(2),
        data_point_stroke_color = "black",
        data_point_fill_color = "white",
        data_line_stroke_width = px(4),
        data_line_stroke_color = "gray",
        show_data_line = TRUE,
        show_data_points = TRUE,
        show_data_area = FALSE,
      )

    gibraltar |>
      dplyr::filter(date <= "2023-05-14") |>
      dplyr::mutate(time = as.numeric(hms::as_hms(paste0(time, ":00")))) |>
      dplyr::mutate(humidity = humidity * 100) |>
      dplyr::select(date, time, temp, humidity, wind_speed) |>
      dplyr::group_by(date) |>
      dplyr::summarize(
        time = paste(time, collapse = ","),
        temp = paste(temp, collapse = ","),
        humidity = paste(humidity, collapse = ","),
        wind_speed = paste(wind_speed, collapse = ","),
      ) |>
      dplyr::mutate(is_satsun = lubridate::wday(date) %in% c(1, 7)) |>
      gt(rowname_col = "date") |>
      tab_header(
        title = "Meteorological Summary of Gibraltar Station",
        subtitle = "Data taken from May 1-14, 2023."
      ) |>
      fmt_date(columns = stub(), date_style = "wd_m_day_year") |>
      cols_nanoplot(
        columns = temp,
        columns_x_vals = time,
        expand_x = c(0, 86400),
        autoscale = TRUE,
        new_col_name = "temperature_nano",
        new_col_label = "Temperature",
        options = nanoplot_options_list
      ) |>
      cols_nanoplot(
        columns = humidity,
        columns_x_vals = time,
        expand_x = c(0, 86400),
        autoscale = TRUE,
        new_col_name = "humidity_nano",
        new_col_label = "Humidity",
        options = nanoplot_options_list
      ) |>
      cols_nanoplot(
        columns = wind_speed,
        columns_x_vals = time,
        expand_x = c(0, 86400),
        autoscale = TRUE,
        new_col_name = "wind_speed_nano",
        new_col_label = "Wind Speed",
        options = nanoplot_options_list
      ) |>
      cols_units(
        temperature_nano = ":degree:C",
        humidity_nano = "% (RH)",
        wind_speed_nano = "m s^-1"
      ) |>
      cols_hide(columns = is_satsun) |>
      tab_style_body(
        style = cell_fill(color = "#E5FEFE"),
        values = TRUE,
        targets = "row",
        extents = c("body", "stub")
      ) |>
      tab_style(
        style = cell_text(align = "center"),
        locations = cells_column_labels()
      )

![This image of a table was generated from the sixth code example in the
\`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_6.png)

Box plots can be generated, and we just need to use
`plot_type = "boxplot"` to make that type of nanoplot. Using a small
portion of the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset,
we will create a simple table that displays a box plot of pizza sales
for a selection of days. By converting the string-time 24-hour-clock
time values to the number of seconds elapsed in a day, we get continuous
values that can be incorporated into each box plot. And, by supplying a
function to the `y_val_fmt_fn` argument within
[`nanoplot_options()`](https://gt.rstudio.com/reference/nanoplot_options.md),
we can transform the integer seconds values back to clock times for
display on hover.

    pizzaplace |>
      dplyr::filter(date <= "2015-01-14") |>
      dplyr::mutate(time = as.numeric(hms::as_hms(time))) |>
      dplyr::summarize(time = paste(time, collapse = ","), .by = date) |>
      dplyr::mutate(is_weekend = lubridate::wday(date) %in% 6:7) |>
      gt() |>
      tab_header(title = "Pizza Sales in Early January 2015") |>
      fmt_date(columns = date, date_style = 2) |>
      cols_nanoplot(
        columns = time,
        plot_type = "boxplot",
        options = nanoplot_options(y_val_fmt_fn = function(x) hms::as_hms(x))
      ) |>
      cols_hide(columns = is_weekend) |>
      cols_width(everything() ~ px(250)) |>
      cols_align(align = "center", columns = nanoplots) |>
      cols_align(align = "left", columns = date) |>
      tab_style(
        style = cell_borders(
          sides = "left", color = "gray"),
        locations = cells_body(columns = nanoplots)
      ) |>
      tab_style_body(
        style = cell_fill(color = "#E5FEFE"),
        values = TRUE,
        targets = "row"
      ) |>
      tab_options(column_labels.hidden = TRUE)

![This image of a table was generated from the seventh code example in
the \`cols_nanoplot()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_nanoplot_7.png)

## Function ID

5-8

## Function Introduced

`v0.10.0` (October 7, 2023)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md),
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md),
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`cols_label_with()`](https://gt.rstudio.com/reference/cols_label_with.md),
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md),
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
