# Add summary columns using aggregation functions

The `summary_columns()` function adds one or more computed columns to a
table by aggregating values across selected columns within each row.
This is the horizontal counterpart to
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md),
which aggregates down columns to create summary rows. Common use cases
include calculating row totals, row averages, or other row-wise
statistics.

Summary columns are computed immediately when the function is called and
are added to the table's data as regular columns. This means they can be
referenced in subsequent **gt** operations like
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md), or even
in other computed columns via
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md).

You can create a single summary column or multiple columns at once by
providing a list of aggregation functions. The functions can be any R
expression that takes a vector of values and returns a single value
(like [`sum()`](https://rdrr.io/r/base/sum.html),
[`mean()`](https://rdrr.io/r/base/mean.html),
[`max()`](https://rdrr.io/r/base/Extremes.html),
[`min()`](https://rdrr.io/r/base/Extremes.html), etc.). Column names and
labels can be auto-generated from function names or explicitly
specified.

## Usage

``` r
summary_columns(
  data,
  columns = everything(),
  fns = NULL,
  new_col_names = NULL,
  new_col_labels = NULL,
  fmt = NULL,
  side = c("right", "left"),
  missing_text = "---"
)
```

## Arguments

- data:

  *The gt table data object*

  `obj:<gt_tbl>` // **required**

  This is the **gt** table object that is commonly created through use
  of the [`gt()`](https://gt.rstudio.com/reference/gt.md) function.

- columns:

  *Columns to aggregate*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns to aggregate across for each row. Can either be a series
  of column names provided in [`c()`](https://rdrr.io/r/base/c.html), a
  vector of column indices, or a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- fns:

  *Aggregation Expression(s)*

  `<expression|list of expressions>`

  One or more functions used for aggregation. For a single summary
  column, provide a single function as a formula (e.g., `~ sum(.)`),
  character string (e.g., `"sum"`), or bare function (e.g., `sum`). For
  multiple summary columns, provide a list of formulas (e.g.,
  `list(~ sum(.), ~ mean(.), ~ sd(.))`). Base functions like `mean`,
  `min`, `max`, `median`, `sd`, and `sum` are supported, along with any
  user-defined aggregation functions.

- new_col_names:

  *Names for new summary columns*

  `vector<character>` // *default:* `NULL`

  Optional names for the new summary columns. Can provide one name for a
  single summary column, or multiple names (must match the length of
  `fns`) when adding multiple columns. These names are used as column
  identifiers for targeting in other **gt** functions (e.g.,
  [`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md),
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md)). If
  `NULL`, names will be generated from the function expressions (e.g.,
  `"sum"`, `"mean"`) or default to `"summary_1"`, `"summary_2"`, etc.

- new_col_labels:

  *Labels for new summary columns*

  `list|vector<character>` // *default:* `NULL`

  Optional labels for the new summary column headers. Can provide one
  label for a single column, or multiple labels (must match the length
  of `fns`) when adding multiple columns. Can include plain text or use
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) helpers. If
  `NULL`, will use `new_col_names` as labels. **Important**: Use
  [`list()`](https://rdrr.io/r/base/list.html) instead of
  [`c()`](https://rdrr.io/r/base/c.html) when mixing plain text with
  [`md()`](https://gt.rstudio.com/reference/md.md) or
  [`html()`](https://gt.rstudio.com/reference/html.md) objects to
  preserve their classes (e.g., `list("Total", md("**Average**"))`).

- fmt:

  *Formatting expression*

  `<expression>`

  An optional formatting expression in formula form. The RHS of `~`
  should contain a formatting call (e.g.,
  `~ fmt_number(., decimals = 2)`).

- side:

  *Side used for placement of summary column*

  `singl-kw:[right|left]` // *default:* `"right"`

  Should the summary column be placed on the `"right"` (the default) or
  the `"left"` side of the table?

- missing_text:

  *Replacement text for `NA` values*

  `scalar<character>` // *default:* `"---"`

  The text to be used in place of `NA` values in the summary column
  cells.

## Value

An object of class `gt_tbl`.

## Examples

Use a subset of the
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md) dataset
to create a **gt** table. Add a summary column that computes the average
annual change using `summary_columns()`.

    countrypops |>
      arrange(country_name, year) |>
      group_by(country_name, country_code_2) |>
      summarize(
        pop_1960 = first(population),
        pop_2024 = last(population),
        years = n(),
        .groups = "drop"
      ) |>
      filter(!is.na(pop_1960), !is.na(pop_2024)) |>
      mutate(total_change = pop_2024 - pop_1960) |>
      slice_max(total_change, n = 5) |>
      select(country_name, country_code_2, pop_1960, pop_2024, years) |>
      gt() |>
      summary_columns(
        columns = c(pop_1960, pop_2024, years),
        fns = ~ (.[2] - .[1]) / (.[3] - 1),
        new_col_names = "avg_annual_change",
        new_col_labels = md("**Avg. Annual Change**")  # No list() needed!
      ) |>
      cols_hide(columns = c(pop_1960, pop_2024, years)) |>
      fmt_integer() |>
      cols_label(
        country_name = "Country",
        country_code_2 = "Code"
      ) |>
      tab_header(
        title = "Top 5 Countries by Population Growth",
        subtitle = "Average annual population change (1960-2024)"
      )

![This image of a table was generated from the first code example in the
\`summary_columns()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_summary_columns_1.png)

## Function ID

6-6

## Function Introduced

`v1.2.0` (December 16, 2025)

## See also

Other row addition/modification functions:
[`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md),
[`row_group_order()`](https://gt.rstudio.com/reference/row_group_order.md),
[`row_order()`](https://gt.rstudio.com/reference/row_order.md),
[`rows_add()`](https://gt.rstudio.com/reference/rows_add.md),
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
