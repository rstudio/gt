# Case Study: Clinical Tables

The **gt** package contains the `rx_adsl` dataset, which resembles the
structure of a common ADSL ADaM dataset for clinical trial data. Each
record refers to demographic information for a single subject in the
fictional trial. Every column is equipped with a label attribute
allowing the users to get familiar with the data.

``` r
rx_adsl |> str()
#> tibble [182 × 14] (S3: tbl_df/tbl/data.frame)
#>  $ STUDYID : chr [1:182] "GT01" "GT01" "GT01" "GT01" ...
#>   ..- attr(*, "label")= chr "Unique Study Identifier"
#>  $ STUDYIDN: chr [1:182] "4001" "4001" "4001" "4001" ...
#>   ..- attr(*, "label")= chr "Unique Study Identifier (N)"
#>  $ USUBJID : chr [1:182] "GT1000" "GT1001" "GT1002" "GT1003" ...
#>   ..- attr(*, "label")= chr "Unique Subject Identifier"
#>  $ TRTA    : Factor w/ 2 levels "Placebo","Drug 1": NA 1 1 1 1 1 1 1 1 1 ...
#>   ..- attr(*, "label")= chr "Actual Treatment"
#>  $ TRTAN   : num [1:182] 3 1 1 1 1 1 1 1 1 1 ...
#>   ..- attr(*, "label")= chr "Actual Treatment (N)"
#>  $ ITTFL   : chr [1:182] "N" "Y" "Y" "Y" ...
#>   ..- attr(*, "label")= chr "ITT Population Flag"
#>  $ RANDFL  : chr [1:182] "N" "Y" "Y" "Y" ...
#>   ..- attr(*, "label")= chr "Randomization Flag"
#>  $ SCRFREAS: chr [1:182] "WITHDRAWAL BY SUBJECT" "" "" "" ...
#>   ..- attr(*, "label")= chr "Reason for Screen Failure"
#>  $ AGE     : int [1:182] 37 41 39 38 45 35 42 35 42 38 ...
#>   ..- attr(*, "label")= chr "Age"
#>   ..- attr(*, "units")= chr "Years"
#>  $ AAGEGR1 : Factor w/ 2 levels "<40",">=40": 1 2 1 1 2 1 2 1 2 1 ...
#>   ..- attr(*, "label")= chr "Age Group"
#>  $ SEX     : Factor w/ 3 levels "Male","Female",..: 1 1 2 1 1 2 2 1 1 2 ...
#>   ..- attr(*, "label")= chr "Sex"
#>  $ ETHNIC  : Factor w/ 3 levels "Hispanic or Latino",..: 1 2 2 2 2 1 2 2 2 1 ...
#>   ..- attr(*, "label")= chr "Ethnicity"
#>  $ BLBMI   : num [1:182] 33.8 33.4 30.5 22.9 23.9 ...
#>   ..- attr(*, "label")= chr "Body Mass Index"
#>   ..- attr(*, "units")= chr "kg/m2"
#>  $ EVNTFL  : chr [1:182] "" "Y" "Y" "N" ...
#>   ..- attr(*, "label")= chr "Event Flag"
```

### Demographic Summary Tables

Let’s start with an example of a basic demographic summary table. In a
first step, we use **dplyr** and **tidyr** to create a tibble with the
shape of our desired table and then use **gt** functions to create the
output table:

``` r
custom_summary <- function(df, group_var, sum_var) {
  group_var <- rlang::ensym(group_var)
  sum_var <- rlang::ensym(sum_var)

  is_categorical <-
    is.character(eval(expr(`$`(df, !!sum_var)))) |
      is.factor(eval(expr(`$`(df, !!sum_var))))

  if (is_categorical) {
    category_lbl <-
      sprintf("%s, n (%%)", attr(eval(expr(`$`(df, !!sum_var))), "label"))

    df_out <-
      df |>
      dplyr::group_by(!!group_var) |>
      dplyr::mutate(N = dplyr::n()) |>
      dplyr::ungroup() |>
      dplyr::group_by(!!group_var, !!sum_var) |>
      dplyr::summarize(
        val = dplyr::n(),
        pct = dplyr::n() / mean(N),
        .groups = "drop"
      ) |>
      tidyr::pivot_wider(
        id_cols = !!sum_var, names_from = !!group_var,
        values_from = c(val, pct)
      ) |>
      dplyr::rename(label = !!sum_var) |>
      dplyr::mutate(
        across(where(is.numeric), ~ ifelse(is.na(.), 0, .)),
        category = category_lbl
      )
  } else {
    category_lbl <-
      sprintf(
        "%s (%s)",
        attr(eval(expr(`$`(df, !!sum_var))), "label"),
        attr(eval(expr(`$`(df, !!sum_var))), "units")
      )

    df_out <-
      df |>
      dplyr::group_by(!!group_var) |>
      dplyr::summarize(
        n = sum(!is.na(!!sum_var)),
        mean = mean(!!sum_var, na.rm = TRUE),
        sd = sd(!!sum_var, na.rm = TRUE),
        median = median(!!sum_var, na.rm = TRUE),
        min = min(!!sum_var, na.rm = TRUE),
        max = max(!!sum_var, na.rm = TRUE),
        min_max = NA,
        .groups = "drop"
      ) |>
      tidyr::pivot_longer(
        cols = c(n, mean, median, min_max),
        names_to = "label",
        values_to = "val"
      ) |>
      dplyr::mutate(
        sd = ifelse(label == "mean", sd, NA),
        max = ifelse(label == "min_max", max, NA),
        min = ifelse(label == "min_max", min, NA),
        label = dplyr::recode(
          label,
          "mean" = "Mean (SD)",
          "min_max" = "Min - Max",
          "median" = "Median"
        )
      ) |>
      tidyr::pivot_wider(
        id_cols = label,
        names_from = !!group_var,
        values_from = c(val, sd, min, max)
      ) |>
      dplyr::mutate(category = category_lbl)
  }

  return(df_out)
}

adsl_summary <-
  dplyr::filter(rx_adsl, ITTFL == "Y") |>
  (\(data) purrr::map_df(
    .x = dplyr::vars(AGE, AAGEGR1, SEX, ETHNIC, BLBMI),
    .f = \(x) custom_summary(df = data, group_var = TRTA, sum_var = !!x)
  ))()
```

