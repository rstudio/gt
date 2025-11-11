# gt interactive tables

gt provides an option to make interactive html tables via the
[reactable](https://glin.github.io/reactable/index.html) package.

It also provides an interactive to creating gt tables as plots.

Let’s use the following base for our gt table.

``` r
library(gt)
gt_tbl <- exibble |>
  gt()
```

To create an interactive table, you have simply have to pipe
[`opt_interactive()`](https://gt.rstudio.com/reference/opt_interactive.md)
to your existing gt pipeline.

``` r
gt_tbl
```

| num       | char       | fctr  | date       | time  | datetime         | currency  | row   | group |
|-----------|------------|-------|------------|-------|------------------|-----------|-------|-------|
| 1.111e-01 | apricot    | one   | 2015-01-15 | 13:35 | 2018-01-01 02:22 | 49.950    | row_1 | grp_a |
| 2.222e+00 | banana     | two   | 2015-02-15 | 14:40 | 2018-02-02 14:33 | 17.950    | row_2 | grp_a |
| 3.333e+01 | coconut    | three | 2015-03-15 | 15:45 | 2018-03-03 03:44 | 1.390     | row_3 | grp_a |
| 4.444e+02 | durian     | four  | 2015-04-15 | 16:50 | 2018-04-04 15:55 | 65100.000 | row_4 | grp_a |
| 5.550e+03 | NA         | five  | 2015-05-15 | 17:55 | 2018-05-05 04:00 | 1325.810  | row_5 | grp_b |
| NA        | fig        | six   | 2015-06-15 | NA    | 2018-06-06 16:11 | 13.255    | row_6 | grp_b |
| 7.770e+05 | grapefruit | seven | NA         | 19:10 | 2018-07-07 05:22 | NA        | row_7 | grp_b |
| 8.880e+06 | honeydew   | eight | 2015-08-15 | 20:20 | NA               | 0.440     | row_8 | grp_b |

``` r
gt_tbl |>
  opt_interactive()
```

## Current limitations

- Some features like
  [`tab_style()`](https://gt.rstudio.com/reference/tab_style.md) may not
  be fully supported.

- [`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md)
  and
  [`grand_summary_rows()`](https://gt.rstudio.com/reference/grand_summary_rows.md)
  have yet to be implemented.

- Your interactive table may be visually different from your
  non-interactive table.
