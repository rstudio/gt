# Apply conditional formatting to cells with `rows` and `columns`

To apply [styling](https://gt.rstudio.com/reference/tab_style.md) or
[formatting](https://gt.rstudio.com/reference/fmts.md), you can use the
`columns` and `rows` arguments. The syntax should be very familiar for
dplyr users as you can use the tidyselect specification.

Targeting of values is done through `columns` and additionally by `rows`
(if nothing is provided for `rows` then entire columns are selected).
The `columns` argument allows us to target a subset of cells contained
in the resolved columns. We say resolved because aside from declaring
column names in [`c()`](https://rdrr.io/r/base/c.html) (with bare column
names or names in quotes) we can use **tidyselect**-style expressions.
This can be as basic as supplying a select helper like
[`starts_with()`](https://tidyselect.r-lib.org/reference/starts_with.html),
or, providing a more complex incantation like

`where(~ is.numeric(.x) & max(.x, na.rm = TRUE) > 1E6)`

which targets numeric columns that have a maximum value greater than
1,000,000 (excluding any `NA`s from consideration).

By default all columns and rows are selected (with the
[`everything()`](https://tidyselect.r-lib.org/reference/everything.html)
defaults). Cell values that are incompatible with a given formatting
function will be skipped over, like `character` values and numeric
`fmt_*()` functions. So it's safe to select all columns with a
particular formatting function (only those values that can be formatted
will be formatted), but, you may not want that. One strategy is to
format the bulk of cell values with one formatting function and then
constrain the columns for later passes with other types of formatting
(the last formatting done to a cell is what you get in the final
output).

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
vector. This is nice if you want to base formatting on values in the
column or another column, or, you'd like to use a more complex predicate
expression.

## Examples

``` r
gt_tbl <- gt(exibble)

gt_tbl |>
  fmt_time(
    columns = contains("time") & !starts_with("date"),
     rows = num > 100 & group == "grp_b"
  )


  

num
```
