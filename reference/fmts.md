# Formatting functions

All formatting functions in gt are quite consistent. All functions that
start with the common `fmt_*()` prefix have the following points in
common

## Details

Let's use the [exibble](https://gt.rstudio.com/reference/exibble.md)
data for this.

## Examples

``` r
gt_tbl <- gt(exibble)

#
# They all have `columns` and `rows` to specify target cells and default to
# styling all compatible cells.
#
# By default, they apply styling to all compatible columns.

# Will style all numeric columns
gt_tbl |> fmt_number()


  

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

0.11

apricot

one

2015-01-15

13:35

2018-01-01 02:22

49.95

row_1

grp_a

2.22

banana

two

2015-02-15

14:40

2018-02-02 14:33

17.95

row_2

grp_a

33.33

coconut

three

2015-03-15

15:45

2018-03-03 03:44

1.39

row_3

grp_a

444.40

durian

four

2015-04-15

16:50

2018-04-04 15:55

65,100.00

row_4

grp_a

5,550.00

NA

five

2015-05-15

17:55

2018-05-05 04:00

1,325.81

row_5

grp_b

NA

fig

six

2015-06-15

NA

2018-06-06 16:11

13.26

row_6

grp_b

777,000.00

grapefruit

seven

NA

19:10

2018-07-07 05:22

NA

row_7

grp_b

8,880,000.00

honeydew

eight

2015-08-15

20:20

NA

0.44

row_8

grp_b

\# will style the time column gt_tbl \|\>
[fmt_time](https://gt.rstudio.com/reference/fmt_time.md)(columns = time)

|       num | char       | fctr  |       date |     time |         datetime |  currency | row   | group |
|----------:|:-----------|:-----:|-----------:|---------:|-----------------:|----------:|:------|:------|
| 1.111e-01 | apricot    |  one  | 2015-01-15 | 13:35:00 | 2018-01-01 02:22 |    49.950 | row_1 | grp_a |
| 2.222e+00 | banana     |  two  | 2015-02-15 | 14:40:00 | 2018-02-02 14:33 |    17.950 | row_2 | grp_a |
| 3.333e+01 | coconut    | three | 2015-03-15 | 15:45:00 | 2018-03-03 03:44 |     1.390 | row_3 | grp_a |
| 4.444e+02 | durian     | four  | 2015-04-15 | 16:50:00 | 2018-04-04 15:55 | 65100.000 | row_4 | grp_a |
| 5.550e+03 | NA         | five  | 2015-05-15 | 17:55:00 | 2018-05-05 04:00 |  1325.810 | row_5 | grp_b |
|        NA | fig        |  six  | 2015-06-15 |       NA | 2018-06-06 16:11 |    13.255 | row_6 | grp_b |
| 7.770e+05 | grapefruit | seven |         NA | 19:10:00 | 2018-07-07 05:22 |        NA | row_7 | grp_b |
| 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20:00 |               NA |     0.440 | row_8 | grp_b |

\# Will style nothing since is only compatible with logical values
gt_tbl \|\> [fmt_tf](https://gt.rstudio.com/reference/fmt_tf.md)() \#\>
Warning: invalid factor level, NA generated \#\> Warning: invalid factor
level, NA generated

| num     | char       | fctr  | date       | time  | datetime         | currency | row   | group |
|:--------|:-----------|:------|:-----------|:------|:-----------------|:---------|:------|:------|
| 0.1111  | apricot    | one   | 2015-01-15 | 13:35 | 2018-01-01 02:22 | 49.95    | row_1 | grp_a |
| 2.222   | banana     | two   | 2015-02-15 | 14:40 | 2018-02-02 14:33 | 17.95    | row_2 | grp_a |
| 33.33   | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 | 1.39     | row_3 | grp_a |
| 444.4   | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 | 65100    | row_4 | grp_a |
| 5550    | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 | 1325.81  | row_5 | grp_b |
| NA      | fig        | six   | 2015-06-15 | NA    | 2018-06-06 16:11 | 13.255   | row_6 | grp_b |
| 777000  | grapefruit | seven | NA         | 19:10 | 2018-07-07 05:22 | NA       | row_7 | grp_b |
| 8880000 | honeydew   | eight | 2015-08-15 | 20:20 | NA               | 0.44     | row_8 | grp_b |

\# \# Their order has importance as the last styling will have priority.
\# \# Will style all numeric columns as integer \# fmt_number() will
have no effect gt_tbl \|\>
[fmt_number](https://gt.rstudio.com/reference/fmt_number.md)() \|\>
[fmt_integer](https://gt.rstudio.com/reference/fmt_integer.md)()

|       num | char       | fctr  |       date |  time |         datetime | currency | row   | group |
|----------:|:-----------|:-----:|-----------:|------:|-----------------:|---------:|:------|:------|
|         0 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22 |       50 | row_1 | grp_a |
|         2 | banana     |  two  | 2015-02-15 | 14:40 | 2018-02-02 14:33 |       18 | row_2 | grp_a |
|        33 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 |        1 | row_3 | grp_a |
|       444 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 |   65,100 | row_4 | grp_a |
|     5,550 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 |    1,326 | row_5 | grp_b |
|        NA | fig        |  six  | 2015-06-15 |    NA | 2018-06-06 16:11 |       13 | row_6 | grp_b |
|   777,000 | grapefruit | seven |         NA | 19:10 | 2018-07-07 05:22 |       NA | row_7 | grp_b |
| 8,880,000 | honeydew   | eight | 2015-08-15 | 20:20 |               NA |        0 | row_8 | grp_b |

\# \# Therefore, to apply different styling, it is important to specify
columns or rows. \# \# Will style all numeric columns as number and as
currency the currency column. \# fmt_number() will have no effect gt_tbl
\|\> [fmt_number](https://gt.rstudio.com/reference/fmt_number.md)() \|\>
[fmt_integer](https://gt.rstudio.com/reference/fmt_integer.md)(currency)

|          num | char       | fctr  |       date |  time |         datetime | currency | row   | group |
|-------------:|:-----------|:-----:|-----------:|------:|-----------------:|---------:|:------|:------|
|         0.11 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22 |       50 | row_1 | grp_a |
|         2.22 | banana     |  two  | 2015-02-15 | 14:40 | 2018-02-02 14:33 |       18 | row_2 | grp_a |
|        33.33 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 |        1 | row_3 | grp_a |
|       444.40 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 |   65,100 | row_4 | grp_a |
|     5,550.00 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 |    1,326 | row_5 | grp_b |
|           NA | fig        |  six  | 2015-06-15 |    NA | 2018-06-06 16:11 |       13 | row_6 | grp_b |
|   777,000.00 | grapefruit | seven |         NA | 19:10 | 2018-07-07 05:22 |       NA | row_7 | grp_b |
| 8,880,000.00 | honeydew   | eight | 2015-08-15 | 20:20 |               NA |        0 | row_8 | grp_b |
