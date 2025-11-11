# Relabel columns with a function

Column labels can be modified from their default values (the names of
the columns from the input table data). When you create a **gt** table
object using [`gt()`](https://gt.rstudio.com/reference/gt.md), column
names effectively become the column labels. While this serves as a good
first approximation, you may want to make adjustments so that the
columns names present better in the **gt** output table. The
`cols_label_with()` function allows for modification of column labels
through a supplied function. By default, the function will be invoked on
all column labels but this can be limited to a subset via the `columns`
argument. With the `fn` argument, we provide either a bare function
name, a RHS formula (with `.` representing the vector of column labels),
or, an anonymous function (e.g., `function(x) tools::toTitleCase(x)`).

## Usage

``` r
cols_label_with(data, columns = everything(), fn)
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

  *Columns to target*

  `<column-targeting expression>` // *default:*
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)

  The columns for which the column-labeling operations should be
  applied. Can either be a series of column names provided in
  [`c()`](https://rdrr.io/r/base/c.html), a vector of column indices, or
  a select helper function (e.g.
  [`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`ends_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`contains()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`matches()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  [`num_range()`](https://tidyselect.r-lib.org/reference/starts_with.html),
  and
  [`everything()`](https://tidyselect.r-lib.org/reference/everything.html)).

- fn:

  *Function to apply*

  `function|formula` // **required**

  The function or function call to be applied to the column labels. This
  can take the form of a bare function (e.g.,
  [`tools::toTitleCase`](https://rdrr.io/r/tools/toTitleCase.html)), a
  function call as a RHS formula (e.g., `~ tools::toTitleCase(.)`), or
  an anonymous function as in `function(x) tools::toTitleCase(x)`.

## Value

An object of class `gt_tbl`.

## A note on column names and column labels

It's important to note that while columns can be freely relabeled, we
continue to refer to columns by their original column names. Column
names in a tibble or data frame must be unique whereas column labels in
**gt** have no requirement for uniqueness (which is useful for labeling
columns as, say, measurement units that may be repeated several
times—usually under different spanner labels). Thus, we can still easily
distinguish between columns in other **gt** function calls (e.g., in all
of the `fmt*()` functions) even though we may lose distinguishability in
column labels once they have been relabeled.

## Examples

Use a subset of the [`sp500`](https://gt.rstudio.com/reference/sp500.md)
dataset to create a **gt** table. We want all the column labels to be
entirely capitalized versions of the default labels but, instead of
using [`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)
and rewriting each label manually in capital letters we can use
`cols_label_with()` and instruct it to apply the
[`toupper()`](https://rdrr.io/r/base/chartr.html) function to all column
labels.

    sp500 |>
      dplyr::filter(
        date >= "2015-12-01" &
          date <= "2015-12-15"
      ) |>
      dplyr::select(-c(adj_close, volume)) |>
      gt() |>
      cols_label_with(fn = toupper)

![This image of a table was generated from the first code example in the
\`cols_label_with()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_label_with_1.png)

Use the [`countrypops`](https://gt.rstudio.com/reference/countrypops.md)
dataset to create a **gt** table. To improve the presentation of the
table, we are again going to change the default column labels via
function calls supplied within `cols_label_with()`. We can, if we
prefer, apply multiple types of column label changes in sequence with
multiple calls of `cols_label_with()`. Here, we use the
`make_clean_names()` functions from the **janitor** package and follow
up with the removal of a numeral with
[`gsub()`](https://rdrr.io/r/base/grep.html).

    countrypops |>
      dplyr::filter(year == 2021) |>
      dplyr::filter(grepl("^C", country_code_3)) |>
      dplyr::select(-country_code_2, -year) |>
      head(8) |>
      gt() |>
      cols_move_to_start(columns = country_code_3) |>
      fmt_integer(columns = population) |>
      cols_label_with(
        fn = ~ janitor::make_clean_names(., case = "title")
      ) |>
      cols_label_with(
        fn = ~ gsub("[0-9]", "", .)
      )

![This image of a table was generated from the second code example in
the \`cols_label_with()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_label_with_2.png)

We can make a svelte **gt** table with the
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md) dataset.
There are ways to use one instance of `cols_label_with()` with multiple
functions called on the column labels. In the example, we use an
anonymous function call (with the `function(x) { ... }` construction) to
perform multiple mutations of `x` (the vector of column labels). We can
even use the [`md()`](https://gt.rstudio.com/reference/md.md) helper
function with that to signal to **gt** that the column label should be
interpreted as Markdown text.

    pizzaplace |>
      dplyr::mutate(month = substr(date, 6, 7)) |>
      dplyr::count(month, name = "pizze_vendute") |>
      dplyr::mutate(frazione_della_quota = pizze_vendute / 4000) |>
      dplyr::mutate(date = paste0("2015/", month, "/01")) |>
      dplyr::select(-month) |>
      gt(rowname_col = "date") |>
      fmt_date(date, date_style = "month", locale = "it") |>
      fmt_percent(columns = frazione_della_quota) |>
      fmt_integer(columns = pizze_vendute) |>
      cols_width(everything() ~ px(100)) |>
      cols_label_with(
        fn = function(x) {
          janitor::make_clean_names(x, case = "title") |>
            toupper() |>
            stringr::str_replace_all("^|$", "**") |>
            md()
        }
      )

![This image of a table was generated from the third code example in the
\`cols_label_with()\` help
file.](https://raw.githubusercontent.com/rstudio/gt/master/images/man_cols_label_with_3.png)

## Function ID

5-5

## Function Introduced

`v0.9.0` (March 31, 2023)

## See also

Other column modification functions:
[`cols_add()`](https://gt.rstudio.com/reference/cols_add.md),
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md),
[`cols_align_decimal()`](https://gt.rstudio.com/reference/cols_align_decimal.md),
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md),
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md),
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
[`cols_merge_n_pct()`](https://gt.rstudio.com/reference/cols_merge_n_pct.md),
[`cols_merge_range()`](https://gt.rstudio.com/reference/cols_merge_range.md),
[`cols_merge_uncert()`](https://gt.rstudio.com/reference/cols_merge_uncert.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md),
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md),
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_nanoplot()`](https://gt.rstudio.com/reference/cols_nanoplot.md),
[`cols_unhide()`](https://gt.rstudio.com/reference/cols_unhide.md),
[`cols_units()`](https://gt.rstudio.com/reference/cols_units.md),
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