We can now start to expose our tibble with the summary of adsl variables
to **gt** using [`gt()`](https://gt.rstudio.com/reference/gt.md). Values
should be grouped by category, with labels as rownames. In addition, we
can give our table a nice title and subtitle.

``` r
rx_adsl_tbl <-
  adsl_summary |>
  gt(
    rowname_col = "label",
    groupname_col = "category"
  ) |>
  tab_header(
    title = "x.x: Demographic Characteristics",
    subtitle = "x.x.x: Demographic Characteristics - ITT Analysis Set"
  )

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |             |            |            |           |             |            |             |            |             |            |
|-------------------------------------------------------|-------------|------------|------------|-----------|-------------|------------|-------------|------------|-------------|------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |             |            |            |           |             |            |             |            |             |            |
|                                                       | val_Placebo | val_Drug 1 | sd_Placebo | sd_Drug 1 | min_Placebo | min_Drug 1 | max_Placebo | max_Drug 1 | pct_Placebo | pct_Drug 1 |
| Age (Years)                                           |             |            |            |           |             |            |             |            |             |            |
| n                                                     | 90.00000    | 90.00000   | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Mean (SD)                                             | 41.16667    | 39.17778   | 6.137470   | 5.620144  | NA          | NA         | NA          | NA         | NA          | NA         |
| Median                                                | 41.00000    | 38.50000   | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Min - Max                                             | NA          | NA         | NA         | NA        | 27.00000    | 29.00000   | 56.00000    | 55.00000   | NA          | NA         |
| Age Group, n (%)                                      |             |            |            |           |             |            |             |            |             |            |
| \<40                                                  | 36.00000    | 49.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.40000000  | 0.54444444 |
| \>=40                                                 | 54.00000    | 41.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.60000000  | 0.45555556 |
| Sex, n (%)                                            |             |            |            |           |             |            |             |            |             |            |
| Male                                                  | 59.00000    | 57.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.65555556  | 0.63333333 |
| Female                                                | 25.00000    | 32.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.27777778  | 0.35555556 |
| Undifferentiated                                      | 6.00000     | 1.00000    | NA         | NA        | NA          | NA         | NA          | NA         | 0.06666667  | 0.01111111 |
| Ethnicity, n (%)                                      |             |            |            |           |             |            |             |            |             |            |
| Hispanic or Latino                                    | 38.00000    | 29.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.42222222  | 0.32222222 |
| Not Hispanic or Latino                                | 46.00000    | 50.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.51111111  | 0.55555556 |
| Missing                                               | 6.00000     | 11.00000   | NA         | NA        | NA          | NA         | NA          | NA         | 0.06666667  | 0.12222222 |
| Body Mass Index (kg/m2)                               |             |            |            |           |             |            |             |            |             |            |
| n                                                     | 90.00000    | 90.00000   | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Mean (SD)                                             | 26.17161    | 27.16897   | 4.884631   | 4.973972  | NA          | NA         | NA          | NA         | NA          | NA         |
| Median                                                | 26.04285    | 26.89705   | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Min - Max                                             | NA          | NA         | NA         | NA        | 18.08861    | 18.02748   | 34.48886    | 34.80553   | NA          | NA         |

As a first step, let’s try to format the columns, formatting counts,
min, max and medians with
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
percentages with
[`fmt_percent()`](https://gt.rstudio.com/reference/fmt_percent.md), and
mean and sd values with
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md) using
`1` and `2` decimals, respectively. We are intentionally keeping the
`NA` values for now, as these will be needed in the
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md) pattern
in the next step.

``` r
rx_adsl_tbl <-
  rx_adsl_tbl |>
  fmt_integer(
    columns = starts_with(c("val_", "min_", "max_")),
    rows = label %in% c("n", "Median", "Min - Max")
  ) |>
  fmt_percent(
    columns = starts_with("pct_"),
    decimals = 1
  ) |>
  fmt_number(
    columns = starts_with("val_"),
    rows = label == "Mean (SD)",
    decimals = 1
  ) |>
  fmt_number(
    columns = starts_with("sd_"),
    rows = label == "Mean (SD)",
    decimals = 2
  )

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |             |            |            |           |             |            |             |            |             |            |
|-------------------------------------------------------|-------------|------------|------------|-----------|-------------|------------|-------------|------------|-------------|------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |             |            |            |           |             |            |             |            |             |            |
|                                                       | val_Placebo | val_Drug 1 | sd_Placebo | sd_Drug 1 | min_Placebo | min_Drug 1 | max_Placebo | max_Drug 1 | pct_Placebo | pct_Drug 1 |
| Age (Years)                                           |             |            |            |           |             |            |             |            |             |            |
| n                                                     | 90          | 90         | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Mean (SD)                                             | 41.2        | 39.2       | 6.14       | 5.62      | NA          | NA         | NA          | NA         | NA          | NA         |
| Median                                                | 41          | 38         | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Min - Max                                             | NA          | NA         | NA         | NA        | 27          | 29         | 56          | 55         | NA          | NA         |
| Age Group, n (%)                                      |             |            |            |           |             |            |             |            |             |            |
| \<40                                                  | 36          | 49         | NA         | NA        | NA          | NA         | NA          | NA         | 40.0%       | 54.4%      |
| \>=40                                                 | 54          | 41         | NA         | NA        | NA          | NA         | NA          | NA         | 60.0%       | 45.6%      |
| Sex, n (%)                                            |             |            |            |           |             |            |             |            |             |            |
| Male                                                  | 59          | 57         | NA         | NA        | NA          | NA         | NA          | NA         | 65.6%       | 63.3%      |
| Female                                                | 25          | 32         | NA         | NA        | NA          | NA         | NA          | NA         | 27.8%       | 35.6%      |
| Undifferentiated                                      | 6           | 1          | NA         | NA        | NA          | NA         | NA          | NA         | 6.7%        | 1.1%       |
| Ethnicity, n (%)                                      |             |            |            |           |             |            |             |            |             |            |
| Hispanic or Latino                                    | 38          | 29         | NA         | NA        | NA          | NA         | NA          | NA         | 42.2%       | 32.2%      |
| Not Hispanic or Latino                                | 46          | 50         | NA         | NA        | NA          | NA         | NA          | NA         | 51.1%       | 55.6%      |
| Missing                                               | 6           | 11         | NA         | NA        | NA          | NA         | NA          | NA         | 6.7%        | 12.2%      |
| Body Mass Index (kg/m2)                               |             |            |            |           |             |            |             |            |             |            |
| n                                                     | 90          | 90         | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Mean (SD)                                             | 26.2        | 27.2       | 4.88       | 4.97      | NA          | NA         | NA          | NA         | NA          | NA         |
| Median                                                | 26          | 27         | NA         | NA        | NA          | NA         | NA          | NA         | NA          | NA         |
| Min - Max                                             | NA          | NA         | NA         | NA        | 18          | 18         | 34          | 35         | NA          | NA         |

This looks way better but our table still has a rather wide style. To
collapse the columns appropriately, we will use
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md),
combining mean and SD, min and max, as well as n and percentages,
respectively. We will use the `pattern` argument to specify our custom
merging pattern.

