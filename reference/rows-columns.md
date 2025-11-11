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

char

fctr

date

time

datetime

currency

row

group

1.111e-01

apricot

one

2015-01-15

13:35

2018-01-01 02:22

49.950

row_1

grp_a

2.222e+00

banana

two

2015-02-15

14:40

2018-02-02 14:33

17.950

row_2

grp_a

3.333e+01

coconut

three

2015-03-15

15:45

2018-03-03 03:44

1.390

row_3

grp_a

4.444e+02

durian

four

2015-04-15

16:50

2018-04-04 15:55

65100.000

row_4

grp_a

5.550e+03

NA

five

2015-05-15

17:55:00

2018-05-05 04:00

1325.810

row_5

grp_b

NA

fig

six

2015-06-15

NA

2018-06-06 16:11

13.255

row_6

grp_b

7.770e+05

grapefruit

seven

NA

19:10:00

2018-07-07 05:22

NA

row_7

grp_b

8.880e+06

honeydew

eight

2015-08-15

20:20:00

NA

0.440

row_8

grp_b

\# Styling numeric columns based on range gt_tbl \|\>
[tab_style](https://gt.rstudio.com/reference/tab_style.md)( style =
[cell_text](https://gt.rstudio.com/reference/cell_text.md)(weight =
"bold"), locations =
[cells_body](https://gt.rstudio.com/reference/cells_body.md)(columns =
[where](https://tidyselect.r-lib.org/reference/where.html)(is.factor)) )

|       num | char       | fctr  |       date |  time |         datetime |  currency | row   | group |
|----------:|:-----------|:-----:|-----------:|------:|-----------------:|----------:|:------|:------|
| 1.111e-01 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22 |    49.950 | row_1 | grp_a |
| 2.222e+00 | banana     |  two  | 2015-02-15 | 14:40 | 2018-02-02 14:33 |    17.950 | row_2 | grp_a |
| 3.333e+01 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 |     1.390 | row_3 | grp_a |
| 4.444e+02 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 | 65100.000 | row_4 | grp_a |
| 5.550e+03 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 |  1325.810 | row_5 | grp_b |
|        NA | fig        |  six  | 2015-06-15 |    NA | 2018-06-06 16:11 |    13.255 | row_6 | grp_b |
| 7.770e+05 | grapefruit | seven |         NA | 19:10 | 2018-07-07 05:22 |        NA | row_7 | grp_b |
| 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20 |               NA |     0.440 | row_8 | grp_b |

\# Naming rows gt_tbl_rows \<-
[gt](https://gt.rstudio.com/reference/gt.md)(exibble, rowname_col =
"row") gt_tbl_rows \|\>
[fmt_datetime](https://gt.rstudio.com/reference/fmt_datetime.md)(
columns = datetime, rows = [c](https://rdrr.io/r/base/c.html)("row_1",
"row_8") )

|       |       num | char       | fctr  |       date |  time |            datetime |  currency | group |
|:------|----------:|:-----------|:-----:|-----------:|------:|--------------------:|----------:|:------|
| row_1 | 1.111e-01 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22:00 |    49.950 | grp_a |
| row_2 | 2.222e+00 | banana     |  two  | 2015-02-15 | 14:40 |    2018-02-02 14:33 |    17.950 | grp_a |
| row_3 | 3.333e+01 | coconut    | three | 2015-03-15 | 15:45 |    2018-03-03 03:44 |     1.390 | grp_a |
| row_4 | 4.444e+02 | durian     | four  | 2015-04-15 | 16:50 |    2018-04-04 15:55 | 65100.000 | grp_a |
| row_5 | 5.550e+03 | NA         | five  | 2015-05-15 | 17:55 |    2018-05-05 04:00 |  1325.810 | grp_b |
| row_6 |        NA | fig        |  six  | 2015-06-15 |    NA |    2018-06-06 16:11 |    13.255 | grp_b |
| row_7 | 7.770e+05 | grapefruit | seven |         NA | 19:10 |    2018-07-07 05:22 |        NA | grp_b |
| row_8 | 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20 |                  NA |     0.440 | grp_b |
