# Localize formatting and symbols

Localize formatting and symbols

## Specify locale

[`gt()`](https://gt.rstudio.com/reference/gt.md), some `cols_*()` and
`fmt_*()` functions have a `locale` argument. You can pass `locale` as a
2 letters string or 4. (e.g. `"fr"` for French, `"pt-BR"` for Brazilian
Portuguese). gt also resolves different spellings internally as much as
possible. For example `"en_GB"` will work out of the box.

## Range of action of locale

One of the advantage of using gt its consistency in using symbols and
currencies in multiple languages

There are two ways to localize your results with gt.

- Passing it **globally** `gt(locale = "<locale>")`

Will localize everything possible in the
[`gt()`](https://gt.rstudio.com/reference/gt.md) pipeline.

- In individual `fmt_()` functions

- Localize buttons in
  [`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)

Will only affect the output of one specific function (or override global
setting).

`locale` has very low precedence usually. As soon as you override some
parameters, `sep_mark`, `dec_mark`, `incl_space`, they will be override
`locale`.

## See also

[`info_locales()`](https://gt.rstudio.com/reference/info_locales.md),
[`info_flags()`](https://gt.rstudio.com/reference/info_flags.md)

## Examples

``` r
# The Spanish locale uses `.` as thousands sep (English uses `,`) and uses
# a `,` as the decimal mark

# Using the locale in `gt()` will format automatically all output in
# subsequent `fmt_*()` calls.
exibble |>
  gt(locale = "es-AR") |>
  fmt_number()


  

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

0,11

apricot

one

2015-01-15

13:35

2018-01-01 02:22

49,95

row_1

grp_a

2,22

banana

two

2015-02-15

14:40

2018-02-02 14:33

17,95

row_2

grp_a

33,33

coconut

three

2015-03-15

15:45

2018-03-03 03:44

1,39

row_3

grp_a

444,40

durian

four

2015-04-15

16:50

2018-04-04 15:55

65.100,00

row_4

grp_a

5.550,00

NA

five

2015-05-15

17:55

2018-05-05 04:00

1.325,81

row_5

grp_b

NA

fig

six

2015-06-15

NA

2018-06-06 16:11

13,26

row_6

grp_b

777.000,00

grapefruit

seven

NA

19:10

2018-07-07 05:22

NA

row_7

grp_b

8.880.000,00

honeydew

eight

2015-08-15

20:20

NA

0,44

row_8

grp_b

\# Only format currency as Mexican peso exibble \|\>
[gt](https://gt.rstudio.com/reference/gt.md)(locale = "fr") \|\>
[fmt_currency](https://gt.rstudio.com/reference/fmt_currency.md)(currency,
locale = "es-MX")

|       num | char       | fctr  |       date |  time |         datetime |       currency | row   | group |
|----------:|:-----------|:-----:|-----------:|------:|-----------------:|---------------:|:------|:------|
| 1.111e-01 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22 |     Mex\$49.95 | row_1 | grp_a |
| 2.222e+00 | banana     |  two  | 2015-02-15 | 14:40 | 2018-02-02 14:33 |     Mex\$17.95 | row_2 | grp_a |
| 3.333e+01 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 |      Mex\$1.39 | row_3 | grp_a |
| 4.444e+02 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 | Mex\$65,100.00 | row_4 | grp_a |
| 5.550e+03 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 |  Mex\$1,325.81 | row_5 | grp_b |
|        NA | fig        |  six  | 2015-06-15 |    NA | 2018-06-06 16:11 |     Mex\$13.26 | row_6 | grp_b |
| 7.770e+05 | grapefruit | seven |         NA | 19:10 | 2018-07-07 05:22 |             NA | row_7 | grp_b |
| 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20 |               NA |      Mex\$0.44 | row_8 | grp_b |

\# will use the provided \`sep_mark\` exibble \|\>
[gt](https://gt.rstudio.com/reference/gt.md)(locale = "fr") \|\>
[fmt_currency](https://gt.rstudio.com/reference/fmt_currency.md)(currency,
sep_mark = "", locale = "es-MX")

|       num | char       | fctr  |       date |  time |         datetime |       currency | row   | group |
|----------:|:-----------|:-----:|-----------:|------:|-----------------:|---------------:|:------|:------|
| 1.111e-01 | apricot    |  one  | 2015-01-15 | 13:35 | 2018-01-01 02:22 |     Mex\$49.95 | row_1 | grp_a |
| 2.222e+00 | banana     |  two  | 2015-02-15 | 14:40 | 2018-02-02 14:33 |     Mex\$17.95 | row_2 | grp_a |
| 3.333e+01 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 |      Mex\$1.39 | row_3 | grp_a |
| 4.444e+02 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 | Mex\$65,100.00 | row_4 | grp_a |
| 5.550e+03 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 |  Mex\$1,325.81 | row_5 | grp_b |
|        NA | fig        |  six  | 2015-06-15 |    NA | 2018-06-06 16:11 |     Mex\$13.26 | row_6 | grp_b |
| 7.770e+05 | grapefruit | seven |         NA | 19:10 | 2018-07-07 05:22 |             NA | row_7 | grp_b |
| 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20 |               NA |      Mex\$0.44 | row_8 | grp_b |

\# Use your imagination, and mix and match.
