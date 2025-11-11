# A toy example tibble for testing with gt: exibble

This tibble contains data of a few different classes, which makes it
well-suited for quick experimentation with the functions in this
package. It contains only eight rows with numeric, character, and factor
columns. The last 4 rows contain `NA` values in the majority of this
tibble's columns (1 missing value per column). The `date`, `time`, and
`datetime` columns are character-based dates/times in the familiar ISO
8601 format. The `row` and `group` columns provide for unique rownames
and two groups (`grp_a` and `grp_b`) for experimenting with the
[`gt()`](https://gt.rstudio.com/reference/gt.md) function's
`rowname_col` and `groupname_col` arguments.

## Usage

``` r
exibble
```

## Format

A tibble with 8 rows and 9 variables:

- num:

  A numeric column ordered with increasingly larger values.

- char:

  A character column composed of names of fruits from `a` to `h`.

- fctr:

  A factor column with numbers from `1` to `8`, written out.

- date, time, datetime:

  Character columns with dates, times, and datetimes.

- currency:

  A numeric column that is useful for testing currency-based formatting.

- row:

  A character column in the format `row_X` which can be useful for
  testing with row labels in a table stub.

- group:

  A character column with four `grp_a` values and four `grp_b` values
  which can be useful for testing tables that contain row groups.

## Dataset ID and Badge

DATA-6

![This image of that of a dataset
badge.](https://raw.githubusercontent.com/rstudio/gt/master/images/dataset_exibble.png)

## Dataset Introduced

`v0.2.0.5` (March 31, 2020)

## See also

Other datasets:
[`constants`](https://gt.rstudio.com/reference/constants.md),
[`countrypops`](https://gt.rstudio.com/reference/countrypops.md),
[`films`](https://gt.rstudio.com/reference/films.md),
[`gibraltar`](https://gt.rstudio.com/reference/gibraltar.md),
[`gtcars`](https://gt.rstudio.com/reference/gtcars.md),
[`illness`](https://gt.rstudio.com/reference/illness.md),
[`metro`](https://gt.rstudio.com/reference/metro.md),
[`nuclides`](https://gt.rstudio.com/reference/nuclides.md),
[`peeps`](https://gt.rstudio.com/reference/peeps.md),
[`photolysis`](https://gt.rstudio.com/reference/photolysis.md),
[`pizzaplace`](https://gt.rstudio.com/reference/pizzaplace.md),
[`reactions`](https://gt.rstudio.com/reference/reactions.md),
[`rx_addv`](https://gt.rstudio.com/reference/rx_addv.md),
[`rx_adsl`](https://gt.rstudio.com/reference/rx_adsl.md),
[`sp500`](https://gt.rstudio.com/reference/sp500.md),
[`sza`](https://gt.rstudio.com/reference/sza.md),
[`towny`](https://gt.rstudio.com/reference/towny.md)

## Examples

``` r
exibble
#> # A tibble: 8 × 9
#>           num char       fctr  date       time  datetime    currency row   group
#>         <dbl> <chr>      <fct> <chr>      <chr> <chr>          <dbl> <chr> <chr>
#> 1       0.111 apricot    one   2015-01-15 13:35 2018-01-01…    50.0  row_1 grp_a
#> 2       2.22  banana     two   2015-02-15 14:40 2018-02-02…    18.0  row_2 grp_a
#> 3      33.3   coconut    three 2015-03-15 15:45 2018-03-03…     1.39 row_3 grp_a
#> 4     444.    durian     four  2015-04-15 16:50 2018-04-04… 65100    row_4 grp_a
#> 5    5550     NA         five  2015-05-15 17:55 2018-05-05…  1326.   row_5 grp_b
#> 6      NA     fig        six   2015-06-15 NA    2018-06-06…    13.3  row_6 grp_b
#> 7  777000     grapefruit seven NA         19:10 2018-07-07…    NA    row_7 grp_b
#> 8 8880000     honeydew   eight 2015-08-15 20:20 NA              0.44 row_8 grp_b
```