``` r
rx_adsl_tbl <-
  rx_adsl_tbl |>
  cols_merge(
    columns = c("val_Placebo", "pct_Placebo", "sd_Placebo", "min_Placebo", "max_Placebo"),
    pattern = "<<{1}>><< ({2})>><< ({3})>><<{4} - {5}>>"
  ) |>
  cols_merge(
    columns = c("val_Drug 1", "pct_Drug 1", "sd_Drug 1", "min_Drug 1", "max_Drug 1"),
    pattern = "<<{1}>><< ({2})>><< ({3})>><<{4} - {5}>>"
  )

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |             |             |
|-------------------------------------------------------|-------------|-------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |             |             |
|                                                       | val_Placebo | val_Drug 1  |
| Age (Years)                                           |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 41.2 (6.14) | 39.2 (5.62) |
| Median                                                | 41          | 38          |
| Min - Max                                             | 27 - 56     | 29 - 55     |
| Age Group, n (%)                                      |             |             |
| \<40                                                  | 36 (40.0%)  | 49 (54.4%)  |
| \>=40                                                 | 54 (60.0%)  | 41 (45.6%)  |
| Sex, n (%)                                            |             |             |
| Male                                                  | 59 (65.6%)  | 57 (63.3%)  |
| Female                                                | 25 (27.8%)  | 32 (35.6%)  |
| Undifferentiated                                      | 6 (6.7%)    | 1 (1.1%)    |
| Ethnicity, n (%)                                      |             |             |
| Hispanic or Latino                                    | 38 (42.2%)  | 29 (32.2%)  |
| Not Hispanic or Latino                                | 46 (51.1%)  | 50 (55.6%)  |
| Missing                                               | 6 (6.7%)    | 11 (12.2%)  |
| Body Mass Index (kg/m2)                               |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 26.2 (4.88) | 27.2 (4.97) |
| Median                                                | 26          | 27          |
| Min - Max                                             | 18 - 34     | 18 - 35     |

Now that looks more like a demographic table. But let’s take a step back
and understand the merging pattern.
[`{ }`](https://rdrr.io/r/base/Paren.html) are used to arrange the
single column values in a row-wise fashion. The number in curly braces
corresponds to the order specified in the `columns =` argument. We use
`<< >>` to surround spans of text that will be omitted if any of the
values within contain missing values. Our first column in the call to
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md)
contains values for n’s, means and medians and is printed if the values
are not missing (meaning for the cells for numeric and categorical n’s,
means and medians but not for min and max). The SD and percentages for
categorical grouping variables are then appended to the cells for mean
and categorical n’s, because these are the only rows that contain
non-missing values. All of the previous aspects are ignored for the min
and max row, as n’s, percentages, SD’s and medians are missing. Here,
only min and max are arranged.

We can now start to look in to style features. Let us indent the values
in the stub using
[`tab_stub_indent()`](https://gt.rstudio.com/reference/tab_stub_indent.md)
and left-align the title with
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md).

``` r
rx_adsl_tbl <-
  rx_adsl_tbl |>
  tab_stub_indent(
    rows = everything(),
    indent = 5
  ) |>
  opt_align_table_header(align = "left")

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |             |             |
|-------------------------------------------------------|-------------|-------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |             |             |
|                                                       | val_Placebo | val_Drug 1  |
| Age (Years)                                           |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 41.2 (6.14) | 39.2 (5.62) |
| Median                                                | 41          | 38          |
| Min - Max                                             | 27 - 56     | 29 - 55     |
| Age Group, n (%)                                      |             |             |
| \<40                                                  | 36 (40.0%)  | 49 (54.4%)  |
| \>=40                                                 | 54 (60.0%)  | 41 (45.6%)  |
| Sex, n (%)                                            |             |             |
| Male                                                  | 59 (65.6%)  | 57 (63.3%)  |
| Female                                                | 25 (27.8%)  | 32 (35.6%)  |
| Undifferentiated                                      | 6 (6.7%)    | 1 (1.1%)    |
| Ethnicity, n (%)                                      |             |             |
| Hispanic or Latino                                    | 38 (42.2%)  | 29 (32.2%)  |
| Not Hispanic or Latino                                | 46 (51.1%)  | 50 (55.6%)  |
| Missing                                               | 6 (6.7%)    | 11 (12.2%)  |
| Body Mass Index (kg/m2)                               |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 26.2 (4.88) | 27.2 (4.97) |
| Median                                                | 26          | 27          |
| Min - Max                                             | 18 - 34     | 18 - 35     |

