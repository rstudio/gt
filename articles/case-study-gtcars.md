# Case Study: gtcars

![](../reference/figures/gtcars.svg)

Let’s make a display table using the `gtcars` dataset. We all know
`mtcars`… what is `gtcars`? It’s basically a modernized `mtcars` for the
**gt** age. It’s part of the **gt** package, and here is a preview of
the tibble using
[`dplyr::glimpse()`](https://pillar.r-lib.org/reference/glimpse.html):

``` r
# This is `gtcars`
glimpse(gtcars)
#> Rows: 47
#> Columns: 15
#> $ mfr         <chr> "Ford", "Ferrari", "Ferrari", "Ferrari", "Ferrari", "Ferra…
#> $ model       <chr> "GT", "458 Speciale", "458 Spider", "458 Italia", "488 GTB…
#> $ year        <dbl> 2017, 2015, 2015, 2014, 2016, 2015, 2017, 2015, 2015, 2015…
#> $ trim        <chr> "Base Coupe", "Base Coupe", "Base", "Base Coupe", "Base Co…
#> $ bdy_style   <chr> "coupe", "coupe", "convertible", "coupe", "coupe", "conver…
#> $ hp          <dbl> 647, 597, 562, 562, 661, 553, 680, 652, 731, 949, 573, 545…
#> $ hp_rpm      <dbl> 6250, 9000, 9000, 9000, 8000, 7500, 8250, 8000, 8250, 9000…
#> $ trq         <dbl> 550, 398, 398, 398, 561, 557, 514, 504, 509, 664, 476, 436…
#> $ trq_rpm     <dbl> 5900, 6000, 6000, 6000, 3000, 4750, 5750, 6000, 6000, 6750…
#> $ mpg_c       <dbl> 11, 13, 13, 13, 15, 16, 12, 11, 11, 12, 21, 16, 11, 16, 12…
#> $ mpg_h       <dbl> 18, 17, 17, 17, 22, 23, 17, 16, 16, 16, 22, 22, 18, 20, 20…
#> $ drivetrain  <chr> "rwd", "rwd", "rwd", "rwd", "rwd", "rwd", "awd", "awd", "r…
#> $ trsmn       <chr> "7a", "7a", "7a", "7a", "7a", "7a", "7a", "7a", "7a", "7a"…
#> $ ctry_origin <chr> "United States", "Italy", "Italy", "Italy", "Italy", "Ital…
#> $ msrp        <dbl> 447000, 291744, 263553, 233509, 245400, 198973, 298000, 29…
```

For the purpose of simply learning more about **gt**, let’s reduce this
47-row tibble to one that has only 8 rows with a little **dplyr**ing:

``` r
# Get a subset of 8 cars from the `gtcars` dataset: two
# from each manufacturer country of origin except the UK
gtcars_8 <-
  gtcars |>
  group_by(ctry_origin) |>
  slice_head(n = 2) |>
  ungroup() |>
  filter(ctry_origin != "United Kingdom")

# Show the `gtcars_8` tibble
glimpse(gtcars_8)
#> Rows: 8
#> Columns: 15
#> $ mfr         <chr> "BMW", "BMW", "Ferrari", "Ferrari", "Acura", "Nissan", "Fo…
#> $ model       <chr> "6-Series", "i8", "458 Speciale", "458 Spider", "NSX", "GT…
#> $ year        <dbl> 2016, 2016, 2015, 2015, 2017, 2016, 2017, 2016
#> $ trim        <chr> "640 I Coupe", "Mega World Coupe", "Base Coupe", "Base", "…
#> $ bdy_style   <chr> "coupe", "coupe", "coupe", "convertible", "coupe", "coupe"…
#> $ hp          <dbl> 315, 357, 597, 562, 573, 545, 647, 650
#> $ hp_rpm      <dbl> 5800, 5800, 9000, 9000, 6500, 6400, 6250, 6400
#> $ trq         <dbl> 330, 420, 398, 398, 476, 436, 550, 650
#> $ trq_rpm     <dbl> 1400, 3700, 6000, 6000, 2000, 3200, 5900, 3600
#> $ mpg_c       <dbl> 20, 28, 13, 13, 21, 16, 11, 15
#> $ mpg_h       <dbl> 30, 29, 17, 17, 22, 22, 18, 22
#> $ drivetrain  <chr> "rwd", "awd", "rwd", "rwd", "awd", "awd", "rwd", "rwd"
#> $ trsmn       <chr> "8am", "6am", "7a", "7a", "9a", "6a", "7a", "7m"
#> $ ctry_origin <chr> "Germany", "Germany", "Italy", "Italy", "Japan", "Japan", …
#> $ msrp        <dbl> 77300, 140700, 291744, 263553, 156000, 101770, 447000, 883…
```

Let’s make a display table from this dataset. In doing so we’ll fulfill
the following 10 requirements:

1.  putting the cars into characteristic groups (by the car
    manufacturer’s country of origin)
2.  removing some of the columns that we don’t want to present
3.  incorporating some columns into a column group
4.  formatting the currency data and using a monospaced font for easier
    reading of that data
5.  giving the table a title and a subtitle
6.  adding footnotes to draw attention to some of the more interesting
    data points and to explain some of the more unusual aspects of the
    data
7.  placing a citation for the dataset at the bottom of the table
8.  transforming the transmission (`trsmn`) codes so that they are
    readable and understandable
9.  styling some cells according to basic criteria
10. highlighting the cars that are considered to be *grand tourers*

### Row Groups

Let’s again use **dplyr** to help make groupings by the `ctry_origin`
column, which provides the country of origin for the vehicle
manufacturer of the car. We can simply use
[`dplyr::group_by()`](https://dplyr.tidyverse.org/reference/group_by.html)
on the `gtcars` dataset and pass that to
[`gt()`](https://gt.rstudio.com/reference/gt.md). What you get is a
display table that arranges the cars into row groups, with the name of
the group displayed prominently above.

``` r
# Use `group_by()` on `gtcars` and pass that to `gt()`
gtcars_8 |>
  group_by(ctry_origin) |>
  gt()
```

| mfr           | model        | year | trim             | bdy_style   | hp  | hp_rpm | trq | trq_rpm | mpg_c | mpg_h | drivetrain | trsmn | msrp   |
|---------------|--------------|------|------------------|-------------|-----|--------|-----|---------|-------|-------|------------|-------|--------|
| Germany       |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| BMW           | 6-Series     | 2016 | 640 I Coupe      | coupe       | 315 | 5800   | 330 | 1400    | 20    | 30    | rwd        | 8am   | 77300  |
| BMW           | i8           | 2016 | Mega World Coupe | coupe       | 357 | 5800   | 420 | 3700    | 28    | 29    | awd        | 6am   | 140700 |
| Italy         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Ferrari       | 458 Speciale | 2015 | Base Coupe       | coupe       | 597 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 291744 |
| Ferrari       | 458 Spider   | 2015 | Base             | convertible | 562 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 263553 |
| Japan         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Acura         | NSX          | 2017 | Base Coupe       | coupe       | 573 | 6500   | 476 | 2000    | 21    | 22    | awd        | 9a    | 156000 |
| Nissan        | GT-R         | 2016 | Premium Coupe    | coupe       | 545 | 6400   | 436 | 3200    | 16    | 22    | awd        | 6a    | 101770 |
| United States |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Ford          | GT           | 2017 | Base Coupe       | coupe       | 647 | 6250   | 550 | 5900    | 11    | 18    | rwd        | 7a    | 447000 |
| Chevrolet     | Corvette     | 2016 | Z06 Coupe        | coupe       | 650 | 6400   | 650 | 3600    | 15    | 22    | rwd        | 7m    | 88345  |

Getting the row groups in the preferred order can be done easily with
[`dplyr::arrange()`](https://dplyr.tidyverse.org/reference/arrange.html).
For example, we can have groups that are arranged alphabetically by
manufacturer (`mfr`) and then sorted by highest sticker price (`msrp`)
to lowest.

``` r
gtcars_8 |>
  group_by(ctry_origin) |>
  arrange(mfr, desc(msrp)) |>
  gt()
```

| mfr           | model        | year | trim             | bdy_style   | hp  | hp_rpm | trq | trq_rpm | mpg_c | mpg_h | drivetrain | trsmn | msrp   |
|---------------|--------------|------|------------------|-------------|-----|--------|-----|---------|-------|-------|------------|-------|--------|
| Japan         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Acura         | NSX          | 2017 | Base Coupe       | coupe       | 573 | 6500   | 476 | 2000    | 21    | 22    | awd        | 9a    | 156000 |
| Nissan        | GT-R         | 2016 | Premium Coupe    | coupe       | 545 | 6400   | 436 | 3200    | 16    | 22    | awd        | 6a    | 101770 |
| Germany       |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| BMW           | i8           | 2016 | Mega World Coupe | coupe       | 357 | 5800   | 420 | 3700    | 28    | 29    | awd        | 6am   | 140700 |
| BMW           | 6-Series     | 2016 | 640 I Coupe      | coupe       | 315 | 5800   | 330 | 1400    | 20    | 30    | rwd        | 8am   | 77300  |
| United States |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Chevrolet     | Corvette     | 2016 | Z06 Coupe        | coupe       | 650 | 6400   | 650 | 3600    | 15    | 22    | rwd        | 7m    | 88345  |
| Ford          | GT           | 2017 | Base Coupe       | coupe       | 647 | 6250   | 550 | 5900    | 11    | 18    | rwd        | 7a    | 447000 |
| Italy         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Ferrari       | 458 Speciale | 2015 | Base Coupe       | coupe       | 597 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 291744 |
| Ferrari       | 458 Spider   | 2015 | Base             | convertible | 562 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 263553 |

We could also use factor levels to get a more particular ordering within
`arrange()`. For example, we can first arrange the groups themselves
(the country of origin–`ctry_origin`) by our own preferred ordering and
then arrange by `mfr` and descending `msrp` as before. Then,
`group_by(ctry_origin)` can be used on the sorted tibble before passing
this to [`gt()`](https://gt.rstudio.com/reference/gt.md).

``` r
# Define our preferred order for `ctry_origin`
order_countries <- c("Germany", "Italy", "United States", "Japan")

# Reorder the table rows by our specific ordering of groups
gtcars_8 |>
  arrange(
    factor(ctry_origin, levels = order_countries), mfr, desc(msrp)
  ) |>
  group_by(ctry_origin) |>
  gt()
```

| mfr           | model        | year | trim             | bdy_style   | hp  | hp_rpm | trq | trq_rpm | mpg_c | mpg_h | drivetrain | trsmn | msrp   |
|---------------|--------------|------|------------------|-------------|-----|--------|-----|---------|-------|-------|------------|-------|--------|
| Germany       |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| BMW           | i8           | 2016 | Mega World Coupe | coupe       | 357 | 5800   | 420 | 3700    | 28    | 29    | awd        | 6am   | 140700 |
| BMW           | 6-Series     | 2016 | 640 I Coupe      | coupe       | 315 | 5800   | 330 | 1400    | 20    | 30    | rwd        | 8am   | 77300  |
| Italy         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Ferrari       | 458 Speciale | 2015 | Base Coupe       | coupe       | 597 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 291744 |
| Ferrari       | 458 Spider   | 2015 | Base             | convertible | 562 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 263553 |
| United States |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Chevrolet     | Corvette     | 2016 | Z06 Coupe        | coupe       | 650 | 6400   | 650 | 3600    | 15    | 22    | rwd        | 7m    | 88345  |
| Ford          | GT           | 2017 | Base Coupe       | coupe       | 647 | 6250   | 550 | 5900    | 11    | 18    | rwd        | 7a    | 447000 |
| Japan         |              |      |                  |             |     |        |     |         |       |       |            |       |        |
| Acura         | NSX          | 2017 | Base Coupe       | coupe       | 573 | 6500   | 476 | 2000    | 21    | 22    | awd        | 9a    | 156000 |
| Nissan        | GT-R         | 2016 | Premium Coupe    | coupe       | 545 | 6400   | 436 | 3200    | 16    | 22    | awd        | 6a    | 101770 |

The last variation is to combine the manufacturer name with the model
name, using those combined strings as row labels for the table. This is
just a little more **dplyr** where we can use
[`dplyr::mutate()`](https://dplyr.tidyverse.org/reference/mutate.html)
to make a new `car` column followed by
[`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html)
where we remove the `mfr` and `model` columns. When introducing the
tibble to the [`gt()`](https://gt.rstudio.com/reference/gt.md) function,
we can now use the `rowname_col` argument to specify a column that will
serve as row labels (which is the newly made `car` column).

``` r
# Reorder the table rows by our specific ordering of groups
tab <-
  gtcars_8 |>
  arrange(
    factor(ctry_origin, levels = order_countries),
    mfr, desc(msrp)
  ) |>
  mutate(car = paste(mfr, model)) |>
  select(-mfr, -model) |>
  group_by(ctry_origin) |>
  gt(rowname_col = "car")

# Show the table
tab
```

|                      | year | trim             | bdy_style   | hp  | hp_rpm | trq | trq_rpm | mpg_c | mpg_h | drivetrain | trsmn | msrp   |
|----------------------|------|------------------|-------------|-----|--------|-----|---------|-------|-------|------------|-------|--------|
| Germany              |      |                  |             |     |        |     |         |       |       |            |       |        |
| BMW i8               | 2016 | Mega World Coupe | coupe       | 357 | 5800   | 420 | 3700    | 28    | 29    | awd        | 6am   | 140700 |
| BMW 6-Series         | 2016 | 640 I Coupe      | coupe       | 315 | 5800   | 330 | 1400    | 20    | 30    | rwd        | 8am   | 77300  |
| Italy                |      |                  |             |     |        |     |         |       |       |            |       |        |
| Ferrari 458 Speciale | 2015 | Base Coupe       | coupe       | 597 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 291744 |
| Ferrari 458 Spider   | 2015 | Base             | convertible | 562 | 9000   | 398 | 6000    | 13    | 17    | rwd        | 7a    | 263553 |
| United States        |      |                  |             |     |        |     |         |       |       |            |       |        |
| Chevrolet Corvette   | 2016 | Z06 Coupe        | coupe       | 650 | 6400   | 650 | 3600    | 15    | 22    | rwd        | 7m    | 88345  |
| Ford GT              | 2017 | Base Coupe       | coupe       | 647 | 6250   | 550 | 5900    | 11    | 18    | rwd        | 7a    | 447000 |
| Japan                |      |                  |             |     |        |     |         |       |       |            |       |        |
| Acura NSX            | 2017 | Base Coupe       | coupe       | 573 | 6500   | 476 | 2000    | 21    | 22    | awd        | 9a    | 156000 |
| Nissan GT-R          | 2016 | Premium Coupe    | coupe       | 545 | 6400   | 436 | 3200    | 16    | 22    | awd        | 6a    | 101770 |

### Hiding and Moving Some Columns

Let’s hide two columns that we don’t need to the final table:
`drivetrain` and `bdy_style`. We can use
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md) to hide
columns. The same end result might also have been achieved by using
`gtcars |> dplyr::select(-c(drivetrain, bdy_style))`, before introducing
the table to [`gt()`](https://gt.rstudio.com/reference/gt.md). Why this
function then? Sometimes you’ll need variables for conditional
statements within **gt** but won’t want to display them in the end.

Aside from hiding columns, let’s *move* some of them. Again, this could
be done with
[`dplyr::select()`](https://dplyr.tidyverse.org/reference/select.html)
but there are options here in **gt** via
[`cols_move_to_start()`](https://gt.rstudio.com/reference/cols_move_to_start.md),
[`cols_move()`](https://gt.rstudio.com/reference/cols_move.md), and
[`cols_move_to_end()`](https://gt.rstudio.com/reference/cols_move_to_end.md).

``` r
# Use a few `cols_*()` functions to hide and move columns
tab <-
  tab |>
  cols_hide(columns = c(drivetrain, bdy_style)) |>
  cols_move(
    columns = c(trsmn, mpg_c, mpg_h),
    after = trim
  )

# Show the table
tab
```

|                      | year | trim             | trsmn | mpg_c | mpg_h | hp  | hp_rpm | trq | trq_rpm | msrp   |
|----------------------|------|------------------|-------|-------|-------|-----|--------|-----|---------|--------|
| Germany              |      |                  |       |       |       |     |        |     |         |        |
| BMW i8               | 2016 | Mega World Coupe | 6am   | 28    | 29    | 357 | 5800   | 420 | 3700    | 140700 |
| BMW 6-Series         | 2016 | 640 I Coupe      | 8am   | 20    | 30    | 315 | 5800   | 330 | 1400    | 77300  |
| Italy                |      |                  |       |       |       |     |        |     |         |        |
| Ferrari 458 Speciale | 2015 | Base Coupe       | 7a    | 13    | 17    | 597 | 9000   | 398 | 6000    | 291744 |
| Ferrari 458 Spider   | 2015 | Base             | 7a    | 13    | 17    | 562 | 9000   | 398 | 6000    | 263553 |
| United States        |      |                  |       |       |       |     |        |     |         |        |
| Chevrolet Corvette   | 2016 | Z06 Coupe        | 7m    | 15    | 22    | 650 | 6400   | 650 | 3600    | 88345  |
| Ford GT              | 2017 | Base Coupe       | 7a    | 11    | 18    | 647 | 6250   | 550 | 5900    | 447000 |
| Japan                |      |                  |       |       |       |     |        |     |         |        |
| Acura NSX            | 2017 | Base Coupe       | 9a    | 21    | 22    | 573 | 6500   | 476 | 2000    | 156000 |
| Nissan GT-R          | 2016 | Premium Coupe    | 6a    | 16    | 22    | 545 | 6400   | 436 | 3200    | 101770 |

### Putting Columns Into Groups

It’s sometimes useful to arrange variables/columns into groups by using
spanner column labels. This can be done in **gt** with
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md). It
takes the `label` and `columns` arguments; `label` is the spanner column
label and the `columns` are those columns that belong in this group.

Here, we’ll put the `mpg_c`, `mpg_h`, `hp`, `hp_rpm`, `trq`, `trq_rpm`
columns under the `Performance` spanner column, and the remaining
columns won’t be grouped together. This single spanner column label is
styled with Markdown by using the
[`md()`](https://gt.rstudio.com/reference/md.md) helper.

``` r
# Put the first three columns under a spanner
# column with the label 'Performance'
tab <-
  tab |>
  tab_spanner(
    label = "Performance",
    columns = c(mpg_c, mpg_h, hp, hp_rpm, trq, trq_rpm)
  )

# Show the table
tab
```

[TABLE]

### Merging Columns Together and Labeling Them

Sometimes we’d like to combine the data from two columns into a single
column. [`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
allows us to do this, we just need to describe how the data should be
combined. For our table, let’s merge together the following pairs of
columns:

- `mpg_c` and `mpg_h` (miles per gallon in city and highway driving
  modes)
- `hp` and `hp_rpm` (horsepower and associated RPM)
- `trq` and `trq_rpm` (torque and associated RPM)

[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) uses a
`col_1` column and a `col_2` column. Once combined, the `col_1` column
will be retained and the `col_2` column will be dropped. The pattern
argument uses `{1}` and `{2}` to represent the content of `col_1` and
`col_2`. Here, we can use string literals to add text like `rpm` or the
`@` sign. Furthermore, because we are targeting an HTML table, we can
use the `<br>` tag to insert a linebreak.

We are going to do something a little special with the `pattern` for the
`mpg_c` and `mpg_h` columns and wrap it all with `<<`/`>>`. This is
special pattern syntax that tells **gt** to remove anything inside those
double braces when there is an `NA` value. We find that is a single row
that has `NA` in both columns (for the ‘Tesla Model S’) and rather than
seeing `"NA"` appear in the table, it’s better to remove that entry
entirely with this specialized pattern syntax.

Labeling columns essentially means that we are choosing display-friendly
labels that are no longer simply the column names (the default label).
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md) makes
this relabeling possible. It accepts a series of named arguments in the
form of `<column_name> = <column_label>, ...`.

``` r
# Perform three column merges to better present
# MPG, HP, and torque; relabel all the remaining
# columns for a nicer-looking presentation
tab <-
  tab |>
  cols_merge(
    columns = c(mpg_c, mpg_h),
    pattern = "<<{1}c<br>{2}h>>"
  ) |>
  cols_merge(
    columns = c(hp, hp_rpm),
    pattern = "{1}<br>@{2}rpm"
  ) |>
  cols_merge(
    columns = c(trq, trq_rpm),
    pattern = "{1}<br>@{2}rpm"
  ) |>
  cols_label(
    mpg_c = "MPG",
    hp = "HP",
    trq = "Torque",
    year = "Year",
    trim = "Trim",
    trsmn = "Transmission",
    msrp = "MSRP"
  )

# Show the table
tab
```

[TABLE]

### Using Formatter Functions

There are a number of formatter functions, all with the general naming
convention `fmt*()`. The various formatters are convenient for applying
formats to numeric or character values in the table’s field. Here, we
will simply use
[`fmt_currency()`](https://gt.rstudio.com/reference/fmt_currency.md) on
the `msrp` column (we still refer to columns by their original names) to
get USD currency will no decimal places. We’re not supplying anything
for the `rows` argument and this means we want to apply the formatting
to the entire column of data.

``` r
# Format the `msrp` column to USD currency
# with no display of the currency subunits
tab <-
  tab |>
  fmt_currency(columns = msrp, decimals = 0)

# Show the table
tab
```

[TABLE]

### Column Alignment and Style Changes

We can change the alignment of data in columns with
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md). For
our table, let’s center-align the `mpg_c`, `hp`, and `trq` columns. All
other columns will maintain their default alignments.

It’s sometimes useful to modify the default styles of table cells. We
can do this in a targeted way with
[`tab_style()`](https://gt.rstudio.com/reference/tab_style.md). That
function require two key pieces of information: a `style` definition,
and one or more `locations` (which cells should the styles be applied
to?). The `style` argument commonly uses the `cell_*()` helper
functions. There are three of these
([`cell_text()`](https://gt.rstudio.com/reference/cell_text.md),
[`cell_fill()`](https://gt.rstudio.com/reference/cell_fill.md) and
[`cell_borders()`](https://gt.rstudio.com/reference/cell_borders.md))
and each contains different arguments for the different styles that are
supported.

Here we will use
[`cell_text()`](https://gt.rstudio.com/reference/cell_text.md) and
specify a text `size` of `"12px"` for our targeted cells—both `px(12)`
and `"12px"` work equally well here. We also use helper functions with
the `locations` argument and these are the `cells_*()` functions. We
would like to target the data cells in all columns except `year` and
`msrp` so we need to use `cells_body` and then supply our target columns
to its own `columns` argument.

``` r
# Center-align three columns in the gt table and
# modify the text size of a few columns of data
tab <-
  tab |>
  cols_align(
    align = "center",
    columns = c(mpg_c, hp, trq)
  ) |>
  tab_style(
    style = cell_text(size = px(12)),
    locations = cells_body(
      columns = c(trim, trsmn, mpg_c, hp, trq)
    )
  )

# Show the table
tab
```

[TABLE]

### Text Transforms

Transforming text with
[`text_transform()`](https://gt.rstudio.com/reference/text_transform.md)
is a great way to further manipulate text in data cells (even after
they’ve been formatted with the `fmt*()` function). After targeting data
cells with the
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)
location helper function, we supply a function to the `fn` argument that
processes a vector of text (the vector `x` will be the formatted text in
each of the targeted cells). If we intend to render an HTML table, we
can directly apply HTML tags in the transformation function. The
function we provide here is a bit complicated but it will build strings
in the `trsmn` column that read better in a display table.

``` r
# Transform the column of text in `trsmn` using
# a custom function within `text_transform()`;
# here `x` represents a character vector defined
# in the `cells_body()` function
tab <-
  tab |>
  text_transform(
    locations = cells_body(columns = trsmn),
    fn = function(x) {
      # The first character of `x` always
      # indicates the number of transmission speeds
      speed <- substr(x, 1, 1)

      # We can carefully determine which transmission
      # type we have in `x` with a `dplyr::case_when()`
      # statement
      type <-
        dplyr::case_when(
          substr(x, 2, 3) == "am" ~ "Automatic/Manual",
          substr(x, 2, 2) == "m" ~ "Manual",
          substr(x, 2, 2) == "a" ~ "Automatic",
          substr(x, 2, 3) == "dd" ~ "Direct Drive"
        )

      # Let's paste together the `speed` and `type`
      # vectors to create HTML text replacing `x`
      paste(speed, " Speed<br><em>", type, "</em>")
    }
  )

# Show the table
tab
```

[TABLE]

### Table Header: Title and Subtitle

[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) allows
us to place a table title and, optionally, a subtitle at the top of the
display table. It’s generally a good idea to have both in a table, where
the subtitle provides additional information (though that isn’t quite
the case in our example below).

``` r
# Add a table title and subtitle; we can use
# markdown with the `md()` helper function
tab <-
  tab |>
  tab_header(
    title = md("The Cars of **gtcars**"),
    subtitle = "These are some fine automobiles"
  )

# Show the table
tab
```

[TABLE]

### Adding a Source Citation

A *source note* can be added below the display table with
[`tab_source_note()`](https://gt.rstudio.com/reference/tab_source_note.md).
We can even add multiple source notes with multiple calls of that
function. Here, we supply a web URL and by using Markdown (with
[`md()`](https://gt.rstudio.com/reference/md.md)) it’s easy to create a
link to the source of the data.

``` r
# Add a source note to the bottom of the table; this
# appears below the footnotes
tab <-
  tab |>
  tab_source_note(
    source_note = md(
      "Source: Various pages within the Edmonds website."
    )
  )

# Show the table
tab
```

[TABLE]

### Using the Complete `gtcars` table and Adding Footnotes

Let’s bring it all together by putting together all the statements we
developed for `gtcars_8`, and applying that to the complete `gtcars`
dataset. At the same time, we’ll add a few interesting footnotes and our
specific requirements for footnoting are:

    a. identifying the car with the best gas mileage (city)
    b. identifying the car with the highest horsepower
    c. stating the currency of the MSRP

[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
expects note text for the `footnote` argument, and locations for where
the footnote mark should be attached. It will handle the placement of
the footnote mark and also place the footnote in the footnotes area.
Here, we’ll use the
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)
*location helper* function. There are several location helper functions
for targeting all parts of the table (e.g,.
[`cells_body()`](https://gt.rstudio.com/reference/cells_body.md),
[`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md), etc.).
Each *location helper* has its own interface for targeting cells so
refer to the documentation for examples of how they work in practice
(e.g., use
[`?cells_body`](https://gt.rstudio.com/reference/cells_body.md)).

What [`cells_body()`](https://gt.rstudio.com/reference/cells_body.md)
expects is `columns` (column names, which can be conveniently provided
in [`c()`](https://rdrr.io/r/base/c.html)) and `rows` (which can be a
vector of row names or row indices). The
[`cells_stub()`](https://gt.rstudio.com/reference/cells_stub.md)
location helper only expects a vector of `rows`. For
[`cells_column_labels()`](https://gt.rstudio.com/reference/cells_column_labels.md),
we provide column labels in its `columns` argument. Here, we are
targeting a footnote to the `msrp` column label so we will use
`columns = msrp`.

In terms of structuring the code, we’re taking all the previous
statements and putting those in first. It should be noted that the order
of the statements does not matter to the end result, we could also put
in all of the
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
statements first (again, any in order) and expect the same output table.

``` r
# Use dplyr functions to get the car with the best city gas mileage;
# this will be used to target the correct cell for a footnote
best_gas_mileage_city <-
  gtcars |>
  slice_max(mpg_c, n = 1) |>
  mutate(car = paste(mfr, model)) |>
  pull(car)

# Use dplyr functions to get the car with the highest horsepower
# this will be used to target the correct cell for a footnote
highest_horsepower <-
  gtcars |>
  slice_max(hp, n = 1) |>
  mutate(car = paste(mfr, model)) |>
  pull(car)

# Define our preferred order for `ctry_origin`
order_countries <- c("Germany", "Italy", "United States", "Japan")

# Create a display table with `gtcars`, using all of the previous
# statements piped together + additional `tab_footnote()` stmts
tab <-
  gtcars |>
  arrange(
    factor(ctry_origin, levels = order_countries),
    mfr, desc(msrp)
  ) |>
  mutate(car = paste(mfr, model)) |>
  select(-mfr, -model) |>
  group_by(ctry_origin) |>
  gt(rowname_col = "car") |>
  cols_hide(columns = c(drivetrain, bdy_style)) |>
  cols_move(
    columns = c(trsmn, mpg_c, mpg_h),
    after = trim
  ) |>
  tab_spanner(
    label = "Performance",
    columns = c(mpg_c, mpg_h, hp, hp_rpm, trq, trq_rpm)
  ) |>
  cols_merge(
    columns = c(mpg_c, mpg_h),
    pattern = "<<{1}c<br>{2}h>>"
  ) |>
  cols_merge(
    columns = c(hp, hp_rpm),
    pattern = "{1}<br>@{2}rpm"
  ) |>
  cols_merge(
    columns = c(trq, trq_rpm),
    pattern = "{1}<br>@{2}rpm"
  ) |>
  cols_label(
    mpg_c = "MPG",
    hp = "HP",
    trq = "Torque",
    year = "Year",
    trim = "Trim",
    trsmn = "Transmission",
    msrp = "MSRP"
  ) |>
  fmt_currency(columns = msrp, decimals = 0) |>
  cols_align(
    align = "center",
    columns = c(mpg_c, hp, trq)
  ) |>
  tab_style(
    style = cell_text(size = px(12)),
    locations = cells_body(
      columns = c(trim, trsmn, mpg_c, hp, trq)
    )
  ) |>
  text_transform(
    locations = cells_body(columns = trsmn),
    fn = function(x) {
      speed <- substr(x, 1, 1)

      type <-
        dplyr::case_when(
          substr(x, 2, 3) == "am" ~ "Automatic/Manual",
          substr(x, 2, 2) == "m" ~ "Manual",
          substr(x, 2, 2) == "a" ~ "Automatic",
          substr(x, 2, 3) == "dd" ~ "Direct Drive"
        )

      paste(speed, " Speed<br><em>", type, "</em>")
    }
  ) |>
  tab_header(
    title = md("The Cars of **gtcars**"),
    subtitle = "These are some fine automobiles"
  ) |>
  tab_source_note(
    source_note = md(
      "Source: Various pages within the Edmonds website."
    )
  ) |>
  tab_footnote(
    footnote = md("Best gas mileage (city) of all the **gtcars**."),
    locations = cells_body(
      columns = mpg_c,
      rows = best_gas_mileage_city
    )
  ) |>
  tab_footnote(
    footnote = md("The highest horsepower of all the **gtcars**."),
    locations = cells_body(
      columns = hp,
      rows = highest_horsepower
    )
  ) |>
  tab_footnote(
    footnote = "All prices in U.S. dollars (USD).",
    locations = cells_column_labels(columns = msrp)
  )

# Show the table
tab
```

[TABLE]

And that is it. The final table looks pretty good and conveys the
additional information we planned for. That table can be used in a lot
of different places like R Markdown, Shiny, email messages… wherever
HTML is accepted.