Let’s now change the column width of our Placebo and Drug 1 columns and
align all values to the center, making use of
[`cols_width()`](https://gt.rstudio.com/reference/cols_width.md) and
[`cols_align()`](https://gt.rstudio.com/reference/cols_align.md).

``` r
rx_adsl_tbl <-
  rx_adsl_tbl |>
  cols_width(
    starts_with("val_") ~ px(200),
    1 ~ px(250)
  ) |>
  cols_align(
    align = "center",
    columns = starts_with("val_")
  )

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |             |             |
|-------------------------------------------------------|-------------|-------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |             |             |
|                                                       | val_Placebo | val_Drug 1  |
| Age (Years)                                           |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 41.2 (6.14) | 39.2 (5.62) |
| Median                                                | 41          | 38          |
| Min - Max                                             | 27 - 56     | 29 - 55     |
| Age Group, n (%)                                      |             |             |
| \<40                                                  | 36 (40.0%)  | 49 (54.4%)  |
| \>=40                                                 | 54 (60.0%)  | 41 (45.6%)  |
| Sex, n (%)                                            |             |             |
| Male                                                  | 59 (65.6%)  | 57 (63.3%)  |
| Female                                                | 25 (27.8%)  | 32 (35.6%)  |
| Undifferentiated                                      | 6 (6.7%)    | 1 (1.1%)    |
| Ethnicity, n (%)                                      |             |             |
| Hispanic or Latino                                    | 38 (42.2%)  | 29 (32.2%)  |
| Not Hispanic or Latino                                | 46 (51.1%)  | 50 (55.6%)  |
| Missing                                               | 6 (6.7%)    | 11 (12.2%)  |
| Body Mass Index (kg/m2)                               |             |             |
| n                                                     | 90          | 90          |
| Mean (SD)                                             | 26.2 (4.88) | 27.2 (4.97) |
| Median                                                | 26          | 27          |
| Min - Max                                             | 18 - 34     | 18 - 35     |

In a final step we can now take care of the column names and assign
something more meaningful. Out column header should be the name of the
study intervention together with the respective subject count. To make
use of
[`cols_label()`](https://gt.rstudio.com/reference/cols_label.md)’s
ability to handle lists, we summarize our new column labels in a named
list.

``` r
### Count subjects per arm and summarize values in a list
arm_n <-
  rx_adsl |>
  dplyr::filter(ITTFL == "Y") |>
  dplyr::group_by(TRTA) |>
  dplyr::summarize(
    lbl = sprintf("%s N=%i (100%%)", unique(TRTA), dplyr::n()),
    .groups = "drop"
  ) |>
  dplyr::arrange(TRTA)

collbl_list <- as.list(arm_n$lbl)
names(collbl_list) <- paste0("val_", arm_n$TRTA)

rx_adsl_tbl <-
  rx_adsl_tbl |>
  cols_label(.list = collbl_list)

rx_adsl_tbl
```

| x.x: Demographic Characteristics                      |                     |                    |
|-------------------------------------------------------|---------------------|--------------------|
| x.x.x: Demographic Characteristics - ITT Analysis Set |                     |                    |
|                                                       | Placebo N=90 (100%) | Drug 1 N=90 (100%) |
| Age (Years)                                           |                     |                    |
| n                                                     | 90                  | 90                 |
| Mean (SD)                                             | 41.2 (6.14)         | 39.2 (5.62)        |
| Median                                                | 41                  | 38                 |
| Min - Max                                             | 27 - 56             | 29 - 55            |
| Age Group, n (%)                                      |                     |                    |
| \<40                                                  | 36 (40.0%)          | 49 (54.4%)         |
| \>=40                                                 | 54 (60.0%)          | 41 (45.6%)         |
| Sex, n (%)                                            |                     |                    |
| Male                                                  | 59 (65.6%)          | 57 (63.3%)         |
| Female                                                | 25 (27.8%)          | 32 (35.6%)         |
| Undifferentiated                                      | 6 (6.7%)            | 1 (1.1%)           |
| Ethnicity, n (%)                                      |                     |                    |
| Hispanic or Latino                                    | 38 (42.2%)          | 29 (32.2%)         |
| Not Hispanic or Latino                                | 46 (51.1%)          | 50 (55.6%)         |
| Missing                                               | 6 (6.7%)            | 11 (12.2%)         |
| Body Mass Index (kg/m2)                               |                     |                    |
| n                                                     | 90                  | 90                 |
| Mean (SD)                                             | 26.2 (4.88)         | 27.2 (4.97)        |
| Median                                                | 26                  | 27                 |
| Min - Max                                             | 18 - 34             | 18 - 35            |

### Response / Event Rate Analysis Tables

In another table, we can summarize the number of subjects with an event
per intervention in the subgroup defined by the age groups. Within each
intervention group we are counting the number and percentage of
participants with an event (`EVNTFL == "Y"`) as well as the total number
of participants. The number of participants with an event divided by the
number without an event are the odds of experiencing the event per study
intervention. The odds ratio is then computed as the odds under Drug 1
divided by the odds under Placebo.

The below code performs the calculation outlined above within the
subgroup defined by `AAGEGR1`, where confidence intervals around the
event rates are computed using the Clopper Pearson method.

``` r
rx_responders <-
  rx_adsl |>
  dplyr::filter(ITTFL == "Y") |>
  dplyr::group_by(TRTA, AAGEGR1) |>
  dplyr::summarize(
    n_resp = sum(EVNTFL == "Y"),
    n_total = dplyr::n(),
    pct = 100 * sum(EVNTFL == "Y") / dplyr::n(),
    ci_up = 100 * (
      1 + (dplyr::n() - sum(EVNTFL == "Y")) / (
        (sum(EVNTFL == "Y") + 1) * qf(
          0.975,
          2 * (sum(EVNTFL == "Y") + 1),
          2 * (dplyr::n() - sum(EVNTFL == "Y"))
        )
      )
    )^(-1),
    ci_low = ifelse(
      sum(EVNTFL == "Y") == 0,
      0,
      100 * (
        1 + (dplyr::n() - sum(EVNTFL == "Y") + 1) /
          (sum(EVNTFL == "Y") * qf(
            0.025,
            2 * sum(EVNTFL == "Y"),
            2 * (dplyr::n() - sum(EVNTFL == "Y") + 1)
          )
          )
      )^(-1)
    ),
    odds = sum(EVNTFL == "Y") / (dplyr::n() - sum(EVNTFL == "Y")),
    .groups = "drop"
  ) |>
  tidyr::pivot_wider(
    id_cols = AAGEGR1,
    names_from = TRTA,
    values_from = c(n_resp, n_total, pct, ci_up, ci_low, odds)
  ) |>
  dplyr::mutate(
    or = ifelse(
      odds_Placebo == 0,
      NA_real_,
      !!sym("odds_Drug 1") / odds_Placebo
    ),
    or_ci_low = exp(
      log(or) - qnorm(0.975) * sqrt(
        1 / n_resp_Placebo +
          1 / !!sym("n_resp_Drug 1") +
            1 / (n_total_Placebo - n_resp_Placebo) +
            1 / (!!sym("n_total_Drug 1") - !!sym("n_resp_Drug 1"))
      )
    ),
    or_ci_up = exp(
      log(or) + qnorm(0.975) * sqrt(
        1 / n_resp_Placebo +
          1 / !!sym("n_resp_Drug 1") +
            1 / (n_total_Placebo - n_resp_Placebo) +
            1 / (!!sym("n_total_Drug 1") - !!sym("n_resp_Drug 1"))
      )
    )
  ) |>
  dplyr::select(-tidyselect::starts_with("odds_"))
```

Let’s first create a basic **gt** table with a left-aligned table title
and subtitle. Here we are using
[`tab_header()`](https://gt.rstudio.com/reference/tab_header.md) and
[`opt_align_table_header()`](https://gt.rstudio.com/reference/opt_align_table_header.md)
again.

``` r
rx_resp_tbl <- rx_responders |>
  gt() |>
  tab_header(
    title = "x.x: Efficacy Data",
    subtitle = "x.x.x: Occurence of Event per Subgroup - {gt} Analysis Set"
  ) |>
  opt_align_table_header(align = "left")

rx_resp_tbl
```

| x.x: Efficacy Data                                         |                |               |                 |                |             |            |               |              |                |               |          |           |          |
|------------------------------------------------------------|----------------|---------------|-----------------|----------------|-------------|------------|---------------|--------------|----------------|---------------|----------|-----------|----------|
| x.x.x: Occurence of Event per Subgroup - {gt} Analysis Set |                |               |                 |                |             |            |               |              |                |               |          |           |          |
| Age Group                                                  | n_resp_Placebo | n_resp_Drug 1 | n_total_Placebo | n_total_Drug 1 | pct_Placebo | pct_Drug 1 | ci_up_Placebo | ci_up_Drug 1 | ci_low_Placebo | ci_low_Drug 1 | or       | or_ci_low | or_ci_up |
| \<40                                                       | 17             | 33            | 36              | 49             | 47.22222    | 67.34694   | 64.51362      | 80.05147     | 30.40506       | 52.45993      | 2.305147 | 0.950602  | 5.589829 |
| \>=40                                                      | 23             | 29            | 54              | 41             | 42.59259    | 70.73171   | 56.79174      | 83.87014     | 29.23473       | 54.46260      | 3.257246 | 1.375207  | 7.714953 |

Next, we are formatting the columns for counts to integers with
[`fmt_integer()`](https://gt.rstudio.com/reference/fmt_integer.md),
percentages and CI’s around percentages as numbers with one decimal and
odds ratio and the CI around the odds ratio as numbers with two
decimals, in both cases using
[`fmt_number()`](https://gt.rstudio.com/reference/fmt_number.md).

``` r
rx_resp_tbl <-
  rx_resp_tbl |>
  fmt_integer(columns = starts_with("n_")) |>
  fmt_number(columns = starts_with(c("pct_", "ci_")), decimals = 1) |>
  fmt_number(columns = starts_with("or"), decimals = 2)

rx_resp_tbl
```

| x.x: Efficacy Data                                         |                |               |                 |                |             |            |               |              |                |               |      |           |          |
|------------------------------------------------------------|----------------|---------------|-----------------|----------------|-------------|------------|---------------|--------------|----------------|---------------|------|-----------|----------|
| x.x.x: Occurence of Event per Subgroup - {gt} Analysis Set |                |               |                 |                |             |            |               |              |                |               |      |           |          |
| Age Group                                                  | n_resp_Placebo | n_resp_Drug 1 | n_total_Placebo | n_total_Drug 1 | pct_Placebo | pct_Drug 1 | ci_up_Placebo | ci_up_Drug 1 | ci_low_Placebo | ci_low_Drug 1 | or   | or_ci_low | or_ci_up |
| \<40                                                       | 17             | 33            | 36              | 49             | 47.2        | 67.3       | 64.5          | 80.1         | 30.4           | 52.5          | 2.31 | 0.95      | 5.59     |
| \>=40                                                      | 23             | 29            | 54              | 41             | 42.6        | 70.7       | 56.8          | 83.9         | 29.2           | 54.5          | 3.26 | 1.38      | 7.71     |

We can now merge the columns for participants with events, total number
of participants and percentage of participants with events, as well as
the 95% CI’s around the event rate using
[`cols_merge()`](https://gt.rstudio.com/reference/cols_merge.md). To
indicate the intervention group we are adding tab spanners with
[`tab_spanner()`](https://gt.rstudio.com/reference/tab_spanner.md).

``` r
rx_resp_tbl <-
  rx_resp_tbl |>
  cols_merge(
    columns = c("n_resp_Placebo", "n_total_Placebo", "pct_Placebo"),
    pattern = "{1}/{2} ({3})"
  ) |>
  cols_merge(
    columns = c("n_resp_Drug 1", "n_total_Drug 1", "pct_Drug 1"),
    pattern = "{1}/{2} ({3})"
  ) |>
  cols_merge(
    columns = c("ci_low_Placebo", "ci_up_Placebo"),
    pattern = "[{1}, {2}]"
  ) |>
  cols_merge(
    columns = c("ci_low_Drug 1", "ci_up_Drug 1"),
    pattern = "[{1}, {2}]"
  ) |>
  cols_merge(
    columns = c("or_ci_low", "or_ci_up"),
    pattern = "[{1}, {2}]"
  ) |>
  tab_spanner(
    label = "Drug 1",
    columns = c("n_resp_Drug 1", "ci_low_Drug 1")
  ) |>
  tab_spanner(
    label = "Placebo",
    columns = c("n_resp_Placebo", "ci_low_Placebo")
  )

rx_resp_tbl
```

[TABLE]

The table is looking way better now. Let’s now group the two categories
and highlight the fact that these are actually age subgroups. We are
using
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
to manually add a row group label *Age*.

``` r
rx_resp_tbl <-
  rx_resp_tbl |>
  tab_row_group(
    label = "Age",
    rows = everything()
  )

rx_resp_tbl
```

[TABLE]

Next, we’ll take care of the column labels. As we now have the
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
label in place, we no longer need the label for the first column and can
assign an empty string. Also, because of the two tab spanners, we can
assign equal column labels for event rates and 95% CI’s in both
intervention groups.

Using [`cols_width()`](https://gt.rstudio.com/reference/cols_width.md)
and [`cols_align()`](https://gt.rstudio.com/reference/cols_align.md) we
can apply a more convenient column width and left-align the first
column.

``` r
rx_resp_tbl <-
  rx_resp_tbl |>
  cols_align(
    align = "center",
    columns = starts_with(c("n_", "ci", "or"))
  ) |>
  cols_label(
    .list = c(
      "AAGEGR1" = "",
      "n_resp_Placebo" = "Event Rate (%)",
      "ci_low_Placebo" = "[95% CI]",
      "n_resp_Drug 1" = "Event Rate (%)",
      "ci_low_Drug 1" = "[95% CI]",
      "or" = "Odds ratio",
      "or_ci_low" = "[95% CI]"
    )
  ) |>
  cols_width(
    1 ~ px(80),
    everything() ~ px(120)
  ) |>
  cols_align(align = "left", columns = 1)

rx_resp_tbl
```

[TABLE]

Finally, we make use of
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) and
can add a footnote to the columns with the 95% CI’s around event rates,
indicating that these were derived from the Clopper-Pearson method. To
change the default symbol choice of
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md)
from numbers to letters, we add `tab_options(footnote.marks = letters)`.

``` r
rx_resp_tbl <-
  rx_resp_tbl |>
  tab_footnote(
    footnote = "Event rate 95% exact confidence interval uses the Clopper−Pearson method.",
    locations = cells_column_labels(
      columns = c("ci_low_Placebo", "ci_low_Drug 1")
    ),
    placement = "right"
  ) |>
  tab_options(footnotes.marks = letters)

rx_resp_tbl
```

[TABLE]

### Protocol Deviation Table

For the summary table for protocol deviations (PDs) we will use a second
CDISC-flavored dataset, namely `rx_addv`. This dataset contains a
summary row, indicating whether a subject in the ITT population in
`rx_adsl` experienced at least one major PD or not. In addition to the
subject level summary, individual PDs are summarized.

``` r
rx_addv |> str()
#> tibble [291 × 20] (S3: tbl_df/tbl/data.frame)
#>  $ STUDYID : chr [1:291] "GT01" "GT01" "GT01" "GT01" ...
#>   ..- attr(*, "label")= chr "Unique Study Identifier"
#>  $ STUDYIDN: chr [1:291] "4001" "4001" "4001" "4001" ...
#>   ..- attr(*, "label")= chr "Unique Study Identifier (N)"
#>  $ USUBJID : chr [1:291] "GT1001" "GT1002" "GT1002" "GT1003" ...
#>   ..- attr(*, "label")= chr "Unique Subject Identifier"
#>  $ TRTA    : Factor w/ 2 levels "Placebo","Drug 1": 1 1 1 1 1 1 1 1 1 1 ...
#>   ..- attr(*, "label")= chr "Actual Treatment"
#>  $ TRTAN   : num [1:291] 1 1 1 1 1 1 1 1 1 1 ...
#>   ..- attr(*, "label")= chr "Actual Treatment (N)"
#>  $ ITTFL   : chr [1:291] "Y" "Y" "Y" "Y" ...
#>   ..- attr(*, "label")= chr "ITT Population Flag"
#>  $ AGE     : int [1:291] 41 39 39 38 38 38 45 45 35 35 ...
#>   ..- attr(*, "label")= chr "Age"
#>   ..- attr(*, "units")= chr "Years"
#>  $ AAGEGR1 : Factor w/ 2 levels "<40",">=40": 2 1 1 1 1 1 2 2 1 1 ...
#>   ..- attr(*, "label")= chr "Age Group"
#>  $ SEX     : Factor w/ 3 levels "Male","Female",..: 1 2 2 1 1 1 1 1 2 2 ...
#>   ..- attr(*, "label")= chr "Sex"
#>  $ ETHNIC  : Factor w/ 3 levels "Hispanic or Latino",..: 2 2 2 2 2 2 2 2 1 1 ...
#>   ..- attr(*, "label")= chr "Ethnicity"
#>  $ BLBMI   : num [1:291] 33.4 30.5 30.5 22.9 22.9 ...
#>   ..- attr(*, "label")= chr "Body Mass Index"
#>   ..- attr(*, "units")= chr "kg/m2"
#>  $ DVTERM  : chr [1:291] "" "" "Lab values not taken at month 3" "" ...
#>   ..- attr(*, "label")= chr "Protocol Deviation Term"
#>  $ PARAMCD : Factor w/ 6 levels "PDANYM","PDEV01",..: 1 1 3 1 2 3 1 2 1 1 ...
#>   ..- attr(*, "label")= chr "Parameter Code"
#>  $ PARAM   : Factor w/ 6 levels "At least one major Protocol Deviation",..: 1 1 3 1 2 3 1 2 1 1 ...
#>   ..- attr(*, "label")= chr "Parameter"
#>  $ PARCAT1 : chr [1:291] "OVERALL" "OVERALL" "PROTOCOL DEVIATION" "OVERALL" ...
#>   ..- attr(*, "label")= chr "Parameter Category 1"
#>  $ DVCAT   : chr [1:291] "" "" "Major" "" ...
#>   ..- attr(*, "label")= chr "Protocol Deviation Category"
#>  $ ACAT1   : chr [1:291] "" "" "Study Procedures Criteria Deviations" "" ...
#>   ..- attr(*, "label")= chr "Analysis Category 1"
#>  $ AVAL    : num [1:291] 0 1 1 0 1 1 1 1 0 1 ...
#>   ..- attr(*, "label")= chr "Analysis Value"
#>  $ CRIT1   : chr [1:291] "COVID-19 Related" "COVID-19 Related" "COVID-19 Related" "COVID-19 Related" ...
#>   ..- attr(*, "label")= chr "Analysis Criterion 1"
#>  $ CRIT1FL : chr [1:291] "N" "N" "N" "N" ...
#>   ..- attr(*, "label")= chr "Criterion 1 Evaluation Flag"
```

We would now like to build a table to summarize overall and counts of
individual PDs by treatment arm and furthermore indicate, whether the PD
was related to COVID-19 or not. In order to build this table, we first
need to apply some data wrangling with functions from **dplyr** and
**tidyr**.

``` r
addv_sum <-
  rx_addv |>
  dplyr::group_by(TRTA) |>
  dplyr::mutate(
    NTOT = n_distinct(USUBJID),
    .groups = "drop"
  ) |>
  dplyr::group_by(TRTA, PARCAT1, PARAM, CRIT1FL) |>
  dplyr::summarize(
    n = sum(AVAL, na.rm = TRUE),
    pct = 100 * sum(AVAL, na.rm = TRUE) / mean(NTOT),
    .groups = "drop"
  ) |>
  tidyr::pivot_wider(
    id_cols = c(PARCAT1, PARAM),
    names_from = c(TRTA, CRIT1FL),
    values_from = c(n, pct)
  ) |>
  dplyr::mutate(across(where(is.numeric), ~ ifelse(is.na(.), 0, .))) |>
  dplyr::add_row(PARAM = "Subjects with at least:", .before = 1)

addv_sum
#> # A tibble: 7 × 10
#>   PARCAT1  PARAM n_Placebo_N n_Placebo_Y `n_Drug 1_N` `n_Drug 1_Y` pct_Placebo_N
#>   <chr>    <chr>       <dbl>       <dbl>        <dbl>        <dbl>         <dbl>
#> 1 NA       Subj…          NA          NA           NA           NA         NA   
#> 2 OVERALL  At l…          24          15           23            5         26.7 
#> 3 PROTOCO… GTQ …           7           0           12            0          7.78
#> 4 PROTOCO… Lab …          12           3            7            0         13.3 
#> 5 PROTOCO… GTQ …           7           2            7            1          7.78
#> 6 PROTOCO… Mont…           9           4            3            1         10   
#> 7 PROTOCO… Mont…           9           8            9            3         10   
#> # ℹ 3 more variables: pct_Placebo_Y <dbl>, `pct_Drug 1_N` <dbl>,
#> #   `pct_Drug 1_Y` <dbl>
```

This is the dataset that serves as a starting point for `gt`. We will
start by exposing the dataset to `gt` and add our usual left-aligned
headers.

``` r
addv_tbl <-
  addv_sum |>
  gt(rowname_col = "PARAM") |>
  tab_header(
    title = "xx.x: Demographic and Baseline Data",
    subtitle = "xx.x.x: Major Protocol Deviations and Relationship to COVID-19 - ITT Set"
  ) |>
  opt_align_table_header(align = "left")

addv_tbl
```

| xx.x: Demographic and Baseline Data                                      |                      |             |             |            |            |               |               |              |              |
|--------------------------------------------------------------------------|----------------------|-------------|-------------|------------|------------|---------------|---------------|--------------|--------------|
| xx.x.x: Major Protocol Deviations and Relationship to COVID-19 - ITT Set |                      |             |             |            |            |               |               |              |              |
|                                                                          | Parameter Category 1 | n_Placebo_N | n_Placebo_Y | n_Drug 1_N | n_Drug 1_Y | pct_Placebo_N | pct_Placebo_Y | pct_Drug 1_N | pct_Drug 1_Y |
| Subjects with at least:                                                  | NA                   | NA          | NA          | NA         | NA         | NA            | NA            | NA           | NA           |
| At least one major Protocol Deviation                                    | OVERALL              | 24          | 15          | 23         | 5          | 26.666667     | 16.666667     | 25.555556    | 5.555556     |
| GTQ not completed month 3.                                               | PROTOCOL DEVIATION   | 7           | 0           | 12         | 0          | 7.777778      | 0.000000      | 13.333333    | 0.000000     |
| Lab values not taken month 3.                                            | PROTOCOL DEVIATION   | 12          | 3           | 7          | 0          | 13.333333     | 3.333333      | 7.777778     | 0.000000     |
| GTQ not completed month 6.                                               | PROTOCOL DEVIATION   | 7           | 2           | 7          | 1          | 7.777778      | 2.222222      | 7.777778     | 1.111111     |
| Month 3 Visit not done.                                                  | PROTOCOL DEVIATION   | 9           | 4           | 3          | 1          | 10.000000     | 4.444444      | 3.333333     | 1.111111     |
| Month 6 Visit not done.                                                  | PROTOCOL DEVIATION   | 9           | 8           | 9          | 3          | 10.000000     | 8.888889      | 10.000000    | 3.333333     |

In a next step, we would like to create a summary row for all individual
PDs to get the overall number of individual PDs, as well as the
corresponding percentage. For this, we will first create a row group for
individual PDs using
[`tab_row_group()`](https://gt.rstudio.com/reference/tab_row_group.md)
applied to all rows where `PARCAT1` is equal to `PROTOCOL DEVIATIONS`.
Then, we’ll arrange the order of the row groups to list individual PDs
after the overall summary. Finally, we can create a summary row, using
[`summary_rows()`](https://gt.rstudio.com/reference/summary_rows.md) and
`gt` sums up all columns with n’s and percentages for us (other summary
functions are possible, but `fn = 'sum'` does the job for us).

``` r
addv_tbl <-
  addv_tbl |>
  tab_row_group(
    label = " ",
    rows = PARCAT1 == "PROTOCOL DEVIATION"
  ) |>
  row_group_order(groups = c(NA, " ")) |>
  summary_rows(
    groups = " ",
    columns = where(is.numeric),
    fns = list(label = "Study Procedure Deviations", fn = "sum"),
    side = "top"
  )

addv_tbl
```

| xx.x: Demographic and Baseline Data                                      |                      |             |             |            |            |               |               |              |              |
|--------------------------------------------------------------------------|----------------------|-------------|-------------|------------|------------|---------------|---------------|--------------|--------------|
| xx.x.x: Major Protocol Deviations and Relationship to COVID-19 - ITT Set |                      |             |             |            |            |               |               |              |              |
|                                                                          | Parameter Category 1 | n_Placebo_N | n_Placebo_Y | n_Drug 1_N | n_Drug 1_Y | pct_Placebo_N | pct_Placebo_Y | pct_Drug 1_N | pct_Drug 1_Y |
|                                                                          |                      |             |             |            |            |               |               |              |              |
| Subjects with at least:                                                  | NA                   | NA          | NA          | NA         | NA         | NA            | NA            | NA           | NA           |
| At least one major Protocol Deviation                                    | OVERALL              | 24          | 15          | 23         | 5          | 26.666667     | 16.666667     | 25.555556    | 5.555556     |
|                                                                          |                      |             |             |            |            |               |               |              |              |
| Study Procedure Deviations                                               | —                    | 44          | 17          | 38         | 5          | 48.88889      | 18.88889      | 42.22222     | 5.555556     |
| GTQ not completed month 3.                                               | PROTOCOL DEVIATION   | 7           | 0           | 12         | 0          | 7.777778      | 0.000000      | 13.333333    | 0.000000     |
| Lab values not taken month 3.                                            | PROTOCOL DEVIATION   | 12          | 3           | 7          | 0          | 13.333333     | 3.333333      | 7.777778     | 0.000000     |
| GTQ not completed month 6.                                               | PROTOCOL DEVIATION   | 7           | 2           | 7          | 1          | 7.777778      | 2.222222      | 7.777778     | 1.111111     |
| Month 3 Visit not done.                                                  | PROTOCOL DEVIATION   | 9           | 4           | 3          | 1          | 10.000000     | 4.444444      | 3.333333     | 1.111111     |
| Month 6 Visit not done.                                                  | PROTOCOL DEVIATION   | 9           | 8           | 9          | 3          | 10.000000     | 8.888889      | 10.000000    | 3.333333     |

We only kept the column `PARCAT1` to facilitate the generation of the
row group. We can hide this column now using
[`cols_hide()`](https://gt.rstudio.com/reference/cols_hide.md):

``` r
addv_tbl <-
  addv_tbl |>
  cols_hide(columns = "PARCAT1")

addv_tbl
```

| xx.x: Demographic and Baseline Data                                      |             |             |            |            |               |               |              |              |
|--------------------------------------------------------------------------|-------------|-------------|------------|------------|---------------|---------------|--------------|--------------|
| xx.x.x: Major Protocol Deviations and Relationship to COVID-19 - ITT Set |             |             |            |            |               |               |              |              |
|                                                                          | n_Placebo_N | n_Placebo_Y | n_Drug 1_N | n_Drug 1_Y | pct_Placebo_N | pct_Placebo_Y | pct_Drug 1_N | pct_Drug 1_Y |
|                                                                          |             |             |            |            |               |               |              |              |
| Subjects with at least:                                                  | NA          | NA          | NA         | NA         | NA            | NA            | NA           | NA           |
| At least one major Protocol Deviation                                    | 24          | 15          | 23         | 5          | 26.666667     | 16.666667     | 25.555556    | 5.555556     |
|                                                                          |             |             |            |            |               |               |              |              |
| Study Procedure Deviations                                               | 44          | 17          | 38         | 5          | 48.88889      | 18.88889      | 42.22222     | 5.555556     |
| GTQ not completed month 3.                                               | 7           | 0           | 12         | 0          | 7.777778      | 0.000000      | 13.333333    | 0.000000     |
| Lab values not taken month 3.                                            | 12          | 3           | 7          | 0          | 13.333333     | 3.333333      | 7.777778     | 0.000000     |
| GTQ not completed month 6.                                               | 7           | 2           | 7          | 1          | 7.777778      | 2.222222      | 7.777778     | 1.111111     |
| Month 3 Visit not done.                                                  | 9           | 4           | 3          | 1          | 10.000000     | 4.444444      | 3.333333     | 1.111111     |
| Month 6 Visit not done.                                                  | 9           | 8           | 9          | 3          | 10.000000     | 8.888889      | 10.000000    | 3.333333     |

Now that the table has roughly the right shape, we can start to format
all numeric columns and merge columns for n’s and percentages by
intervention group and COVID-19 relationship flag.

``` r
addv_tbl <-
  addv_tbl |>
  sub_missing(
    rows = 1,
    missing_text = ""
  ) |>
  fmt_number(
    columns = starts_with("pct"),
    decimals = 1
  ) |>
  cols_merge_n_pct(
    col_n = "n_Placebo_Y",
    col_pct = "pct_Placebo_Y"
  ) |>
  cols_merge_n_pct(
    col_n = "n_Placebo_N",
    col_pct = "pct_Placebo_N"
  ) |>
  cols_merge_n_pct(
    col_n = "n_Drug 1_Y",
    col_pct = "pct_Drug 1_Y"
  ) |>
  cols_merge_n_pct(
    col_n = "n_Drug 1_N",
    col_pct = "pct_Drug 1_N"
  )

addv_tbl
```

[TABLE]

This looks more like a PD table! We can now modify the column names and
create a cascade of column spanners.

``` r
addv_tbl <-
  addv_tbl |>
  tab_spanner(
    label = md("COVID-19 Related"),
    columns = c("n_Placebo_Y", "n_Placebo_N"),
    id = "cov_pla"
  ) |>
  tab_spanner(
    label = md("COVID-19 Related"),
    columns = c("n_Drug 1_Y", "n_Drug 1_N"),
    id = "cov_dru"
  ) |>
  tab_spanner(
    label = md("Placebo  \n  N=90 (100%)  \n   n (%)"),
    columns = c("n_Placebo_Y", "n_Placebo_N")
  ) |>
  tab_spanner(
    label = md("Drug 1  \n  N=90 (100%)  \n   n (%)"),
    columns = c("n_Drug 1_Y", "n_Drug 1_N")
  ) |>
  cols_label(
    .list = list(
      "n_Placebo_Y" = "Yes",
      "n_Placebo_N" = "No",
      "n_Drug 1_Y" = "Yes",
      "n_Drug 1_N" = "No"
    )
  ) |>
  tab_style(
    style = cell_text(align = "center"),
    locations = cells_column_spanners(spanners = everything())
  )

addv_tbl
```

[TABLE]

We can now add a footnote, indicating that subjects can have more than
one PD during the course of the study. The footnote is added with
[`tab_footnote()`](https://gt.rstudio.com/reference/tab_footnote.md) to
the row `At least one major Protocol Deviation`.

``` r
addv_tbl <-
  addv_tbl |>
  tab_footnote(
    footnote = "Subjects can have more than one Protocol Deviation throughout the study.",
    locations = cells_stub(rows = c("At least one major Protocol Deviation")),
    placement = "right"
  )

addv_tbl
```

[TABLE]

Finally, we can style the table, indenting the individual PDs under
`Study Procedure Deviations`, left-aligning the first column and
centering all other columns. Note that for the indentation, we can still
use the hidden column `PARCAT1` to identify individual PDs.

``` r
addv_tbl |>
  cols_align(
    align = "center",
    columns = 3:6
  ) |>
  cols_align(
    align = "left",
    columns = 1:2
  ) |>
  tab_stub_indent(
    rows = PARCAT1 == "PROTOCOL DEVIATION",
    indent = 5
  )
```

[TABLE]
